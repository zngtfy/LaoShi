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

namespace SKG.Dto
{
    /// <summary>
    /// Short message service data transfer object
    /// </summary>
    public sealed class SmsDto
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public SmsDto()
        {
            Index = string.Empty;
            Status = string.Empty;
            Sender = string.Empty;
            Alphabet = string.Empty;
            Sent = string.Empty;
            Message = string.Empty;
        }

        #endregion

        #region -- Properties --

        /// <summary>
        /// Index
        /// </summary>
        public string Index { get; set; }

        /// <summary>
        /// Status
        /// </summary>
        public string Status { get; set; }

        /// <summary>
        /// Sender
        /// </summary>
        public string Sender { get; set; }

        /// <summary>
        /// Alphabet
        /// </summary>
        public string Alphabet { get; set; }

        /// <summary>
        /// Sent
        /// </summary>
        public string Sent { get; set; }

        /// <summary>
        /// Message
        /// </summary>
        public string Message { get; set; }

        #endregion
    }
}