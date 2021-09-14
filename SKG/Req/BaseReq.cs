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
    /// <summary>
    /// Base request
    /// </summary>
    /// <typeparam name="T">Model class type</typeparam>
    public abstract class BaseReq<T>
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public BaseReq()
        {
            Keyword = string.Empty;
        }

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="id">ID</param>
        public BaseReq(int id)
        {
            Id = id;
        }

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="keyword">Keyword</param>
        public BaseReq(string keyword)
        {
            Keyword = keyword;
        }

        /// <summary>
        /// Convert the request to the model
        /// </summary>
        /// <param name="createdBy">Created by</param>
        /// <returns>Return the result</returns>
        public abstract T ToModel(int? createdBy = null);

        #endregion

        #region -- Properties --

        /// <summary>
        /// ID
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Keyword
        /// </summary>
        public string Keyword { get; set; }

        #endregion
    }
}