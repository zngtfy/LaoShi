using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class ClassScoreConfig
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
    }
}
