using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class ThesisWorkAttachment
    {
        public int Id { get; set; }
        public int? ThesisWorkId { get; set; }
        public string DisplayName { get; set; }
        public string Version { get; set; }
        public string GuidName { get; set; }
        public string Extension { get; set; }
        public string ContentType { get; set; }
        public string Url { get; set; }
        public string Note { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
    }
}
