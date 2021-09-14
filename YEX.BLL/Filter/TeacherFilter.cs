using System;
using System.Collections.Generic;
using System.Text;

namespace YEX.BLL.Filter
{
    public class TeacherFilter
    {
        public TeacherFilter() { }

        #region -- Properties --

        /// <summary>
        /// Group id
        /// </summary>
        public int? GroupId { get; set; }

        /// <summary>
        /// Keyword
        /// </summary>
        public string Keyword { get; set; }

        #endregion
    }
}
