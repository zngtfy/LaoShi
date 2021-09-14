#region Information
/*
 * Author       : ZngTfy
 * Email        : toan.nguyen@tanvieta.co
 * Phone        : +84 345 515 010
 * ------------------------------- *
 * Create       : 2019-Nov-29 17:24
 * Update       : 2019-Nov-29 17:24
 * Checklist    : 1.0
 * Status       : Done
 */
#endregion

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;

namespace SKG.Ext
{
    using DAL.Dto;

    /// <summary>
    /// Extend for the List
    /// </summary>
    public static class ListExt
    {
        #region -- Common --

        /// <summary>
        /// Convert from IEnumerable (LINQ, List object) to DataTable
        /// </summary>
        /// <typeparam name="T">Class</typeparam>
        /// <param name="d">Data</param>
        /// <param name="s">Table name</param>
        /// <returns>Return a DataTable</returns>
        public static DataTable ToDataTable<T>(this IEnumerable<T> d, string s = ZConst.String.Blank)
        {
            var res = new DataTable(s);

            var props = typeof(T).GetProperties();
            foreach (var i in props)
            {
                var type = i.PropertyType;
                if ((type.IsGenericType) && (type.GetGenericTypeDefinition() == typeof(Nullable<>)))
                {
                    type = type.GetGenericArguments()[0];
                }
                res.Columns.Add(new DataColumn(i.Name, type));
            }

            foreach (var i in d)
            {
                var r = res.NewRow();

                foreach (var prop in props)
                {
                    r[prop.Name] = prop.GetValue(i, null) ?? DBNull.Value;
                }

                res.Rows.Add(r);
            }
            res.AcceptChanges();

            return res;
        }

        /// <summary>
        /// Create CSV file from list
        /// </summary>
        /// <typeparam name="T">Data type</typeparam>
        /// <param name="list">Data list</param>
        /// <param name="file">Full path file name</param>
        /// <returns>Return status can create or not</returns>
        public static bool ToCsv<T>(this List<T> list, string file)
        {
            try
            {
                if (list == null || list.Count == 0)
                {
                    var sw = new StreamWriter(file);
                    sw.Write("No data.");
                }

                // Get type from 0th member
                var type = list[0].GetType();
                var newLine = Environment.NewLine;

                using (var sw = new StreamWriter(file))
                {
                    // Make a new instance of the class name we figured out to get its props
                    var o = Activator.CreateInstance(type);

                    // Gets all properties
                    var props = o.GetType().GetProperties();

                    // Foreach of the properties in class above, write out properties
                    // this is the header row
                    foreach (var i in props)
                    {
                        sw.Write(i.Name.ToUpper() + ZConst.String.Comma);
                    }
                    sw.Write(newLine);

                    // This acts as datarow
                    foreach (T i in list)
                    {
                        // This acts as datacolumn
                        foreach (var j in props)
                        {
                            // This is the row+col intersection (the value)
                            var t = i.GetType().GetProperty(j.Name).GetValue(i, null) + string.Empty;
                            var res = t.Replace(ZConst.Char.Comma, ZConst.Char.Space) + ZConst.Char.Comma;

                            sw.Write(res);
                        }
                        sw.Write(newLine);
                    }
                }
            }
            catch { return false; }

            return true;
        }

        #endregion

        #region -- LINQ --

        /// <summary>
        /// Get And expression
        /// </summary>
        /// <typeparam name="T">Model class type</typeparam>
        /// <param name="o">Expression</param>
        /// <param name="e">Or expression</param>
        /// <returns>Return the Or expression</returns>
        public static Expression<Func<T, bool>> Or<T>(this Expression<Func<T, bool>> o, Expression<Func<T, bool>> e)
        {
            if (o == null)
            {
                return e;
            }

            Replace(e, e.Parameters[0], o.Parameters[0]);
            var t = Expression.Or(o.Body, e.Body);
            var res = Expression.Lambda<Func<T, bool>>(t, o.Parameters);

            return res;
        }

        /// <summary>
        /// Get And expression
        /// </summary>
        /// <typeparam name="T">Model class type</typeparam>
        /// <param name="o">Expression</param>
        /// <param name="e">And expression</param>
        /// <returns>Return the And expression</returns>
        public static Expression<Func<T, bool>> And<T>(this Expression<Func<T, bool>> o, Expression<Func<T, bool>> e)
        {
            if (o == null)
            {
                return e;
            }

            Replace(e, e.Parameters[0], o.Parameters[0]);
            var t = Expression.And(o.Body, e.Body);
            var res = Expression.Lambda<Func<T, bool>>(t, o.Parameters);

            return res;
        }

        /// <summary>
        /// Sort query
        /// </summary>
        /// <typeparam name="T">Model class type</typeparam>
        /// <param name="o">Query</param>
        /// <param name="sorts">List field sort</param>
        /// <returns>Return the sort query</returns>
        public static IOrderedQueryable<T> Sort<T>(this IOrderedQueryable<T> o, List<SortDto> sorts)
        {
            var res = o;

            try
            {
                if (sorts == null)
                {
                    sorts = new List<SortDto>();
                }

                var param = Expression.Parameter(typeof(T));
                foreach (var i in sorts)
                {
                    var property = Expression.PropertyOrField(param, i.Field);
                    var sort = Expression.Lambda(property, param);

                    var direction = string.Empty;
                    if (i.Direction != ListSortDirection.Ascending.ToString())
                    {
                        direction = ListSortDirection.Descending.ToString();
                    }

                    var method = sorts.IndexOf(i) == 0 ? "OrderBy" : "ThenBy";
                    method += direction;

                    var t1 = new[] { typeof(T), property.Type };
                    var t2 = Expression.Quote(sort);
                    var t3 = Expression.Call(typeof(Queryable), method, t1, o.Expression, t2);
                    res = (IOrderedQueryable<T>)o.Provider.CreateQuery<T>(t3);
                }
            }
            catch { }

            return res;
        }

        /// <summary>
        /// Replace object support Or and And method
        /// </summary>
        /// <param name="o">Current instance object</param>
        /// <param name="old">Old object</param>
        /// <param name="new">New object</param>
        private static void Replace(object o, object old, object @new)
        {
            var flag = BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Instance;
            for (var i = o.GetType(); i != null; i = i.BaseType)
            {
                var t = i.GetFields(flag);
                foreach (var j in t)
                {
                    var val = j.GetValue(o);
                    if (val != null && val.GetType().Assembly == typeof(Expression).Assembly)
                    {
                        if (object.ReferenceEquals(val, old))
                        {
                            j.SetValue(o, @new);
                        }
                        else
                        {
                            Replace(val, old, @new);
                        }
                    }
                }
            }
        }

        #endregion
    }
}