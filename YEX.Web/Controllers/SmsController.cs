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

using Microsoft.AspNetCore.Mvc;
using SKG;
using System;
using System.IO.Ports;

namespace YEX.Web.Controllers
{
    using BLL.Req;

    /// <summary>
    /// SMS controller
    /// </summary>
    public class SmsController : BaseController
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public SmsController()
        {
            _port = new SerialPort();
            _sms = new ZSms();
        }

        /// <summary>
        /// Post
        /// </summary>
        /// <param name="req">request</param>
        /// <returns>Return the result</returns>
        [HttpPost]
        public string Post([FromBody]SmsReq req)
        {
            var res = "OK";

            try
            {
                var user = "9C8F616E0317998A10F3518D6272EA31B3CB9FECAA4C9FAF1A2FEDB6B6C2AA9E";
                var pass = "E3B51E3A5B0035DDEA2D063728B4C79E39E9F259138CB42481AFA41084DB9F0B";
                if (req.User == user && req.Password == pass)
                {
                    _port = _sms.OpenPort(Program._port);
                    _sms.SendSMS(_port, req.Phone, req.Message);
                    _port.Close();
                }
                else
                {
                    res = "Wrong user pass";
                }
            }
            catch (Exception ex)
            {
                res = ex.Message;
            }

            return res;
        }

        #endregion

        #region -- Fields --

        /// <summary>
        /// Port
        /// </summary>
        private SerialPort _port;

        /// <summary>
        /// SMS
        /// </summary>
        private readonly ZSms _sms;

        #endregion
    }
}