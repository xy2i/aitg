using static aitg.lib.SaveReader;

namespace aitg.lib
{
    /// <summary>
    /// Global, per user saved data. Saved on the filesystem,
    /// see <see cref="SaveReader"/>. Equivalent to _root.save in AS2.
    /// </summary>
    public class Save
    {
        public double bgred = 0;
        /// <summary>
        /// Display name, at the top of the save.
        /// </summary>
        public string displayName = "????";

        /// <summary>
        /// User title, displayed below the name in the main screen.
        /// </summary>
        public string userTitle = "Welcome to Anti-Idle!";
    }

    /// <summary>
    /// Global, non-saved data. Equivalent to _root in AS2.
    /// The name Root is used for familiarity.
    /// </summary>
    public class Root
    {
        /// <summary>
        /// Flash version, displayed in the bottom bar.
        /// </summary>
        public string flashVer = "AITG";

        /// Username from Kongregate. Since Kong isn't active anymore, this
        /// is always "Guest".
        /// </summary>
        public string kongregate_username = "Guest";

        /// <summary>
        /// Time spent since starting the game, in seconds.
        /// </summary>
        public double thisSession = 0;

        public double refresh_date = 0;
        public double refresh_month = 0;
        public double refresh_year = 0;

        /// <summary>
        /// Version number.
        /// </summary>
        public double upNumber = 1861.1;
    }

    /// <summary>
    /// Shared save data. Usually for title screen saved data.
    /// Saved on the filesystem,
    /// see <see cref="SaveReader"/>. Equivalent to _root.saveGlobal in AS2.
    /// </summary>
    public class SaveGlobal
    {
    }

    public static class Globals
    {
        public static Root root = new();
        public static SaveGlobal saveGlobal = ReadSave<SaveGlobal>("ATG_Global");
        // The local save is initialized using ReadSave() later.
        public static Save save;


        /// <summary>
        /// A prefix that's appended in front of every save name.
        ///
        /// So, in a vanilla save:
        ///              "antiIdle_file0"
        /// - "antiIdle_" is the save prefix.
        /// - "file0" is the save suffix.
        /// </summary>
        public const string SAVE_PREFIX = "antiIdle_";

        /// <summary>
        /// Loads a save given its file name, minus the given save prefix. If you want to load "antiIdle_file0", pass "file0".
        ///
        /// On vanilla, this save prefix is `antiIdle_`. On mods, it may be different given the mod name. See SAVE_PREFIX.
        /// </summary>
        /// <param name="saveSuffix">The suffix of the save file to load.</param>
        public static void LoadSave(string saveSuffix)
        {
            Globals.save = ReadSave<Save>(SAVE_PREFIX + saveSuffix);
        }
    }
}
