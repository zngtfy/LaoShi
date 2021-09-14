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
    public class StudentController : BaseController
    {
        #region Test
        [HttpPost("student-answer")]
        public IActionResult StudentAnswer([FromBody]StudentAnswersReq req)
        {
            var res = new SingleRsp();
            res = _studentSvc.StudentAnswer(req.ClassAssignmentId, req.ExamId, req.UserId, req.StartTime, req.EndTime, req.ListAns);           
            return Ok(res);
        }

        [HttpPost("get-question-and-answer-for-student")]
        public IActionResult getQuestionAndAnserForStudent([FromBody]ExamReq req)
        {
            var rand = new Random();
            var res = new SingleRsp();
            int follow = rand.Next(1, 4);
            var lst = _studentSvc.getQuestionAndAnserForStudent(req.ExamId, follow);
            res.Data = lst;
            return Ok(res);
        }

        [HttpPost("get-class-assignment-exam")]
        public IActionResult getClassAssignmentExam([FromBody]ClassAssignmentExamReq req)
        {
            var res = new SingleRsp();
            var lst = _studentSvc.getClassAssignmentExam(req.ClassAssignmentId, req.UserId);
            res.Data = lst;
            return Ok(res);
        }
        #endregion

        #region -- Methods --

        [HttpPost("get-teacher-info")]
        public IActionResult GetTeacherInfo([FromBody]IntroReq req)
        {
            var res = new SingleRsp();
            var lst = _studentSvc.getTeacherInfo(req.Id);
            res.Data = lst;
            return Ok(res);
        }

        [HttpPost("load-course-discussion")]
        public IActionResult loadCourseDiscussion([FromBody]ClassDiscussionReq req)
        {
            var res = new SingleRsp();
            var lst = _studentSvc.loadCourseDiscussion(req.ClassId, req.Page.Value, req.Size.Value);
            res.Data = lst;
            return Ok(res);
        }

        [HttpPost("load-course-score")]
        public IActionResult loadCourseScore([FromBody]ClassScoreReq req)
        {
            var res = new SingleRsp();
            var lst = _studentSvc.loadCourseScore(req.ClassId, req.UserId);
            var stu = _studentSvc.getStudentInfoById(req.UserId, req.ClassId);
            var data = new { 
                List = lst,
                Student = stu
            };
            res.Data = data;
            return Ok(res);
        }

        [HttpPost("load-course-discussion-sub")]
        public IActionResult loadCourseDiscussionSub([FromBody]ClassDiscussionReq req)
        {
            var res = new SingleRsp();
            var lst = _studentSvc.getSubComment(req.ParentId.Value, req.ClassId, req.Page.Value, req.Size.Value);
            res.Data = lst;
            return Ok(res);
        }

        [HttpPost("add-discussion")]
        public IActionResult addDiscussion([FromBody]ClassDiscussionReq req)
        {
            var res  = _studentSvc.addComment(req.ClassId, req.Level, req.ParentId, req.Content, req.UserId);            
            return Ok(res);
        }

        [HttpPost("load-current-class")]
        public IActionResult LoadCurrentClass([FromBody]StudentReq req)
        {
            var res = new SingleRsp();
            try
            {
                var lst1 = _studentSvc.getAllCurrentClass(req.UserId, req.Status);   
                var lst2 = _studentSvc.getAllCurrentThesis(req.UserId, req.Status);
                res.Data = new { 
                    AllClasses = lst1,
                    AllThesises = lst2
                };
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
                //res.Data = new { lst = "", detail = "" };
            }

            return Ok(res);
        }

        [HttpPost("go-to-class")]
        public IActionResult GoToClass([FromBody]ClassReq req)
        {
            var res = _studentSvc.CreateClassJwt(req.ClassId);
            return Ok(res);
        }

        [HttpPost("go-to-thesis")]
        public IActionResult GoToThesis([FromBody]ThesisReq req)
        {
            var res = _studentSvc.CreateThesisJwt(req.ThesisId, req.UserId);
            return Ok(res);
        }

        [HttpPost("get-dashboard-for-student")]
        public IActionResult GetDashboardForStudent([FromBody]ClassDashboardReq req)
        {
            var res = new SingleRsp();
            try
            {
                var ann = _studentSvc.getClassAnnouncement(req.ClassId, req.Page.Value, req.Size.Value);
                var sta = _studentSvc.getClassStatistic(req.ClassId);
                var ress = new
                {
                    Announcements = ann,
                    Statistic = sta
                };
                res.Data = ress;
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);              
            }

            return Ok(res);
        }

        [HttpPost("load-more-annoucement")]
        public IActionResult LoadMoreAnnouncement([FromBody]ClassDashboardReq req)
        {
            var res = new SingleRsp();
            var lst = _studentSvc.getClassAnnouncement(req.ClassId, req.Page.Value, req.Size.Value);
            res.Data = lst;
            return Ok(res);
        }

        [HttpPost("load-course-info")]
        public IActionResult LoadCourseInfo([FromBody]ClassDashboardReq req)
        {
            var res = new SingleRsp();
            var lst = _studentSvc.LoadCourseInfo(req.ClassId);
            res.Data = lst;
            return Ok(res);
        }

        [HttpPost("get-student-info")]
        public IActionResult getStudentInfo([FromBody]ClassDashboardReq req)
        {
            var res = new SingleRsp();
            var lst = _studentSvc.getStudentInfo(req.ClassId);
            res.Data = lst;
            return Ok(res);
        }

        [HttpPost("load-course-student")]
        public IActionResult LoadCourseStudent([FromBody]ClassDashboardReq req)
        {
            var res = new SingleRsp();
            var data = _studentSvc.LoadCourseStudent(req.ClassId, req.Page.Value, req.Size.Value);
            res.Data = data;
            return Ok(res);
        }

        [HttpPost("load-course-material")]
        public IActionResult loadCourseMaterial([FromBody]ClassDashboardReq req)
        {
            var res = new SingleRsp();
            var data = _studentSvc.loadCourseMaterial(req.ClassId);
            res.Data = data;
            return Ok(res);
        }

        [HttpPost("load-course-assignment")]
        public IActionResult loadCourseAssignment([FromBody]ClassAssignmentReq req)
        {
            var res = new SingleRsp();
            var data = _studentSvc.loadCourseAssignment(req.ClassId, req.UserId);
            res.Data = data;
            return Ok(res);
        }

        [HttpPost("load-assignment-submission")]
        public IActionResult loadAssignmentSubmission([FromBody]ClassAssignmentReq req)
        {
            var res = new SingleRsp();
            var data = _studentSvc.loadAssignmentSubmission(req.AssignmentId, req.UserId, req.Page.Value, req.Size.Value);
            res.Data = data;
            return Ok(res);
        }

        [HttpPost("load-assignment-submission-next")]
        public IActionResult loadAssignmentSubmissionNext([FromBody]ClassAssignmentReq req)
        {
            var res = new SingleRsp();
            var data = _studentSvc.loadAssignmentSubmissionNext(req.AssignmentId, req.UserId, req.Page.Value, req.Size.Value);
            res.Data = data;
            return Ok(res);
        }

        [HttpPost("load-course-assignment-detail")]
        public IActionResult loadCourseAssignmentDetail([FromBody]ClassAssignmentReq req)
        {
            var res = new SingleRsp();
            var data = _studentSvc.loadCourseAssignmentDetail(req.AssignmentId, req.UserId);
            res.Data = data;
            return Ok(res);
        }

        [HttpPost("load-course-score-config")]
        public IActionResult loadCourseScoreConfig([FromBody]ClassDashboardReq req)
        {
            var res = new SingleRsp();
            var data = _studentSvc.loadCourseScoreConfig(req.ClassId);
            res.Data = data;
            return Ok(res);
        }

        [HttpPost("get-course-assignment-id")]
        public IActionResult getClassAssignment([FromBody]ClassDashboardReq req)
        {
            var res = new SingleRsp();
            var data = _studentSvc.getClassAssignment(req.ClassId);
            res.Data = data;
            return Ok(res);
        }

        [HttpPost("get-course-assignment-submission-id")]
        public IActionResult getClassAssignmentSubmissionId([FromBody]ClassDashboardReq req)
        {
            var res = new SingleRsp();
            var data = _studentSvc.getClassAssignmentSubmissionId(req.ClassId, req.Page.Value, req.Size.Value);
            res.Data = data;
            return Ok(res);
        }

        [HttpPost("get-student-score")]
        public IActionResult getStudentScore([FromBody]StudentScoreReq req)
        {
            var res = new SingleRsp();
            var data = _studentSvc.getStudentScore(req.ClassId, req.StudentId);
            res.Data = data;
            return Ok(res);
        }

        [HttpPost("save-assignment-submission")]
        public IActionResult saveAssignmentSubmission([FromBody]AssignmentSubmissionReq req)
        {
            var res = new SingleRsp();
            int save = _studentSvc.saveAssignmentSubmission(req.ClassAssignmentId, req.UserId, req.SubmissionUrl);
            var subumissions = _studentSvc.loadAssignmentSubmissionNext(req.ClassAssignmentId, req.UserId, 1, req.Size.Value);           
            res.Data = subumissions;
            return Ok(res);
        }

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="s1">Code service</param>
        /// <param name="s2">News service</param>
        /// <param name="s3">Teacher service</param>
        public StudentController(CodeSvc s1, StudentSvc s3)
        {
            _codeSvc = s1;         
            _studentSvc = s3;
        }

        [AllowAnonymous]
        [HttpPost("upload-student-assignment"), DisableRequestSizeLimit]
        public async Task<IActionResult> SaveAndInsertAttachment(List<IFormFile> files)
        {
            var res = new SingleRsp();
            
            var uid = int.Parse(Request.Form["UserId"].ToString());
            var assignId = int.Parse(Request.Form["AssignmentId"].ToString());
            var size = int.Parse(Request.Form["Size"].ToString());
            List<SubmissionAttachment> lst = new List<SubmissionAttachment>();
            // full path to file in temp location    
            foreach (var formFile in files)
            {
                //var filename = formFile.FileName;
                string fname = Guid.NewGuid().ToString();
                var fileExtension = Path.GetExtension(formFile.FileName);
                string ContentType = GetFileContentType(fileExtension);
                var filename = fname + fileExtension;
                string path = GetPathFileUpload(assignId, uid);
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
                    SubmissionAttachment att = new SubmissionAttachment();
                    att.DisplayName = formFile.FileName;
                    att.Extension = fileExtension;
                    att.ContentType = ContentType;
                    att.GuidName = fname;
                    att.Url = folderName;
                    lst.Add(att);
                }
            }
            var res1 = _studentSvc.UploadAssignment(lst, assignId, uid);
            var subumissions = _studentSvc.loadAssignmentSubmissionNext(assignId, uid, 1, size);
            var data = new
            {
                Submissions = subumissions,
                AttachmentList = lst
            };
            res.Data = data;
            return Ok(res);
        }
        
        [AllowAnonymous]
        [HttpPost("download-attachment")]        
        public async Task<IActionResult> downloadAttachmentPost([FromBody]AttachmentReq req)
        {            
            SubmissionAttachment att = _studentSvc.getAttachmentUrl(req.AttachmentId);
            string path = Path.Combine(Directory.GetCurrentDirectory(),att.Url);
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

        [AllowAnonymous]
        [HttpGet("download-attachment/{attachmentId}")]
        public async Task<IActionResult> downloadAttachmentGet(int attachmentId)
        {
            SubmissionAttachment att = _studentSvc.getAttachmentUrl(attachmentId);
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

        private string GetPathFileUpload(int assignId, int uid)
        {
            string str = "Upload";
            string cls = _studentSvc.GetPathFileUpload(assignId, uid);
            str = str + cls;
            var folderPath = Path.Combine(Directory.GetCurrentDirectory(), str);
            if (!Directory.Exists(folderPath))
                Directory.CreateDirectory(folderPath);
            return str;
        }

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
        #endregion

       

        #region -- Fields --

        /// <summary>
        /// Repository to handle the database
        /// </summary>
        private readonly CodeSvc _codeSvc;

        /// <summary>
        /// Repository to handle the database
        /// </summary>
        private readonly StudentSvc _studentSvc;
        #endregion
    }
}