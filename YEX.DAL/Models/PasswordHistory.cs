using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class PasswordHistory
    {
        public int Id { get; set; }
        public int? UserId { get; set; }
        public string PasswordHash { get; set; }
        public string PasswordSalt { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
