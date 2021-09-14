using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class ExamQuestion
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
    }
}
