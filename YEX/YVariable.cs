#region Information
/*
 * Author       : ZngTfy
 * Email        : toan.nguyen@tanvieta.co
 * Phone        : +84 345 515 010
 * ------------------------------- *
 * Create       : 2020-Jan-08 20:16
 * Update       : 2020-Jan-08 20:16
 * Checklist    : 1.0
 * Status       : Done
 */
#endregion

using SKG;
using System;

namespace YEX
{
    /// <summary>
    /// Environment variable
    /// </summary>
    public class YVariable : ZVariable
    {
        #region -- Properties --

        /// <summary>
        /// Host
        /// </summary>
        public static string Host
        {
            get
            {
                var res = Environment.GetEnvironmentVariable(Prefix + "HOST");
                return res;
            }
        }

        #endregion
    }
}