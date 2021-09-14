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
using SKG.Req;
using SKG.Rsp;
using System.Collections.Generic;
using System.Linq;

namespace YEX.Web.Controllers
{
    using BLL;
    using DAL.Models;

    /// <summary>
    /// Setup controller
    /// </summary>
    [AllowAnonymous]
    public class SetupController : BaseController
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="s1">User service</param>
        /// <param name="s2">Role service</param>
        /// <param name="s3">UserRole service</param>
        /// <param name="s4">Function service</param>
        /// <param name="s5">FunctionRole service</param>
        public SetupController(UserSvc s1, RoleSvc s2, UserRoleSvc s3, FunctionSvc s4, FunctionRoleSvc s5, SettingSvc s6)
        {
            _userSvc = s1;
            _roleSvc = s2;
            _userRoleSvc = s3;
            _functionSvc = s4;
            _functionRoleSvc = s5;
            _settingSvc = s6;
        }

        /// <summary>
        /// Create data
        /// </summary>
        /// <returns>Return the result</returns>
        [HttpGet]
        public IActionResult Get()
        {
            var res = new BaseRsp(YCode.SZ999);

            var t = _userSvc.All.Any(p => true);
            if (t)
            {
                res.SetError(YCode.EZ999);
                return Ok(res);
            }

            #region -- User --
            var lUser = new List<User>();

            var userAdmin = new User
            {
                UserName = "admin",
                FirstName = "Zng",
                LastName = "Tfy",
                Email = "nvt87x@gmail.com",
                PasswordHash = "Qq12345!",
                Status = (short)YEnum.Status.Normal,
                CreatedBy = AppSetting.S.AdminId
            };
            lUser.Add(userAdmin);

            var toan = new User
            {
                UserName = "toan.nguyen@tanvieta.co",
                FirstName = "Toan",
                LastName = "Nguyen",
                Email = "toan.nguyen@tanvieta.co",
                PasswordHash = "Qq12345!",
                Status = (short)YEnum.Status.Normal,
                CreatedBy = AppSetting.S.AdminId
            };
            lUser.Add(toan);

            var userGuest = new User
            {
                UserName = "guest",
                FirstName = "Toan",
                LastName = "Nguyen",
                Email = "toan.nguyen@tanvieta.co",
                PasswordHash = "Qq12345!",
                Status = (short)YEnum.Status.Normal,
                CreatedBy = AppSetting.S.AdminId
            };
            lUser.Add(userGuest);

            _userSvc.Create(lUser);
            #endregion

            #region -- Role --
            var lRole = new List<Role>();
            var roleAdministrator = new Role
            {
                Description = "Administrator",
                Status = (short)YEnum.Status.Normal,
                CreatedBy = AppSetting.S.AdminId
            };
            lRole.Add(roleAdministrator);

            var roleStandard = new Role
            {
                Description = "Standard",
                Status = (short)YEnum.Status.Normal,
                CreatedBy = AppSetting.S.AdminId
            };
            lRole.Add(roleStandard);

            _roleSvc.Create(lRole);
            #endregion

            #region -- UserRole --
            var lUserRole = new List<UserRole>();
            var mUserRole = new UserRole
            {
                UserId = userAdmin.Id,
                RoleId = roleAdministrator.Id,
                Status = (short)YEnum.Status.Normal,
                CreatedBy = AppSetting.S.AdminId
            };
            lUserRole.Add(mUserRole);

            mUserRole = new UserRole
            {
                UserId = userGuest.Id,
                RoleId = roleStandard.Id,
                Status = (short)YEnum.Status.Normal,
                CreatedBy = AppSetting.S.AdminId
            };
            lUserRole.Add(mUserRole);

            _userRoleSvc.Create(lUserRole);
            #endregion

            #region -- Function --
            var lFunction = new List<Function>();
            var functionHome = new Function
            {
                Code = "Home",
                Description = "Home",
                Status = (short)YEnum.Status.Normal,
                CreatedBy = AppSetting.S.AdminId
            };
            lFunction.Add(functionHome);
            _functionSvc.Create(functionHome);

            var functionDashboard = new Function
            {
                Code = "Dashboard",
                Description = "Dashboard",
                Status = (short)YEnum.Status.Normal,
                CreatedBy = AppSetting.S.AdminId
            };
            lFunction.Add(functionDashboard);

            var functionMyProfile = new Function
            {
                Code = "MyProfile",
                Description = "My Profile",
                Status = (short)YEnum.Status.Normal,
                CreatedBy = AppSetting.S.AdminId
            };
            lFunction.Add(functionMyProfile);

            _functionSvc.Create(lFunction);
            #endregion

            #region -- FunctionRole --
            var lFunctionRole = new List<FunctionRole>();
            var mFunctionRole = new FunctionRole
            {
                FunctionId = functionHome.Id,
                RoleId = roleAdministrator.Id,
                Status = (short)YEnum.Status.Normal,
                CreatedBy = AppSetting.S.AdminId
            };
            lFunctionRole.Add(mFunctionRole);

            mFunctionRole = new FunctionRole
            {
                FunctionId = functionDashboard.Id,
                RoleId = roleAdministrator.Id,
                Status = (short)YEnum.Status.Normal,
                CreatedBy = AppSetting.S.AdminId
            };
            lFunctionRole.Add(mFunctionRole);

            mFunctionRole = new FunctionRole
            {
                FunctionId = functionMyProfile.Id,
                RoleId = roleAdministrator.Id,
                Status = (short)YEnum.Status.Normal,
                CreatedBy = AppSetting.S.AdminId
            };
            lFunctionRole.Add(mFunctionRole);

            _functionRoleSvc.Create(lFunctionRole);
            #endregion

            #region -- Setting --
            var lSetting = new List<Setting>();
            var mSetting = new Setting
            {
                UserId = userAdmin.Id,
                Code = "LANG",
                DataType = "string",
                Value = "vi-vn",
                Description = "System language",
                Status = (short)YEnum.Status.Normal,
                CreatedBy = AppSetting.S.AdminId
            };
            lSetting.Add(mSetting);

            _settingSvc.Create(lSetting);
            #endregion

            return Ok(res);
        }

        /// <summary>
        /// To ZnG language
        /// </summary>
        /// <param name="req">Request</param>
        /// <returns>Return the result</returns>
        [HttpPost("zng")]
        public IActionResult ToZng([FromBody]SimpleReq req)
        {
            var res = new SingleRsp
            {
                Data = req.Keyword.ToZng()
            };

            return Ok(res);
        }

        #endregion

        #region -- Fields --

        /// <summary>
        /// Repository to handle the database
        /// </summary>
        private readonly UserSvc _userSvc;

        /// <summary>
        /// Repository to handle the database
        /// </summary>
        private readonly RoleSvc _roleSvc;

        /// <summary>
        /// Repository to handle the database
        /// </summary>
        private readonly UserRoleSvc _userRoleSvc;

        /// <summary>
        /// Repository to handle the database
        /// </summary>
        private readonly FunctionSvc _functionSvc;

        /// <summary>
        /// Repository to handle the database
        /// </summary>
        private readonly FunctionRoleSvc _functionRoleSvc;

        /// <summary>
        /// Repository to handle the database
        /// </summary>
        private readonly SettingSvc _settingSvc;

        #endregion
    }
}