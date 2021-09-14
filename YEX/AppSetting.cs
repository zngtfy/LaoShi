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

namespace YEX
{
    /// <summary>
    /// App setting
    /// </summary>
    public class AppSetting
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public AppSetting() { }

        /// <summary>
        /// Validate value range
        /// </summary>
        /// <param name="val">Value value</param>
        /// <param name="min">Minimum value</param>
        /// <param name="max">Maximum value</param>
        /// <returns>Return the result</returns>
        private static int ValidateValueRange(int val, int min, int max)
        {
            if (val < min)
            {
                val = min;
            }
            if (val > max)
            {
                val = max;
            }

            return val;
        }

        #endregion

        #region -- Properties --

        /// <summary>
        /// Administrator user ID
        /// </summary>
        public int AdminId { get; set; }

        /// <summary>
        /// JWT secret
        /// </summary>
        public string JwtSecret { get; set; }

        /// <summary>
        /// JWT Expires
        /// </summary>
        public double JwtExpires { get; set; }

        /// <summary>
        /// Reminder expired (for change password)
        /// </summary>
        public double ReminderExpired { get; set; }

        /// <summary>
        /// RSA mode
        /// </summary>
        public bool RsaMode { get; set; }

        /// <summary>
        /// RSA public key
        /// </summary>
        public string RsaPublicKey { get; set; }

        /// <summary>
        /// RSA private key
        /// </summary>
        public string RsaPrivateKey { get; set; }

        /// <summary>
        /// Database connection string
        /// </summary>
        public string DbConnection { get; set; }

        /// <summary>
        /// Database user
        /// </summary>
        public string DbUser { get; set; }

        /// <summary>
        /// Database password
        /// </summary>
        public string DbPassword { get; set; }

        /// <summary>
        /// Host
        /// </summary>
        public string Host { get; set; }

        /// <summary>
        /// Email host
        /// </summary>
        public string EmailHost { get; set; }

        /// <summary>
        /// Email port
        /// </summary>
        public int EmailPort { get; set; }

        /// <summary>
        /// Email user
        /// </summary>
        public string EmailUser { get; set; }

        /// <summary>
        /// Email password
        /// </summary>
        public string EmailPassword { get; set; }

        /// <summary>
        /// Development mode
        /// </summary>
        public bool Dev { get; set; }

        /// <summary>
        /// Time to auto logout [2 - 60] minutes
        /// </summary>
        public int LogoutTime
        {
            get
            {
                return _logoutTime;
            }

            set
            {
                _logoutTime = ValidateValueRange(value, 2, 60);
            }
        }

        /// <summary>
        /// Number of days password will be expired [2 - 90] days, 0 is disable this function
        /// </summary>
        public int PasswordExpired
        {
            get
            {
                return _passwordExpired;
            }

            set
            {
                if (value != 0)
                {
                    _passwordExpired = ValidateValueRange(value, 2, 90);
                }
            }
        }

        /// <summary>
        /// Number of times password will be allowed [2 - 10] times
        /// </summary>
        public int PasswordHistory
        {
            get
            {
                return _passwordHistory;
            }

            set
            {
                _passwordHistory = ValidateValueRange(value, 2, 10);
            }
        }

        /// <summary>
        /// Number of attempts to enter a wrong password [2 - 10] times
        /// </summary>
        public int LockoutThreshold
        {
            get
            {
                return _lockoutThreshold;
            }

            set
            {
                _lockoutThreshold = ValidateValueRange(value, 2, 10);
            }
        }

        /// <summary>
        /// How long an account will be locked [2 - 30] minutes
        /// </summary>
        public int LockoutDuration
        {
            get
            {
                return _lockoutDuration;
            }

            set
            {
                _lockoutDuration = ValidateValueRange(value, 2, 30);
            }
        }

        /// <summary>
        /// Single session
        /// </summary>
        public bool SingleSession { get; set; }

        /// <summary>
        /// Setting
        /// </summary>
        public static AppSetting S { get; set; }

        #endregion

        #region -- Fields --

        /// <summary>
        /// Time to auto logout
        /// </summary>
        private int _logoutTime;

        /// <summary>
        /// Number of days password will be expired
        /// </summary>
        private int _passwordExpired;

        /// <summary>
        /// Number of times password will be allowed
        /// </summary>
        private int _passwordHistory;

        /// <summary>
        /// Number of attempts to enter a wrong password
        /// </summary>
        private int _lockoutThreshold;

        /// <summary>
        /// How long an account will be locked
        /// </summary>
        private int _lockoutDuration;

        #endregion
    }
}