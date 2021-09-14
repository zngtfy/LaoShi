using System;
using System.Collections.Generic;
using System.Text;

namespace YEX.BLL.Req
{
    public class CodeTypeReq
    {
        #region -- Properties --

        /// <summary>
        /// ID
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Code
        /// </summary>
        public string Code { get; set; }

        /// <summary>
        /// Display as
        /// </summary>
        public string DisplayAs { get; set; }

        /// <summary>
        /// Sequence
        /// </summary>
        public int Sequence { get; set; }

        #endregion
    }
}
