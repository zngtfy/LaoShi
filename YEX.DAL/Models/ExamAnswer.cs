using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class ExamAnswer
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
    }
}
