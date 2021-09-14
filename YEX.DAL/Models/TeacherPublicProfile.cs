using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class TeacherPublicProfile
    {
        public int Id { get; set; }
        public int? TeacherId { get; set; }
        public string SourceName { get; set; }
        public string Description { get; set; }
        public string SourceType { get; set; }
        public string RefUrl { get; set; }
        public string SourceLogoUrl { get; set; }
        public string Note { get; set; }
        public string ViewGroup { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
