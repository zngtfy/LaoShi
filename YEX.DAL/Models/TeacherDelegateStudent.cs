using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class TeacherDelegateStudent
    {
        public int Id { get; set; }
        public int? TeacherId { get; set; }
        public int? StudentId { get; set; }
        public string Topic { get; set; }
        public string Description { get; set; }
        public string Time { get; set; }
        public string SupervisedType { get; set; }
        public string RefUrl { get; set; }
        public string Note { get; set; }
        public string ViewGroup { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
