#region Information
/*
 * Author       : HaoLee
 * Email        : occbuu@gmail.com
 * Phone        : +84 919 004 169
 * ------------------------------- *
 * Create       : 2019-Oct-19 04:24
 * Update       : 2019-Oct-19 04:24
 * Checklist    : 1.0
 * Status       : Done
 */
#endregion

namespace YEX.BLL.Filter
{
    public class NewsFilter
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public NewsFilter() { }

        #endregion

        #region -- Properties --

        /// <summary>
        /// Group id
        /// </summary>
        public int? GroupId { get; set; }

        /// <summary>
        /// Category code
        /// </summary>
        public string CategoryCode { get; set; }

        /// <summary>
        /// Type code
        /// </summary>
        public string TypeCode { get; set; }

        /// <summary>
        /// Keyword
        /// </summary>
        public string Keyword { get; set; }

        #endregion
    }
}
