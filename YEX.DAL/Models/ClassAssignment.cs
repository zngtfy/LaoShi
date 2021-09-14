using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class ClassAssignment
    {
        public int Id { get; set; }
        public int? ClassId { get; set; }
        public string Name { get; set; }
        public string AssignmentType { get; set; }
        public string AssignmentContent { get; set; }
        public string AssignmentUrl { get; set; }
        public int? GroupNo { get; set; }
        public DateTime? DueDate { get; set; }
        public bool? RequireSubmit { get; set; }
        public string SubmitType { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
