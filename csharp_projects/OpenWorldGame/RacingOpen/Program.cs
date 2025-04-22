// Main source for main menu system.
using System;
namespace RacingOpen
{
    class Program
    {
        static void Main(string[] args)
        {
            // Initialize game components here if needed
            
            // Show main menu (would be set as informative and selection method on application, not on cmd)
            var mainMenu = new MainMenu();
            mainMenu.Show();
            
            // When menu exits (user selects Exit Game)
            Console.WriteLine("Thanks for playing! Press any key to close...");
            Console.ReadKey();
        }
    }
}
