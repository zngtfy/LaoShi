#region Information
/*
 * Author       : ZngTfy
 * Email        : toan.nguyen@tanvieta.co
 * Phone        : +84 345 515 010
 * ------------------------------- *
 * Create       : 2019-Oct-19 04:24
 * Update       : 2019-Oct-19 04:24
 * Checklist    : 1.0
 * Status       : Done
 */
#endregion

using System.Linq;

namespace SKG.Ext
{
    /// <summary>
    /// Extend for the type
    /// </summary>
    public static class TypeExt
    {
        #region -- Common --

        /// <summary>
        /// Copy all properties data (skip null properties) from source to destination
        /// </summary>
        /// <typeparam name="T">The class type</typeparam>
        /// <param name="fr">Source</param>
        /// <param name="to">Destination</param>
        public static void Kopy<T>(this T fr, T to)
        {
            var t1 = typeof(T).GetProperties();
            var t2 = t1.Where(x => x.GetValue(fr, null) != null);

            foreach (var i in t2)
            {
                if (i.Name == "Id")
                {
                    continue;
                }

                var t3 = i.GetValue(fr, null);
                if (i.CanWrite)
                {
                    i.SetValue(to, t3, null);
                }
            }
        }

        /// <summary>
        /// Compare all properties data (skip null properties) from source to destination
        /// </summary>
        /// <typeparam name="T">The class type</typeparam>
        /// <param name="fr">Source</param>
        /// <param name="to">Destination</param>
        /// <returns>Return true if it is difference, else false</returns>
        public static bool Differ<T>(this T fr, T to)
        {
            if (fr == null || to == null)
            {
                return false;
            }

            var t1 = typeof(T).GetProperties();
            var t2 = t1.Where(x => x.GetValue(fr, null) != null);

            foreach (var i in t2)
            {
                if (i.Name == "Id")
                {
                    continue;
                }

                var t3 = i.GetValue(fr, null) + string.Empty;
                var t4 = i.GetValue(to, null) + string.Empty;

                if (t3 != t4)
                {
                    return true;
                }
            }

            return false;
        }

        #endregion
    }
}