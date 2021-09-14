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

using SKG.BLL;
using SKG.Rsp;
using System;
using System.Collections.Generic;
using System.Linq;

namespace YEX.BLL
{
    using DAL;
    using DAL.Models;
    using DAL.Dto;
    using Req;
    using System.Text.RegularExpressions;
    using System.IO;
    using Newtonsoft.Json.Linq;

    public class TeacherSvc : GenericSvc<TeacherRep, Teacher>
    {
        #region -- Overrides --

        /// <summary>
        /// Create the User
        /// </summary>
        /// <param name="m">The User</param>
        /// <returns>Return the result</returns>
        public override SingleRsp Create(Teacher m)
        {
            m.Status = (short)YEnum.Status.Normal;
            return base.Create(m);
        }

        /// <summary>
        /// Update
        /// </summary>
        /// <param name="m"></param>
        /// <returns>Return the result</returns>
        public override SingleRsp Update(Teacher m)
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
        public TeacherSvc()
        {
        }

        public object getTeacherInfo(int id)
        {
            var teacher = _rep.All.Where(x => x.Id == id)
                .Join(_rep.Context.User, a => a.UserId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.Title,
                    a.UserId,
                    a.Birthday,
                    a.FullName,
                    a.Address,
                    a.PhoneNumber,
                    a.Introduction,
                    a.SchoolId,
                    b.Email,
                    b.UserName,
                    b.Avatar
                })
                .Join(_rep.Context.School, a => a.UserId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.Title,
                    a.UserId,
                    a.Birthday,
                    a.FullName,
                    a.Address,
                    a.PhoneNumber,
                    a.Introduction,
                    a.SchoolId,
                    a.Email,
                    a.UserName,
                    a.Avatar,
                    b.SchoolCode,
                    b.SchoolName,
                    b.LogoUrl,
                    b.SchoolType,
                    b.SchoolAddress,
                    b.SchoolPhone,
                    b.WebSite,
                    SchoolDescription = b.Description
                }).FirstOrDefault();

            return teacher;
        }

        public object getTeacherEdu(int id, string eduType, int page, int size)
        {
            var edu = _rep.Context.TeacherEduBackground.Where(x => x.TeacherId == id)
                .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.Title,
                    a.Degree,
                    a.DegreeNo,
                    a.DegreeRegNo,
                    a.DegreeDate,
                    a.Type,
                    a.Duration,
                    a.YearOfGrad,
                    a.Result,
                    a.SchoolId,
                    a.CreatedBy,
                    a.CreatedOn,
                    a.Status,
                    b.SchoolCode,
                    b.SchoolName,
                    b.LogoUrl
                });
            if (!string.IsNullOrEmpty(eduType))
            {
                edu = edu.Where(x => x.Type == eduType);
            }
            var offset = (page - 1) * size;
            var total = edu.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = edu.OrderByDescending(x => x.CreatedOn).Skip(offset).Take(size).ToList();
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
        public object getTeacherExp(int id, string workType, int page, int size)
        {
            var exps = _rep.Context.TeacherExperience.Where(x => x.TeacherId == id);
            if (!string.IsNullOrEmpty(workType))
            {
                exps = exps.Where(x => x.WorkType == workType);
            }
            var offset = (page - 1) * size;
            var total = exps.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = exps.OrderByDescending(x => x.CreatedOn).Skip(offset).Take(size).ToList();
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

        public object getTeacherMajor(int id, int page, int size)
        {
            var majors = _rep.Context.TeacherMajor.Where(x => x.TeacherId == id);

            var offset = (page - 1) * size;
            var total = majors.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = majors.OrderByDescending(x => x.CreatedOn).Skip(offset).Take(size).ToList();
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

        public object getTeacherSkill(int id, string type, int page, int size)
        {
            var skills = _rep.Context.TeacherSkill.Where(x => x.TeacherId == id);
            if (!string.IsNullOrEmpty(type))
            {
                skills = skills.Where(x => x.Type == type);
            }
            var offset = (page - 1) * size;
            var total = skills.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = skills.OrderByDescending(x => x.CreatedOn).Skip(offset).Take(size).ToList();
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

        public object getTeacherResearchWork(int id, string type, string keyword, int page, int size)
        {
            var researches = _rep.Context.TeacherResearchWork.Where(x => x.TeacherId == id);
            if (!string.IsNullOrEmpty(type))
            {
                researches = researches.Where(x => x.Type == type);
            }

            if (!string.IsNullOrEmpty(keyword))
            {
                researches = researches.Where(x => x.Title.Contains(keyword)
                    || x.CoAuthors.Contains(keyword)
                    || x.Keywords.Contains(keyword)
                );
            }

            var offset = (page - 1) * size;
            var total = researches.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = researches.OrderByDescending(x => x.CreatedOn).Skip(offset).Take(size).ToList();
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

        public object getTeacherStudy(int id, string type, int page, int size)
        {
            var studies = _rep.Context.TeacherStudy.Where(x => x.TeacherId == id);
            if (!string.IsNullOrEmpty(type))
            {
                studies = studies.Where(x => x.Type == type);
            }
            var offset = (page - 1) * size;
            var total = studies.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = studies.OrderByDescending(x => x.CreatedOn).Skip(offset).Take(size).ToList();
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

        public object getTeacherDelegateStudent(int id, string type, string keyword, int page, int size)
        {
            var students = _rep.Context.TeacherDelegateStudent.Where(x => x.TeacherId == id)
                .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.StudentId,
                    a.TeacherId,
                    a.Topic,
                    a.Description,
                    a.Time,
                    a.SupervisedType,
                    a.RefUrl,
                    a.Note,
                    a.CreatedBy,
                    a.CreatedOn,
                    a.Status,
                    b.OfficialStudentId,
                    b.UserId,
                    b.Birthday,
                    b.Gender,
                    b.SchoolId
                })
                .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new
                {
                    a.StudentId,
                    a.TeacherId,
                    a.Topic,
                    a.Description,
                    a.Time,
                    a.SupervisedType,
                    a.RefUrl,
                    a.Note,
                    a.CreatedBy,
                    a.CreatedOn,
                    a.Status,
                    a.OfficialStudentId,
                    a.UserId,
                    a.Birthday,
                    a.Gender,
                    a.SchoolId,
                    b.SchoolCode,
                    b.SchoolName,
                    b.LogoUrl
                })
                .Join(_rep.Context.User, a => a.UserId, b => b.Id, (a, b) => new
                {
                    a.StudentId,
                    a.TeacherId,
                    a.Topic,
                    a.Description,
                    a.Time,
                    a.SupervisedType,
                    a.RefUrl,
                    a.Note,
                    a.CreatedBy,
                    a.CreatedOn,
                    a.Status,
                    a.OfficialStudentId,
                    a.UserId,
                    a.Birthday,
                    a.Gender,
                    a.SchoolId,
                    a.SchoolCode,
                    a.SchoolName,
                    a.LogoUrl,
                    b.Phone,
                    b.Email,
                    b.UserName,
                    b.Avatar,
                    b.Address,
                    Fullname = b.LastName + " " + b.FirstName
                });

            if (!string.IsNullOrEmpty(type))
            {
                students = students.Where(x => x.SupervisedType == type);
            }
            if (!string.IsNullOrEmpty(keyword))
            {
                students = students.Where(x => x.Topic.Contains(keyword)
                    || x.Fullname.Contains(keyword)
                    || x.Description.Contains(keyword)
                    || x.Email.Contains(keyword)
                );
            }

            var offset = (page - 1) * size;
            var total = students.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = students.OrderByDescending(x => x.CreatedOn).Skip(offset).Take(size).ToList();
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

        public object getTeacherPublicProfile(int id, string type, int page, int size)
        {
            var pubProfile = _rep.Context.TeacherPublicProfile.Where(x => x.TeacherId == id);
            if (!string.IsNullOrEmpty(type))
            {
                pubProfile = pubProfile.Where(x => x.SourceType == type);
            }
            var offset = (page - 1) * size;
            var total = pubProfile.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = pubProfile.OrderByDescending(x => x.CreatedOn).Skip(offset).Take(size).ToList();
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

        #endregion

        #region Teacher-Class
        public object GetClassForTeacher(int uid, int? stt, int page, int size)
        {
            var cls = _rep.Context.User.Where(x => x.Id == uid)
             .Join(_rep.Context.ClassMember, a => a.Id, b => b.MemberId, (a, b) => new
             {
                 TeacherId = b.MemberId,
                 b.ClassId,
                 b.MemberRole,
                 MemberDesc = b.Description
             })
             .Join(_rep.Context.Class, a => a.ClassId, b => b.Id, (a, b) => new
             {
                 a.TeacherId,
                 a.ClassId,
                 a.MemberRole,
                 a.MemberDesc,
                 ClassName = b.Name,
                 b.SubjectId,
                 b.ClassTime,
                 ClassCode = b.Code,
                 b.CreatedOn,
                 ClassDesc = b.Description,
                 b.Images,
                 b.SchoolYear,
                 b.Venue,
                 b.TotalSession,
                 b.StartDate,
                 b.EndDate,
                 b.Semester,
                 b.Note,
                 b.Status
             })
             .Join(_rep.Context.Subject, a => a.SubjectId, b => b.Id, (a, b) => new
             {
                 a.TeacherId,
                 a.ClassId,
                 a.MemberRole,
                 a.MemberDesc,
                 a.ClassName,
                 a.SubjectId,
                 a.ClassTime,
                 a.ClassCode,
                 a.CreatedOn,
                 a.ClassDesc,
                 a.Images,
                 a.SchoolYear,
                 a.Venue,
                 a.TotalSession,
                 a.StartDate,
                 a.EndDate,
                 a.Semester,
                 a.Note,
                 a.Status,
                 b.SubjectCode,
                 b.SubjectName,
                 b.SubjectType,
                 b.SchoolId
             })
             .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new
             {
                 a.TeacherId,
                 a.ClassId,
                 a.MemberRole,
                 a.MemberDesc,
                 a.ClassName,
                 a.SubjectId,
                 a.ClassTime,
                 a.ClassCode,
                 a.CreatedOn,
                 a.ClassDesc,
                 a.Images,
                 a.SchoolYear,
                 a.Venue,
                 a.TotalSession,
                 a.StartDate,
                 a.EndDate,
                 a.Semester,
                 a.Note,
                 a.Status,
                 a.SubjectCode,
                 a.SubjectName,
                 a.SubjectType,
                 a.SchoolId,
                 b.SchoolAddress,
                 b.WebSite,
                 b.SchoolCode,
                 b.SchoolName,
                 b.LogoUrl
             });

            if (stt.HasValue)
                cls = cls.Where(x => x.Status == stt.Value);

            var offset = (page - 1) * size;
            var total = cls.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = cls.OrderByDescending(x => x.CreatedOn).Skip(offset).Take(size).ToList();
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

        public object GetThesisForTeacher(int uid, int? stt, int page, int size)
        {
            var thes = _rep.Context.User.Where(x => x.Id == uid)
                .Join(_rep.Context.Teacher, a => a.Id, b => b.UserId, (a, b) => new
                {
                    TeacherId = b.Id,
                    a.Id,                    
                })
                .Join(_rep.Context.ThesisTeacher, a => a.TeacherId, b => b.TeacherId, (a, b) => new
                {
                    b.TeacherId,
                    b.ThesisId,
                    b.Role,
                    MemberDesc = b.Note
                })
                .Join(_rep.Context.Thesis, a => a.ThesisId, b => b.Id, (a, b) => new
                {
                    a.TeacherId,
                    a.ThesisId,
                    a.Role,
                    a.MemberDesc,
                    b.ThesisTitle,
                    b.ThesisLevel,
                    b.ThesisType,
                    b.ThesisYear,
                    b.ThesisCategory,
                    b.StudyCode,
                    b.StudyField,
                    b.Members,
                    ThesisNote = b.Note,
                    b.Status,
                    b.CreatedOn
                });

            if (stt.HasValue)
                thes = thes.Where(x => x.Status == stt.Value);

            var offset = (page - 1) * size;
            var total = thes.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = thes.OrderByDescending(x => x.CreatedOn).Skip(offset).Take(size).ToList();
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

        public object GetTeacherAllClass_Old(int uid, int? stt)
        {
            var cls = _rep.All.Where(x => x.UserId == uid)
             .Join(_rep.Context.ClassMember, a => a.Id, b => b.MemberId, (a, b) => new
             {
                 TeacherId = b.MemberId,
                 b.ClassId,
                 b.MemberRole,
                 MemberDesc = b.Description
             })
             .Join(_rep.Context.Class, a => a.ClassId, b => b.Id, (a, b) => new
             {
                 a.TeacherId,
                 a.ClassId,
                 a.MemberRole,
                 a.MemberDesc,
                 ClassName = b.Name,
                 b.SubjectId,
                 b.ClassTime,
                 ClassCode = b.Code,
                 b.CreatedOn,
                 ClassDesc = b.Description,
                 b.Images,
                 b.SchoolYear,
                 b.Venue,
                 b.TotalSession,
                 b.StartDate,
                 b.EndDate,
                 b.Semester,
                 b.Note,
                 b.Status
             })
             .Join(_rep.Context.Subject, a => a.SubjectId, b => b.Id, (a, b) => new
             {
                 a.TeacherId,
                 a.ClassId,
                 a.MemberRole,
                 a.MemberDesc,
                 a.ClassName,
                 a.SubjectId,
                 a.ClassTime,
                 a.ClassCode,
                 a.CreatedOn,
                 a.ClassDesc,
                 a.Images,
                 a.SchoolYear,
                 a.Venue,
                 a.TotalSession,
                 a.StartDate,
                 a.EndDate,
                 a.Semester,
                 a.Note,
                 a.Status,
                 b.SubjectCode,
                 b.SubjectName,
                 b.SubjectType,
                 b.SchoolId,
                 b.TotalCredit,
                 b.PracticeCredit,
                 b.TheoryCredit,
                 b.Department
             })
             .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new
             {
                 a.TeacherId,
                 a.ClassId,
                 a.MemberRole,
                 a.MemberDesc,
                 a.ClassName,
                 a.SubjectId,
                 a.ClassTime,
                 a.ClassCode,
                 a.CreatedOn,
                 a.ClassDesc,
                 a.Images,
                 a.SchoolYear,
                 a.Venue,
                 a.TotalSession,
                 a.StartDate,
                 a.EndDate,
                 a.Semester,
                 a.Note,
                 a.Status,
                 a.SubjectCode,
                 a.SubjectName,
                 a.SubjectType,
                 a.SchoolId,
                 a.TotalCredit,
                 a.PracticeCredit,
                 a.TheoryCredit,
                 a.Department,
                 b.SchoolAddress,
                 b.WebSite,
                 b.SchoolCode,
                 b.SchoolName,
                 b.LogoUrl
             });

            if (stt.HasValue)
                cls = cls.Where(x => x.Status == stt.Value);

            var data = cls.OrderByDescending(x => x.CreatedOn).ToList();

            return data;
        }

        public object GetTeacherAllClass(int uid, int? stt)
        {
            var cls = _rep.Context.User.Where(x => x.Id == uid)
             .Join(_rep.Context.ClassMember, a => a.Id, b => b.MemberId, (a, b) => new
             {
                 TeacherId = b.MemberId,
                 b.ClassId,
                 b.MemberRole,
                 MemberDesc = b.Description
             })
             .Join(_rep.Context.Class, a => a.ClassId, b => b.Id, (a, b) => new
             {                 
                 a.ClassId,
                 a.MemberRole,
                 a.MemberDesc,
                 a.TeacherId,
                 TeacherOfClass = b.TeacherId,
                 ClassName = b.Name,
                 b.SubjectId,
                 b.ClassTime,
                 ClassCode = b.Code,
                 b.CreatedOn,
                 ClassDesc = b.Description,
                 b.Images,
                 b.SchoolYear,
                 b.Venue,
                 b.TotalSession,
                 b.StartDate,
                 b.EndDate,
                 b.Semester,
                 b.Note,
                 b.Status
             })
             .Join(_rep.Context.Subject, a => a.SubjectId, b => b.Id, (a, b) => new
             {
                 a.TeacherOfClass,
                 a.TeacherId,
                 a.ClassId,
                 a.MemberRole,
                 a.MemberDesc,
                 a.ClassName,
                 a.SubjectId,
                 a.ClassTime,
                 a.ClassCode,
                 a.CreatedOn,
                 a.ClassDesc,
                 a.Images,
                 a.SchoolYear,
                 a.Venue,
                 a.TotalSession,
                 a.StartDate,
                 a.EndDate,
                 a.Semester,
                 a.Note,
                 a.Status,
                 b.SubjectCode,
                 b.SubjectName,
                 b.SubjectType,
                 b.SchoolId,
                 b.TotalCredit,
                 b.PracticeCredit,
                 b.TheoryCredit,
                 b.Department
             })
             .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new
             {
                 a.TeacherOfClass,
                 a.TeacherId,
                 a.ClassId,
                 a.MemberRole,
                 a.MemberDesc,
                 a.ClassName,
                 a.SubjectId,
                 a.ClassTime,
                 a.ClassCode,
                 a.CreatedOn,
                 a.ClassDesc,
                 a.Images,
                 a.SchoolYear,
                 a.Venue,
                 a.TotalSession,
                 a.StartDate,
                 a.EndDate,
                 a.Semester,
                 a.Note,
                 a.Status,
                 a.SubjectCode,
                 a.SubjectName,
                 a.SubjectType,
                 a.SchoolId,
                 a.TotalCredit,
                 a.PracticeCredit,
                 a.TheoryCredit,
                 a.Department,
                 b.SchoolAddress,
                 b.WebSite,
                 b.SchoolCode,
                 b.SchoolName,
                 b.LogoUrl
             });

            if (stt.HasValue)
                cls = cls.Where(x => x.Status == stt.Value);

            var data = cls.OrderByDescending(x => x.CreatedOn).ToList();

            return data;
        }

        public object GetTeacherClassById(int classId)
        {
            var cls = _rep.Context.Class.FirstOrDefault(x => x.Id == classId);
            var lsSession = _rep.Context.ClassSession
                .Where(x => x.ClassId == classId && (x.Status == 1 || x.Status == 2))
                .ToList();
            var lsTeacher = _rep.Context.ClassMember
                .Where(x => x.ClassId == classId && x.Status == 1)
                .Join(_rep.Context.User, a => a.MemberId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.MemberId,
                    a.MemberRole,
                    a.Description,
                    a.Note,
                    a.Status,
                    a.CreatedBy,
                    a.CreatedOn,
                    FullName = b.LastName + " " + b.FirstName,
                    b.Email,
                    b.UserName,
                    b.Avatar
                }).ToList();

            var res = new
            {
                Class = cls,
                Sessions = lsSession,
                Teachers = lsTeacher
            };
            return res;
        }

        public SingleRsp SaveTeacherClassInfo(Class cls)
        {
            var res = new SingleRsp();
            Class c = _rep.Context.Class.FirstOrDefault(x => x.Id == cls.Id);
            if (c != null)
            {
                c.Id = cls.Id;
                c.Code = cls.Code;
                c.Name = cls.Name;
                c.Venue = cls.Venue;
                c.Description = cls.Description;
                c.ClassTime = cls.ClassTime;
                c.StartDate = cls.StartDate;
                c.EndDate = cls.EndDate;
                c.Prerequisition = cls.Prerequisition;
                c.Semester = cls.Semester;
                c.SchoolYear = cls.SchoolYear;
                c.Note = cls.Note;
                c.ModifiedBy = cls.ModifiedBy;
            }
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var now = DateTime.Now;
                        c.ModifiedOn = now;

                        var t = context.Class.Update(c);
                        context.SaveChanges();

                        res.Data = c;
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

        public SingleRsp CompleteClassNext(int classId, int uid)
        {
            var res = new SingleRsp();
            Class c = _rep.Context.Class.FirstOrDefault(x => x.Id == classId);
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var now = DateTime.Now;
                        c.ModifiedOn = now;
                        c.ModifiedBy = uid;
                        c.Status = 2;
                        var t = context.Class.Update(c);
                        context.SaveChanges();

                        res.Data = c;
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

        public SingleRsp DeleteTeacherClassSession(int sessId, int uid)
        {
            var res = new SingleRsp();
            ClassSession c = _rep.Context.ClassSession.FirstOrDefault(x => x.Id == sessId);
            var now = DateTime.Now;
            var totSess = _rep.Context.ClassSession
                .Where(x => x.ClassId == c.ClassId && (x.Status == 1 || x.Status == 2))
                .Count();
            Class cls = _rep.Context.Class.FirstOrDefault(x => x.Id == c.ClassId);
            cls.TotalSession = totSess - 1;
            cls.ModifiedBy = uid;
            cls.ModifiedOn = now;
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.ClassSession.Remove(c);
                        context.SaveChanges();

                        var t1 = context.Class.Update(cls);
                        context.SaveChanges();

                        res.Data = cls;
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

        public SingleRsp CompleteTeacherClassSession(int sessId, int uid)
        {
            var res = new SingleRsp();
            ClassSession c = _rep.Context.ClassSession.FirstOrDefault(x => x.Id == sessId);
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        c.ModifiedOn = DateTime.Now;
                        c.ModifiedBy = uid;
                        c.Status = 2;

                        var t = context.ClassSession.Update(c);
                        context.SaveChanges();

                        res.Data = c;
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

        public SingleRsp CreateNewClassSession(ClassSession ses)
        {
            var res = new SingleRsp();
            var now = DateTime.Now;
            var totSess = _rep.Context.ClassSession
                .Where(x => x.ClassId == ses.ClassId && (x.Status == 1 || x.Status == 2))
                .Count();
            Class cls = _rep.Context.Class.FirstOrDefault(x => x.Id == ses.ClassId);
            cls.TotalSession = totSess + 1;
            cls.ModifiedBy = ses.ModifiedBy;
            cls.ModifiedOn = now;

            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        ClassSession c = new ClassSession();
                        c.ClassId = ses.ClassId;
                        c.Session = ses.Session;
                        c.Brief = ses.Brief;
                        c.ClassContent = ses.ClassContent;
                        c.DateOfClass = ses.DateOfClass;
                        c.SessionType = ses.SessionType;
                        c.FromTime = ses.FromTime;
                        c.ToTime = ses.ToTime;
                        c.TotalClassUnit = ses.TotalClassUnit;
                        c.Location = ses.Location;
                        c.Note = ses.Note;
                        c.CreatedBy = ses.CreatedBy;
                        c.Status = ses.Status;
                        c.CreatedOn = now;

                        var t = context.ClassSession.Add(c);
                        context.SaveChanges();

                        var t1 = context.Class.Update(cls);
                        context.SaveChanges();

                        res.Data = new
                        {
                            Class = cls,
                            Session = c
                        };
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

        public SingleRsp SaveClassSession(ClassSession ses)
        {
            var res = new SingleRsp();
            ClassSession c = _rep.Context.ClassSession.FirstOrDefault(x => x.Id == ses.Id);
            if (c != null)
            {
                c.Id = ses.Id;
                c.ClassId = ses.ClassId;
                c.Session = ses.Session;
                c.Brief = ses.Brief;
                c.ClassContent = ses.ClassContent;
                c.DateOfClass = ses.DateOfClass;
                c.SessionType = ses.SessionType;
                c.FromTime = ses.FromTime;
                c.ToTime = ses.ToTime;
                c.TotalClassUnit = ses.TotalClassUnit;
                c.Location = ses.Location;
                c.Note = ses.Note;
                c.ModifiedBy = ses.ModifiedBy;
            }
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var now = DateTime.Now;
                        c.ModifiedOn = now;
                        var t = context.ClassSession.Update(c);
                        context.SaveChanges();

                        res.Data = c;
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

        //////////////Score-Config
        public object GetTeacherClassScoreConfig(int classId)
        {
            var ls = _rep.Context.ClassScoreConfig
                .Where(x => x.ClassId == classId && (x.Status == 1 || x.Status == 2))
                .ToList();
            var sc = from a in ls
                     select new
                     {
                         a.Id,
                         a.ClassId,
                         a.ScoreType,
                         a.Description,
                         a.Percentage,
                         a.RefAssignmentId,
                         a.Note,
                         a.Status,
                         a.CreatedBy,
                         a.CreatedOn,
                         a.ModifiedBy,
                         a.ModifiedOn,
                         ResultStatus = getResultStatusForSC(a.ClassId.Value, a.Id),
                         SubmitStatus = getSubmitStatusForSC(a.ClassId.Value, a.Id)
                     };

            return sc;
        }

        private string getSubmitStatusForSC(int classId, int scId)
        {
            string str = null;
            int n = _rep.Context.ClassScoreConfig
                .Where(x => x.ClassId == classId && x.Id == scId)
                .Join(_rep.Context.AssignmentSubmission, a => a.RefAssignmentId, b => b.ClassAssignmentId, (a, b) => new
                {
                    a.Id,
                    a.ClassId,
                    a.RefAssignmentId,
                    b.CreatedBy
                })
                .Count();
            if (n > 0)
                str = "submitted";
            else
                str = "not-submitted";
            return str;
        }

        private string getResultStatusForSC(int classId, int scId)
        {
            string str = null;
            int n = _rep.Context.ClassStudentScore
                .Where(x => x.ClassId == classId && x.RefScoreConfig == scId).Count();
            if (n > 0)
                str = "scored";
            else
                str = "unscored";
            return str;
        }

        public object GetTeacherClassListAssignment(int classId)
        {
            var ls = _rep.Context.ClassAssignment
                .Where(x => x.ClassId == classId && (x.Status == 1 || x.Status == 2))
                .ToList();
            return ls;
        }
        public object GetTeacherClassStudentList(int classId)
        {
            var ls = _rep.Context.ClassStudent
                .Where(x => x.ClassId == classId && (x.Status == 1 || x.Status == 2))
                .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.StudentId,
                    a.ClassId,
                    a.Status,
                    a.Note,
                    a.CreatedBy,
                    a.CreatedOn,
                    b.OfficialStudentId,
                    b.UserId,
                    b.Birthday,
                    b.Gender,
                    b.SchoolId
                })
                .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new
                {

                    a.Id,
                    a.StudentId,
                    a.ClassId,
                    a.Status,
                    a.Note,
                    a.CreatedBy,
                    a.CreatedOn,
                    a.OfficialStudentId,
                    a.UserId,
                    a.Birthday,
                    a.Gender,
                    a.SchoolId,
                    b.SchoolCode,
                    b.SchoolName,
                    b.LogoUrl
                })
                .Join(_rep.Context.User, a => a.UserId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.StudentId,
                    a.ClassId,
                    a.Status,
                    a.Note,
                    a.CreatedBy,
                    a.CreatedOn,
                    a.OfficialStudentId,
                    a.UserId,
                    a.Birthday,
                    a.Gender,
                    a.SchoolId,
                    a.SchoolCode,
                    a.SchoolName,
                    a.LogoUrl,
                    b.Phone,
                    b.Email,
                    b.UserName,
                    b.Avatar,
                    b.Address,
                    Fullname = b.LastName + " " + b.FirstName
                }).ToList();
            var lst = from a in ls
                      select new
                      {
                          a.Id,
                          a.StudentId,
                          a.ClassId,
                          a.Status,
                          a.Note,
                          a.CreatedBy,
                          a.CreatedOn,
                          a.OfficialStudentId,
                          a.UserId,
                          a.Birthday,
                          a.Gender,
                          a.SchoolId,
                          a.SchoolCode,
                          a.SchoolName,
                          a.LogoUrl,
                          a.Phone,
                          a.Email,
                          a.UserName,
                          a.Avatar,
                          a.Address,
                          a.Fullname,
                          Score = "",
                          ScoreType = "",
                          Percentage = "",
                          RefScoreConfig = "",
                          Submissions = ""
                      };
            return lst;
        }

        public SingleRsp SaveTeacherClassScoreConfig(ClassScoreConfig sc)
        {
            var ok = false;
            var res = new SingleRsp();
            ClassScoreConfig c = _rep.Context.ClassScoreConfig.FirstOrDefault(x => x.Id == sc.Id);
            if (c != null)
            {
                c.Id = sc.Id;
                c.ClassId = sc.ClassId;
                c.ScoreType = sc.ScoreType;
                c.Percentage = sc.Percentage;
                c.Description = sc.Description;
                if (sc.RefAssignmentId > 0)
                    c.RefAssignmentId = sc.RefAssignmentId;
                else
                    c.RefAssignmentId = null;
                c.Note = sc.Note;
                c.ModifiedBy = sc.ModifiedBy;
            }
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var now = DateTime.Now;
                        c.ModifiedOn = now;

                        var t = context.ClassScoreConfig.Update(c);
                        context.SaveChanges();
                        ok = true;
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        ok = false;
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            if (ok)
            {
                res.Data = new
                {
                    c.Id,
                    c.ClassId,
                    c.ScoreType,
                    c.Description,
                    c.Percentage,
                    c.RefAssignmentId,
                    c.Note,
                    c.Status,
                    c.CreatedBy,
                    c.CreatedOn,
                    c.ModifiedBy,
                    c.ModifiedOn,
                    ResultStatus = getResultStatusForSC(c.ClassId.Value, c.Id),
                    SubmitStatus = getSubmitStatusForSC(c.ClassId.Value, c.Id),
                };
            }
            return res;
        }

        public SingleRsp CreateNewClassScoreConfig(ClassScoreConfig sc)
        {
            var res = new SingleRsp();
            var ok = false;
            ClassScoreConfig c = new ClassScoreConfig();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        c.ClassId = sc.ClassId;
                        c.ScoreType = sc.ScoreType;
                        c.Percentage = sc.Percentage;
                        c.Description = sc.Description;
                        if (sc.RefAssignmentId > 0)
                            c.RefAssignmentId = sc.RefAssignmentId;
                        c.Note = sc.Note;
                        c.CreatedBy = sc.CreatedBy;
                        c.Status = sc.Status;
                        c.CreatedOn = DateTime.Now;

                        var t = context.ClassScoreConfig.Add(c);
                        context.SaveChanges();
                        ok = true;
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        ok = false;
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            if (ok)
            {
                res.Data = new
                {
                    c.Id,
                    c.ClassId,
                    c.ScoreType,
                    c.Description,
                    c.Percentage,
                    c.RefAssignmentId,
                    c.Note,
                    c.Status,
                    c.CreatedBy,
                    c.CreatedOn,
                    c.ModifiedBy,
                    c.ModifiedOn,
                    ResultStatus = getResultStatusForSC(c.ClassId.Value, c.Id),
                    SubmitStatus = getSubmitStatusForSC(c.ClassId.Value, c.Id),
                };
            }
            return res;
        }

        public SingleRsp CompleteClassScoreConfig(int scId, int uid)
        {
            var res = new SingleRsp();
            var ok = false;
            ClassScoreConfig c = _rep.Context.ClassScoreConfig.FirstOrDefault(x => x.Id == scId);
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var now = DateTime.Now;
                        c.ModifiedOn = now;
                        c.ModifiedBy = uid;
                        c.Status = 2;
                        var t = context.ClassScoreConfig.Update(c);
                        context.SaveChanges();
                        ok = true;
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        ok = false;
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            if (ok)
            {
                res.Data = new
                {
                    c.Id,
                    c.ClassId,
                    c.ScoreType,
                    c.Description,
                    c.Percentage,
                    c.RefAssignmentId,
                    c.Note,
                    c.Status,
                    c.CreatedBy,
                    c.CreatedOn,
                    c.ModifiedBy,
                    c.ModifiedOn,
                    ResultStatus = getResultStatusForSC(c.ClassId.Value, c.Id),
                    SubmitStatus = getSubmitStatusForSC(c.ClassId.Value, c.Id),
                };
            }
            return res;
        }

        public SingleRsp DeleteTeacherClassScoreConfig(int scId)
        {
            var res = new SingleRsp();
            ClassScoreConfig c = _rep.Context.ClassScoreConfig.FirstOrDefault(x => x.Id == scId);

            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.ClassScoreConfig.Remove(c);
                        context.SaveChanges();
                        res.Data = "deleted";
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

        public int CheckClassStudentScore(int classId, int scId, int uid)
        {
            var n = _rep.Context.ClassStudentScore
                .Where(x => x.ClassId == classId
                && x.RefScoreConfig == scId
                && (x.Status == 1 || x.Status == 2)).Count();
            /// sv đã có trong score
            var ids_existed = _rep.Context.ClassStudentScore
                .Where(x => x.ClassId == classId
                && x.RefScoreConfig == scId && x.StudentId.HasValue
                && (x.Status == 1 || x.Status == 2))
                .Select(x => x.StudentId.Value).ToList();
            // sv trong lớp
            var ids_inClass = _rep.Context.ClassStudent
                .Where(x => x.ClassId == classId
                && x.StudentId.HasValue
                && (x.Status == 1 || x.Status == 2))
                .Select(x => x.StudentId.Value).ToList();
                        
            var ids_not_in_class = ids_existed.Except(ids_inClass); // để xóa
            var ids_not_in_score = ids_inClass.Except(ids_existed); // để thêm            

            var sc = _rep.Context.ClassScoreConfig.Where(x => x.Id == scId).FirstOrDefault();
            if (n == 0 || ids_not_in_score.Count() > 0 || ids_not_in_class.Count() > 0)
            {
                var now = DateTime.Now;
                var ls = _rep.Context.ClassStudent
                    .Where(x => x.ClassId == classId 
                        && x.StudentId.HasValue
                        && ids_not_in_score.Contains(x.StudentId.Value))
                     .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new
                     {
                         a.Id,
                         a.StudentId,
                         a.ClassId,
                         a.Status,
                         a.Note,
                         a.CreatedBy,
                         a.CreatedOn,
                         b.OfficialStudentId,
                         b.UserId,
                         b.Birthday,
                         b.Gender,
                         b.SchoolId
                     })
                    .ToList();
                using (var context = new ZContext())
                {
                    using (var tran = context.Database.BeginTransaction())
                    {
                        try
                        {
                            // Thêm vào score
                            if(ls.Count>0)
                            {
                                foreach (var stu in ls)
                                {
                                    ClassStudentScore css = new ClassStudentScore();
                                    css.StudentId = stu.StudentId;
                                    css.ClassStudentId = stu.Id;
                                    css.ClassId = stu.ClassId;
                                    css.ScoreType = sc.ScoreType;
                                    css.Percentage = sc.Percentage;
                                    css.Note = "MSSV: " + stu.OfficialStudentId;
                                    css.RefScoreConfig = sc.Id;
                                    css.CreatedOn = now;
                                    css.CreatedBy = uid;
                                    css.Status = 1;

                                    var t = context.ClassStudentScore.Add(css);
                                    context.SaveChanges();
                                }
                            }                            
                            
                            // xóa khỏi score
                            if(ids_not_in_class.Count()>0)
                            {   
                                var lsCss = context.ClassStudentScore
                                    .Where(x => x.ClassId == classId 
                                    && x.StudentId.HasValue
                                    && ids_not_in_class.Contains(x.StudentId.Value))
                                    .ToList();
                                context.ClassStudentScore.RemoveRange(lsCss);
                                context.SaveChanges();                               
                            }
                            tran.Commit();
                        }
                        catch
                        {
                            tran.Rollback();
                        }
                    }
                }
            }
            return n;
        }

        public SingleRsp GetTeacherClassStudentScore(int classId, int scId)
        {
            SingleRsp res = new SingleRsp();
            var ls = _rep.Context.ClassStudentScore
                .Where(x => x.ClassId == classId
                && x.RefScoreConfig == scId
                && (x.Status == 1 || x.Status == 2))
                .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.StudentId,
                    a.ClassStudentId,
                    a.ClassId,
                    a.Status,
                    a.Note,
                    a.Score,
                    a.ScoreType,
                    a.Percentage,
                    a.RefScoreConfig,
                    a.CreatedBy,
                    a.CreatedOn,
                    b.OfficialStudentId,
                    b.UserId,
                    b.Birthday,
                    b.Gender,
                    b.SchoolId,
                    b.StudentType
                })
                .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.StudentId,
                    a.ClassStudentId,
                    a.ClassId,
                    a.Status,
                    a.Note,
                    a.Score,
                    a.ScoreType,
                    a.Percentage,
                    a.RefScoreConfig,
                    a.CreatedBy,
                    a.CreatedOn,
                    a.OfficialStudentId,
                    a.UserId,
                    a.Birthday,
                    a.Gender,
                    a.SchoolId,
                    a.StudentType,
                    b.SchoolCode,
                    b.SchoolName
                })
                .Join(_rep.Context.User, a => a.UserId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.StudentId,
                    a.ClassStudentId,
                    a.ClassId,
                    a.Status,
                    a.Note,
                    a.Score,
                    a.ScoreType,
                    a.Percentage,
                    a.RefScoreConfig,
                    a.CreatedBy,
                    a.CreatedOn,
                    a.OfficialStudentId,
                    a.UserId,
                    a.Birthday,
                    a.Gender,
                    a.StudentType,
                    a.SchoolId,
                    a.SchoolCode,
                    a.SchoolName,
                    b.Phone,
                    b.Email,
                    b.UserName,
                    b.Avatar,
                    b.Address,
                    Fullname = b.LastName + " " + b.FirstName,
                    b.LastName,
                    b.FirstName
                })
                .Join(_rep.Context.ClassScoreConfig, a => a.RefScoreConfig, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.StudentId,
                    a.ClassStudentId,
                    a.ClassId,
                    a.Status,
                    a.Note,
                    a.Score,
                    a.ScoreType,
                    a.Percentage,
                    a.RefScoreConfig,
                    a.CreatedBy,
                    a.CreatedOn,
                    a.OfficialStudentId,
                    a.UserId,
                    a.Birthday,
                    a.Gender,
                    a.StudentType,
                    a.SchoolId,
                    a.SchoolCode,
                    a.SchoolName,
                    a.Phone,
                    a.Email,
                    a.UserName,
                    a.Avatar,
                    a.Address,
                    a.Fullname,
                    a.LastName,
                    a.FirstName,
                    b.RefAssignmentId
                }).ToList();
            var ls1 = from a in ls
                      join b in _rep.Context.ClassAssignment on a.RefAssignmentId equals b.Id into ps
                      from b in ps.DefaultIfEmpty()
                      select new
                      {
                          a.Id,
                          a.StudentId,
                          a.ClassStudentId,
                          a.ClassId,
                          a.Status,
                          a.Note,
                          a.Score,
                          a.ScoreType,
                          a.Percentage,
                          a.RefScoreConfig,
                          a.CreatedBy,
                          a.CreatedOn,
                          a.OfficialStudentId,
                          a.UserId,
                          a.Birthday,
                          a.Gender,
                          a.StudentType,
                          a.SchoolId,
                          a.SchoolCode,
                          a.SchoolName,
                          a.Phone,
                          a.Email,
                          a.UserName,
                          a.Avatar,
                          a.Address,
                          a.Fullname,
                          a.LastName,
                          a.FirstName,
                          a.RefAssignmentId,
                          GroupNo = b == null ? 0 : b.GroupNo
                      };
                
            var lst = from a in ls1
                      select new
                      {
                          a.Id,
                          a.StudentId,
                          a.ClassStudentId,
                          a.ClassId,
                          a.Status,
                          a.Note,
                          a.Score,
                          a.ScoreType,
                          a.Percentage,
                          a.RefScoreConfig,
                          a.CreatedBy,
                          a.CreatedOn,
                          a.OfficialStudentId,
                          a.UserId,
                          a.Birthday,
                          a.Gender,
                          a.StudentType,
                          a.SchoolId,
                          a.SchoolCode,
                          a.SchoolName,
                          a.Phone,
                          a.Email,
                          a.UserName,
                          a.Avatar,
                          a.Address,
                          a.Fullname,
                          a.LastName,
                          a.FirstName,
                          TotalGroup = a.GroupNo,
                          Submissions = getAllSubmission(a.RefAssignmentId, a.GroupNo, a.UserId),
                          GroupNo = getGroupNo(a.RefAssignmentId, a.GroupNo, a.UserId)
                      };
            res.Data = lst;
            return res;
        }

        private int? getGroupNo(int? assignId,int? grp, int? uid)
        {
            if (grp.HasValue && grp.Value > 1)
            {
                var group = _rep.Context.ClassAssignmentGroup
                      .Where(x => x.ClassAssignmentId == assignId && x.UserId == uid)
                      .Select(x => x.GroupNo).FirstOrDefault();
                return group;
            }
            else
                return null;
        }

        private object getAllSubmission(int? assignId, int? grp, int? uid)
        {
            if (assignId.HasValue && uid.HasValue)
            {
                List<int?> uids = new List<int?>();
                if(uid.HasValue)
                    uids.Add(uid);
                if (grp.HasValue && grp.Value > 1)
                {
                    var group = _rep.Context.ClassAssignmentGroup
                    .Where(x => x.ClassAssignmentId == assignId && x.UserId == uid)
                    .Select(x => x.GroupNo).FirstOrDefault();
                    if (group.HasValue)
                    {
                        var ls = _rep.Context.ClassAssignmentGroup
                            .Where(x => x.ClassAssignmentId == assignId && x.GroupNo == group)
                            .Select(x => x.UserId).ToList();
                        uids.AddRange(ls);
                    }
                }

                var latest = _rep.Context.AssignmentSubmission
                    .Where(x => x.ClassAssignmentId == assignId && uids.Contains(x.CreatedBy))
                    .FirstOrDefault();
                if (latest != null)
                {
                    var ls = _rep.Context.SubmissionAttachment
                    .Where(x => x.SubmissionId == latest.Id).ToList();
                    return new
                    {
                        Submission = latest,
                        Attachments = ls
                    };
                }
                else
                    return null;
            }
            else
                return null;
        }

        public SingleRsp SaveTeacherClassStudentScore(List<ClassStudentScore> lst)
        {
            SingleRsp res = new SingleRsp();
            var now = DateTime.Now;
            List<ClassStudentScore> lst1 = new List<ClassStudentScore>();
            foreach (var s in lst)
            {
                var item = _rep.Context.ClassStudentScore.Where(x => x.Id == s.Id).FirstOrDefault();
                if (s.Score != item.Score)
                {
                    s.CreatedBy = item.CreatedBy;
                    s.CreatedOn = item.CreatedOn;
                    lst1.Add(s);
                }
            }
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        foreach (var c in lst1)
                        {
                            c.ModifiedOn = now;
                            var t = context.ClassStudentScore.Update(c);
                            context.SaveChanges();
                        }
                        res.Data = lst1;
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
        #endregion

        #region Teacher-Class-Assignment        
        public object GetTeacherClassAssignment(int classId, int userId)
        {
            var mat = _rep.Context.ClassAssignment.Where(x => x.ClassId == classId)
             .Join(_rep.Context.User, a => a.CreatedBy, b => b.Id, (a, b) => new
             {
                 a.Id,
                 a.Name,
                 a.ClassId,
                 a.AssignmentType,
                 a.AssignmentContent,
                 a.AssignmentUrl,
                 a.GroupNo,
                 a.DueDate,
                 a.RequireSubmit,
                 a.SubmitType,
                 a.CreatedBy,
                 a.CreatedOn,
                 a.Status,
                 a.ModifiedBy,
                 a.ModifiedOn
             }).ToList();
            var data = from a in mat
                       select new
                       {
                           a.Id,
                           a.Name,
                           a.ClassId,
                           a.AssignmentType,
                           a.AssignmentContent,
                           a.AssignmentUrl,
                           a.GroupNo,
                           a.DueDate,
                           a.RequireSubmit,
                           a.SubmitType,
                           a.CreatedBy,
                           a.CreatedOn,
                           a.Status,
                           a.ModifiedBy,
                           a.ModifiedOn,
                           CreatedByName = getFullName(a.CreatedBy),
                           ModifiedByName = getFullName(a.ModifiedBy)
                       };
            var codes = _rep.Context.Code.Where(x => x.CodeType == "SubmitType")
                .Select(x => new
                {
                    x.Id,
                    x.Value,
                    x.DisplayAs
                })
                .ToList();

            var res = new
            {
                Normal = data.Where(x => x.SubmitType != "Per-Online-Test"),
                OnlineTest = data.Where(x => x.SubmitType == "Per-Online-Test"),
                SubmitType = codes
            };
            return res;
        }

        private string getFullName(int? uid)
        {
            string res = "";
            if (uid.HasValue)
            {
                var usr = _rep.Context.User.FirstOrDefault(x => x.Id == uid);
                if (usr != null)
                    res = usr.LastName + " " + usr.FirstName;
            }
            return res;
        }

        public SingleRsp SaveTeacherClassAssignment(ClassAssignment ca)
        {
            var res = new SingleRsp();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var now = DateTime.Now;
                        ca.ModifiedOn = now;

                        var t = context.ClassAssignment.Update(ca);
                        context.SaveChanges();
                        tran.Commit();

                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            res.Data = new
            {
                ca.Id,
                ca.Name,
                ca.ClassId,
                ca.AssignmentType,
                ca.AssignmentContent,
                ca.AssignmentUrl,
                ca.GroupNo,
                ca.DueDate,
                ca.RequireSubmit,
                ca.SubmitType,
                ca.CreatedBy,
                ca.CreatedOn,
                ca.Status,
                ca.ModifiedBy,
                ca.ModifiedOn,
                CreatedByName = getFullName(ca.CreatedBy),
                ModifiedByName = getFullName(ca.ModifiedBy)
            };
            return res;
        }

        public SingleRsp CreateNewClassAssignment(ClassAssignment ca)
        {
            var res = new SingleRsp();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        ca.CreatedOn = DateTime.Now;
                        var t = context.ClassAssignment.Add(ca);
                        context.SaveChanges();
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            res.Data = new
            {
                ca.Id,
                ca.Name,
                ca.ClassId,
                ca.AssignmentType,
                ca.AssignmentContent,
                ca.AssignmentUrl,
                ca.GroupNo,
                ca.DueDate,
                ca.RequireSubmit,
                ca.SubmitType,
                ca.CreatedBy,
                ca.CreatedOn,
                ca.Status,
                ca.ModifiedBy,
                ca.ModifiedOn,
                CreatedByName = getFullName(ca.CreatedBy),
                ModifiedByName = ""
            };
            return res;
        }

        public SingleRsp CompleteClassAssignment(int caId, int uid)
        {
            var res = new SingleRsp();
            ClassAssignment ca = _rep.Context.ClassAssignment.FirstOrDefault(x => x.Id == caId);
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var now = DateTime.Now;
                        ca.ModifiedOn = now;
                        ca.ModifiedBy = uid;
                        ca.Status = 2;
                        var t = context.ClassAssignment.Update(ca);
                        context.SaveChanges();
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            res.Data = new
            {
                ca.Id,
                ca.Name,
                ca.ClassId,
                ca.AssignmentType,
                ca.AssignmentContent,
                ca.AssignmentUrl,
                ca.GroupNo,
                ca.DueDate,
                ca.RequireSubmit,
                ca.SubmitType,
                ca.CreatedBy,
                ca.CreatedOn,
                ca.Status,
                ca.ModifiedBy,
                ca.ModifiedOn,
                CreatedByName = getFullName(ca.CreatedBy),
                ModifiedByName = getFullName(ca.ModifiedBy)
            };
            return res;
        }

        public SingleRsp DeleteTeacherClassAssignment(int saId)
        {
            var res = new SingleRsp();
            ClassAssignment c = _rep.Context.ClassAssignment.FirstOrDefault(x => x.Id == saId);

            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.ClassAssignment.Remove(c);
                        context.SaveChanges();
                        res.Data = "deleted";
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

        public object GetTeacherClassAssignmentStudentGroup(int aid)
        {
            var assign = _rep.Context.ClassAssignment.Where(x => x.Id == aid).FirstOrDefault();
            var n = _rep.Context.ClassAssignmentGroup.Where(x => x.ClassAssignmentId == aid).Count();
            if (n == 0 && assign != null && assign.GroupNo > 1)
            {
                var sLs = _rep.Context.ClassStudent.Where(x => x.ClassId == assign.ClassId)
                    .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new
                    {
                        a.Id,
                        a.StudentId,
                        b.UserId,
                    })
                    .ToList();
                int max = assign.GroupNo.Value + 1;
                var rand = new Random();
                List<ClassAssignmentGroup> list = new List<ClassAssignmentGroup>();
                foreach (var s in sLs)
                {
                    ClassAssignmentGroup item = new ClassAssignmentGroup();
                    item.StudentId = s.StudentId;
                    item.ClassAssignmentId = assign.Id;
                    item.UserId = s.UserId;
                    item.GroupNo = rand.Next(1, max);
                    list.Add(item);
                }
                using (var context = new ZContext())
                {
                    using (var tran = context.Database.BeginTransaction())
                    {
                        try
                        {
                            foreach (var item in list)
                            {
                                context.ClassAssignmentGroup.Add(item);
                                context.SaveChanges();
                            }
                            tran.Commit();
                        }
                        catch
                        {
                            tran.Rollback();
                        }
                    }
                }
            }

            var data = _rep.Context.ClassAssignmentGroup.Where(x => x.ClassAssignmentId == aid)
             .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new
             {
                 a.Id,
                 a.GroupNo,
                 a.ClassAssignmentId,
                 a.StudentId,
                 b.UserId,
                 b.OfficialStudentId,
                 b.Class,
                 b.Birthday,
                 b.SchoolId
             })
              .Join(_rep.Context.User, a => a.UserId, b => b.Id, (a, b) => new
              {
                  a.Id,
                  a.GroupNo,
                  a.ClassAssignmentId,
                  a.StudentId,
                  a.UserId,
                  a.OfficialStudentId,
                  a.Class,
                  a.Birthday,
                  a.SchoolId,
                  b.Avatar,
                  Fullname = b.LastName + " " + b.FirstName
              })
              .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new
              {
                  a.Id,
                  a.GroupNo,
                  a.ClassAssignmentId,
                  a.StudentId,
                  a.UserId,
                  a.OfficialStudentId,
                  a.Class,
                  a.Birthday,
                  a.Fullname,
                  a.Avatar,
                  a.SchoolId,
                  b.SchoolCode,
                  b.SchoolName
              })
              .ToList();

            return data;
        }

        public SingleRsp SaveTeacherClassAssignmentStudentGroup(List<ClassAssignmentGroup> lst)
        {
            var res = new SingleRsp();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        foreach (var s in lst)
                        {
                            var t = context.ClassAssignmentGroup.Update(s);
                            context.SaveChanges();
                        }
                        res.Data = "updated";
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

        public object GetTeacherClassAssignmentExam(int aid)
        {
            var exam = _rep.Context.ClassAssignmentExam.Where(x => x.ClassAssignmentId == aid).FirstOrDefault();
            return exam;
        }

        public object GetExamForClassAssignment(int aid)
        {
            var assign = _rep.Context.ClassAssignment.Where(x => x.Id == aid)
                .Join(_rep.Context.Class, a => a.ClassId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.ClassId,
                    a.AssignmentType,
                    a.AssignmentContent,
                    a.SubmitType,
                    a.GroupNo,
                    b.SubjectId
                })
                .FirstOrDefault();
            if (assign != null && assign.SubmitType.Contains("Online-Test"))
            {
                var exams = _rep.Context.Exam.Where(x => x.SubjectId == assign.SubjectId && x.Status == 1).ToList();
                return exams;
            }
            else
            {
                return null;
            }
        }

        public SingleRsp SaveTeacherClassAssignmentExam(ClassAssignmentExam exam)
        {
            var res = new SingleRsp();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        exam.ModifiedOn = DateTime.Now;
                        var t = context.ClassAssignmentExam.Update(exam);
                        context.SaveChanges();

                        res.Data = exam;
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

        public SingleRsp CreateTeacherClassAssignmentExam(ClassAssignmentExam exam)
        {
            var res = new SingleRsp();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        exam.CreatedOn = DateTime.Now;
                        var t = context.ClassAssignmentExam.Add(exam);
                        context.SaveChanges();

                        res.Data = exam;
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
        #endregion


        #region Teacher-Class-Assignment-Student
        public object GetTeacherClassStudent(int cid, string keyword, int page, int size)
        {
            var stu = _rep.Context.ClassStudent.Where(x => x.ClassId == cid)
                    .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new {
                        a.Id,
                        a.StudentId,
                        a.ClassId,
                        a.Status,
                        b.Note,
                        a.StudentRole,
                        a.FinalScore,
                        a.CreatedBy,
                        a.CreatedOn,
                        b.OfficialStudentId,
                        b.UserId,
                        b.Birthday,
                        b.Gender,
                        b.SchoolId,
                        ClassName = b.Class,
                        b.CourseName,
                        b.StudentType
                    })
                    .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new {
                        a.Id,
                        a.StudentId,
                        a.ClassId,
                        a.Status,
                        a.Note,
                        a.StudentRole,
                        a.FinalScore,
                        a.CreatedBy,
                        a.CreatedOn,
                        a.OfficialStudentId,
                        a.UserId,
                        a.Birthday,
                        a.Gender,
                        a.SchoolId,
                        a.ClassName,
                        a.CourseName,
                        a.StudentType,
                        b.SchoolCode,
                        b.SchoolName
                    })
                    .Join(_rep.Context.User, a => a.UserId, b => b.Id, (a, b) => new {
                        a.Id,
                        a.StudentId,
                        a.ClassId,
                        a.Status,
                        a.Note,
                        a.StudentRole,
                        a.FinalScore,
                        a.CreatedBy,
                        a.CreatedOn,
                        a.OfficialStudentId,
                        a.UserId,
                        a.Birthday,
                        a.Gender,
                        a.SchoolId,
                        a.ClassName,
                        a.CourseName,
                        a.StudentType,
                        a.SchoolCode,
                        a.SchoolName,
                        b.Phone,
                        b.Email,
                        b.UserName,
                        b.Avatar,
                        b.Address,
                        Fullname = b.LastName + " " + b.FirstName,
                        b.LastName, 
                        b.FirstName
                    });
            if(!string.IsNullOrEmpty(keyword))
            {
                stu = stu.Where(x=>x.Fullname.Contains(keyword) 
                || x.OfficialStudentId.Contains(keyword)
                || x.UserName.Contains(keyword)
                || x.Email.Contains(keyword)
                || x.Phone.Contains(keyword));
            }
            var offset = (page - 1) * size;
            var total = stu.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = stu.OrderByDescending(x => x.CreatedOn).Skip(offset).Take(size).ToList();
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
        public object GetTeacherClassStudentInfo(int csId)
        {
            var cs = _rep.Context.ClassStudent.FirstOrDefault(x => x.Id == csId);
            var stu = _rep.Context.Student.FirstOrDefault(x => x.Id == cs.StudentId);
            var usr = _rep.Context.User.Where(x => x.Id == stu.UserId)
                .Select(x => new { 
                    x.Id,
                    x.FirstName,
                    x.LastName,
                    x.Email,
                    x.Phone,
                    x.Avatar,
                    x.Address,
                    x.UserName,
                    x.CreatedBy,
                    x.CreatedOn,
                    x.ModifiedBy,
                    x.ModifiedOn
                }).FirstOrDefault();
            return new
            {
                ClassStudent= cs,
                Student = stu,
                User = usr
            };
        }
        public SingleRsp CheckOfficialStudentId(string osId, int schoolId, int classId)
        {
            SingleRsp res = new SingleRsp();
            var query = _rep.Context.Student
                .Where(x => x.SchoolId == schoolId && x.OfficialStudentId == osId);
            var n = query.Count();
            if(n>0)
            {
                var stu = query.FirstOrDefault();
                var m = _rep.Context.ClassStudent.Where(x => x.ClassId == classId && x.StudentId == stu.Id).Count();
                if(m==0)
                {
                    var usr = _rep.Context.User.FirstOrDefault(x => x.Id == stu.UserId);
                    res.Data = new
                    {
                        CheckResult = "Existed-not-in-Classs",
                        Student = stu,
                        User = usr
                    };
                }
                else
                {
                    res.Data = new
                    {
                        CheckResult = "Existed-in-Classs",                        
                    };
                }
                
            }
            else
            {
                res.Data = new
                {
                    CheckResult = "OK",
                };
            }
                
            return res;
        }

        public SingleRsp CheckEmailExisted(string email)
        {
            SingleRsp res = new SingleRsp();
            var query = _rep.Context.User
                .Where(x => x.Email == email);
            var n = query.Count();
            if (n > 0)
                res.Data = "Existed-Email";
            else
                res.Data = "OK";
            return res;
        }

        public SingleRsp SaveTeacherClassStudentInfo(ClassStudent cs, Student s, User u, int uid)
        {
            var now = DateTime.Now;
            ClassStudent cs1 = _rep.Context.ClassStudent.FirstOrDefault(x=>x.Id == cs.Id);
            cs1.ModifiedBy = uid;
            cs1.StudentRole = cs.StudentRole;
            cs1.ModifiedOn = now;
            ////////////
            Student s1 = _rep.Context.Student.FirstOrDefault(x => x.Id == s.Id);
            s1.ModifiedBy = uid;
            s1.ModifiedOn = now;
            s1.OfficialStudentId = s.OfficialStudentId;
            s1.Birthday = s.Birthday;
            s1.Gender = s.Gender;
            s1.StudentType = s.StudentType;
            s1.Class = s.Class;
            s1.CourseName = s.CourseName;
            /////////////
            User u1 = _rep.Context.User.FirstOrDefault(x => x.Id == u.Id);
            u1.ModifiedBy = uid;
            u1.ModifiedOn = now;
            u1.FirstName = u.FirstName;
            u1.LastName = u.LastName;
            u1.Phone = u.Phone;
            u1.Address = u.Address;
            u1.Email = u.Email;

            var res = new SingleRsp();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        
                        var t1 = context.ClassStudent.Update(cs1);
                        context.SaveChanges();

                        var t2 = context.Student.Update(s1);
                        context.SaveChanges();

                        var t3 = context.User.Update(u1);
                        context.SaveChanges();

                        res.Data = new {
                            ClassStudent = cs1,
                            Student = s1,
                            User = u1
                        };
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

        public SingleRsp CreateTeacherClassStudentInfo(ClassStudent cs, Student s, User u)
        {
            var now = DateTime.Now;
            Student s1 = _rep.Context.Student.FirstOrDefault(x => x.Id == s.Id);
            if(s1!=null)
            {
                s1.ModifiedBy = cs.CreatedBy;
                s1.ModifiedOn = now;
                s1.OfficialStudentId = s.OfficialStudentId;
                s1.Birthday = s.Birthday;
                s1.Gender = s.Gender;
                s1.StudentType = s.StudentType;
                s1.Class = s.Class;
                s1.CourseName = s.CourseName;
            }            
            /////////////
            User u1 = _rep.Context.User.FirstOrDefault(x => x.Id == u.Id);
            if(u1!=null)
            {
                u1.ModifiedBy = cs.CreatedBy;
                u1.ModifiedOn = now;
                u1.FirstName = u.FirstName;
                u1.LastName = u.LastName;
                u1.Phone = u.Phone;
                u1.Address = u.Address;
                u1.Email = u.Email;
            }
            
            var res = new SingleRsp();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        if(s1 !=null && u1!=null)
                        {
                            var t1 = context.User.Update(u1);
                            context.SaveChanges();
                            //////////                            
                            var t2 = context.Student.Update(s1);
                            context.SaveChanges();
                            /////
                            cs.CreatedOn = now;
                            cs.StudentId = s1.Id;
                            var t3 = context.ClassStudent.Add(cs);
                            context.SaveChanges();

                            res.Data = new
                            {
                                ClassStudent = cs,
                                Student = s1,
                                User = u1
                            };
                        }
                        else
                        {
                            u.CreatedOn = now;
                            var t1 = context.User.Add(u);
                            context.SaveChanges();
                            //////////
                            s.CreatedOn = now;
                            s.UserId = u.Id;
                            var t2 = context.Student.Add(s);
                            context.SaveChanges();
                            //////////////
                            cs.CreatedOn = now;
                            cs.StudentId = s.Id;
                            var t3 = context.ClassStudent.Add(cs);
                            context.SaveChanges();

                            res.Data = new
                            {
                                ClassStudent = cs,
                                Student = s,
                                User = u
                            };
                        }
                        ////////                        
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

        public List<object> CheckValidStudentInfoForUpload(List<StudentInfolUploadReq> lst)
        {
            List<object> arr = new List<object>();
            for(int i=0; i<lst.Count; i++)
            {
                var info = lst[i];
                string res = "";
                if (!info.ClassId.HasValue)
                {
                    res = "Mã [lớp] chưa có !";
                }
                else
                {
                    var n = _rep.Context.Class.Where(x => x.Id == info.ClassId).Count();
                    if (n != 1)
                        res = "Mã [lớp] không tồn tại trong hệ thống !";
                }
                if (!info.SchoolId.HasValue)
                {
                    res = " | Mã [trường] chưa có !";
                }
                else
                {
                    var n = _rep.Context.School.Where(x => x.Id == info.SchoolId).Count();
                    if (n != 1)
                        res = " | Mã [Trường] không tồn tại trong hệ thống !";
                }
                if (!IsValidEmail(info.Email))
                    res = res + " | Email không hợp lệ !";
                if (!IsValidMSSV(info.OfficialStudentId))
                    res = res + " | Mã số sinh viên / học viên không hợp lệ !";
                if (info.StudentType != "Grad-Student" && info.StudentType != "Under-Student")
                    res = res + " | StudentType không hợp lệ, chỉ có  thể là [Under-Student] hoặc [Grad-Student]!";
                if (string.IsNullOrEmpty(info.LastName.Trim()))
                    res = res + " | Họ sinh viên không được trống !";
                if (string.IsNullOrEmpty(info.FirstName.Trim()))
                    res = res + " | Tên sinh viên không được trống !";
                if (string.IsNullOrEmpty(info.Phone.Trim()))
                    res = res + " | SĐT của sinh viên không được trống !";
                if (string.IsNullOrEmpty(info.Address.Trim()))
                    res = res + " | Địa chỉ liên lạc của sinh viên không được trống !";
                if(res!="")
                {
                    var obj = new
                    {
                        Row = i + 1,
                        Message = res
                    };
                    arr.Add(obj);
                }
            }
            return arr;
        }
        public SingleRsp SaveClassStudentInfoByUpload(List<StudentInfolUploadReq> lst, int uid)
        {
            SingleRsp res = new SingleRsp();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var now = DateTime.Now;
                        List<object> arr = new List<object>();
                        foreach (var info in lst)
                        {
                            // Kiểm tra user đã tồn tại chưa, nếu rồi, map với Student, nếu chưa, tạo mới
                            User usr = context.User.Where(x => x.Email == info.Email).FirstOrDefault();
                            if (usr != null)
                            {
                                usr.FirstName = info.FirstName;
                                usr.LastName = info.LastName;
                                usr.Phone = info.Phone;
                                usr.Address = info.Address;
                                usr.ModifiedOn = now;
                                usr.ModifiedBy = uid;
                                ///// Save
                                context.Update(usr);
                                context.SaveChanges();
                            }
                            else
                            {
                                usr = new User();
                                usr.UserName = info.Email;
                                usr.Email = info.Email;
                                usr.Status = 0;
                                usr.Avatar = "assets/img/avatars/ava1.png";
                                usr.FirstName = info.FirstName;
                                usr.LastName = info.LastName;
                                usr.Phone = info.Phone;
                                usr.Address = info.Address;
                                usr.CreatedOn = now;
                                usr.CreatedBy = uid;
                                ///// Create
                                context.Add(usr);
                                context.SaveChanges();
                            }

                            // Kiểm tra Student đã tồn tại hay chưa, nếu rồi, chỉnh sửa UserId theo Id mới tìm đc; nếu ko tạo mới Student
                            Student stu = context.Student
                                .Where(x => x.OfficialStudentId == info.OfficialStudentId
                                && x.SchoolId == info.SchoolId).FirstOrDefault();
                            if (stu != null)
                            {
                                stu.Gender = info.Gender;
                                stu.Birthday = info.Birthday;
                                stu.Class = info.ClassName;
                                stu.StudentType = info.StudentType;
                                stu.CourseName = info.CourseName;
                                stu.Note = info.Note;
                                stu.ModifiedOn = now;
                                stu.ModifiedBy = uid;
                                if (stu.UserId != usr.Id && usr.ModifiedBy.HasValue)
                                {
                                    usr.Status = 0;
                                    usr.ModifiedOn = now;
                                    usr.ModifiedBy = uid;
                                    ///// Save
                                    context.Update(usr);
                                    context.SaveChanges();
                                }
                                stu.UserId = usr.Id;
                                ///// Save
                                context.Student.Update(stu);
                                context.SaveChanges();
                            }
                            else
                            {
                                stu.Gender = info.Gender;
                                stu.Birthday = info.Birthday;
                                stu.Class = info.ClassName;
                                stu.CourseName = info.CourseName;
                                stu.Note = info.Note;
                                stu.StudentType = info.StudentType;
                                stu.Status = 1;
                                stu.SchoolId = info.SchoolId;
                                stu.OfficialStudentId = info.OfficialStudentId;
                                stu.CreatedOn = now;
                                stu.CreatedBy = uid;
                                stu.UserId = usr.Id;
                                ///// Create
                                context.Student.Add(stu);
                                context.SaveChanges();
                            }

                            // Kiểm tra ClassStudent tồn tại hay chưa, nếu rồi, update, chỉnh sửa StudentRole; Nếu chưa tạo mới ClassStudent
                            var cstu = context.ClassStudent
                                .Where(x => x.StudentId == stu.Id
                                && x.ClassId == info.ClassId).FirstOrDefault();
                            if (cstu != null)
                            {
                                cstu.StudentRole = info.StudentRole;
                                cstu.Note = "Lớp [" + stu.Class + "], " + stu.CourseName + " | Update tự động bởi GV !";
                                cstu.ModifiedBy = uid;
                                cstu.ModifiedOn = now;
                                ///// Save
                                context.ClassStudent.Update(cstu);
                                context.SaveChanges();
                            }
                            else
                            {
                                cstu.StudentRole = info.StudentRole;
                                cstu.Note = "Lớp [" + stu.Class + "], " + stu.CourseName + " | Update tự động bởi GV !";
                                cstu.CreatedOn = now;
                                cstu.CreatedBy = uid;
                                cstu.Status = 1;
                                cstu.ClassId = info.ClassId;
                                ///// Create
                                context.ClassStudent.Add(cstu);
                                context.SaveChanges();
                            }
                            var obj = new
                            {
                                ClassStudent = cstu,
                                Student = stu,
                                User = usr
                            };
                            arr.Add(obj);
                        }

                        res.Data = arr;
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetMessage(ex.Message);
                        res.SetError(ex.Message);
                    }
                }
            }
            return res;
        }

        public List<StudentInfolDownloadReq> GetClassStudentInfoFullData(int classId)
        {
            List<StudentInfolDownloadReq> lst = new List<StudentInfolDownloadReq>();
            #region Get STudent DATA
            var lsStu = _rep.Context.ClassStudent.Where(x => x.ClassId == classId)
                    .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new
                    {
                        a.Id,
                        a.StudentId,
                        a.ClassId,
                        a.Status,
                        a.Note,
                        a.StudentRole,
                        a.FinalScore,
                        a.CreatedBy,
                        a.CreatedOn,
                        b.OfficialStudentId,
                        b.UserId,
                        b.Birthday,
                        b.Gender,
                        b.SchoolId,
                        ClassName = b.Class,
                        b.CourseName,
                        b.StudentType,
                    })
                    .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new
                    {
                        a.Id,
                        a.StudentId,
                        a.ClassId,
                        a.Status,
                        a.Note,
                        a.StudentRole,
                        a.FinalScore,
                        a.CreatedBy,
                        a.CreatedOn,
                        a.OfficialStudentId,
                        a.UserId,
                        a.Birthday,
                        a.Gender,
                        a.SchoolId,
                        a.ClassName,
                        a.CourseName,
                        a.StudentType,
                        b.SchoolCode,
                        b.SchoolName
                    })
                    .Join(_rep.Context.User, a => a.UserId, b => b.Id, (a, b) => new
                    {
                        a.Id,
                        a.StudentId,
                        a.ClassId,
                        a.Status,
                        a.Note,
                        a.StudentRole,
                        a.FinalScore,
                        a.CreatedBy,
                        a.CreatedOn,
                        a.OfficialStudentId,
                        a.UserId,
                        a.Birthday,
                        a.Gender,
                        a.SchoolId,
                        a.ClassName,
                        a.CourseName,
                        a.StudentType,
                        a.SchoolCode,
                        a.SchoolName,
                        b.Phone,
                        b.Email,
                        b.UserName,
                        b.Avatar,
                        b.Address,
                        b.LastName,
                        b.FirstName
                    }).ToList();
            foreach(var s in lsStu)
            {
                StudentInfolDownloadReq stu = new StudentInfolDownloadReq();
                stu.ClassId = s.ClassId;
                stu.ClassName = s.ClassName;
                stu.StudentRole = s.StudentRole;
                stu.OfficialStudentId = s.OfficialStudentId;
                stu.Birthday = s.Birthday;
                stu.Gender = s.Gender;
                stu.StudentType = s.StudentType;
                stu.Class = s.ClassName;
                stu.CourseName = s.CourseName;
                stu.Note = s.Note;
                stu.SchoolName = s.SchoolName;
                stu.FirstName = s.FirstName;
                stu.LastName = s.LastName;
                stu.Email = s.Email;
                stu.Phone = s.Phone;
                stu.Address = s.Address;
                stu.ClassId = s.ClassId;
                stu.ListScore = GetListScore(s.ClassId.Value, s.StudentId.Value);
                lst.Add(stu);
            }
            #endregion
            return lst;
        }

        private List<ClassScoreConfigReq> GetListScore(int cId, int sId)
        {
            List<ClassScoreConfigReq> lst = new List<ClassScoreConfigReq>();
            var stu = _rep.Context.Student.Where(x => x.Id == sId)
                .Join(_rep.Context.ClassStudent, a => a.Id, b => b.StudentId, (a, b) => new
                {
                    StudentId = a.Id,
                    a.SchoolId,
                    a.UserId,
                    a.OfficialStudentId,
                    a.StudentType,
                    b.ClassId
                }).FirstOrDefault();
            var score = _rep.Context.ClassScoreConfig
                .Where(x => x.ClassId == cId);

            var assign = _rep.Context.ClassAssignment.Where(x => x.ClassId == cId);
            var stuScore = _rep.Context.ClassStudentScore
                .Where(x => x.ClassId == cId && x.StudentId == stu.StudentId);

            var data = from a in score
                       join b in assign on a.RefAssignmentId equals b.Id into ps
                       from b in ps.DefaultIfEmpty()
                       select new
                       {
                           a.Id,
                           a.ClassId,
                           a.ScoreType,
                           a.Description,
                           a.Percentage,
                           a.RefAssignmentId,
                           a.CreatedBy,
                           a.CreatedOn,
                           a.Status,
                           AssignmentName = b == null ? "" : b.Name,
                           AssignmentUrl = b == null ? "" : b.AssignmentUrl,
                           AssignmentType = b == null ? "" : b.AssignmentType,
                           AssignmentContent = b == null ? "" : b.AssignmentContent,
                           AssignmentGroupNo = b == null ? 0 : b.GroupNo
                       };
            var lsScore = from a in data
                      join b in stuScore on a.Id equals b.RefScoreConfig into ps
                      from b in ps.DefaultIfEmpty()
                      select new
                      {
                          a.Id,
                          a.ClassId,
                          a.ScoreType,
                          a.Description,
                          a.Percentage,
                          a.RefAssignmentId,
                          a.CreatedBy,
                          a.CreatedOn,
                          a.Status,
                          a.AssignmentName,
                          a.AssignmentUrl,
                          a.AssignmentType,
                          a.AssignmentContent,
                          a.AssignmentGroupNo,
                          Score = b == null ? null : b.Score,
                          ScoreStatus = b == null ? "Chưa có điểm" : "Đã có điểm",
                      };

            foreach(var s in lsScore)
            {
                ClassScoreConfigReq c = new ClassScoreConfigReq();
                c.ClassScoreConfigId = s.Id;
                c.ClassId = s.ClassId;
                c.ScoreType = s.ScoreType;
                c.Description = s.Description;
                c.Percentage = s.Percentage;
                c.RefAssignmentId = s.RefAssignmentId;
                c.RefAssignmentName = s.AssignmentName;                
                c.Score = s.Score;
                c.ScoreStatus = s.ScoreStatus;
                if (s.Score.HasValue)
                { 
                    if(s.Score.Value < 5)
                        c.ScoreResult = "Chưa đạt"; 
                    else
                        c.ScoreResult = "Đạt";
                }
                else
                    c.ScoreResult = null;
                lst.Add(c);
            }

            return lst;
        }
        public ClassInfoReq GetClassInfo(int cId)
        {
            ClassInfoReq res = new ClassInfoReq();
            var cls = _rep.Context.Class.Where(x => x.Id == cId)
                .Join(_rep.Context.Teacher, a => a.TeacherId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.Code,
                    a.Name,
                    a.SubjectId,
                    a.Venue,
                    a.Description,
                    a.ClassTime,
                    a.StartDate,
                    a.EndDate,
                    a.Semester,
                    a.SchoolYear,
                    a.TotalSession,
                    a.Note,
                    a.TeacherId,
                    TeacherName = b.Title + " " + b.FullName
                })
                .Join(_rep.Context.Subject, a => a.SubjectId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.Code,
                    a.Name,
                    a.SubjectId,
                    a.Venue,
                    a.Description,
                    a.ClassTime,
                    a.StartDate,
                    a.EndDate,
                    a.Semester,
                    a.SchoolYear,
                    a.TotalSession,
                    a.Note,
                    a.TeacherId,
                    a.TeacherName,
                    b.SubjectCode,
                    b.SubjectName,
                    b.TotalCredit,
                    b.SchoolId
                })
                .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.Code,
                    a.Name,
                    a.SubjectId,
                    a.Venue,
                    a.Description,
                    a.ClassTime,
                    a.StartDate,
                    a.EndDate,
                    a.Semester,
                    a.SchoolYear,
                    a.TotalSession,
                    a.Note,
                    a.TeacherId,
                    a.TeacherName,
                    a.SubjectCode,
                    a.SubjectName,
                    a.TotalCredit,
                    a.SchoolId,
                    b.SchoolCode,
                    b.SchoolName
                }).FirstOrDefault();
            res.Id = cls.Id;
            res.Code = cls.Code;
            res.Name = cls.Name;
            res.SubjectId = cls.SubjectId;
            res.SubjectCode = cls.SubjectCode;
            res.SubjectName = cls.SubjectName;
            res.TotalCredit = cls.TotalCredit;
            res.Venue = cls.Venue;
            res.Description = cls.Description;
            res.ClassTime = cls.ClassTime;
            res.StartDate = cls.StartDate;
            res.EndDate = cls.EndDate;
            res.Semester = cls.Semester;
            res.SchoolYear = cls.SchoolYear;
            res.TotalSession = cls.TotalSession;
            res.Note = cls.Note;
            res.TeacherId = cls.TeacherId;
            res.TeacherName = cls.TeacherName;
            res.SchoolCode = cls.SchoolCode;
            res.SchoolName = cls.SchoolName;
            return res;
        }

        public object GetStudentScoreList(int cId, int sId)
        {
            var stu = _rep.Context.Student.Where(x => x.Id == sId)
                .Join(_rep.Context.ClassStudent, a => a.Id, b => b.StudentId, (a, b) => new
                {
                    StudentId = a.Id,
                    a.SchoolId,
                    a.UserId,
                    a.OfficialStudentId,
                    a.StudentType,
                    b.ClassId
                }).FirstOrDefault();
            var score = _rep.Context.ClassScoreConfig
                .Where(x => x.ClassId == cId);

            var assign = _rep.Context.ClassAssignment.Where(x => x.ClassId == cId);
            var stuScore = _rep.Context.ClassStudentScore
                .Where(x => x.ClassId == cId && x.StudentId == stu.StudentId);

            var data = from a in score
                       join b in assign on a.RefAssignmentId equals b.Id into ps
                       from b in ps.DefaultIfEmpty()
                       select new
                       {
                           a.Id,
                           a.ClassId,
                           a.ScoreType,
                           a.Description,
                           a.Percentage,
                           a.RefAssignmentId,
                           a.CreatedBy,
                           a.CreatedOn,
                           a.Status,
                           AssignmentName = b == null ? "" : b.Name,
                           AssignmentUrl = b == null ? "" : b.AssignmentUrl,
                           AssignmentType = b == null ? "" : b.AssignmentType,
                           AssignmentContent = b == null ? "" : b.AssignmentContent,
                           AssignmentGroupNo = b == null ? 0 : b.GroupNo
                       };
            var lsScore = from a in data
                          join b in stuScore on a.Id equals b.RefScoreConfig into ps
                          from b in ps.DefaultIfEmpty()
                          select new
                          {
                              a.Id,
                              a.ClassId,
                              a.ScoreType,
                              a.Description,
                              a.Percentage,
                              a.RefAssignmentId,
                              a.CreatedBy,
                              a.CreatedOn,
                              a.Status,
                              a.AssignmentName,
                              a.AssignmentUrl,
                              a.AssignmentType,
                              a.AssignmentContent,
                              a.AssignmentGroupNo,
                              Score = b == null ? null : b.Score,
                              ScoreStatus = b == null ? "Chưa có điểm" : "Đã có điểm",
                          };
            return lsScore;
        }

        public SingleRsp CalculateStudentScore(int cId, int uid)
        {
            SingleRsp res = new SingleRsp();
            var scs = _rep.Context.ClassScoreConfig.Where(x => x.ClassId == cId).ToList();
            foreach(var sc in scs)
            {
                var t = CheckClassStudentScore(cId, sc.Id, uid);
            }
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    var stScore = context.ClassStudentScore
                    .Where(x => x.ClassId == cId && x.Score == null)
                    .ToList();
                    var now = DateTime.Now;
                    for (int i = 0; i < stScore.Count; i++)
                    {
                        stScore[i].Score = 0;
                        stScore[i].ModifiedBy = uid;
                        stScore[i].ModifiedOn = now;
                        stScore[i].Note = " Do không có điểm, nên hệ thống tự cập nhật về 0.0 !";
                    }
                    var lsStu = context.ClassStudent.Where(x => x.ClassId == cId).ToList();
                    try
                    {      
                        if(stScore.Count>0)
                        {
                            foreach (var s in stScore)
                            {
                                context.ClassStudentScore.Update(s);
                                context.SaveChanges();
                            }
                        }
                        if (lsStu.Count > 0)
                        {
                            foreach (var stu in lsStu)
                            {
                                decimal tot = 0;
                                var ls = context.ClassStudentScore
                                    .Where(x => x.StudentId == stu.StudentId && x.ClassId == stu.ClassId)
                                    .ToList();
                                if (ls.Count > 0)
                                {
                                    foreach (var sc in ls)
                                    {
                                        if (sc.Percentage.HasValue && sc.Score.HasValue)
                                            tot = tot + (sc.Percentage.Value * sc.Score.Value) / 100;
                                    }
                                }
                                
                                stu.FinalScore = Math.Round(tot, 2);
                                if (tot > 5)
                                    stu.FinalResult = "Passed";
                                else
                                    stu.FinalResult = "Failed";
                                stu.ModifiedBy = uid;
                                stu.ModifiedOn = now;
                                context.ClassStudent.Update(stu);
                                context.SaveChanges();
                            }
                        }
                        res.Data = "Done";
                        tran.Commit();
                    }
                    catch(Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.Message);
                    }
                }
            }            
            return res;
        }

        public SingleRsp DeleteStudentOfClass(int cId, int sId)
        {
            SingleRsp res = new SingleRsp();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {   
                    try
                    {
                        var cs = context.ClassStudent
                            .Where(x => x.ClassId == cId && x.StudentId == sId).ToList();

                        context.ClassStudent.RemoveRange(cs);
                        context.SaveChanges();
                        res.Data = "Deleted";
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.Message);
                    }
                }
            }
            return res;
        }

        public SingleRsp ActivateStudentAccountOfClass(int cId, int uid)
        {
            SingleRsp res = new SingleRsp();
            var lst_stu_uid = _rep.Context.ClassStudent.Where(x => x.ClassId == cId)
                 .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new
                 {
                     a.StudentId,
                     b.SchoolId,
                     b.UserId,
                     b.OfficialStudentId,
                     b.StudentType,
                     a.ClassId
                 }).Where(x=>x.UserId.HasValue)
                 .Select(x=>x.UserId.Value)
                .ToList();
            var role = _rep.Context.Role.FirstOrDefault(x => x.Description == "Student");
            var lst_uid_role = _rep.Context.UserRole.Where(x=>x.RoleId == role.Id)
                .Join(_rep.Context.Student, a => a.UserId, b => b.UserId, (a, b) => new
                {
                    b.UserId,
                    a.RoleId
                }).Where(x => x.UserId.HasValue
                && lst_stu_uid.Contains(x.UserId.Value)
                && x.RoleId.HasValue).Select(x => x.UserId.Value);
            var uid_not_in_UserRole = lst_stu_uid.Except(lst_uid_role);
            List<User> lsSendEmail = new List<User>();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var now = DateTime.Now;
                        if (uid_not_in_UserRole.Count() > 0)
                        {
                            var lsUser = context.User.Where(x => uid_not_in_UserRole.Contains(x.Id)).ToList();                            
                            foreach (var u in lsUser)
                            {
                                UserRole ur = new UserRole();
                                ur.RoleId = role.Id;
                                ur.UserId = u.Id;
                                ur.Status = 1;
                                ur.CreatedBy = uid;
                                ur.CreatedOn = now;
                                ur.Description = "[" + u.LastName + " " + u.FirstName + "] là sinh viên";
                                var t = context.UserRole.Add(ur);
                                context.SaveChanges();
                            }
                        }
                        if (lst_stu_uid.Count() > 0)
                        {
                            var lst_inactive = context.User.Where(x => (x.Status != 1
                                || string.IsNullOrEmpty(x.PasswordHash)
                                || string.IsNullOrEmpty(x.PasswordSalt)
                                || string.IsNullOrEmpty(x.UserName))
                                && lst_stu_uid.Contains(x.Id)
                                && string.IsNullOrEmpty(x.Email))
                                .ToList();
                            if(lst_inactive.Count() > 0)
                            {
                                foreach (var u in lst_inactive)
                                {
                                    u.UserName = u.Email;
                                    u.PasswordHash = "AQAAAAEAACcQAAAAELqTfV67ixsiF5hfhuAFKBwrOko/fzx1kD9+aGwrmnKq1H9SfUkuVZM4SWAONtUdVA==";
                                    u.PasswordSalt = "NyLA01m7RmjAyY2WF961nDK4uMA=";
                                    u.Status = 1;
                                    u.ModifiedOn = now;
                                    u.ModifiedBy = uid;
                                    context.User.Update(u);
                                    context.SaveChanges();
                                }
                            }
                            lsSendEmail = lst_inactive;
                        }
                        res.Data = lsSendEmail;
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.Message);
                    }
                }
            }                          
            return res;
        }

        public List<User> GetTestSendEmail()
        {
            var usernames = new List<string>();
            usernames.Add("an");
            usernames.Add("nhat");
            usernames.Add("hanh");
            return _rep.Context.User.Where(x => usernames.Contains(x.UserName)).ToList();
        }

        public object GetScoreConfigForClass(int classId)
        {
            var sc = _rep.Context.ClassScoreConfig.Where(x => x.ClassId == classId).ToList();
            return sc;
        }

        public SingleRsp GetReportScoreConfigForClass(int classId, int scId)
        {
            SingleRsp res = new SingleRsp();
            int n = _rep.Context.ClassStudent
                .Where(x => x.ClassId == classId)
                .Count();
            if(scId > 0) // diem thanh fan
            {
                var sc = _rep.Context.ClassScoreConfig.Where(x => x.ClassId == classId && x.Id == scId).FirstOrDefault();
                var scores = _rep.Context.ClassStudentScore
                    .Where(x => x.ClassId == classId && x.RefScoreConfig == scId);
                int not_score = scores.Where(x => !x.Score.HasValue || x.Score == 0).Count();
                int score_0_5 = scores.Where(x => x.Score.HasValue && x.Score > 0  && x.Score < 5).Count();
                int score_5_7 = scores.Where(x => x.Score.HasValue && x.Score >= 5 && x.Score < 7).Count();
                int score_7_8 = scores.Where(x => x.Score.HasValue && x.Score >= 7 && x.Score < 8).Count();
                int score_8_9 = scores.Where(x => x.Score.HasValue && x.Score >= 8 && x.Score < 9).Count();
                int score_9_10 = scores.Where(x => x.Score.HasValue && x.Score >= 9 && x.Score <= 10).Count();
                var max_score = scores.Where(x => x.Score.HasValue && x.Score > 0).Max(x => x.Score);
                var min_score = scores.Where(x => x.Score.HasValue && x.Score > 0).Min(x => x.Score);
                var avg_score = scores.Where(x => x.Score.HasValue && x.Score > 0).Average(x => x.Score);
                var lstStu = _rep.Context.ClassStudentScore
                    .Where(x => x.ClassId == classId && x.RefScoreConfig == scId)
                    .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new
                    {
                        a.StudentId,
                        a.ClassId,
                        a.RefScoreConfig,
                        a.Score,
                        b.UserId,
                        b.OfficialStudentId, b.Birthday
                    })
                    .Join(_rep.Context.User, a => a.UserId, b => b.Id, (a, b) => new
                    {
                        a.OfficialStudentId,
                        a.Birthday,
                        a.Score,
                        Fullname = b.LastName + " " + b.FirstName
                    }).ToList();
                double passed = (double)((score_5_7 + score_7_8 + score_8_9 + score_9_10) *100)/ n;
                passed = Math.Round(passed, 2);
                res.Data = new {
                    TotalStudent = n,
                    NotScored = not_score,
                    ZeroFiveScored = score_0_5,
                    FiveSevenScored = score_5_7,
                    SevenEightScored = score_7_8,
                    EightNineScored = score_8_9,
                    NineTenScored = score_9_10,
                    MaxScored = max_score,
                    MinScored = min_score,
                    AvgScored = avg_score.HasValue? Math.Round(avg_score.Value, 2) : 0,
                    Passed = passed,
                    Unpassed = 100 - passed,
                    ListStudent = lstStu
                };
            }
            else // diem final
            {                
                var scores = _rep.Context.ClassStudent
                    .Where(x => x.ClassId == classId);
                int not_score = scores.Where(x => !x.FinalScore.HasValue || x.FinalScore == 0).Count();
                int score_0_5 = scores.Where(x => x.FinalScore.HasValue && x.FinalScore > 0 && x.FinalScore < 5).Count();
                int score_5_7 = scores.Where(x => x.FinalScore.HasValue && x.FinalScore >= 5 && x.FinalScore < 7).Count();
                int score_7_8 = scores.Where(x => x.FinalScore.HasValue && x.FinalScore >= 7 && x.FinalScore < 8).Count();
                int score_8_9 = scores.Where(x => x.FinalScore.HasValue && x.FinalScore >= 8 && x.FinalScore < 9).Count();
                int score_9_10 = scores.Where(x => x.FinalScore.HasValue && x.FinalScore >= 9 && x.FinalScore <= 10).Count();
                var max_score = scores.Where(x => x.FinalScore.HasValue && x.FinalScore > 0).Max(x => x.FinalScore);
                var min_score = scores.Where(x => x.FinalScore.HasValue && x.FinalScore > 0).Min(x => x.FinalScore);
                var avg_score = scores.Where(x => x.FinalScore.HasValue && x.FinalScore > 0).Average(x => x.FinalScore);
                var lstStu = _rep.Context.ClassStudent
                    .Where(x => x.ClassId == classId)
                    .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new
                    {
                        a.StudentId,
                        Score = a.FinalScore,
                        a.ClassId,
                        b.UserId,
                        b.OfficialStudentId,
                        b.Birthday
                    })
                    .Join(_rep.Context.User, a => a.UserId, b => b.Id, (a, b) => new
                    {
                        a.OfficialStudentId,
                        a.Score,
                        a.Birthday,
                        Fullname = b.LastName + " " + b.FirstName
                    }).ToList();
                double passed = (double)((score_5_7 + score_7_8 + score_8_9 + score_9_10) * 100) / n;
                passed = Math.Round(passed, 2);
                res.Data = new
                {
                    TotalStudent = n,
                    NotScored = not_score,
                    ZeroFiveScored = score_0_5,
                    FiveSevenScored = score_5_7,
                    SevenEightScored = score_7_8,
                    EightNineScored = score_8_9,
                    NineTenScored = score_9_10,
                    MaxScored = max_score,
                    MinScored = min_score,
                    AvgScored = avg_score.HasValue ? Math.Round(avg_score.Value, 2) : 0,
                    Passed = passed,
                    Unpassed = 100 - passed,
                    ListStudent = lstStu
                };
            }
            return res;
        }
        #endregion

        #region Teacher-Class-Attendance
        public SingleRsp GetSessionForCheckAttendance(int classId, string type)
        {
            SingleRsp res = new SingleRsp();
            var ses = _rep.Context.ClassSession
               .Where(x => x.ClassId == classId && x.Status == 1);
            if(!string.IsNullOrEmpty(type))
            {
                ses = ses.Where(x => x.SessionType == type);
            }
            res.Data = ses.ToList();
            return res;
        }

        public SingleRsp GetCampusOfSchool(int schoolId)
        {
            SingleRsp res = new SingleRsp();
            var cam = _rep.Context.SchoolCampus
               .Where(x => x.SchoolId.HasValue && x.SchoolId == schoolId).ToList();  
            res.Data = cam;
            return res;
        }

        public SingleRsp CompleteClassSession(int sesId, int uid)
        {
            SingleRsp res = new SingleRsp();
            var ses = _rep.Context.ClassSession
               .Where(x => x.Id == sesId && x.Status == 1).FirstOrDefault();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        ses.ModifiedBy = uid;
                        ses.ModifiedOn = DateTime.Now;
                        ses.Status = 2;
                        context.ClassSession.Update(ses);
                        context.SaveChanges();

                        res.Data = ses;
                        tran.Commit();
                    }
                    catch(Exception ex)
                    {
                        res.SetError(ex.Message);
                        tran.Rollback();
                    }
                }
            }            
            return res;
        }

        public SingleRsp LoadDetailAttendanceOfStudent(int classId, int stuId, int sesId)
        {
            SingleRsp res = new SingleRsp();
            var ses = _rep.Context.ClassAttendance
               .Where(x => x.ClassId == classId 
                    && x.RefSessionId == sesId
                    && x.StudentId == stuId)
                .Join(_rep.Context.User, a=>a.CreatedBy,b=>b.Id, (a,b)=>new
                {
                    a.Id,
                    a.ClassId,
                    a.StudentId,
                    a.DeviceId,
                    a.Latitude,
                    a.Longtitude,
                    a.Altitude,
                    a.Address,
                    a.Note,
                    a.RefSessionId,
                    a.Status,
                    a.CreatedBy,
                    a.CreatedOn,
                    CreatedByName = b.LastName +" "+b.FirstName
                })
               .ToList();
            res.Data = ses;
            return res;
        }

        public object GetTeacherClassStudentAttendance(int cid, int sesId, int page, int size)
        {
            var stu = _rep.Context.ClassStudent.Where(x => x.ClassId == cid)
                    .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new {
                        a.Id,
                        a.StudentId,
                        a.ClassId,
                        a.Status,
                        b.Note,
                        a.StudentRole,
                        a.FinalScore,
                        a.CreatedBy,
                        a.CreatedOn,
                        b.OfficialStudentId,
                        b.UserId,
                        b.Birthday,
                        b.Gender,
                        b.SchoolId,
                        ClassName = b.Class,
                        b.CourseName,
                        b.StudentType
                    })
                    .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new {
                        a.Id,
                        a.StudentId,
                        a.ClassId,
                        a.Status,
                        a.Note,
                        a.StudentRole,
                        a.FinalScore,
                        a.CreatedBy,
                        a.CreatedOn,
                        a.OfficialStudentId,
                        a.UserId,
                        a.Birthday,
                        a.Gender,
                        a.SchoolId,
                        a.ClassName,
                        a.CourseName,
                        a.StudentType,
                        b.SchoolCode,
                        b.SchoolName
                    })
                    .Join(_rep.Context.User, a => a.UserId, b => b.Id, (a, b) => new {
                        a.Id,
                        a.StudentId,
                        a.ClassId,
                        a.Status,
                        a.Note,
                        a.StudentRole,
                        a.FinalScore,
                        a.CreatedBy,
                        a.CreatedOn,
                        a.OfficialStudentId,
                        a.UserId,
                        a.Birthday,
                        a.Gender,
                        a.SchoolId,
                        a.ClassName,
                        a.CourseName,
                        a.StudentType,
                        a.SchoolCode,
                        a.SchoolName,
                        b.Phone,
                        b.Email,
                        b.UserName,
                        b.Avatar,
                        b.Address,
                        Fullname = b.LastName + " " + b.FirstName,
                        b.LastName,
                        b.FirstName
                    });
          
            var offset = (page - 1) * size;
            var total = stu.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = stu.OrderByDescending(x => x.CreatedOn).Skip(offset).Take(size).ToList();
            var data1 = from a in data
                        select new {
                            a.Id,
                            a.StudentId,
                            a.ClassId,
                            a.Status,
                            a.Note,
                            a.StudentRole,
                            a.FinalScore,
                            a.CreatedBy,
                            a.CreatedOn,
                            a.OfficialStudentId,
                            a.UserId,
                            a.Birthday,
                            a.Gender,
                            a.SchoolId,
                            a.ClassName,
                            a.CourseName,
                            a.StudentType,
                            a.SchoolCode,
                            a.SchoolName,
                            a.Phone,
                            a.Email,
                            a.UserName,
                            a.Avatar,
                            a.Address,
                            a.Fullname,
                            a.LastName,
                            a.FirstName,
                            AttendanceStatus = getAttendanceStatus(sesId, a.StudentId, a.ClassId)
                        };
            var res = new
            {
                Data = data1,
                TotalRecords = total,
                Page = page,
                Size = size,
                TotalPages = totalPage
            };
            return res;
        }

        private int getAttendanceStatus(int sessionId, int? sId, int? classId)
        {
            int n = _rep.Context.ClassAttendance
                .Where(x => x.ClassId == classId && x.RefSessionId == sessionId && x.StudentId == sId && x.Status ==1)
                .Count();
             return n;
           
        }

        public SingleRsp CheckAttendanceForStudent(ClassAttendance cAtt)
        {
            SingleRsp res = new SingleRsp();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        cAtt.CreatedOn = DateTime.Now;                       
                        context.ClassAttendance.Add(cAtt);
                        context.SaveChanges();

                        res.Data = cAtt;
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        res.SetError(ex.Message);
                        tran.Rollback();
                    }
                }
            }
            return res;
        }
        #endregion

        #region TEacher class Document
        public SingleRsp GetTeacherClassDocument(int classId, string type)
        {
            SingleRsp res = new SingleRsp();
            var docs = _rep.Context.ClassDocument
                .Where(x => x.ClassId == classId && x.DocumentType == type).ToList();
            var data = from doc in docs
                       select new {
                           doc.Id,
                           doc.Title,
                           doc.ClassId,
                           doc.Description,
                           doc.LinkUrl,
                           doc.DocumentType,
                           doc.Type,
                           doc.Content,
                           doc.CreatedOn,
                           doc.Status,
                           doc.CreatedBy,
                           doc.ModifiedBy,
                           doc.ModifiedOn,
                           CreatedByName = getFullName(doc.CreatedBy),
                           ModifiedByName = getFullName(doc.ModifiedBy)
                       };
            res.Data = data;
            return res;
        }

        public SingleRsp SaveTeacherClassDocument(ClassDocument doc)
        {
            var res = new SingleRsp();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var now = DateTime.Now;
                        doc.ModifiedOn = now;

                        var t = context.ClassDocument.Update(doc);
                        context.SaveChanges();
                        tran.Commit();

                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            res.Data = new
            {
                doc.Id,
                doc.Title,
                doc.ClassId,
                doc.Description,
                doc.LinkUrl,
                doc.DocumentType,
                doc.Type,
                doc.Content,
                doc.CreatedOn,
                doc.Status,
                doc.CreatedBy,
                doc.ModifiedBy,
                doc.ModifiedOn,
                CreatedByName = getFullName(doc.CreatedBy),
                ModifiedByName = getFullName(doc.ModifiedBy)
            };
            return res;
        }

        public SingleRsp CreateTeacherClassDocument(ClassDocument doc)
        {
            var res = new SingleRsp();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var now = DateTime.Now;
                        doc.CreatedOn = now;

                        var t = context.ClassDocument.Add(doc);
                        context.SaveChanges();
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            res.Data = new
            {
                doc.Id,
                doc.Title,
                doc.ClassId,
                doc.Description,
                doc.LinkUrl,
                doc.DocumentType,
                doc.Type,
                doc.Content,
                doc.CreatedOn,
                doc.Status,
                doc.CreatedBy,
                doc.ModifiedBy,
                doc.ModifiedOn,
                CreatedByName = getFullName(doc.CreatedBy),
                ModifiedByName = getFullName(doc.ModifiedBy)
            };
            return res;
        }

        public SingleRsp DeleteTeacherClassDocument(int docId)
        {
            var res = new SingleRsp();
            ClassDocument doc = _rep.Context.ClassDocument.FirstOrDefault(x => x.Id == docId);

            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.ClassDocument.Remove(doc);
                        context.SaveChanges();
                        res.Data = "deleted";
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
        #endregion

        #region Teacher-Class Announcement
        public SingleRsp GetTeacherClassAnnouncement(int classId, int page, int size)
        {
            SingleRsp res = new SingleRsp();
            var docs = _rep.Context.ClassAnnouncement
                .Where(x => x.ClassId == classId);
            var offset = (page - 1) * size;
            var total = docs.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data1 = docs.OrderByDescending(x => x.CreatedOn).Skip(offset).Take(size).ToList();
            var data = from doc in data1
                       select new
                       {
                           doc.Id,
                           doc.Title,
                           doc.ClassId,
                           doc.Brief,
                           doc.Type,
                           doc.Content,
                           doc.CreatedOn,
                           doc.Status,
                           doc.CreatedBy,
                           doc.ModifiedBy,
                           doc.ModifiedOn,
                           CreatedByName = getFullName(doc.CreatedBy),
                           ModifiedByName = getFullName(doc.ModifiedBy)
                       };
            res.Data = new
            {
                Data = data,
                TotalRecords = total,
                Page = page,
                Size = size,
                TotalPages = totalPage
            }; ;
            return res;
        }

        public SingleRsp CreateTeacherClassAnnouncement(ClassAnnouncement doc)
        {
            var res = new SingleRsp();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var now = DateTime.Now;
                        doc.CreatedOn = now;

                        var t = context.ClassAnnouncement.Add(doc);
                        context.SaveChanges();
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            res.Data = new
            {
                doc.Id,
                doc.Title,
                doc.ClassId,
                doc.Brief,
                doc.Type,
                doc.Content,
                doc.CreatedOn,
                doc.Status,
                doc.CreatedBy,
                doc.ModifiedBy,
                doc.ModifiedOn,
                CreatedByName = getFullName(doc.CreatedBy),
                ModifiedByName = getFullName(doc.ModifiedBy)
            };
            return res;
        }

        public SingleRsp SaveTeacherClassAnnouncement(ClassAnnouncement doc)
        {
            var res = new SingleRsp();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var now = DateTime.Now;
                        doc.ModifiedOn = now;

                        var t = context.ClassAnnouncement.Update(doc);
                        context.SaveChanges();
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            res.Data = new
            {
                doc.Id,
                doc.Title,
                doc.ClassId,
                doc.Brief,
                doc.Type,
                doc.Content,
                doc.CreatedOn,
                doc.Status,
                doc.CreatedBy,
                doc.ModifiedBy,
                doc.ModifiedOn,
                CreatedByName = getFullName(doc.CreatedBy),
                ModifiedByName = getFullName(doc.ModifiedBy)
            };
            return res;
        }

        public SingleRsp DeleteTeacherClassAnnouncement(int caId)
        {
            var res = new SingleRsp();
            ClassAnnouncement doc = _rep.Context.ClassAnnouncement.FirstOrDefault(x => x.Id == caId);

            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.ClassAnnouncement.Remove(doc);
                        context.SaveChanges();
                        res.Data = "deleted";
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
        #endregion

        #region Teacher-Class Exam
        public SingleRsp GetTeacherClassSubject(int uid, int page, int size)
        {
            SingleRsp res = new SingleRsp();
            var subIds = _rep.Context.ClassMember
                .Where(x => x.MemberId == uid)
                .Join(_rep.Context.Class,a=>a.ClassId, b=>b.Id, (a, b) => new
                {
                    a.ClassId,
                    b.SubjectId,
                    b.Status
                })
                .Where(x=>x.Status == 1)
                .Select(x => x.SubjectId).Distinct().ToList();
            var subs = _rep.Context.Subject
                .Where(x => subIds.Contains(x.Id) && x.Status == 1)
                .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.SubjectCode,
                    a.SubjectName,
                    a.Description,
                    a.SubjectType,
                    a.TotalCredit,
                    a.TheoryCredit,
                    a.PracticeCredit,
                    a.SchoolId,
                    a.Department,
                    b.SchoolCode,
                    b.SchoolName,
                    b.SchoolAddress,
                    b.SchoolType,
                    b.SchoolPhone,
                    b.WebSite,
                    b.LogoUrl
                });
            var offset = (page - 1) * size;
            var total = subs.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = subs.OrderBy(x => x.SubjectCode).Skip(offset).Take(size).ToList();           
            res.Data = new
            {
                Data = data,
                TotalRecords = total,
                Page = page,
                Size = size,
                TotalPages = totalPage
            }; ;
            return res;
        }

        public SingleRsp GetTeacherClassSubjectTest(int uid, int page, int size)
        {
            SingleRsp res = new SingleRsp();           
            var subs = _rep.Context.Subject
                .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.SubjectCode,
                    a.SubjectName,
                    a.Description,
                    a.SubjectType,
                    a.TotalCredit,
                    a.TheoryCredit,
                    a.PracticeCredit,
                    a.SchoolId,
                    a.Department,
                    b.SchoolCode,
                    b.SchoolName,
                    b.SchoolAddress,
                    b.SchoolType,
                    b.SchoolPhone,
                    b.WebSite,
                    b.LogoUrl
                });
            var offset = (page - 1) * size;
            var total = subs.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = subs.OrderBy(x => x.SubjectCode).Skip(offset).Take(size).ToList();
            res.Data = new
            {
                Data = data,
                TotalRecords = total,
                Page = page,
                Size = size,
                TotalPages = totalPage
            }; ;
            return res;
        }

        public object GetSubjectExam(int subId, int page, int size)
        {
            var exams = _rep.Context.Exam
                .Where(x => x.SubjectId == subId);
                
            var offset = (page - 1) * size;
            var total = exams.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = exams.OrderBy(x => x.CreatedOn).Skip(offset).Take(size).ToList();
            var data1 = from a in data
                        select new { 
                            a.Id,
                            a.ExamTitle,
                            a.ExamDepartment,
                            a.ExamSchool,
                            a.SubjectId,
                            a.ExamType,
                            a.ExamLevel,
                            a.TotalQuestion,
                            a.TotMinutes,
                            a.TotalScore,
                            a.Note, 
                            a.Status,
                            a.CreatedBy,
                            a.CreatedOn,
                            a.ModifiedBy,
                            a.ModifiedOn,
                            CreatedByName = getFullName(a.CreatedBy),
                            ModifiedByName = getFullName(a.ModifiedBy)
                        };
            return new
            {
                Data = data1,
                TotalRecords = total,
                Page = page,
                Size = size,
                TotalPages = totalPage
            };
        }

        public object GetSubjectExamQuestion(int subId, int page, int size)
        {
            var quests = _rep.Context.ExamQuestion
                .Where(x => x.SubjectId == subId);

            var offset = (page - 1) * size;
            var total = quests.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = quests.OrderBy(x => x.CreatedOn).Skip(offset).Take(size).ToList();
            var data1 = from a in data
                        select new
                        {
                            a.Id,
                            a.QuestionInstruction,
                            a.QuestionContent,
                            a.QuestionImage,
                            a.SubjectId,
                            a.QuestionType,
                            a.TotMinutes,
                            a.TotScore,
                            a.Note,
                            a.Status,
                            a.CreatedBy,
                            a.CreatedOn,
                            a.ModifiedBy,
                            a.ModifiedOn,
                            CreatedByName = getFullName(a.CreatedBy),
                            ModifiedByName = getFullName(a.ModifiedBy)
                        };
            return new
            {
                Data = data1,
                TotalRecords = total,
                Page = page,
                Size = size,
                TotalPages = totalPage
            }; 
        }

        public object GetQuestionDetail(int qId)
        {
            var a = _rep.Context.ExamQuestion.FirstOrDefault(x => x.Id == qId);
            var quest = new {
                a.Id,
                a.QuestionInstruction,
                a.QuestionContent,
                a.QuestionImage,
                a.QuestionType,
                a.TotMinutes,
                a.TotScore,
                a.SubjectId,
                a.Note,
                a.Status,
                a.CreatedBy,
                a.CreatedOn,
                a.ModifiedBy,
                a.ModifiedOn,
                CreatedByName = getFullName(a.CreatedBy),
                ModifiedByName = getFullName(a.ModifiedBy),
                ImageBase64 = ""
            };
            var ans = _rep.Context.ExamAnswer.Where(x => x.QuestionId == qId).ToList();
            var lst = from an in ans
                      select new { 
                          an.Id,
                          an.QuestionId,
                          an.AnswerContent,
                          an.AnswerImage,
                          an.AnswerType,
                          an.IsCorrect,
                          an.Score,
                          an.Status,
                          an.CreatedBy,
                          an.CreatedOn,
                          an.ModifiedBy,
                          an.ModifiedOn,
                          ImageBase64 = ""
                      };
            return new { 
                Question = quest,
                Answers = lst
            };
        }

        public object GetExamDetail(int eId)
        {
            var a = _rep.Context.Exam.FirstOrDefault(x => x.Id == eId);
            var ex = new
            {
                a.Id,
                a.ExamTitle,
                a.ExamDepartment,
                a.ExamSchool,
                a.SubjectId,
                a.ExamType,
                a.ExamLevel,
                a.TotalQuestion,
                a.TotMinutes,
                a.TotalScore,
                a.Note,
                a.Status,
                a.CreatedBy,
                a.CreatedOn,
                a.ModifiedBy,
                a.ModifiedOn,
                CreatedByName = getFullName(a.CreatedBy),
                ModifiedByName = getFullName(a.ModifiedBy)
            };
            var quest = _rep.Context.ExamDetail.Where(x => x.ExamId == eId)
                .Join(_rep.Context.ExamQuestion, a=>a.QuestionId, b=>b.Id, (a, b) => new
                {
                    a.Id,
                    a.ExamId,
                    a.QuestionId, 
                    a.Status,
                    a.CreatedBy,
                    a.CreatedOn,
                    a.ModifiedBy,
                    a.ModifiedOn,
                    b.QuestionContent,
                    b.QuestionInstruction,
                    b.QuestionType,
                    b.TotMinutes,
                    b.TotScore,
                    b.Note
                })
                .ToList();
            return new
            {
                Exam = ex,
                ExamDetail = quest
            };
        }

        public object SearchQuestionForExam(string keyword, int eId, int sId)
        {
            var qIds = _rep.Context.ExamDetail.Where(x => x.ExamId == eId && x.QuestionId.HasValue)
                .Select(x => x.QuestionId.Value).ToList();
            var quest = _rep.Context.ExamQuestion.Where(x => x.SubjectId == sId
                && !qIds.Contains(x.Id) 
                && (x.QuestionContent.Contains(keyword) || x.Note.Contains(keyword)))                
                .ToList();
            var res = from a in quest
                      select new { 
                          a.Id,
                          a.QuestionContent,
                          a.QuestionInstruction,
                          a.QuestionType,
                          a.Note,
                          a.TotScore,
                          a.TotMinutes,
                          Name = "[" + a.QuestionType + "] "+a.QuestionContent + " (" + a.Note +")"
                      };
            return res;
        }

        public SingleRsp DeleteQuestionFromExam(int edId)
        {
            var res = new SingleRsp();
            ExamDetail det = _rep.Context.ExamDetail.FirstOrDefault(x => x.Id == edId);

            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.ExamDetail.Remove(det);
                        context.SaveChanges();
                        res.Data = "deleted";
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

        public SingleRsp AddQuestionForExam(int eId, int qId, int uid)
        {
            var res = new SingleRsp();
            int n = _rep.Context.ExamDetail
                .Where(x => x.QuestionId == qId && x.ExamId == eId)
                .Count();
            if(n==0)
            {
                ExamDetail det = new ExamDetail();
                det.CreatedBy = uid;
                det.CreatedOn = DateTime.Now;
                det.QuestionId = qId;
                det.ExamId = eId;
                det.Status = 1;
                ExamQuestion b = _rep.Context.ExamQuestion.FirstOrDefault(x => x.Id == qId);
                using (var context = new ZContext())
                {
                    using (var tran = context.Database.BeginTransaction())
                    {
                        try
                        {
                            var t = context.ExamDetail.Add(det);
                            context.SaveChanges();
                            var data = new {
                                det.Id,
                                det.ExamId,
                                det.QuestionId,
                                det.Status,
                                det.CreatedBy,
                                det.CreatedOn,
                                det.ModifiedBy,
                                det.ModifiedOn,
                                b.QuestionContent,
                                b.QuestionInstruction,
                                b.QuestionType,
                                b.TotMinutes,
                                b.TotScore,
                                b.Note
                            };
                            res.Data = data;
                            tran.Commit();
                        }
                        catch (Exception ex)
                        {
                            tran.Rollback();
                            res.SetError(ex.StackTrace);
                        }
                    }
                }
            }
            else
            {
                res.SetError("Đã tồn tại câu hỏi này trong đề thi này!");
            }
            return res;
        }

        public SingleRsp SaveTeacherClassExamInfo(Exam a)
        {
            var res = new SingleRsp();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var now = DateTime.Now;
                        a.ModifiedOn = now;

                        var t = context.Exam.Update(a);
                        context.SaveChanges();
                        tran.Commit();                                                
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            res.Data = new
            {
                a.Id,
                a.ExamTitle,
                a.ExamDepartment,
                a.ExamSchool,
                a.SubjectId,
                a.ExamType,
                a.ExamLevel,
                a.TotalQuestion,
                a.TotMinutes,
                a.TotalScore,
                a.Note,
                a.Status,
                a.CreatedBy,
                a.CreatedOn,
                a.ModifiedBy,
                a.ModifiedOn,
                CreatedByName = getFullName(a.CreatedBy),
                ModifiedByName = getFullName(a.ModifiedBy)
            };
            return res;
        }

        public SingleRsp CreateTeacherClassExamInfo(Exam a)
        {
            var res = new SingleRsp();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var now = DateTime.Now;
                        a.CreatedOn = now;

                        var t = context.Exam.Add(a);
                        context.SaveChanges();
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            res.Data = new
            {
                a.Id,
                a.ExamTitle,
                a.ExamDepartment,
                a.ExamSchool,
                a.SubjectId,
                a.ExamType,
                a.ExamLevel,
                a.TotalQuestion,
                a.TotMinutes,
                a.TotalScore,
                a.Note,
                a.Status,
                a.CreatedBy,
                a.CreatedOn,
                a.ModifiedBy,
                a.ModifiedOn,
                CreatedByName = getFullName(a.CreatedBy),
                ModifiedByName = getFullName(a.ModifiedBy)
            };
            return res;
        }

        public SingleRsp DeleteTeacherClassExam(int eId)
        {
            var res = new SingleRsp();
            Exam doc = _rep.Context.Exam.FirstOrDefault(x => x.Id == eId);
            List<ExamDetail> lst = _rep.Context.ExamDetail.Where(x => x.ExamId == eId).ToList();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        if(lst!=null && lst.Count>0)
                        {
                            context.ExamDetail.RemoveRange(lst);
                            context.SaveChanges();
                        }

                        var t = context.Exam.Remove(doc);
                        context.SaveChanges();
                        res.Data = "deleted";
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

        public SingleRsp SaveTeacherExamQuestionInfo(ExamQuestion a)
        {
            var res = new SingleRsp();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var now = DateTime.Now;
                        a.ModifiedOn = now;

                        var t = context.ExamQuestion.Update(a);
                        context.SaveChanges();
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            res.Data = new
            {
                a.Id,
                a.QuestionInstruction,
                a.QuestionContent,
                a.QuestionImage,
                a.QuestionType,
                a.TotMinutes,
                a.TotScore,
                a.SubjectId,
                a.Note,
                a.Status,
                a.CreatedBy,
                a.CreatedOn,
                a.ModifiedBy,
                a.ModifiedOn,
                CreatedByName = getFullName(a.CreatedBy),
                ModifiedByName = getFullName(a.ModifiedBy),
                ImageBase64 = ""
            };
            return res;
        }

        public SingleRsp CreateTeacherExamQuestionInfo(ExamQuestion a)
        {
            var res = new SingleRsp();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var now = DateTime.Now;
                        a.CreatedOn = now;

                        var t = context.ExamQuestion.Add(a);
                        context.SaveChanges();
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            res.Data = new
            {
                a.Id,
                a.QuestionInstruction,
                a.QuestionContent,
                a.QuestionImage,
                a.QuestionType,
                a.TotMinutes,
                a.TotScore,
                a.SubjectId,
                a.Note,
                a.Status,
                a.CreatedBy,
                a.CreatedOn,
                a.ModifiedBy,
                a.ModifiedOn,
                CreatedByName = getFullName(a.CreatedBy),
                ModifiedByName = getFullName(a.ModifiedBy),
                ImageBase64 = ""
            };
            return res;
        }

        public SingleRsp DeleteTeacherExamQuestion(int qId)
        {
            var res = new SingleRsp();
            ExamQuestion doc = _rep.Context.ExamQuestion.FirstOrDefault(x => x.Id == qId);
            List<ExamAnswer> lst = _rep.Context.ExamAnswer.Where(x => x.QuestionId == qId).ToList();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        if (lst != null && lst.Count > 0)
                        {
                            context.ExamAnswer.RemoveRange(lst);
                            context.SaveChanges();
                        }

                        var t = context.ExamQuestion.Remove(doc);
                        context.SaveChanges();
                        res.Data = "deleted";
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

        public SingleRsp SaveTeacherQuestionAnswers(List<ExamAnswer> lst, int qId, int uid)
        {
            var now = DateTime.Now;
            var res = new SingleRsp();
            ExamQuestion q = _rep.Context.ExamQuestion.FirstOrDefault(x => x.Id == qId);
            var ids = lst.Where(x => x.Id > 0).Select(x => x.Id).ToList();
            var lsRemove = _rep.Context.ExamAnswer.Where(x => !ids.Contains(x.Id) && x.QuestionId == qId).ToList();
            int totScore = 0;
            int totAns = lst.Count;
            List<ExamAnswer> lstReturn = new List<ExamAnswer>();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        foreach(var a in lst)
                        {
                            totScore = totScore + (a.Score.HasValue ? a.Score.Value : 0);
                            if (a.Id > 0) // update
                            {
                                a.ModifiedOn = now;
                                var t = context.ExamAnswer.Update(a);
                                context.SaveChanges();
                            }
                            else
                            {
                                a.CreatedOn = now;
                                var t = context.ExamAnswer.Add(a);
                                context.SaveChanges();
                            }
                            lstReturn.Add(a);
                        }
                        if(lsRemove!=null && lsRemove.Count>0)
                        {
                            context.ExamAnswer.RemoveRange(lsRemove);
                            context.SaveChanges();
                        }
                        q.TotScore = totScore;
                        q.ModifiedBy = uid;
                        q.ModifiedOn = now;
                        if (totScore>1 && totAns > 2)
                        {
                            q.QuestionType = "Text-n-Choice";
                        }
                        else if(totScore == 1 && totAns > 2)
                        {
                            q.QuestionType = "Text-1-Choice";
                        }
                        else if (totScore == 1 && totAns == 2)
                        {
                            q.QuestionType = "Text-TF-Choice";
                        }
                        var t1 = context.ExamQuestion.Update(q);
                        context.SaveChanges();
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                        return res;
                    }
                }
            }
            var quest = new
            {
                q.Id,
                q.QuestionInstruction,
                q.QuestionContent,
                q.QuestionImage,
                q.QuestionType,
                q.TotMinutes,
                q.TotScore,
                q.SubjectId,
                q.Note,
                q.Status,
                q.CreatedBy,
                q.CreatedOn,
                q.ModifiedBy,
                q.ModifiedOn,
                CreatedByName = getFullName(q.CreatedBy),
                ModifiedByName = getFullName(q.ModifiedBy),
                ImageBase64 = ""
            };
            var lstR = from an in lstReturn
                      select new
                      {
                          an.Id,
                          an.QuestionId,
                          an.AnswerContent,
                          an.AnswerImage,
                          an.AnswerType,
                          an.IsCorrect,
                          an.Score,
                          an.Status,
                          an.CreatedBy,
                          an.CreatedOn,
                          an.ModifiedBy,
                          an.ModifiedOn,
                          ImageBase64 = ""
                      };
            res.Data = new
            {
                Question = quest,
                Answers = lstR
            };
            return res;
        }
        #endregion

        #region Teacher-Thesis

        #endregion

        #region Teacher-Admin

        #endregion

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

        private bool IsValidMSSV(string ms)
        {
            var regexItem = new Regex("^[a-zA-Z0-9 ]*$");
            if (regexItem.IsMatch(ms))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        
    }
}