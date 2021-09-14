using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class ClassAssignmentGroup
    {
        public int Id { get; set; }
        public int? ClassAssignmentId { get; set; }
        public int? GroupNo { get; set; }
        public int? StudentId { get; set; }
        public int? UserId { get; set; }
    }
}
