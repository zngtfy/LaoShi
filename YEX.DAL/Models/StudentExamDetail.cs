using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class StudentExamDetail
    {
        public int Id { get; set; }
        public int? StudentExamId { get; set; }
        public int? QuestionId { get; set; }
        public int? Score { get; set; }
        public string Answers { get; set; }
        public string Note { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
    }
}
