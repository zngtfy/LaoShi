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

namespace SKG.Ext
{
    /// <summary>
    /// Extend for the int
    /// </summary>
    public static class IntExt
    {
        #region -- Common --

        /// <summary>
        /// Converts the specified nullable int representation of a number to an equivalent string 32-bit signed integer
        /// </summary>
        /// <param name="i">Nullable number</param>
        /// <returns>Return the string number</returns>
        public static string ToStrInt32(this int? i)
        {
            var t = i.ToInt32();
            var res = t == 0 ? string.Empty : t.ToString();
            return res;
        }

        #endregion
    }
}