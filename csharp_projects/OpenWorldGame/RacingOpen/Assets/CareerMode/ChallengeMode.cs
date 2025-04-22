using System;
using System.Collections.Generic;
using System.Linq;

namespace RacingOpen
{
    public class ChallengeMode
    {
        private GameProgress _progress;
        private List<ChallengeSeries> _availableSeries = new List<ChallengeSeries>();
        private PlayerTeam _playerTeam; // Reference to main team for progression tracking

        public ChallengeMode(GameProgress progress, PlayerTeam playerTeam)
        {
            _progress = progress;
            _playerTeam = playerTeam;
            LoadAvailableSeries();
        }

        public void Start()
        {
            while (true)
            {
                Console.Clear();
                DisplayChallengeDashboard();

                Console.WriteLine("\n1. Start Challenge Series");
                Console.WriteLine("2. View Character Progression");
                Console.WriteLine("3. View Team Progression");
                Console.WriteLine("4. Return to Career Menu");
                Console.Write("> ");

                var choice = Console.ReadLine();
                switch (choice)
                {
                    case "1":
                        SelectChallengeSeries();
                        break;
                    case "2":
                        ViewCharacterProgression();
                        break;
                    case "3":
                        ViewTeamProgression();
                        break;
                    case "4":
                        return;
                }
            }
        }

        private void LoadAvailableSeries()
        {
            _availableSeries = _progress.GetUnlockedChallengeSeries(_playerTeam);
        }

        #region Challenge Series
        private void SelectChallengeSeries()
        {
            while (true)
            {
                Console.Clear();
                Console.WriteLine("CHALLENGE SERIES");
                Console.WriteLine("Available Series:\n");

                int index = 1;
                foreach (var series in _availableSeries.OrderBy(s => s.RequiredTeamLevel))
                {
                    string status = series.IsUnlocked(_playerTeam) ? "" : $"[LOCKED - Team Lv. {series.RequiredTeamLevel}]";
                    Console.WriteLine($"{index++}. {series.Name} {status}");
                    Console.WriteLine($"   Characters: {series.AvailableCharacters.Count}/{series.TotalCharacters}");
                    Console.WriteLine($"   Objectives: {series.TotalObjectives}");
                    Console.WriteLine();
                }

                Console.WriteLine("0. Back");
                Console.Write("> ");

                if (int.TryParse(Console.ReadLine(), out int selection))
                {
                    if (selection == 0) return;
                    
                    var selectedSeries = _availableSeries.ElementAtOrDefault(selection - 1);
                    if (selectedSeries != null && selectedSeries.IsUnlocked(_playerTeam))
                    {
                        StartChallengeSeries(selectedSeries);
                        LoadAvailableSeries(); // Refresh after completion
                    }
                }
            }
        }

        private void StartChallengeSeries(ChallengeSeries series)
        {
            // Select character from available unlocked characters
            var character = SelectChallengeCharacter(series);
            if (character == null) return;

            // Start the series with this character
            var challengeSession = new ChallengeSession(series, character, _playerTeam);
            bool success = challengeSession.Run();

            if (success)
            {
                // Award progression
                character.LevelUp();
                _playerTeam.TeamLevel++;
                
                // Check for new unlocks
                CheckForUnlocks(series, character);
                
                Console.WriteLine($"\nChallenge completed! {character.Name} leveled up!");
            }
            else
            {
                Console.WriteLine("\nChallenge failed - objectives not met!");
                Console.WriteLine("Progress reset for this series attempt.");
            }

            Console.WriteLine("Press any key to continue...");
            Console.ReadKey();
        }

        private ChallengeCharacter SelectChallengeCharacter(ChallengeSeries series)
        {
            var availableChars = series.AvailableCharacters
                .Where(c => c.IsUnlocked)
                .ToList();

            Console.Clear();
            Console.WriteLine($"SELECT CHARACTER FOR: {series.Name}\n");

            for (int i = 0; i < availableChars.Count; i++)
            {
                Console.WriteLine($"{i + 1}. {availableChars[i].Name} (Lv. {availableChars[i].Level})");
                Console.WriteLine($"   Skills: {string.Join(", ", availableChars[i].GetSkills())}");
                Console.WriteLine();
            }

            Console.WriteLine("0. Back");
            Console.Write("> ");

            if (int.TryParse(Console.ReadLine(), out int choice))
            {
                if (choice == 0) return null;
                if (choice > 0 && choice <= availableChars.Count)
                {
                    return availableChars[choice - 1];
                }
            }

            return null;
        }

        private void CheckForUnlocks(ChallengeSeries series, ChallengeCharacter character)
        {
            // Unlock new characters when reaching certain levels
            foreach (var c in series.AvailableCharacters.Where(c => !c.IsUnlocked))
            {
                if (character.Level >= c.UnlockLevel && _playerTeam.TeamLevel >= c.UnlockTeamLevel)
                {
                    c.Unlock();
                    Console.WriteLine($"\nNew character unlocked: {c.Name}!");
                }
            }

            // Unlock new series when conditions met
            var newSeries = _progress.GetLockedChallengeSeries()
                .FirstOrDefault(s => s.UnlockCondition?.IsMet(_playerTeam) ?? false);
            
            if (newSeries != null)
            {
                newSeries.Unlock();
                _availableSeries.Add(newSeries);
                Console.WriteLine($"\nNew challenge series unlocked: {newSeries.Name}!");
            }
        }
        #endregion

        #region Progression Views
        private void ViewCharacterProgression()
        {
            // Display all characters across all series and their progress
            var allCharacters = _availableSeries
                .SelectMany(s => s.AvailableCharacters)
                .OrderBy(c => c.IsUnlocked ? 0 : 1)
                .ThenBy(c => c.UnlockLevel)
                .ToList();

            Console.Clear();
            Console.WriteLine("CHARACTER PROGRESSION\n");

            foreach (var character in allCharacters)
            {
                string status = character.IsUnlocked ? $"[Lv. {character.Level}]" : $"[LOCKED - Requires: Char Lv. {character.UnlockLevel}, Team Lv. {character.UnlockTeamLevel}]";
                Console.WriteLine($"{character.Name} {status}");
                Console.WriteLine($"   Skills: {string.Join(", ", character.GetSkills())}");
                Console.WriteLine($"   Car Perks: {string.Join(", ", character.GetCarPerks())}");
                Console.WriteLine();
            }

            Console.WriteLine("Press any key to continue...");
            Console.ReadKey();
        }

        private void ViewTeamProgression()
        {
            Console.Clear();
            Console.WriteLine("TEAM PROGRESSION");
            Console.WriteLine($"Current Level: {_playerTeam.TeamLevel}\n");
            
            Console.WriteLine("Next Level Unlocks:");
            var nextUnlocks = _progress.GetChallengeUnlocksAtLevel(_playerTeam.TeamLevel + 1);
            foreach (var unlock in nextUnlocks)
            {
                Console.WriteLine($"- {unlock.Description}");
            }

            Console.WriteLine("\nPress any key to continue...");
            Console.ReadKey();
        }
        #endregion

        private void DisplayChallengeDashboard()
        {
            Console.WriteLine($"CHALLENGE MODE");
            Console.WriteLine($"Team Level: {_playerTeam.TeamLevel}");
            Console.WriteLine($"Available Series: {_availableSeries.Count(s => s.IsUnlocked(_playerTeam))}/{_availableSeries.Count}");
            
            var totalChars = _availableSeries.Sum(s => s.AvailableCharacters.Count);
            var unlockedChars = _availableSeries.Sum(s => s.AvailableCharacters.Count(c => c.IsUnlocked));
            Console.WriteLine($"Unlocked Characters: {unlockedChars}/{totalChars}");
        }
    }

    public class ChallengeSession
    {
        private ChallengeSeries _series;
        private ChallengeCharacter _character;
        private PlayerTeam _playerTeam;
        private int _currentObjectiveIndex = 0;

        public ChallengeSession(ChallengeSeries series, ChallengeCharacter character, PlayerTeam playerTeam)
        {
            _series = series;
            _character = character;
            _playerTeam = playerTeam;
        }

        public bool Run()
        {
            foreach (var objective in _series.Objectives)
            {
                _currentObjectiveIndex++;
                
                Console.Clear();
                Console.WriteLine($"CHALLENGE: {_series.Name}");
                Console.WriteLine($"Objective {_currentObjectiveIndex}/{_series.Objectives.Count}: {objective.Description}\n");
                
                // Setup race with objective-specific conditions
                var race = new ChallengeRace(objective, _character);
                var result = race.Run();
                
                if (!objective.IsCompleted(result))
                {
                    return false; // Failed objective
                }

                Console.WriteLine("\nObjective completed! Press any key to continue...");
                Console.ReadKey();
            }

            return true; // All objectives completed
        }
    }
}