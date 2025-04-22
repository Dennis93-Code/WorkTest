public class MainEvent
{
    public string Name { get; }
    public RacingDiscipline Discipline { get; }
    public int Tier { get; }
    public Track Track { get; }
    public List<CarClass> AllowedCarClasses { get; }
    public bool IsChampionship { get; }

    public List<RaceResult> RunEvent(PlayerTeam team, Car car)
    {
        // Implementation for single race or championship
    }
}