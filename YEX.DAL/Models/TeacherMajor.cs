using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class TeacherMajor
    {
        public int Id { get; set; }
        public int? TeacherId { get; set; }
        public string MajorName { get; set; }
        public string MajorNameEng { get; set; }
        public string MajorCode { get; set; }
        public string Field { get; set; }
        public string FieldEng { get; set; }
        public string Description { get; set; }
        public int? StartFrom { get; set; }
        public bool? CanDelete { get; set; }
        public string ViewGroup { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
