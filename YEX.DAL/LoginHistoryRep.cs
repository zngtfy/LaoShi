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
using SKG.DAL.Dto;
using SKG.Ext;
using System.Collections.Generic;
using System.Linq;

namespace YEX.DAL
{
    using Models;

    /// <summary>
    /// Login history repository
    /// </summary>
    public class LoginHistoryRep : GenericRep<ZContext, LoginHistory>
    {
        #region -- Overrides --

        /// <summary>
        /// Read single object
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Return the object</returns>
        public override LoginHistory Read(int id)
        {
            var res = All.FirstOrDefault(p => p.Id == id);
            return res;
        }

        /// <summary>
        /// Read single object
        /// </summary>
        /// <param name="code">Secondary key</param>
        /// <returns>Return the object</returns>
        public override LoginHistory Read(string code)
        {
            var t = code.ToGuid();
            var res = All.FirstOrDefault(p => p.Uuid == t);
            return res;
        }

        #endregion

        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public LoginHistoryRep() { }

        /// <summary>
        /// Update sign out on
        /// </summary>
        /// <param name="id">User name or UUID</param>
        /// <param name="all">If true update by user name, else update by UUID</param>
        /// <returns>Return the result</returns>
        public int UpdateSignOutOn(string id, bool all)
        {
            int res;

            var sql = "UPDATE System.LoginHistory SET SignOutOn = GETDATE()";
            if (all)
            {
                sql += ", SingleSession = 1 WHERE UserName = @id AND SignOutOn IS NULL";
                var ol = new List<ParameterDto> { new ParameterDto("@id", id) };
                res = Context.Database.ExecuteNonQuery(sql, ol);
            }
            else
            {
                sql += " WHERE Uuid = @id";
                var ol = new List<ParameterDto> { new ParameterDto("@id", id.ToGuid()) };
                res = Context.Database.ExecuteNonQuery(sql, ol);
            }

            return res;
        }

        #endregion
    }
}