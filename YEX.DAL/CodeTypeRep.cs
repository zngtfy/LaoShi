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

using SKG.DAL;
using System.Linq;


namespace YEX.DAL
{
    using Models;

    /// <summary>
    /// Code type repository
    /// </summary>
    public class CodeTypeRep : GenericRep<ZContext, CodeType>
    {
        #region -- Overrides --


        /// <summary>
        /// Remove and not restore
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Number of affect</returns>
        public string Remove(string code)
        {
            var m = base.All.First(i => i.Code == code);
            m = base.Delete(m); //TODO
            return m.Code;
        }

        #endregion

        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>

        #endregion
    }
}
