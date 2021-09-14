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

using SKG.DAL;
using System.Linq;

namespace YEX.DAL
{
    using Models;

    /// <summary>
    /// Role repository
    /// </summary>
    public class RoleRep : GenericRep<ZContext, Role>
    {
        #region -- Overrides --

        /// <summary>
        /// Read single object
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Return the object</returns>
        public override Role Read(int id)
        {
            var res = All.FirstOrDefault(p => p.Id == id);
            return res;
        }

        /// <summary>
        /// Read single object
        /// </summary>
        /// <param name="code">Secondary key</param>
        /// <returns>Return the object</returns>
        public override Role Read(string code)
        {
            var res = All.FirstOrDefault(p => p.Description == code);
            return res;
        }

        #endregion

        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public RoleRep() { }

        #endregion
    }
}