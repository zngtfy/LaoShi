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

using Newtonsoft.Json.Linq;
using System.IO;

namespace SKG.Ext
{
    /// <summary>
    /// Extend for the file
    /// </summary>
    public static class FileExt
    {
        #region -- Common --

        /// <summary>
        /// Convert file to array byte
        /// </summary>
        /// <param name="s">Full path file name</param>
        /// <returns>Return the result</returns>
        public static byte[] GetFile(this string s)
        {
            if (File.Exists(s))
            {
                var fs = File.OpenRead(s);
                var res = new byte[fs.Length];
                int br = fs.Read(res, 0, res.Length);

                if (br != fs.Length)
                {
                    throw new IOException(s);
                }

                return res;
            }
            else
            {
                return new byte[1];
            }
        }

        /// <summary>
        /// Convert file to array byte
        /// </summary>
        /// <param name="s">Full path file name without extension</param>
        /// <param name="e">File extension with dot</param>
        /// <returns>Return the result</returns>
        public static byte[] GetFile(this string s, string e)
        {
            if (File.Exists(s))
            {
                return s.GetFile();
            }

            s += e;
            if (File.Exists(s))
            {
                return s.GetFile();
            }

            return new byte[1];
        }

        /// <summary>
        /// Read all text
        /// </summary>
        /// <param name="s">Full path file name</param>
        /// <returns>Return the result</returns>
        public static string ReadAllText(this string s)
        {
            var res = string.Empty;

            if (!string.IsNullOrEmpty(s))
            {
                if (File.Exists(s))
                {
                    res = File.ReadAllText(s);
                }
            }

            return res;
        }

        #endregion

        /// <summary>
        /// Load file
        /// </summary>
        /// <typeparam name="T">JSON class type</typeparam>
        /// <param name="file">JSON file path</param>
        /// <param name="section">Section in JSON file</param>
        /// <returns>Return the result</returns>
        public static T Load<T>(this string file, string section = null) where T : new()
        {
            try
            {
                using (var r = new StreamReader(file))
                {
                    var t1 = r.ReadToEnd();
                    var t2 = JObject.Parse(t1);


                    if (string.IsNullOrEmpty(section))
                    {
                        return t2.ToObject<T>();
                    }
                    else
                    {
                        var t3 = t2.GetValue(section);
                        return t3.ToObject<T>();
                    }
                }
            }
            catch { }

            return new T();
        }
    }
}