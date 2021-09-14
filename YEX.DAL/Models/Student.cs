using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class Student
    {
        public int Id { get; set; }
        public string OfficialStudentId { get; set; }
        public int? UserId { get; set; }
        public DateTime? Birthday { get; set; }
        public bool? Gender { get; set; }
        public string StudentType { get; set; }
        public string Class { get; set; }
        public string CourseName { get; set; }
        public string Note { get; set; }
        public int? SchoolId { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
