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
using Newtonsoft.Json;
using SKG;
using System.Linq;
using System.Security.Claims;

namespace YEX.Web.Controllers
{
    using DAL.Dto;

    /// <summary>
    /// Base controller
    /// </summary>
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    [ApiExplorerSettings(GroupName = "v1")]
    public class BaseController : ControllerBase
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public BaseController() { }

        #endregion

        #region -- Properties --

        /// <summary>
        /// Current user ID login
        /// </summary>
        protected int UserId
        {
            get
            {
                return Payload.Id;
            }
        }

        /// <summary>
        /// Current user name login
        /// </summary>
        protected string UserName
        {
            get
            {
                return Payload.FullName;
            }
        }

        /// <summary>
        /// Payload
        /// </summary>
        protected PayloadDto Payload
        {
            get
            {
                if (_payload == null)
                {
                    var t1 = (ClaimsIdentity)HttpContext.User.Identity;
                    var t2 = t1.Claims.Where(p => p.Type == ZConst.Payload).FirstOrDefault();
                    _payload = JsonConvert.DeserializeObject<PayloadDto>(t2.Value);

                }

                return _payload;
            }
        }

        #endregion

        #region -- Fields --

        /// <summary>
        /// Payload
        /// </summary>
        private PayloadDto _payload;

        #endregion
    }
}