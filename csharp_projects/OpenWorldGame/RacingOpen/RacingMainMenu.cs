using System;

namespace RacingOpen
{
    public class RacingMainMenu
    {
        // Current selection state
        public int CurrentSelection { get; private set; } = 1;
        public bool IsActive { get; private set; } = true;
        public bool ConfirmExitPrompt { get; private set; } = false;

        public void Update()
        {
            // This method would be called by your game loop
            // Input handling would be done by your input system
        }

        public void ProcessInput(int input)
        {
            if (ConfirmExitPrompt)
            {
                HandleExitConfirmation(input);
                return;
            }

            switch (input)
            {
                case 1: // Up
                    CurrentSelection = Math.Max(1, CurrentSelection - 1);
                    break;
                case 2: // Down
                    CurrentSelection = Math.Min(4, CurrentSelection + 1);
                    break;
                case 3: // Select
                    ExecuteSelectedOption();
                    break;
                case 4: // Back
                    if (CurrentSelection == 4)
                    {
                        ConfirmExitPrompt = true;
                    }
                    break;
            }
        }

        private void ExecuteSelectedOption()
        {
            switch (CurrentSelection)
            {
                case 1:
                    OnCareerModeSelected?.Invoke();
                    break;
                case 2:
                    OnSkirmishModeSelected?.Invoke();
                    break;
                case 3:
                    OnSettingsSelected?.Invoke();
                    break;
                case 4:
                    ConfirmExitPrompt = true;
                    break;
            }
        }

        private void HandleExitConfirmation(int input)
        {
            if (input == 3) // Select
            {
                if (CurrentSelection == 1) // Yes
                {
                    IsActive = false;
                    OnGameExitConfirmed?.Invoke();
                }
                else // No
                {
                    ConfirmExitPrompt = false;
                }
            }
            else if (input == 4) // Back
            {
                ConfirmExitPrompt = false;
            }
            else // Navigation
            {
                CurrentSelection = input == 1 ? 1 : 2; // Toggle between Yes/No
            }
        }

        // Event handlers for integration with other systems
        public event Action OnCareerModeSelected;
        public event Action OnSkirmishModeSelected;
        public event Action OnSettingsSelected;
        public event Action OnGameExitConfirmed;

        // For debugging/console fallback
        public void ShowConsoleMenu()
        {
            while (IsActive)
            {
                if (!ConfirmExitPrompt)
                {
                    Console.Clear();
                    Console.WriteLine("MAIN MENU");
                    Console.WriteLine(CurrentSelection == 1 ? "> 1. Career Mode" : "  1. Career Mode");
                    Console.WriteLine(CurrentSelection == 2 ? "> 2. Skirmish Mode" : "  2. Skirmish Mode");
                    Console.WriteLine(CurrentSelection == 3 ? "> 3. Settings" : "  3. Settings");
                    Console.WriteLine(CurrentSelection == 4 ? "> 4. Exit Game" : "  4. Exit Game");
                }
                else
                {
                    Console.Clear();
                    Console.WriteLine("Exit Game?");
                    Console.WriteLine(CurrentSelection == 1 ? "> 1. Yes" : "  1. Yes");
                    Console.WriteLine(CurrentSelection == 2 ? "> 2. No" : "  2. No");
                }

                var key = Console.ReadKey(true);
                int input = 0;

                switch (key.Key)
                {
                    case ConsoleKey.UpArrow: input = 1; break;
                    case ConsoleKey.DownArrow: input = 2; break;
                    case ConsoleKey.Enter: input = 3; break;
                    case ConsoleKey.Escape: input = 4; break;
                }

                if (input > 0)
                {
                    ProcessInput(input);
                }
            }
        }
    }
}