using System;
using System.Collections.Generic;
using System.Text;

namespace YEX.DAL.Models
{
	public partial class SchoolCampus
	{
		public int Id { get; set; }
		public int? SchoolId { get; set; }
		public string CampusName { get; set; }
		public string Latitude { get; set; }
		public string Longtitude { get; set; }
		public string Altitude { get; set; }
		public string Address { get; set; }
		public string Note { get; set; }
		public short? Status { get; set; }
		public int? CreatedBy { get; set; }
		public DateTime? CreatedOn { get; set; }
		public int? ModifiedBy { get; set; }
		public DateTime? ModifiedOn { get; set; }
	}
}
