using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class Exam
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
    }
}
