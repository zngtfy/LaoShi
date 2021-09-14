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
    using System;
    using System.IO;
    using YEX.DAL.Models;

    public class HomeController : BaseController
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="s1">Code service</param>
        /// <param name="s2">News service</param>
        /// <param name="s3">Teacher service</param>
        public HomeController(CodeSvc s1, NewsSvc s2, TeacherSvc s3)
        {
            _codeSvc = s1;
            _newsSvc = s2;
            _teacherSvc = s3;
        }

        [HttpPost("create-news")]
        public IActionResult CreateNews([FromBody]NewsReq req)
        {
            var res = new SingleRsp();

            News m = new News();
            m.Title = req.Title;
            m.Brief = req.Brief;
            m.Content = req.Content;
            m.Category = req.Category;
            m.NewsType = req.NewsType;
            m.Group = req.Group;

            // Add Featured images
            var originalUrl = _newsSvc.UploadImage(req.ImageBase64);
            m.ImgUrl = originalUrl;

            var thumbnailUrl = originalUrl.Replace(Path.GetFileName(originalUrl), Path.GetFileName(originalUrl).Replace("big", "small"));
            m.Thumbnail = thumbnailUrl;

            m.NewsBy = UserId;
            m.CreatedBy = UserId;
            m.CreatedOn = DateTime.Now;

            res = _newsSvc.CreateNew(m);

            return Ok(res);
        }

        [HttpPost("update-news")]
        public IActionResult UpdateNews([FromBody]NewsReq req)
        {
            var res = new SingleRsp();

            News m = _newsSvc.ReadById(req.Id);
            if (m != null)
            {
                m.Title = req.Title;
                m.Brief = req.Brief;
                m.Content = req.Content;
                m.Category = req.Category;
                m.NewsType = req.NewsType;

                // Update Featured images
                if (req.ImgUrl != m.ImgUrl && req.ImageBase64 != null)
                {
                    var originalUrl = _newsSvc.UploadImage(req.ImageBase64);
                    m.ImgUrl = originalUrl;

                    var thumbnailUrl = originalUrl.Replace(Path.GetFileName(originalUrl), Path.GetFileName(originalUrl).Replace("big", "small"));
                    m.Thumbnail = thumbnailUrl;
                }

                m.ModifiedBy = UserId;
                m.ModifiedOn = DateTime.Now;

                res = _newsSvc.UpdateNew(m);
            }
            else
            {
                res.SetError("Not found news");
            }

            return Ok(res);
        }

        /// <summary>
        /// Create
        /// </summary>
        /// <param name="req">Request</param>
        /// <returns>Return the result</returns>
        [AllowAnonymous]
        [HttpPost("load-first-enter")]
        public IActionResult LoadFirstEnter([FromBody]HomeReq req)
        {
            var res = new SingleRsp();
            try
            {
                var lBanner = _codeSvc.Read(p => p.CodeType == "HomeBanner");
                var lNews = _newsSvc.getLatestNews(req);
                var ress = new
                {
                    lsBanner = lBanner,
                    lsNews = lNews
                };
                res.Data = ress;
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
                //res.Data = new { lst = "", detail = "" };
            }

            return Ok(res);
        }

        [AllowAnonymous]
        [HttpPost("load-image-intro")]
        public IActionResult LoadImageByCodeType([FromBody]HomeReq req)
        {
            var res = new SingleRsp();
            try
            {
                var images = _codeSvc.LoadImageByCodeType("ImageIntro");
                res.Data = images;
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
                //res.Data = new { lst = "", detail = "" };
            }
            return Ok(res);
        }

        [AllowAnonymous]
        [HttpPost("load-image-gallery")]
        public IActionResult LoadImageGallery([FromBody]HomeReq req)
        {
            var res = new SingleRsp();
            try
            {
                var lBanner = _codeSvc.LoadImageGallery();
                res.Data = lBanner;
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
                //res.Data = new { lst = "", detail = "" };
            }
            return Ok(res);
        }

        /// <summary>
        /// Load Code Table
        /// </summary>
        /// <param name="req">Request</param>
        /// <returns>Return the result</returns>
        [AllowAnonymous]
        [HttpPost("load-more-news")]
        public IActionResult LoadMoreNews([FromBody]HomeReq req)
        {
            var res = new SingleRsp();
            var lst = _newsSvc.getLatestNews(req);
            res.Data = lst;
            return Ok(res);
        }


        [HttpPost("get-teacher-info")]
        public IActionResult GetTeacherInfo([FromBody]IntroReq req)
        {
            var res = new SingleRsp();
            var lst = _teacherSvc.getTeacherInfo(req.Id);
            res.Data = lst;
            return Ok(res);
        }

        [HttpPost("get-teacher-edu-all")]
        public IActionResult GetTeacherEduAll([FromBody]IntroReq req)
        {
            var res = new SingleRsp();
            var lst1 = _teacherSvc.getTeacherEdu(req.Id, "Under-Graduate", req.Page, req.Size);
            var lst2 = _teacherSvc.getTeacherEdu(req.Id, "Post-Graduate", req.Page, req.Size);
            var lst3 = _teacherSvc.getTeacherEdu(req.Id, "Doctoral", req.Page, req.Size);

            res.Data = new
            {
                Graduate = lst1,
                PostGraduate = lst2,
                Doctoral = lst3
            };
            return Ok(res);
        }

        [HttpPost("get-teacher-edu")]
        public IActionResult getTeacherEdu([FromBody]IntroReq req)
        {
            var res = new SingleRsp();
            var lst = _teacherSvc.getTeacherEdu(req.Id, req.Type, req.Page, req.Size);

            res.Data = lst;
            return Ok(res);
        }

        [HttpPost("get-teacher-exp")]
        public IActionResult getTeacherExp([FromBody]IntroReq req)
        {
            var res = new SingleRsp();
            var lst = _teacherSvc.getTeacherExp(req.Id, req.Type, req.Page, req.Size);

            res.Data = lst;
            return Ok(res);
        }


        [HttpPost("get-teacher-exp-all")]
        public IActionResult GetTeacherExpAll([FromBody]IntroReq req)
        {
            var res = new SingleRsp();
            var working = _teacherSvc.getTeacherExp(req.Id, "Working", req.Page, req.Size);
            var teaching = _teacherSvc.getTeacherExp(req.Id, "Teaching", req.Page, req.Size);

            res.Data = new
            {
                Working = working,
                Teaching = teaching
            };
            return Ok(res);
        }


        [HttpPost("get-teacher-major")]
        public IActionResult GetTeacherMajor([FromBody]IntroReq req)
        {
            var res = new SingleRsp();
            var lst = _teacherSvc.getTeacherMajor(req.Id, req.Page, req.Size);

            res.Data = lst;
            return Ok(res);
        }

        [HttpPost("get-teacher-skill")]
        public IActionResult GetTeacherSkill([FromBody]IntroReq req)
        {
            var res = new SingleRsp();
            var lst = _teacherSvc.getTeacherSkill(req.Id, req.Type, req.Page, req.Size);

            res.Data = lst;
            return Ok(res);
        }

        [AllowAnonymous]
        [HttpPost("get-teacher-study")]
        public IActionResult GetTeacherStudy([FromBody]IntroReq req)
        {
            var res = new SingleRsp();
            var lst = _teacherSvc.getTeacherStudy(req.Id, req.Type, req.Page, req.Size);

            res.Data = lst;
            return Ok(res);
        }

        [AllowAnonymous]
        [HttpPost("get-teacher-research-work")]
        public IActionResult GetTeacherResearchWork([FromBody]IntroReq req)
        {
            var res = new SingleRsp();
            var lst = _teacherSvc.getTeacherResearchWork(req.Id, req.Type, req.Keyword, req.Page, req.Size);

            res.Data = lst;
            return Ok(res);
        }

        [AllowAnonymous]
        [HttpPost("get-teacher-delegate-student")]
        public IActionResult GetTeacherDelegateStudent([FromBody]IntroReq req)
        {
            var res = new SingleRsp();
            var lst = _teacherSvc.getTeacherDelegateStudent(req.Id, req.Type, req.Keyword, req.Page, req.Size);

            res.Data = lst;
            return Ok(res);
        }

        [AllowAnonymous]
        [HttpPost("get-teacher-public-profile")]
        public IActionResult GetTeacherPublicProfile([FromBody]IntroReq req)
        {
            var res = new SingleRsp();
            var lst = _teacherSvc.getTeacherPublicProfile(req.Id, req.Type, req.Page, req.Size);
            res.Data = lst;
            return Ok(res);
        }

        [AllowAnonymous]
        [HttpPost("load-request-type")]
        public IActionResult LoadRequestType([FromBody]HomeReq req)
        {
            var res = new SingleRsp();
            try
            {
                var l = _codeSvc.LoadRequestType();
                res.Data = l;
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
                //res.Data = new { lst = "", detail = "" };
            }
            return Ok(res);
        }

        #endregion

        #region -- Fields --

        /// <summary>
        /// Repository to handle the database
        /// </summary>
        private readonly NewsSvc _newsSvc;

        /// <summary>
        /// Repository to handle the database
        /// </summary>
        private readonly CodeSvc _codeSvc;

        /// <summary>
        /// Repository to handle the database
        /// </summary>
        private readonly TeacherSvc _teacherSvc;
        #endregion
    }
}