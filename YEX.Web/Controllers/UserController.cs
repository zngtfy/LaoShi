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

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SKG;
using SKG.DAL.Dto;
using SKG.Req;
using SKG.Rsp;

namespace YEX.Web.Controllers
{
    using BLL;
    using BLL.Req;
    using Newtonsoft.Json.Linq;
    using System;
    using System.Drawing;
    using System.Drawing.Imaging;
    using System.IO;
    using System.Net.Mail;
    using System.Threading.Tasks;
    using YEX.DAL.Dto;

    /// <summary>
    /// User controller
    /// </summary>
    public class UserController : BaseController
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="svc">Service</param>
        public UserController(UserSvc svc)
        {
            _svc = svc;
        }

        /// <summary>
        /// Create
        /// </summary>
        /// <param name="req">Request</param>
        /// <returns>Return the result</returns>
        [AllowAnonymous]
        [HttpPost("create")]
        public IActionResult Create([FromBody] UserReq req)
        {
            var m = req.ToModel(0);

            var res = _svc.Create(m);
            return Ok(res);
        }

        /// <summary>
        /// Read
        /// </summary>
        /// <param name="req">Request</param>
        /// <returns>Return the result</returns>
        [HttpPost("read")]
        public IActionResult Read([FromBody] PagingReq req)
        {
            req.UserId = UserId;

            var res = _svc.Read(req);
            return Ok(res);
        }

        /// <summary>
        /// Read
        /// </summary>
        /// <param name="req">Request</param>
        /// <returns>Return the result</returns>
        [HttpPut("read")]
        public IActionResult Read([FromBody] SimpleReq req)
        {
            var res = _svc.Read(req.Id);
            return Ok(res);
        }

        /// <summary>
        /// Get configuration
        /// </summary>
        /// <returns>Return the result</returns>
        [AllowAnonymous]
        [HttpGet("get-config")]
        public IActionResult GetConfig()
        {
            var res = new MultipleRsp();

            res.SetData("rsaMode", AppSetting.S.RsaMode);
            res.SetData("rsaPublicKey", AppSetting.S.RsaPublicKey);
            res.SetData("logoutTime", YVariable.LogoutTime * 60 * 1000); // convert to millisecond

            return Ok(res);
        }

        /// <summary>
        /// Sign in
        /// </summary>
        /// <param name="req">Request</param>
        /// <returns>Return the result</returns>
        [AllowAnonymous]
        [HttpPost("z-auth")]
        public IActionResult SignIn([FromBody] SignInReq req)
        {
            var h = new HeaderDto(HttpContext.Request.Headers);
            var res = _svc.SignIn(req, h);

            return Ok(res);
        }

        /// <summary>
        /// Verify email
        /// </summary>
        /// <param name="req">Request</param>
        /// <returns>Return the result</returns>
        [AllowAnonymous]
        [HttpPost("verify-email")]
        public IActionResult VerifyEmail([FromBody] VerifyEmailReq req)
        {
            var i = new ZEmail.Info(AppSetting.S.EmailUser, req.Keyword)
            {
                Display = req.Display,
                Subject = req.Subject
            };

            var res = _svc.VerifyEmail(req.Keyword, i, req.Body1, req.Body2, req.Body3);

            return Ok(res);
        }

        /// <summary>
        /// Reset password
        /// </summary>
        /// <param name="req">Request</param>
        /// <returns>Return the result</returns>
        /*[AllowAnonymous]
        [HttpPost("reset-password")]
        public IActionResult ResetPassword([FromBody]PasswordReq req)
        {
            var h = new HeaderDto(HttpContext.Request.Headers);
            var res = _svc.ResetPassword(req, h);

            return Ok(res);
        }*/

        /// <summary>
        /// Check password reminder token expired
        /// </summary>
        /// <param name="req">Request body</param>
        /// <returns>Return the result</returns>
        [HttpPost("check-expired")]
        public IActionResult CheckTokenExpired([FromBody] SimpleReq req)
        {
            var token = req.Keyword;
            BaseRsp res = null;// _svc.checkTokenExpired(token);
            return Ok(res);
        }

        /// <summary>
        /// Sign out
        /// </summary>
        /// <returns>Return the result</returns>
        [HttpPost("sign-out")]
        public IActionResult SignOut()
        {
            SingleRsp res = null;//_svc.signOut(_req);
            return Ok(res);
        }

        /// <summary>
        /// Refresh JWT
        /// </summary>
        /// <returns>Return the result</returns>
        [HttpPost("refresh-jwt")]
        public IActionResult RefreshJwt()
        {
            SingleRsp res = null;// _svc.refreshToken(_req);
            return Ok(res);
        }

        /// <summary>
        /// Update password
        /// </summary>
        /// <param name="req">Request</param>
        /// <returns>Return the result</returns>
        [HttpPost("update-password")]
        public IActionResult UpdatePassword([FromBody] PasswordReq req)
        {
            var id = 0;//ZToken.getId(h);
            var h = new HeaderDto(HttpContext.Request.Headers);
            SingleRsp res = _svc.UpdatePassword(id, req, h);

            return Ok(res);
        }

        /// <summary>
        /// Get info
        /// </summary>
        /// <param name="req">Request</param>
        /// <returns>Return the result</returns>
        [AllowAnonymous]
        [HttpPost("get-info")]
        public IActionResult GetInfo([FromBody] SimpleReq req)
        {
            var res = _svc.Read(req.Id);
            return Ok(res);
        }

        /// <summary>
        /// Upload info
        /// </summary>
        /// <param name="req">Request</param>
        /// <returns>Return the result</returns>
        [AllowAnonymous]
        [HttpPost("upload-info")]
        public IActionResult UploadInfo([FromBody] UserReq req)
        {
            SingleRsp res = new SingleRsp();

            if (req.Base64Avatar != null)
            {
                var bytes = Convert.FromBase64String(req.Base64Avatar);

                var uploadDir = "ClientApp/src/assets/img/avatars";
                if (!AppSetting.S.Dev)
                {
                    uploadDir = "ClientApp/dist/assets/img/avatars";
                }

                string filedir = Path.Combine(Directory.GetCurrentDirectory(), uploadDir);
                if (!Directory.Exists(filedir))
                {
                    Directory.CreateDirectory(filedir);
                }

                Guid g = System.Guid.NewGuid();

                string dir = "assets/img/avatars/";
                string filename = g.ToString() + ".jpg";
                string file = Path.Combine(filedir, filename);

                if (bytes.Length > 0)
                {
                    MemoryStream originalMs = new MemoryStream(bytes);
                    Image originaImage = Image.FromStream(originalMs);
                    originaImage.Save(file, ImageFormat.Jpeg);

                    req.UrlAvatar = dir + filename;
                }
                else
                {
                    req.UrlAvatar = null;
                }
            }

            res = _svc.UpdateInfo(req);

            return Ok(res);
        }

        /// <summary>
        /// Change passs
        /// </summary>
        /// <param name="req">Request</param>
        /// <returns>Return the result</returns>
        [AllowAnonymous]
        [HttpPost("change-pass")]
        public IActionResult ChangePass([FromBody] PasswordReq req)
        {
            SingleRsp res = new SingleRsp();
            res = _svc.ChangePassword((int)req.Id, req.OldPassword, req.NewPassword, true);

            return Ok(res);
        }

        [AllowAnonymous]
        [HttpPost("send-request-reset-password")]
        public IActionResult ForgetPassword([FromBody] SimpleReq req)
        {
            var res = new SingleRsp();

            // Check email exist
            var user = _svc.ReadByEmail(req.Keyword);
            if (user != null)
            {
                // Generate password reminder token
                user.ReminderToken = Guid.NewGuid().ToString();
                user.ReminderExpired = DateTime.Now.AddMinutes(AppSetting.S.ReminderExpired);

                _svc.UpdateNew(user);

                var sentRes = SendEmailForgetPassword(user.Email, user.FirstName, user.UserName, user.ReminderToken, AppSetting.S.ReminderExpired);
            }
            else
            {
                res.SetError("Email không tồn tại!");
            }

            return Ok(res);
        }

        [AllowAnonymous]
        [HttpPost("check-request-reset-password")]
        public IActionResult CheckReminderToken([FromBody] SimpleReq req)
        {
            var res = new SingleRsp();

            // Check reminder token
            var user = _svc.ReadByReminderToken(req.Keyword);
            if (user != null)
            {
                res.Data = new
                {
                    UserName = user.UserName,
                    FullName = user.FirstName + " " + user.LastName,
                    ReminderExpired = AppSetting.S.ReminderExpired
                };
            }
            else
            {
                res.SetError("Rất tiếc, yêu cầu của bạn đã hết hạn.");
            }

            return Ok(res);
        }

        [AllowAnonymous]
        [HttpPost("reset-password")]
        public IActionResult ResetPassword([FromBody] PasswordReq req)
        {
            var res = new SingleRsp();

            // Check reminder token
            var user = _svc.ReadByReminderToken(req.ReminderToken);
            if (user != null)
            {
                try
                {
                    res = _svc.ChangePassword(user.Id, null, req.NewPassword, false);

                    // Reset password reminder token
                    user.ReminderToken = null;
                    user.ReminderExpired = null;

                    _svc.UpdateNew(user);
                }
                catch (Exception ex)
                {
                    res.SetError(ex.Message);
                }
            }
            else
            {
                res.SetError("Rất tiếc, yêu cầu của bạn đã hết hạn!");
            }

            return Ok(res);
        }

        private async Task<int> SendEmailForgetPassword(string recieverEmail, string recieverFullName, string username, string reminderToken, double reminderExpired)
        {
            int i = 0;
            bool iDev = AppSetting.S.Dev;
            //tempStr = "";
            i = await SendMail(recieverEmail, recieverFullName, username, reminderToken, reminderExpired, iDev);
            if (i == 0)
                tempStr += "Email failed to send[" + recieverEmail + "] ! <br/>";
            return i;
        }

        public async Task<int> SendMail(string recieverEmail, string recieverFullName, string username, string reminderToken, double reminderExpired, bool iDev)
        {
            //_logger.Info("Starting SendMail.... [" + notiMail.RecieverEmail + "]");
            int i = 0;
            var result = await Task.Run(() =>
            {
                try
                {
                    #region Read file template
                    var dir = Directory.GetCurrentDirectory();
                    //string projectDirectory = Directory.GetParent(dir).Parent.FullName;
                    string projectDirectory = dir;
                    string sFileName = "";
                    if (iDev)
                        sFileName = projectDirectory + @"\Email\ForgetPassword.html";
                    else
                        sFileName = dir + @"\Email\ForgetPassword.html";

                    var file = new FileInfo(sFileName);
                    StreamReader sR = file.OpenText();
                    string sTemplate = sR.ReadToEnd();
                    #endregion

                    #region Send mail
                    MailConfig conf = getMailConfig(iDev);
                    string Title = conf.TitleNotification;
                    string DisplayName = conf.DisplayName;
                    string To = recieverEmail;
                    int port = conf.Port;
                    string smtp = conf.SMTP;
                    string cc = conf.CC;
                    string cc1 = conf.CC1;
                    string sEmail = conf.From;
                    string host = AppSetting.S.Host;

                    sTemplate = sTemplate.Replace("[FullName]", recieverFullName);
                    sTemplate = sTemplate.Replace("[Username]", username);
                    sTemplate = sTemplate.Replace("[ReminderExpired]", reminderExpired.ToString());
                    sTemplate = sTemplate.Replace("[ResetPasswordLink]", host + "reset-password/" + reminderToken);

                    /// Remark info
                    sTemplate = sTemplate.Replace("[System_admin]", conf.SystemAdmin);
                    sTemplate = sTemplate.Replace("[System_admin_Email]", conf.SystemAdminEmail);
                    sTemplate = sTemplate.Replace("[System_admin_Tel]", conf.SystemAdminContact);

                    //int result = 0;
                    using (MailMessage mail = new MailMessage())
                    {
                        mail.From = new MailAddress(sEmail, DisplayName);
                        mail.To.Add(recieverEmail);
                        mail.CC.Add(cc);
                        mail.CC.Add(cc1);
                        mail.Subject = Title;
                        mail.Body = sTemplate;
                        mail.IsBodyHtml = true;
                        mail.SubjectEncoding = System.Text.Encoding.UTF8;
                        mail.BodyEncoding = System.Text.Encoding.UTF8;
                        SmtpClient client = new SmtpClient(smtp, Convert.ToInt32(port));
                        client.UseDefaultCredentials = true;
                        string emailHost = conf.From;//"no-reply@appoint.com.sg";
                        string pwdEmail = conf.Password;
                        client.Credentials = new System.Net.NetworkCredential(emailHost, pwdEmail);
                        //_logger.Info("Reciever Email: " + notiMail.RecieverEmail);
                        if (IsValidEmail(recieverEmail))
                        {
                            client.Send(mail);
                            i = 1;
                        }
                        else
                        {
                            i = 0;
                            //_logger.Info("Email not valid!");
                        }
                    }
                    #endregion
                }
                catch (Exception ex)
                {
                    //_logger.Info(ex.Message);
                    i = 0;
                }
                return i;
            });
            return result;
        }

        private MailConfig getMailConfig(bool isDev)
        {
            MailConfig value = new MailConfig();
            var dir = Directory.GetCurrentDirectory();
            //string projectDirectory = Directory.GetParent(dir).Parent.FullName;
            string projectDirectory = dir;
            //_logger.Info(projectDirectory);
            string file = "";
            if (isDev)
                file = projectDirectory + @"\Email\mailConfig.json";
            else
                file = dir + @"\Email\mailConfig.json";
            try
            {
                using (var r = new StreamReader(file))
                {
                    var t1 = r.ReadToEnd();
                    var t2 = JObject.Parse(t1);

                    var t3 = t2.GetValue(nameof(MailConfig));
                    value = t3.ToObject<MailConfig>();
                }
            }
            catch (Exception ex)
            {
                //_logger.Info(ex.Message);
            }
            return value;
        }
        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }
        public string tempStr;

        #endregion

        #region -- Fields --

        /// <summary>
        /// Repository to handle the database
        /// </summary>
        private readonly UserSvc _svc;

        #endregion
    }
}