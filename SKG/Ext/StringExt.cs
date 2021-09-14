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

using Org.BouncyCastle.Crypto;
using Org.BouncyCastle.Crypto.Encodings;
using Org.BouncyCastle.Crypto.Engines;
using Org.BouncyCastle.OpenSsl;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace SKG.Ext
{
    /// <summary>
    /// Extend for the string
    /// </summary>
    public static class StringExt
    {
        #region -- Common --

        /// <summary>
        /// From base64 string
        /// </summary>
        /// <param name="o">Data</param>
        /// <returns>Return the result</returns>
        public static byte[] Fr64(this string o)
        {
            return string.IsNullOrEmpty(o) ? null : Convert.FromBase64String(o);
        }

        /// <summary>
        /// Return a copy of this string with first letter converted to uppercase
        /// </summary>
        /// <param name="s">String</param>
        /// <returns>Return uppercase first letter</returns>
        public static string ToUpperFirst(this string s)
        {
            var res = string.Empty;

            try
            {
                res = s.Trim();
                if (!string.IsNullOrEmpty(res))
                {
                    res = char.ToUpper(res[0]) + res.Substring(1).ToLower();
                }
            }
            catch { }

            return res;
        }

        /// <summary>
        /// Return a copy of this string with first letter of each word converted to uppercase
        /// </summary>
        /// <param name="s">String</param>
        /// <returns>Return uppercase first letter of any words</returns>
        public static string ToUpperWords(this string s)
        {
            var res = string.Empty;

            try
            {
                res = s.Trim();
                var arr = res.ToCharArray();
                if (arr.Length >= 1)
                {
                    if (char.IsLower(arr[0]))
                    {
                        arr[0] = char.ToUpper(arr[0]);
                    }
                }

                for (var i = 1; i < arr.Length; i++)
                {
                    if (arr[i - 1] == ZConst.Char.Space)
                    {
                        if (char.IsLower(arr[i]))
                        {
                            arr[i] = char.ToUpper(arr[i]);
                        }
                    }
                }

                res = new string(arr);
            }
            catch { }

            return res;
        }

        /// <summary>
        /// Add one space AbCd to Ab Cd
        /// </summary>
        /// <param name="s">Input string</param>
        /// <returns>Return string with space</returns>
        public static string ToAddSpace(this string s)
        {
            var res = string.Empty;

            for (var i = 0; i < s.Length; i++)
            {
                if ('A' <= s[i] && s[i] <= 'Z')
                {
                    res += ZConst.String.Space;
                }
                res += s[i];
            }
            res = res.Trim();

            return res;
        }

        /// <summary>
        /// Standardize string
        /// </summary>
        /// <param name="s">A string</param>
        /// <returns>Return the standardized string</returns>
        public static string Standardize(this string s)
        {
            var res = s + string.Empty;

            res = res.Replace(ZConst.String.Quotation, string.Empty);
            res = res.Replace(ZConst.String.LSquare, string.Empty);
            res = res.Replace(ZConst.String.RSquare, string.Empty);

            return res;
        }

        /// <summary>
        /// Remove string at last
        /// </summary>
        /// <param name="s">String data</param>
        /// <param name="remove">String need to remove</param>
        /// <param name="replace">String will replace</param>
        /// <returns>Return the string removed</returns>
        public static string RemoveLast(this string s, string remove, string replace = ZConst.String.Blank)
        {
            var res = string.Empty;

            try
            {
                var i = s.LastIndexOf(remove);
                if (i > 0 && s.Length >= i)
                {
                    res = s.Substring(0, i) + replace;
                }
            }
            catch
            {
                res = replace;
            }

            return res;
        }

        /// <summary>
        /// Get default value if input null or empty
        /// </summary>
        /// <param name="s"></param>
        /// <param name="d">Default value</param>
        /// <returns>Return the string</returns>
        public static string ToStrDefault(this string s, string d = ZConst.String.Hyphen)
        {
            var res = (s + string.Empty).Trim();

            if (string.IsNullOrEmpty(s))
            {
                res = d;
            }

            return res;
        }

        /// <summary>
        /// Get full name
        /// </summary>
        /// <param name="firstName">First name</param>
        /// <param name="lastName">Last name</param>
        /// <returns>Return the result</returns>
        public static string ToFullName(this string firstName, string lastName)
        {
            var first = string.Empty;
            if (!string.IsNullOrEmpty(firstName))
            {
                first = firstName;
            }

            var last = string.Empty;
            if (!string.IsNullOrEmpty(lastName))
            {
                last = lastName;
            }

            var fullName = first + ZConst.String.Space + last;

            return fullName.Trim();
        }

        #endregion

        #region -- Data --

        /// <summary>
        /// Convert a string number separation with separation
        /// </summary>
        /// <param name="s">String number separation</param>
        /// <param name="separation">Separation (default is semicolon)</param>
        /// <returns>Return list int</returns>
        public static List<int> ToListInt32(this string s, char separation = ZConst.Char.Semicolon)
        {
            var res = new List<int>();
            var t1 = new char[] { separation };
            var t2 = (s + string.Empty);
            var arr = t2.Split(t1, StringSplitOptions.RemoveEmptyEntries);

            foreach (var i in arr)
            {
                res.Add(i.ToInt32());
            }

            return res;
        }

        #endregion

        #region -- RSA --

        /// <summary>
        /// Encrypt with public key
        /// </summary>
        /// <param name="data">Clear text</param>
        /// <param name="key">Public key</param>
        /// <returns>Return the result</returns>
        public static string Encrypt(this string data, string key)
        {
            var encrypt = Encoding.UTF8.GetBytes(data);
            var engine = new Pkcs1Encoding(new RsaEngine());

            key = string.Format(ZConst.PublicKey, key);

            using (var sr = new StringReader(key))
            {
                var par = (AsymmetricKeyParameter)new PemReader(sr).ReadObject();
                engine.Init(true, par);
            }

            var t = engine.ProcessBlock(encrypt, 0, encrypt.Length);
            var res = Convert.ToBase64String(t);

            return res;
        }

        /// <summary>
        /// Encrypt with private key
        /// </summary>
        /// <param name="data">Clear text</param>
        /// <param name="key">Private key</param>
        /// <returns>Return the result</returns>
        public static string EncryptWithPrivate(this string data, string key)
        {
            var encrypt = Encoding.UTF8.GetBytes(data);
            var engine = new Pkcs1Encoding(new RsaEngine());

            key = string.Format(ZConst.PrivateKey, key);
            using (var sr = new StringReader(key))
            {
                var par = (AsymmetricCipherKeyPair)new PemReader(sr).ReadObject();
                engine.Init(true, par.Public);
            }

            var t = engine.ProcessBlock(encrypt, 0, encrypt.Length);
            var res = Convert.ToBase64String(t);

            return res;
        }

        /// <summary>
        /// Decrypt with private key
        /// </summary>
        /// <param name="data">Encrypted text</param>
        /// <param name="key">Private key</param>
        /// <returns>Return the result</returns>
        public static string Decrypt(this string data, string key)
        {
            var res = data;

            try
            {
                var decrypt = Convert.FromBase64String(data);
                var engine = new Pkcs1Encoding(new RsaEngine());

                key = string.Format(ZConst.PrivateKey, key);
                using (var sr = new StringReader(key))
                {
                    var par = (AsymmetricCipherKeyPair)new PemReader(sr).ReadObject();
                    engine.Init(false, par.Private);
                }

                var t = engine.ProcessBlock(decrypt, 0, decrypt.Length);
                res = Encoding.UTF8.GetString(t);
            }
            catch { }

            return res;
        }

        #endregion

        #region -- Enums --

        /// <summary>
        /// Convert a string value to enum value
        /// </summary>
        /// <typeparam name="T">Enum type</typeparam>
        /// <param name="value">Value need to convert</param>
        /// <param name="default">Default value</param>
        /// <returns>Return the enum value</returns>
        public static T ToEnum<T>(this string value, T @default)
        {
            if (!typeof(T).IsEnum)
            {
                return @default;
            }

            try
            {
                return (T)Enum.Parse(typeof(T), value);
            }
            catch
            {
                return @default;
            }
        }

        #endregion
    }
}