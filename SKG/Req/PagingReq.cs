#region Information
/*
 * Author       : ZngTfy
 * Email        : toan.nguyen@tanvieta.co
 * Phone        : +84 345 515 010
 * ------------------------------- *
 * Create       : 2019-Nov-29 17:24
 * Update       : 2019-Nov-29 17:24
 * Checklist    : 1.0
 * Status       : Done
 */
#endregion

using System.Collections.Generic;

namespace SKG.Req
{
    using DAL.Dto;

    /// <summary>
    /// Paging request (support paging on server)
    /// </summary>
    public class PagingReq
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public PagingReq()
        {
            Page = 1;
            Size = 1;
            Sort = new List<SortDto>();
            Filter = null;
            Paging = true;
        }

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="filter">Filter</param>
        /// <param name="sort">Sort</param>
        public PagingReq(object filter, List<SortDto> sort) : this()
        {
            Filter = filter;
            Sort = sort;
        }

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="filter">Filter</param>
        /// <param name="sort">Sort</param>
        /// <param name="paging">Paging</param>
        public PagingReq(object filter, List<SortDto> sort, bool paging) : this()
        {
            Filter = filter;
            Sort = sort;
            Paging = paging;
        }

        #endregion

        #region -- Properties --

        /// <summary>
        /// Page
        /// </summary>
        public int Page
        {
            get
            {
                return page;
            }
            set
            {
                if (value < 1)
                {
                    value = 1;
                }

                page = value;
            }
        }

        /// <summary>
        /// Size
        /// </summary>
        public int Size
        {
            get
            {
                return size;
            }
            set
            {
                if (value < 1)
                {
                    value = 1;
                }

                size = value;
            }
        }

        /// <summary>
        /// Sort
        /// </summary>
        public List<SortDto> Sort { get; set; }

        /// <summary>
        /// Filter
        /// </summary>
        public object Filter { get; set; }

        /// <summary>
        /// Paging
        /// </summary>
        public bool Paging { get; set; }

        /// <summary>
        /// Current user ID
        /// </summary>
        public int UserId { get; set; }

        #endregion

        #region -- Fields --

        /// <summary>
        /// Page
        /// </summary>
        private int page;

        /// <summary>
        /// Size
        /// </summary>
        private int size;

        #endregion
    }
}