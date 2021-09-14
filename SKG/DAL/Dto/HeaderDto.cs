#region Information
/*
 * Author       : ZngTfy
 * Email        : toan.nguyen@tanvieta.co
 * Phone        : +84 345 515 010
 * ------------------------------- *
 * Create       : 2020-Jan-09 08:41
 * Update       : 2020-Jan-09 08:41
 * Checklist    : 1.0
 * Status       : Done
 */
#endregion

using Microsoft.AspNetCore.Http;

namespace SKG.DAL.Dto
{
    /// <summary>
    /// Header data transfer object
    /// </summary>
    public sealed class HeaderDto
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public HeaderDto()
        {
            Host = string.Empty;
            UserAgent = string.Empty;
        }

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="h">Request header</param>
        public HeaderDto(IHeaderDictionary h)
        {
            Host = h["Host"];
            UserAgent = h["User-Agent"];
        }

        #endregion

        #region -- Properties --

        /// <summary>
        /// Host
        /// </summary>
        public string Host { get; set; }

        /// <summary>
        /// User agent
        /// </summary>
        public string UserAgent { get; set; }

        #endregion
    }
}