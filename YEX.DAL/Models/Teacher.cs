using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class Teacher
    {
        public int Id { get; set; }
        public int? UserId { get; set; }
        public DateTime? Birthday { get; set; }
        public string FullName { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }
        public string Introduction { get; set; }
        public string Email { get; set; }
        public string Title { get; set; }
        public int? SchoolId { get; set; }
        public bool? Gender { get; set; }
        public string ViewGroup { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
