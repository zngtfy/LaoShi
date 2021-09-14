using System;
using System.Collections.Generic;
using System.Text;
using YEX.DAL.Models;

namespace YEX.BLL.Req
{
    
    public class TeacherReq
    {
        #region -- Properties --
        public int UserId { get; set; }
        public int? Page { get; set; }
        public int? Size { get; set; }

        #endregion
    }

    public class TeacherClassReq
    {
        #region -- Properties --
        public int ClassId { get; set; }
        public int UserId { get; set; }
        public int? Status { get; set; }
        public int? Page { get; set; }
        public int? Size { get; set; }

        #endregion
    }

    public class TeacherClassInfoReq
    {
        #region -- Properties --
        public int Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Venue { get; set; }
        public string Description { get; set; }
        public string ClassTime { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public string Prerequisition { get; set; }
        public int? Semester { get; set; }
        public string SchoolYear { get; set; }
        public string Note { get; set; }
        public short? Status { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
        #endregion

        public Class convert()
        {
            if (Id > 0)
            {
                Class res = new Class();
                res.Id = Id;
                res.Code = Code;
                res.Name = Name;
                res.Venue = Venue;
                res.Description = Description;
                res.ClassTime = ClassTime;
                res.StartDate = StartDate;
                res.EndDate = EndDate;
                res.Prerequisition = Prerequisition;
                res.Semester = Semester;
                res.SchoolYear = SchoolYear;
                res.Note = Note;
                res.ModifiedBy = ModifiedBy;
                return res;
            }
            else if (Id == 0)
            {
                Class res = new Class();                
                res.Code = Code;
                res.Name = Name;
                res.Venue = Venue;
                res.Description = Description;
                res.ClassTime = ClassTime;
                res.StartDate = StartDate;
                res.EndDate = EndDate;
                res.Prerequisition = Prerequisition;
                res.Semester = Semester;
                res.SchoolYear = SchoolYear;
                res.Note = Note;
                res.ModifiedBy = ModifiedBy;
                return res;
            }
            else
                return null;
        }
    }

    public class TeacherClassStatusReq
    {
        public int ClassId { get; set; }
        public int? ModifiedBy { get; set; }
    }

    public class TeacherClassSessionReq
    {
        public int Id { get; set; }
        public int? ClassId { get; set; }
        public string Session { get; set; }
        public string Brief { get; set; }
        public string ClassContent { get; set; }
        public DateTime? DateOfClass { get; set; }
        public string SessionType { get; set; }
        public string FromTime { get; set; }
        public string ToTime { get; set; }
        public int? TotalClassUnit { get; set; }
        public string Location { get; set; }
        public string Note { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }

        public ClassSession convert()
        {
            if (Id > 0)
            {
                ClassSession res = new ClassSession();
                res.Id = Id;
                res.ClassId = ClassId;
                res.Session = Session;
                res.Brief = Brief;
                res.ClassContent = ClassContent;
                res.DateOfClass = DateOfClass;
                res.SessionType = SessionType;
                res.FromTime = FromTime;
                res.ToTime = ToTime;
                res.TotalClassUnit = TotalClassUnit;
                res.Location = Location;
                res.Note = Note;
                res.CreatedBy = CreatedBy;
                res.ModifiedBy = ModifiedBy;
                res.Status = Status;
                return res;
            }
            else if(Id ==0)
            {
                ClassSession res = new ClassSession();                
                res.ClassId = ClassId;
                res.Session = Session;
                res.Brief = Brief;
                res.ClassContent = ClassContent;
                res.DateOfClass = DateOfClass;
                res.SessionType = SessionType;
                res.FromTime = FromTime;
                res.ToTime = ToTime;
                res.TotalClassUnit = TotalClassUnit;
                res.Location = Location;
                res.Note = Note;
                res.CreatedBy = CreatedBy;
                res.ModifiedBy = ModifiedBy;
                res.Status = Status;
                return res;
            }
            else
                return null;
        }
    }

    public class TeacherClassScoreConfigReq
    {
        public int Id { get; set; }
        public int? ClassId { get; set; }
        public string ScoreType { get; set; }
        public string Description { get; set; }
        public int? Percentage { get; set; }
        public int? RefAssignmentId { get; set; }
        public string Note { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }

        public ClassScoreConfig convert()
        {
            if (Id > 0)
            {
                ClassScoreConfig res = new ClassScoreConfig();
                res.Id = Id;
                res.ClassId = ClassId;
                res.ScoreType = ScoreType;
                res.Description = Description;
                res.Percentage = Percentage;
                res.RefAssignmentId = RefAssignmentId;
                res.Note = Note;              
                res.CreatedBy = CreatedBy;
                res.ModifiedBy = ModifiedBy;
                res.Status = Status;
                return res;
            }
            else if (Id == 0)
            {
                ClassScoreConfig res = new ClassScoreConfig();
                res.ClassId = ClassId;
                res.ScoreType = ScoreType;
                res.Description = Description;
                res.Percentage = Percentage;
                res.RefAssignmentId = RefAssignmentId;
                res.Note = Note;
                res.CreatedBy = CreatedBy;              
                res.Status = Status;
                return res;
            }
            else
                return null;
        }
    }

    public class TeacherClassStudentScorReq
    {
        public int Id { get; set; }
        public int? ClassId { get; set; }
        public int? StudentId { get; set; }
        public int? ClassStudentId { get; set; }
        public decimal? Score { get; set; }
        public string ScoreType { get; set; }
        public int? Percentage { get; set; }
        public string Note { get; set; }
        public int? RefScoreConfig { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }

        public ClassStudentScore convert()
        {
            if (Id > 0)
            {
                ClassStudentScore res = new ClassStudentScore();
                res.Id = Id;
                res.ClassId = ClassId;
                res.StudentId = StudentId;
                res.ClassStudentId = ClassStudentId;
                res.ScoreType = ScoreType;
                res.Score = Score;
                res.Percentage = Percentage;
                res.RefScoreConfig = RefScoreConfig;
                res.Note = Note;
                res.CreatedBy = CreatedBy;
                res.ModifiedBy = ModifiedBy;
                res.Status = Status;
                return res;
            }
            else if (Id == 0)
            {
                ClassStudentScore res = new ClassStudentScore();                
                res.ClassId = ClassId;
                res.StudentId = StudentId;
                res.ClassStudentId = ClassStudentId;
                res.ScoreType = ScoreType;
                res.Score = Score;
                res.Percentage = Percentage;
                res.RefScoreConfig = RefScoreConfig;
                res.Note = Note;
                res.CreatedBy = CreatedBy;
                res.Status = Status;
                return res;
            }
            else
                return null;
        }
    }

    public class TeacherClassAssignmentReq
    {
        public int Id { get; set; }
        public int? ClassId { get; set; }
        public string Name { get; set; }
        public string AssignmentType { get; set; }
        public string AssignmentContent { get; set; }
        public string AssignmentUrl { get; set; }
        public int? GroupNo { get; set; }
        public DateTime? DueDate { get; set; }
        public bool? RequireSubmit { get; set; }
        public string SubmitType { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }

        public ClassAssignment convert()
        {
            if (Id > 0)
            {
                ClassAssignment res = new ClassAssignment();
                res.Id = Id;
                res.ClassId = ClassId;
                res.Name = Name;
                res.AssignmentType = AssignmentType;
                res.AssignmentContent = AssignmentContent;
                res.AssignmentUrl = AssignmentUrl;
                res.GroupNo = GroupNo;
                res.DueDate = DueDate;
                res.RequireSubmit = RequireSubmit;
                res.SubmitType = SubmitType;
                res.CreatedBy = CreatedBy;
                res.CreatedOn = CreatedOn;
                res.ModifiedBy = ModifiedBy;
                res.Status = Status;
                return res;
            }
            else if (Id == 0)
            {
                ClassAssignment res = new ClassAssignment();
                res.ClassId = ClassId;
                res.Name = Name;
                res.AssignmentType = AssignmentType;
                res.AssignmentContent = AssignmentContent;
                res.AssignmentUrl = AssignmentUrl;
                res.GroupNo = GroupNo;
                res.DueDate = DueDate;
                res.RequireSubmit = RequireSubmit;
                res.SubmitType = SubmitType;
                res.CreatedBy = CreatedBy;
                res.Status = Status;
                return res;
            }
            else
                return null;
        }
    }

    public class TeacherClassAssignmentGroupReq
    {
        public int Id { get; set; }
        public int? ClassAssignmentId { get; set; }
        public int? GroupNo { get; set; }
        public int? StudentId { get; set; }
        public int? UserId { get; set; }

        public ClassAssignmentGroup convert()
        {
            if (Id > 0)
            {
                ClassAssignmentGroup res = new ClassAssignmentGroup();
                res.Id = Id;
                res.ClassAssignmentId = ClassAssignmentId;
                res.GroupNo = GroupNo;
                res.StudentId = StudentId;
                res.UserId = UserId;               
                return res;
            }
            else if (Id == 0)
            {
                ClassAssignmentGroup res = new ClassAssignmentGroup();
                res.ClassAssignmentId = ClassAssignmentId;
                res.GroupNo = GroupNo;
                res.StudentId = StudentId;
                res.UserId = UserId;
                return res;
            }
            else
                return null;
        }
    }

    public class TeacherClassAssignmentExamReq
    {
        public int Id { get; set; }
        public int? ClassAssignmentId { get; set; }
        public int? ExamId { get; set; }
        public string Note { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public ClassAssignmentExam convert()
        {
            if (Id > 0)
            {
                ClassAssignmentExam res = new ClassAssignmentExam();
                res.Id = Id;
                res.ClassAssignmentId = ClassAssignmentId;
                res.ExamId = ExamId;
                res.Note = Note;               
                res.CreatedBy = CreatedBy;
                res.CreatedOn = CreatedOn;
                res.ModifiedBy = ModifiedBy;
                res.Status = Status;
                return res;
            }
            else if (Id == 0)
            {
                ClassAssignmentExam res = new ClassAssignmentExam();
                res.ClassAssignmentId = ClassAssignmentId;
                res.ExamId = ExamId;
                res.Note = Note;
                res.CreatedBy = CreatedBy;
                res.Status = Status;
                return res;
            }
            else
                return null;
        }
    }

    public class TeacherClassStudentReq
    {
        public int Id { get; set; }
        public int? ClassId { get; set; }
        public int? StudentId { get; set; }
        public string StudentRole { get; set; }
        public decimal? FinalScore { get; set; }
        public string FinalResult { get; set; }
        public string Note { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public int Size { get; set; }
        public int Page { get; set; }
        public string Keyword { get; set; }
        public ClassStudent convert()
        {
            if (Id > 0)
            {
                ClassStudent res = new ClassStudent();
                res.Id = Id;
                res.ClassId = ClassId;
                res.StudentId = StudentId;
                res.StudentRole = StudentRole;
                res.FinalScore = FinalScore;
                res.FinalResult = FinalResult;
                res.Note = Note;
                res.CreatedBy = CreatedBy;
                res.CreatedOn = CreatedOn;
                res.ModifiedBy = ModifiedBy;
                res.Status = Status;
                return res;
            }
            else if (Id == 0)
            {
                ClassStudent res = new ClassStudent();
                res.ClassId = ClassId;
                res.StudentId = StudentId;
                res.StudentRole = StudentRole;
                res.FinalScore = FinalScore;
                res.FinalResult = FinalResult;
                res.Note = Note;
                res.CreatedBy = CreatedBy;
                res.Status = Status;
                return res;
            }
            else
                return null;
        }
    }

    public class CheckMSSVReq
    {
        public string OfficialStudentId { get; set; }
        public int SchoolId { get; set; }
        public int ClassId { get; set; }
    }

    public class CheckEmailReq
    {
        public string Email { get; set; }
    }

    public class StudentInfolReq
    {
        public ClassStudent ClassStudent { get; set; }
        public Student Student { get; set; }
        public User User { get; set; }
        public int UserId { get; set; }
    }

    public class StudentInfolUploadReq
    {        
        // Class-Student        
        public int? ClassId { get; set; }
        public string StudentRole { get; set; }
        // Student
        public string OfficialStudentId { get; set; }
        public DateTime? Birthday { get; set; }
        public bool? Gender { get; set; }
        public string StudentType{ get; set; }
        public string ClassName { get; set; }  // Class
        public string CourseName { get; set; }
        public string Note { get; set; }
        public int? SchoolId { get; set; }
        // User
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
    }

    public class ClassScoreConfigReq
    {
        public int ClassScoreConfigId { get; set; }
        public int? ClassId { get; set; }
        public string ScoreType { get; set; }
        public string Description { get; set; }
        public int? Percentage { get; set; }
        public int? RefAssignmentId { get; set; }
        public string RefAssignmentName { get; set; }
        public decimal? Score { get; set; }
        public string ScoreStatus { get; set; }
        public string ScoreResult { get; set; }
    }

    public class StudentInfolDownloadReq
    {
        //Class
        public int? ClassId { get; set; }
        public string ClassName { get; set; }
        public string StudentRole { get; set; }
        // Student
        public string OfficialStudentId { get; set; }
        public DateTime? Birthday { get; set; }
        public bool? Gender { get; set; }
        public string StudentType { get; set; }
        public string Class { get; set; }  // Class
        public string CourseName { get; set; }
        public string Note { get; set; }
        public string SchoolName { get; set; }
        // User
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public decimal? FinalScore { get; set; }
        // Score config
        public List<ClassScoreConfigReq> ListScore { get; set; }
    }

    public class ClassInfoReq
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public int? SubjectId { get; set; }
        public string SubjectCode{ get; set; }
        public string SubjectName { get; set; }
        public int? TotalCredit { get; set; }
        public string Venue { get; set; }
        public string Description { get; set; }
        public string ClassTime { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public int? Semester { get; set; }
        public string SchoolYear { get; set; }
        public int? TotalSession { get; set; }
        public string Note { get; set; }
        public int? TeacherId { get; set; }
        public string TeacherName { get; set; }
        public string SchoolCode { get; set; }
        public string SchoolName { get; set; }
    }

    public class StudentScoreListReq
    {
        public int ClassId { get; set; }
        public int StudentId { get; set; }
    }

    public class ScoreReportReq
    {
        public int ClassId { get; set; }
        public int ScoreConfigId { get; set; }
    }

    public class SessionAttendanceReq
    {
        public int SchoolId { get; set; }
        public int ClassId { get; set; }
        public int ClassSessionId { get; set; }
        public int StudentId { get; set; }
        public string SessionType { get; set; }
        public int ModifiedBy { get; set; }
        public int Size { get; set; }
        public int Page { get; set; }
    }

    public class ClassAttendanceReq
    {
        public int Id { get; set; }
        public int? ClassId { get; set; }
        public int? StudentId { get; set; }
        public string DeviceId { get; set; }
        public string Latitude { get; set; }
        public string Longtitude { get; set; }
        public string Altitude { get; set; }
        public string Address { get; set; }
        public string Note { get; set; }
        public int? RefSessionId { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }

        public ClassAttendance convert()
        {
            if (Id > 0)
            {
                ClassAttendance res = new ClassAttendance();
                res.Id = Id;
                res.ClassId = ClassId;
                res.StudentId = StudentId;
                res.DeviceId = DeviceId;
                res.Latitude = Latitude;
                res.Longtitude = Longtitude;
                res.Altitude = Altitude;
                res.Address = Address;
                res.Note = Note;
                res.RefSessionId = RefSessionId;
                res.Status = Status;
                res.Note = Note;
                res.ModifiedBy = ModifiedBy;
                return res;
            }
            else if (Id == 0)
            {
                ClassAttendance res = new ClassAttendance();
                res.ClassId = ClassId;
                res.StudentId = StudentId;
                res.DeviceId = DeviceId;
                res.Latitude = Latitude;
                res.Longtitude = Longtitude;
                res.Altitude = Altitude;
                res.Address = Address;
                res.Note = Note;
                res.RefSessionId = RefSessionId;
                res.Status = Status;
                res.Note = Note;
                res.CreatedBy = CreatedBy;
                return res;
            }
            else
                return null;
        }
    }

    public class TeacherClassDocumentReq
    {
        public int ClassId { get; set; }
        public string DocumentType { get; set; }
    }

    public class ClassDocumentReq
    {
        public int Id { get; set; }
        public int? ClassId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string LinkUrl { get; set; }
        public string ImageUrl { get; set; }
        public string DocumentType { get; set; }
        public string Type { get; set; }
        public string Content { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }

        public ClassDocument convert()
        {
            if (Id > 0)
            {
                ClassDocument res = new ClassDocument();
                res.Id = Id;
                res.ClassId = ClassId;
                res.Title = Title;
                res.Description = Description;
                res.LinkUrl = LinkUrl;
                res.DocumentType = DocumentType;
                res.Type = Type;
                res.Content = Content;              
                res.Status = Status;
                res.CreatedBy = CreatedBy;
                res.CreatedOn = CreatedOn;
                res.ModifiedBy = ModifiedBy;
                return res;
            }
            else if (Id == 0)
            {
                ClassDocument res = new ClassDocument();
                res.ClassId = ClassId;
                res.Title = Title;
                res.Description = Description;
                res.LinkUrl = LinkUrl;
                res.DocumentType = DocumentType;
                res.Type = Type;
                res.Content = Content;
                res.Status = Status;
                res.CreatedBy = CreatedBy;
                return res;
            }
            else
                return null;
        }
    }

    public class TeacherClassAnnouncementReq
    {
        public int ClassId { get; set; }
        public int Size { get; set; }
        public int Page { get; set; }
    }

    public class ClassAnnouncementReq
    {
        public int Id { get; set; }
        public int? ClassId { get; set; }
        public string Title { get; set; }
        public string Brief { get; set; }
        public string Type { get; set; }
        public string Content { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }

        public ClassAnnouncement convert()
        {
            if (Id > 0)
            {
                ClassAnnouncement res = new ClassAnnouncement();
                res.Id = Id;
                res.ClassId = ClassId;
                res.Title = Title;
                res.Brief = Brief;
                res.Type = Type;
                res.Content = Content;
                res.Status = Status;
                res.CreatedBy = CreatedBy;
                res.CreatedOn = CreatedOn;
                res.ModifiedBy = ModifiedBy;
                return res;
            }
            else if (Id == 0)
            {
                ClassAnnouncement res = new ClassAnnouncement();
                res.ClassId = ClassId;
                res.Title = Title;
                res.Brief = Brief;
                res.Type = Type;
                res.Content = Content;
                res.Status = Status;
                res.CreatedBy = CreatedBy;
                return res;
            }
            else
                return null;
        }
    }

    public class TeacherClassSubjectReq
    {
        public string Keyword { get; set; }
        public int UserId { get; set; }
        public int ExamDetailId { get; set; }
        public int SubjectId { get; set; }
        public int QuestionId { get; set; }
        public int ExamId { get; set; }
        public int Size { get; set; }
        public int SizeQuest { get; set; }
        public int Page { get; set; }
    }

    public class ClassExamReq
    {
        public int Id { get; set; }
        public string ExamTitle { get; set; }
        public string ExamDepartment { get; set; }
        public string ExamSchool { get; set; }
        public int? SubjectId { get; set; }
        public string ExamType { get; set; }
        public int? ExamLevel { get; set; }
        public int? TotMinutes { get; set; }
        public int? TotalQuestion { get; set; }
        public int? TotalScore { get; set; }
        public string Note { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }

        public Exam convert()
        {
            if (Id > 0)
            {
                Exam res = new Exam();
                res.Id = Id;
                res.ExamTitle = ExamTitle;
                res.ExamDepartment = ExamDepartment;
                res.ExamSchool = ExamSchool;
                res.SubjectId = SubjectId;
                res.ExamType = ExamType;
                res.ExamLevel = ExamLevel;
                res.TotMinutes = TotMinutes;
                res.TotalQuestion = TotalQuestion;
                res.TotalScore = TotalScore;
                res.Note = Note;
                res.Status = Status;
                res.CreatedBy = CreatedBy;
                res.CreatedOn = CreatedOn;
                res.ModifiedBy = ModifiedBy;
                return res;
            }
            else if (Id == 0)
            {
                Exam res = new Exam();
                res.ExamTitle = ExamTitle;
                res.ExamDepartment = ExamDepartment;
                res.ExamSchool = ExamSchool;
                res.SubjectId = SubjectId;
                res.ExamType = ExamType;
                res.ExamLevel = ExamLevel;
                res.TotMinutes = TotMinutes;
                res.TotalQuestion = TotalQuestion;
                res.TotalScore = TotalScore;
                res.Note = Note;
                res.Status = Status;
                res.CreatedBy = CreatedBy;
                return res;
            }
            else
                return null;
        }
    }

    public class ExamQuestionReq
    {
        public int Id { get; set; }
        public string QuestionInstruction { get; set; }
        public string QuestionContent { get; set; }
        public string QuestionImage { get; set; }
        public string QuestionType { get; set; }
        public int? TotMinutes { get; set; }
        public int? TotScore { get; set; }
        public int? SubjectId { get; set; }
        public string Note { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public string ImageBase64 { get; set; }
        public ExamQuestion convert()
        {
            if (Id > 0)
            {
                ExamQuestion res = new ExamQuestion();
                res.Id = Id;
                res.QuestionInstruction = QuestionInstruction;
                res.QuestionContent = QuestionContent;
                res.QuestionImage = QuestionImage;
                res.SubjectId = SubjectId;
                res.QuestionType = QuestionType;
                res.TotMinutes = TotMinutes;
                res.TotScore = TotScore;
                res.Note = Note;
                res.Status = Status;
                res.CreatedBy = CreatedBy;
                res.CreatedOn = CreatedOn;
                res.ModifiedBy = ModifiedBy;
                return res;
            }
            else if (Id == 0)
            {
                ExamQuestion res = new ExamQuestion();
                res.QuestionInstruction = QuestionInstruction;
                res.QuestionContent = QuestionContent;
                res.QuestionImage = QuestionImage;
                res.SubjectId = SubjectId;
                res.QuestionType = QuestionType;
                res.TotMinutes = TotMinutes;
                res.TotScore = TotScore;
                res.Note = Note;
                res.Status = Status;
                res.CreatedBy = CreatedBy;
                return res;
            }
            else
                return null;
        }
    }

    public class ExamAnswerReq
    {
        public int Id { get; set; }
        public int? QuestionId { get; set; }
        public string AnswerContent { get; set; }
        public string AnswerImage { get; set; }
        public string AnswerType { get; set; }
        public bool? IsCorrect { get; set; }
        public int? Score { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public string ImageBase64 { get; set; }
        public string CreatedByName { get; set; }
        public string ModifiedByName { get; set; }

        public ExamAnswer convert()
        {
            if (Id > 0)
            {
                ExamAnswer res = new ExamAnswer();
                res.Id = Id;
                res.QuestionId = QuestionId;
                res.AnswerContent = AnswerContent;
                res.AnswerImage = AnswerImage;
                res.AnswerType = AnswerType;
                res.IsCorrect = IsCorrect;
                res.Score = Score;
                res.Status = Status;
                res.CreatedBy = CreatedBy;
                res.CreatedOn = CreatedOn;
                res.ModifiedBy = ModifiedBy;
                return res;
            }
            else if (Id == 0)
            {
                ExamAnswer res = new ExamAnswer();
                res.QuestionId = QuestionId;
                res.AnswerContent = AnswerContent;
                res.AnswerImage = AnswerImage;
                res.AnswerType = AnswerType;
                res.IsCorrect = IsCorrect;
                res.Score = Score;
                res.Status = Status;
                res.CreatedBy = CreatedBy;
                return res;
            }
            else
                return null;
        }
    }

    public class ExamAnswerInfoReq
    {
        public List<ExamAnswerReq> ListAnswer { get; set; }
        public int SubjectId { get; set; }
        public int QuestionId { get; set; }
    }
}