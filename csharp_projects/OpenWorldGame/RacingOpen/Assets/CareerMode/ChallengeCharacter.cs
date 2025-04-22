public class ChallengeCharacter
{
    public string Name { get; }
    public int Level { get; private set; }
    public bool IsUnlocked { get; private set; }
    public int UnlockLevel { get; }
    public int UnlockTeamLevel { get; }
    public List<CharacterSkill> Skills { get; }
    public List<CarPerk> CarPerks { get; }

    public void Unlock() => IsUnlocked = true;
    public void LevelUp() => Level++;

    public IEnumerable<string> GetSkills() => Skills.Select(s => s.ToString());
    public IEnumerable<string> GetCarPerks() => CarPerks.Select(p => p.ToString());
}