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

using System;
using System.ComponentModel;

namespace SKG.Ext
{
    /// <summary>
    /// Extend for the Enum
    /// </summary>
    public static class EnumExt
    {
        #region -- Common --

        /// <summary>
        /// Get enum description
        /// </summary>
        /// <param name="value">Value of enum</param>
        /// <returns>Return the description</returns>
        public static string ToDescription(this Enum value)
        {
            var res = value.ToString();
            var t1 = value.GetType().GetField(res);
            var t2 = t1.GetCustomAttributes(typeof(DescriptionAttribute), false);
            var t3 = (DescriptionAttribute[])t2;

            if (t3 != null && t3.Length > 0)
            {
                res = t3[0].Description;
            }

            return res;
        }

        #endregion
    }
}