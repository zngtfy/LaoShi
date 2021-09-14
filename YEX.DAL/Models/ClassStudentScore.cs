using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class ClassStudentScore
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
    }
}
