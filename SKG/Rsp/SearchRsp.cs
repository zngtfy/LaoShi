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

namespace SKG.Rsp
{
    using Req;

    /// <summary>
    /// Search response
    /// </summary>
    public class SearchRsp : BaseRsp
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="req">Request</param>
        public SearchRsp(PagingReq req) : base()
        {
            Page = req.Page;
            Size = req.Size;
        }

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="message">Message</param>
        public SearchRsp(string message) : base(message) { }

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="message">Message</param>
        /// <param name="titleError">Title error</param>
        public SearchRsp(string message, string titleError) : base(message, titleError) { }

        #endregion

        #region -- Properties --

        /// <summary>
        /// Total records
        /// </summary>
        public int TotalRecords { get; set; }

        /// <summary>
        /// Data
        /// </summary>
        public object Data { get; set; }

        /// <summary>
        /// Page
        /// </summary>
        public int Page { get; private set; }

        /// <summary>
        /// Size
        /// </summary>
        public int Size { get; private set; }

        /// <summary>
        /// Total pages
        /// </summary>
        public int TotalPages
        {
            get
            {
                var t = (float)TotalRecords / Size;
                var res = (int)Math.Ceiling(t);

                return res;
            }
        }

        #endregion
    }
}