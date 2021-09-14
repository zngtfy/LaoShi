using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class ClassAnnouncement
    {
        public int Id { get; set; }
        public int? ClassId { get; set; }
        public string Title { get; set; }
        public string Brief { get; set; }
        public string Type { get; set; }
        public string Content { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
