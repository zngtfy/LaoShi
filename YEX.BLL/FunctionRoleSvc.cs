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

using SKG;
using SKG.BLL;
using SKG.Ext;
using SKG.Rsp;
using System.Collections.Generic;

namespace YEX.BLL
{
    using DAL;
    using DAL.Dto;
    using DAL.Models;

    /// <summary>
    /// FunctionRole service
    /// </summary>
    public class FunctionRoleSvc : GenericSvc<FunctionRoleRep, FunctionRole>
    {
        #region -- Overrides --

        /// <summary>
        /// Create
        /// </summary>
        /// <param name="m">The model</param>
        /// <returns>Return the result</returns>
        public override SingleRsp Create(FunctionRole m)
        {
            var res = new SingleRsp();

            var m1 = _rep.Read(m.Description);
            if (m1 != null)
            {
                res.SetError(YCode.EZ102, "Existing data.");
            }
            else
            {
                res = base.Create(m);
                res.Data = new FunctionRoleDto(m);
            }

            return res;
        }

        /// <summary>
        /// Create the models
        /// </summary>
        /// <param name="l">List model</param>
        /// <returns>Return the result</returns>
        public override MultipleRsp Create(List<FunctionRole> l)
        {
            var res = new MultipleRsp();
            var lErr = new List<FunctionRoleDto>();
            var lOki = new List<FunctionRole>();

            if (l.Count > ZConst.MaxSize.DataList)
            {
                var t = ZCode.EZ998 + ZConst.String.Space + ZConst.MaxSize.DataList;
                res.SetError(t);
                return res;
            }

            foreach (var i in l)
            {
                var m = _rep.Read(i.Description);
                if (m != null)
                {
                    lErr.Add(new FunctionRoleDto(i));
                }
                else
                {
                    lOki.Add(i);
                }
            }

            if (lOki.Count > 0)
            {
                res = base.Create(lOki);
                res.SetSuccess(FunctionRoleDto.ToDto(lOki), string.Empty);
            }

            if (lErr.Count > 0)
            {
                res.SetFailure(lErr, YCode.EZ102);
            }

            return res;
        }

        /// <summary>
        /// Read single object
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Return the object</returns>
        public override SingleRsp Read(int id)
        {
            var res = new SingleRsp();

            var m = _rep.Read(id);
            res.Data = new FunctionRoleDto(m);

            return res;
        }

        /// <summary>
        /// Read single object
        /// </summary>
        /// <param name="code">Secondary key</param>
        /// <returns>Return the object</returns>
        public override SingleRsp Read(string code)
        {
            var res = new SingleRsp();

            var m = _rep.Read(code);
            res.Data = new FunctionRoleDto(m);

            return res;
        }

        /// <summary>
        /// Update
        /// </summary>
        /// <param name="m">The model</param>
        /// <returns>Return the result</returns>
        public override SingleRsp Update(FunctionRole m)
        {
            var res = new SingleRsp();

            var m1 = m.Id > 0 ? _rep.Read(m.Id) : _rep.Read(m.Description);
            if (m1 == null)
            {
                res.SetError(YCode.EZ103, "No data.");
            }
            else
            {
                var ok = m.Differ(m1);
                if (ok)
                {
                    m.Kopy(m1);
                    res = base.Update(m1);
                    res.Data = new FunctionRoleDto(m1);
                }
                else
                {
                    res.SetMessage(YCode.EZ104);
                }
            }

            return res;
        }

        /// <summary>
        /// Update the models
        /// </summary>
        /// <param name="l">List model</param>
        /// <returns>Return the result</returns>
        public override MultipleRsp Update(List<FunctionRole> l)
        {
            var res = new MultipleRsp();
            var lErr = new List<FunctionRoleDto>();
            var lOki = new List<FunctionRole>();

            if (l.Count > ZConst.MaxSize.DataList)
            {
                var t = ZCode.EZ998 + ZConst.String.Space + ZConst.MaxSize.DataList;
                res.SetError(t);
                return res;
            }

            foreach (var i in l)
            {
                var m = i.Id > 0 ? _rep.Read(i.Id) : _rep.Read(i.Description);
                if (m == null)
                {
                    lErr.Add(new FunctionRoleDto(i));
                }
                else
                {
                    var ok = i.Differ(m);
                    if (ok)
                    {
                        i.Kopy(m);
                        lOki.Add(m);
                    }
                    else
                    {
                        lErr.Add(new FunctionRoleDto(i));
                    }
                }
            }

            if (lOki.Count > 0)
            {
                res = base.Update(lOki);
                res.SetSuccess(FunctionRoleDto.ToDto(lOki), string.Empty);
            }

            if (lErr.Count > 0)
            {
                var t = ZConst.Format.Slash;
                t = string.Format(t, YCode.EZ103, YCode.EZ104);

                res.SetFailure(lErr, t);
            }

            return res;
        }

        /// <summary>
        /// Delete single object
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Return the result</returns>
        public override SingleRsp Delete(int id)
        {
            return Update(id, null, true);
        }

        /// <summary>
        /// Delete single object
        /// </summary>
        /// <param name="id">Secondary key</param>
        /// <returns>Return the result</returns>
        public override SingleRsp Delete(string code)
        {
            return Update(null, code, true);
        }

        /// <summary>
        /// Restore the model
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Return the result</returns>
        public override SingleRsp Restore(int id)
        {
            return Update(id, null, false);
        }

        /// <summary>
        /// Restore the model
        /// </summary>
        /// <param name="id">Secondary key</param>
        /// <returns>Return the result</returns>
        public override SingleRsp Restore(string code)
        {
            return Update(null, code, false);
        }

        #endregion

        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public FunctionRoleSvc() { }

        /// <summary>
        /// Update
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <param name="code">Secondary key</param>
        /// <param name="isDeleted">Is deleted</param>
        /// <returns>Return the result</returns>
        private SingleRsp Update(int? id, string code, bool isDeleted)
        {
            var res = new SingleRsp();

            var m = id == null ? _rep.Read(code) : _rep.Read(id.Value);
            if (m == null)
            {
                res.SetError(YCode.EZ103, "No data.");
            }
            else
            {
                var status = isDeleted ? YEnum.Status.Deleted : YEnum.Status.Normal;
                m.Status = (short)status;
                res = base.Update(m);
            }

            return res;
        }

        #endregion
    }
}