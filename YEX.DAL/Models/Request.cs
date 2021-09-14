using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class Request
    {
        public int Id { get; set; }
        public int? RequestBy { get; set; }
        public string RequestName { get; set; }
        public string RequestType { get; set; }
        public bool? IsFromContact { get; set; }
        public string Content { get; set; }
        public string Result { get; set; }
        public int? ResultBy { get; set; }
        public string ViewGroup { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
