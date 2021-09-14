#region Information
/*
 * Author       : ZngTfy
 * Email        : toan.nguyen@tanvieta.co
 * Phone        : +84 345 515 010
 * ------------------------------- *
 * Create       : 2019-Oct-19 04:24
 * Update       : 2019-Oct-19 04:24
 * Checklist    : 1.0
 * Status       : Done
 */
#endregion

using System;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;

namespace SKG
{
    using Ext;

    /// <summary>
    /// Email
    /// </summary>
    public class ZEmail
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="host">Host</param>
        /// <param name="port">Port</param>
        /// <param name="userName">User name</param>
        /// <param name="password">Encrypted password</param>
        /// <param name="private">RSA private key</param>
        public ZEmail(string host, int port, string userName, string password, string @private)
        {
            Host = host;
            Port = port;
            UserName = userName;
            Password = password;
            Private = @private;

            var path = AppDomain.CurrentDomain.BaseDirectory;
            Folder = path + "Email/";
        }

        /// <summary>
        /// Send email
        /// </summary>
        /// <param name="message">Mail message</param>
        public void SendEmail(MailMessage message)
        {
            var t = Password.Decrypt(Private);
            var cred = new NetworkCredential(UserName, t);

            var smtp = new SmtpClient(Host, Port)
            {
                Credentials = cred,
                EnableSsl = true
            };

            smtp.Send(message);
            smtp.Dispose();
        }

        /// <summary>
        /// GetMailWithImage
        /// </summary>
        /// <param name="i">Email information</param>
        /// <returns>Return the result</returns>
        public MailMessage GetMailWithImage(Info i)
        {
            var htm = (Folder + "index.html").ReadAllText();

            var i1 = new LinkedResource(Folder + "images/app.png")
            {
                ContentId = Guid.NewGuid().ToString()
            };
            htm = htm.Replace("cid:0", "cid:" + i1.ContentId + "\"");

            var i2 = new LinkedResource(Folder + "images/cws.png")
            {
                ContentId = Guid.NewGuid().ToString()
            };
            htm = htm.Replace("cid:1", "cid:" + i2.ContentId + "\"");

            htm = htm.Replace("Z-SUBJECT", i.Subject);
            htm = htm.Replace("Z-BODY1", "Dear " + i.FullName + ",");
            htm = htm.Replace("Z-BODY2", "Your User ID for ePortal is");
            htm = htm.Replace("Z-BODY3", "Please click the here to setup your password and continue");

            var alt = AlternateView.CreateAlternateViewFromString(htm, null, MediaTypeNames.Text.Html);
            alt.LinkedResources.Add(i1);
            alt.LinkedResources.Add(i2);

            var msg = new MailMessage
            {
                IsBodyHtml = true
            };
            msg.AlternateViews.Add(alt);

            msg.To.Add(i.To);
            msg.From = new MailAddress(i.Fr, i.Display);
            msg.Subject = i.Subject;

            if (!string.IsNullOrEmpty(i.Cc))
            {
                msg.CC.Add(i.Cc);
            }

            return msg;
        }

        #endregion

        #region -- Properties --

        /// <summary>
        /// Host
        /// </summary>
        public string Host { get; private set; }

        /// <summary>
        /// Port
        /// </summary>
        public int Port { get; private set; }

        /// <summary>
        /// User name
        /// </summary>
        public string UserName { get; private set; }

        /// <summary>
        /// Password
        /// </summary>
        public string Password { get; private set; }

        /// <summary>
        /// RSA private key
        /// </summary>
        public string Private { get; private set; }

        /// <summary>
        /// Email folder
        /// </summary>
        public string Folder { get; private set; }

        #endregion

        #region -- Classes --

        /// <summary>
        /// Email information
        /// </summary>
        public class Info
        {
            #region -- Methods --

            /// <summary>
            /// Initialize
            /// </summary>
            /// <param name="fr">From</param>
            /// <param name="to">To</param>
            public Info(string fr, string to)
            {
                Fr = fr;
                To = to;
            }

            #endregion

            #region -- Properties --

            /// <summary>
            /// From
            /// </summary>
            public string Fr { get; set; }

            /// <summary>
            /// To
            /// </summary>
            public string To { get; set; }

            /// <summary>
            /// Carbon copy
            /// </summary>
            public string Cc { get; set; }

            /// <summary>
            /// Subject
            /// </summary>
            public string Subject { get; set; }

            /// <summary>
            /// Full name
            /// </summary>
            public string FullName { get; set; }

            /// <summary>
            /// Display name associated with address
            /// </summary>
            public string Display { get; set; }

            #endregion
        }

        #endregion
    }
}