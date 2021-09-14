namespace YEX.BLL.Req
{
    public class ChangePassReq
    {
        #region -- Properties --

        /// <summary>
        /// Old password
        /// </summary>
        public string oldPassword { get; set; }

        /// <summary>
        /// New password
        /// </summary>
        public string newPassword { get; set; }

        #endregion
    }
}
