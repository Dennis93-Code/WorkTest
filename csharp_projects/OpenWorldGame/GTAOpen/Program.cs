// The main source to startup the game.
using System;
using System.Threading;

class Program
{
    static void Main()
    {
        Console.WriteLine("Starting GTAOpen...");

        // Initialize AI, Characters, and World
        GameManager game = new GameManager();
        game.Run();
    }
}
