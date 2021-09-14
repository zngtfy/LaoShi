using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class ClassMember
    {
        public int Id { get; set; }
        public int? ClassId { get; set; }
        public int? MemberId { get; set; }
        public string MemberRole { get; set; }
        public string Description { get; set; }
        public string Note { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
