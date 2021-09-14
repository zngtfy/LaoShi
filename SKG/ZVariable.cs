#region Information
/*
 * Author       : ZngTfy
 * Email        : toan.nguyen@tanvieta.co
 * Phone        : +84 345 515 010
 * ------------------------------- *
 * Create       : 2020-Jan-08 20:16
 * Update       : 2020-Jan-08 20:16
 * Checklist    : 1.0
 * Status       : Done
 */
#endregion

using System;

namespace SKG
{
    using Ext;

    /// <summary>
    /// Environment variable
    /// </summary>
    public class ZVariable
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public ZVariable() { }

        /// <summary>
        /// Get variable value
        /// </summary>
        /// <param name="name">Variable name</param>
        /// <param name="min">Minimum value</param>
        /// <param name="max">Maximum value</param>
        /// <returns>Return the result</returns>
        protected static int GetEnv(string name, float min, float max)
        {
            var t = Environment.GetEnvironmentVariable(name);
            var res = t.ToFloat();

            if (res < min)
            {
                res = min;
            }
            if (res > max)
            {
                res = max;
            }

            return (int)res;
        }

        /// <summary>
        /// Get variable value
        /// </summary>
        /// <param name="name">Variable name</param>
        /// <returns>Return the result</returns>
        protected static bool GetEnv(string name)
        {
            var t = Environment.GetEnvironmentVariable(name);
            var res = t != null && "Y" == t;
            return res;
        }

        #endregion

        #region -- Properties --

        /// <summary>
        /// JWT signing
        /// </summary>
        public static string JwtSigning
        {
            get
            {
                var res = Environment.GetEnvironmentVariable(Prefix + "JWT_SIGNING");
                return res;
            }
        }

        /// <summary>
        /// Time to live of JWT [2 - 1440] minutes
        /// </summary>
        public static int JwtTime
        {
            get
            {
                var res = GetEnv(Prefix + "JWT_TIME", 2, 1440);
                return res;
            }
        }

        /// <summary>
        /// Time to auto logout [2 - 60] minutes
        /// </summary>
        public static int LogoutTime
        {
            get
            {
                var res = GetEnv(Prefix + "LOGOUT_TIME", 2, 60);
                return res;
            }
        }

        /// <summary>
        /// Number of days password will be expired [2 - 90] days
        /// </summary>
        public static int PasswordExpired
        {
            get
            {
                var res = GetEnv(Prefix + "PASSWORD_EXPIRED", 2, 90);
                return res;
            }
        }

        /// <summary>
        /// Number of times password will be allowed [2 - 10] times
        /// </summary>
        public static int PasswordHistory
        {
            get
            {
                var res = GetEnv(Prefix + "PASSWORD_HISTORY", 2, 10);
                return res;
            }
        }

        /// <summary>
        /// Number of attempts to enter a wrong password [2 - 10] times
        /// </summary>
        public static int LockoutThreshold
        {
            get
            {
                var res = GetEnv(Prefix + "LOCKOUT_THRESHOLD", 2, 10);
                return res;
            }
        }

        /// <summary>
        /// How long an account will be locked [2 - 30] minutes
        /// </summary>
        public static int LockoutDuration
        {
            get
            {
                var res = GetEnv(Prefix + "LOCKOUT_DURATION", 2, 30);
                return res;
            }
        }

        /// <summary>
        /// Single session
        /// </summary>
        public static bool SingleSession
        {
            get
            {
                var res = GetEnv(Prefix + "SINGLE_SESSION");
                return res;
            }
        }

        /// <summary>
        /// Development mode
        /// </summary>
        public static bool DevMode
        {
            get
            {
                var res = GetEnv(Prefix + "DEV_MODE");
                return res;
            }
        }

        /// <summary>
        /// RSA mode
        /// </summary>
        public static bool RsaMode
        {
            get
            {
                var res = GetEnv(Prefix + "RSA_MODE");
                return res;
            }
        }

        /// <summary>
        /// RSA private key
        /// </summary>
        public static string RsaPrivateKey
        {
            get
            {
                var res = Environment.GetEnvironmentVariable(Prefix + "RSA_PRIVATE_KEY");
                return res;
            }
        }

        /// <summary>
        /// RSA public key
        /// </summary>
        public static string RsaPublicKey
        {
            get
            {
                var res = Environment.GetEnvironmentVariable(Prefix + "RSA_PUBLIC_KEY");
                return res;
            }
        }

        /// <summary>
        /// Variable prefix
        /// </summary>
        public static string Prefix
        {
            get
            {
                if (prefix == null)
                {
                    prefix = string.Empty;
                }

                return prefix;
            }
            set
            {
                prefix = value;
            }
        }

        #endregion

        #region -- Fields --

        /// <summary>
        /// Variable prefix
        /// </summary>
        private static string prefix;

        #endregion
    }
}