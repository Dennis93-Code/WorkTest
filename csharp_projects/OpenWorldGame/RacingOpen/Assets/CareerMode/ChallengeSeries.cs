public class ChallengeSeries
{
    public string Name { get; }
    public int RequiredTeamLevel { get; }
    public List<ChallengeObjective> Objectives { get; }
    public List<ChallengeCharacter> AvailableCharacters { get; }
    public UnlockCondition UnlockCondition { get; }
    public int TotalObjectives => Objectives.Count;
    public int TotalCharacters => AvailableCharacters.Count;

    public bool IsUnlocked(PlayerTeam team) 
        => team.TeamLevel >= RequiredTeamLevel;
}