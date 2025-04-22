public class TeamSelectionMenu
{
    private GameProgress _progress;

    public TeamSelectionMenu(GameProgress progress)
    {
        _progress = progress;
    }

    public Team GetSelectedTeam()
    {
        var availableTeams = _progress.GetAvailableTeams()
                                  .Where(t => t.IsUnlocked && !t.IsStoryCompleted)
                                  .Take(3) // Only show 3 at a time
                                  .ToList();

        // Display team selection UI
        // Return selected team or null if cancelled
        return availableTeams.FirstOrDefault(); // Simplified
    }
}