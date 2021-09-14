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
    /// Password history repository
    /// </summary>
    public class PasswordHistoryRep : GenericRep<ZContext, PasswordHistory>
    {
        #region -- Overrides --

        /// <summary>
        /// Read single object
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Return the object</returns>
        public override PasswordHistory Read(int id)
        {
            var res = All.FirstOrDefault(p => p.Id == id);
            return res;
        }

        #endregion

        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public PasswordHistoryRep() { }

        #endregion
    }
}