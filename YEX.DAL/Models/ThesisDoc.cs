using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class ThesisDoc
    {
        public int Id { get; set; }
        public int? ThesisId { get; set; }
        public string DocName { get; set; }
        public string Description { get; set; }
        public string Url { get; set; }
        public string Note { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
