using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class Thesis
    {
        public int Id { get; set; }
        public string ThesisTitle { get; set; }
        public string Description { get; set; }
        public string ThesisType { get; set; }
        public string ThesisLevel { get; set; }
        public string ThesisCategory { get; set; }
        public string StudyField { get; set; }
        public string StudyCode { get; set; }
        public string Keyword { get; set; }
        public int? ThesisYear { get; set; }
        public int? Members { get; set; }
        public string Note { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
