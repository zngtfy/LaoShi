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

using SKG;
using SKG.Ext;
using System.Collections.Generic;

namespace YEX.DAL.Dto
{
    /// <summary>
    /// Right data transfer object
    /// </summary>
    public class RightDto
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public RightDto()
        {
            Children = new List<RightDto>();
        }

        #endregion

        #region -- Properties --

        /// <summary>
        /// Id
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// ParentId
        /// </summary>
        public int? ParentId { get; set; }

        /// <summary>
        /// Code
        /// </summary>
        public string Code { get; set; }

        /// <summary>
        /// Route
        /// </summary>
        public string Route
        {
            get
            {
                var t = Code.ToAddSpace();
                t = t.Replace(ZConst.String.Space, ZConst.String.Minus);
                return t.ToLower();
            }
        }

        /// <summary>
        /// Description
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// Sequence
        /// </summary>
        public int? Sequence { get; set; }

        /// <summary>
        /// Children
        /// </summary>
        public List<RightDto> Children { get; set; }

        #endregion
    }
}