using System;
using System.Collections.Generic;

namespace RacingOpen
{
    public class StoryMode
    {
        public Team SelectedTeam { get; private set; }
        public bool IsCompleted { get; private set; }
        public bool IsAbandoned { get; private set; }
        public float Progress { get; private set; }
        public int CurrentSlideIndex { get; private set; }
        public List<StorySlide> CompletedSlides { get; } = new List<StorySlide>();
        
        private List<StorySlide> _storyPyramid;
        private int _currentTier = 0;
        private int _slidesInCurrentTier = 0;
        private StorySlide _currentSlide;

        public StoryMode(Team team)
        {
            SelectedTeam = team;
            InitializeStoryPyramid();
        }

        private void InitializeStoryPyramid()
        {
            // Build the pyramid structure for this team's story
            _storyPyramid = new List<StorySlide>();
            
            // Tier 1 (Base)
            _storyPyramid.Add(new StorySlide("Introduction", 1));
            _storyPyramid.Add(new StorySlide("First Race", 1));
            
            // Tier 2
            _storyPyramid.Add(new StorySlide("Team Conflict", 2));
            _storyPyramid.Add(new StorySlide("Technical Issues", 2));
            
            // Tier 3 (Final)
            _storyPyramid.Add(new StorySlide("Championship", 3));
            
            // More slides would be added based on actual story design
        }

        public void Play()
        {
            while (!IsCompleted && !IsAbandoned)
            {
                DisplayProgress();
                DisplayCurrentTierOptions();
                
                var choice = GetSlideChoice();
                if (choice == -1) // Abandon story
                {
                    AbandonStory();
                    return;
                }
                
                PlaySlide(choice);
                UpdateProgress();
                
                if (CheckForStoryCompletion())
                {
                    CompleteStory();
                    return;
                }
            }
        }

        private void DisplayProgress()
        {
            Console.Clear();
            Console.WriteLine($"Team: {SelectedTeam.Name}");
            Console.WriteLine($"Progress: {Progress * 100}%");
            Console.WriteLine($"Current Tier: {_currentTier}");
            Console.WriteLine(new string('=', (int)(20 * Progress))); // Simple progress bar
            Console.WriteLine();
        }

        private void DisplayCurrentTierOptions()
        {
            Console.WriteLine($"Current Tier {_currentTier} Options:");
            var availableSlides = _storyPyramid.FindAll(s => s.Tier == _currentTier && !s.IsCompleted);
            
            for (int i = 0; i < availableSlides.Count; i++)
            {
                Console.WriteLine($"{i + 1}. {availableSlides[i].Title}");
            }
            Console.WriteLine("0. Abandon Story");
        }

        private int GetSlideChoice()
        {
            var availableSlides = _storyPyramid.FindAll(s => s.Tier == _currentTier && !s.IsCompleted);
            int choice;
            
            while (true)
            {
                Console.Write("Select a story path: ");
                if (int.TryParse(Console.ReadLine(), out choice))
                {
                    if (choice >= 0 && choice <= availableSlides.Count)
                    {
                        return choice - 1; // Convert to 0-based index
                    }
                }
                Console.WriteLine("Invalid selection!");
            }
        }

        private void PlaySlide(int slideIndex)
        {
            var availableSlides = _storyPyramid.FindAll(s => s.Tier == _currentTier && !s.IsCompleted);
            _currentSlide = availableSlides[slideIndex];
            
            Console.Clear();
            Console.WriteLine($"=== {_currentSlide.Title} ===");
            Console.WriteLine("Playing story slide...");
            // Actual gameplay would happen here
            Console.WriteLine("Press any key when finished...");
            Console.ReadKey();
            
            _currentSlide.Complete();
            CompletedSlides.Add(_currentSlide);
            
            // Check if we've completed all slides in current tier
            if (_storyPyramid.FindAll(s => s.Tier == _currentTier).TrueForAll(s => s.IsCompleted))
            {
                _currentTier++;
            }
        }

        private void UpdateProgress()
        {
            int totalSlides = _storyPyramid.Count;
            int completedSlides = _storyPyramid.FindAll(s => s.IsCompleted).Count;
            Progress = (float)completedSlides / totalSlides;
        }

        private bool CheckForStoryCompletion()
        {
            // Check if all required slides are completed
            // This could be more complex based on your branching paths
            return _currentTier > 3 || _storyPyramid.TrueForAll(s => s.IsCompleted);
        }

        private void CompleteStory()
        {
            IsCompleted = true;
            Progress = 1.0f;
            Console.Clear();
            Console.WriteLine($"=== {SelectedTeam.Name} Story Completed ===");
            Console.WriteLine("You've earned:");
            Console.WriteLine("- Team Token (Unlocks Challenge Mode)");
            Console.WriteLine("- New Brand Team Unlocked");
            Console.WriteLine("- Additional Features");
            Console.WriteLine("Press any key to continue...");
            Console.ReadKey();
        }

        private void AbandonStory()
        {
            IsAbandoned = true;
            Console.Clear();
            Console.WriteLine($"You've abandoned {SelectedTeam.Name}'s story.");
            Console.WriteLine("All progress will be reset.");
            Console.WriteLine("Press any key to continue...");
            Console.ReadKey();
            
            // Reset progress
            foreach (var slide in _storyPyramid)
            {
                slide.Reset();
            }
            CompletedSlides.Clear();
            Progress = 0;
            _currentTier = 1;
        }
    }

    public class StorySlide
    {
        public string Title { get; }
        public int Tier { get; }
        public bool IsCompleted { get; private set; }
        public bool IsLocked { get; private set; }

        public StorySlide(string title, int tier)
        {
            Title = title;
            Tier = tier;
        }

        public void Complete()
        {
            IsCompleted = true;
        }

        public void Reset()
        {
            IsCompleted = false;
        }

        public void Lock()
        {
            IsLocked = true;
        }

        public void Unlock()
        {
            IsLocked = false;
        }
    }
}