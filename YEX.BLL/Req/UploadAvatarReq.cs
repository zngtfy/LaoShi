using System;
using System.Collections.Generic;
using System.Text;

namespace YEX.BLL.Req
{
    public class UploadAvatarReq
    {
        #region -- Properties --

        /// <summary>
        /// User ID
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// Base64 avatar
        /// </summary>
        public string Base64Avatar { get; set; }

        #endregion
    }
}
