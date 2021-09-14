using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class ClassSession
    {
        public int Id { get; set; }
        public int? ClassId { get; set; }
        public string Session { get; set; }
        public string Brief { get; set; }
        public string ClassContent { get; set; }
        public DateTime? DateOfClass { get; set; }
        public string SessionType { get; set; }
        public string FromTime { get; set; }
        public string ToTime { get; set; }
        public int? TotalClassUnit { get; set; }
        public string Location { get; set; }
        public string Note { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
