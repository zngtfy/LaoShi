using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class TeacherStudy
    {
        public int Id { get; set; }
        public int? TeacherId { get; set; }
        public string TeacherRole { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Type { get; set; }
        public string Color { get; set; }
        public string Time { get; set; }
        public string City { get; set; }
        public string Publisher { get; set; }
        public string StudyLevel { get; set; }
        public string Result { get; set; }
        public string RefUrl { get; set; }
        public string Introduction { get; set; }
        public string Keywords { get; set; }
        public string ViewGroup { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
