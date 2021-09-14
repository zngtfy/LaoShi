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

using SKG.Req;
using System.Collections.Generic;
using System.Linq;

namespace YEX.BLL.Req
{
    using DAL.Models;

    /// <summary>
    /// Function request
    /// </summary>
    public class FunctionReq : BaseReq<Function>
    {
        #region -- Overrides --

        /// <summary>
        /// Convert the request to the model
        /// </summary>
        /// <param name="createdBy">Created by</param>
        /// <returns>Return the result</returns>
        public override Function ToModel(int? createdBy = null)
        {
            var res = new Function
            {
                Id = Id,
                Code = Code,
                Description = Description,
                CreatedBy = createdBy
            };

            return res;
        }

        #endregion

        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public FunctionReq() { }

        /// <summary>
        /// Convert the requests to the models
        /// </summary>
        /// <param name="l">List requests</param>
        /// <param name="createdBy">Created by</param>
        /// <returns>Return the result</returns>
        public static List<Function> ToModel(List<FunctionReq> l, int? createdBy)
        {
            var res = new List<Function>();

            if (l != null)
            {
                res = l.Select(p => p.ToModel(createdBy)).ToList();
            }

            return res;
        }

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