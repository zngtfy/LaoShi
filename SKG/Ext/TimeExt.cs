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
    /// Extend for the DateTime
    /// </summary>
    public static class TimeExt
    {
        #region -- Common --

        /// <summary>
        /// Convert DateTime to string with format dd-MMM-yyyy
        /// </summary>
        /// <param name="d">DateTime object</param>
        /// <returns>Return the string</returns>
        public static string ToStrDate(this DateTime d)
        {
            var res = d.ToString(ZConst.Format.Date);
            return res;
        }

        /// <summary>
        /// Convert DateTime to string with format dd-MMM-yyyy
        /// </summary>
        /// <param name="d">DateTime object</param>
        /// <returns>Return the string</returns>
        public static string ToStrDate(this DateTime? d)
        {
            var res = d == null ? string.Empty : d.Value.ToString(ZConst.Format.Date);
            return res;
        }

        /// <summary>
        /// Convert DateTime to string with format yyyy-MM-dd HH:mm:ss
        /// </summary>
        /// <param name="d">DateTime object</param>
        /// <returns>Return the string</returns>
        public static string ToStrSqlDateTime(this DateTime d)
        {
            var res = d.ToString(ZConst.Format.SqlDateTime);
            return res;
        }

        /// <summary>
        /// Convert DateTime to string with format yyyy-MM-dd HH:mm:ss
        /// </summary>
        /// <param name="d">DateTime object</param>
        /// <returns>Return the string</returns>
        public static string ToStrSqlDateTime(this DateTime? d)
        {
            var res = d == null ? string.Empty : d.Value.ToString(ZConst.Format.SqlDateTime);
            return res;
        }

        /// <summary>
        /// Convert DateTime to string with format yyyy/MM/dd HH:mm:ss
        /// </summary>
        /// <param name="d">DateTime object</param>
        /// <returns>Return the string</returns>
        public static string ToStrIsoDateTime(this DateTime d)
        {
            var res = d.ToString(ZConst.Format.IsoDateTime);
            return res;
        }

        /// <summary>
        /// Convert DateTime to string with format yyyy/MM/dd HH:mm:ss
        /// </summary>
        /// <param name="d">DateTime object</param>
        /// <returns>Return the string</returns>
        public static string ToStrIsoDateTime(this DateTime? d)
        {
            var res = d == null ? string.Empty : d.Value.ToString(ZConst.Format.IsoDateTime);
            return res;
        }

        #endregion
    }
}