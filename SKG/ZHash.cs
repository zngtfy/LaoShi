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

using Microsoft.AspNetCore.Cryptography.KeyDerivation;
using System;
using System.Security.Cryptography;
using System.Text;

namespace SKG
{
    /// <summary>
    /// Hash
    /// </summary>
    public class ZHash
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="s">Data</param>
        public ZHash(string s)
        {
            _dat = s + string.Empty;

            // Generate a 128-bit salt using a secure PRNG
            var salt = new byte[128 / 8];
            var rng = RandomNumberGenerator.Create();
            rng.GetBytes(salt);
            rng.Dispose();

            // Derive a 256-bit subkey (use HMACSHA1 with 10,000 iterations)
            var hash = KeyDerivation.Pbkdf2(_dat, salt, KeyDerivationPrf.HMACSHA1, 10000, 256 / 8);

            Value = Convert.ToBase64String(hash);
            Salt = Convert.ToBase64String(salt);
        }

        /// <summary>
        /// Compute SHA 1
        /// </summary>
        /// <param name="s">Input string</param>
        /// <returns>Return the result</returns>
        public static string ComputeSha(string s)
        {
            var sha = new SHA1CryptoServiceProvider();
            var t1 = Encoding.UTF8.GetBytes(s);
            var t2 = sha.ComputeHash(t1);
            var res = Convert.ToBase64String(t2);
            return res;
        }

        #endregion

        #region -- Properties --

        /// <summary>
        /// Hash value
        /// </summary>
        public string Value { get; private set; }

        /// <summary>
        /// Salt
        /// </summary>
        public string Salt { get; private set; }

        /// <summary>
        /// Pepper
        /// </summary>
        public int Pepper
        {
            get
            {
                var t = GetHashCode() + _dat.GetHashCode();
                return t.GetHashCode();
            }
        }

        #endregion

        #region -- Fields --

        /// <summary>
        /// Data
        /// </summary>
        public string _dat;

        #endregion
    }
}