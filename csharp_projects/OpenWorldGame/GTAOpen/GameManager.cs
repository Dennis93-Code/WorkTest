using System;
using System.Threading;

public class GameManager
{
    private enum GameState { Intro, MainMenu, Loading, Playing, Exiting }
    private GameState currentState = GameState.Intro;

    public void Run()
    {
        while (currentState != GameState.Exiting)
        {
            switch (currentState)
            {
                case GameState.Intro:
                    ShowIntro();
                    break;
                case GameState.MainMenu:
                    ShowMainMenu();
                    break;
                case GameState.Loading:
                    LoadGame();
                    break;
                case GameState.Playing:
                    StartGame();
                    break;
            }
        }
    }

    private void ShowIntro()
    {
        Console.Clear();
        Console.WriteLine("Welcome to GTAOpen...");
        Thread.Sleep(2000);
        Console.WriteLine("A game inspired by open-world exploration...");
        Thread.Sleep(3000);
        currentState = GameState.MainMenu; // Move to main menu after intro
    }

    private void ShowMainMenu()
    {
        Console.Clear();
        Console.WriteLine("=== MAIN MENU ===");
        Console.WriteLine("1. Start Game");
        Console.WriteLine("2. Load Game");
        Console.WriteLine("3. Settings");
        Console.WriteLine("4. Quit");
        Console.Write("Choose an option: ");

        string choice = Console.ReadLine();
        switch (choice)
        {
            case "1":
                currentState = GameState.Loading;
                break;
            case "2":
                Console.WriteLine("Load Game is not ready yet.");
                Thread.Sleep(2000);
                break;
            case "3":
                Console.WriteLine("Settings will be added later.");
                Thread.Sleep(2000);
                break;
            case "4":
                ConfirmQuit();
                break;
            default:
                Console.WriteLine("Invalid choice. Try again.");
                Thread.Sleep(1500);
                break;
        }
    }

    private void LoadGame()
    {
        Console.Clear();
        Console.WriteLine("Loading Game...");
        Thread.Sleep(3000);
        currentState = GameState.Playing;
    }

    private void StartGame()
    {
        Console.Clear();
        Console.WriteLine("Game Started! (Placeholder)");
        Console.WriteLine("Press Enter to return to the menu...");
        Console.ReadLine();
        currentState = GameState.MainMenu;
    }

    private void ConfirmQuit()
    {
        Console.Clear();
        Console.WriteLine("Are you sure you want to quit? (Y/N)");
        string input = Console.ReadLine()?.ToLower();
        if (input == "y")
        {
            Console.WriteLine("Exiting game...");
            Thread.Sleep(2000);
            currentState = GameState.Exiting;
        }
        else
        {
            currentState = GameState.MainMenu;
        }
    }
}
