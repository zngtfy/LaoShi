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
using Microsoft.AspNetCore.Http;
using Syncfusion.XlsIO;
using OfficeOpenXml.Core;
using OfficeOpenXml;

namespace YEX.Web.Controllers
{
    using BLL;
    using BLL.Req;
    using System.Net.Http.Headers;
    using DAL.Models;
    using DAL.Dto;
    using Newtonsoft.Json;
    using OfficeOpenXml.Core.ExcelPackage;
    using System.Globalization;
    using Newtonsoft.Json.Linq;
    using System.Net.Mail;
    using System.Text;
    using System.Drawing;
    using System.Drawing.Imaging;

    public class TeacherController : BaseController
    {
        #region Teacher-Dashboard
        [HttpPost("get-dashboard-for-teacher")]
        public IActionResult GetDashboardForTeacher([FromBody]TeacherReq req)
        {
            var res = new SingleRsp();
            try
            {
                var cls = _teacherSvc.GetClassForTeacher(req.UserId, 1, req.Page.Value, req.Size.Value);
                var thes = _teacherSvc.GetThesisForTeacher(req.UserId, 1, req.Page.Value, req.Size.Value);
                var ress = new
                {
                    Classes = cls,
                    Thesises = thes
                };
                res.Data = ress;
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }

            return Ok(res);
        }

        [HttpPost("get-class-for-teacher")]
        public IActionResult GetClassForTeacher([FromBody]TeacherReq req)
        {
            var res = new SingleRsp();
            try
            {
                var cls = _teacherSvc.GetClassForTeacher(req.UserId, 1, req.Page.Value, req.Size.Value); 
                res.Data = cls;
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }

            return Ok(res);
        }

        [HttpPost("get-thesis-for-teacher")]
        public IActionResult GetThesisForTeacher([FromBody]TeacherReq req)
        {
            var res = new SingleRsp();
            try
            {               
                var thes = _teacherSvc.GetThesisForTeacher(req.UserId, 1, req.Page.Value, req.Size.Value);             
                res.Data = thes;
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }

            return Ok(res);
        }
        #endregion

        #region Teacher-Class-Info
        [HttpPost("get-teacher-all-class")]
        public IActionResult GetTeacherAllClass([FromBody]TeacherClassReq req)
        {
            var res = new SingleRsp();
            try
            {
                var cls = _teacherSvc.GetTeacherAllClass(req.UserId, req.Status.Value);               
                res.Data = cls;
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }

            return Ok(res);
        }

        [HttpPost("get-teacher-class-by-id")]
        public IActionResult GetTeacherClassById([FromBody]TeacherClassReq req)
        {
            var res = new SingleRsp();
            try
            {
                var cls = _teacherSvc.GetTeacherClassById(req.ClassId);
                res.Data = cls;
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }

            return Ok(res);
        }

        [HttpPost("save-teacher-class-info")]
        public IActionResult SaveTeacherClassInfo([FromBody]TeacherClassInfoReq req)
        {
            var res = new SingleRsp();
            try
            {
                Class cls = req.convert();
                res = _teacherSvc.SaveTeacherClassInfo(cls);
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }

            return Ok(res);
        }

        [HttpPost("complete-teacher-class")]
        public IActionResult CompleteClassNext([FromBody]TeacherClassStatusReq req)
        {
            var res = new SingleRsp();
            try
            {                
                res = _teacherSvc.CompleteClassNext(req.ClassId, req.ModifiedBy.Value);
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }

            return Ok(res);
        }

        [HttpPost("delete-teacher-class-session")]
        public IActionResult DeleteTeacherClassSession([FromBody]TeacherClassSessionReq req)
        {
            var res = new SingleRsp();
            try
            {
                res = _teacherSvc.DeleteTeacherClassSession(req.Id, req.ModifiedBy.Value);
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }

            return Ok(res);
        }

        [HttpPost("complete-teacher-class-session")]
        public IActionResult CompleteTeacherClassSession([FromBody]TeacherClassSessionReq req)
        {
            var res = new SingleRsp();
            try
            {
                res = _teacherSvc.CompleteTeacherClassSession(req.Id, req.ModifiedBy.Value);
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }

            return Ok(res);
        }

        [HttpPost("create-teacher-class-session")]
        public IActionResult CreateNewClassSession([FromBody]TeacherClassSessionReq req)
        {
            var res = new SingleRsp();
            try
            {
                var ses = req.convert();
                res = _teacherSvc.CreateNewClassSession(ses);
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }

            return Ok(res);
        }

        [HttpPost("save-teacher-class-session")]
        public IActionResult SaveClassSession([FromBody]TeacherClassSessionReq req)
        {
            var res = new SingleRsp();
            try
            {
                var ses = req.convert();
                res = _teacherSvc.SaveClassSession(ses);
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }

            return Ok(res);
        }
        #endregion

        #region Teacher-Class-Score-Config
        [HttpPost("get-teacher-class-score-config")]
        public IActionResult GetTeacherClassScoreConfig([FromBody]TeacherClassScoreConfigReq req)
        {
            var res = new SingleRsp();
            try
            {
                var sc = _teacherSvc.GetTeacherClassScoreConfig(req.ClassId.Value);
                var assg = _teacherSvc.GetTeacherClassListAssignment(req.ClassId.Value);
                //var stu = _teacherSvc.GetTeacherClassStudentList(req.ClassId.Value);
                res.Data = new { 
                    ScoreConfigs = sc,
                    Assignments = assg,
                    //Students = stu
                };
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }
            return Ok(res);
        }

        [HttpPost("save-teacher-class-score-config")]
        public IActionResult SaveTeacherClassScoreConfig([FromBody]TeacherClassScoreConfigReq req)
        {
            var res = new SingleRsp();
            try
            {
                var sc = req.convert();
                res = _teacherSvc.SaveTeacherClassScoreConfig(sc);              
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }
            return Ok(res);
        }

        [HttpPost("create-teacher-class-score-config")]
        public IActionResult CreateNewClassScoreConfig([FromBody]TeacherClassScoreConfigReq req)
        {
            var res = new SingleRsp();
            try
            {
                var sc = req.convert();
                res = _teacherSvc.CreateNewClassScoreConfig(sc);
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }
            return Ok(res);
        }

        [HttpPost("complete-teacher-class-score-config")]
        public IActionResult CompleteClassScoreConfig([FromBody]TeacherClassScoreConfigReq req)
        {
            var res = new SingleRsp();
            try
            {
                res = _teacherSvc.CompleteClassScoreConfig(req.Id, req.ModifiedBy.Value);
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }

            return Ok(res);
        }

        [HttpPost("delete-teacher-class-score-config")]
        public IActionResult DeleteTeacherClassScoreConfig([FromBody]TeacherClassScoreConfigReq req)
        {
            var res = new SingleRsp();
            try
            {
                res = _teacherSvc.DeleteTeacherClassScoreConfig(req.Id);
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }

            return Ok(res);
        }

        [HttpPost("get-teacher-class-student-score")]
        public IActionResult GetTeacherClassStudentScore([FromBody]TeacherClassScoreConfigReq req)
        {
            var res = new SingleRsp();
            try
            {
                int n = _teacherSvc.CheckClassStudentScore(req.ClassId.Value, req.Id, req.CreatedBy.Value);
                res = _teacherSvc.GetTeacherClassStudentScore(req.ClassId.Value, req.Id);
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }

            return Ok(res);
        }

        [HttpPost("save-teacher-class-student-score")]
        public IActionResult SaveTeacherClassStudentScore([FromBody]List<TeacherClassStudentScorReq> req)
        {
            var res = new SingleRsp();
            try
            {
                List<ClassStudentScore> lst = new List<ClassStudentScore>();
                foreach(var item in req)
                {
                    var score = item.convert();
                    lst.Add(score);
                }
                res = _teacherSvc.SaveTeacherClassStudentScore(lst);
            }
            catch (System.Exception ex)
            {
                res.SetError(ex.Message);
            }

            return Ok(res);
        }
        #endregion

        #region Teacher-Class-Assignment
        [HttpPost("get-teacher-class-assignment")]
        public IActionResult GetTeacherClassAssignment([FromBody]TeacherClassAssignmentReq req)
        {
            var res = new SingleRsp();
            var assign = _teacherSvc.GetTeacherClassAssignment(req.ClassId.Value, req.CreatedBy.Value);
            //var stu = _teacherSvc.GetTeacherClassStudentList(req.ClassId.Value);
            res.Data = assign;
            return Ok(res);
        }

        [AllowAnonymous]
        [HttpPost("save-teacher-class-assignment")]
        public async Task<IActionResult> SaveTeacherClassAssignment(List<IFormFile> files)
        {
            var res = new SingleRsp();
            var json = Request.Form["ClassAssignment"].ToString();
            var req = JsonConvert.DeserializeObject<TeacherClassAssignmentReq>(json);
            ClassAssignment assign = req.convert();            
            if (files.Count()==1)
            {
                var formFile = files[0];
                string fname = Guid.NewGuid().ToString();
                var fileExtension = Path.GetExtension(formFile.FileName);
                string ContentType = GetFileContentType(fileExtension);
                var filename = fname + fileExtension;
                string path = GetPathFileUpload(assign.ClassId.Value,"Assignment");
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
                    var url = folderName.Replace("ClientApp/dist/", "");
                    assign.AssignmentUrl = url;
                }
            }
            res = _teacherSvc.SaveTeacherClassAssignment(assign);
            return Ok(res);
        }

        [AllowAnonymous]
        [HttpPost("create-teacher-class-assignment")]
        public async Task<IActionResult> CreateTeacherClassAssignment(List<IFormFile> files)
        {
            var res = new SingleRsp();
            var json = Request.Form["ClassAssignment"].ToString();
            var req = JsonConvert.DeserializeObject<TeacherClassAssignmentReq>(json);
            ClassAssignment assign = req.convert();
            if (files.Count() == 1)
            {
                var formFile = files[0];
                string fname = Guid.NewGuid().ToString();
                var fileExtension = Path.GetExtension(formFile.FileName);
                string ContentType = GetFileContentType(fileExtension);
                var filename = fname + fileExtension;
                string path = GetPathFileUpload(assign.ClassId.Value, "Assignment");
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
                    var url = folderName.Replace("ClientApp/dist/", "");
                    assign.AssignmentUrl = url;
                }
            }
            res = _teacherSvc.CreateNewClassAssignment(assign);            
            return Ok(res);
        }

        [HttpPost("complete-teacher-class-assignment")]
        public IActionResult CompleteClassAssignment([FromBody]TeacherClassAssignmentReq req)
        {
            var res = new SingleRsp();
            res = _teacherSvc.CompleteClassAssignment(req.Id, req.ModifiedBy.Value);            
            return Ok(res);
        }

        [HttpPost("delete-teacher-class-assignment")]
        public IActionResult DeleteTeacherClassAssignment([FromBody]TeacherClassAssignmentReq req)
        {
            var res = new SingleRsp();
            res = _teacherSvc.DeleteTeacherClassAssignment(req.Id);            
            return Ok(res);
        }

        [HttpPost("get-teacher-class-assignment-studentgroup")]
        public IActionResult GetTeacherClassAssignmentStudentGroup([FromBody]TeacherClassAssignmentGroupReq req)
        {
            var res = new SingleRsp();
            var assign = _teacherSvc.GetTeacherClassAssignmentStudentGroup(req.ClassAssignmentId.Value);
            res.Data = assign;
            return Ok(res);
        }

        [HttpPost("save-teacher-class-assignment-studentgroup")]
        public IActionResult SaveTeacherClassAssignmentStudentGroup([FromBody]List<TeacherClassAssignmentGroupReq> req)
        {
            var res = new SingleRsp();
            List<ClassAssignmentGroup> lst = new List<ClassAssignmentGroup>();
            foreach(var s in req)
            {
                ClassAssignmentGroup item = s.convert();                
                lst.Add(item);
            }
            res = _teacherSvc.SaveTeacherClassAssignmentStudentGroup(lst);            
            return Ok(res);
        }

        [HttpPost("get-teacher-class-assignment-exam")]
        public IActionResult GetTeacherClassAssignmentExam([FromBody]TeacherClassAssignmentExamReq req)
        {
            var res = new SingleRsp();
            var assign = _teacherSvc.GetTeacherClassAssignmentExam(req.ClassAssignmentId.Value);
            var exam = _teacherSvc.GetExamForClassAssignment(req.ClassAssignmentId.Value);
            res.Data = new { 
                AssignExam= assign,
                ExamList = exam
            };
            return Ok(res);
        }

        [HttpPost("get-exam-for-class-assignment")]
        public IActionResult GetExamForClassAssignment([FromBody]TeacherClassAssignmentExamReq req)
        {
            var res = new SingleRsp();
            var exam = _teacherSvc.GetExamForClassAssignment(req.ClassAssignmentId.Value);
            res.Data = exam;
            return Ok(res);
        }

        [HttpPost("save-teacher-class-assignment-exam")]
        public IActionResult SaveTeacherClassAssignmentExam([FromBody]TeacherClassAssignmentExamReq req)
        {
            var res = new SingleRsp();
            ClassAssignmentExam exam = req.convert();
            if(req.Id > 0)
                res = _teacherSvc.SaveTeacherClassAssignmentExam(exam);
            else
                res = _teacherSvc.CreateTeacherClassAssignmentExam(exam);
            return Ok(res);
        }
        #endregion

        #region Teacher-Class-Student
        [HttpPost("get-teacher-class-student")]
        public IActionResult GetTeacherClassStudent([FromBody]TeacherClassStudentReq req)
        {
            var res = new SingleRsp();
            var assign = _teacherSvc.GetTeacherClassStudent(req.ClassId.Value, req.Keyword, req.Page, req.Size);
            res.Data = assign;
            return Ok(res);
        }

        [HttpPost("get-teacher-class-student-info")]
        public IActionResult GetTeacherClassStudentInfo([FromBody]TeacherClassStudentReq req)
        {
            var res = new SingleRsp();
            var assign = _teacherSvc.GetTeacherClassStudentInfo(req.Id);
            res.Data = assign;
            return Ok(res);
        }

        [HttpPost("check-official-student-id-for-class")]
        public IActionResult CheckOfficialStudentId([FromBody]CheckMSSVReq req)
        {
            var res = new SingleRsp();
            res = _teacherSvc.CheckOfficialStudentId(req.OfficialStudentId, req.SchoolId, req.ClassId);          
            return Ok(res);
        }

        [HttpPost("check-email-existed")]
        public IActionResult CheckEmailExisted([FromBody]CheckEmailReq req)
        {
            var res = new SingleRsp();
            res = _teacherSvc.CheckEmailExisted(req.Email);
            return Ok(res);
        }

        [HttpPost("save-teacher-class-student-info")]
        public IActionResult SaveTeacherClassStudentInfo([FromBody]StudentInfolReq req)
        {
            var res = new SingleRsp();
            res = _teacherSvc.SaveTeacherClassStudentInfo(req.ClassStudent, req.Student, req.User, req.UserId);
            return Ok(res);
        }

        [HttpPost("create-teacher-class-student-info")]
        public IActionResult CreateTeacherClassStudentInfo([FromBody]StudentInfolReq req)
        {
            var res = new SingleRsp();
            res = _teacherSvc.CreateTeacherClassStudentInfo(req.ClassStudent, req.Student, req.User);
            return Ok(res);
        }

        [HttpPost("save-teacher-class-student-info-by-upload")]
        public IActionResult SaveClassStudentInfoByUpload([FromBody]List<StudentInfolUploadReq> req)
        {
            var res = new SingleRsp();
            var lsCheck = _teacherSvc.CheckValidStudentInfoForUpload(req);            
            if (lsCheck != null && lsCheck.Count() == 0)
            {
                var data = _teacherSvc.SaveClassStudentInfoByUpload(req, this.UserId);
                if (data.Success)
                {
                    res.Data = new
                    {
                        CheckMsg = "OK",
                        TotalStudent = req.Count()
                    };
                }
                else
                    res = data;
            }
            else
            {
                res.Data = new
                {
                    CheckMsg = "Not-OK",
                    TotalStudent = 0,
                    CheckResult = lsCheck
                };
            }
            return Ok(res);
        }

        [AllowAnonymous]
        [HttpPost("download-class-student-list-full-data")]
        public async Task<IActionResult> DownloadClassStudentListFullData([FromBody]TeacherClassStatusReq req)
        {            
            string path = Path.Combine(Directory.GetCurrentDirectory(), "Upload/csharp-Excel.xls");
            string rePath = "test.xls";
            List<StudentInfolDownloadReq> lst = _teacherSvc.GetClassStudentInfoFullData(req.ClassId);
            if (lst.Count > 0)
            {
                var cls = _teacherSvc.GetClassInfo(req.ClassId);
                var res = CreateClassStudentListFullData_ExcelFile(lst, cls, path);
                if (res)
                {
                    var memory = new MemoryStream();
                    using (var stream = new FileStream(path, FileMode.Open))
                    {
                        await stream.CopyToAsync(memory);
                    }
                    memory.Position = 0;
                    return File(memory, "multipart/form-data", rePath);
                }
                else
                    return null;
            }
            else
                return null;
            
        }

        [HttpPost("get-student-score-list")]
        public IActionResult GetStudentScoreList([FromBody]StudentScoreListReq req)
        {
            var res = new SingleRsp();
            var ls = _teacherSvc.GetStudentScoreList(req.ClassId, req.StudentId);
            res.Data = ls;
            return Ok(res);
        }

        [HttpPost("calculate-student-score")]
        public IActionResult CalculateStudentScore([FromBody]StudentScoreListReq req)
        {
            var res = new SingleRsp();            
            res = _teacherSvc.CalculateStudentScore(req.ClassId, this.UserId);           
            return Ok(res);
        }

        [HttpPost("delete-student-of-classs")]
        public IActionResult DeleteStudentOfClass([FromBody]StudentScoreListReq req)
        {
            var res = new SingleRsp();
            res = _teacherSvc.DeleteStudentOfClass(req.ClassId, req.StudentId);           
            return Ok(res);
        }

        [HttpPost("activate-student-account-of-class")]
        public IActionResult ActivateStudentAccountOfClass([FromBody]StudentScoreListReq req)
        {
            var res = new SingleRsp();
            var res1 = _teacherSvc.ActivateStudentAccountOfClass(req.ClassId, this.UserId);
            if (res1.Success)
            {
                List<User> lstUser = (List<User>)res1.Data;
                
                if (lstUser.Count > 0)
                {
                    var sentRes = SendEmailActivateAccount(lstUser);
                    res.Data = new
                    {
                        ActivatedAccounts = lstUser,
                        SentEmails = sentRes
                    };
                }
                
            }
            else
                res = res1;
            return Ok(res);
        }

        [HttpPost("test-send-email")]
        public IActionResult TestSendEmail([FromBody]StudentScoreListReq req)
        {
            var res = new SingleRsp();
            List<User> lstUser = _teacherSvc.GetTestSendEmail();
            if (lstUser.Count > 0)
            {
                var sentRes = SendEmailActivateAccount(lstUser);
                res.Data = new
                {
                    ActivatedAccounts = lstUser,
                    SentEmails = sentRes
                };
            }
            return Ok(res);
        }

        [HttpPost("get-score-config-for-class")]
        public IActionResult GetScoreConfigForClass([FromBody]StudentScoreListReq req)
        {
            var res = new SingleRsp();
            res.Data = _teacherSvc.GetScoreConfigForClass(req.ClassId);
            return Ok(res);
        }

        [HttpPost("get-report-score-config-for-class")]
        public IActionResult GetReportScoreConfigForClass([FromBody]ScoreReportReq req)
        {
            var res = new SingleRsp();
            res = _teacherSvc.GetReportScoreConfigForClass(req.ClassId, req.ScoreConfigId);
            return Ok(res);
        }
        #endregion

        #region Teacher-Class-Attendance
        [HttpPost("get-campus-for-school")]
        public IActionResult GetCampusOfSchool([FromBody]SessionAttendanceReq req)
        {
            var res = new SingleRsp();
            res = _teacherSvc.GetCampusOfSchool(req.SchoolId);
            return Ok(res);
        }

        [HttpPost("get-session-for-check-attendance")]
        public IActionResult GetSessionForCheckAttendance([FromBody]SessionAttendanceReq req)
        {
            var res = new SingleRsp();
            res = _teacherSvc.GetSessionForCheckAttendance(req.ClassId, req.SessionType);
            return Ok(res);
        }

        [HttpPost("complete-class-session")]
        public IActionResult CompleteClassSession([FromBody]SessionAttendanceReq req)
        {
            var res = new SingleRsp();
            res = _teacherSvc.CompleteClassSession(req.ClassSessionId, req.ModifiedBy);
            return Ok(res);
        }

        [HttpPost("load-detail-attandance-of-student")]
        public IActionResult LoadDetailAttendanceOfStudent([FromBody]SessionAttendanceReq req)
        {
            var res = new SingleRsp();
            res = _teacherSvc.LoadDetailAttendanceOfStudent(req.ClassId, req.StudentId, req.ClassSessionId);
            return Ok(res);
        }

        [HttpPost("get-teacher-class-student-attendance")]
        public IActionResult GetTeacherClassStudentAttendance([FromBody]SessionAttendanceReq req)
        {
            var res = new SingleRsp();
            var assign = _teacherSvc.GetTeacherClassStudentAttendance(req.ClassId, req.ClassSessionId, req.Page, req.Size);
            res.Data = assign;
            return Ok(res);
        }

        [HttpPost("check-attendance-for-student")]
        public IActionResult CheckAttendanceForStudent([FromBody]ClassAttendanceReq req)
        {
            var res = new SingleRsp();
            ClassAttendance att = req.convert();
            res = _teacherSvc.CheckAttendanceForStudent(att);           
            return Ok(res);
        }
        #endregion

        #region TEacher class Document
        [HttpPost("get-teacher-class-document")]
        public IActionResult GetTeacherClassDocument([FromBody]TeacherClassDocumentReq req)
        {
            var res = new SingleRsp();           
            res = _teacherSvc.GetTeacherClassDocument(req.ClassId, req.DocumentType);
            return Ok(res);
        }

        [AllowAnonymous]
        [HttpPost("save-teacher-class-document")]
        public async Task<IActionResult> SaveTeacherClassDocument(List<IFormFile> files)
        {
            var res = new SingleRsp();
            var json = Request.Form["ClassDocument"].ToString();
            var req = JsonConvert.DeserializeObject<ClassDocumentReq>(json);
            ClassDocument doc = req.convert();
            if (files.Count() == 1)
            {
                var formFile = files[0];
                string fname = Guid.NewGuid().ToString();
                var fileExtension = Path.GetExtension(formFile.FileName);
                string ContentType = GetFileContentType(fileExtension);
                var filename = fname + fileExtension;
                string path = GetPathFileUpload(doc.ClassId.Value, "Document");
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
                    var url = folderName.Replace("ClientApp/dist/", "");
                    doc.LinkUrl = url;
                }
            }
            res = _teacherSvc.SaveTeacherClassDocument(doc);
            return Ok(res);
        }

        [AllowAnonymous]
        [HttpPost("create-teacher-class-document")]
        public async Task<IActionResult> CreateTeacherClassDocument(List<IFormFile> files)
        {
            var res = new SingleRsp();
            var json = Request.Form["ClassDocument"].ToString();
            var req = JsonConvert.DeserializeObject<ClassDocumentReq>(json);
            ClassDocument doc = req.convert();
            if (files.Count() == 1)
            {
                var formFile = files[0];
                string fname = Guid.NewGuid().ToString();
                var fileExtension = Path.GetExtension(formFile.FileName);
                string ContentType = GetFileContentType(fileExtension);
                var filename = fname + fileExtension;
                string path = GetPathFileUpload(doc.ClassId.Value, "Document");
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
                    var url = folderName.Replace("ClientApp/dist/", "");
                    doc.LinkUrl = url;
                }
            }
            res = _teacherSvc.CreateTeacherClassDocument(doc);
            return Ok(res);
        }

        [HttpPost("delete-teacher-class-document")]
        public IActionResult DeleteTeacherClassDocument([FromBody]TeacherClassAssignmentReq req)
        {
            var res = new SingleRsp();
            res = _teacherSvc.DeleteTeacherClassDocument(req.Id);
            return Ok(res);
        }
        #endregion

        #region Teacher-Class Announcement
        [HttpPost("get-teacher-class-announcement")]
        public IActionResult GetTeacherClassAnnouncement([FromBody]TeacherClassAnnouncementReq req)
        {
            var res = new SingleRsp();
            res = _teacherSvc.GetTeacherClassAnnouncement(req.ClassId, req.Page, req.Size);
            return Ok(res);
        }

        [HttpPost("create-teacher-class-announcement")]
        public IActionResult CreateTeacherClassAnnouncement([FromBody]ClassAnnouncementReq req)
        {
            var res = new SingleRsp();
            ClassAnnouncement ca = req.convert();
            res = _teacherSvc.CreateTeacherClassAnnouncement(ca);
            return Ok(res);
        }


        [HttpPost("save-teacher-class-announcement")]
        public IActionResult SaveTeacherClassAnnouncement([FromBody]ClassAnnouncementReq req)
        {
            var res = new SingleRsp();
            ClassAnnouncement ca = req.convert();
            res = _teacherSvc.SaveTeacherClassAnnouncement(ca);
            return Ok(res);
        }

        [HttpPost("delete-teacher-class-announcement")]
        public IActionResult DeleteTeacherClassAnnouncement([FromBody]ClassAnnouncementReq req)
        {
            var res = new SingleRsp();            
            res = _teacherSvc.DeleteTeacherClassAnnouncement(req.Id);
            return Ok(res);
        }

        #endregion

        #region Teacher-Class Exam
        [HttpPost("get-teacher-class-subject")]
        public IActionResult GetTeacherClassSubject([FromBody]TeacherClassSubjectReq req)
        {
            var res = new SingleRsp();
            res = _teacherSvc.GetTeacherClassSubject(req.UserId, req.Page, req.Size);
            //res = _teacherSvc.GetTeacherClassSubjectTest(req.UserId, req.Page, req.Size);
            return Ok(res);
        }

        [HttpPost("get-teacher-subject-exam-and-question")]
        public IActionResult GetTeacherSubjectExamAndQuestion([FromBody]TeacherClassSubjectReq req)
        {
            var res = new SingleRsp();
            var exam = _teacherSvc.GetSubjectExam(req.SubjectId, req.Page, req.Size);
            var quest = _teacherSvc.GetSubjectExamQuestion(req.SubjectId, req.Page, req.SizeQuest);
            res.Data = new { 
                Exams = exam,
                Questions = quest
            };
            return Ok(res);
        }

        [HttpPost("get-teacher-subject-exam")]
        public IActionResult GetTeacherSubjectExam([FromBody]TeacherClassSubjectReq req)
        {
            var res = new SingleRsp();
            var exam = _teacherSvc.GetSubjectExam(req.SubjectId, req.Page, req.Size);
            res.Data = exam;
            return Ok(res);
        }

        [HttpPost("get-teacher-subject-question")]
        public IActionResult GetTeacherSubjectExamQuestion([FromBody]TeacherClassSubjectReq req)
        {
            var res = new SingleRsp();
            var quest = _teacherSvc.GetSubjectExamQuestion(req.SubjectId, req.Page, req.Size);
            res.Data = quest;
            return Ok(res);
        }

        [HttpPost("get-teacher-subject-question-detail")]
        public IActionResult GetQuestionDetail([FromBody]TeacherClassSubjectReq req)
        {
            var res = new SingleRsp();
            var quest = _teacherSvc.GetQuestionDetail(req.QuestionId);
            res.Data = quest;
            return Ok(res);
        }

        [HttpPost("get-teacher-subject-exam-detail")]
        public IActionResult GetExamDetail([FromBody]TeacherClassSubjectReq req)
        {
            var res = new SingleRsp();
            var quest = _teacherSvc.GetExamDetail(req.ExamId);
            res.Data = quest;
            return Ok(res);
        }

        [HttpPost("search-question-for-exam")]
        public IActionResult SearchQuestionForExam([FromBody]TeacherClassSubjectReq req)
        {
            var res = new SingleRsp();
            var quest = _teacherSvc.SearchQuestionForExam(req.Keyword, req.ExamId, req.SubjectId);
            res.Data = quest;
            return Ok(res);
        }

        [HttpPost("delete-question-from-exam")]
        public IActionResult DeleteQuestionFromExam([FromBody]TeacherClassSubjectReq req)
        {
            var res = new SingleRsp();
            res = _teacherSvc.DeleteQuestionFromExam(req.ExamDetailId);
            return Ok(res);
        }

        [HttpPost("add-question-for-exam")]
        public IActionResult AddQuestionForExam([FromBody]TeacherClassSubjectReq req)
        {
            var res = new SingleRsp();
            res = _teacherSvc.AddQuestionForExam(req.ExamId, req.QuestionId, req.UserId);
            return Ok(res);
        }

        [HttpPost("save-teacher-class-exam-info")]
        public IActionResult SaveTeacherClassExamInfo([FromBody]ClassExamReq req)
        {
            var res = new SingleRsp();
            var exam = req.convert();
            res = _teacherSvc.SaveTeacherClassExamInfo(exam);
            return Ok(res);
        }

        [HttpPost("create-teacher-class-exam-info")]
        public IActionResult CreateTeacherClassExamInfo([FromBody]ClassExamReq req)
        {
            var res = new SingleRsp();
            var exam = req.convert();
            res = _teacherSvc.CreateTeacherClassExamInfo(exam);
            return Ok(res);
        }

        [HttpPost("delete-teacher-class-exam")]
        public IActionResult DeleteTeacherClassExam([FromBody]ClassExamReq req)
        {
            var res = new SingleRsp();            
            res = _teacherSvc.DeleteTeacherClassExam(req.Id);
            return Ok(res);
        }

        /////
        [HttpPost("save-teacher-exam-question-info")]
        public IActionResult SaveTeacherExamQuestionInfo([FromBody]ExamQuestionReq req)
        {
            var res = new SingleRsp();
            var q = req.convert();
            if(!string.IsNullOrEmpty(req.ImageBase64))
            {
                q.QuestionImage = SaveImageExam(req.ImageBase64, req.SubjectId.Value);
            }
            res = _teacherSvc.SaveTeacherExamQuestionInfo(q);
            return Ok(res);
        }

        [HttpPost("create-teacher-exam-question-info")]
        public IActionResult CreateTeacherExamQuestionInfo([FromBody]ExamQuestionReq req)
        {
            var res = new SingleRsp();
            var q = req.convert();
            if (!string.IsNullOrEmpty(req.ImageBase64))
            {
                q.QuestionImage = SaveImageExam(req.ImageBase64, req.SubjectId.Value);
            }
            res = _teacherSvc.CreateTeacherExamQuestionInfo(q);
            return Ok(res);
        }

        [HttpPost("delete-teacher-exam-question")]
        public IActionResult DeleteTeacherExamQuestion([FromBody]ExamQuestionReq req)
        {
            var res = new SingleRsp();
            res = _teacherSvc.DeleteTeacherExamQuestion(req.Id);
            return Ok(res);
        }

        [HttpPost("save-teacher-question-answers")]
        public IActionResult SaveTeacherQuestionAnswers([FromBody]ExamAnswerInfoReq req)
        {
            var res = new SingleRsp();
            List<ExamAnswer> lst = new List<ExamAnswer>();
            foreach (var a in req.ListAnswer)
            {
                var ans = a.convert();
                if (!string.IsNullOrEmpty(a.ImageBase64))
                {
                    ans.AnswerImage = SaveImageAnswer(a.ImageBase64, req.SubjectId, req.QuestionId);
                }
                lst.Add(ans);
            }
            res = _teacherSvc.SaveTeacherQuestionAnswers(lst, req.QuestionId, UserId);
            return Ok(res);
        }
        #endregion

        public TeacherController( TeacherSvc s2)
        {          
            _teacherSvc = s2;
        }
        #region -- Fields --        
        private readonly TeacherSvc _teacherSvc;
        #endregion

        private string GetPathFileUpload(int classId, string type)
        {
            string str = "";
            if (AppSetting.S.Dev)
                str = "ClientApp/dist/assets/";
            else
                str = "ClientApp/dist/assets/";
            str = str + "Class/" + classId.ToString() + "/" + type;
            var folderPath = Path.Combine(Directory.GetCurrentDirectory(), str);
            if (!Directory.Exists(folderPath))
                Directory.CreateDirectory(folderPath);
            return str;
        }

        public string SaveImageExam(string imageBase64, int sId)
        {
            var bytes = Convert.FromBase64String(imageBase64);

            // Check and create original folder by code type
            var uploadDir = "ClientApp/src/assets/Exam/Subject_"+ sId.ToString();
            if (!AppSetting.S.Dev)
            {
                uploadDir = "ClientApp/dist/assets/Exam/Subject_" + sId.ToString();
            }

            string filedir = Path.Combine(Directory.GetCurrentDirectory(), uploadDir);
            if (!Directory.Exists(filedir))
            {
                Directory.CreateDirectory(filedir);
            }

            // Create primary file name 
            Guid guid = Guid.NewGuid();

            //imageGallery_id_small.jpg
            StringBuilder filename = new StringBuilder("question_");
            filename.Append(guid.ToString());          
            filename.Append(".jpg");

            string defaultPath = Path.Combine(filedir, filename.ToString());            

            if (bytes.Length > 0)
            {
                MemoryStream originalMs = new MemoryStream(bytes);
                Image originaImage = Image.FromStream(originalMs);
                originaImage.Save(defaultPath, ImageFormat.Jpeg);
            }

            string dir = "assets/Exam/Subject_" + sId.ToString()+"/";
            return dir + filename;
        }

        public string SaveImageAnswer(string imageBase64, int sId, int qId)
        {
            var bytes = Convert.FromBase64String(imageBase64);

            // Check and create original folder by code type
            var uploadDir = "ClientApp/src/assets/Exam/Subject_" + sId.ToString() + "/Question_" + qId.ToString();
            if (!AppSetting.S.Dev)
            {
                uploadDir = "ClientApp/dist/assets/Exam/Subject_" + sId.ToString() + "/Question_" + qId.ToString();
            }

            string filedir = Path.Combine(Directory.GetCurrentDirectory(), uploadDir);
            if (!Directory.Exists(filedir))
            {
                Directory.CreateDirectory(filedir);
            }

            // Create primary file name 
            Guid guid = Guid.NewGuid();

            //imageGallery_id_small.jpg
            StringBuilder filename = new StringBuilder("question_");
            filename.Append(guid.ToString());
            filename.Append(".jpg");

            string defaultPath = Path.Combine(filedir, filename.ToString());

            if (bytes.Length > 0)
            {
                MemoryStream originalMs = new MemoryStream(bytes);
                Image originaImage = Image.FromStream(originalMs);
                originaImage.Save(defaultPath, ImageFormat.Jpeg);
            }

            string dir = "assets/Exam/Subject_" + sId.ToString() + "/Question_" + qId.ToString() + "/";
            return dir + filename;
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

        private bool CreateClassStudentListFullData_ExcelFile(List<StudentInfolDownloadReq> lst, ClassInfoReq cls, string _filePath)
        {
            bool res = false;
            //string path = Path.Combine(Directory.GetCurrentDirectory(), _filePath);
            var sample = lst[0].ListScore;
            using (ExcelEngine excelEngine = new ExcelEngine())
            {
                //Set the default application version as Excel 2016
                excelEngine.Excel.DefaultVersion = ExcelVersion.Excel2016;

                //Create a workbook with a worksheet
                IWorkbook workbook = excelEngine.Excel.Workbooks.Create(1);

                //Access first worksheet from the workbook instance
                IWorksheet sheet = workbook.Worksheets[0];

                //Insert sample text into cell “A1”
                #region Generate Excel
                int c = 1;
                int nScore = sample.Count();
                sheet.Range[2, c].ColumnWidth = 3; c++;//No
                sheet.Range[2, c].ColumnWidth = 12; c++;// MSSV
                sheet.Range[2, c].ColumnWidth = 28; c++; // Ho
                sheet.Range[2, c].ColumnWidth = 10; c++; // Ten
                sheet.Range[2, c].ColumnWidth = 12; c++; // Ngay Sinh
                sheet.Range[2, c].ColumnWidth = 28; c++; // Email
                sheet.Range[2, c].ColumnWidth = 15; c++; // Phone
                sheet.Range[2, c].ColumnWidth = 35; c++; // Address
                sheet.Range[2, c].ColumnWidth = 25; c++; // Ghi chu
                int scoreFrom = c;
                for (var i=0;i< nScore; i++)
                {                    
                    sheet.Range[2, c].ColumnWidth = 5; // cot diem thứ i + 1
                    c++;
                }
                sheet.Range[2, c].ColumnWidth = 8; // Diem tong
                int scoreTo = c;
                //sheet.Rows[2,2].Merge

                sheet.Range[2, 1, 2, c].Merge(true);

                //Inserting sample text into the first cell of the first sheet.
                sheet.Range[2, 1].RowHeight = 18;
                sheet.Range[2, 1].Text = "DANH SÁCH SINH VIÊN Lớp ["+ cls.Code+ "]";
                sheet.Range[2, 1].CellStyle.Font.FontName = "Arial";
                sheet.Range[2, 1].CellStyle.Font.Bold = true;
                sheet.Range[2, 1].CellStyle.Font.Size = 18;
                sheet.Range[2, 1].CellStyle.Font.RGBColor = Syncfusion.Drawing.Color.FromArgb(0, 0, 112, 192);
                sheet.Range[2, 1].HorizontalAlignment = ExcelHAlign.HAlignCenter;
                sheet.Range[2, 1].AutofitRows();

                sheet.Range[4, 2].Text = "Mã Lớp";
                sheet.Range[4, 3].Text = cls.Code;
                sheet.Range[4,2,10,3].CellStyle.Font.FontName = "Arial";                
                sheet.Range[4,2,10,3].CellStyle.Font.Size = 11;

                sheet.Range[4, 2, 7, 10].CellStyle.Font.RGBColor = Syncfusion.Drawing.Color.FromArgb(0, 128, 128, 128);
                sheet.Range[4, 2, 7, 10].HorizontalAlignment = ExcelHAlign.HAlignRight;
                sheet.Range[4, 2, 7, 10].CellStyle.Font.Bold = true;
                sheet.Range[4, 5, 7, 5].CellStyle.Font.RGBColor = Syncfusion.Drawing.Color.FromArgb(0, 128, 128, 128);
                sheet.Range[4, 5, 7, 5].HorizontalAlignment = ExcelHAlign.HAlignRight;
                sheet.Range[4, 5, 7, 5].CellStyle.Font.Bold = true;
                sheet.Range[4, 7, 7, 7].CellStyle.Font.RGBColor = Syncfusion.Drawing.Color.FromArgb(0, 128, 128, 128);
                sheet.Range[4, 7, 7, 7].HorizontalAlignment = ExcelHAlign.HAlignRight;
                sheet.Range[4, 7, 7, 7].CellStyle.Font.Bold = true;

                sheet.Range[4, 3, 7, 3].CellStyle.Font.RGBColor = Syncfusion.Drawing.Color.FromArgb(0, 174, 170, 170);
                sheet.Range[4, 3, 7, 3].HorizontalAlignment = ExcelHAlign.HAlignLeft;
                sheet.Range[4, 6, 7, 6].CellStyle.Font.RGBColor = Syncfusion.Drawing.Color.FromArgb(0, 174, 170, 170);
                sheet.Range[4, 6, 7, 6].HorizontalAlignment = ExcelHAlign.HAlignLeft;
                sheet.Range[4, 8, 7, 8].CellStyle.Font.RGBColor = Syncfusion.Drawing.Color.FromArgb(0, 174, 170, 170);
                sheet.Range[4, 8, 7, 8].HorizontalAlignment = ExcelHAlign.HAlignLeft;

                sheet.Range[5,2].Text = "Lớp";
                sheet.Range[5,3].Text = cls.Name;

                sheet.Range[6,2].Text = "Bắt đầu";
                sheet.Range[6,3].NumberFormat = "m/d/yyyy";
                sheet.Range[6, 3].DateTime = cls.StartDate.Value;

                sheet.Range[7, 2].Text = "Kết thúc";
                sheet.Range[7, 3].NumberFormat = "m/d/yyyy";
                sheet.Range[7, 3].DateTime = cls.EndDate.Value;

                sheet.Range[4, 5].Text = "Tên môn học";                
                sheet.Range[4, 6].Text = cls.SubjectName;

                sheet.Range[5, 5].Text = "Tổng số buổi học";
                sheet.Range[5, 6].NumberFormat = "0.00";
                sheet.Range[5, 6].Number = cls.TotalSession.Value ;

                sheet.Range[6, 5].Text = "Tổng số tín chỉ";
                sheet.Range[6, 6].NumberFormat = "0.00";
                sheet.Range[6, 6].Number = cls.TotalCredit.Value;

                sheet.Range[7, 5].Text = "Học kỳ";
                sheet.Range[7, 6].Text = cls.Semester.Value.ToString() + " - " + cls.SchoolYear;

                sheet.Range[4, 7].Text = "Trường";
                sheet.Range[4, 8].Text = cls.SchoolName;

                sheet.Range[5, 7].Text = "Giảng viên";
                sheet.Range[5, 8].Text = cls.TeacherName;

                // Tiêu đề
                sheet.Range[9, 1, 11, 1].Merge(true);
                sheet.Range[9, 1].Text = "#";
                sheet.Range[9, 2, 11, 2].Merge(true);
                sheet.Range[9, 2].Text = "MSSV";
                sheet.Range[9, 3, 11, 3].Merge(true);
                sheet.Range[9, 3].Text = "Họ Lót";
                sheet.Range[9, 4, 11, 4].Merge(true);
                sheet.Range[9, 4].Text = "Tên";
                sheet.Range[9, 5, 11, 5].Merge(true);
                sheet.Range[9, 5].Text = "Ngày sinh";
                sheet.Range[9, 6, 11, 6].Merge(true);
                sheet.Range[9, 6].Text = "Email";
                sheet.Range[9, 7, 11, 7].Merge(true);
                sheet.Range[9, 7].Text = "ĐT";
                sheet.Range[9, 8, 11, 8].Merge(true);
                sheet.Range[9, 8].Text = "Địa chỉ";
                sheet.Range[9, 9, 11, 9].Merge(true);
                sheet.Range[9, 9].Text = "Ghi chú";                
                sheet.Range[9, 10, 9, c - 1].Merge(true);
                sheet.Range[9, 10].Text = "Điểm môn học";
                for (var i = 0; i < nScore; i++)
                {
                    sheet.Range[10, i + 10].Text = "("+(i+1).ToString()+")"; // cot diem thứ i + 1  
                    if(sample[i].Percentage.HasValue)
                        sheet.Range[11, i + 10].Text = sample[i].Percentage.Value.ToString() + "%"; // cot diem thứ i + 1 
                }
                sheet.Range[9, c, 10, c].Merge(true);
                sheet.Range[9, c].Text = "Điểm Tổng Kết";
                sheet.Range[11, c].Text = "100%";
                sheet.Range[9, 1, 11, c].CellStyle.Color = Syncfusion.Drawing.Color.FromArgb(0, 0, 112, 192);
                sheet.Range[9, 1, 11, c].CellStyle.Font.Color = ExcelKnownColors.White;
                sheet.Range[9, 1, 11, c].CellStyle.Font.Bold = true;
                sheet.Range[9, 1, 11, c].VerticalAlignment = ExcelVAlign.VAlignCenter;
                sheet.Range[9, 1, 11, c].HorizontalAlignment = ExcelHAlign.HAlignCenter;
                sheet.Range[9, 1, 11, c].WrapText = true;
                sheet.Range[9, 1, 11, c].CellStyle.Font.FontName = "Arial";
                sheet.Range[9, 1, 11, c].CellStyle.Font.Size = 10;                
                int r = 12;
                for(int i = 0; i<lst.Count();i++)
                {
                    var s = lst[i];
                    sheet.Range[r, 1].Text = (i+1).ToString();
                    sheet.Range[r, 2].Text = s.OfficialStudentId;
                    sheet.Range[r, 3].Text = s.LastName;
                    sheet.Range[r, 4].Text = s.FirstName;
                    if(s.Birthday.HasValue)
                        sheet.Range[r, 5].DateTime = s.Birthday.Value;
                    sheet.Range[r, 6].Text = s.Email;
                    sheet.Range[r, 7].Text = s.Phone;
                    sheet.Range[r, 8].Text = s.Address;
                    sheet.Range[r, 9].Text = s.Note;                    
                    for (int j = 0; j<s.ListScore.Count(); j++)
                    {
                        var sc = s.ListScore[j];
                        if (sc.Score.HasValue)
                        {
                            sheet.Range[r, 10 + j].NumberFormat = "0.00";
                            sheet.Range[r, 10 + j].Number = (double)sc.Score.Value;
                        }
                    }
                    if(s.FinalScore.HasValue)
                    {
                        sheet.Range[r, c].NumberFormat = "0.00";
                        sheet.Range[r, c].Number = (double)s.FinalScore.Value;
                    }
                    r++;
                }
                // border
                //Top Border
                sheet.Range[9, 1, r, c].CellStyle.Borders[ExcelBordersIndex.EdgeTop].LineStyle = ExcelLineStyle.Thin;
                //Left Border
                sheet.Range[9, 1, r, c].CellStyle.Borders[ExcelBordersIndex.EdgeLeft].LineStyle = ExcelLineStyle.Thin;
                //Bottom Border
                sheet.Range[9, 1, r, c].CellStyle.Borders[ExcelBordersIndex.EdgeBottom].LineStyle = ExcelLineStyle.Thin;
                //Right Border
                sheet.Range[9, 1, r, c].CellStyle.Borders[ExcelBordersIndex.EdgeRight].LineStyle = ExcelLineStyle.Thin;                
                sheet.Range[9, 1, r, c].CellStyle.Borders.ColorRGB = Syncfusion.Drawing.Color.FromArgb(70, 70, 70, 20);

                ////                
                sheet.Range[12, 1, r, c].CellStyle.Font.Color = ExcelKnownColors.Blue_grey;      
                sheet.Range[12, 1, r, c].WrapText = true;
                sheet.Range[12, 1, r, c].CellStyle.Font.FontName = "Arial";
                sheet.Range[12, 1, r, c].CellStyle.Font.Size = 9.5;

                sheet.UsedRange.AutofitRows();
                sheet.Name = "Class-"+cls.Id.ToString();
                #endregion

                //Save the workbook to disk in xlsx format
                workbook.Version = ExcelVersion.Excel2016;
                try
                {
                    using (FileStream fileStream = new FileStream(_filePath, FileMode.Create, FileAccess.ReadWrite))
                    {
                        workbook.SaveAs(fileStream);
                    }
                    res = true;
                }
                catch (Exception ex)
                {
                    res = false;
                }
            }
            return res;
        }
        private bool CreateExcelFile(string _filePath)
        {
            bool res = false;
            //string path = Path.Combine(Directory.GetCurrentDirectory(), _filePath);
            using (ExcelEngine excelEngine = new ExcelEngine())
            {
                //Set the default application version as Excel 2016
                excelEngine.Excel.DefaultVersion = ExcelVersion.Excel2016;

                //Create a workbook with a worksheet
                IWorkbook workbook = excelEngine.Excel.Workbooks.Create(1);

                //Access first worksheet from the workbook instance
                IWorksheet sheet = workbook.Worksheets[0];

                //Insert sample text into cell “A1”
                #region Generate Excel
                sheet.Range["A2"].ColumnWidth = 30;
                sheet.Range["B2"].ColumnWidth = 30;
                sheet.Range["C2"].ColumnWidth = 30;
                sheet.Range["D2"].ColumnWidth = 30;

                sheet.Range["A2:D2"].Merge(true);

                //Inserting sample text into the first cell of the first sheet.
                sheet.Range["A2"].Text = "EXPENSE REPORT";
                sheet.Range["A2"].CellStyle.Font.FontName = "Verdana";
                sheet.Range["A2"].CellStyle.Font.Bold = true;
                sheet.Range["A2"].CellStyle.Font.Size = 28;
                sheet.Range["A2"].CellStyle.Font.RGBColor = Syncfusion.Drawing.Color.FromArgb(0, 0, 112, 192);
                sheet.Range["A2"].HorizontalAlignment = ExcelHAlign.HAlignCenter;

                sheet.Range["A4"].Text = "Employee";
                sheet.Range["B4"].Text = "Roger Federer";
                sheet.Range["A4:B7"].CellStyle.Font.FontName = "Verdana";
                sheet.Range["A4:B7"].CellStyle.Font.Bold = true;
                sheet.Range["A4:B7"].CellStyle.Font.Size = 11;
                sheet.Range["A4:A7"].CellStyle.Font.RGBColor = Syncfusion.Drawing.Color.FromArgb(0, 128, 128, 128);
                sheet.Range["A4:A7"].HorizontalAlignment = ExcelHAlign.HAlignLeft;
                sheet.Range["B4:B7"].CellStyle.Font.RGBColor = Syncfusion.Drawing.Color.FromArgb(0, 174, 170, 170);
                sheet.Range["B4:B7"].HorizontalAlignment = ExcelHAlign.HAlignRight;

                sheet.Range["A9:D20"].CellStyle.Font.FontName = "Verdana";
                sheet.Range["A9:D20"].CellStyle.Font.Size = 11;

                sheet.Range["A5"].Text = "Department";
                sheet.Range["B5"].Text = "Administration";

                sheet.Range["A6"].Text = "Week Ending";
                sheet.Range["B6"].NumberFormat = "m/d/yyyy";
                sheet.Range["B6"].DateTime = DateTime.Parse("10/20/2012", CultureInfo.InvariantCulture);

                sheet.Range["A7"].Text = "Mileage Rate";
                sheet.Range["B7"].NumberFormat = "$#,##0.00";
                sheet.Range["B7"].Number = 0.70;

                sheet.Range["A10"].Text = "Miles Driven";
                sheet.Range["A11"].Text = "Miles Reimbursement";
                sheet.Range["A12"].Text = "Parking and Tolls";
                sheet.Range["A13"].Text = "Auto Rental";
                sheet.Range["A14"].Text = "Lodging";
                sheet.Range["A15"].Text = "Breakfast";
                sheet.Range["A16"].Text = "Lunch";
                sheet.Range["A17"].Text = "Dinner";
                sheet.Range["A18"].Text = "Snacks";
                sheet.Range["A19"].Text = "Others";
                sheet.Range["A20"].Text = "Total";
                sheet.Range["A20:D20"].CellStyle.Color = Syncfusion.Drawing.Color.FromArgb(0, 0, 112, 192);
                sheet.Range["A20:D20"].CellStyle.Font.Color = ExcelKnownColors.White;
                sheet.Range["A20:D20"].CellStyle.Font.Bold = true;

                IStyle style = sheet["B9:D9"].CellStyle;
                style.VerticalAlignment = ExcelVAlign.VAlignCenter;
                style.HorizontalAlignment = ExcelHAlign.HAlignRight;
                style.Color = Syncfusion.Drawing.Color.FromArgb(0, 0, 112, 192);
                style.Font.Bold = true;
                style.Font.Color = ExcelKnownColors.White;

                sheet.Range["A9"].Text = "Expenses";
                sheet.Range["A9"].CellStyle.Color = Syncfusion.Drawing.Color.FromArgb(0, 0, 112, 192);
                sheet.Range["A9"].CellStyle.Font.Color = ExcelKnownColors.White;
                sheet.Range["A9"].CellStyle.Font.Bold = true;
                sheet.Range["B9"].Text = "Day 1";
                sheet.Range["B10"].Number = 100;
                sheet.Range["B11"].NumberFormat = "$#,##0.00";
                sheet.Range["B11"].Formula = "=(B7*B10)";
                sheet.Range["B12"].NumberFormat = "$#,##0.00";
                sheet.Range["B12"].Number = 0;
                sheet.Range["B13"].NumberFormat = "$#,##0.00";
                sheet.Range["B13"].Number = 0;
                sheet.Range["B14"].NumberFormat = "$#,##0.00";
                sheet.Range["B14"].Number = 0;
                sheet.Range["B15"].NumberFormat = "$#,##0.00";
                sheet.Range["B15"].Number = 9;
                sheet.Range["B16"].NumberFormat = "$#,##0.00";
                sheet.Range["B16"].Number = 12;
                sheet.Range["B17"].NumberFormat = "$#,##0.00";
                sheet.Range["B17"].Number = 13;
                sheet.Range["B18"].NumberFormat = "$#,##0.00";
                sheet.Range["B18"].Number = 9.5;
                sheet.Range["B19"].NumberFormat = "$#,##0.00";
                sheet.Range["B19"].Number = 0;
                sheet.Range["B20"].NumberFormat = "$#,##0.00";
                sheet.Range["B20"].Formula = "=SUM(B11:B19)";

                sheet.Range["C9"].Text = "Day 2";
                sheet.Range["C10"].Number = 145;
                sheet.Range["C11"].NumberFormat = "$#,##0.00";
                sheet.Range["C11"].Formula = "=(B7*C10)";
                sheet.Range["C12"].NumberFormat = "$#,##0.00";
                sheet.Range["C12"].Number = 15;
                sheet.Range["C13"].NumberFormat = "$#,##0.00";
                sheet.Range["C13"].Number = 0;
                sheet.Range["C14"].NumberFormat = "$#,##0.00";
                sheet.Range["C14"].Number = 45;
                sheet.Range["C15"].NumberFormat = "$#,##0.00";
                sheet.Range["C15"].Number = 9;
                sheet.Range["C16"].NumberFormat = "$#,##0.00";
                sheet.Range["C16"].Number = 12;
                sheet.Range["C17"].NumberFormat = "$#,##0.00";
                sheet.Range["C17"].Number = 15;
                sheet.Range["C18"].NumberFormat = "$#,##0.00";
                sheet.Range["C18"].Number = 7;
                sheet.Range["C19"].NumberFormat = "$#,##0.00";
                sheet.Range["C19"].Number = 0;
                sheet.Range["C20"].NumberFormat = "$#,##0.00";
                sheet.Range["C20"].Formula = "=SUM(C11:C19)";

                sheet.Range["D9"].Text = "Day 3";
                sheet.Range["D10"].Number = 113;
                sheet.Range["D11"].NumberFormat = "$#,##0.00";
                sheet.Range["D11"].Formula = "=(B7*D10)";
                sheet.Range["D12"].NumberFormat = "$#,##0.00";
                sheet.Range["D12"].Number = 17;
                sheet.Range["D13"].NumberFormat = "$#,##0.00";
                sheet.Range["D13"].Number = 8;
                sheet.Range["D14"].NumberFormat = "$#,##0.00";
                sheet.Range["D14"].Number = 45;
                sheet.Range["D15"].NumberFormat = "$#,##0.00";
                sheet.Range["D15"].Number = 7;
                sheet.Range["D16"].NumberFormat = "$#,##0.00";
                sheet.Range["D16"].Number = 11;
                sheet.Range["D17"].NumberFormat = "$#,##0.00";
                sheet.Range["D17"].Number = 16;
                sheet.Range["D18"].NumberFormat = "$#,##0.00";
                sheet.Range["D18"].Number = 7;
                sheet.Range["D19"].NumberFormat = "$#,##0.00";
                sheet.Range["D19"].Number = 5;
                sheet.Range["D20"].NumberFormat = "$#,##0.00";
                sheet.Range["D20"].Formula = "=SUM(D11:D19)";

                sheet.UsedRange.AutofitRows();
                sheet.Name = "Class-Student";
                #endregion

                //Save the workbook to disk in xlsx format
                workbook.Version = ExcelVersion.Excel2016;
                try
                {
                    using (FileStream fileStream = new FileStream(_filePath, FileMode.Create, FileAccess.ReadWrite))
                    {
                        workbook.SaveAs(fileStream);
                    }
                    res = true;
                }
                catch (Exception ex)
                {
                    res = false;
                }
            }
            return res;
        }

        private bool CreateExcelFile1(string _filePath)
        {
            bool res = false;
            FileInfo newFile = new FileInfo(_filePath);
            if (newFile.Exists)
            {
                newFile.Delete();  // ensures we create a new workbook
                newFile = new FileInfo(_filePath);
            }

            using (var package = new ExcelPackage(newFile))
            {
                // add a new worksheet to the empty workbook
                ExcelWorksheet worksheet = package.Workbook.Worksheets.Add("Inventory");
                //Add the headers
                worksheet.Cell(1, 1).Value = "ID";
                worksheet.Cell(1, 2).Value = "Product";
                worksheet.Cell(1, 3).Value = "Quantity";
                worksheet.Cell(1, 4).Value = "Price";
                worksheet.Cell(1, 5).Value = "Value";
                // lets set the header text 
                worksheet.HeaderFooter.oddHeader.CenteredText = "&24&U&\"Arial,Regular Bold\" Inventory";
                // add the page number to the footer plus the total number of pages
                worksheet.HeaderFooter.oddFooter.RightAlignedText =
                string.Format("Page {0} of {1}", ExcelHeaderFooter.PageNumber, ExcelHeaderFooter.NumberOfPages);
                // add the sheet name to the footer
                worksheet.HeaderFooter.oddFooter.CenteredText = ExcelHeaderFooter.SheetName;
                // add the file path to the footer
                worksheet.HeaderFooter.oddFooter.LeftAlignedText = ExcelHeaderFooter.FilePath + ExcelHeaderFooter.FileName;
                

                // Change the sheet view to show it in page layout mode
                worksheet.View.PageLayoutView = true;

                // set some document properties
                package.Workbook.Properties.Title = "Invertory";
                package.Workbook.Properties.Author = "Hao Lee";
                package.Workbook.Properties.Comments = "This sample demonstrates how to create an Excel 2007 workbook using EPPlus";

                // set some extended property values
                package.Workbook.Properties.Company = "OccApp Team";

                // set some custom property values
                package.Workbook.Properties.SetCustomPropertyValue("Checked by", "Hao Lee");
                package.Workbook.Properties.SetCustomPropertyValue("AssemblyName", "EPPlus");

                // save our new workbook and we are done!
                package.Save();

            }
            return res;
        }

        #region send Email Activate
        private object SendEmailActivateAccount(List<User> lst)
        {
            int n = 0;
            tempStr = "";
            if (lst.Count > 0)
            {
                foreach (var u in lst)
                {
                    ActivateAccountMail mail = new ActivateAccountMail();
                    mail.Username = u.UserName;
                    mail.Password = "Qq12345!";
                    mail.RecieverEmail = u.Email;
                    mail.RecieverFullName = u.LastName + " " + u.FirstName;
                    var i = SendEmailActivateAccount(mail);
                    n = n + i.Result;
                }
            }
            return new { 
                Message= tempStr,
                TotalSent = n
            };
        }
        private async Task<int> SendEmailActivateAccount(ActivateAccountMail notiMail)
        {
            int i = 0;
            bool iDev = true;
            //tempStr = "";
            i = await SendMail(notiMail, iDev);
            if (i == 0)
                tempStr += "Email failed to send[" + notiMail.RecieverEmail + "] ! <br/>";            
            return i;
        }
        public async Task<int> SendMail(ActivateAccountMail actMail, bool iDev)
        {
            //_logger.Info("Starting SendMail.... [" + notiMail.RecieverEmail + "]");
            int i = 0;
            var result = await Task.Run(() =>
            {
                try
                {
                    #region Read file template
                    var dir = Directory.GetCurrentDirectory();
                    //string projectDirectory = Directory.GetParent(dir).Parent.FullName;
                    string projectDirectory = dir;
                    string sFileName = "";
                    if (iDev)
                        sFileName = projectDirectory + @"\Email\ActivateAccount.html";
                    else
                        sFileName = dir + @"\Email\ActivateAccount.html";
                 
                    var file = new FileInfo(sFileName);
                    StreamReader sR = file.OpenText();
                    string sTemplate = sR.ReadToEnd();
                    #endregion

                    #region Send mail
                    MailConfig conf = getMailConfig(iDev);
                    string Title = conf.TitleNotification;
                    string DisplayName = conf.DisplayName;
                    string To = actMail.RecieverEmail;
                    //string To ="hieu@tanvieta.co";
                    int port = conf.Port;
                    string smtp = conf.SMTP;
                    string cc = conf.CC;
                    string cc1 = conf.CC1;
                    string sEmail = conf.From;
                    
                    sTemplate = sTemplate.Replace("[FullName]", actMail.RecieverFullName);

                    sTemplate = sTemplate.Replace("[Username]", actMail.Username);
                    sTemplate = sTemplate.Replace("[Password]", actMail.Password);


                    /// Remark info
                    sTemplate = sTemplate.Replace("[System_admin]", conf.SystemAdmin);
                    sTemplate = sTemplate.Replace("[System_admin_Email]", conf.SystemAdminEmail);
                    sTemplate = sTemplate.Replace("[System_admin_Tel]", conf.SystemAdminContact);

                    //int result = 0;
                    using (MailMessage mail = new MailMessage())
                    {
                        mail.From = new MailAddress(sEmail, DisplayName);
                        mail.To.Add(actMail.RecieverEmail);
                        mail.CC.Add(cc);
                        mail.CC.Add(cc1);
                        mail.Subject = Title;
                        mail.Body = sTemplate;
                        mail.IsBodyHtml = true;
                        mail.SubjectEncoding = System.Text.Encoding.UTF8;
                        mail.BodyEncoding = System.Text.Encoding.UTF8;
                        SmtpClient client = new SmtpClient(smtp, Convert.ToInt32(port));
                        client.UseDefaultCredentials = true;
                        string emailHost = conf.From;//"no-reply@appoint.com.sg";
                        string pwdEmail = conf.Password;
                        client.Credentials = new System.Net.NetworkCredential(emailHost, pwdEmail);
                        //_logger.Info("Reciever Email: " + notiMail.RecieverEmail);
                        if (IsValidEmail(actMail.RecieverEmail))
                        {
                            client.Send(mail);
                            i = 1;
                        }
                        else
                        {
                            i = 0;
                            //_logger.Info("Email not valid!");
                        }
                    }
                    #endregion
                }
                catch (Exception ex)
                {
                    //_logger.Info(ex.Message);
                    i = 0;
                }
                return i;
            });
            return result;
        }
        
        private MailConfig getMailConfig(bool isDev)
        {
            MailConfig value = new MailConfig();
            var dir = Directory.GetCurrentDirectory();
            //string projectDirectory = Directory.GetParent(dir).Parent.FullName;
            string projectDirectory = dir;
            //_logger.Info(projectDirectory);
            string file = "";
            if (isDev)
                file = projectDirectory + @"\Email\mailConfig.json";
            else
                file = dir + @"\Email\mailConfig.json";
            try
            {
                using (var r = new StreamReader(file))
                {
                    var t1 = r.ReadToEnd();
                    var t2 = JObject.Parse(t1);

                    var t3 = t2.GetValue(nameof(MailConfig));
                    value = t3.ToObject<MailConfig>();
                }
            }
            catch (Exception ex)
            {
                //_logger.Info(ex.Message);
            }
            return value;
        }

        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }
        public string tempStr;
        #endregion
    }
}