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

namespace YEX.BLL.Req
{
    /// <summary>
    /// Short message service request
    /// </summary>
    public class SmsReq
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public SmsReq()
        {
            Phone = string.Empty;
            Message = string.Empty;
            User = string.Empty;
            Password = string.Empty;
        }

        #endregion

        #region -- Properties --

        /// <summary>
        /// Phone
        /// </summary>
        public string Phone { get; set; }

        /// <summary>
        /// Message
        /// </summary>
        public string Message { get; set; }

        /// <summary>
        /// User
        /// </summary>
        public string User { get; set; }

        /// <summary>
        /// Password
        /// </summary>
        public string Password { get; set; }

        #endregion
    }
}