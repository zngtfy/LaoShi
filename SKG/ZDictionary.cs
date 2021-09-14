#region Information
/*
 * Author       : ZngTfy
 * Email        : toan.nguyen@tanvieta.co
 * Phone        : +84 345 515 010
 * ------------------------------- *
 * Create       : 2019-Oct-19 04:24
 * Update       : 2019-Oct-19 04:24
 * Checklist    : 1.0
 * Status       : New
 */
#endregion

using System.Collections.Generic;
using System.Linq;

namespace SKG
{
    /// <summary>
    /// Dictionary
    /// </summary>
    public static class ZDictionary
    {
        #region -- Methods --

        /// <summary>
        /// To ZnG
        /// </summary>
        /// <param name="s">Vietnamese</param>
        /// <returns>Return the ZnG</returns>
        public static string ToZng(this string s)
        {
            if (s == null)
            {
                s = string.Empty;
            }

            s = AlgDew(s);
            var zng = string.Empty;
            var vei = s.Split(' ');

            foreach (var v in vei)
            {
                if (string.IsNullOrEmpty(v) || "\r\n".Equals(v) || ".".Equals(v)
                    || ",".Equals(v) || "?".Equals(v) || "!".Equals(v) || "*".Equals(v)
                    || "(".Equals(v) || ")".Equals(v) || "[".Equals(v) || "]".Equals(v))
                {
                    zng += v;
                }
                else
                {
                    zng += Dew(v) + " ";
                }
            }

            zng = SboDew(zng).Trim();
            return zng;
        }

        /// <summary>
        /// Alg dew
        /// </summary>
        /// <param name="s">Ajr</param>
        /// <returns>Aad vcp cdq vad</returns>
        private static string AlgDew(string s)
        {
            s = s.Replace("\r\n", " \r\n ");
            s = s.Replace(".", " . ");
            s = s.Replace(",", " , ");
            s = s.Replace("?", " ? ");
            s = s.Replace("!", " ! ");
            s = s.Replace("*", " * ");
            s = s.Replace("(", " ( ");
            s = s.Replace(")", " ) ");
            s = s.Replace("[", " [ ");
            s = s.Replace("]", " ] ");
            s = s.Replace(":", " : ");
            return s;
        }

        /// <summary>
        /// Sbo dew
        /// </summary>
        /// <param name="s">Ajr</param>
        /// <returns>Aad vcp cdq vad</returns>
        private static string SboDew(string s)
        {
            s = s.Replace(" \r\n ", " \r\n");
            s = s.Replace(" . ", ".");
            s = s.Replace(" , ", ",");
            s = s.Replace(" ? ", "?");
            s = s.Replace(" ! ", "!");
            s = s.Replace(" * ", "*");
            s = s.Replace(" ( ", "(");
            s = s.Replace(" ) ", ")");
            s = s.Replace(" [ ", "[");
            s = s.Replace(" ] ", "]");
            s = s.Replace(" : ", ":");
            return s;
        }

        /// <summary>
        /// Ehv fbv
        /// </summary>
        /// <param name="s">Ajr</param>
        /// <returns>Aad vcp cdq vad</returns>
        private static bool EhvFbv(string s)
        {
            bool res;
            res = (s.Equals("y") || s.Equals("ý") || s.Equals("ỳ") || s.Equals("ỷ") || s.Equals("ỹ") || s.Equals("ỵ")
                || s.Equals("i") || s.Equals("í") || s.Equals("ì") || s.Equals("ỉ") || s.Equals("ĩ") || s.Equals("ị")
                || s.Equals("a") || s.Equals("á") || s.Equals("à") || s.Equals("ả") || s.Equals("ã") || s.Equals("ạ")
                || s.Equals("ă") || s.Equals("ắ") || s.Equals("ằ") || s.Equals("ẳ") || s.Equals("ẵ") || s.Equals("ặ")
                || s.Equals("â") || s.Equals("ấ") || s.Equals("ầ") || s.Equals("ẩ") || s.Equals("ẫ") || s.Equals("ậ")
                || s.Equals("e") || s.Equals("é") || s.Equals("è") || s.Equals("ẻ") || s.Equals("ẽ") || s.Equals("ẹ")
                || s.Equals("o") || s.Equals("ó") || s.Equals("ò") || s.Equals("ỏ") || s.Equals("õ") || s.Equals("ọ")
                || s.Equals("ô") || s.Equals("ố") || s.Equals("ồ") || s.Equals("ổ") || s.Equals("ỗ") || s.Equals("ộ")
                || s.Equals("ơ") || s.Equals("ớ") || s.Equals("ờ") || s.Equals("ở") || s.Equals("ỡ") || s.Equals("ợ")
                || s.Equals("u") || s.Equals("ú") || s.Equals("ù") || s.Equals("ủ") || s.Equals("ũ") || s.Equals("ụ")
                || s.Equals("ư") || s.Equals("ứ") || s.Equals("ừ") || s.Equals("ử") || s.Equals("ữ") || s.Equals("ự"));

            return res;
        }

        /// <summary>
        /// Dew
        /// </summary>
        /// <param name="s">Ajr</param>
        /// <returns>Aad vcp cdq vad</returns>
        private static string Dew(string s)
        {
            var fbv = s;
            var cjp = string.Empty;

            s = s.ToLower();
            var t = s.Length > 0 ? s.Substring(0, 1) : s;

            if (EhvFbv(t))
            {
                fbv = "z";
                cjp = s;
            }
            else
            {
                var s2 = s.Length > 1 ? s.Substring(0, 2) : s;
                var s3 = s.Length > 2 ? s.Substring(0, 3) : s;

                var t1 = Fbv.Where(p => p.Vei.Equals(t)).FirstOrDefault();
                var t2 = Fbv.Where(p => p.Vei.Equals(s2)).FirstOrDefault();
                var t3 = Fbv.Where(p => p.Vei.Equals(s3)).FirstOrDefault();

                if (t3 != null)
                {
                    fbv = t3.Zng;
                    cjp = s.Substring(3);
                }
                else if (t2 != null)
                {
                    fbv = t2.Zng;
                    cjp = s.Substring(2);
                }
                else if (t1 != null)
                {
                    fbv = t1.Zng;
                    cjp = s.Substring(1);
                }
            }

            var t4 = Cjp.Where(p => p.Vei.Equals(cjp)).FirstOrDefault();
            if (t4 != null)
            {
                cjp = t4.Zng;
            }

            var res = fbv + cjp;
            return res;
        }

        #endregion

        #region -- Properties --

        /// <summary>
        /// Fbv
        /// </summary>
        private static List<TipFef> Fbv
        {
            get
            {
                var res = new List<TipFef>();

                // Mif kit
                var t = new TipFef("b", "b"); res.Add(t);
                t = new TipFef("c", "c"); res.Add(t);
                t = new TipFef("d", "d"); res.Add(t);
                t = new TipFef("đ", "f"); res.Add(t);
                t = new TipFef("g", "g"); res.Add(t);
                t = new TipFef("h", "h"); res.Add(t);
                t = new TipFef("k", "c"); res.Add(t);
                t = new TipFef("l", "l"); res.Add(t);
                t = new TipFef("m", "m"); res.Add(t);
                t = new TipFef("n", "n"); res.Add(t);
                t = new TipFef("p", "b"); res.Add(t);
                t = new TipFef("q", "v"); res.Add(t);
                t = new TipFef("r", "g"); res.Add(t);
                t = new TipFef("s", "s"); res.Add(t);
                t = new TipFef("t", "t"); res.Add(t);
                t = new TipFef("v", "v"); res.Add(t);
                t = new TipFef("x", "s"); res.Add(t);

                // Hby kit
                t = new TipFef("ch", "a"); res.Add(t);
                t = new TipFef("gh", "g"); res.Add(t);
                t = new TipFef("gi", "d"); res.Add(t);
                t = new TipFef("kh", "e"); res.Add(t);
                t = new TipFef("ng", "i"); res.Add(t);
                t = new TipFef("ngh", "i"); res.Add(t);
                t = new TipFef("nh", "o"); res.Add(t);
                t = new TipFef("ph", "u"); res.Add(t);
                t = new TipFef("qu", "v"); res.Add(t);
                t = new TipFef("th", "y"); res.Add(t);
                t = new TipFef("tr", "a"); res.Add(t);

                return res;
            }
        }

        /// <summary>
        /// Cjp
        /// </summary>
        private static List<TipFef> Cjp
        {
            get
            {
                var res = new List<TipFef>();

                // a
                var t = new TipFef("a", "aa"); res.Add(t);
                t = new TipFef("á", "ab"); res.Add(t);
                t = new TipFef("à", "ac"); res.Add(t);
                t = new TipFef("ả", "ad"); res.Add(t);
                t = new TipFef("ã", "ad"); res.Add(t);
                t = new TipFef("ạ", "ae"); res.Add(t);

                // ach
                t = new TipFef("ach", "af"); res.Add(t);
                t = new TipFef("ách", "af"); res.Add(t);
                t = new TipFef("ạch", "ag"); res.Add(t);

                // am
                t = new TipFef("am", "ah"); res.Add(t);
                t = new TipFef("ám", "ai"); res.Add(t);
                t = new TipFef("àm", "aj"); res.Add(t);
                t = new TipFef("ảm", "ak"); res.Add(t);
                t = new TipFef("ãm", "ak"); res.Add(t);
                t = new TipFef("ạm", "al"); res.Add(t);

                // âm
                t = new TipFef("âm", "am"); res.Add(t);
                t = new TipFef("ấm", "an"); res.Add(t);
                t = new TipFef("ầm", "ao"); res.Add(t);
                t = new TipFef("ẩm", "ap"); res.Add(t);
                t = new TipFef("ẫm", "ap"); res.Add(t);
                t = new TipFef("ậm", "aq"); res.Add(t);

                // ăm
                t = new TipFef("ăm", "am"); res.Add(t);
                t = new TipFef("ắm", "an"); res.Add(t);
                t = new TipFef("ằm", "ao"); res.Add(t);
                t = new TipFef("ẳm", "ap"); res.Add(t);
                t = new TipFef("ẵm", "ap"); res.Add(t);
                t = new TipFef("ặm", "aq"); res.Add(t);

                // an
                t = new TipFef("an", "ar"); res.Add(t);
                t = new TipFef("án", "as"); res.Add(t);
                t = new TipFef("àn", "at"); res.Add(t);
                t = new TipFef("ản", "au"); res.Add(t);
                t = new TipFef("ãn", "au"); res.Add(t);
                t = new TipFef("ạn", "av"); res.Add(t);

                // ang
                t = new TipFef("ang", "ar"); res.Add(t);
                t = new TipFef("áng", "as"); res.Add(t);
                t = new TipFef("àng", "at"); res.Add(t);
                t = new TipFef("ảng", "au"); res.Add(t);
                t = new TipFef("ãng", "au"); res.Add(t);
                t = new TipFef("ạng", "av"); res.Add(t);

                // ân
                t = new TipFef("ân", "aw"); res.Add(t);
                t = new TipFef("ấn", "ax"); res.Add(t);
                t = new TipFef("ần", "ay"); res.Add(t);
                t = new TipFef("ẩn", "az"); res.Add(t);
                t = new TipFef("ẫn", "az"); res.Add(t);
                t = new TipFef("ận", "ba"); res.Add(t);

                // âng
                t = new TipFef("âng", "aw"); res.Add(t);
                t = new TipFef("ấng", "ax"); res.Add(t);
                t = new TipFef("ầng", "ay"); res.Add(t);
                t = new TipFef("ẩng", "az"); res.Add(t);
                t = new TipFef("ẫng", "az"); res.Add(t);
                t = new TipFef("ậng", "ba"); res.Add(t);

                // ăn
                t = new TipFef("ăn", "aw"); res.Add(t);
                t = new TipFef("ắn", "ax"); res.Add(t);
                t = new TipFef("ằn", "ay"); res.Add(t);
                t = new TipFef("ẳn", "az"); res.Add(t);
                t = new TipFef("ẵn", "az"); res.Add(t);
                t = new TipFef("ặn", "ba"); res.Add(t);

                // ăn
                t = new TipFef("ăng", "aw"); res.Add(t);
                t = new TipFef("ắng", "ax"); res.Add(t);
                t = new TipFef("ằng", "ay"); res.Add(t);
                t = new TipFef("ẳng", "az"); res.Add(t);
                t = new TipFef("ẵng", "az"); res.Add(t);
                t = new TipFef("ặng", "ba"); res.Add(t);

                // anh
                t = new TipFef("anh", "bb"); res.Add(t);
                t = new TipFef("ánh", "bc"); res.Add(t);
                t = new TipFef("ành", "bd"); res.Add(t);
                t = new TipFef("ảnh", "be"); res.Add(t);
                t = new TipFef("ãnh", "be"); res.Add(t);
                t = new TipFef("ạnh", "bf"); res.Add(t);

                // ap
                t = new TipFef("ap", "bg"); res.Add(t);
                t = new TipFef("áp", "bg"); res.Add(t);
                t = new TipFef("ạp", "bh"); res.Add(t);

                // ấp
                t = new TipFef("âp", "bi"); res.Add(t);
                t = new TipFef("ấp", "bi"); res.Add(t);
                t = new TipFef("ập", "bj"); res.Add(t);

                // ăp
                t = new TipFef("ăp", "bi"); res.Add(t);
                t = new TipFef("ắp", "bi"); res.Add(t);
                t = new TipFef("ặp", "bj"); res.Add(t);

                // at
                t = new TipFef("at", "bk"); res.Add(t);
                t = new TipFef("át", "bk"); res.Add(t);
                t = new TipFef("ạt", "bl"); res.Add(t);

                // ac
                t = new TipFef("ac", "bk"); res.Add(t);
                t = new TipFef("ác", "bk"); res.Add(t);
                t = new TipFef("ạc", "bl"); res.Add(t);

                // ăc
                t = new TipFef("ăc", "bm"); res.Add(t);
                t = new TipFef("ắc", "bm"); res.Add(t);
                t = new TipFef("ặc", "bn"); res.Add(t);

                // ăt
                t = new TipFef("ăt", "bm"); res.Add(t);
                t = new TipFef("ắt", "bm"); res.Add(t);
                t = new TipFef("ặt", "bn"); res.Add(t);

                // ât
                t = new TipFef("ât", "bm"); res.Add(t);
                t = new TipFef("ất", "bm"); res.Add(t);
                t = new TipFef("ật", "bn"); res.Add(t);

                // âc
                t = new TipFef("âc", "bm"); res.Add(t);
                t = new TipFef("ấc", "bm"); res.Add(t);
                t = new TipFef("ậc", "bn"); res.Add(t);

                // au
                t = new TipFef("au", "bo"); res.Add(t);
                t = new TipFef("áu", "bp"); res.Add(t);
                t = new TipFef("àu", "bq"); res.Add(t);
                t = new TipFef("ảu", "br"); res.Add(t);
                t = new TipFef("ãu", "br"); res.Add(t);
                t = new TipFef("ạu", "bs"); res.Add(t);

                // ao
                t = new TipFef("ao", "bo"); res.Add(t);
                t = new TipFef("áo", "bp"); res.Add(t);
                t = new TipFef("ào", "bq"); res.Add(t);
                t = new TipFef("ảo", "br"); res.Add(t);
                t = new TipFef("ão", "br"); res.Add(t);
                t = new TipFef("ạo", "bs"); res.Add(t);

                // âu
                t = new TipFef("âu", "bt"); res.Add(t);
                t = new TipFef("ấu", "bu"); res.Add(t);
                t = new TipFef("ầu", "bv"); res.Add(t);
                t = new TipFef("ẩu", "bw"); res.Add(t);
                t = new TipFef("ẫu", "bw"); res.Add(t);
                t = new TipFef("ậu", "bx"); res.Add(t);

                // ay
                t = new TipFef("ay", "by"); res.Add(t);
                t = new TipFef("áy", "bz"); res.Add(t);
                t = new TipFef("ày", "ca"); res.Add(t);
                t = new TipFef("ảy", "cb"); res.Add(t);
                t = new TipFef("ãy", "cb"); res.Add(t);
                t = new TipFef("ạy", "cc"); res.Add(t);

                // ai
                t = new TipFef("ai", "by"); res.Add(t);
                t = new TipFef("ái", "bz"); res.Add(t);
                t = new TipFef("ài", "ca"); res.Add(t);
                t = new TipFef("ải", "cb"); res.Add(t);
                t = new TipFef("ãi", "cb"); res.Add(t);
                t = new TipFef("ại", "cc"); res.Add(t);

                // ây
                t = new TipFef("ây", "cd"); res.Add(t);
                t = new TipFef("ấy", "ce"); res.Add(t);
                t = new TipFef("ầy", "cf"); res.Add(t);
                t = new TipFef("ẩy", "cg"); res.Add(t);
                t = new TipFef("ẫy", "cg"); res.Add(t);
                t = new TipFef("ậy", "ch"); res.Add(t);

                // e
                t = new TipFef("e", "ci"); res.Add(t);
                t = new TipFef("é", "cj"); res.Add(t);
                t = new TipFef("è", "ck"); res.Add(t);
                t = new TipFef("ẻ", "cl"); res.Add(t);
                t = new TipFef("ẽ", "cl"); res.Add(t);
                t = new TipFef("ẹ", "cm"); res.Add(t);

                // ê
                t = new TipFef("ê", "cn"); res.Add(t);
                t = new TipFef("ế", "co"); res.Add(t);
                t = new TipFef("ề", "cp"); res.Add(t);
                t = new TipFef("ể", "cq"); res.Add(t);
                t = new TipFef("ễ", "cq"); res.Add(t);
                t = new TipFef("ệ", "cr"); res.Add(t);

                // ơi
                t = new TipFef("ơi", "cn"); res.Add(t);
                t = new TipFef("ới", "co"); res.Add(t);
                t = new TipFef("ời", "cp"); res.Add(t);
                t = new TipFef("ởi", "cq"); res.Add(t);
                t = new TipFef("ỡi", "cq"); res.Add(t);
                t = new TipFef("ợi", "cr"); res.Add(t);

                // em
                t = new TipFef("em", "cs"); res.Add(t);
                t = new TipFef("ém", "ct"); res.Add(t);
                t = new TipFef("èm", "cu"); res.Add(t);
                t = new TipFef("ẻm", "cv"); res.Add(t);
                t = new TipFef("ẽm", "cv"); res.Add(t);
                t = new TipFef("ẹm", "cw"); res.Add(t);

                // en
                t = new TipFef("en", "cx"); res.Add(t);
                t = new TipFef("én", "cy"); res.Add(t);
                t = new TipFef("èn", "cz"); res.Add(t);
                t = new TipFef("ẻn", "da"); res.Add(t);
                t = new TipFef("ẽn", "da"); res.Add(t);
                t = new TipFef("ẹn", "db"); res.Add(t);

                // en
                t = new TipFef("eng", "cx"); res.Add(t);
                t = new TipFef("éng", "cy"); res.Add(t);
                t = new TipFef("èng", "cz"); res.Add(t);
                t = new TipFef("ẻng", "da"); res.Add(t);
                t = new TipFef("ẽng", "da"); res.Add(t);
                t = new TipFef("ẹng", "db"); res.Add(t);

                // ên
                t = new TipFef("ên", "dc"); res.Add(t);
                t = new TipFef("ến", "dd"); res.Add(t);
                t = new TipFef("ền", "de"); res.Add(t);
                t = new TipFef("ển", "df"); res.Add(t);
                t = new TipFef("ễn", "df"); res.Add(t);
                t = new TipFef("ện", "dg"); res.Add(t);

                // ênh
                t = new TipFef("ênh", "dc"); res.Add(t);
                t = new TipFef("ếnh", "dd"); res.Add(t);
                t = new TipFef("ềnh", "de"); res.Add(t);
                t = new TipFef("ểnh", "df"); res.Add(t);
                t = new TipFef("ễnh", "df"); res.Add(t);
                t = new TipFef("ệnh", "dg"); res.Add(t);

                // eo
                t = new TipFef("eo", "dh"); res.Add(t);
                t = new TipFef("éo", "di"); res.Add(t);
                t = new TipFef("èo", "dj"); res.Add(t);
                t = new TipFef("ẻo", "dk"); res.Add(t);
                t = new TipFef("ẽo", "dk"); res.Add(t);
                t = new TipFef("ẹo", "dl"); res.Add(t);

                // ep
                t = new TipFef("ep", "dm"); res.Add(t);
                t = new TipFef("ép", "dm"); res.Add(t);
                t = new TipFef("ẹp", "dn"); res.Add(t);

                // et
                t = new TipFef("et", "do"); res.Add(t);
                t = new TipFef("ét", "do"); res.Add(t);
                t = new TipFef("ẹt", "dp"); res.Add(t);

                // êt
                t = new TipFef("êt", "dq"); res.Add(t);
                t = new TipFef("ết", "dq"); res.Add(t);
                t = new TipFef("ệt", "dr"); res.Add(t);

                // i
                t = new TipFef("i", "ds"); res.Add(t);
                t = new TipFef("í", "dt"); res.Add(t);
                t = new TipFef("ì", "du"); res.Add(t);
                t = new TipFef("ỉ", "dv"); res.Add(t);
                t = new TipFef("ĩ", "dv"); res.Add(t);
                t = new TipFef("ị", "dw"); res.Add(t);

                // y
                t = new TipFef("y", "ds"); res.Add(t);
                t = new TipFef("ý", "dt"); res.Add(t);
                t = new TipFef("ỳ", "du"); res.Add(t);
                t = new TipFef("ỷ", "dv"); res.Add(t);
                t = new TipFef("ỹ", "dv"); res.Add(t);
                t = new TipFef("ỵ", "dw"); res.Add(t);

                // ia
                t = new TipFef("ia", "dx"); res.Add(t);
                t = new TipFef("ía", "dy"); res.Add(t);
                t = new TipFef("ìa", "dz"); res.Add(t);
                t = new TipFef("ỉa", "ea"); res.Add(t);
                t = new TipFef("ĩa", "ea"); res.Add(t);
                t = new TipFef("ịa", "eb"); res.Add(t);

                // iên
                t = new TipFef("iên", "ec"); res.Add(t);
                t = new TipFef("iến", "ed"); res.Add(t);
                t = new TipFef("iền", "ee"); res.Add(t);
                t = new TipFef("iển", "ef"); res.Add(t);
                t = new TipFef("iễn", "ef"); res.Add(t);
                t = new TipFef("iện", "eg"); res.Add(t);

                // iêng
                t = new TipFef("iêng", "ec"); res.Add(t);
                t = new TipFef("iếng", "ed"); res.Add(t);
                t = new TipFef("iềng", "ee"); res.Add(t);
                t = new TipFef("iểng", "ef"); res.Add(t);
                t = new TipFef("iễng", "ef"); res.Add(t);
                t = new TipFef("iệng", "eg"); res.Add(t);

                // yên
                t = new TipFef("yên", "ec"); res.Add(t);
                t = new TipFef("yến", "ed"); res.Add(t);
                t = new TipFef("yền", "ee"); res.Add(t);
                t = new TipFef("yển", "ef"); res.Add(t);
                t = new TipFef("yễn", "ef"); res.Add(t);
                t = new TipFef("yện", "eg"); res.Add(t);

                // iêt
                t = new TipFef("iêt", "eh"); res.Add(t);
                t = new TipFef("iết", "eh"); res.Add(t);
                t = new TipFef("iệt", "ei"); res.Add(t);

                // im
                t = new TipFef("im", "ej"); res.Add(t);
                t = new TipFef("ím", "ek"); res.Add(t);
                t = new TipFef("ìm", "el"); res.Add(t);
                t = new TipFef("ỉm", "em"); res.Add(t);
                t = new TipFef("ĩm", "em"); res.Add(t);
                t = new TipFef("ịm", "en"); res.Add(t);

                // iêm
                t = new TipFef("iêm", "ej"); res.Add(t);
                t = new TipFef("iếm", "ek"); res.Add(t);
                t = new TipFef("iềm", "el"); res.Add(t);
                t = new TipFef("iểm", "em"); res.Add(t);
                t = new TipFef("iễm", "em"); res.Add(t);
                t = new TipFef("iệm", "en"); res.Add(t);

                // êm
                t = new TipFef("êm", "ej"); res.Add(t);
                t = new TipFef("ếm", "ek"); res.Add(t);
                t = new TipFef("ềm", "el"); res.Add(t);
                t = new TipFef("ểm", "em"); res.Add(t);
                t = new TipFef("ễm", "em"); res.Add(t);
                t = new TipFef("ệm", "en"); res.Add(t);

                // in
                t = new TipFef("in", "eo"); res.Add(t);
                t = new TipFef("ín", "ep"); res.Add(t);
                t = new TipFef("ìn", "eq"); res.Add(t);
                t = new TipFef("ỉn", "er"); res.Add(t);
                t = new TipFef("ĩn", "er"); res.Add(t);
                t = new TipFef("ịn", "es"); res.Add(t);

                // inh
                t = new TipFef("inh", "eo"); res.Add(t);
                t = new TipFef("ính", "ep"); res.Add(t);
                t = new TipFef("ình", "eq"); res.Add(t);
                t = new TipFef("ỉnh", "er"); res.Add(t);
                t = new TipFef("ĩnh", "er"); res.Add(t);
                t = new TipFef("ịnh", "es"); res.Add(t);

                // ip
                t = new TipFef("ip", "et"); res.Add(t);
                t = new TipFef("íp", "et"); res.Add(t);
                t = new TipFef("ịp", "eu"); res.Add(t);

                // iêp
                t = new TipFef("iêp", "et"); res.Add(t);
                t = new TipFef("iếp", "et"); res.Add(t);
                t = new TipFef("iệp", "eu"); res.Add(t);

                // it
                t = new TipFef("it", "ev"); res.Add(t);
                t = new TipFef("ít", "ev"); res.Add(t);
                t = new TipFef("ịt", "ew"); res.Add(t);

                // ic
                t = new TipFef("ic", "ev"); res.Add(t);
                t = new TipFef("íc", "ev"); res.Add(t);
                t = new TipFef("ịc", "ew"); res.Add(t);

                // ich
                t = new TipFef("ich", "ev"); res.Add(t);
                t = new TipFef("ích", "ev"); res.Add(t);
                t = new TipFef("ịch", "ew"); res.Add(t);

                // iu
                t = new TipFef("iu", "ex"); res.Add(t);
                t = new TipFef("íu", "ey"); res.Add(t);
                t = new TipFef("ìu", "ez"); res.Add(t);
                t = new TipFef("ỉu", "fa"); res.Add(t);
                t = new TipFef("ĩu", "fa"); res.Add(t);
                t = new TipFef("ịu", "fb"); res.Add(t);

                // iêu
                t = new TipFef("iêu", "ex"); res.Add(t);
                t = new TipFef("iếu", "ey"); res.Add(t);
                t = new TipFef("iều", "ez"); res.Add(t);
                t = new TipFef("iểu", "fa"); res.Add(t);
                t = new TipFef("iễu", "fa"); res.Add(t);
                t = new TipFef("iệu", "fb"); res.Add(t);

                // êu
                t = new TipFef("êu", "ex"); res.Add(t);
                t = new TipFef("ếu", "ey"); res.Add(t);
                t = new TipFef("ều", "ez"); res.Add(t);
                t = new TipFef("ểu", "fa"); res.Add(t);
                t = new TipFef("ễu", "fa"); res.Add(t);
                t = new TipFef("ệu", "fb"); res.Add(t);

                // yêu
                t = new TipFef("yêu", "ex"); res.Add(t);
                t = new TipFef("yếu", "ey"); res.Add(t);
                t = new TipFef("yều", "ez"); res.Add(t);
                t = new TipFef("yểu", "fa"); res.Add(t);
                t = new TipFef("yễu", "fa"); res.Add(t);
                t = new TipFef("yệu", "fb"); res.Add(t);

                // o
                t = new TipFef("o", "fc"); res.Add(t);
                t = new TipFef("ó", "fd"); res.Add(t);
                t = new TipFef("ò", "fe"); res.Add(t);
                t = new TipFef("ỏ", "ff"); res.Add(t);
                t = new TipFef("õ", "ff"); res.Add(t);
                t = new TipFef("ọ", "fg"); res.Add(t);

                // ô
                t = new TipFef("ô", "fh"); res.Add(t);
                t = new TipFef("ố", "fi"); res.Add(t);
                t = new TipFef("ồ", "fj"); res.Add(t);
                t = new TipFef("ổ", "fk"); res.Add(t);
                t = new TipFef("ỗ", "fk"); res.Add(t);
                t = new TipFef("ộ", "fl"); res.Add(t);

                // ơ
                t = new TipFef("ơ", "fm"); res.Add(t);
                t = new TipFef("ớ", "fn"); res.Add(t);
                t = new TipFef("ờ", "fo"); res.Add(t);
                t = new TipFef("ở", "fp"); res.Add(t);
                t = new TipFef("ỡ", "fp"); res.Add(t);
                t = new TipFef("ợ", "fq"); res.Add(t);

                // oa
                t = new TipFef("oa", "fr"); res.Add(t);
                t = new TipFef("oá", "fs"); res.Add(t);
                t = new TipFef("oà", "ft"); res.Add(t);
                t = new TipFef("oả", "fu"); res.Add(t);
                t = new TipFef("oã", "fu"); res.Add(t);
                t = new TipFef("oạ", "fv"); res.Add(t);

                // oan
                t = new TipFef("oan", "fw"); res.Add(t);
                t = new TipFef("oán", "fx"); res.Add(t);
                t = new TipFef("oàn", "fy"); res.Add(t);
                t = new TipFef("oản", "fz"); res.Add(t);
                t = new TipFef("oãn", "fz"); res.Add(t);
                t = new TipFef("oạn", "ga"); res.Add(t);

                // oang
                t = new TipFef("oang", "fw"); res.Add(t);
                t = new TipFef("oáng", "fx"); res.Add(t);
                t = new TipFef("oàng", "fy"); res.Add(t);
                t = new TipFef("oảng", "fz"); res.Add(t);
                t = new TipFef("oãng", "fz"); res.Add(t);
                t = new TipFef("oạng", "ga"); res.Add(t);

                // ??
                t = new TipFef("oân", "gb"); res.Add(t);
                t = new TipFef("oấn", "gc"); res.Add(t);
                t = new TipFef("oần", "gd"); res.Add(t);
                t = new TipFef("oẩn", "ge"); res.Add(t);
                t = new TipFef("oẫn", "ge"); res.Add(t);
                t = new TipFef("oận", "gf"); res.Add(t);

                // oat
                t = new TipFef("oat", "gg"); res.Add(t);
                t = new TipFef("oát", "gg"); res.Add(t);
                t = new TipFef("oạt", "gh"); res.Add(t);

                // oât
                t = new TipFef("oât", "gi"); res.Add(t);
                t = new TipFef("oất", "gi"); res.Add(t);
                t = new TipFef("oật", "gj"); res.Add(t);

                // oâc
                t = new TipFef("oâc", "gi"); res.Add(t);
                t = new TipFef("oấc", "gi"); res.Add(t);
                t = new TipFef("oậc", "gj"); res.Add(t);

                // oăt
                t = new TipFef("oăt", "gi"); res.Add(t);
                t = new TipFef("oắt", "gi"); res.Add(t);
                t = new TipFef("oặt", "gj"); res.Add(t);

                // oăc
                t = new TipFef("oăc", "gi"); res.Add(t);
                t = new TipFef("oắc", "gi"); res.Add(t);
                t = new TipFef("oặc", "gj"); res.Add(t);

                // oay
                t = new TipFef("oay", "gk"); res.Add(t);
                t = new TipFef("oáy", "gl"); res.Add(t);
                t = new TipFef("oày", "gm"); res.Add(t);
                t = new TipFef("oảy", "gn"); res.Add(t);
                t = new TipFef("oãy", "gn"); res.Add(t);
                t = new TipFef("oạy", "go"); res.Add(t);

                // oai
                t = new TipFef("oai", "gk"); res.Add(t);
                t = new TipFef("oái", "gl"); res.Add(t);
                t = new TipFef("oài", "gm"); res.Add(t);
                t = new TipFef("oải", "gn"); res.Add(t);
                t = new TipFef("oãi", "gn"); res.Add(t);
                t = new TipFef("oại", "go"); res.Add(t);

                // oc
                t = new TipFef("oc", "gp"); res.Add(t);
                t = new TipFef("óc", "gp"); res.Add(t);
                t = new TipFef("ọc", "gq"); res.Add(t);

                // ôc
                t = new TipFef("ôc", "gp"); res.Add(t);
                t = new TipFef("ốc", "gp"); res.Add(t);
                t = new TipFef("ộc", "gq"); res.Add(t);

                // oe
                t = new TipFef("oe", "gr"); res.Add(t);
                t = new TipFef("oé", "gs"); res.Add(t);
                t = new TipFef("oè", "gt"); res.Add(t);
                t = new TipFef("oẻ", "gu"); res.Add(t);
                t = new TipFef("oẽ", "gu"); res.Add(t);
                t = new TipFef("oẹ", "gv"); res.Add(t);

                // oi
                t = new TipFef("oi", "gw"); res.Add(t);
                t = new TipFef("ói", "gx"); res.Add(t);
                t = new TipFef("òi", "gy"); res.Add(t);
                t = new TipFef("ỏi", "gz"); res.Add(t);
                t = new TipFef("õi", "gz"); res.Add(t);
                t = new TipFef("ọi", "ha"); res.Add(t);

                // ôi
                t = new TipFef("ôi", "gw"); res.Add(t);
                t = new TipFef("ối", "gx"); res.Add(t);
                t = new TipFef("ồi", "gy"); res.Add(t);
                t = new TipFef("ổi", "gz"); res.Add(t);
                t = new TipFef("ỗi", "gz"); res.Add(t);
                t = new TipFef("ội", "ha"); res.Add(t);

                // om
                t = new TipFef("om", "hb"); res.Add(t);
                t = new TipFef("óm", "hc"); res.Add(t);
                t = new TipFef("òm", "hd"); res.Add(t);
                t = new TipFef("ỏm", "he"); res.Add(t);
                t = new TipFef("õm", "he"); res.Add(t);
                t = new TipFef("ọm", "hf"); res.Add(t);

                // ôm
                t = new TipFef("ôm", "hb"); res.Add(t);
                t = new TipFef("ốm", "hc"); res.Add(t);
                t = new TipFef("ồm", "hd"); res.Add(t);
                t = new TipFef("ổm", "he"); res.Add(t);
                t = new TipFef("ỗm", "he"); res.Add(t);
                t = new TipFef("ộm", "hf"); res.Add(t);

                // ơm
                t = new TipFef("ơm", "hb"); res.Add(t);
                t = new TipFef("ớm", "hc"); res.Add(t);
                t = new TipFef("ờm", "hd"); res.Add(t);
                t = new TipFef("ởm", "he"); res.Add(t);
                t = new TipFef("ỡm", "he"); res.Add(t);
                t = new TipFef("ợm", "hf"); res.Add(t);

                // on
                t = new TipFef("on", "hg"); res.Add(t);
                t = new TipFef("ón", "hh"); res.Add(t);
                t = new TipFef("òn", "hi"); res.Add(t);
                t = new TipFef("ỏn", "hj"); res.Add(t);
                t = new TipFef("õn", "hj"); res.Add(t);
                t = new TipFef("ọn", "hk"); res.Add(t);

                // ôn
                t = new TipFef("ôn", "hl"); res.Add(t);
                t = new TipFef("ốn", "hm"); res.Add(t);
                t = new TipFef("ồn", "hn"); res.Add(t);
                t = new TipFef("ổn", "ho"); res.Add(t);
                t = new TipFef("ỗn", "ho"); res.Add(t);
                t = new TipFef("ộn", "hp"); res.Add(t);

                // ơn
                t = new TipFef("ơn", "hq"); res.Add(t);
                t = new TipFef("ớn", "hr"); res.Add(t);
                t = new TipFef("ờn", "hs"); res.Add(t);
                t = new TipFef("ởn", "ht"); res.Add(t);
                t = new TipFef("ỡn", "ht"); res.Add(t);
                t = new TipFef("ợn", "hu"); res.Add(t);

                // ong
                t = new TipFef("ong", "hv"); res.Add(t);
                t = new TipFef("óng", "hw"); res.Add(t);
                t = new TipFef("òng", "hx"); res.Add(t);
                t = new TipFef("ỏng", "hy"); res.Add(t);
                t = new TipFef("õng", "hy"); res.Add(t);
                t = new TipFef("ọng", "hz"); res.Add(t);

                // ông
                t = new TipFef("ông", "hv"); res.Add(t);
                t = new TipFef("ống", "hw"); res.Add(t);
                t = new TipFef("ồng", "hx"); res.Add(t);
                t = new TipFef("ổng", "hy"); res.Add(t);
                t = new TipFef("ỗng", "hy"); res.Add(t);
                t = new TipFef("ộng", "hz"); res.Add(t);

                // op
                t = new TipFef("op", "ia"); res.Add(t);
                t = new TipFef("óp", "ia"); res.Add(t);
                t = new TipFef("ọp", "ib"); res.Add(t);

                // ơp
                t = new TipFef("ơp", "ia"); res.Add(t);
                t = new TipFef("ớp", "ia"); res.Add(t);
                t = new TipFef("ợp", "ib"); res.Add(t);

                // ộp
                t = new TipFef("ôp", "ia"); res.Add(t);
                t = new TipFef("ốp", "ia"); res.Add(t);
                t = new TipFef("ộp", "ib"); res.Add(t);

                // ot
                t = new TipFef("ot", "ic"); res.Add(t);
                t = new TipFef("ót", "ic"); res.Add(t);
                t = new TipFef("ọt", "id"); res.Add(t);

                // ôt
                t = new TipFef("ôt", "ie"); res.Add(t);
                t = new TipFef("ốt", "ie"); res.Add(t);
                t = new TipFef("ột", "if"); res.Add(t);

                // ơt
                t = new TipFef("ơt", "ig"); res.Add(t);
                t = new TipFef("ớt", "ig"); res.Add(t);
                t = new TipFef("ợt", "ih"); res.Add(t);

                // u
                t = new TipFef("u", "ii"); res.Add(t);
                t = new TipFef("ú", "ij"); res.Add(t);
                t = new TipFef("ù", "ik"); res.Add(t);
                t = new TipFef("ủ", "il"); res.Add(t);
                t = new TipFef("ũ", "il"); res.Add(t);
                t = new TipFef("ụ", "im"); res.Add(t);

                // u
                t = new TipFef("ưu", "ii"); res.Add(t);
                t = new TipFef("ứu", "ij"); res.Add(t);
                t = new TipFef("ừu", "ik"); res.Add(t);
                t = new TipFef("ửu", "il"); res.Add(t);
                t = new TipFef("ữu", "il"); res.Add(t);
                t = new TipFef("ựu", "im"); res.Add(t);

                // ư
                t = new TipFef("ư", "in"); res.Add(t);
                t = new TipFef("ứ", "io"); res.Add(t);
                t = new TipFef("ừ", "ip"); res.Add(t);
                t = new TipFef("ử", "iq"); res.Add(t);
                t = new TipFef("ữ", "iq"); res.Add(t);
                t = new TipFef("ự", "ir"); res.Add(t);

                // ua
                t = new TipFef("ua", "is"); res.Add(t);
                t = new TipFef("úa", "it"); res.Add(t);
                t = new TipFef("ùa", "iu"); res.Add(t);
                t = new TipFef("ủa", "iv"); res.Add(t);
                t = new TipFef("ũa", "iv"); res.Add(t);
                t = new TipFef("ụa", "iw"); res.Add(t);

                // ưa
                t = new TipFef("ưa", "ix"); res.Add(t);
                t = new TipFef("ứa", "iy"); res.Add(t);
                t = new TipFef("ừa", "iz"); res.Add(t);
                t = new TipFef("ửa", "ja"); res.Add(t);
                t = new TipFef("ữa", "ja"); res.Add(t);
                t = new TipFef("ựa", "jb"); res.Add(t);

                // uân
                t = new TipFef("uân", "jc"); res.Add(t);
                t = new TipFef("uấn", "jd"); res.Add(t);
                t = new TipFef("uần", "je"); res.Add(t);
                t = new TipFef("uẩn", "jf"); res.Add(t);
                t = new TipFef("uẫn", "jf"); res.Add(t);
                t = new TipFef("uận", "jg"); res.Add(t);

                // uât
                t = new TipFef("uât", "jh"); res.Add(t);
                t = new TipFef("uất", "jh"); res.Add(t);
                t = new TipFef("uật", "ji"); res.Add(t);

                // uê
                t = new TipFef("uê", "jj"); res.Add(t);
                t = new TipFef("uế", "jk"); res.Add(t);
                t = new TipFef("uề", "jl"); res.Add(t);
                t = new TipFef("uể", "jm"); res.Add(t);
                t = new TipFef("uễ", "jm"); res.Add(t);
                t = new TipFef("uệ", "jn"); res.Add(t);

                // ui
                t = new TipFef("ui", "jo"); res.Add(t);
                t = new TipFef("úi", "jp"); res.Add(t);
                t = new TipFef("ùi", "jq"); res.Add(t);
                t = new TipFef("ủi", "jr"); res.Add(t);
                t = new TipFef("ũi", "jr"); res.Add(t);
                t = new TipFef("ụi", "js"); res.Add(t);

                // ui
                t = new TipFef("ui", "jo"); res.Add(t);
                t = new TipFef("úi", "jp"); res.Add(t);
                t = new TipFef("ùi", "jq"); res.Add(t);
                t = new TipFef("ủi", "jr"); res.Add(t);
                t = new TipFef("ũi", "jr"); res.Add(t);
                t = new TipFef("ụi", "js"); res.Add(t);

                // uôi
                t = new TipFef("uôi", "jo"); res.Add(t);
                t = new TipFef("uối", "jp"); res.Add(t);
                t = new TipFef("uồi", "jq"); res.Add(t);
                t = new TipFef("uổi", "jr"); res.Add(t);
                t = new TipFef("uỗi", "jr"); res.Add(t);
                t = new TipFef("uội", "js"); res.Add(t);

                // um
                t = new TipFef("um", "jt"); res.Add(t);
                t = new TipFef("úm", "ju"); res.Add(t);
                t = new TipFef("ùm", "jv"); res.Add(t);
                t = new TipFef("ủm", "jw"); res.Add(t);
                t = new TipFef("ũm", "jw"); res.Add(t);
                t = new TipFef("ụm", "jx"); res.Add(t);

                // ung
                t = new TipFef("ung", "jy"); res.Add(t);
                t = new TipFef("úng", "jz"); res.Add(t);
                t = new TipFef("ùng", "ka"); res.Add(t);
                t = new TipFef("ủng", "kb"); res.Add(t);
                t = new TipFef("ũng", "kb"); res.Add(t);
                t = new TipFef("ụng", "kc"); res.Add(t);

                // ưng
                t = new TipFef("ưng", "kd"); res.Add(t);
                t = new TipFef("ứng", "ke"); res.Add(t);
                t = new TipFef("ừng", "kf"); res.Add(t);
                t = new TipFef("ửng", "kg"); res.Add(t);
                t = new TipFef("ững", "kg"); res.Add(t);
                t = new TipFef("ựng", "kh"); res.Add(t);

                // ươi
                t = new TipFef("ươi", "ki"); res.Add(t);
                t = new TipFef("ưới", "kj"); res.Add(t);
                t = new TipFef("ười", "kk"); res.Add(t);
                t = new TipFef("ưởi", "kl"); res.Add(t);
                t = new TipFef("ưỡi", "kl"); res.Add(t);
                t = new TipFef("ượi", "km"); res.Add(t);

                // ưi
                t = new TipFef("ưi", "ki"); res.Add(t);
                t = new TipFef("ứi", "kj"); res.Add(t);
                t = new TipFef("ừi", "kk"); res.Add(t);
                t = new TipFef("ửi", "kl"); res.Add(t);
                t = new TipFef("ữi", "kl"); res.Add(t);
                t = new TipFef("ựi", "km"); res.Add(t);

                // uôm
                t = new TipFef("uôm", "kn"); res.Add(t);
                t = new TipFef("uốm", "ko"); res.Add(t);
                t = new TipFef("uồm", "kp"); res.Add(t);
                t = new TipFef("uổm", "kq"); res.Add(t);
                t = new TipFef("uỗm", "kq"); res.Add(t);
                t = new TipFef("uộm", "kr"); res.Add(t);

                // uơm
                t = new TipFef("uơm", "kn"); res.Add(t);
                t = new TipFef("uớm", "ko"); res.Add(t);
                t = new TipFef("uờm", "kp"); res.Add(t);
                t = new TipFef("uởm", "kq"); res.Add(t);
                t = new TipFef("uỡm", "kq"); res.Add(t);
                t = new TipFef("uợm", "kr"); res.Add(t);

                // uôn
                t = new TipFef("uôn", "ks"); res.Add(t);
                t = new TipFef("uốn", "kt"); res.Add(t);
                t = new TipFef("uồn", "ku"); res.Add(t);
                t = new TipFef("uổn", "kv"); res.Add(t);
                t = new TipFef("uỗn", "kv"); res.Add(t);
                t = new TipFef("uộn", "kw"); res.Add(t);

                // uông
                t = new TipFef("uông", "ks"); res.Add(t);
                t = new TipFef("uống", "kt"); res.Add(t);
                t = new TipFef("uồng", "ku"); res.Add(t);
                t = new TipFef("uổng", "kv"); res.Add(t);
                t = new TipFef("uỗng", "kv"); res.Add(t);
                t = new TipFef("uộng", "kw"); res.Add(t);

                // ươn
                t = new TipFef("ươn", "kx"); res.Add(t);
                t = new TipFef("ướn", "ky"); res.Add(t);
                t = new TipFef("ườn", "kz"); res.Add(t);
                t = new TipFef("ưởn", "la"); res.Add(t);
                t = new TipFef("ưỡn", "la"); res.Add(t);
                t = new TipFef("ượn", "lb"); res.Add(t);

                // ương
                t = new TipFef("ương", "kx"); res.Add(t);
                t = new TipFef("ướng", "ky"); res.Add(t);
                t = new TipFef("ường", "kz"); res.Add(t);
                t = new TipFef("ưởng", "la"); res.Add(t);
                t = new TipFef("ưỡng", "la"); res.Add(t);
                t = new TipFef("ượng", "lb"); res.Add(t);

                // ươp
                t = new TipFef("ươp", "lc"); res.Add(t);
                t = new TipFef("ướp", "lc"); res.Add(t);
                t = new TipFef("ượp", "ld"); res.Add(t);

                // uôt
                t = new TipFef("uôt", "le"); res.Add(t);
                t = new TipFef("uốt", "le"); res.Add(t);
                t = new TipFef("uột", "lf"); res.Add(t);

                // uôc
                t = new TipFef("uôc", "le"); res.Add(t);
                t = new TipFef("uốc", "le"); res.Add(t);
                t = new TipFef("uộc", "lf"); res.Add(t);

                // ươt
                t = new TipFef("ươt", "lg"); res.Add(t);
                t = new TipFef("ướt", "lg"); res.Add(t);
                t = new TipFef("ượt", "lh"); res.Add(t);

                // ươc
                t = new TipFef("ươc", "lg"); res.Add(t);
                t = new TipFef("ước", "lg"); res.Add(t);
                t = new TipFef("ược", "lh"); res.Add(t);

                // up
                t = new TipFef("up", "li"); res.Add(t);
                t = new TipFef("úp", "li"); res.Add(t);
                t = new TipFef("ụp", "lj"); res.Add(t);

                // ut
                t = new TipFef("ut", "lk"); res.Add(t);
                t = new TipFef("út", "lk"); res.Add(t);
                t = new TipFef("ụt", "ll"); res.Add(t);

                // uc
                t = new TipFef("uc", "lk"); res.Add(t);
                t = new TipFef("úc", "lk"); res.Add(t);
                t = new TipFef("ục", "ll"); res.Add(t);

                // ưt
                t = new TipFef("ưt", "lm"); res.Add(t);
                t = new TipFef("ứt", "lm"); res.Add(t);
                t = new TipFef("ựt", "ln"); res.Add(t);

                // ưc
                t = new TipFef("ưc", "lm"); res.Add(t);
                t = new TipFef("ức", "lm"); res.Add(t);
                t = new TipFef("ực", "ln"); res.Add(t);

                // uy
                t = new TipFef("uy", "lo"); res.Add(t);
                t = new TipFef("uý", "lp"); res.Add(t);
                t = new TipFef("uỳ", "lq"); res.Add(t);
                t = new TipFef("uỷ", "lr"); res.Add(t);
                t = new TipFef("uỹ", "lr"); res.Add(t);
                t = new TipFef("uỵ", "ls"); res.Add(t);

                // uyên
                t = new TipFef("uyên", "lt"); res.Add(t);
                t = new TipFef("uyến", "lu"); res.Add(t);
                t = new TipFef("uyền", "lv"); res.Add(t);
                t = new TipFef("uyển", "lw"); res.Add(t);
                t = new TipFef("uyễn", "lw"); res.Add(t);
                t = new TipFef("uyện", "lx"); res.Add(t);

                // uyêt
                t = new TipFef("uyêt", "ly"); res.Add(t);
                t = new TipFef("uyết", "ly"); res.Add(t);
                t = new TipFef("uyệt", "lz"); res.Add(t);

                // uynh
                t = new TipFef("uynh", "ma"); res.Add(t);
                t = new TipFef("uýnh", "mb"); res.Add(t);
                t = new TipFef("uỳnh", "mc"); res.Add(t);
                t = new TipFef("uỷnh", "md"); res.Add(t);
                t = new TipFef("uỹnh", "md"); res.Add(t);
                t = new TipFef("uỵnh", "me"); res.Add(t);

                // uây
                t = new TipFef("uây", "mf"); res.Add(t);
                t = new TipFef("uấy", "mg"); res.Add(t);
                t = new TipFef("uầy", "mh"); res.Add(t);
                t = new TipFef("uẩy", "mi"); res.Add(t);
                t = new TipFef("uẫy", "mj"); res.Add(t);
                t = new TipFef("uậy", "mk"); res.Add(t);

                return res;
            }
        }

        #endregion

        #region -- Classes --

        /// <summary>
        /// Tip fef
        /// </summary>
        private class TipFef
        {
            /// <summary>
            /// Ecq tbs
            /// </summary>
            /// <param name="vei">Vei</param>
            /// <param name="zng">ZnG</param>
            public TipFef(string vei, string zng)
            {
                Vei = vei;
                Zng = zng;
            }

            /// <summary>
            /// Ioz Vei
            /// </summary>
            public string Vei { get; set; }

            /// <summary>
            /// Ioz ZnG
            /// </summary>
            public string Zng { get; set; }
        }

        #endregion
    }
}