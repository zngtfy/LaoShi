#region Information
/*
 * Author       : HaoLee
 * Email        : occbuu@gmail.com
 * Phone        : +84 919 004 169
 * ------------------------------- *
 * Create       : 2019-Oct-19 04:24
 * Update       : 2019-Oct-19 04:24
 * Checklist    : 1.0
 * Status       : Done
 */
#endregion

using Newtonsoft.Json;
using SKG;
using SKG.BLL;
using SKG.Ext;
using SKG.Req;
using SKG.Rsp;
using System;
using System.Collections.Generic;
using System.Linq;

namespace YEX.BLL
{
    using DAL;
    using DAL.Models;
    using Filter;

    public class ExamSvc : GenericSvc<ExamRep, Exam>
    {
        #region -- Overrides --


        #endregion

        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public ExamSvc()
        {
        }

        
        #endregion
    }
}
