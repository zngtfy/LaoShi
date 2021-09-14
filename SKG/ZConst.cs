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

namespace SKG
{
    /// <summary>
    /// Constant
    /// </summary>
    public class ZConst
    {
        #region -- Common field --

        /// <summary>
        /// Payload
        /// </summary>
        public const string Payload = "payload";

        /// <summary>
        /// Public key format
        /// </summary>
        public const string PublicKey = "-----BEGIN PUBLIC KEY-----\n{0}\n-----END PUBLIC KEY-----";

        /// <summary>
        /// Private key format
        /// </summary>
        public const string PrivateKey = "-----BEGIN RSA PRIVATE KEY-----\n{0}\n-----END RSA PRIVATE KEY-----";

        #endregion

        #region -- Common class --

        /// <summary>
        /// String
        /// </summary>
        public class String
        {
            /// <summary>
            /// Blank
            /// </summary>
            public const string Blank = "";

            /// <summary>
            /// Slash
            /// </summary>
            public const string Slash = "/";

            /// <summary>
            /// Back slash
            /// </summary>
            public const string BackSlash = "\\";

            /// <summary>
            /// Space
            /// </summary>
            public const string Space = " ";

            /// <summary>
            /// Dot
            /// </summary>
            public const string Dot = ".";

            /// <summary>
            /// Colon
            /// </summary>
            public const string Colon = ":";

            /// <summary>
            /// Semicolon
            /// </summary>
            public const string Semicolon = ";";

            /// <summary>
            /// Comma
            /// </summary>
            public const string Comma = ",";

            /// <summary>
            /// Question
            /// </summary>
            public const string Question = "?";

            /// <summary>
            /// Asterisk
            /// </summary>
            public const string Asterisk = "*";

            /// <summary>
            /// Caret
            /// </summary>
            public const string Caret = "^";

            /// <summary>
            /// Plus
            /// </summary>
            public const string Plus = "+";

            /// <summary>
            /// Minus
            /// </summary>
            public const string Minus = "-";

            /// <summary>
            /// Quotation
            /// </summary>
            public const string Quotation = "\"";

            /// <summary>
            /// Vertical bar
            /// </summary>
            public const string VBar = "|";

            /// <summary>
            /// Left square
            /// </summary>
            public const string LSquare = "[";

            /// <summary>
            /// Right square
            /// </summary>
            public const string RSquare = "]";

            /// <summary>
            /// Underscore
            /// </summary>
            public const string Underscore = "_";

            /// <summary>
            /// Ampersand
            /// </summary>
            public const string Ampersand = "&";

            /// <summary>
            /// Percent
            /// </summary>
            public const string Percent = "%";

            /// <summary>
            /// At sign
            /// </summary>
            public const string AtSign = "@";

            /// <summary>
            /// Exclamation
            /// </summary>
            public const string Exclamation = "!";

            /// <summary>
            /// Hyphen
            /// </summary>
            public const string Hyphen = "-";
        }

        /// <summary>
        /// Char
        /// </summary>
        public class Char
        {
            /// <summary>
            /// Slash
            /// </summary>
            public const char Slash = '/';

            /// <summary>
            /// Back slash
            /// </summary>
            public const char BackSlash = '\\';

            /// <summary>
            /// Space
            /// </summary>
            public const char Space = ' ';

            /// <summary>
            /// Dot
            /// </summary>
            public const char Dot = '.';

            /// <summary>
            /// Colon
            /// </summary>
            public const char Colon = ':';

            /// <summary>
            /// Semicolon
            /// </summary>
            public const char Semicolon = ';';

            /// <summary>
            /// Comma
            /// </summary>
            public const char Comma = ',';

            /// <summary>
            /// Question
            /// </summary>
            public const char Question = '?';

            /// <summary>
            /// Asterisk
            /// </summary>
            public const char Asterisk = '*';

            /// <summary>
            /// Caret
            /// </summary>
            public const char Caret = '^';

            /// <summary>
            /// Plus
            /// </summary>
            public const char Plus = '+';

            /// <summary>
            /// Minus
            /// </summary>
            public const char Minus = '-';

            /// <summary>
            /// Quotation
            /// </summary>
            public const char Quotation = '\'';

            /// <summary>
            /// Vertical bar
            /// </summary>
            public const char VBar = '|';

            /// <summary>
            /// Left square
            /// </summary>
            public const char LSquare = '[';

            /// <summary>
            /// Right square
            /// </summary>
            public const char RSquare = ']';

            /// <summary>
            /// Underscore
            /// </summary>
            public const char Underscore = '_';

            /// <summary>
            /// Ampersand
            /// </summary>
            public const char Ampersand = '&';

            /// <summary>
            /// Percent
            /// </summary>
            public const char Percent = '%';

            /// <summary>
            /// At sign
            /// </summary>
            public const char AtSign = '@';

            /// <summary>
            /// Exclamation
            /// </summary>
            public const char Exclamation = '!';

            /// <summary>
            /// Hyphen
            /// </summary>
            public const char Hyphen = '-';
        }

        /// <summary>
        /// DateTime format string
        /// </summary>
        public class Format
        {
            /// <summary>
            /// dd-MMM-yyyy
            /// </summary>
            public const string Date = "dd-MMM-yyyy";

            /// <summary>
            /// HH:mm:ss
            /// </summary>
            public const string Time = "HH:mm:ss";

            /// <summary>
            /// yyyy-MM-dd HH:mm:ss
            /// </summary>
            public const string SqlDateTime = "yyyy-MM-dd " + Time;

            /// <summary>
            /// yyyy/MM/dd HH:mm:ss
            /// </summary>
            public const string IsoDateTime = "yyyy/MM/dd " + Time;

            /// <summary>
            /// {0}/{1}
            /// </summary>
            public const string Slash = "{0}" + String.Slash + "{1}";
        }

        /// <summary>
        /// Maximum size for configuration
        /// </summary>
        public class MaxSize
        {
            /// <summary>
            /// Data list
            /// </summary>
            public const int DataList = 1000;
        }

        /// <summary>
        /// Setting code
        /// </summary>
        public class Setting
        {
            /// <summary>
            /// Language
            /// </summary>
            public const string Language = "LANG";
        }

        /// <summary>
        /// Default value
        /// </summary>
        public class Default
        {
            /// <summary>
            /// Language
            /// </summary>
            public const string Language = "vi-vn";
        }

        #endregion
    }
}