using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class School
    {
        public int Id { get; set; }
        public string SchoolCode { get; set; }
        public string SchoolName { get; set; }
        public string SchoolNameEng { get; set; }
        public string SchoolType { get; set; }
        public int? YearOfFoundation { get; set; }
        public string SchoolAddress { get; set; }
        public string SchoolPhone { get; set; }
        public string WebSite { get; set; }
        public string Description { get; set; }
        public string BriefName { get; set; }
        public string LogoUrl { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
