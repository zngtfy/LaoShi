using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class SubmissionAttachment
    {
        public int Id { get; set; }
        public int? SubmissionId { get; set; }
        public string DisplayName { get; set; }
        public string GuidName { get; set; }
        public string Extension { get; set; }
        public string ContentType { get; set; }
        public string Url { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
    }
}
