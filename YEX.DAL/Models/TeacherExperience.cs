using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class TeacherExperience
    {
        public int Id { get; set; }
        public int? TeacherId { get; set; }
        public string WorkingTime { get; set; }
        public string WorkTitle { get; set; }
        public string Description { get; set; }
        public string WorkType { get; set; }
        public string WorkLocation { get; set; }
        public string WorkLevel { get; set; }
        public string ReasonOfQuit { get; set; }
        public string References { get; set; }
        public string ViewGroup { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
