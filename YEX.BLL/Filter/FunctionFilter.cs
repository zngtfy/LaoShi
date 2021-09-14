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

namespace YEX.BLL.Filter
{
    /// <summary>
    /// Function filter
    /// </summary>
    public class FunctionFilter
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public FunctionFilter() { }

        #endregion

        #region -- Properties --

        /// <summary>
        /// Code
        /// </summary>
        public string Code { get; set; }

        /// <summary>
        /// Description
        /// </summary>
        public string Description { get; set; }

        #endregion
    }
}