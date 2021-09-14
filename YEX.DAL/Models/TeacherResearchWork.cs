using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class TeacherResearchWork
    {
        public int Id { get; set; }
        public int? TeacherId { get; set; }
        public string Type { get; set; }
        public string Title { get; set; }
        public string CoAuthors { get; set; }
        public int? Day { get; set; }
        public int? Month { get; set; }
        public int? Year { get; set; }
        public string City { get; set; }
        public string Publisher { get; set; }
        public string PublisherUrl { get; set; }
        public string Pages { get; set; }
        public string Doi { get; set; }
        public string Issn { get; set; }
        public string Isbn { get; set; }
        public string IndexedBy { get; set; }
        public string DownloadUrl { get; set; }
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
