public class ChallengeObjective
{
    public string Description { get; }
    public ObjectiveType Type { get; }
    public int RequiredValue { get; } // Could be position, time, etc.
    public RaceSettings RaceSettings { get; }

    public bool IsCompleted(RaceResult result)
    {
        return Type switch {
            ObjectiveType.FinishPosition => result.Position <= RequiredValue,
            ObjectiveType.TotalTime => result.TotalTime.TotalSeconds <= RequiredValue,
            ObjectiveType.LapTime => result.BestLapTime.TotalSeconds <= RequiredValue,
            _ => false
        };
    }
}

public enum ObjectiveType
{
    FinishPosition,
    TotalTime,
    LapTime,
    // Add others as needed
}