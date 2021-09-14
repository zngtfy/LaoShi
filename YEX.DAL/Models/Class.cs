using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class Class
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public int? SubjectId { get; set; }
        public string Venue { get; set; }
        public string Description { get; set; }
        public string ClassTime { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public string Prerequisition { get; set; }
        public string Images { get; set; }
        public int? Semester { get; set; }
        public string SchoolYear { get; set; }
        public int? TotalSession { get; set; }
        public string Note { get; set; }
        public int? TeacherId { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
