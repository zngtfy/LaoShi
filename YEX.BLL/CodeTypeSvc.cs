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

using Newtonsoft.Json;
using SKG;
using SKG.BLL;
using SKG.Ext;
using SKG.Req;
using SKG.Rsp;
using System;
using System.Collections.Generic;
using System.Linq;


namespace YEX.BLL
{
    using DAL;
    using DAL.Models;
    using SKG.Ext;
    using System;
    using YEX.BLL.Filter;

    /// <summary>
    /// Code type service
    /// </summary>
    public class CodeTypeSvc : GenericSvc<CodeTypeRep, CodeType>
    {
        #region -- Overrides --

        /// <summary>
        /// Create the code type
        /// </summary>
        /// <param name="m">The code type</param>
        /// <returns>Return the result</returns>
        public override SingleRsp Create(CodeType m)
        {
            m.Status = (short)YEnum.Status.Normal;
            return base.Create(m);
        }

        /// <summary>
        /// Update the code type
        /// </summary>
        /// <param name="m">The code type</param>
        /// <returns>Return the result</returns>
        public override SingleRsp Update(CodeType m)
        {
            return base.Update(m);
        }

        /// <summary>
        /// Delete the code type
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Return the result</returns>
        public override SingleRsp Delete(int id)
        {
            return Delete(id);
        }

        /// <summary>
        /// Read By KeyWord with paging
        /// </summary>
        /// <param name="req"></param>
        /// <returns></returns>
        public override SearchRsp Read(PagingReq req)
        {
            var res = new SearchRsp(req);

            try
            {
                // Get data
                var filter = new CodeTypeFilter();
                if (req.Filter != null)
                {
                    filter = JsonConvert.DeserializeObject<CodeTypeFilter>(req.Filter.ToString());
                }
                var page = req.Page;
                var size = req.Size;
                var offset = (page - 1) * size;
                var query = All;

                #region -- Filter --

                //if (!string.IsNullOrEmpty(filter.CodeTypeType))
                //{
                //    query = query.Where(p => p.CodeTypeType.Contains(filter.CodeTypeType));
                //}

                #endregion

                res.TotalRecords = query.Count();

                if (req.Paging)
                {
                    query = query.OrderByDescending(p => p.Code)
                        .Sort(req.Sort)
                        .Skip(offset)
                        .Take(size);
                }

                var t = query.ToList()
                    .Select(p => new
                    {
                        p.Code,
                        p.DisplayAs,
                        p.Sequence,
                        p.CreatedOn,
                        p.Status
                    });

                res.Data = t;
            }
            catch (Exception ex)
            {
                res.SetError(ex.StackTrace);
            }

            return res;
        }

        #endregion

        #region -- Methods --
        public SingleRsp CreateNew(CodeType m)
        {
            SingleRsp res = new SingleRsp();
            m.Status = (short)YEnum.Status.Normal;
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.CodeType.Add(m);
                        context.SaveChanges();
                        tran.Commit();
                        res.Data = m;
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            return res;
        }

        public SingleRsp UpdateNew(CodeType m)
        {
            SingleRsp res = new SingleRsp();
            m.Status = (short)YEnum.Status.Normal;
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.CodeType.Update(m);
                        context.SaveChanges();
                        tran.Commit();
                        res.Data = m;
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            return res;
        }
        /// <summary>
        /// Initialize
        /// </summary>
        public CodeTypeSvc()
        {
        }

        /// <summary>
        /// Read by code
        /// </summary>
        /// <param name="code">Code</param>
        /// <returns>Return the object</returns>
        public CodeType ReadByCode(string code)
        {
            var m = All.Where(m => m.Code == code).FirstOrDefault();
            return m;
        }

        #endregion

        #region -- Fields --

        #endregion
    }
}
