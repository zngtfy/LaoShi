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
using System.Collections.Generic;
using System.Linq;

namespace YEX.BLL
{
    using DAL;
    using DAL.Models;
    using System;
    using Req;
    using Microsoft.EntityFrameworkCore;

    public class GradStudentSvc : GenericSvc<StudentRep, Student>
    {
        public object getThesisStatistic(int thesisId, int uid)
        {
            var cls = _rep.Context.Thesis.Where(x => x.Id == thesisId)
                .Join(_rep.Context.ThesisStudent, a => a.Id, b => b.ThesisId, (a, b) => new
                {
                    b.ThesisId,
                    a.ThesisTitle,
                    a.Description,
                    a.ThesisType,
                    a.ThesisLevel,
                    a.ThesisCategory,
                    a.StudyField,
                    a.StudyCode,
                    a.Keyword,  
                    a.ThesisYear,
                    a.Members,
                    a.Note,
                    a.Status,                   
                    a.CreatedOn,
                    b.StudentId,
                    b.StartTime,
                    b.EndTime,
                    b.Role,
                    StudentNote = b.Note,
                })
                .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new
                {
                    a.ThesisId,
                    a.ThesisTitle,
                    a.Description,
                    a.ThesisType,
                    a.ThesisLevel,
                    a.ThesisCategory,
                    a.StudyField,
                    a.StudyCode,
                    a.Keyword,
                    a.ThesisYear,
                    a.Members,
                    a.Note,
                    a.Status,
                    a.CreatedOn,
                    a.StudentId,
                    a.StartTime,
                    a.EndTime,
                    a.Role,
                    a.StudentNote,
                    b.UserId, 
                    b.OfficialStudentId,
                    ClassName = b.Class,
                    b.CourseName,
                    b.SchoolId
                })
                .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new
                {
                    a.ThesisId,
                    a.ThesisTitle,
                    a.Description,
                    a.ThesisType,
                    a.ThesisLevel,
                    a.ThesisCategory,
                    a.StudyField,
                    a.StudyCode,
                    a.Keyword,
                    a.ThesisYear,
                    a.Members,
                    a.Note,
                    a.Status,
                    a.CreatedOn,
                    a.StudentId,
                    a.StartTime,
                    a.EndTime,
                    a.Role,
                    a.StudentNote,
                    a.UserId,
                    a.OfficialStudentId,
                    a.ClassName,
                    a.CourseName,
                    a.SchoolId,
                    b.SchoolCode,
                    b.SchoolName,
                    b.LogoUrl
                }).FirstOrDefault();

            var totTeacher = _rep.Context.ThesisTeacher
                .Where(x => x.ThesisId == thesisId)
                .Count();

            var totRef = _rep.Context.ThesisReference
                .Where(x => x.ThesisId == thesisId)
                .Count();

            var totDoc = _rep.Context.ThesisDoc
                .Where(x => x.ThesisId == thesisId)
                .Count();

            var works = _rep.Context.ThesisWork
                .Join(_rep.Context.ThesisWorkAttachment, a => a.Id, b => b.ThesisWorkId, (a, b) => new
                {
                    a.ThesisId,
                    a.WorkName,
                    a.WorkType,
                    b.Version,
                    b.ThesisWorkId,
                    b.DisplayName,
                    b.CreatedBy,
                    b.CreatedOn
                }).Where(x => x.ThesisId == thesisId);

            var totWork = works.Count();

            var stt = works
                .Join(_rep.Context.Code, a=>a.WorkType, b => b.Value, (a, b) => new
                {
                    a.ThesisId,
                    a.WorkName,
                    a.WorkType,
                    a.Version,
                    a.ThesisWorkId,
                    a.DisplayName,
                    a.CreatedBy,
                    a.CreatedOn,
                    b.DisplayAs,
                    b.CodeType
                })
                .Where(x => x.CreatedBy == uid && x.CodeType == "ThesisWorkType")
                .OrderByDescending(x=>x.CreatedOn)
                .Select(x => x.DisplayAs).FirstOrDefault();           

            var res = new
            {
                TotalTeacher = totTeacher,
                TotalReference = totRef,
                TotalDocument = totDoc,
                TotalUploadWork = totWork,
                PeriodStatus = stt
            };
            return res;
        }

        public object GetThesisInfo(int thesisId, int uid)
        {
            var teachers = _rep.Context.ThesisTeacher.Where(x => x.ThesisId == thesisId)
                .Join(_rep.Context.Teacher, a => a.TeacherId, b => b.Id, (a, b) => new
                {
                    a.ThesisId,
                    a.Role,
                    a.TeacherId,
                    a.Note,
                    a.Status,
                    b.UserId,
                    b.Title,
                    b.SchoolId,
                    b.FullName,
                    b.Email,
                    b.Gender,
                    b.PhoneNumber
                })
                .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new
                {
                    a.ThesisId,
                    a.Role,
                    a.TeacherId,
                    a.Note,
                    a.Status,
                    a.UserId,
                    a.Title,
                    a.SchoolId,
                    a.FullName,
                    a.Email,
                    a.Gender,
                    a.PhoneNumber,
                    b.SchoolCode,
                    b.SchoolName,
                    b.LogoUrl
                }).ToList();

            var group = _rep.Context.ThesisStudent.Where(x => x.ThesisId == thesisId)
                .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new
                {
                    a.ThesisId,
                    a.Role,
                    a.StudentId,
                    a.Note,
                    a.Status,
                    b.UserId,
                    a.StartTime,
                    b.SchoolId,
                    a.EndTime,
                    b.Gender,
                    b.OfficialStudentId,
                    b.Class,
                    b.CourseName
                })
                .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new
                {
                    a.ThesisId,
                    a.Role,
                    a.StudentId,
                    a.Note,
                    a.Status,
                    a.UserId,
                    a.StartTime,
                    a.SchoolId,
                    a.EndTime,
                    a.Gender,
                    a.OfficialStudentId,
                    a.Class,
                    a.CourseName,
                    b.SchoolCode,
                    b.SchoolName,
                    b.LogoUrl
                })
                .Join(_rep.Context.User, a => a.UserId, b => b.Id, (a, b) => new
                {
                    a.ThesisId,
                    a.Role,
                    a.StudentId,
                    a.Note,
                    a.Status,
                    a.UserId,
                    a.StartTime,
                    a.SchoolId,
                    a.EndTime,
                    a.Gender,
                    a.OfficialStudentId,
                    a.Class,
                    a.CourseName,
                    a.SchoolCode,
                    a.SchoolName,
                    a.LogoUrl,
                    FullName = b.LastName + " " + b.FirstName,
                    b.Email,
                    b.Avatar,
                    b.Phone,
                    b.Address
                }).ToList();

            var pubs = _rep.Context.ThesisPublication.Where(x => x.ThesisId == thesisId)
                .Join(_rep.Context.TeacherResearchWork, a => a.PublicationId, b => b.Id, (a, b) => new
                {
                    a.ThesisId,
                    a.PublicationId,
                    PublicType = b.Type,
                    b.Title,
                    b.CoAuthors,
                    b.Day,
                    b.Month,
                    b.Year,
                    b.City,
                    b.Publisher,
                    b.PublisherUrl,
                    b.IndexedBy,
                    b.Keywords
                }).ToList();

            var res = new
            {
                Teachers = teachers,
                Students = group,
                Publications = pubs
            };
            return res;
        }

        public object GetThesisDocument(int thesisId, int uid, int page, int size)
        {
            var announce = _rep.Context.ThesisDoc.Where(x => x.ThesisId == thesisId)
             .Join(_rep.Context.User, a => a.CreatedBy, b => b.Id, (a, b) => new
             {
                 a.Id,
                 a.ThesisId,
                 a.DocName,
                 a.Description,
                 a.Url,
                 a.Note,
                 a.CreatedBy,
                 a.CreatedOn,
                 a.Status,
                 CreatedByName = b.LastName + " " + b.FirstName
             });

            var offset = (page - 1) * size;
            var total = announce.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = announce.OrderByDescending(x => x.CreatedOn).Skip(offset).Take(size).ToList();
            var res = new
            {
                Data = data,
                TotalRecords = total,
                Page = page,
                Size = size,
                TotalPages = totalPage
            };
            return res;
        }

        public object GetStudentWorkType(string thesisType)
        {
            // thesisType == "Master-Thesis";
            // thesisType == "Bachelor-Thesis";
            // thesisType == "Engineer-Thesis";
            // thesisType == "Doctor-Thesis";
            var query = _rep.Context.Code.Where(x => x.CodeType == "ThesisWorkType");
            if (thesisType == "Master-Thesis")
            {
                var data = query.Where(x => x.Value.Contains("Master")).ToList();
                return data;
            }
            else if (thesisType == "Bachelor-Thesis" || thesisType == "Engineer-Thesis")
            {
                var data = query.Where(x => x.Value.Contains("Bachelor")).ToList();
                return data;
            }
            else
            {
                var data = query.Where(x => x.Value.Contains("Doctor")).ToList();
                return data;
            }
        }

        public object GetThesisWorks(int thesisId, string workType, int uid, int page, int size)
        {
            var wrk = _rep.Context.ThesisWork
                .Where(x => x.ThesisId == thesisId && x.CreatedBy == uid && x.WorkType == workType)
             .Join(_rep.Context.User, a => a.CreatedBy, b => b.Id, (a, b) => new
             {
                 a.Id,
                 a.ThesisId,
                 a.WorkType,
                 a.WorkName,
                 a.Note,
                 a.CreatedBy,
                 a.CreatedOn,
                 a.Status,
                 CreatedByName = b.LastName + " " + b.FirstName
             }).ToList();

            var works = from a in wrk
                        select new {
                            a.Id,
                            a.ThesisId,
                            a.WorkType,
                            a.WorkName,
                            a.Note,
                            a.CreatedBy,
                            a.CreatedOn,
                            a.Status,
                            a.CreatedByName,
                            Attachments = getAttachments(a.Id)
                        };

            var offset = (page - 1) * size;
            var total = works.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = works.OrderByDescending(x => x.CreatedOn).Skip(offset).Take(size).ToList();
            var res = new
            {
                Data = data,
                TotalRecords = total,
                Page = page,
                Size = size,
                TotalPages = totalPage
            };

            return res;
        }

        public object getAttachments(int thesisWorkId)
        {
            var res = _rep.Context.ThesisWorkAttachment
                .Where(x => x.ThesisWorkId == thesisWorkId).ToList();
            return res;
        }

        public string GetPathFileUpload(int thesisId, string workType, int uid)
        {
            string res = "";
            res = "/Thesis_" +thesisId.ToString() + "/" + workType;
            res = res + "/User_" + uid.ToString();
            return res;
        }

        public SingleRsp UploadWorkAttachment(List<ThesisWorkAttachment> lst, int thesisId, string worktype, int userId)
        {
            var res = new SingleRsp();
            var workName = _rep.Context.Code
                .Where(x => x.CodeType == "ThesisWorkType" && x.Value == worktype)
                .Select(x => x.DisplayAs).FirstOrDefault();
            //_rep.Context.Database.CurrentTransaction;            
            //var tran = _rep.Context.Database.BeginTransaction();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var now = DateTime.Now;
                        #region work
                        var work = new ThesisWork();
                        work.ThesisId = thesisId;
                        work.WorkName = workName;
                        work.WorkType = worktype;
                        work.CreatedBy = userId;
                        work.CreatedOn = now;
                        work.Status = 1;

                        var t = context.ThesisWork.Add(work);
                        context.SaveChanges();
                        #endregion

                        #region Attachment
                        foreach (ThesisWorkAttachment item in lst)
                        {
                            item.CreatedBy = userId;
                            item.CreatedOn = now;
                            item.ThesisWorkId = work.Id;
                            context.ThesisWorkAttachment.Add(item);
                            context.SaveChanges();
                        }
                        #endregion

                        res.Data = work;
                        tran.Commit();
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
        public ThesisWorkAttachment getAttachmentUrl(int id)
        {
            ThesisWorkAttachment res = _rep.Context.ThesisWorkAttachment
                .FirstOrDefault(x => x.Id == id);
            return res;
        }

        public object GetThesisReference(string keyword, int thesisId, int page, int size, int sortCode)
        {
            var query = _rep.Context.ThesisReference.Where(x => x.ThesisId == thesisId)
             .Join(_rep.Context.ReferenceDocument, a => a.ReferenceId, b => b.Id, (a, b) => new
             {
                 a.Id,
                 RefNote = a.Note,                                  
                 a.ReferenceId,
                 b.Type,
                 b.Title,
                 b.Authors,
                 b.Day,
                 b.Month,
                 b.Year,
                 b.City,
                 b.Publisher,
                 b.PublisherUrl,
                 b.Pages,
                 b.Doi,
                 b.Isbn,
                 b.Issn,
                 b.IndexedBy,
                 b.DownloadUrl,
                 b.RefUrl,
                 b.Introduction, 
                 b.Keywords,
                 b.CreatedOn
             })
             .Join(_rep.Context.Code, b => b.Type, a => a.Value, (b,a) => new
             {
                 b.Id,
                 b.RefNote,
                 b.ReferenceId,
                 b.Type,
                 b.Title,
                 b.Authors,
                 b.Day,
                 b.Month,
                 b.Year,
                 b.City,
                 b.Publisher,
                 b.PublisherUrl,
                 b.Pages,
                 b.Doi,
                 b.Isbn,
                 b.Issn,
                 b.IndexedBy,
                 b.DownloadUrl,
                 b.RefUrl,
                 b.Introduction,
                 b.Keywords,
                 b.CreatedOn,
                 a.CodeType,
                 TypeName = a.DisplayAs
             }).Where(x=>x.CodeType == "ReferenceType");

            if (!string.IsNullOrEmpty(keyword))
            {
                query = query.Where(x => x.Title.Contains(keyword)
                || x.Authors.Contains(keyword)
                || x.Publisher.Contains(keyword)
                || x.Keywords.Contains(keyword)
                || x.Introduction.Contains(keyword));
            }

            var offset = (page - 1) * size;
            var total = query.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            if (sortCode == 1)
                query = query.OrderByDescending(x=>x.Year);
            else if(sortCode == 2)
                query = query.OrderBy(x => x.Authors);
            else if (sortCode == 3)
                query = query.OrderBy(x => x.Title);
            else if (sortCode == 4)
                query = query.OrderBy(x => x.Type);

            var data = query.Skip(offset).Take(size).ToList();
            var res = new
            {
                Data = data,
                TotalRecords = total,
                Page = page,
                Size = size,
                TotalPages = totalPage
            };
            return res;
        }

        public GradStudentSvc() { }
    }
}
