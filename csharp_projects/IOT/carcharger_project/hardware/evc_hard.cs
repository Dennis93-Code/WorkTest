using System;
using System.Threading;

class EVC_Hard
{
    static bool isCharging = false;
    static DateTime startTime;
    static Random rand = new Random();

    static void Main()
    {
        Console.WriteLine("EV Charging Station Ready...");
        Console.WriteLine("Scan your RFID/NFC card to begin charging.");
        
        while (true)
        {
            Console.Write("[ACTION] Scan Card (Enter Client ID): ");
            string clientId = Console.ReadLine();
            
            if (AuthenticateClient(clientId))
            {
                double chargePercentage = GetChargePercentage();
                Console.WriteLine($"Current Charge: {chargePercentage}%");
                double amountDue = CalculateChargeAmount(chargePercentage);
                Console.WriteLine($"Charge Amount: RM {amountDue:F2}");
                
                Console.Write("Proceed with charging? (yes/no): ");
                string confirm = Console.ReadLine().ToLower();
                
                if (confirm == "yes")
                {
                    StartCharging();
                    Thread.Sleep(5000); // Simulating 5 sec charge
                    StopCharging();
                }
                else
                {
                    Console.WriteLine("Transaction Canceled.");
                }
            }
            else
            {
                Console.WriteLine("Invalid Client ID! Access Denied.");
            }
        }
    }

    static bool AuthenticateClient(string clientId)
    {
        // Simulated client authentication
        string[] validClients = { "12345", "67890", "ABCDE" }; // Sample IDs
        return Array.Exists(validClients, id => id == clientId);
    }

    static double GetChargePercentage()
    {
        return rand.Next(10, 100); // Simulate current battery level
    }

    static double CalculateChargeAmount(double chargePercentage)
    {
        double maxChargeCost = 50.0; // RM 50 for full charge
        return maxChargeCost * ((100 - chargePercentage) / 100);
    }

    static void StartCharging()
    {
        isCharging = true;
        startTime = DateTime.Now;
        Console.WriteLine("Charging Started at: " + startTime);
    }

    static void StopCharging()
    {
        isCharging = false;
        DateTime stopTime = DateTime.Now;
        TimeSpan duration = stopTime - startTime;

        double energyUsed = CalculateEnergyUsage(duration);
        Console.WriteLine($"Charging Stopped at: {stopTime}");
        Console.WriteLine($"Total Time: {duration.TotalSeconds} sec");
        Console.WriteLine($"Energy Consumed: {energyUsed:F2} kWh");
        Console.WriteLine("-----------------------------");
    }

    static double CalculateEnergyUsage(TimeSpan duration)
    {
        double powerRating = 7.2; // Assume 7.2 kW charger
        return (powerRating * duration.TotalHours);
    }
}
