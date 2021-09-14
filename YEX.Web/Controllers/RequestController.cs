#region Information
/*
 * Author       : An Nguyen
 * Email        : 
 * Phone        : 
 * ------------------------------- *
 * Create       : 2020-Feb-07 07:24
 * Update       : 2020-Feb-08 06:24
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

    public class RequestController : BaseController
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="s1">Code service</param>
        /// <param name="s2">News service</param>
        /// <param name="s3">Teacher service</param>
        public RequestController(CodeSvc s1, RequestSvc s2)
        {
            _codeSvc = s1;
            _requestSvc = s2;
        }

        [AllowAnonymous]
        [HttpPost("load-request")]
        public IActionResult loadRequest([FromBody]HomeReq req)
        {
            var res = new SingleRsp();
            var lst = _requestSvc.loadRequest(req.Page, req.Size);
            res.Data = lst;
            return Ok(res);
        }
        
        [AllowAnonymous]
        [HttpPost("add-request")]
        public IActionResult addRequest([FromBody]RequestReq req)
        {
            var res = _requestSvc.addRequest(req.RequestType, req.RequestName, req.Content, req.RequestBy);
            return Ok(res);
        }

        [AllowAnonymous]
        [HttpPost("result-request")]
        public IActionResult resultRequest([FromBody]RequestReq req)
        {
            var res = _requestSvc.resultRequest(req.Id, req.ResultBy, req.Result);
            return Ok(res);
        }

        #endregion

        #region -- Fields --

        /// <summary>
        /// Repository to handle the database
        /// </summary>
        private readonly RequestSvc _requestSvc;

        /// <summary>
        /// Repository to handle the database
        /// </summary>
        private readonly CodeSvc _codeSvc;
        #endregion
    }
}