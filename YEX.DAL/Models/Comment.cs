using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class Comment
    {
        public int Id { get; set; }
        public int? ParentId { get; set; }
        public string CommentType { get; set; }
        public int? CommentForId { get; set; }
        public int? Level { get; set; }
        public string Content { get; set; }
        public short? Status { get; set; }
        public int? ApprovedBy { get; set; }
        public DateTime? ApprovedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
