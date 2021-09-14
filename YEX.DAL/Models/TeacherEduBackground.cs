using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class TeacherEduBackground
    {
        public int Id { get; set; }
        public int? TeacherId { get; set; }
        public string Title { get; set; }
        public string Degree { get; set; }
        public string DegreeNo { get; set; }
        public string DegreeRegNo { get; set; }
        public DateTime? DegreeDate { get; set; }
        public int? SchoolId { get; set; }
        public string Type { get; set; }
        public string Duration { get; set; }
        public int? YearOfGrad { get; set; }
        public string Result { get; set; }
        public string RefUrl1 { get; set; }
        public string RefUrl2 { get; set; }
        public string ViewGroup { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
