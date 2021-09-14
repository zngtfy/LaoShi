using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class TeacherSkill
    {
        public int Id { get; set; }
        public int? TeacherId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Type { get; set; }
        public string RefUrl { get; set; }
        public string Note { get; set; }
        public int? SeftEvaluate { get; set; }
        public int? StartYear { get; set; }
        public string ViewGroup { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
