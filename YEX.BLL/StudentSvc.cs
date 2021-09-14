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

    public class StudentSvc : GenericSvc<StudentRep, Student>
    {
        #region -- Overrides --

        /// <summary>
        /// Create the User
        /// </summary>
        /// <param name="m">The User</param>
        /// <returns>Return the result</returns>
        public override SingleRsp Create(Student m)
        {
            m.Status = (short)YEnum.Status.Normal;
            return base.Create(m);
        }

        /// <summary>
        /// Update
        /// </summary>
        /// <param name="m"></param>
        /// <returns>Return the result</returns>
        public override SingleRsp Update(Student m)
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
        public StudentSvc() { }

        #region Test
        public object getClassAssignmentExam(int assignId, int uid)
        {
            var aExam = _rep.Context.ClassAssignmentExam
                .Where(x => x.ClassAssignmentId == assignId && x.Status == 1)
                .Join(_rep.Context.ClassAssignment, a => a.ClassAssignmentId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.ClassAssignmentId,
                    a.ExamId,
                    a.Note,
                    a.Status,
                    b.ClassId,
                    AssignmentName = b.Name,
                    b.AssignmentType,
                    b.GroupNo
                })
                .FirstOrDefault();
            var exam = _rep.Context.Exam
                .Where(x => x.Id == (aExam != null ? aExam.ExamId.Value : 0))
                .FirstOrDefault();
            var sExam = _rep.Context.Student
                .Where(x => x.UserId == uid)
                .Join(_rep.Context.StudentExam, a => a.Id, b => b.StudentId, (a, b) => new
                {
                    a.OfficialStudentId,
                    b.ClassAssignmentId,
                    a.UserId,
                    a.Birthday,
                    a.SchoolId,
                    a.StudentType,
                    a.Class,
                    a.CourseName,
                    b.StudentId,
                    b.ExamId,
                    b.Id,
                    b.Score,
                    b.TotScore,
                    b.TotQuestion,
                    b.TotMinutes,
                    b.Note,
                    b.CreatedOn
                })
                .Where(x => x.ClassAssignmentId == assignId)
                .OrderByDescending(x => x.CreatedOn).FirstOrDefault();

            var res = new
            {
                AssignmentExam = aExam,
                Exam = exam,
                StudentExam = sExam
            };
            return res;
        }

        //StudentAnswer
        public SingleRsp StudentAnswer(int assignId, int examId, int uid, DateTime? start, DateTime? end, List<QuesAns> lst)
        {
            var student = _rep.Context.ClassAssignmentExam.Where(x => x.ExamId == examId)
                .Join(_rep.Context.ClassAssignment, a => a.ClassAssignmentId, b => b.Id, (a, b) => new
                {
                    a.ExamId,
                    a.ClassAssignmentId,
                    b.ClassId
                })
                .Join(_rep.Context.ClassStudent, a => a.ClassId, b => b.ClassId, (a, b) => new
                {
                    a.ExamId,
                    a.ClassAssignmentId,
                    a.ClassId,
                    b.StudentId,
                    b.StudentRole,
                    ClassStudentId = b.Id
                })
                .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new
                {
                    a.ExamId,
                    a.ClassAssignmentId,
                    a.ClassId,
                    a.StudentId,
                    a.StudentRole,
                    a.ClassStudentId,
                    b.UserId,
                    b.OfficialStudentId
                }).Where(x => x.UserId == uid).ToList()[0];
            var now = DateTime.Now;
            List<StudentExamDetail> lsDet = new List<StudentExamDetail>();
            int totScore = 0;
            int totMin = 0;
            int score = 0;
            foreach (QuesAns item in lst)
            {
                var det = scoring(item);
                det.StudentExamId = examId;
                det.CreatedBy = uid;
                det.CreatedOn = now;
                totScore = totScore + (item.TotScore.HasValue ? item.TotScore.Value : 0);
                totMin = totMin + (item.TotMinutes.HasValue ? item.TotMinutes.Value : 0);
                if (det != null)
                {
                    lsDet.Add(det);
                    score = score + det.Score.Value;
                }
            }
            StudentExam sExam = new StudentExam();
            sExam.ClassAssignmentId = assignId;
            sExam.ExamId = examId;
            sExam.StudentId = student.StudentId;
            sExam.StartTime = start;
            sExam.EndTime = end;
            sExam.TotScore = totScore;
            sExam.Score = score;
            sExam.TotMinutes = totMin;
            sExam.TotQuestion = lst.Count;
            sExam.Note = "Chấm bài tự động bằng hệ thống Online ! Role: " + student.StudentRole;
            sExam.Status = 1;
            sExam.CreatedBy = uid;
            sExam.CreatedOn = now;

            var res = new SingleRsp();

            var config = _rep.Context.ClassScoreConfig
                .Where(x => x.ClassId == student.ClassId && x.RefAssignmentId == assignId).FirstOrDefault();

            ClassStudentScore sScore = null;

            if (config != null)
            {
                sScore = new ClassStudentScore();
                var stuScore = _rep.Context.ClassStudentScore
                .Where(x => x.StudentId == student.StudentId
                && x.ClassId == student.ClassId && x.RefScoreConfig == config.Id).FirstOrDefault();
                if (stuScore != null)
                {
                    sScore = stuScore;
                    sScore.ModifiedBy = uid;
                    sScore.ModifiedOn = now;
                }
                else
                {
                    sScore.CreatedBy = uid;
                    sScore.CreatedOn = now;
                    sScore.Status = 1;
                    sScore.ClassId = student.ClassId;
                    sScore.StudentId = student.StudentId;
                    sScore.ClassStudentId = student.ClassStudentId;
                    sScore.ScoreType = config.ScoreType;
                    sScore.RefScoreConfig = config.Id;
                    sScore.Percentage = config.Percentage;
                    sScore.Note = "Sinh viên làm bài test online trên hệ thống !";
                }
                sScore.Score = System.Math.Round(((decimal)score / (totScore)) * 10, 2);
            }
            res = StudentAnswerNext(sExam, lsDet, sScore);
            return res;
        }

        public SingleRsp StudentAnswerNext(StudentExam sExam, List<StudentExamDetail> lsDet, ClassStudentScore sScore)
        {
            var res = new SingleRsp();
            using (var context = new ZContext())
            {
                using (var transaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.StudentExam.Add(sExam);
                        context.SaveChanges();

                        foreach (var item in lsDet)
                        {
                            item.StudentExamId = sExam.Id;
                            var m = context.StudentExamDetail.Add(item);
                            context.SaveChanges();
                        }
                        if (sScore != null && sScore.Id > 0)
                        {
                            var s = context.ClassStudentScore.Update(sScore);
                            context.SaveChanges();
                        }
                        else if (sScore != null && sScore.Id == 0)
                        {
                            var s = context.ClassStudentScore.Add(sScore);
                            context.SaveChanges();
                        }

                        var data = new
                        {
                            StudentExam = sExam,
                            StudentExamDetails = lsDet,
                            StudentScore = sScore
                        };
                        res.Data = data;

                        // Commit transaction if all commands succeed, transaction will auto-rollback
                        // when disposed if either commands fails
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        // TODO: Handle failure
                        transaction.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            return res;
        }

        public StudentExamDetail scoring(QuesAns ans)
        {
            int score = 0;
            int n = _rep.Context.ExamAnswer
                    .Where(x => x.QuestionId == ans.QuestionId && x.IsCorrect == true)
                    .Count();
            if (ans != null && ans.AnswerIds.Count <= n)
            {
                score = _rep.Context.ExamAnswer
                    .Where(x => x.QuestionId == ans.QuestionId && ans.AnswerIds.Contains(x.Id))
                    .Sum(x => x.Score.Value);
            }
            StudentExamDetail det = new StudentExamDetail();
            if (ans != null && ans.AnswerIds.Count <= n)
            {
                det.Answers = string.Join(";", ans.AnswerIds);
                det.Note = "Chấm bài tự động bằng hệ thống Online !";
            }
            else if (ans != null && ans.AnswerIds.Count == 0)
            {
                det.Note = "Không lựa chọn đáp án! ";
            }
            else if (ans != null && ans.AnswerIds.Count > n)
            {
                det.Note = "Lựa chọn quá nhiều đáp án! Phạm quy !";
            }
            det.QuestionId = ans.QuestionId;
            det.Score = score;
            det.Status = 1;
            return det;
        }
        public object getQuestionAndAnserForStudent(int examId, int follow)
        {
            // follow = 1 : Theo TotMinutes
            // follow = 2 : Theo TotQuestion
            // follow = 3 : Theo TotScore
            int totMin = 0;
            int totQuest = 0;
            int totScore = 0;
            var exam = _rep.Context.Exam.FirstOrDefault(x => x.Id == examId);
            var questions = _rep.Context.ExamDetail
                .Where(x => x.ExamId == examId && x.Status == 1)
                .Join(_rep.Context.ExamQuestion, a => a.QuestionId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.QuestionId,
                    b.QuestionContent,
                    b.QuestionInstruction,
                    b.QuestionImage,
                    b.QuestionType,
                    b.TotMinutes,
                    b.TotScore
                })
                .ToList();

            List<object> rQuestions = new List<object>();
            int n = 0;
            if (follow == 1) //Theo TotMinutes
                n = exam.TotMinutes.Value;
            else if (follow == 2) //Theo TotQuestion
                n = exam.TotalQuestion.Value;
            else if (follow == 3) //Theo TotScore
                n = exam.TotalScore.Value;

            var rand = new Random();
            int i = 0;
            do
            {
                var tong = questions.Count();
                int index = rand.Next(0, tong);
                var b = questions[index];
                var item = new
                {
                    b.Id,
                    b.QuestionId,
                    b.QuestionContent,
                    b.QuestionInstruction,
                    b.QuestionImage,
                    b.QuestionType,
                    b.TotMinutes,
                    b.TotScore,
                    Answers = getAnswersForStudent(b.QuestionId.Value)
                };
                rQuestions.Add(item);
                if (follow == 1) //Theo TotMinutes
                {
                    i = i + questions[index].TotMinutes.Value;
                    totMin = exam.TotMinutes.Value;
                    totScore = totScore + questions[index].TotScore.Value;
                    totQuest = totQuest + 1;
                }
                else if (follow == 2) //Theo TotQuestion
                {
                    i++;
                    totQuest = exam.TotalQuestion.Value;
                    totScore = totScore + questions[index].TotScore.Value;
                    totMin = totMin + questions[index].TotMinutes.Value;
                }
                else if (follow == 3) //Theo TotScore
                {
                    i = i + questions[index].TotScore.Value;
                    totScore = exam.TotalScore.Value;
                    totMin = totMin + questions[index].TotMinutes.Value;
                    totQuest = exam.TotalQuestion.Value;
                }
                questions.RemoveAt(index);
            } while (i <= n);

            exam.TotalScore = totScore;
            exam.TotMinutes = totMin;
            exam.TotalQuestion = totQuest;

            var res = new
            {
                Exam = exam,
                Questions = rQuestions,
                Follow = follow
            };
            return res;
        }

        public object getAnswersForStudent(int questionId)
        {
            var res = _rep.Context.ExamAnswer
                .Where(x => x.QuestionId == questionId && x.Status == 1)
                .OrderBy(x => Guid.NewGuid());

            var data = from p in res
                       select new
                       {
                           p.Id,
                           p.QuestionId,
                           p.AnswerContent,
                           p.AnswerImage,
                           p.AnswerType,
                           Checked = false
                       };
            return data;
        }

        #endregion

        public object getTeacherInfo(int id)
        {
            var teacher = _rep.Context.Teacher.Where(x => x.Id == id)
                .Join(_rep.Context.User, a => a.UserId, b => b.Id, (a, b) => new
                {
                    a.Id,
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

            var skills = _rep.Context.TeacherSkill.Where(x => x.TeacherId == id && x.Type != "Language")
                .OrderByDescending(x => x.CreatedOn).Take(5);
            var lang = _rep.Context.TeacherSkill.Where(x => x.TeacherId == id && x.Type == "Language")
                .OrderByDescending(x => x.CreatedOn).Take(5);
            var exp = _rep.Context.TeacherExperience.Where(x => x.TeacherId == id)
                .OrderByDescending(x => x.CreatedOn).Take(4).OrderBy(x => x.WorkType);
            var edu = _rep.Context.TeacherEduBackground.Where(x => x.TeacherId == id)
                .OrderByDescending(x => x.CreatedOn)
                .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.Title,
                    a.Degree,
                    a.Type,
                    a.Duration,
                    a.YearOfGrad,
                    a.Result,
                    b.SchoolAddress,
                    b.SchoolCode,
                    b.SchoolName
                }).Take(3);

            var res = new
            {
                Teacher = teacher,
                Skills = skills,
                Languages = lang,
                Experiences = exp,
                Education = edu
            };
            return res;
        }
        public object getStudentInfo(int studentId)
        {
            var student = _rep.All.Where(x => x.Id == studentId)
                .Join(_rep.Context.User, a => a.UserId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.UserId,
                    a.Gender,
                    a.Birthday,
                    a.OfficialStudentId,
                    a.CourseName,
                    ClassName = a.Class,
                    a.SchoolId,
                    a.Note,
                    a.Status,
                    a.CreatedBy,
                    a.CreatedOn,
                    b.FirstName,
                    b.LastName,
                    b.Email,
                    b.Address,
                    b.Phone,
                    b.UserName,
                    b.Avatar
                })
                .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.UserId,
                    a.Birthday,
                    a.Gender,
                    a.OfficialStudentId,
                    a.SchoolId,
                    a.CourseName,
                    a.ClassName,
                    a.Note,
                    a.Status,
                    a.CreatedBy,
                    a.CreatedOn,
                    a.FirstName,
                    a.LastName,
                    a.Email,
                    a.Address,
                    a.Phone,
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

            return student;
        }

        public object getStudentInfoById(int UserId, int classId)
        {
            var student = _rep.All.Where(x => x.UserId == UserId)
                .Join(_rep.Context.User, a => a.UserId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.UserId,
                    a.Gender,
                    a.Birthday,
                    a.OfficialStudentId,
                    a.CourseName,
                    ClassName = a.Class,
                    a.SchoolId,
                    a.Note,
                    a.Status,
                    a.CreatedBy,
                    a.CreatedOn,
                    b.FirstName,
                    b.LastName,
                    b.Email,
                    b.Address,
                    b.Phone,
                    b.UserName,
                    b.Avatar
                })
                .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.UserId,
                    a.Birthday,
                    a.Gender,
                    a.OfficialStudentId,
                    a.SchoolId,
                    a.CourseName,
                    a.ClassName,
                    a.Note,
                    a.Status,
                    a.CreatedBy,
                    a.CreatedOn,
                    a.FirstName,
                    a.LastName,
                    a.Email,
                    a.Address,
                    a.Phone,
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
                })
                .Join(_rep.Context.ClassStudent, a => a.Id, b => b.StudentId, (a, b) => new
                {
                    a.Id,
                    a.UserId,
                    a.Birthday,
                    a.Gender,
                    a.OfficialStudentId,
                    a.SchoolId,
                    a.CourseName,
                    a.ClassName,
                    a.Note,
                    a.Status,
                    a.CreatedBy,
                    a.CreatedOn,
                    a.FirstName,
                    a.LastName,
                    a.Email,
                    a.Address,
                    a.Phone,
                    a.UserName,
                    a.Avatar,
                    a.SchoolCode,
                    a.SchoolName,
                    a.LogoUrl,
                    a.SchoolType,
                    a.SchoolAddress,
                    a.SchoolPhone,
                    a.WebSite,
                    a.SchoolDescription,
                    b.ClassId
                })
                .Where(x => x.ClassId == classId).FirstOrDefault();

            return student;
        }
        public object getAllCurrentClass(int userId, int? classStatus)
        {
            var res = _rep.Context.ClassStudent
                .Join(_rep.Context.Class, a => a.ClassId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.StudentId,
                    a.ClassId,
                    a.StudentRole,
                    a.FinalScore,
                    a.FinalResult,
                    ClassCode = b.Code,
                    ClassName = b.Name,
                    b.SubjectId,
                    b.Venue,
                    b.Description,
                    b.Images,
                    b.Semester,
                    b.SchoolYear,
                    b.TotalSession,
                    b.Note,
                    b.Status,
                    b.TeacherId,
                    b.CreatedOn
                })
                .Join(_rep.Context.Subject, a => a.SubjectId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.StudentId,
                    a.ClassId,
                    a.StudentRole,
                    a.FinalScore,
                    a.FinalResult,
                    a.ClassCode,
                    a.ClassName,
                    a.SubjectId,
                    a.Venue,
                    a.Description,
                    a.Images,
                    a.Semester,
                    a.SchoolYear,
                    a.TotalSession,
                    a.Note,
                    a.Status,
                    a.TeacherId,
                    a.CreatedOn,
                    b.SubjectCode,
                    b.SubjectName,
                    b.SubjectType,
                    b.TotalCredit,
                    b.TheoryCredit,
                    b.PracticeCredit,
                    b.SchoolId
                })
                .Join(_rep.Context.Teacher, a => a.TeacherId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.StudentId,
                    a.ClassId,
                    a.StudentRole,
                    a.FinalScore,
                    a.FinalResult,
                    a.ClassCode,
                    a.ClassName,
                    a.SubjectId,
                    a.Venue,
                    a.Description,
                    a.Images,
                    a.Semester,
                    a.SchoolYear,
                    a.TotalSession,
                    a.Note,
                    a.Status,
                    a.TeacherId,
                    a.CreatedOn,
                    a.SubjectCode,
                    a.SubjectName,
                    a.SubjectType,
                    a.TotalCredit,
                    a.TheoryCredit,
                    a.PracticeCredit,
                    a.SchoolId,
                    TeacherFullname = b.FullName,
                    TeacherPhone = b.PhoneNumber,
                    TeacherIntro = b.Introduction
                })
                .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.StudentId,
                    a.ClassId,
                    a.StudentRole,
                    a.FinalScore,
                    a.FinalResult,
                    a.ClassCode,
                    a.ClassName,
                    a.SubjectId,
                    a.Venue,
                    a.Description,
                    a.Images,
                    a.Semester,
                    a.SchoolYear,
                    a.TotalSession,
                    a.Note,
                    a.Status,
                    a.TeacherId,
                    a.CreatedOn,
                    a.SubjectCode,
                    a.SubjectName,
                    a.SubjectType,
                    a.TotalCredit,
                    a.TheoryCredit,
                    a.PracticeCredit,
                    a.SchoolId,
                    a.TeacherFullname,
                    a.TeacherPhone,
                    a.TeacherIntro,
                    b.SchoolCode,
                    b.SchoolName,
                    b.LogoUrl
                })
                .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.StudentId,
                    a.ClassId,
                    a.StudentRole,
                    a.FinalScore,
                    a.FinalResult,
                    a.ClassCode,
                    a.ClassName,
                    a.SubjectId,
                    a.Venue,
                    a.Description,
                    a.Images,
                    a.Semester,
                    a.SchoolYear,
                    a.TotalSession,
                    a.Note,
                    a.Status,
                    a.TeacherId,
                    a.CreatedOn,
                    a.SubjectCode,
                    a.SubjectName,
                    a.SubjectType,
                    a.TotalCredit,
                    a.TheoryCredit,
                    a.PracticeCredit,
                    a.SchoolId,
                    a.TeacherFullname,
                    a.TeacherPhone,
                    a.TeacherIntro,
                    a.SchoolCode,
                    a.SchoolName,
                    a.LogoUrl,
                    b.UserId
                }).Where(x => x.UserId == userId);
            if (classStatus.HasValue)
            {
                res = res.Where(x => x.Status == classStatus);
            }

            var data = res.OrderByDescending(x => x.CreatedOn).ToList();
            return data;
        }
        public object getAllCurrentThesis(int userId, int? thesisStatus)
        {
            var res = _rep.Context.ThesisStudent
                .Join(_rep.Context.Thesis, a => a.ThesisId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.StudentId,
                    a.ThesisId,
                    a.StartTime,
                    a.EndTime,
                    a.Role,
                    a.Note,
                    a.Status,
                    b.ThesisTitle,
                    b.Description,
                    b.ThesisType,
                    b.ThesisLevel,
                    b.ThesisCategory,
                    b.StudyCode,
                    b.StudyField,
                    b.CreatedOn
                })
                .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.StudentId,
                    a.ThesisId,
                    a.StartTime,
                    a.EndTime,
                    a.Role,
                    a.Note,
                    a.Status,
                    a.ThesisTitle,
                    a.Description,
                    a.ThesisType,
                    a.ThesisLevel,
                    a.ThesisCategory,
                    a.StudyCode,
                    a.StudyField,
                    a.CreatedOn,
                    b.UserId,
                    b.SchoolId,
                    b.Class,
                    b.CourseName
                })
                .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.StudentId,
                    a.ThesisId,
                    a.StartTime,
                    a.EndTime,
                    a.Role,
                    a.Note,
                    a.Status,
                    a.ThesisTitle,
                    a.Description,
                    a.ThesisType,
                    a.ThesisLevel,
                    a.ThesisCategory,
                    a.StudyCode,
                    a.StudyField,
                    a.CreatedOn,
                    a.UserId,
                    a.SchoolId,
                    a.Class,
                    a.CourseName,
                    b.SchoolAddress,
                    b.SchoolCode,
                    b.SchoolName,
                    b.LogoUrl
                }).Where(x => x.UserId == userId);

            if (thesisStatus.HasValue)
            {
                res = res.Where(x => x.Status == thesisStatus);
            }

            var data = res.OrderByDescending(x => x.CreatedOn).ToList();
            return data;
        }
        public object getClassAnnouncement(int classId, int page, int size)
        {
            var announce = _rep.Context.ClassAnnouncement.Where(x => x.ClassId == classId)
             .Join(_rep.Context.User, a => a.CreatedBy, b => b.Id, (a, b) => new
             {
                 a.Id,
                 a.Title,
                 a.ClassId,
                 a.Brief,
                 a.Type,
                 a.Content,
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

        public object loadCourseDiscussion(int classId, int page, int size)
        {
            var announce = _rep.Context.Comment
                .Where(x => x.CommentForId == classId && x.CommentType == "Class" && x.Level == 1 && x.ParentId.HasValue == false)
             .Join(_rep.Context.User, a => a.CreatedBy, b => b.Id, (a, b) => new
             {
                 a.Id,
                 a.ParentId,
                 a.CommentType,
                 a.CommentForId,
                 a.Level,
                 a.Content,
                 a.CreatedBy,
                 a.CreatedOn,
                 a.Status,
                 CreatedByName = b.LastName + " " + b.FirstName,
                 b.Avatar
             });

            var offset = (page - 1) * size;
            var total = announce.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = announce.OrderByDescending(x => x.CreatedOn).Skip(offset).Take(size).ToList();
            var dat = from a in data
                      select new
                      {
                          a.Id,
                          a.CommentType,
                          a.CommentForId,
                          a.Level,
                          a.Content,
                          a.CreatedBy,
                          a.CreatedOn,
                          a.Status,
                          a.CreatedByName,
                          a.Avatar,
                          SubComments = getSubComment(a.Id, classId, 1, size)
                      };
            var res = new
            {
                Data = dat,
                TotalRecords = total,
                Page = page,
                Size = size,
                TotalPages = totalPage
            };
            return res;
        }

        public object loadCourseScore(int classId, int uid)
        {
            var stu = _rep.Context.Student.Where(x => x.UserId == uid)
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
                .Where(x => x.ClassId == classId);

            var assign = _rep.Context.ClassAssignment.Where(x => x.ClassId == classId);
            var stuScore = _rep.Context.ClassStudentScore
                .Where(x => x.ClassId == classId && x.StudentId == stu.StudentId);

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
            var res = from a in data
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

            return res;
        }

        public object getScore(int classId, int configId, int uid)
        {
            var res = _rep.Context.ClassStudentScore
                .Where(x => x.ClassId == classId && x.RefScoreConfig == configId && x.CreatedBy == uid);
            if (res.Count() > 0)
                return res.FirstOrDefault();
            else
                return null;
        }

        public object getSubComment(int pid, int classId, int page, int size)
        {
            var announce = _rep.Context.Comment
                .Where(x => x.CommentForId == classId && x.Level == 2 && x.CommentType == "Class" && x.ParentId == pid)
             .Join(_rep.Context.User, a => a.CreatedBy, b => b.Id, (a, b) => new
             {
                 a.Id,
                 a.ParentId,
                 a.CommentType,
                 a.CommentForId,
                 a.Level,
                 a.Content,
                 a.CreatedBy,
                 a.CreatedOn,
                 a.Status,
                 CreatedByName = b.LastName + " " + b.FirstName,
                 b.Avatar
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

        public SingleRsp addComment(int classId, int level, int? pId, string cmtStr, int uid)
        {
            var res = new SingleRsp();
            Comment cmt = new Comment();
            cmt.CommentForId = classId;
            cmt.CommentType = "Class";
            cmt.CreatedBy = uid;
            cmt.Content = cmtStr;
            cmt.CreatedOn = DateTime.Now;
            cmt.Status = 1;
            if (pId.HasValue)
                cmt.ParentId = pId.Value;
            cmt.Level = level;
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.Comment.Add(cmt);
                        context.SaveChanges();
                        tran.Commit();
                        var u = getUser(cmt.CreatedBy);
                        if (level == 1)
                        {
                            var data = new
                            {
                                cmt.Id,
                                cmt.CommentType,
                                cmt.CommentForId,
                                cmt.Level,
                                cmt.Content,
                                cmt.CreatedBy,
                                cmt.CreatedOn,
                                cmt.Status,
                                CreatedByName = u.LastName + " " + u.FirstName,
                                u.Avatar,
                                SubComments = getSubComment(cmt.Id, classId, 1, 5)
                            };
                            res.Data = data;
                        }
                        else
                        {
                            var data = new
                            {
                                cmt.Id,
                                cmt.ParentId,
                                cmt.CommentType,
                                cmt.CommentForId,
                                cmt.Level,
                                cmt.Content,
                                cmt.CreatedBy,
                                cmt.CreatedOn,
                                cmt.Status,
                                CreatedByName = u.LastName + " " + u.FirstName,
                                u.Avatar
                            };
                            res.Data = data;
                        }
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

        private User getUser(int? uid)
        {
            var u = _rep.Context.User.FirstOrDefault(x => x.Id == uid);
            return u;
        }

        public SingleRsp UploadAssignment(List<SubmissionAttachment> lst, int assignId, int userId)
        {
            var res = new SingleRsp();
            var grp = _rep.Context.ClassAssignmentGroup
                .Where(x => x.ClassAssignmentId == assignId && x.UserId == userId)
                .FirstOrDefault();
            var assign = _rep.Context.ClassAssignment
                .Where(x => x.Id == assignId)
                .FirstOrDefault();
            //_rep.Context.Database.CurrentTransaction;            
            //var tran = _rep.Context.Database.BeginTransaction();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var now = DateTime.Now;
                        #region Assignment-Submission
                        var sub = new AssignmentSubmission();
                        sub.ClassAssignmentId = assignId;
                        sub.CreatedBy = userId;
                        sub.CreatedOn = now;
                        if (grp != null)
                            sub.SubmitForGroup = grp.GroupNo.ToString();
                        sub.SubmitType = assign.SubmitType;
                        sub.Status = 1;

                        var t = context.AssignmentSubmission.Add(sub);
                        context.SaveChanges();
                        #endregion

                        #region Attachment
                        foreach (SubmissionAttachment item in lst)
                        {
                            item.CreatedBy = userId;
                            item.CreatedOn = now;
                            item.SubmissionId = sub.Id;
                            context.SubmissionAttachment.Add(item);
                            context.SaveChanges();
                        }
                        #endregion

                        res.Data = sub;
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

        public int saveAssignmentSubmission(int assignId, int userId, string Url)
        {
            int res = 0;
            var assign = _rep.Context.ClassAssignment.Where(x => x.Id == assignId).FirstOrDefault();
            //var tran = _rep.Context.Database.BeginTransaction();
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        AssignmentSubmission s = new AssignmentSubmission();
                        s.ClassAssignmentId = assignId;
                        s.SubmitType = assign.SubmitType;
                        s.SubmissionUrl = Url;
                        s.Status = 1;
                        s.CreatedBy = userId;
                        s.CreatedOn = DateTime.Now;
                        var t = context.AssignmentSubmission.Add(s);
                        context.SaveChanges();
                        tran.Commit();
                        res = 1;
                    }
                    catch
                    {
                        tran.Rollback();
                        //res.SetError(ex.StackTrace);
                        res = 0;
                    }
                }
            }            
            return res;
        }

        public string GetPathFileUpload(int assignId, int uid)
        {
            string res = "";
            res = "/Class_" + _rep.Context.ClassAssignment.Where(x => x.Id == assignId).FirstOrDefault().ClassId.ToString();
            res = res + "/User_" + uid.ToString();
            return res;
        }

        public object loadCourseMaterial(int classId)
        {
            var mat1 = _rep.Context.ClassDocument.Where(x => x.ClassId == classId &&
                (x.DocumentType == "DCMH" || x.DocumentType == "Book" || x.DocumentType == "DocThem"))
             .Join(_rep.Context.User, a => a.CreatedBy, b => b.Id, (a, b) => new
             {
                 a.Id,
                 a.Title,
                 a.ClassId,
                 a.Description,
                 a.LinkUrl,
                 a.ImageUrl,
                 a.DocumentType,
                 a.Type,
                 a.Content,
                 a.CreatedBy,
                 a.CreatedOn,
                 a.Status,
                 CreatedByName = b.LastName + " " + b.FirstName
             }).ToList();
            var mat2 = _rep.Context.ClassDocument.Where(x => x.ClassId == classId && x.DocumentType == "BaiGiang")
             .Join(_rep.Context.User, a => a.CreatedBy, b => b.Id, (a, b) => new
             {
                 a.Id,
                 a.Title,
                 a.ClassId,
                 a.Description,
                 a.LinkUrl,
                 a.ImageUrl,
                 a.DocumentType,
                 a.Type,
                 a.Content,
                 a.CreatedBy,
                 a.CreatedOn,
                 a.Status,
                 CreatedByName = b.LastName + " " + b.FirstName
             }).ToList();
            var mat3 = _rep.Context.ClassDocument.Where(x => x.ClassId == classId &&
                (x.DocumentType == "BaiTap" || x.DocumentType == "DeThiMau"))
             .Join(_rep.Context.User, a => a.CreatedBy, b => b.Id, (a, b) => new
             {
                 a.Id,
                 a.Title,
                 a.ClassId,
                 a.Description,
                 a.LinkUrl,
                 a.ImageUrl,
                 a.DocumentType,
                 a.Type,
                 a.Content,
                 a.CreatedBy,
                 a.CreatedOn,
                 a.Status,
                 CreatedByName = b.LastName + " " + b.FirstName
             }).ToList();
            var mat4 = _rep.Context.ClassDocument.Where(x => x.ClassId == classId && x.DocumentType == "SourceCode")
             .Join(_rep.Context.User, a => a.CreatedBy, b => b.Id, (a, b) => new
             {
                 a.Id,
                 a.Title,
                 a.ClassId,
                 a.Description,
                 a.LinkUrl,
                 a.ImageUrl,
                 a.DocumentType,
                 a.Type,
                 a.Content,
                 a.CreatedBy,
                 a.CreatedOn,
                 a.Status,
                 CreatedByName = b.LastName + " " + b.FirstName
             }).ToList();
            var res = new
            {
                Materials = mat1,
                BaiGiang = mat2,
                BaiTap = mat3,
                SourceCode = mat4
            };

            return res;
        }


        public object loadCourseAssignment(int classId, int userId)
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
                 CreatedByName = b.LastName + " " + b.FirstName
                 //SubmissionStatus = isSubmited(a.Id, userId)
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
                           a.CreatedByName,
                           SubmissionStatus = isSubmited(a.Id, userId, a.SubmitType),
                           ScoreStatus = IsScored(a.ClassId.Value, userId, a.Id)
                       };

            var res = new
            {
                Normal = data.Where(x => x.SubmitType != "Per-Online-Test"),
                OnlineTest = data.Where(x => x.SubmitType == "Per-Online-Test")
            };
            return res;
        }

        private string IsScored(int classId, int uid, int assignId)
        {
            string str = "unscored";
            int n1 = _rep.Context.ClassScoreConfig.Where(x => x.ClassId == classId && x.RefAssignmentId == assignId).Count();
            if(n1>0)
            {
                int scId = _rep.Context.ClassScoreConfig.Where(x => x.ClassId == classId && x.RefAssignmentId == assignId).FirstOrDefault().Id;
                int sid = _rep.Context.Student
                    .Join(_rep.Context.ClassStudent, a => a.Id, b => b.StudentId, (a, b) => new
                    {
                        a.Id,
                        a.UserId,
                        b.ClassId,
                        b.StudentId
                    }).Where(x => x.ClassId == classId && x.UserId == uid).FirstOrDefault().Id;

                var score = _rep.Context.ClassStudentScore
                    .Where(x => x.ClassId == classId && x.RefScoreConfig == scId && x.StudentId == sid);
                var n = score.Count();
                if (n > 0)
                {
                    var obj = score.FirstOrDefault();
                    if (obj.Score.HasValue)
                        str = "scored";
                }
            }         
            return str;
        }

        public SubmissionAttachment getAttachmentUrl(int id)
        {
            SubmissionAttachment res = _rep.Context.SubmissionAttachment
                .FirstOrDefault(x => x.Id == id);
            return res;
        }

        public string isSubmited(int assignmentId, int userId, string submitType)
        {
            string res = "";
            if (submitType != "Per-Online-Test")
            {
                var uids = getGroupOfAssignment(assignmentId, userId);
                var n = _rep.Context.AssignmentSubmission
                    .Where(x => x.ClassAssignmentId == assignmentId &&
                    uids.Contains(x.CreatedBy))
                    .Count();
                if (n > 0)
                    res = "Đã nộp";
                else
                    res = "Chưa nộp";
            }
            else
            {
                var score = _rep.Context.ClassScoreConfig.Where(x => x.RefAssignmentId == assignmentId)
                    .Join(_rep.Context.ClassStudentScore, a => a.Id, b => b.RefScoreConfig, (a, b) => new
                    {
                        a.ClassId,
                        b.StudentId,
                        b.Score,
                        b.Percentage,
                        b.Note,
                        b.RefScoreConfig,
                        b.CreatedBy,
                        b.CreatedOn,
                        b.ModifiedBy,
                        b.ModifiedOn
                    }).Where(x => x.CreatedBy == userId || x.ModifiedBy == userId);
                if (score.Count() > 0)
                    res = "Đã làm test-online";
                else
                    res = "Chưa làm test-online";
            }
            return res;
        }

        public object loadCourseAssignmentDetail(int assignId, int userId)
        {
            var uids = getGroupOfAssignment(assignId, userId);
            var assign = _rep.Context.ClassAssignment.Where(x => x.Id == assignId)
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
                 CreatedByName = b.LastName + " " + b.FirstName
             }).FirstOrDefault();

            var config = _rep.Context.ClassScoreConfig.FirstOrDefault(x => x.RefAssignmentId == assignId);
            var submission = _rep.Context.AssignmentSubmission
                .Where(x => x.ClassAssignmentId == assignId && uids.Contains(x.CreatedBy))
                .Join(_rep.Context.User, a => a.CreatedBy, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.ClassAssignmentId,
                    a.SubmissionUrl,
                    a.SubmitForMembers,
                    a.SubmitType,
                    a.SubmitForGroup,
                    a.Status,
                    a.CreatedBy,
                    a.CreatedOn,
                    CreatedByName = b.LastName + " " + b.FirstName
                }).OrderByDescending(x => x.CreatedOn).FirstOrDefault();
            var score = _rep.Context.ClassScoreConfig.Where(x => x.RefAssignmentId == assignId)
                    .Join(_rep.Context.ClassStudentScore, a => a.Id, b => b.RefScoreConfig, (a, b) => new
                    {
                        a.ClassId,
                        b.StudentId,
                        b.Score,
                        b.ScoreType,
                        b.Percentage,
                        b.Note,
                        b.RefScoreConfig,
                        b.CreatedBy,
                        b.CreatedOn,
                        b.ModifiedBy,
                        b.ModifiedOn
                    })
                    .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new
                    {
                        a.ClassId,
                        a.StudentId,
                        a.Score,
                        a.ScoreType,
                        a.Percentage,
                        a.Note,
                        a.RefScoreConfig,
                        a.CreatedBy,
                        a.CreatedOn,
                        a.ModifiedBy,
                        a.ModifiedOn,
                        b.UserId
                    })
                    .Where(x => x.CreatedBy == userId || x.ModifiedBy == userId || x.UserId == userId).FirstOrDefault();
            var res = new
            {
                Assignment = assign,
                ScoreConfig = config,
                Submission = submission,
                Score = score
            };
            return res;
        }

        public object loadAssignmentSubmission(int assignId, int userId, int page, int size)
        {
            var uids = getGroupOfAssignment(assignId, userId);
            var subAssign = _rep.Context.AssignmentSubmission
                .Where(x => x.ClassAssignmentId == assignId && uids.Contains(x.CreatedBy))
             .Join(_rep.Context.User, a => a.CreatedBy, b => b.Id, (a, b) => new
             {
                 a.Id,
                 a.ClassAssignmentId,
                 a.SubmitForGroup,
                 a.SubmitForMembers,
                 a.SubmissionUrl,
                 a.SubmitType,
                 a.CreatedBy,
                 a.CreatedOn,
                 a.Status,
                 CreatedByName = b.LastName + " " + b.FirstName
             });

            var offset = (page - 1) * size;
            var total = subAssign.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = subAssign.OrderByDescending(x => x.CreatedOn).Skip(offset).Take(size).ToList();
            var data1 = from a in data
                        select new
                        {
                            a.Id,
                            a.ClassAssignmentId,
                            a.SubmitForGroup,
                            a.SubmitForMembers,
                            a.SubmissionUrl,
                            a.SubmitType,
                            a.CreatedBy,
                            a.CreatedOn,
                            a.Status,
                            a.CreatedByName,
                            Attachments = getAttachments(a.Id)
                        };
            var res1 = new
            {
                Data = data1,
                TotalRecords = total,
                Page = page,
                Size = size,
                TotalPages = totalPage
            };

            var assign = _rep.Context.ClassAssignment.FirstOrDefault(x => x.Id == assignId);
            var code = _rep.Context.Code.Where(x => x.CodeType == "SubmitType" && x.Value == assign.SubmitType).FirstOrDefault();
            var userList = _rep.Context.User.Where(x => uids.Contains(x.Id))
                .Join(_rep.Context.Student, a => a.Id, b => b.UserId, (a, b) => new
                {
                    a.Id,
                    a.FirstName,
                    a.LastName,
                    a.Phone,
                    a.Address,
                    a.Email,
                    a.UserName,
                    b.OfficialStudentId,
                    b.Gender,
                    b.Class,
                    b.Birthday,
                    b.CourseName,
                    a.Avatar
                })
                .ToList();

            var res = new
            {
                SubType = code,
                Submissions = res1,
                Users = userList
            };
            return res;
        }

        public object getAttachments(int submissionId)
        {
            var res = _rep.Context.SubmissionAttachment
                .Where(x => x.SubmissionId == submissionId).ToList();
            return res;
        }

        public object loadAssignmentSubmissionNext(int assignId, int userId, int page, int size)
        {
            var uids = getGroupOfAssignment(assignId, userId);
            var subAssign = _rep.Context.AssignmentSubmission
                .Where(x => x.ClassAssignmentId == assignId && uids.Contains(x.CreatedBy))
             .Join(_rep.Context.User, a => a.CreatedBy, b => b.Id, (a, b) => new
             {
                 a.Id,
                 a.ClassAssignmentId,
                 a.SubmitForGroup,
                 a.SubmitForMembers,
                 a.SubmissionUrl,
                 a.SubmitType,
                 a.CreatedBy,
                 a.CreatedOn,
                 a.Status,
                 CreatedByName = b.LastName + " " + b.FirstName
             });

            var offset = (page - 1) * size;
            var total = subAssign.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = subAssign.OrderByDescending(x => x.CreatedOn).Skip(offset).Take(size).ToList();
            var data1 = from a in data
                        select new
                        {
                            a.Id,
                            a.ClassAssignmentId,
                            a.SubmitForGroup,
                            a.SubmitForMembers,
                            a.SubmissionUrl,
                            a.SubmitType,
                            a.CreatedBy,
                            a.CreatedOn,
                            a.Status,
                            a.CreatedByName,
                            Attachments = getAttachments(a.Id)
                        };
            var res1 = new
            {
                Data = data1,
                TotalRecords = total,
                Page = page,
                Size = size,
                TotalPages = totalPage
            };
            return res1;
        }
        public IList<int?> getGroupOfAssignment(int assignId, int userId)
        {
            var query = _rep.Context.ClassAssignmentGroup.Where(x => x.ClassAssignmentId == assignId && x.UserId == userId);
            int n = query.Count();
            if (n == 0)
            {
                var res = new int?[] { userId };
                return res;
            }
            else
            {
                var grp = query.FirstOrDefault().GroupNo;
                var res = _rep.Context.ClassAssignmentGroup.Where(x => x.ClassAssignmentId == assignId && x.GroupNo == grp).Select(x => x.UserId).ToArray();
                return res;
            }
        }

        public object loadCourseScoreConfig(int classId)
        {
            var mat = _rep.Context.ClassScoreConfig.Where(x => x.ClassId == classId)
             .Join(_rep.Context.User, a => a.CreatedBy, b => b.Id, (a, b) => new
             {
                 a.Id,
                 a.ScoreType,
                 a.ClassId,
                 a.Description,
                 a.Percentage,
                 a.RefAssignmentId,
                 a.Note,
                 a.CreatedBy,
                 a.CreatedOn,
                 a.Status,
                 CreatedByName = b.LastName + " " + b.FirstName
             }).ToList();

            return mat;
        }

        public ClassAssignment getClassAssignment(int assignmentId)
        {
            ClassAssignment res = _rep.Context.ClassAssignment.FirstOrDefault(x => x.Id == assignmentId);
            return res;
        }

        public object getClassAssignmentSubmissionId(int assignmentId, int page, int size)
        {
            var submiss = _rep.Context.AssignmentSubmission.Where(x => x.ClassAssignmentId == assignmentId);

            var offset = (page - 1) * size;
            var total = submiss.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = submiss.OrderByDescending(x => x.CreatedOn).Skip(offset).Take(size).ToList();
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

        public object LoadCourseStudent(int classId, int page, int size)
        {
            var announce = _rep.Context.ClassStudent.Where(x => x.ClassId == classId)
             .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new
             {
                 a.Id,
                 a.StudentRole,
                 a.ClassId,
                 a.StudentId,
                 a.FinalScore,
                 a.FinalResult,
                 a.Note,
                 a.Status,
                 a.CreatedBy,
                 a.CreatedOn,
                 b.OfficialStudentId,
                 b.UserId,
                 b.Birthday,
                 b.Class,
                 b.CourseName,
                 b.Gender,
                 b.SchoolId,
                 b.StudentType,
             })
             .Join(_rep.Context.User, a => a.UserId, b => b.Id, (a, b) => new
             {
                 a.Id,
                 a.StudentRole,
                 a.ClassId,
                 a.StudentId,
                 a.FinalScore,
                 a.FinalResult,
                 a.Note,
                 a.Status,
                 a.CreatedBy,
                 a.CreatedOn,
                 a.OfficialStudentId,
                 a.UserId,
                 a.Birthday,
                 a.Class,
                 a.CourseName,
                 a.Gender,
                 a.SchoolId,
                 a.StudentType,
                 b.FirstName,
                 b.LastName,
                 b.Email,
                 b.Address,
                 b.Phone,
                 b.UserName,
                 b.Avatar
             });

            var offset = (page - 1) * size;
            var total = announce.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = announce.OrderBy(x => x.OfficialStudentId).Skip(offset).Take(size).ToList();
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
        public object LoadCourseInfo(int classId)
        {
            var cls = _rep.Context.Class.Where(x => x.Id == classId).FirstOrDefault();
            var subj = _rep.Context.Subject.Where(x => x.Id == cls.SubjectId).FirstOrDefault();
            var school = _rep.Context.School.Where(x => x.Id == subj.SchoolId).FirstOrDefault();
            var teacher = _rep.Context.Teacher.Where(x => x.Id == cls.TeacherId).FirstOrDefault();
            var clsMems = _rep.Context.ClassMember.Where(x => x.ClassId == classId)
                .Join(_rep.Context.User, a => a.MemberId, b => b.Id, (a, b) => new
                {
                    a.Id,
                    a.ClassId,
                    a.MemberId,
                    a.MemberRole,
                    a.Description,
                    a.Note,
                    a.Status,
                    b.FirstName,
                    b.LastName,
                    b.Email,
                    b.Phone,
                    b.Avatar
                }).ToList();
            var sesLTs = _rep.Context.ClassSession.Where(x => x.ClassId == classId && x.SessionType == "LT")
                .OrderBy(x => x.DateOfClass)
                .ToList();
            var sesTHs = _rep.Context.ClassSession.Where(x => x.ClassId == classId && x.SessionType == "TH")
                .OrderBy(x => x.DateOfClass)
                .ToList();
            var sesBoth = _rep.Context.ClassSession.Where(x => x.ClassId == classId && x.SessionType == "LT-TH")
                .OrderBy(x => x.DateOfClass)
                .ToList();

            var res = new
            {
                Class = cls,
                Subject = subj,
                School = school,
                Teacher = teacher,
                ClassMembers = clsMems,
                SessionLts = sesLTs,
                SessionThs = sesTHs,
                SessionBoth = sesBoth
            };
            return res;
        }

        //
        public object getStudentScore(int classId, int studentId)
        {
            var res = _rep.Context.ClassStudentScore.Where(x => x.ClassId == classId && x.StudentId == studentId).ToList();
            return res;
        }

        public object getClassStatistic(int classId)
        {
            var cls = _rep.Context.Class.Where(x => x.Id == classId)
                .Join(_rep.Context.Subject, a => a.SubjectId, b => b.Id, (a, b) => new
                {
                    ClassId = a.Id,
                    ClassCode = a.Code,
                    ClassName = a.Name,
                    a.SubjectId,
                    a.Venue,
                    a.Description,
                    a.Images,
                    a.Semester,
                    a.SchoolYear,
                    a.TotalSession,
                    a.StartDate,
                    a.EndDate,
                    a.Note,
                    a.Status,
                    a.TeacherId,
                    a.CreatedOn,
                    b.SubjectCode,
                    b.SubjectName,
                    b.SubjectType,
                    b.TotalCredit,
                    b.TheoryCredit,
                    b.PracticeCredit,
                    b.SchoolId
                })
                .Join(_rep.Context.Teacher, a => a.TeacherId, b => b.Id, (a, b) => new
                {
                    a.ClassId,
                    a.ClassCode,
                    a.ClassName,
                    a.SubjectId,
                    a.Venue,
                    a.Description,
                    a.Images,
                    a.Semester,
                    a.SchoolYear,
                    a.TotalSession,
                    a.StartDate,
                    a.EndDate,
                    a.Note,
                    a.Status,
                    a.TeacherId,
                    a.CreatedOn,
                    a.SubjectCode,
                    a.SubjectName,
                    a.SubjectType,
                    a.TotalCredit,
                    a.TheoryCredit,
                    a.PracticeCredit,
                    a.SchoolId,
                    TeacherFullname = b.FullName,
                    TeacherPhone = b.PhoneNumber,
                    TeacherIntro = b.Introduction
                })
                .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new
                {
                    a.ClassId,
                    a.ClassCode,
                    a.ClassName,
                    a.SubjectId,
                    a.Venue,
                    a.Description,
                    a.Images,
                    a.Semester,
                    a.SchoolYear,
                    a.TotalSession,
                    a.StartDate,
                    a.EndDate,
                    a.Note,
                    a.Status,
                    a.TeacherId,
                    a.CreatedOn,
                    a.SubjectCode,
                    a.SubjectName,
                    a.SubjectType,
                    a.TotalCredit,
                    a.TheoryCredit,
                    a.PracticeCredit,
                    a.SchoolId,
                    a.TeacherFullname,
                    a.TeacherPhone,
                    a.TeacherIntro,
                    b.SchoolCode,
                    b.SchoolName,
                    b.LogoUrl
                }).FirstOrDefault();
            var totStu = _rep.Context.ClassStudent.Where(x => x.ClassId == classId).Count();
            var totTea = _rep.Context.ClassMember.Where(x => x.ClassId == classId).Count();
            var totTheory = _rep.Context.ClassSession.Where(x => x.ClassId == classId && x.Session.Contains("LT")).Count();
            var totTheory_pass = _rep.Context.ClassSession.Where(x => x.ClassId == classId
                && x.Session.Contains("LT")
                && x.Status == 2
                ).Count();
            var totPractise = _rep.Context.ClassSession.Where(x => x.ClassId == classId && x.Session.Contains("TH")).Count();
            var totPractise_pass = _rep.Context.ClassSession.Where(x => x.ClassId == classId
               && x.Session.Contains("TH")
               && x.Status == 2
               ).Count();
            string clsStt = "";
            switch (cls.Status)
            {
                case 0:
                    clsStt = "Chưa học !";
                    break;
                case 1:
                    clsStt = "Đang học !";
                    break;
                case 2:
                    clsStt = "Đã học xong";
                    break;
                case 4:
                    clsStt = "Đã học xong, chờ kiểm tra!";
                    break;
                case 8:
                    clsStt = "Đã học xong, đã có điểm!";
                    break;
            }
            var res = new
            {
                TotalStudent = totStu,
                TotalTeacher = totTea,
                TotalSession = cls.TotalSession,
                BeginDate = cls.StartDate,
                EndDate = cls.EndDate,
                ClassStatus = clsStt,
                TheoryStatus = totTheory_pass.ToString() + " / " + totTheory.ToString(),
                PractiseStatus = totPractise_pass.ToString() + " / " + totPractise.ToString(),
                SubjectCode = cls.SubjectCode
            };
            return res;
        }


        public SingleRsp CreateClassJwt(int classId)
        {
            var res = new SingleRsp();

            var cls = _rep.Context.Class.Where(x => x.Id == classId)
                .Join(_rep.Context.Subject, a => a.SubjectId, b => b.Id, (a, b) => new
                {
                    ClassId = a.Id,
                    ClassCode = a.Code,
                    ClassName = a.Name,
                    a.SubjectId,
                    a.Venue,
                    a.Description,
                    a.Images,
                    a.Semester,
                    a.SchoolYear,
                    a.TotalSession,
                    a.Note,
                    a.Status,
                    a.TeacherId,
                    a.CreatedOn,
                    a.StartDate,
                    a.EndDate,
                    b.Department,
                    b.SubjectCode,
                    b.SubjectName,
                    b.SubjectType,
                    b.TotalCredit,
                    b.TheoryCredit,
                    b.PracticeCredit,
                    b.SchoolId
                })
                .Join(_rep.Context.Teacher, a => a.TeacherId, b => b.Id, (a, b) => new
                {
                    a.ClassId,
                    a.ClassCode,
                    a.ClassName,
                    a.SubjectId,
                    a.Venue,
                    a.Description,
                    a.Images,
                    a.Semester,
                    a.SchoolYear,
                    a.TotalSession,
                    a.Note,
                    a.Status,
                    a.TeacherId,
                    a.CreatedOn,
                    a.StartDate,
                    a.EndDate,
                    a.Department,
                    a.SubjectCode,
                    a.SubjectName,
                    a.SubjectType,
                    a.TotalCredit,
                    a.TheoryCredit,
                    a.PracticeCredit,
                    a.SchoolId,
                    TeacherFullname = b.FullName,
                    TeacherPhone = b.PhoneNumber,
                    TeacherIntro = b.Introduction
                })
                .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new
                {
                    a.ClassId,
                    a.ClassCode,
                    a.ClassName,
                    a.SubjectId,
                    a.Venue,
                    a.Description,
                    a.Images,
                    a.Semester,
                    a.SchoolYear,
                    a.TotalSession,
                    a.Note,
                    a.StartDate,
                    a.EndDate,
                    a.Department,
                    a.Status,
                    a.TeacherId,
                    a.CreatedOn,
                    a.SubjectCode,
                    a.SubjectName,
                    a.SubjectType,
                    a.TotalCredit,
                    a.TheoryCredit,
                    a.PracticeCredit,
                    a.SchoolId,
                    a.TeacherFullname,
                    a.TeacherPhone,
                    a.TeacherIntro,
                    b.SchoolCode,
                    b.SchoolName,
                    b.LogoUrl,
                    b.SchoolAddress,
                    b.WebSite
                }).FirstOrDefault();

            var secret = AppSetting.S.JwtSecret;
            var expires = AppSetting.S.JwtExpires;
            var z1 = new ZToken(secret, cls, expires);
            res.SetData(YCode.SZ101, z1.Jwt);

            return res;
        }

        public SingleRsp CreateThesisJwt(int thesisId, int uid)
        {
            var res = new SingleRsp();

            var thesis = _rep.Context.Thesis.Where(x => x.Id == thesisId)
                .Join(_rep.Context.ThesisStudent, a => a.Id, b => b.ThesisId, (a, b) => new
                {
                    b.ThesisId,
                    a.ThesisTitle,
                    a.ThesisLevel,
                    a.Description,
                    a.ThesisType,
                    a.ThesisCategory,
                    a.ThesisYear,
                    a.StudyCode,
                    a.Note,
                    a.Status,
                    a.StudyField,
                    a.CreatedOn,
                    a.Members,
                    a.CreatedBy,
                    b.StudentId,
                    b.StartTime,
                    b.EndTime,
                    b.Role
                })
                .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new
                {
                    a.ThesisId,
                    a.ThesisTitle,
                    a.ThesisLevel,
                    a.Description,
                    a.ThesisType,
                    a.ThesisCategory,
                    a.ThesisYear,
                    a.StudyCode,
                    a.Note,
                    a.Status,
                    a.StudyField,
                    a.CreatedOn,
                    a.Members,
                    a.CreatedBy,
                    a.StudentId,
                    a.StartTime,
                    a.EndTime,
                    StudentRole = a.Role,
                    b.UserId,
                    b.SchoolId,
                    b.StudentType,
                    b.Class,
                    b.CourseName,
                    b.OfficialStudentId,
                    b.Birthday
                })
                .Join(_rep.Context.School, a => a.SchoolId, b => b.Id, (a, b) => new
                {
                    a.ThesisId,
                    a.ThesisTitle,
                    a.ThesisLevel,
                    a.Description,
                    a.ThesisType,
                    a.ThesisCategory,
                    a.ThesisYear,
                    a.StudyCode,
                    a.Note,
                    a.Status,
                    a.StudyField,
                    a.CreatedOn,
                    a.Members,
                    a.CreatedBy,
                    a.StudentId,
                    a.StartTime,
                    a.EndTime,
                    a.StudentRole,
                    a.UserId,
                    a.SchoolId,
                    a.StudentType,
                    a.Class,
                    a.CourseName,
                    a.OfficialStudentId,
                    a.Birthday,
                    b.SchoolCode,
                    b.SchoolName,
                    b.LogoUrl,
                    b.SchoolAddress,
                    b.WebSite
                })
                .Join(_rep.Context.User, a => a.UserId, b => b.Id, (a, b) => new
                {
                    a.ThesisId,
                    a.ThesisTitle,
                    a.ThesisLevel,
                    a.Description,
                    a.ThesisType,
                    a.ThesisCategory,
                    a.ThesisYear,
                    a.StudyCode,
                    a.Note,
                    a.Status,
                    a.StudyField,
                    a.CreatedOn,
                    a.Members,
                    a.CreatedBy,
                    a.StudentId,
                    a.StartTime,
                    a.EndTime,
                    a.StudentRole,
                    a.UserId,
                    a.SchoolId,
                    a.StudentType,
                    a.Class,
                    a.CourseName,
                    a.OfficialStudentId,
                    a.Birthday,
                    a.SchoolCode,
                    a.SchoolName,
                    a.LogoUrl,
                    a.SchoolAddress,
                    a.WebSite,
                    b.FirstName,
                    b.LastName,
                    FullName = b.LastName + " " + b.FirstName
                })
                .Where(x => x.UserId == uid)
                .FirstOrDefault();

            var secret = AppSetting.S.JwtSecret;
            var expires = AppSetting.S.JwtExpires;
            var z1 = new ZToken(secret, thesis, expires);
            res.SetData(YCode.SZ101, z1.Jwt);

            return res;
        }
        #endregion
    }
}