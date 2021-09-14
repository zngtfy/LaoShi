using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class StudentExam
    {
        public int Id { get; set; }
        public int? StudentId { get; set; }
        public int? ExamId { get; set; }
        public int? ClassAssignmentId { get; set; }
        public DateTime? StartTime { get; set; }
        public DateTime? EndTime { get; set; }
        public int? Score { get; set; }
        public int? TotScore { get; set; }
        public int? TotQuestion { get; set; }
        public int? TotMinutes { get; set; }
        public string Note { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
    }
}
