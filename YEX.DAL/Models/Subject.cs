using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class Subject
    {
        public int Id { get; set; }
        public string SubjectCode { get; set; }
        public string SubjectName { get; set; }
        public string Description { get; set; }
        public string SubjectType { get; set; }
        public int? TotalCredit { get; set; }
        public int? PracticeCredit { get; set; }
        public int? TheoryCredit { get; set; }
        public int? SchoolId { get; set; }
        public string Department { get; set; }
        public string Note { get; set; }
        public string MajorGroup { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
