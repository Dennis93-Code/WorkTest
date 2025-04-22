public class Invitational
{
    public string Name { get; }
    public InvitationalType Type { get; }
    public int Level { get; }
    public int ReputationReward { get; }
    public int MoneyReward { get; }
    public int RequiredPosition { get; }
    public Car RequiredCar { get; } // Null means any car
    public RaceSettings Settings { get; }
    public RacingDiscipline Discipline { get; }

    public bool IsUnlocked(PlayerTeam team) 
        => team.Reputation >= GetRequiredReputation() 
           && team.HasSuitableCar(Discipline);

    private int GetRequiredReputation() => Level * 100;
}