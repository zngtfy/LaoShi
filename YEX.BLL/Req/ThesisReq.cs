using System;
using System.Collections.Generic;
using System.Text;

namespace YEX.BLL.Req
{
    public class ThesisReq
    {
        public int ThesisId { get; set; }
        public int UserId { get; set; }
        public int? Status { get; set; }
        public int? Page { get; set; }
        public int? Size { get; set; }
        public string Type { get; set; }
    }

    public class ThesisRefReq
    {
        public int ThesisId { get; set; }
        public int SortCode { get; set; }
        public int? Page { get; set; }
        public int? Size { get; set; }
        public string Keyword { get; set; }
    }
}
