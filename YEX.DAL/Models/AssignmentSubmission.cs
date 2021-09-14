using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class AssignmentSubmission
    {
        public int Id { get; set; }
        public int? ClassAssignmentId { get; set; }
        public string SubmitForGroup { get; set; }
        public string SubmitForMembers { get; set; }
        public string SubmissionUrl { get; set; }
        public string SubmitType { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
    }
}
