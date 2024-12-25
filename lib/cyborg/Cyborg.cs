namespace aitg.lib.cyborg
{
    public static class Cyborg
    {
        public static string[] cyborgActShortName = ["Recharge", "Pong", "Ult. Avoidance", "Math Master", "Whack-a-greg", "Triangle Count", "MindSweeper", "Balance 3", "Simple Race", "Item Fight", "Death Match", "MMR X", "FCG - Level 1", "FCG - Level 2", "FCG - Level 3", "FCG - Level 4", "FCG - Level 6", "FCG - Level 7", "FCG - Level 8", "FCG - Level 10", "Fishing"];
        public static string[] cyborgActLongName = ["Recharging...", "Arcade - Pong: Survival Battle", "Arcade - Ultimate Avoidance", "Arcade - Math Master", "Arcade - Whack-a-greg", "Arcade - Triangle Count", "Arcade - MindSweeper", "Arcade - Balance 3", "Stadium - Simple Race (Impossible)", "Stadium - Item Fight (Impossible)", "Stadium - Death Match", "Arcade - MMR X", "TukkunFCG - Level 1", "TukkunFCG - Level 2", "TukkunFCG - Level 3", "TukkunFCG - Level 4", "TukkunFCG - Level 6", "TukkunFCG - Level 7", "TukkunFCG - Level 8", "TukkunFCG - Level 10", "Fishing"];
        public static double[] cyborgActMinPerf = [40, 10000, 10000, 10000, 10000, 10000, 10000, 10000, 5, 5, 50, 5, 4.5, 4, 3.5, 3, 2.5, 2, 1.5, 1, 1];
        public static double[] cyborgActMaxPerf = [240, 4200000, 1750000, 2400000, 3300000, 13500000, 10000000, 7200000, 90, 90, 1100, 7200000, 98, 97, 96, 95, 90, 85, 80, 70, 95];
        public static string[] cyborgActPerfText = ["Energy", "Maximum Score", "Maximum Score", "Maximum Score", "Maximum Score", "Maximum Score", "Maximum Score", "Maximum Score", "Win Rate", "Win Rate", "Maximum PWNts", "Maximum Score", "Win Rate", "Win Rate", "Win Rate", "Win Rate", "Win Rate", "Win Rate", "Win Rate", "Win Rate", "Perfect Rate"];
        public static string[] cyborgActPerfSign = [" sec", "", "", "", "", "", "", "", "%", "%", "", "", "%", "%", "%", "%", "%", "%", "%", "%", "%"];
        public static double[] cyborgActTime = [300, 420, 175, 80, 165, 675, 500, 360, 17, 19, 600, 360, 120, 150, 170, 190, 200, 300, 350, 450, 27];
        public static double[] cyborgActCost = [0, 84, 35, 16, 33, 135, 100, 72, 4, 5, 1000, 72, 30, 35, 40, 45, 60, 90, 120, 180, 11];
        public static bool cyborgWorking = false;
    }
}