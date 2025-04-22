public class ChallengeRace
{
    private ChallengeObjective _objective;
    private ChallengeCharacter _character;

    public ChallengeRace(ChallengeObjective objective, ChallengeCharacter character)
    {
        _objective = objective;
        _character = character;
        ApplyCharacterBonuses();
    }

    private void ApplyCharacterBonuses()
    {
        // Apply character skills and perks to the race setup
        foreach (var perk in _character.CarPerks)
        {
            // Modify car performance based on perks
        }
    }

    public RaceResult Run()
    {
        // Implement race with objective-specific conditions
        // Return results including position, times, etc.
        return new RaceResult(); 
    }
}