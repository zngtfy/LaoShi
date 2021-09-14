using System;
using System.Collections.Generic;
using System.Text;

namespace YEX.BLL.Req
{
    public class RequestReq
    {
        #region -- Properties --

        /// <summary>
        /// ID
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Request by
        /// </summary>
        public int RequestBy { get; set; }

        /// <summary>
        /// Request name
        /// </summary>
        public string RequestName { get; set; }

        /// <summary>
        /// Request type
        /// </summary>
        public string RequestType { get; set; }

        /// <summary>
        /// Content
        /// </summary>
        public string Content { get; set; }

        /// <summary>
        /// Result by 
        /// </summary>
        public int ResultBy { get; set; }

        /// <summary>
        /// Result 
        /// </summary>
        public string Result { get; set; }

        #endregion
    }
}
