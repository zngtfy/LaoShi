using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class ClassStudent
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
    }
}
