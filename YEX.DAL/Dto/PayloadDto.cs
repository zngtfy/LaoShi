#region Information
/*
 * Author       : ZngTfy
 * Email        : toan.nguyen@tanvieta.co
 * Phone        : +84 345 515 010
 * ------------------------------- *
 * Create       : 2020-Jan-19 08:46
 * Update       : 2020-Jan-19 08:46
 * Checklist    : 1.0
 * Status       : Done
 */
#endregion

using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace YEX.DAL.Dto
{
    /// <summary>
    /// Payload data transfer object
    /// </summary>
    public class PayloadDto
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public PayloadDto()
        {
            Rights = new List<string>();
        }

        #endregion

        #region -- Properties --

        /// <summary>
        /// Id
        /// </summary>
        [JsonProperty("id")]
        public int Id { get; set; }

        /// <summary>
        /// UUID
        /// </summary>
        [JsonProperty("uuid")]
        public Guid Uuid { get; set; }

        /// <summary>
        /// User name
        /// </summary>
        [JsonProperty("userName")]
        public string UserName { get; set; }

        /// <summary>
        /// First name
        /// </summary>
        [JsonProperty("firstName")]
        public string FirstName { get; set; }

        /// <summary>
        /// Last name
        /// </summary>
        [JsonProperty("lastName")]
        public string LastName { get; set; }

        /// <summary>
        /// Full name
        /// </summary>
        [JsonProperty("fullName")]
        public string FullName { get; set; }

        /// <summary>
        /// Avatar
        /// </summary>
        [JsonProperty("avatar")]
        public string Avatar { get; set; }

        /// <summary>
        /// Language
        /// </summary>
        [JsonProperty("language")]
        public string Language { get; set; }

        /// <summary>
        /// Role
        /// </summary>
        [JsonProperty("role")]
        public string Role { get; set; }

        /// <summary>
        /// Rights
        /// </summary>
        [JsonProperty("rights")]
        public List<string> Rights { get; set; }

        /// <summary>
        /// URLs
        /// </summary>
        [JsonProperty("urls")]
        public List<string> Urls { get; set; }

        #endregion
    }
}