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

namespace SKG.DAL.Models
{
    /// <summary>
    /// Base model
    /// </summary>
    public class BaseModel
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="id">ID</param>
        public BaseModel(int id)
        {
            Id = id;
        }

        #endregion

        #region -- Properties --

        /// <summary>
        /// ID
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Status
        /// </summary>
        public Enum Status { get; set; }

        /// <summary>
        /// Created by
        /// </summary>
        public int? CreatedBy { get; set; }

        /// <summary>
        /// Created on
        /// </summary>
        public DateTime? CreatedOn { get; set; }

        /// <summary>
        /// Modified by
        /// </summary>
        public int? ModifiedBy { get; set; }

        /// <summary>
        /// Modified on
        /// </summary>
        public DateTime? ModifiedOn { get; set; }

        #endregion
    }
}