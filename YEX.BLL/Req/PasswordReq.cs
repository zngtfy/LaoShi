#region Information
/*
 * Author       : ZngTfy
 * Email        : toan.nguyen@tanvieta.co
 * Phone        : +84 345 515 010
 * ------------------------------- *
 * Create       : 2020-Jan-11 21:24
 * Update       : 2020-Jan-11 21:24
 * Checklist    : 1.0
 * Status       : Done
 */
#endregion

namespace YEX.BLL.Req
{
    /// <summary>
    /// Password request
    /// </summary>
    public class PasswordReq
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public PasswordReq()
        {
            Id = 0;
            ReminderToken = string.Empty;
            NewPassword = string.Empty;
            OldPassword = string.Empty;
            WithJwt = false;
        }

        #endregion

        #region -- Properties --

        /// <summary>
        /// ID
        /// </summary>
        public int? Id { get; set; }

        /// <summary>
        /// Password reminder token
        /// </summary>
        public string ReminderToken { get; set; }

        /// <summary>
        /// New password
        /// </summary>
        public string NewPassword { get; set; }

        /// <summary>
        /// Old password
        /// </summary>
        public string OldPassword { get; set; }

        /// <summary>
        /// With JWT
        /// </summary>
        public bool WithJwt { get; set; }

        #endregion
    }
}