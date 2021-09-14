#region Information
/*
 * Author       : ZngTfy
 * Email        : toan.nguyen@tanvieta.co
 * Phone        : +84 345 515 010
 * ------------------------------- *
 * Create       : 2019-Oct-19 04:24
 * Update       : 2019-Oct-29 14:42
 * Checklist    : 1.0
 * Status       : Done
 */
#endregion

using Microsoft.AspNetCore.Identity;
using Newtonsoft.Json;
using SKG;
using SKG.BLL;
using SKG.DAL.Dto;
using SKG.Ext;
using SKG.Req;
using SKG.Rsp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;

namespace YEX.BLL
{
    using DAL;
    using DAL.Dto;
    using DAL.Models;
    using Filter;
    using Req;

    /// <summary>
    /// User service
    /// </summary>
    public class UserSvc : GenericSvc<UserRep, User>
    {
        #region -- Overrides --

        /// <summary>
        /// Create
        /// </summary>
        /// <param name="m">The model</param>
        /// <returns>Return the result</returns>
        public override SingleRsp Create(User m)
        {
            var res = new SingleRsp();

            var m1 = _rep.Read(m.UserName);
            if (m1 != null)
            {
                res.SetError(YCode.EZ102, "Existing data.");
            }
            else
            {
                var t = _hasher.HashPassword(m, m.PasswordHash);
                m.PasswordHash = t;
                var hash = ZHash.ComputeSha(m.PasswordHash + AppSetting.S.JwtSecret);
                m.PasswordSalt = hash;

                res = base.Create(m);
                res.Data = new UserDto(m);
            }

            return res;
        }

        /// <summary>
        /// Create the models
        /// </summary>
        /// <param name="l">List model</param>
        /// <returns>Return the result</returns>
        public override MultipleRsp Create(List<User> l)
        {
            var res = new MultipleRsp();
            var lErr = new List<UserDto>();
            var lOki = new List<User>();

            if (l.Count > ZConst.MaxSize.DataList)
            {
                var t = ZCode.EZ998 + ZConst.String.Space + ZConst.MaxSize.DataList;
                res.SetError(t);
                return res;
            }

            foreach (var i in l)
            {
                var m = _rep.Read(i.UserName);
                if (m != null)
                {
                    lErr.Add(new UserDto(i));
                }
                else
                {
                    var t = _hasher.HashPassword(i, i.PasswordHash);
                    i.PasswordHash = t;
                    var hash = ZHash.ComputeSha(i.PasswordHash + AppSetting.S.JwtSecret);
                    i.PasswordSalt = hash;
                    lOki.Add(i);
                }
            }

            if (lOki.Count > 0)
            {
                res = base.Create(lOki);
                res.SetSuccess(UserDto.ToDto(lOki), string.Empty);
            }

            if (lErr.Count > 0)
            {
                res.SetFailure(lErr, YCode.EZ102);
            }

            return res;
        }

        /// <summary>
        /// Read by
        /// </summary>
        /// <param name="req">Paging request</param>
        /// <returns>Return the result</returns>
        public override SearchRsp Read(PagingReq req)
        {
            var res = new SearchRsp(req);

            try
            {
                // Get data
                var filter = new UserFilter();
                if (req.Filter != null)
                {
                    filter = JsonConvert.DeserializeObject<UserFilter>(req.Filter.ToString());
                }

                var page = req.Page;
                var size = req.Size;
                var offset = (page - 1) * size;

                var query = from p in All
                            where p.Status != (short)YEnum.Status.Inactive
                            select new
                            {
                                p.Id,
                                p.Email,
                                p.UserName,
                                p.FirstName,
                                p.LastName
                            };

                #region -- Filter --
                if (!string.IsNullOrEmpty(filter.Email))
                {
                    query = query.Where(p => p.Email.Contains(filter.Email));
                }

                if (!string.IsNullOrEmpty(filter.UserName))
                {
                    query = query.Where(p => p.UserName.Contains(filter.UserName));
                }

                if (!string.IsNullOrEmpty(filter.FirstName))
                {
                    query = query.Where(p => p.FirstName.Contains(filter.FirstName));
                }

                if (!string.IsNullOrEmpty(filter.LastName))
                {
                    query = query.Where(p => p.LastName.Contains(filter.LastName));
                }
                #endregion

                res.TotalRecords = query.Count();

                if (req.Paging)
                {
                    query = query.OrderByDescending(p => p.Id)
                        .Sort(req.Sort)
                        .Skip(offset)
                        .Take(size);
                }

                res.Data = query.ToList();
            }
            catch (Exception ex)
            {
                res.SetError(ex.StackTrace);
            }

            return res;
        }

        /// <summary>
        /// Read single object
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Return the object</returns>
        public override SingleRsp Read(int id)
        {
            var res = new SingleRsp();

            var m = _rep.Read(id);
            res.Data = new UserDto(m);

            return res;
        }

        /// <summary>
        /// Read single object
        /// </summary>
        /// <param name="code">Secondary key</param>
        /// <returns>Return the object</returns>
        public override SingleRsp Read(string code)
        {
            var res = new SingleRsp();

            var m = _rep.Read(code);
            res.Data = new UserDto(m);

            return res;
        }

        /// <summary>
        /// Update
        /// </summary>
        /// <param name="m">The model</param>
        /// <returns>Return the result</returns>
        public override SingleRsp Update(User m)
        {
            var res = new SingleRsp();

            var m1 = m.Id > 0 ? _rep.Read(m.Id) : _rep.Read(m.UserName);
            if (m1 == null)
            {
                res.SetError(YCode.EZ103, "No data.");
            }
            else
            {
                var ok = m.Differ(m1);
                if (ok)
                {
                    m.Kopy(m1);
                    if (m.PasswordHash != null)
                    {
                        var t = _hasher.HashPassword(m, m.PasswordHash);
                        m.PasswordHash = t;
                        var hash = ZHash.ComputeSha(m.PasswordHash + AppSetting.S.JwtSecret);
                        m.PasswordSalt = hash;
                        m.Status = (short)YEnum.Status.Normal;
                    }
                    res = base.Update(m1);
                    res.Data = new UserDto(m1);
                }
                else
                {
                    res.SetMessage(YCode.EZ104);
                }
            }

            return res;
        }

        /// <summary>
        /// Update the models
        /// </summary>
        /// <param name="l">List model</param>
        /// <returns>Return the result</returns>
        public override MultipleRsp Update(List<User> l)
        {
            var res = new MultipleRsp();
            var lErr = new List<UserDto>();
            var lOki = new List<User>();

            if (l.Count > ZConst.MaxSize.DataList)
            {
                var t = ZCode.EZ998 + ZConst.String.Space + ZConst.MaxSize.DataList;
                res.SetError(t);
                return res;
            }

            foreach (var i in l)
            {
                var m = i.Id > 0 ? _rep.Read(i.Id) : _rep.Read(i.UserName);
                if (m == null)
                {
                    lErr.Add(new UserDto(i));
                }
                else
                {
                    var ok = i.Differ(m);
                    if (ok)
                    {
                        i.Kopy(m);
                        if (i.PasswordHash != null)
                        {
                            var t = _hasher.HashPassword(i, i.PasswordHash);
                            i.PasswordHash = t;
                            var hash = ZHash.ComputeSha(i.PasswordHash + AppSetting.S.JwtSecret);
                            i.PasswordSalt = hash;
                            i.Status = (short)YEnum.Status.Normal;
                        }
                        lOki.Add(m);
                    }
                    else
                    {
                        lErr.Add(new UserDto(i));
                    }
                }
            }

            if (lOki.Count > 0)
            {
                res = base.Update(lOki);
                res.SetSuccess(UserDto.ToDto(lOki), string.Empty);
            }

            if (lErr.Count > 0)
            {
                var t = ZConst.Format.Slash;
                t = string.Format(t, YCode.EZ103, YCode.EZ104);

                res.SetFailure(lErr, t);
            }

            return res;
        }

        /// <summary>
        /// Delete single object
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Return the result</returns>
        public override SingleRsp Delete(int id)
        {
            return Update(id, null, true);
        }

        /// <summary>
        /// Delete single object
        /// </summary>
        /// <param name="id">Secondary key</param>
        /// <returns>Return the result</returns>
        public override SingleRsp Delete(string code)
        {
            return Update(null, code, true);
        }

        /// <summary>
        /// Restore the model
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Return the result</returns>
        public override SingleRsp Restore(int id)
        {
            return Update(id, null, false);
        }

        /// <summary>
        /// Restore the model
        /// </summary>
        /// <param name="id">Secondary key</param>
        /// <returns>Return the result</returns>
        public override SingleRsp Restore(string code)
        {
            return Update(null, code, false);
        }

        #endregion

        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public UserSvc()
        {
            _hasher = new PasswordHasher<User>();
            _passwordHistoryRep = new PasswordHistoryRep();
            _loginHistoryRep = new LoginHistoryRep();
        }

        public SingleRsp UpdateNew(User m)
        {
            var res = new SingleRsp();

            var tran = _rep.Context.Database.BeginTransaction();
            try
            {
                _rep.Context.User.Update(m);
                _rep.Context.SaveChanges();
                tran.Commit();
            }
            catch (Exception ex)
            {
                tran.Rollback();
                res.SetError(ex.Message);
            }

            return res;
        }

        /// <summary>
        /// Sign in
        /// </summary>
        /// <param name="req">Request body</param>
        /// <param name="h">Header data transfer object</param>
        /// <returns>Return the result</returns>
        public SingleRsp SignIn(SignInReq req, HeaderDto h)
        {
            var res = new SingleRsp();

            try
            {
                // Check user ID
                var m = _rep.Read(req.UserName);
                if (m == null)
                {
                    res.SetError(YCode.EZ105, "Invalid user ID");
                    return res;
                }

                // Check lock expired on
                long sec = Subtract(null, m.LockExpired);
                if (sec < 0)
                {
                    var msg = GetMessageLocked(sec);
                    res.SetError(YCode.EZ113, msg);
                    return res;
                }

                // Decrypt
                var password = req.Password.Decrypt(AppSetting.S.RsaPrivateKey);

                // Authentication
                var t1 = _hasher.VerifyHashedPassword(m, m.PasswordHash, password);
                if (t1 != PasswordVerificationResult.Success)
                {
                    if (sec > 0)
                    {
                        m.InvalidAttempts = 0;
                        m.LockExpired = null;
                    }

                    // Check wrong password and lock account
                    var attempts = m.InvalidAttempts == null ? 1 : ++m.InvalidAttempts;
                    var threshold = AppSetting.S.LockoutThreshold;
                    if (attempts > threshold)
                    {
                        var duration = AppSetting.S.LockoutDuration;
                        m.LockExpired = AddMinute(null, duration);

                        sec = duration * 60;
                        var msg = GetMessageLocked(sec);
                        res.SetError(YCode.EZ113, msg);
                    }
                    else
                    {
                        m.InvalidAttempts = attempts;
                        var msg = string.Format("Invalid password {0} time(s)", attempts.Value);
                        res.SetError(YCode.EZ107, msg);
                    }
                    _rep.Update(m);

                    return res;
                }

                // Authentication again
                var hash = ZHash.ComputeSha(m.PasswordHash + AppSetting.S.JwtSecret);
                if (m.PasswordSalt != hash)
                {
                    res.SetError(YCode.EZ106, "Invalid password salt");
                    return res;
                }

                // Check password expired
                //var expired = IsPasswordExpired(m.LastPasswordChanged);
                //if (expired)
                //{
                //    // Generate password reminder token & time
                //    m.ReminderToken = Guid.NewGuid().ToString("N");
                //    m.ReminderExpired = DateTime.Now.AddMinutes(AppSetting.S.ReminderExpired);
                //    _rep.Update(m);

                //    res.Data = m.ReminderToken;
                //    res.SetError(YCode.EZ101, "Password is expired");
                //    return res;
                //}

                // Create JWT
                res = CreateJwt(m, h);
            }
            catch (Exception ex)
            {
                res.SetError(ex.Message);
            }

            return res;
        }

        public User ReadByEmail(string email)
        {
            var m = All.Where(m => m.Email == email && m.Status != 0).FirstOrDefault();
            return m;
        }

        public User ReadByReminderToken(string reminderToken)
        {
            var m = All.Where(m => m.ReminderToken == reminderToken && m.Status != 0 && m.ReminderExpired > DateTime.Now).FirstOrDefault();
            return m;
        }

        /// <summary>
        /// Verify email
        /// </summary>
        /// <param name="id">User name</param>
        /// <param name="i">Email information</param>
        /// <param name="b1">Body 1</param>
        /// <param name="b2">Body 2</param>
        /// <param name="b3">Body 3</param>
        /// <returns>Return the result</returns>
        public SingleRsp VerifyEmail(string id, ZEmail.Info i, string b1, string b2, string b3)
        {
            var res = new SingleRsp();

            var m = _rep.Read(id);
            if (m == null)
            {
                res.SetError(YCode.EZ105, "Invalid user ID");
                return res;
            }

            // Generate password reminder token
            m.ReminderToken = Guid.NewGuid().ToString("N");
            m.ReminderExpired = DateTime.Now.AddMinutes(AppSetting.S.ReminderExpired);
            _rep.Update(m);

            if (AppSetting.S.Dev)
            {
                res.Data = m.ReminderToken;
            }

            // Send email
            i.To = m.Email;
            try
            {
                b1 = string.Format(b1, m.FirstName.ToFullName(m.LastName));
                b2 = string.Format(b2, m.UserName);
                b3 = string.Format(b3, AppSetting.S.Host, m.ReminderToken);
                SendVerifyEmail(i, b1, b2, b3);
            }
            catch (Exception ex)
            {
                res.SetError(ex.Message);
            }

            return res;
        }

        /// <summary>
        /// Forgot password
        /// </summary>
        /// <param name="req">Request</param>
        /// <param name="h">Header</param>
        /// <returns>Return the result</returns>
        public MultipleRsp ForgotPassword(SignInReq req, HeaderDto h)
        {
            var res = new MultipleRsp();

            var m = All.FirstOrDefault(p => p.ReminderToken == req.UserName);
            if (m == null)
            {
                res.SetError(YCode.EZ103, "No data.");
            }
            else
            {
                if (m.ReminderExpired < DateTime.Now)
                {
                    res.SetError(YCode.EZ110, "Password reminder token is expired.");
                }
                else
                {
                    m.PasswordHash = _hasher.HashPassword(m, req.Password);
                    var hash = ZHash.ComputeSha(m.PasswordHash + AppSetting.S.JwtSecret);
                    m.PasswordSalt = hash;
                    m.ReminderToken = null;
                    m.ReminderExpired = null;

                    var rsp = base.Update(m);
                    if (rsp.Success)
                    {
                        /*var t = CreateJwt(m, req.Password, h);
                        if (t == null)
                        {
                            res.SetError(YCode.EZ105, "Invalid user ID.");
                        }
                        else
                        {
                            res.SetData("jwt", t.Item1);
                            res.SetData("mnu", t.Item2);
                        }*/
                    }
                    else
                    {
                        res.SetError("Cannot update password.");
                    }
                }
            }

            return res;
        }

        /// <summary>
        /// Reset password
        /// </summary>
        /// <param name="req">Request body</param>
        /// <param name="h">Header data transfer object</param>
        /// <returns>Return the result</returns>
        public SingleRsp ResetPassword(PasswordReq req, HeaderDto h)
        {
            var res = new SingleRsp();

            try
            {
                // Valid password reminder token
                var token = req.ReminderToken;
                if (token.Length < 1)
                {
                    res.SetError(YCode.EZ108, "Invalid password reminder token.");
                    return res;
                }

                // Check token
                var o = _rep.Read(token);
                if (o == null)
                {
                    res.SetError(YCode.EZ103, "Not found password reminder token.");
                    return res;
                }

                // Change password
                res = ChangePassword(o.Id, req, h, false);
            }
            catch (Exception ex)
            {
                res.SetError(ex.Message);
            }

            return res;
        }

        /// <summary>
        /// Update password
        /// </summary>
        /// <param name="id">ID</param>
        /// <param name="req">Request body</param>
        /// <param name="h">Header data transfer object</param>
        /// <returns>Return the result</returns>
        public SingleRsp UpdatePassword(int? id, PasswordReq req, HeaderDto h)
        {
            SingleRsp res = new SingleRsp();

            try
            {
                res = ChangePassword(id.Value, req, h, true);
            }
            catch (Exception ex)
            {
                res.SetError(ex.Message);
            }

            return res;
        }

        /// <summary>
        /// Update info
        /// </summary>
        /// <param name="id">User ID</param>
        /// <param name="pathAvatar">Path avatar</param>
        /// <returns>Return the result</returns>
        public SingleRsp UpdateInfo(UserReq req)
        {
            SingleRsp res = new SingleRsp();

            User m = req.Id > 0 ? _rep.Read(req.Id) : null;

            if (m == null)
            {
                res.SetError("Tài khoản không tồn tại!");
                return res;
            }

            if (req.UrlAvatar != null && req.UrlAvatar != m.Avatar)
            {
                m.Avatar = req.UrlAvatar;
            }
            if (req.Address != m.Address)
            {
                m.Address = req.Address;
            }
            if (req.Phone != m.Phone)
            {
                m.Phone = req.Phone;
            }
            if (req.Email != m.Email)
            {
                User emailExist = _rep.Read(req.Email);
                if (emailExist != null)
                {
                    res.SetError("Email này đã tồn tại!");
                    return res;
                }

                m.Email = req.Email;
            }

            var tran = _rep.Context.Database.BeginTransaction();
            try
            {
                _rep.Context.User.Update(m);
                _rep.Context.SaveChanges();
                tran.Commit();
            }
            catch (Exception ex)
            {
                tran.Rollback();
                res.SetError(ex.Message);
            }

            return res;
        }

        /// <summary>
        /// Change password
        /// </summary>
        /// <param name="id">User ID</param>
        /// <param name="pathAvatar">Path avatar</param>
        /// <returns>Return the result</returns>
        public SingleRsp ChangePassword(int id, string oldPassword, string newPassword, bool check)
        {
            SingleRsp res = new SingleRsp();

            var m = _rep.Read(id);
            if (m == null)
            {
                res.SetError(YCode.EZ105, "Invalid user ID.");
                return res;
            }

            // Check old password
            if (check)
            {
                oldPassword = oldPassword.Decrypt(AppSetting.S.RsaPrivateKey);

                var t1 = _hasher.VerifyHashedPassword(m, m.PasswordHash, oldPassword);
                if (t1 != PasswordVerificationResult.Success)
                {
                    res.SetError(YCode.EZ109, "Old password is incorrect.");
                    return res;
                }
            }

            // Save password
            newPassword = newPassword.Decrypt(AppSetting.S.RsaPrivateKey);

            var t = _hasher.HashPassword(m, newPassword);
            m.PasswordHash = t;
            var hash = ZHash.ComputeSha(m.PasswordHash + AppSetting.S.JwtSecret);
            m.PasswordSalt = hash;

            var now = DateTime.Now;
            m.ReminderExpired = null;
            m.ReminderToken = null;
            m.LastPasswordChanged = now;
            m.InvalidAttempts = 0;
            m.LockExpired = null;
            _rep.Update(m);

            // Save password history
            PasswordHistory ph = new PasswordHistory
            {
                UserId = m.Id,
                PasswordHash = m.PasswordHash,
                PasswordSalt = m.PasswordSalt,
                CreatedOn = now
            };
            _passwordHistoryRep.Create(ph);

            return res;
        }

        /// <summary>
        /// Update avatar
        /// </summary>
        /// <param name="id">User ID</param>
        /// <param name="pathAvatar">Path avatar</param>
        /// <returns>Return the result</returns>
        public SingleRsp UpdateAvatar(int userId, string pathAvatar)
        {
            SingleRsp res = new SingleRsp();

            User user = _rep.Read(userId);
            user.Avatar = pathAvatar;

            var tran = _rep.Context.Database.BeginTransaction();
            try
            {
                _rep.Context.User.Update(user);
                _rep.Context.SaveChanges();
                tran.Commit();
            }
            catch (Exception ex)
            {
                tran.Rollback();
                res.SetError(ex.Message);
            }

            return res;
        }

        /// <summary>
        /// Change password
        /// </summary>
        /// <param name="id">ID</param>
        /// <param name="req">Request body</param>
        /// <param name="h">Header data transfer object</param>
        /// <param name="check">Check old password</param>
        /// <returns>Return the result</returns>
        private SingleRsp ChangePassword(int id, PasswordReq req, HeaderDto h, bool check)
        {
            SingleRsp res = new SingleRsp();

            // Check ID
            var m = _rep.Read(id);
            if (m == null)
            {
                res.SetError(YCode.EZ105, "Invalid user ID.");
                return res;
            }

            // Check old password
            if (check)
            {
                var oldPassword = req.OldPassword.Decrypt(AppSetting.S.RsaPrivateKey);

                var t1 = _hasher.VerifyHashedPassword(m, m.PasswordHash, oldPassword);
                if (t1 != PasswordVerificationResult.Success)
                {
                    res.SetError(YCode.EZ109, "Old password is incorrect.");
                    return res;
                }
            }

            // Check previous password
            var userId = m.UserName;
            var lim = AppSetting.S.PasswordHistory;
            var newPassword = req.NewPassword;
            var l = _passwordHistoryRep.All.Where(p => p.UserId == m.Id).OrderByDescending(p => p.CreatedOn).Take(lim).ToList();
            foreach (var i in l)
            {
                var t1 = _hasher.VerifyHashedPassword(m, m.PasswordHash, i.PasswordHash);
                if (t1 != PasswordVerificationResult.Success)
                {
                    res.SetError(YCode.EZ112, "New password was used previously.");
                    return res;
                }
            }

            // Save password
            newPassword = newPassword.Decrypt(AppSetting.S.RsaPrivateKey);

            var t = _hasher.HashPassword(m, newPassword);
            m.PasswordHash = t;
            var hash = ZHash.ComputeSha(m.PasswordHash + AppSetting.S.JwtSecret);
            m.PasswordSalt = hash;

            var now = DateTime.Now;
            m.ReminderExpired = null;
            m.ReminderToken = null;
            m.LastPasswordChanged = now;
            m.InvalidAttempts = 0;
            m.LockExpired = null;
            _rep.Update(m);

            // Save password history
            PasswordHistory ph = new PasswordHistory
            {
                UserId = m.Id,
                PasswordHash = m.PasswordHash,
                PasswordSalt = m.PasswordSalt,
                CreatedOn = now
            };
            _passwordHistoryRep.Create(ph);

            // Check to create JWT
            if (req.WithJwt)
            {
                res = CreateJwt(m, h);
            }

            return res;
        }

        /// <summary>
        /// Create JSON web token
        /// </summary>
        /// <param name="m">User</param>
        /// <param name="h">Header data transfer object</param>
        /// <returns>Return the result</returns>
        private SingleRsp CreateJwt(User m, HeaderDto h)
        {
            var res = new SingleRsp();

            var uuid = Guid.NewGuid();
            var now = DateTime.Now;

            // Set logout old session
            var singleSession = AppSetting.S.SingleSession;
            if (singleSession)
            {
                _loginHistoryRep.UpdateSignOutOn(m.UserName, true);
            }

            // Login history
            var lh = new LoginHistory
            {
                UserName = m.UserName,
                Uuid = uuid,
                SignInOn = now,
                LastAccessedOn = now,
                Host = h.Host,
                UserAgent = h.UserAgent
            };
            _loginHistoryRep.Create(lh);

            // Update last login
            m.LastSignIn = now;
            m.InvalidAttempts = 0;
            m.LockExpired = null;
            _rep.Update(m);

            // Get setting language
            var language = string.Empty;
            var m1 = _rep.Context.Setting
                .FirstOrDefault(p => p.UserId == m.Id
                    && p.Code == YConst.Setting.Language);
            if (m1 != null)
            {
                language = m1.Value;
            }
            if (string.IsNullOrEmpty(language))
            {
                language = YConst.Default.Language;
            }

            // Role & rights
            var role = (from p in _rep.Context.UserRole
                        join q in _rep.Context.Role
                          on p.RoleId equals q.Id
                        where p.UserId == m.Id
                        select q.Description).FirstOrDefault();
            var rights = getRights(m.Id);
            var urls = getUrls(m.Id);

            // Payload
            var user = new PayloadDto
            {
                Id = m.Id,
                Uuid = uuid,
                UserName = m.UserName,
                FirstName = m.FirstName,
                LastName = m.LastName,
                FullName = m.LastName + " " + m.FirstName,
                Avatar = m.Avatar,
                Language = language,
                Role = role,
                Rights = rights,
                Urls = urls
            };

            // Create JWT
            var secret = AppSetting.S.JwtSecret;
            var expires = AppSetting.S.JwtExpires;
            var z1 = new ZToken(secret, user, expires);
            res.SetData(YCode.SZ101, z1.Jwt);

            return res;
        }

        private List<String> getRights(int uid)
        {
            var role = (from p in _rep.Context.UserRole
                        join q in _rep.Context.Role
                          on p.RoleId equals q.Id
                        where p.UserId == uid
                        select q.Description).FirstOrDefault();
            if (role != "Student")
            {
                var rights = (from p in _rep.Context.UserRole
                              join q in _rep.Context.FunctionRole
                                on p.RoleId equals q.RoleId
                              join r in _rep.Context.Function
                                on q.FunctionId equals r.Id
                              where p.UserId == uid
                              orderby r.Id
                              select r.Code).ToList();
                return rights;
            }
            else
            {
                List<String> lst = new List<string>();
                int n1 = _rep.Context.ClassStudent
                    .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new
                    {
                        a.ClassId,
                        a.StudentId,
                        b.StudentType,
                        b.UserId
                    }).Where(x => x.UserId == uid).Count();

                if (n1 > 0) // This student has class.
                {
                    var r1 = _rep.Context.UserRole
                    .Join(_rep.Context.FunctionRole, a => a.RoleId, b => b.RoleId, (a, b) => new
                    {
                        a.RoleId,
                        a.UserId,
                        b.FunctionId
                    })
                    .Join(_rep.Context.Function, a => a.FunctionId, b => b.Id, (a, b) => new
                    {
                        a.RoleId,
                        a.UserId,
                        a.FunctionId,
                        b.Code
                    }).Where(x => x.UserId == uid && x.Code.Contains("S"))
                    .Select(s => s.Code).ToList();
                    if(r1!=null)
                        lst.AddRange(r1);
                }

                int n2 = _rep.Context.ThesisStudent
                    .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new
                    {
                        a.ThesisId,
                        a.StudentId,
                        b.StudentType,
                        b.UserId
                    }).Where(x => x.UserId == uid).Count();

                if (n2 > 0) // This student has thesis.
                {
                    var r2 = _rep.Context.UserRole
                    .Join(_rep.Context.FunctionRole, a => a.RoleId, b => b.RoleId, (a, b) => new
                    {
                        a.RoleId,
                        a.UserId,
                        b.FunctionId
                    })
                    .Join(_rep.Context.Function, a => a.FunctionId, b => b.Id, (a, b) => new
                    {
                        a.RoleId,
                        a.UserId,
                        a.FunctionId,
                        b.Code
                    }).Where(x => x.UserId == uid && x.Code.Contains("G"))
                    .Select(s => s.Code).ToList();
                    if (r2 != null)
                        lst.AddRange(r2);
                    lst.Add("S0"); // transfer
                }

                var r3 = _rep.Context.UserRole
                    .Join(_rep.Context.FunctionRole, a => a.RoleId, b => b.RoleId, (a, b) => new
                    {
                        a.RoleId,
                        a.UserId,
                        b.FunctionId
                    })
                    .Join(_rep.Context.Function, a => a.FunctionId, b => b.Id, (a, b) => new
                    {
                        a.RoleId,
                        a.UserId,
                        a.FunctionId,
                        b.Code
                    }).Where(x => x.UserId == uid && x.Code.Contains("C"))
                    .Select(s => s.Code).ToList();
                if (r3 != null)
                    lst.AddRange(r3);

                return lst;
            }
        }

        private List<String> getUrls(int uid)
        {
            var role = (from p in _rep.Context.UserRole
                        join q in _rep.Context.Role
                          on p.RoleId equals q.Id
                        where p.UserId == uid
                        select q.Description).FirstOrDefault();
            if (role != "Student")
            {
                var urls = (from p in _rep.Context.UserRole
                              join q in _rep.Context.FunctionRole
                                on p.RoleId equals q.RoleId
                              join r in _rep.Context.Function
                                on q.FunctionId equals r.Id
                              where p.UserId == uid && r.Url != null
                              orderby r.Id
                              select r.Url).ToList();
                return urls;
            }
            else
            {
                List<String> lst = new List<string>();
                int n1 = _rep.Context.ClassStudent
                    .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new
                    {
                        a.ClassId,
                        a.StudentId,
                        b.StudentType,
                        b.UserId
                    }).Where(x => x.UserId == uid).Count();

                if (n1 > 0) // This student has class.
                {
                    var r1 = _rep.Context.UserRole
                    .Join(_rep.Context.FunctionRole, a => a.RoleId, b => b.RoleId, (a, b) => new
                    {
                        a.RoleId,
                        a.UserId,
                        b.FunctionId
                    })
                    .Join(_rep.Context.Function, a => a.FunctionId, b => b.Id, (a, b) => new
                    {
                        a.RoleId,
                        a.UserId,
                        a.FunctionId,
                        b.Code,
                        b.Url
                    }).Where(x => x.UserId == uid && x.Code.Contains("S") && x.Url != null)
                    .Select(s => s.Url).ToList();
                    if (r1 != null)
                        lst.AddRange(r1);
                }

                int n2 = _rep.Context.ThesisStudent
                    .Join(_rep.Context.Student, a => a.StudentId, b => b.Id, (a, b) => new
                    {
                        a.ThesisId,
                        a.StudentId,
                        b.StudentType,
                        b.UserId
                    }).Where(x => x.UserId == uid).Count();

                if (n2 > 0) // This student has thesis.
                {
                    var r2 = _rep.Context.UserRole
                    .Join(_rep.Context.FunctionRole, a => a.RoleId, b => b.RoleId, (a, b) => new
                    {
                        a.RoleId,
                        a.UserId,
                        b.FunctionId
                    })
                    .Join(_rep.Context.Function, a => a.FunctionId, b => b.Id, (a, b) => new
                    {
                        a.RoleId,
                        a.UserId,
                        a.FunctionId,
                        b.Code,
                        b.Url
                    }).Where(x => x.UserId == uid && x.Code.Contains("G") && x.Url != null)
                    .Select(s => s.Url).ToList();
                    if (r2 != null)
                        lst.AddRange(r2);
                    lst.Add("transfer"); // S0
                }                
                var r3 = _rep.Context.UserRole
                    .Join(_rep.Context.FunctionRole, a => a.RoleId, b => b.RoleId, (a, b) => new
                    {
                        a.RoleId,
                        a.UserId,
                        b.FunctionId
                    })
                    .Join(_rep.Context.Function, a => a.FunctionId, b => b.Id, (a, b) => new
                    {
                        a.RoleId,
                        a.UserId,
                        a.FunctionId,
                        b.Code,
                        b.Url
                    }).Where(x => x.UserId == uid && x.Code.Contains("C") && x.Url != null)
                    .Select(s => s.Url).ToList();
                if (r3 != null)
                    lst.AddRange(r3);
                return lst;
            }
        }

        /// <summary>
        /// Get menu
        /// </summary>
        /// <param name="id">User ID</param>
        /// <returns>Return the result</returns>
        private List<RightDto> GetMenu(int id)
        {
            var t = (from p in _rep.Context.UserRole
                     join q in _rep.Context.FunctionRole
                        on p.RoleId equals q.RoleId
                     join r in _rep.Context.Function
                        on q.FunctionId equals r.Id
                     where p.UserId == id &&
                        p.Status == (short)YEnum.Status.Normal &&
                        p.Status == (short)YEnum.Status.Normal &&
                        r.Status == (short)YEnum.Status.Normal
                     select new RightDto
                     {
                         Id = r.Id,
                         ParentId = r.ParentId,
                         Code = r.Code,
                         Description = r.Description,
                         Sequence = r.Sequence
                     }).ToList();

            var res = t.Where(p => p.ParentId == null).ToList();
            var children = t.Where(p => p.ParentId != null).ToList();

            foreach (var i in res)
            {
                i.Children = children
                    .Where(p => p.ParentId == i.Id)
                    .OrderBy(p => p.Sequence).ToList();
            }

            return res;
        }

        /// <summary>
        /// Send verify email
        /// </summary>
        /// <param name="i">Email information</param>
        /// <param name="b1">Body 1</param>
        /// <param name="b2">Body 2</param>
        /// <param name="b3">Body 3</param>
        private void SendVerifyEmail(ZEmail.Info i, string b1, string b2, string b3)
        {
            var ho = AppSetting.S.EmailHost;
            var po = AppSetting.S.EmailPort;
            var fr = AppSetting.S.EmailUser;
            var pa = AppSetting.S.EmailPassword;
            var pr = AppSetting.S.RsaPrivateKey;
            var z = new ZEmail(ho, po, fr, pa, pr);

            var htm = (z.Folder + "index.html").ReadAllText();

            var i1 = new LinkedResource(z.Folder + "images/app.png")
            {
                ContentId = Guid.NewGuid().ToString()
            };
            htm = htm.Replace("cid:0", "cid:" + i1.ContentId + "\"");

            var i2 = new LinkedResource(z.Folder + "images/cws.png")
            {
                ContentId = Guid.NewGuid().ToString()
            };
            htm = htm.Replace("cid:1", "cid:" + i2.ContentId + "\"");

            htm = htm.Replace("Z-SUBJECT", i.Subject);
            htm = htm.Replace("Z-BODY1", b1);
            htm = htm.Replace("Z-BODY2", b2);
            htm = htm.Replace("Z-BODY3", b3);

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

            z.SendEmail(msg);
        }

        /// <summary>
        /// Update
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <param name="code">Secondary key</param>
        /// <param name="isDeleted">Is deleted</param>
        /// <returns>Return the result</returns>
        private SingleRsp Update(int? id, string code, bool isDeleted)
        {
            var res = new SingleRsp();

            var m = id == null ? _rep.Read(code) : _rep.Read(id.Value);
            if (m == null)
            {
                res.SetError(YCode.EZ103, "No data.");
            }
            else
            {
                var status = isDeleted ? YEnum.Status.Deleted : YEnum.Status.Normal;
                m.Status = (short)status;
                res = base.Update(m);
            }

            return res;
        }

        /// <summary>
        /// Is password expired
        /// </summary>
        /// <param name="d">Last password changed</param>
        /// <returns>Return the result</returns>
        private bool IsPasswordExpired(DateTime? d)
        {
            var expired = AppSetting.S.PasswordExpired;
            if (expired == 0)
            {
                return false;
            }

            var days = expired;

            if (d != null)
            {
                var now = DateTime.Now;
                var t1 = (now - d).Value.TotalDays;
                days = (int)Math.Abs(t1);
            }

            return days >= expired;
        }

        /// <summary>
        /// Get message locked
        /// </summary>
        /// <param name="t">Time to lock (second)</param>
        /// <returns>Return the result</returns>
        private String GetMessageLocked(long t)
        {
            var res = "Your account has been locked for {0:D2}:{1:D2}";

            t = Math.Abs(t);
            long min = t / 60;
            long se = t - min * 60;
            res = string.Format(res, min, se);

            return res;
        }

        /// <summary>
        /// Date 1 subtract date 2
        /// </summary>
        /// <param name="d1">Date 1 (d1 is null from now)</param>
        /// <param name="d2">Date 2</param>
        /// <returns>Return the result (second)</returns>
        public static long Subtract(DateTime? d1, DateTime? d2)
        {
            long res = 0;

            if (d1 == null)
            {
                d1 = DateTime.Now;
            }
            if (d2 != null)
            {
                var t = d1 - d2;
                res = (long)t.Value.TotalSeconds;
            }

            return res;
        }

        /// <summary>
        /// Add minute
        /// </summary>
        /// <param name="d">Date (d is null from now)</param>
        /// <param name="amount">Amount</param>
        /// <returns>Return the result</returns>
        public static DateTime? AddMinute(DateTime? d, int amount)
        {
            var cal = DateTime.Now;

            if (d != null)
            {
                cal = d.Value;
            }

            var res = cal.AddMinutes(amount);

            return res;
        }

        #endregion

        #region -- Fields --

        /// <summary>
        /// Hasher
        /// </summary>
        private readonly PasswordHasher<User> _hasher;

        /// <summary>
        /// Password history repository
        /// </summary>
        private PasswordHistoryRep _passwordHistoryRep;

        /// <summary>
        /// Login history repository
        /// </summary>
        private LoginHistoryRep _loginHistoryRep;

        #endregion
    }
}