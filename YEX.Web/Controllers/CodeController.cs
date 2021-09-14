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
    using System.Collections.Generic;
    using System.Drawing;
    using System.Drawing.Drawing2D;
    using System.IO;
    using System.Linq;
    using YEX.DAL.Models;

    public class CodeController : BaseController
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="s1">Code service</param>
        /// <param name="s2">News service</param>
        /// <param name="s3">Teacher service</param>
        public CodeController(CodeSvc s1)
        {
            _codeSvc = s1;
        }

        [AllowAnonymous]
        [HttpPost("create")]
        public IActionResult Create([FromBody]CodeReq req)
        {
            var res = new SingleRsp();

            Code m = new Code();
            m = new Code();
            m.Status = 1;
            m.CodeType = req.CodeType;

            var isImageType = req.CodeType.ToLower().Contains("image") || req.CodeType.ToLower().Contains("banner");
            if (isImageType && req.ImageBase64 != null)
            {
                m.Value = _codeSvc.UploadImage(req.ImageBase64, req.CodeType);
            }
            else if (!isImageType)
            {
                m.Value = req.Value;
            }

            m.DisplayAs = req.DisplayAs;
            m.Sequence = req.Sequence;
            m.CreatedBy = UserId;
            m.CreatedOn = DateTime.Now;

            res = _codeSvc.CreateNew(m);

            return Ok(res);
        }

        [AllowAnonymous]
        [HttpPost("update")]
        public IActionResult Update([FromBody]CodeReq req)
        {
            var res = new SingleRsp();

            Code m = _codeSvc.ReadById(req.Id);
            if (m != null)
            {
                var isImageType = req.CodeType.ToLower().Contains("image") || req.CodeType.ToLower().Contains("banner");

                if (isImageType && req.Value != m.Value && req.ImageBase64 != null)
                {
                    m.Value = _codeSvc.UploadImage(req.ImageBase64, req.CodeType);
                }
                else if (!isImageType)
                {
                    m.Value = req.Value;
                }

                m.DisplayAs = req.DisplayAs;
                m.ModifiedOn = DateTime.Now;

                res = _codeSvc.UpdateNew(m);
            }
            else
            {
                res.SetError("Not found code");
            }

            return Ok(res);
        }

        [HttpPost("search")]
        public IActionResult Search([FromBody]PagingReq req)
        {
            var res = new SearchRsp(req);
            res = _codeSvc.Read(req);

            return Ok(res);
        }

        [HttpPost("search-by-types")]
        public IActionResult SearchByTypes([FromBody]SimpleReq req)
        {
            var res = new MultipleRsp();
            var types = req.Keyword.Split(";");
            res = _codeSvc.ReadByCodeType(new List<string>(types));

            return Ok(res);
        }

        #endregion

        #region -- Fields --

        /// <summary>
        /// Repository to handle the database
        /// </summary>
        private readonly CodeSvc _codeSvc;

        #endregion
    }
}