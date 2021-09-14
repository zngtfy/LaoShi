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

namespace SKG.Ext
{
    /// <summary>
    /// Extend for the byte
    /// </summary>
    public static class ByteExt
    {
        #region -- Common --

        /// <summary>
        /// To base64 string
        /// </summary>
        /// <param name="o">Data</param>
        /// <returns>Return the result</returns>
        public static string To64(this byte[] o)
        {
            return o == null ? null : Convert.ToBase64String(o);
        }

        #endregion
    }
}