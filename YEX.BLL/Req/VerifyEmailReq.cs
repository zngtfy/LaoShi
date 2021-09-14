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

using SKG.Req;

namespace YEX.BLL.Req
{
    /// <summary>
    /// Verify email request
    /// </summary>
    public class VerifyEmailReq : SimpleReq
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public VerifyEmailReq() { }

        #endregion

        #region -- Properties --

        /// <summary>
        /// Password
        /// </summary>
        public string Password { get; set; }

        /// <summary>
        /// Subject
        /// </summary>
        public string Subject { get; set; }

        /// <summary>
        /// Display name associated with address
        /// </summary>
        public string Display { get; set; }

        /// <summary>
        /// Body 1
        /// </summary>
        public string Body1 { get; set; }

        /// <summary>
        /// Body 2
        /// </summary>
        public string Body2 { get; set; }

        /// <summary>
        /// Body 3
        /// </summary>
        public string Body3 { get; set; }

        #endregion
    }
}