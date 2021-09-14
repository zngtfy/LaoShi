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
using System.Collections.Generic;
using System.Linq;

namespace YEX.BLL.Req
{
    using DAL.Models;

    /// <summary>
    /// User request
    /// </summary>
    public class UserReq : BaseReq<User>
    {
        #region -- Overrides --

        /// <summary>
        /// Convert the request to the model
        /// </summary>
        /// <param name="createdBy">Created by</param>
        /// <returns>Return the result</returns>
        public override User ToModel(int? createdBy = null)
        {
            var res = new User
            {
                Id = Id,
                UserName = UserName,
                FirstName = FirstName,
                LastName = LastName,
                Email = Email,
                PasswordHash = Password,
                CreatedBy = createdBy
            };

            return res;
        }

        #endregion

        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public UserReq() { }

        /// <summary>
        /// Convert the requests to the models
        /// </summary>
        /// <param name="l">List requests</param>
        /// <param name="createdBy">Created by</param>
        /// <returns>Return the result</returns>
        public static List<User> ToModel(List<UserReq> l, int? createdBy)
        {
            var res = new List<User>();

            if (l != null)
            {
                res = l.Select(p => p.ToModel(createdBy)).ToList();
            }

            return res;
        }

        #endregion

        #region -- Properties --

        /// <summary>
        /// User name
        /// </summary>
        public string UserName { get; set; }

        /// <summary>
        /// First Name
        /// </summary>
        public string FirstName { get; set; }

        /// <summary>
        /// Last Name
        /// </summary>
        public string LastName { get; set; }

        /// <summary>
        /// Email
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// Phone
        /// </summary>
        public string Phone { get; set; }

        /// <summary>
        /// Address
        /// </summary>
        public string Address { get; set; }

        /// <summary>
        /// Password
        /// </summary>
        public string Password { get; set; }

        /// <summary>
        /// Base64 avatar
        /// </summary>
        public string Base64Avatar { get; set; }

        /// <summary>
        /// Url avatar
        /// </summary>
        public string UrlAvatar { get; set; }

        #endregion
    }
}