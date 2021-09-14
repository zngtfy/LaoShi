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

using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using SKG;

namespace YEX.Web
{
    /// <summary>
    /// Program
    /// </summary>
    public class Program
    {
        #region -- Methods --

        /// <summary>
        /// Main
        /// </summary>
        /// <param name="args">Argument</param>
        public static void Main(string[] args)
        {
            YVariable.Prefix = "L_";

            _port = ZSms.DetectPort();
            _host = YVariable.Host;

            CreateWebHostBuilder(args).Build().Run();
        }

        /// <summary>
        /// Create web host builder
        /// </summary>
        /// <param name="args">Argument</param>
        /// <returns>Return the result</returns>
        public static IWebHostBuilder CreateWebHostBuilder(string[] args)
            => WebHost.CreateDefaultBuilder(args).UseStartup<Startup>().UseUrls(_host);

        #endregion

        #region -- Fields --

        /// <summary>
        /// Port
        /// </summary>
        public static string _port;

        /// <summary>
        /// Host
        /// </summary>
        public static string _host;

        #endregion
    }
}