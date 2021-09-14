#region Information
/*
 * Author       : ZngTfy
 * Email        : toan.nguyen@tanvieta.co
 * Phone        : +84 345 515 010
 * ------------------------------- *
 * Create       : 2020-Jan-19 22:33
 * Update       : 2020-Jan-19 22:33
 * Checklist    : 1.0
 * Status       : Done
 */
#endregion

using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;

namespace SKG.Ext
{
    using DAL.Dto;

    /// <summary>
    /// Extend for database
    /// </summary>
    public static class DbExt
    {
        #region -- Common --

        /// <summary>
        /// Execute query
        /// </summary>
        /// <typeparam name="T">Data transfer object class type</typeparam>
        /// <param name="db">Database</param>
        /// <param name="q">Query</param>
        /// <param name="p">Parameters</param>
        /// <param name="m">Mapping</param>
        /// <returns>Return the result</returns>
        public static List<T> ExecuteQuery<T>(this DatabaseFacade db, string q, List<ParameterDto> p, Func<DbDataReader, T> m)
        {
            var res = new List<T>();

            using var cmd = db.GetDbConnection().CreateCommand();
            cmd.CommandText = q;
            cmd.CommandType = CommandType.Text;

            foreach (var i in p)
            {
                var pa = cmd.CreateParameter();
                pa.ParameterName = i.Name;
                pa.Value = i.Value;
                cmd.Parameters.Add(pa);
            }

            db.OpenConnection();

            using var r = cmd.ExecuteReader();
            while (r.Read())
            {
                res.Add(m(r));
            }

            return res;
        }

        /// <summary>
        /// Execute non-query
        /// </summary>
        /// <param name="db">Database</param>
        /// <param name="q">Query</param>
        /// <param name="p">Parameters</param>
        /// <returns>Return the result</returns>
        public static int ExecuteNonQuery(this DatabaseFacade db, string q, List<ParameterDto> p)
        {
            using var cmd = db.GetDbConnection().CreateCommand();
            cmd.CommandText = q;
            cmd.CommandType = CommandType.Text;

            foreach (var i in p)
            {
                var pa = cmd.CreateParameter();
                pa.ParameterName = i.Name;
                pa.Value = i.Value;
                cmd.Parameters.Add(pa);
            }

            db.OpenConnection();

            var res = cmd.ExecuteNonQuery();
            return res;
        }

        #endregion
    }
}