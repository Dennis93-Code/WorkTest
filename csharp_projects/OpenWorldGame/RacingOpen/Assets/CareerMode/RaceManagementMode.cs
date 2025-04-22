using System;
using System.Collections.Generic;
using System.Linq;

namespace RacingOpen
{
    public class RaceManagementMode
    {
        private PlayerTeam _playerTeam;
        private GameProgress _progress;
        private List<Invitational> _availableInvitationals = new List<Invitational>();
        private List<MainEvent> _availableMainEvents = new List<MainEvent>();
        private SeasonManager _seasonManager;

        public RaceManagementMode(PlayerTeam team, GameProgress progress)
        {
            _playerTeam = team;
            _progress = progress;
            _seasonManager = new SeasonManager(progress.CurrentSeason);
            LoadAvailableEvents();
        }

        public void Start()
        {
            while (true)
            {
                Console.Clear();
                DisplayManagementDashboard();

                Console.WriteLine("\n1. Invitational Events");
                Console.WriteLine("2. Main Events");
                Console.WriteLine("3. Team Management");
                Console.WriteLine("4. Season Progress");
                Console.WriteLine("5. Return to Career Menu");
                Console.Write("> ");

                var choice = Console.ReadLine();
                switch (choice)
                {
                    case "1":
                        ShowInvitationalEvents();
                        break;
                    case "2":
                        ShowMainEvents();
                        break;
                    case "3":
                        ManageTeam();
                        break;
                    case "4":
                        ShowSeasonProgress();
                        break;
                    case "5":
                        return;
                }
            }
        }

        private void LoadAvailableEvents()
        {
            // Load invitationals based on player's progress and reputation
            _availableInvitationals = _progress.GetUnlockedInvitationals(_playerTeam.Reputation);

            // Load main events based on discipline levels
            _availableMainEvents = _progress.GetAvailableMainEvents(_playerTeam.DisciplineLevels);
        }

        #region Invitational Events
        private void ShowInvitationalEvents()
        {
            while (true)
            {
                Console.Clear();
                Console.WriteLine("INVITATIONAL EVENTS");
                Console.WriteLine($"Available: {_availableInvitationals.Count}\n");

                // Group by type
                var grouped = _availableInvitationals
                    .GroupBy(i => i.Type)
                    .OrderBy(g => g.Key.ToString());

                int index = 1;
                foreach (var group in grouped)
                {
                    Console.WriteLine($"{group.Key.ToString().ToUpper()}");
                    foreach (var invitational in group.OrderBy(i => i.Level))
                    {
                        string lockStatus = invitational.IsUnlocked(_playerTeam) ? "" : "[LOCKED]";
                        Console.WriteLine($"  {index++}. {invitational.Name} (Lv. {invitational.Level}) {lockStatus}");
                    }
                    Console.WriteLine();
                }

                Console.WriteLine("0. Back");
                Console.Write("> ");

                if (int.TryParse(Console.ReadLine(), out int selection))
                {
                    if (selection == 0) return;
                    
                    var selected = _availableInvitationals
                        .OrderBy(i => i.Type.ToString())
                        .ThenBy(i => i.Level)
                        .ElementAtOrDefault(selection - 1);

                    if (selected != null && selected.IsUnlocked(_playerTeam))
                    {
                        StartInvitational(selected);
                        LoadAvailableEvents(); // Refresh after completion
                    }
                }
            }
        }

        private void StartInvitational(Invitational invitational)
        {
            // Setup race with specific conditions
            var race = new Race(invitational.Settings);
            
            // Use provided car if specified
            var car = invitational.RequiredCar ?? _playerTeam.GetSuitableCar(invitational.Discipline);
            
            // Run race
            var result = race.Run(_playerTeam.Driver, car);
            
            // Process rewards
            if (result.Position <= invitational.RequiredPosition)
            {
                _playerTeam.Reputation += invitational.ReputationReward;
                _playerTeam.Money += invitational.MoneyReward;
                _progress.UnlockNextLevel(invitational);
                
                Console.WriteLine($"\nCompleted! Earned: {invitational.ReputationReward} REP, ${invitational.MoneyReward}");
            }
            else
            {
                Console.WriteLine("\nFailed to meet requirements!");
            }
            
            Console.WriteLine("Press any key to continue...");
            Console.ReadKey();
        }
        #endregion

        #region Main Events
        private void ShowMainEvents()
        {
            while (true)
            {
                Console.Clear();
                Console.WriteLine("MAIN EVENTS");
                Console.WriteLine("Select Discipline:\n");

                var disciplines = _availableMainEvents
                    .Select(m => m.Discipline)
                    .Distinct()
                    .OrderBy(d => d.ToString())
                    .ToList();

                for (int i = 0; i < disciplines.Count; i++)
                {
                    Console.WriteLine($"{i + 1}. {disciplines[i]} (Lv. {_playerTeam.GetDisciplineLevel(disciplines[i])})");
                }

                Console.WriteLine("0. Back");
                Console.Write("> ");

                if (int.TryParse(Console.ReadLine(), out int disciplineChoice))
                {
                    if (disciplineChoice == 0) return;
                    if (disciplineChoice > 0 && disciplineChoice <= disciplines.Count)
                    {
                        ShowDisciplineEvents(disciplines[disciplineChoice - 1]);
                    }
                }
            }
        }

        private void ShowDisciplineEvents(RacingDiscipline discipline)
        {
            var events = _availableMainEvents
                .Where(e => e.Discipline == discipline)
                .OrderBy(e => e.Tier)
                .ToList();

            while (true)
            {
                Console.Clear();
                Console.WriteLine($"{discipline.ToString().ToUpper()} EVENTS\n");

                for (int i = 0; i < events.Count; i++)
                {
                    Console.WriteLine($"{i + 1}. {events[i].Name} (Tier {events[i].Tier})");
                    Console.WriteLine($"   Cars: {string.Join(", ", events[i].AllowedCarClasses)}");
                    Console.WriteLine($"   Track: {events[i].Track.Name}");
                    Console.WriteLine();
                }

                Console.WriteLine("0. Back");
                Console.Write("> ");

                if (int.TryParse(Console.ReadLine(), out int eventChoice))
                {
                    if (eventChoice == 0) return;
                    if (eventChoice > 0 && eventChoice <= events.Count)
                    {
                        StartMainEvent(events[eventChoice - 1]);
                    }
                }
            }
        }

        private void StartMainEvent(MainEvent mainEvent)
        {
            // Get provided car for this event
            var car = _playerTeam.GetCarForEvent(mainEvent);
            
            // Run championship or single race based on event type
            var results = mainEvent.RunEvent(_playerTeam, car);
            
            // Update hall of fame and progression
            _progress.UpdateDisciplineLevel(mainEvent.Discipline, results);
            _playerTeam.UpdateReputation(results);
            
            // Season progression
            _seasonManager.CompleteEvent(mainEvent, results);
        }
        #endregion

        #region Team Management
        private void ManageTeam()
        {
            while (true)
            {
                Console.Clear();
                Console.WriteLine("TEAM MANAGEMENT");
                Console.WriteLine($"Reputation: {_playerTeam.Reputation}");
                Console.WriteLine($"Crew Slots: {_playerTeam.CurrentCrewCount}/{_playerTeam.MaxCrew}");
                Console.WriteLine($"Engine Crew: {_playerTeam.EngineCrewCount}/4-6");
                Console.WriteLine($"Business Crew: {_playerTeam.BusinessCrewCount}/2-4\n");

                Console.WriteLine("1. Hire Crew");
                Console.WriteLine("2. Fire Crew");
                Console.WriteLine("3. Garage (Vehicle Management)");
                Console.WriteLine("4. Hall of Fame Progress");
                Console.WriteLine("0. Back");
                Console.Write("> ");

                var choice = Console.ReadLine();
                switch (choice)
                {
                    case "1":
                        HireCrew();
                        break;
                    case "2":
                        FireCrew();
                        break;
                    case "3":
                        ManageGarage();
                        break;
                    case "4":
                        ViewHallOfFame();
                        break;
                    case "0":
                        return;
                }
            }
        }

        private void HireCrew()
        {
            var availableCrew = _progress.GetAvailableCrew(_playerTeam.Reputation)
                .Where(c => !_playerTeam.HasCrewMember(c))
                .ToList();

            // Display and selection logic
            // Check reputation requirements before hiring
        }

        private void ManageGarage()
        {
            // Vehicle purchase/upgrade system
            // Filter by discipline requirements
        }
        #endregion

        private void ShowSeasonProgress()
        {
            _seasonManager.DisplayProgress();
            Console.WriteLine("\nPress any key to continue...");
            Console.ReadKey();
        }

        private void DisplayManagementDashboard()
        {
            Console.WriteLine($"TEAM: {_playerTeam.Name}");
            Console.WriteLine($"REPUTATION: {_playerTeam.Reputation} (Rank: {_progress.GetReputationRank(_playerTeam.Reputation)})");
            Console.WriteLine($"MONEY: ${_playerTeam.Money}");
            Console.WriteLine($"SEASON: {_progress.CurrentSeason}");

            Console.WriteLine("\nDISCIPLINE LEVELS:");
            foreach (var discipline in (RacingDiscipline[])Enum.GetValues(typeof(RacingDiscipline)))
            {
                Console.WriteLine($"{discipline}: {_playerTeam.GetDisciplineLevel(discipline)}");
            }
        }
    }

    public enum RacingDiscipline
    {
        Touring,
        GT,
        Endurance,
        OpenWheel,
        Rally,
        // Add others as needed
    }
}