using System;
using System.Collections.Generic;
using System.Text;

namespace YEX.DAL.Dto
{
    public class MailConfig
    {
        public string To { get; set; }
        public string DisplayName { get; set; }
        public string TitleNotification { get; set; }
        public string From { get; set; }
        public string CC { get; set; }
        public string CC1 { get; set; }
        public string Password { get; set; }
        public string SMTP { get; set; }
        public int Port { get; set; }
        public string SMTP1 { get; set; }
        public int Port1 { get; set; }

        //system admin
        public string SystemAdmin { get; set; }
        public string SystemAdminContact { get; set; }
        public string SystemAdminEmail { get; set; }
    }

    public class ActivateAccountMail
    {
        public string Username { get; set; }
        public string Password { get; set; }

        /// <summary>
        /// 
        /// </summary>

        public string RecieverFullName { get; set; }
        public string RecieverEmail { get; set; }

        // 
        public string System_admin { get; set; }
        public string System_admin_Email { get; set; }
        public string System_admin_Tel { get; set; }
    }
}
