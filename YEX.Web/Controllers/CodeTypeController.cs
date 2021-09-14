#region Information
/*
 * Author       : Hao Lee
 * Email        : occbuu@gmail.com
 * Phone        : +84 919 004 169
 * ------------------------------- *
 * Create       : 2019-Dec-19 04:24
 * Update       : 2019-Dec-19 04:24
 * Checklist    : 1.0
 * Status       : Done
 */
#endregion

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SKG.Rsp;

namespace YEX.Web.Controllers
{
    using BLL;
    using BLL.Req;
    using SKG.Req;
    using System;
    using YEX.DAL.Models;

    public class CodeTypeController : BaseController
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="s1">Code service</param>
        /// <param name="s2">News service</param>
        /// <param name="s3">Teacher service</param>
        public CodeTypeController(CodeTypeSvc s1)
        {
            _codeTyprSvc = s1;
        }
               
        [HttpPost("create")]
        public IActionResult Create([FromBody]CodeTypeReq req)
        {
            var res = new SingleRsp();

            CodeType m = _codeTyprSvc.ReadByCode(req.Code);
            if (m != null)
            {
                res.SetError("Exist code");
            }
            else
            {
                m = new CodeType();
                m.Code = req.Code;
                m.DisplayAs = req.DisplayAs;
                m.Sequence = req.Sequence;
                m.CreatedBy = UserId;
                m.CreatedOn = DateTime.Now;

                res  = _codeTyprSvc.CreateNew(m);
            }

            return Ok(res);
        }

        [HttpPost("update")]
        public IActionResult Update([FromBody]CodeTypeReq req)
        {
            var res = new SingleRsp();

            CodeType m = _codeTyprSvc.ReadByCode(req.Code);
            if(m != null)
            {
                m.DisplayAs = req.DisplayAs;
                m.ModifiedBy = UserId;
                m.ModifiedOn = DateTime.Now;
                res = _codeTyprSvc.Update(m);
            }
            else
            {
                res.SetError("Not found type");
            }

            return Ok(res);
        }
        
        [HttpPost("search")]
        public IActionResult Search([FromBody]PagingReq req)
        {
            var res = new SingleRsp();

            var data = _codeTyprSvc.Read(req);
            res.Data = data;

            return Ok(res);
        }

        #endregion

        #region -- Fields --

        /// <summary>
        /// Repository to handle the database
        /// </summary>
        private readonly CodeTypeSvc _codeTyprSvc;

        #endregion
    }
}