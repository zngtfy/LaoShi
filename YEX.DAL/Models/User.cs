using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class User
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string Avatar { get; set; }
        public string PasswordHash { get; set; }
        public string PasswordSalt { get; set; }
        public string ReminderToken { get; set; }
        public DateTime? ReminderExpired { get; set; }
        public DateTime? LastSignIn { get; set; }
        public short? InvalidAttempts { get; set; }
        public DateTime? LockExpired { get; set; }
        public DateTime? LastPasswordChanged { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
