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

using System;
using System.Reflection;

namespace SKG.Ext
{
    /// <summary>
    /// Extend for the object
    /// </summary>
    public static class ObjectExt
    {
        #region -- Common --

        /// <summary>
        /// Check a property exist in object
        /// </summary>
        /// <param name="o">Object</param>
        /// <param name="p">Property name</param>
        /// <returns>Return the result</returns>
        public static bool HasProperty(this object o, string p)
        {
            var t = o.GetType().GetProperty(p);
            return t != null;
        }

        /// <summary>
        /// Get value if a property exist in object
        /// </summary>
        /// <param name="o">Object</param>
        /// <param name="p">Property name</param>
        /// <returns>Return the result</returns>
        public static object GetPropertyValue(this object o, string p)
        {
            object res = null;

            var t = o.GetType().GetProperty(p);
            if (t != null)
            {
                res = t.GetValue(o);
            }

            return res;
        }

        /// <summary>
        /// Set value if a property exist in object
        /// </summary>
        /// <param name="o">Object</param>
        /// <param name="p">Property name</param>
        /// <param name="value">Value need to set</param>
        public static void SetPropertyValue(this object o, string p, object value)
        {
            var t = o.GetType().GetProperty(p);
            if (t != null)
            {
                t.SetValue(o, value, null);
            }
        }

        /// <summary>
        /// Compare all properties data from source to destination
        /// </summary>
        /// <param name="fr">Source</param>
        /// <param name="to">Destination</param>
        /// <returns>Return true if it is same, else false</returns>
        public static bool Same(this object fr, object to)
        {
            if (fr.GetType() != to.GetType())
            {
                return false;
            }

            var binding = BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.Public;

            // Compare number of private and public methods
            var originalMethods = fr.GetType().GetMethods(binding);
            var comparedMethods = to.GetType().GetMethods(binding);
            if (comparedMethods.Length != originalMethods.Length)
            {
                return false;
            }

            // Compare number of private and public properties
            var originalProperties = fr.GetType().GetProperties(binding);
            var comparedProperties = to.GetType().GetProperties(binding);
            if (comparedProperties.Length != originalProperties.Length)
            {
                return false;
            }

            // Compare number of public and private fields
            var originalFields = fr.GetType().GetFields(binding);
            var comparedToFields = to.GetType().GetFields(binding);
            if (comparedToFields.Length != originalFields.Length)
            {
                return false;
            }

            // Compare each field values
            var t = BindingFlags.GetField | binding;
            foreach (var i in originalFields)
            {
                // Check to see if the object to contains the field
                var comparedObj = to.GetType().GetField(i.Name, binding);
                if (comparedObj == null)
                {
                    return false;
                }

                // Get the value of the field from the original object
                var value = fr.GetType().InvokeMember(i.Name, t, null, fr, null);

                // Get the value of the field
                var comparedValue = to.GetType().InvokeMember(comparedObj.Name, t, null, to, null);

                // Now compare the field values
                if (value != null && comparedValue != null)
                {
                    if (value.GetType() != comparedValue.GetType())
                    {
                        return false;
                    }

                    if (!value.ToString().Equals(comparedValue.ToString()))
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
            }

            // Compare each property values
            t = BindingFlags.GetProperty | binding;
            foreach (var i in originalProperties)
            {
                // Check to see if the object to contains the field
                var comparedObj = to.GetType().GetProperty(i.Name, binding);
                if (comparedObj == null)
                {
                    return false;
                }

                // Get the value of the property from the original object
                var value = fr.GetType().InvokeMember(i.Name, t, null, fr, null);

                // Get the value of the property
                var comparedValue = to.GetType().InvokeMember(comparedObj.Name, t, null, to, null);

                // Now compare the property values
                if (value != null && comparedValue != null)
                {
                    if (value.GetType() != comparedValue.GetType())
                    {
                        return false;
                    }

                    if (!value.ToString().Equals(comparedValue.ToString()))
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
            }

            return true;
        }

        #endregion

        #region -- Numeric --

        /// <summary>
        /// Check is numeric
        /// </summary>
        /// <param name="o">Object need to check</param>
        /// <returns>Return is is numeric or not</returns>
        public static bool IsNumeric(this object o)
        {
            if (o == null || o is DateTime || o is Boolean)
            {
                return false;
            }

            if (o is Int16 || o is Int32 || o is Int64)
            {
                return true;
            }

            if (o is Decimal || o is Single || o is Double || o is Boolean)
            {
                return true;
            }

            try
            {
                decimal.Parse(o.ToString());
                return true;
            }
            catch { return false; }
        }

        /// <summary>
        /// Converts the specified object representation of a number to an equivalent 32-bit signed integer
        /// </summary>
        /// <param name="o">String number</param>
        /// <returns>Return the number</returns>
        public static int ToInt32(this object o)
        {
            var res = 0;

            var t = o + string.Empty;
            int.TryParse(t, out int i);
            res = i;

            return res;
        }

        /// <summary>
        /// Converts the specified object representation of a number to an equivalent 32-bit signed integer
        /// </summary>
        /// <param name="o">String number</param>
        /// <returns>Return the number (nullable)</returns>
        public static int? ToInt32Null(this object o)
        {
            int? res = null;

            if (o != null)
            {
                var t = o + string.Empty;
                if (!string.IsNullOrEmpty(t))
                {
                    res = o.ToInt32();
                }
            }

            return res;
        }

        /// <summary>
        /// Converts the specified object representation of a number to an equivalent 64-bit signed integer
        /// </summary>
        /// <param name="o">String number</param>
        /// <returns>Return the number</returns>
        public static long ToInt64(this object o)
        {
            var res = 0L;

            var t = o + string.Empty;
            long.TryParse(t, out long i);
            res = i;

            return res;
        }

        /// <summary>
        /// Converts the specified object representation of a number to an equivalent 64-bit signed integer
        /// </summary>
        /// <param name="o">String number</param>
        /// <returns>Return the number (nullable)</returns>
        public static long? ToInt64Null(this object o)
        {
            long? res = null;

            if (o != null)
            {
                var t = o + string.Empty;
                if (!string.IsNullOrEmpty(t))
                {
                    res = o.ToInt64();
                }
            }

            return res;
        }

        /// <summary>
        /// Converts the specified object representation of a number to an equivalent float number
        /// </summary>
        /// <param name="o">String number</param>
        /// <returns>Return the number</returns>
        public static float ToFloat(this object o)
        {
            var res = 0F;

            var t = o + string.Empty;
            float.TryParse(t, out float i);
            res = i;

            return res;
        }

        /// <summary>
        /// Converts the specified object representation of a number to an equivalent float number
        /// </summary>
        /// <param name="o">String number</param>
        /// <returns>Return the number (nullable)</returns>
        public static float? ToFloatNull(this object o)
        {
            float? res = null;

            if (o != null)
            {
                var t = o + string.Empty;
                if (!string.IsNullOrEmpty(t))
                {
                    res = o.ToFloat();
                }
            }

            return res;
        }

        /// <summary>
        /// Converts the specified object representation of a number to an equivalent double number
        /// </summary>
        /// <param name="o">String number</param>
        /// <returns>Return the number</returns>
        public static double ToDouble(this object o)
        {
            var res = 0D;

            var t = o + string.Empty;
            double.TryParse(t, out double i);
            res = i;

            return res;
        }

        /// <summary>
        /// Converts the specified object representation of a number to an equivalent double number
        /// </summary>
        /// <param name="o">String number</param>
        /// <returns>Return the number (nullable)</returns>
        public static double? ToDoubleNull(this object o)
        {
            double? res = null;

            if (o != null)
            {
                var t = o + string.Empty;
                if (!string.IsNullOrEmpty(t))
                {
                    res = o.ToDouble();
                }
            }

            return res;
        }

        /// <summary>
        /// Converts the specified object representation of a number to an equivalent decimal number
        /// </summary>
        /// <param name="o">String number</param>
        /// <returns>Return the number</returns>
        public static decimal ToDecimal(this object o)
        {
            var res = 0M;

            var t = o + string.Empty;
            decimal.TryParse(t, out decimal i);
            res = i;

            return res;
        }

        /// <summary>
        /// Converts the specified object representation of a number to an equivalent decimal number
        /// </summary>
        /// <param name="o">String number</param>
        /// <returns>Return the number (nullable)</returns>
        public static decimal? ToDecimalNull(this object o)
        {
            decimal? res = null;

            if (o != null)
            {
                var t = o + string.Empty;
                if (!string.IsNullOrEmpty(t))
                {
                    res = o.ToDecimal();
                }
            }

            return res;
        }

        #endregion

        #region -- Boolean --

        /// <summary>
        /// Converts the specified object representation of a boolean to an equivalent boolean
        /// </summary>
        /// <param name="o">String boolean</param>
        /// <returns>Return the boolean</returns>
        public static bool ToBool(this object o)
        {
            var res = false;

            var t = o + string.Empty;
            bool.TryParse(t, out bool i);
            res = i;

            return res;
        }

        /// <summary>
        /// Converts the specified object representation of a boolean to an equivalent boolean
        /// </summary>
        /// <param name="o">String boolean</param>
        /// <returns>Return the boolean (nullable)</returns>
        public static bool? ToBoolNull(this object o)
        {
            bool? res = null;

            if (o != null)
            {
                var t = o + string.Empty;
                if (!string.IsNullOrEmpty(t))
                {
                    res = o.ToBool();
                }
            }

            return res;
        }

        #endregion

        #region -- DateTime --

        /// <summary>
        /// Converts the specified object representation of a DateTime to an equivalent DateTime
        /// </summary>
        /// <param name="o">String DateTime</param>
        /// <returns>Return the DateTime</returns>
        public static DateTime ToDateTime(this object o)
        {
            var res = DateTime.Now;

            var t = o + string.Empty;
            DateTime.TryParse(t, out DateTime i);
            res = i;

            return res;
        }

        /// <summary>
        /// Converts the specified object representation of a DateTime to an equivalent DateTime
        /// </summary>
        /// <param name="o">String DateTime</param>
        /// <returns>Return the DateTime (nullable)</returns>
        public static DateTime? ToDateTimeNull(this object o)
        {
            DateTime? res = null;

            if (o != null)
            {
                var t = o + string.Empty;
                if (!string.IsNullOrEmpty(t))
                {
                    res = o.ToDateTime();
                }
            }

            return res;
        }

        #endregion

        #region -- Guid --

        /// <summary>
        /// Converts the specified object representation of a Guid to an equivalent Guid
        /// </summary>
        /// <param name="o">String Guid</param>
        /// <returns>Return the Guid</returns>
        public static Guid ToGuid(this object o)
        {
            var res = Guid.Empty;

            var t = o + string.Empty;
            Guid.TryParse(t, out Guid i);
            res = i;

            return res;
        }

        /// <summary>
        /// Converts the specified object representation of a Guid to an equivalent Guid
        /// </summary>
        /// <param name="o">String Guid</param>
        /// <returns>Return the Guid (nullable)</returns>
        public static Guid? ToGuidNull(this object o)
        {
            Guid? res = null;

            if (o != null)
            {
                var t = o + string.Empty;
                if (!string.IsNullOrEmpty(t))
                {
                    res = o.ToGuid();
                }
            }

            return res;
        }

        #endregion

        #region -- String --

        /// <summary>
        /// Convert the object to string with format
        /// </summary>
        /// <param name="o">Object</param>
        /// <param name="f">Format type</param>
        /// <returns>Return the string</returns>
        public static string ToStr(this object o, ZEnum.Format f = ZEnum.Format.Orginal)
        {
            try
            {
                var t = o.ToStr();
                switch (f)
                {
                    case ZEnum.Format.Sentence:
                        return t.ToUpperFirst();

                    case ZEnum.Format.Lower:
                        return t.ToLower();

                    case ZEnum.Format.Upper:
                        return t.ToUpper();

                    case ZEnum.Format.Capitalized:
                        return t.ToUpperWords();

                    default:
                        return t;
                }
            }
            catch
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// Convert the object to string
        /// </summary>
        /// <param name="o">Object</param>
        /// <returns>Return the string</returns>
        public static string ToStr(this object o)
        {
            var res = o == null ? string.Empty : o.ToString();
            return res;
        }

        #endregion
    }
}