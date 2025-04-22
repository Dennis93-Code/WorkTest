public class GameProgress
{
    public int StoryTokens { get; private set; }
    private List<Team> _allTeams;

    public void UnlockTeamChallenge(Team team)
    {
        team.IsChallengeUnlocked = true;
        SaveProgress();
    }

    public void AwardStoryTokens(Team team)
    {
        StoryTokens += team.StoryRewardTokens;
        SaveProgress();
    }

    public IEnumerable<Team> GetAvailableTeams()
    {
        return _allTeams.Where(t => t.IsUnlocked);
    }

    // ... other progress tracking methods ...
    // Challenge Mode
    public int TeamLevel { get; set; }
    public List<ChallengeCharacter> UnlockedChallengeCharacters { get; }

    public List<ChallengeSeries> GetUnlockedChallengeSeries(PlayerTeam team)
    {
        return _allChallengeSeries
            .Where(s => s.IsUnlocked(team))
            .ToList();
    }

    public List<ChallengeSeries> GetLockedChallengeSeries()
    {
        return _allChallengeSeries
            .Where(s => !s.IsUnlocked)
            .ToList();
    }

    public List<Unlockable> GetChallengeUnlocksAtLevel(int teamLevel)
    {
        return _allUnlockables
            .Where(u => u.RequiredTeamLevel == teamLevel)
            .ToList();
    }
}