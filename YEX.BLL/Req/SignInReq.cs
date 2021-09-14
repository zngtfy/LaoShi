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
    /// Sign in request
    /// </summary>
    public class SignInReq
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public SignInReq()
        {
            UserName = string.Empty;
            Password = string.Empty;
        }

        #endregion

        #region -- Properties --

        /// <summary>
        /// User name
        /// </summary>
        public string UserName { get; set; }

        /// <summary>
        /// Password
        /// </summary>
        public string Password { get; set; }

        #endregion
    }
}