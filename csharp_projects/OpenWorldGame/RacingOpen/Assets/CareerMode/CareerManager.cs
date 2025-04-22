public class CareerManager
{
    private GameData _gameData;
    private bool _challengeModeUnlocked = false;

    public CareerManager()
    {
        _gameData = LoadGameData();
        _teamSelectionMenu = new TeamSelectionMenu(_gameProgress);
    }

    public bool IsChallengeModeUnlocked() => _challengeModeUnlocked;

    public void StartStoryMode()
    {
        // Only show unlocked teams (max 3 available)
        var selectedTeam = _teamSelectionMenu.GetSelectedTeam();
        
        if (selectedTeam == null) return; // User cancelled selection

        var story = new StoryMode(selectedTeam);
        story.Play();
        
        if (story.IsCompleted)
        {
            // Handle unlocks and rewards
            _gameProgress.UnlockTeamChallenge(selectedTeam);
            _gameProgress.AwardStoryTokens(selectedTeam);
            
            // Check for new team unlocks
            TryUnlockNewTeams();
        }
        else if (story.IsAbandoned)
        {
            _gameProgress.ResetTeamProgress(selectedTeam);
        }
    }

    private void TryUnlockNewTeams()
    {
        // Implementation depends on your unlocking rules
        // Example: Unlock new team when player has 3 tokens
        if (_gameProgress.StoryTokens >= 3)
        {
            _gameProgress.UnlockNewTeam();
            _gameProgress.StoryTokens -= 3;
        }
    }

    public void StartRaceManagementMode()
    {
        var manager = new RaceManagementMode();
        manager.Start();
    }

    public void StartChallengeMode()
    {
        var challenge = new ChallengeMode();
        challenge.Start();
    }

    private Team SelectTeam()
    {
        // Implement team selection logic
        // Return null if user cancels
        return new Team(); // placeholder
    }

    private GameData LoadGameData()
    {
        // Load saved game data
        return new GameData(); // placeholder
    }
}