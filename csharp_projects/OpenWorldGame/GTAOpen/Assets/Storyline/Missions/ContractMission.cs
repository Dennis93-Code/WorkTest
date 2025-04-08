using System;
using System.Collections.Generic;

namespace GTAOpen.Missions
{
    public class ContractMissionAct1 : MissionBase
    {
        private string missionName = "Gang Warfare: Retribution - Act 1";
        private bool missionFailed = false;
        private int teamLives = 1;

        public override void StartMission()
        {
            Console.WriteLine("[CUTSCENE] Gang A Leader: We got problems. Rival gang took our shipment. You up for a job?");
            Console.WriteLine("Player accepts the mission.");
            ExecuteMission();
        }

        private void ExecuteMission()
        {
            Console.WriteLine("[MISSION] Eliminate all rival gang members in the area!");
            if (CheckFailureCondition()) return;

            Console.WriteLine("[MISSION] Steal the required items!");
            if (CheckFailureCondition()) return;

            Console.WriteLine("[MISSION] Escape to the safe area while being chased!");
            Console.WriteLine("[SAFE ZONE REACHED] Enemies stop pursuing.");
            CompleteMission();
        }

        private void CompleteMission()
        {
            Console.WriteLine("[CUTSCENE] Gang A Leader: Good job. More work coming.");
        }

        private bool CheckFailureCondition()
        {
            if (missionFailed || teamLives <= 0)
            {
                Console.WriteLine("[MISSION FAILED] You compromised the task or ran out of team lives.");
                FailMission();
                return true;
            }
            return false;
        }

        private void FailMission()
        {
            Console.WriteLine("[CUTSCENE] Gang A Leader: You messed up. We’ll talk later.");
        }
    }

    public class ContractMissionAct2 : MissionBase
    {
        private string missionName = "Gang Warfare: Retribution - Act 2";
        private bool missionFailed = false;
        private int teamLives = 1;

        public override void StartMission()
        {
            Console.WriteLine("[CUTSCENE] Gang A Leader: We need to strike back. This time, be careful.");
            ExecuteMission();
        }

        private void ExecuteMission()
        {
            Console.WriteLine("[MISSION] Use allies' vehicles/products to deal with enemies!");
            Console.WriteLine("[WARNING] Do not destroy ally assets!");
            if (CheckFailureCondition()) return;

            Console.WriteLine("[MISSION] Steal enemy supplies!");
            if (CheckFailureCondition()) return;

            CompleteMission();
        }

        private void CompleteMission()
        {
            Console.WriteLine("[CUTSCENE] Gang A Leader: We are making progress. One last job left.");
        }

        private bool CheckFailureCondition()
        {
            if (missionFailed || teamLives <= 0)
            {
                Console.WriteLine("[MISSION FAILED] You compromised the task or ran out of team lives.");
                FailMission();
                return true;
            }
            return false;
        }

        private void FailMission()
        {
            Console.WriteLine("[CUTSCENE] Gang A Leader: That was sloppy. This is bad for us.");
        }
    }

    public class ContractMissionAct3 : MissionBase
    {
        private string missionName = "Gang Warfare: Retribution - Act 3";
        private bool missionFailed = false;
        private int teamLives = 1;

        public override void StartMission()
        {
            Console.WriteLine("[CUTSCENE] Gang A Leader: This is it. Finish the job.");
            ExecuteMission();
        }

        private void ExecuteMission()
        {
            Console.WriteLine("[MISSION] Deliver the stolen goods from Point A to Point B while under heavy pursuit!");
            if (CheckFailureCondition()) return;

            Console.WriteLine("[MISSION] Kill the rival gang boss!");
            if (CheckFailureCondition()) return;

            CompleteMission();
        }

        private void CompleteMission()
        {
            Console.WriteLine("[CUTSCENE] Gang A Leader: You did it. We own this city now.");
        }

        private bool CheckFailureCondition()
        {
            if (missionFailed || teamLives <= 0)
            {
                Console.WriteLine("[MISSION FAILED] You compromised the task or ran out of team lives.");
                FailMission();
                return true;
            }
            return false;
        }

        private void FailMission()
        {
            Console.WriteLine("[CUTSCENE] Gang A Leader: We were so close, and you ruined it.");
        }
    }
}
