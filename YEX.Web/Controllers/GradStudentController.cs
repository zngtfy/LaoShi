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
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.IO;
using System.Web;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Http;

namespace YEX.Web.Controllers
{
    using BLL;
    using BLL.Req;
    using System.Net.Http.Headers;
    using DAL.Models;

    public class GradStudentController : BaseController
    {
        #region Dashboard-Grad
        [HttpPost("get-dashboard-for-grad-student")]
        public IActionResult GetDashboardForGradStudent([FromBody]ThesisReq req)
        {
            var res = new SingleRsp();
            try
            {
                var data = _studentSvc.getThesisStatistic(req.ThesisId, req.UserId);

                res.Data = data;
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }

            return Ok(res);
        }
        #endregion

        #region Thesis-Intro
        [HttpPost("get-thesis-intro")]
        public IActionResult GetThesisInfo([FromBody]ThesisReq req)
        {
            var res = new SingleRsp();
            try
            {
                var data = _studentSvc.GetThesisInfo(req.ThesisId, req.UserId);
                res.Data = data;
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }

            return Ok(res);
        }
        #endregion

        #region Thesis-Doc
        [HttpPost("get-thesis-doc")]
        public IActionResult GetThesisDocument([FromBody]ThesisReq req)
        {
            var res = new SingleRsp();
            try
            {
                var data = _studentSvc.GetThesisDocument(req.ThesisId, req.UserId, req.Page.Value, req.Size.Value);
                res.Data = data;
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }

            return Ok(res);
        }
        #endregion

        #region Thesis-Work
        [HttpPost("get-student-work-type")]
        public IActionResult GetStudentWorkType([FromBody]ThesisReq req)
        {
            var res = new SingleRsp();
            try
            {
                var data = _studentSvc.GetStudentWorkType(req.Type);
                res.Data = data;
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }
            return Ok(res);
        }

        [HttpPost("get-thesis-work")]
        public IActionResult GetThesisWorks([FromBody]ThesisReq req)
        {
            var res = new SingleRsp();
            try
            {
                var data = _studentSvc.GetThesisWorks(req.ThesisId, req.Type, req.UserId, req.Page.Value, req.Size.Value);
                res.Data = data;
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }
            return Ok(res);
        }

        [AllowAnonymous]
        [HttpPost("upload-thesis-work"), DisableRequestSizeLimit]
        public async Task<IActionResult> SaveAndInsertAttachment(List<IFormFile> files)
        {
            var res = new SingleRsp();

            var thesisId = int.Parse(Request.Form["ThesisId"].ToString());
            var uid = int.Parse(Request.Form["UserId"].ToString());
            var workType = Request.Form["WorkType"].ToString();
            var size = int.Parse(Request.Form["Size"].ToString());
            List<ThesisWorkAttachment> lst = new List<ThesisWorkAttachment>();
            // full path to file in temp location    
            foreach (var formFile in files)
            {
                //var filename = formFile.FileName;
                string fname = Guid.NewGuid().ToString();
                var fileExtension = Path.GetExtension(formFile.FileName);
                string ContentType = GetFileContentType(fileExtension);
                var filename = fname + fileExtension;
                string path = GetPathFileUpload(thesisId, workType, uid);
                var folderName = Path.Combine(path, filename);
                var filePath = Path.Combine(Directory.GetCurrentDirectory(), folderName);

                if (formFile.Length > 0)
                {
                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await formFile.CopyToAsync(stream);
                    }
                }

                FileInfo file = new FileInfo(filePath);
                if (file.Exists)
                {
                    ThesisWorkAttachment att = new ThesisWorkAttachment();
                    att.DisplayName = formFile.FileName;
                    att.Extension = fileExtension;
                    att.ContentType = ContentType;
                    att.GuidName = fname;
                    att.Url = folderName;
                    lst.Add(att);
                }
            }
            var res1 = _studentSvc.UploadWorkAttachment(lst, thesisId, workType, uid);
            var works = _studentSvc.GetThesisWorks(thesisId, workType, uid, 1, size);
            var data = new
            {
                NewWork = res1.Data,
                Works = works
            };
            res.Data = data;
            return Ok(res);
        }

        [AllowAnonymous]
        [HttpPost("download-attachment")]
        public async Task<IActionResult> downloadAttachmentPost([FromBody]AttachmentReq req)
        {
            ThesisWorkAttachment att = _studentSvc.getAttachmentUrl(req.AttachmentId);
            string path = Path.Combine(Directory.GetCurrentDirectory(), att.Url);
            string rePath = att.DisplayName;
            //if (!string.IsNullOrEmpty(path))
            //{
            //    return File(path, "multipart/form-data", rePath);
            //}
            var memory = new MemoryStream();
            using (var stream = new FileStream(path, FileMode.Open))
            {
                await stream.CopyToAsync(memory);
            }
            memory.Position = 0;
            return File(memory, "multipart/form-data", rePath);
        }
        #endregion

        #region Thesis-Reference
        [HttpPost("get-thesis-ref")]
        public IActionResult GetThesisReference([FromBody]ThesisRefReq req)
        {
            var res = new SingleRsp();
            try
            {
                var data = _studentSvc.GetThesisReference(req.Keyword, req.ThesisId, req.Page.Value, req.Size.Value, req.SortCode);
                res.Data = data;
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }

            return Ok(res);
        }
        #endregion


        #region construction
        public GradStudentController(CodeSvc s1, TeacherSvc s2, GradStudentSvc s3)
        {
            _codeSvc = s1;
            _teacherSvc = s2;
            _studentSvc = s3;
        }
        #endregion

        private string GetFileContentType(string ext)
        {
            switch (ext.ToLower())
            {
                case ".doc": return "application/msword";
                case ".docx": return "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
                case ".xls": return "application/vnd.ms-excel";
                case ".xlsx": return "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                case ".pps": return "application/vnd.ms-powerpoint";
                case ".ppt": return "application/vnd.ms-powerpoint";
                case ".pptx": return "application/vnd.openxmlformats-officedocument.presentationml.presentation";
                case ".pdf": return "application/pdf";
                case ".txt": return "text/plain";
                case ".bmp": return "image/bmp";
                case ".png": return "image/png";
                case ".gif": return "image/gif";
                case ".jpeg": return "image/jpeg";
                case ".jpg": return "image/jpeg";
                case ".tar": return "application/x-tar";
                case ".zip": return "application/x-zip-compressed";
                case ".xlsm": return "application/vnd.ms-excel.sheet.macroenabled.12";
            }
            return string.Empty;
        }
        private string GetPathFileUpload(int thesisId, string Worktype, int uid)
        {
            string str = "Upload";
            string cls = _studentSvc.GetPathFileUpload(thesisId, Worktype,  uid);
            str = str + cls;
            var folderPath = Path.Combine(Directory.GetCurrentDirectory(), str);
            if (!Directory.Exists(folderPath))
                Directory.CreateDirectory(folderPath);
            return str;
        }
        #region -- Fields --

        /// <summary>
        /// Repository to handle the database
        /// </summary>
        private readonly CodeSvc _codeSvc;

        /// <summary>
        /// Repository to handle the database
        /// </summary>
        private readonly TeacherSvc _teacherSvc;

        /// <summary>
        /// Repository to handle the database
        /// </summary>
        private readonly GradStudentSvc _studentSvc;
        #endregion
    }
}