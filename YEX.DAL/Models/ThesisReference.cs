using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class ThesisReference
    {
        public int Id { get; set; }
        public int? ThesisId { get; set; }
        public int? ReferenceId { get; set; }
        public string Note { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
