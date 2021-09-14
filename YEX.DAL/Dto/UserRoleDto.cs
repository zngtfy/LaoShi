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
    /// UserRole data transfer object
    /// </summary>
    public partial class UserRoleDto
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="m">Model</param>
        public UserRoleDto(UserRole m)
        {
            if (m != null)
            {
                Id = m.Id;
                UserId = m.UserId;
                RoleId = m.RoleId;
                Description = m.Description;
            }
        }

        /// <summary>
        /// Convert list model to list data transfer object
        /// </summary>
        /// <param name="l">List model</param>
        /// <returns>Return the result</returns>
        public static List<UserRoleDto> ToDto(List<UserRole> l)
        {
            var res = new List<UserRoleDto>();

            foreach (var i in l)
            {
                res.Add(new UserRoleDto(i));
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
        /// User ID
        /// </summary>
        public int? UserId { get; set; }

        /// <summary>
        /// Role ID
        /// </summary>
        public int? RoleId { get; set; }

        /// <summary>
        /// Description
        /// </summary>
        public string Description { get; set; }

        #endregion
    }
}