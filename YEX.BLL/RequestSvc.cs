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

using SKG;
using SKG.BLL;
using SKG.Rsp;
using System;
using System.Collections.Generic;
using System.Linq;

namespace YEX.BLL
{
    using DAL;
    using DAL.Models;
    using Req;

    public class RequestSvc : GenericSvc<RequestRep, Request>
    {
        #region -- Overrides --

        /// <summary>
        /// Create the User
        /// </summary>
        /// <param name="m">The User</param>
        /// <returns>Return the result</returns>
        public override SingleRsp Create(Request m)
        {
            m.Status = (short)YEnum.Status.Normal;
            return base.Create(m);
        }

        /// <summary>
        /// Update
        /// </summary>
        /// <param name="m"></param>
        /// <returns>Return the result</returns>
        public override SingleRsp Update(Request m)
        {
            m.Status = (short)YEnum.Status.Normal;
            return base.Update(m);
        }

        /// <summary>
        /// Read single object
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Return the object</returns>
        public override SingleRsp Read(int id)
        {
            var res = new SingleRsp();

            var t = _rep.Read(id);
            res.Data = t;

            return res;
        }

        #endregion

        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public RequestSvc() { }
        public object loadRequest(int page, int size)
        {
            return _rep.loadRequest(page, size);
        }

        public SingleRsp addRequest(string requestType, string requestName, string content, int requestBy)
        {
            var res = new SingleRsp();
            Request req = new Request();
            req.RequestType = requestType;
            req.RequestName = requestName;
            req.Content = content;
            req.Status = 1;
            req.RequestBy = requestBy;
            req.CreatedBy = requestBy;
            req.CreatedOn = DateTime.Now;
            var tran = _rep.Context.Database.BeginTransaction();
            try
            {
                _rep.Context.Request.Add(req);
                _rep.Context.SaveChanges();
                tran.Commit();
            }
            catch (Exception ex)
            {
                tran.Rollback();
                res.SetError(ex.StackTrace);
            }
            return res;
        }

        public SingleRsp resultRequest(int requestId, int resultBy, string result)
        {
            var res = new SingleRsp();
            Request req = _rep.Read(requestId);
            req.Status = 2;
            req.Result = result;
            req.ResultBy = resultBy;
            req.ModifiedBy = resultBy;
            req.ModifiedOn = DateTime.Now;
            var tran = _rep.Context.Database.BeginTransaction();
            try
            {
                _rep.Context.Request.Update(req);
                _rep.Context.SaveChanges();
                tran.Commit();
            }
            catch (Exception ex)
            {
                tran.Rollback();
                res.SetError(ex.StackTrace);
            }
            return res;
        }
        #endregion
    }
}