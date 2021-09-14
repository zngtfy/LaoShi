﻿using System;
using System.Collections.Generic;

namespace YEX.DAL.Models
{
    public partial class Role
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public short? Status { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
