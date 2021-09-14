using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class ExamDetail
    {
        public int Id { get; set; }
        public int? ExamId { get; set; }
        public int? QuestionId { get; set; }
        public int? Score { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
