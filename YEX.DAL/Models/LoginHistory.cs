using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class LoginHistory
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public Guid? Uuid { get; set; }
        public DateTime? SignInOn { get; set; }
        public DateTime? SignOutOn { get; set; }
        public DateTime? LastAccessedOn { get; set; }
        public string Host { get; set; }
        public string UserAgent { get; set; }
        public bool SingleSession { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
