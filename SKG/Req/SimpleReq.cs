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

namespace SKG.Req
{
    using DAL.Models;

    /// <summary>
    /// Simple request
    /// </summary>
    public class SimpleReq : BaseReq<BaseModel>
    {
        #region -- Overrides --

        /// <summary>
        /// Convert the request to the model
        /// </summary>
        /// <param name="createdBy">Created by</param>
        /// <returns>Return the result</returns>
        public override BaseModel ToModel(int? createdBy = null)
        {
            return new BaseModel(Id);
        }

        #endregion

        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public SimpleReq() : base() { }

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="id">ID</param>
        public SimpleReq(int id) : base(id) { }

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="keyword">Keyword</param>
        public SimpleReq(string keyword) : base(keyword) { }

        #endregion
    }
}