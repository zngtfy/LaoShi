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

using System.Collections.Generic;

namespace YEX.DAL.Dto
{
    using Models;

    /// <summary>
    /// User data transfer object
    /// </summary>
    public partial class UserDto
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="m">Model</param>
        public UserDto(User m)
        {
            if (m != null)
            {
                Id = m.Id;
                UserName = m.UserName;
                FirstName = m.FirstName;
                LastName = m.LastName;
                Email = m.Email;
                Phone = m.Phone;
                Address = m.Address;
            }
        }

        /// <summary>
        /// Convert list model to list data transfer object
        /// </summary>
        /// <param name="l">List model</param>
        /// <returns>Return the result</returns>
        public static List<UserDto> ToDto(List<User> l)
        {
            var res = new List<UserDto>();

            foreach (var i in l)
            {
                res.Add(new UserDto(i));
            }

            return res;
        }

        #endregion

        #region -- Properties --

        /// <summary>
        /// ID
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// User name
        /// </summary>
        public string UserName { get; set; }

        /// <summary>
        /// First name
        /// </summary>
        public string FirstName { get; set; }

        /// <summary>
        /// Last name
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

        #endregion
    }
}