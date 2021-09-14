using System;
using System.Collections.Generic;
using System.Text;

namespace YEX.BLL.Req
{
    public class CodeReq
    {
        #region -- Properties --

        /// <summary>
        /// ID
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Code type
        /// </summary>
        public string CodeType { get; set; }

        /// <summary>
        /// Value
        /// </summary>
        public string Value { get; set; }

        /// <summary>
        /// Display as
        /// </summary>
        public string DisplayAs { get; set; }

        /// <summary>
        /// Sequence
        /// </summary>
        public int Sequence { get; set; }

        /// <summary>
        /// Image base64
        /// </summary>
        public string ImageBase64 { get; set; }
        public int CreatedBy { get; set; }
        public int ModifiedBy { get; set; }
        #endregion
    }
}
