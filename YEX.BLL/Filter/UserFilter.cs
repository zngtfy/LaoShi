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

namespace YEX.BLL.Filter
{
    /// <summary>
    /// User filter
    /// </summary>
    public class UserFilter
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public UserFilter() { }

        #endregion

        #region -- Properties --

        /// <summary>
        /// Email
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// User name
        /// </summary>
        public string UserName { get; set; }

        /// <summary>
        /// FirstName
        /// </summary>
        public string FirstName { get; set; }

        /// <summary>
        /// LastName
        /// </summary>
        public string LastName { get; set; }

        #endregion
    }
}