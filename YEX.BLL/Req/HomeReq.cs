using System;
using System.Collections.Generic;
using System.Text;
using YEX.BLL.Filter;

namespace YEX.BLL.Req
{
    public class HomeReq
    {
        #region -- Properties --

        /// <summary>
        /// Page
        /// </summary>
        public int Page { get; set; }

        /// <summary>
        /// Size
        /// </summary>
        public int Size { get; set; }

        /// <summary>
        /// Filter
        /// </summary>
        public NewsFilter Filter { get; set; }

        #endregion
    }

    public class IntroReq
    {
        #region -- Properties --

        public int Id { get; set; }
        public string Type { get; set; }
        public string Keyword { get; set; }
        /// <summary>
        /// Page
        /// </summary>
        public int Page { get; set; }

        /// <summary>
        /// Size
        /// </summary>
        public int Size { get; set; }

        #endregion
    }

    public class ClassAssignmentExamReq
    {
        #region -- Properties --
        public int ClassAssignmentId { get; set; }
        public int UserId { get; set; }
        public int Page { get; set; }
        public int Size { get; set; }
        #endregion
    }

    public class ExamReq
    {
        #region -- Properties --
        public int ExamId { get; set; }
        public int UserId { get; set; }
        public int Page { get; set; }
        public int Size { get; set; }
        #endregion
    }

    public class StudentAnswersReq
    {
        #region -- Properties --
        public int ClassAssignmentId { get; set; }
        public int ExamId { get; set; }
        public int UserId { get; set; }

        public DateTime? StartTime { get; set; }
        public DateTime? EndTime { get; set; }
        public List<QuesAns> ListAns { get; set; }
        #endregion
    }

    public class QuesAns
    {
        public int QuestionId { get; set; }
        public string QuestionType { get; set; }
        public int? TotScore { get; set; }
        public int? TotMinutes { get; set; }
        public List<int> AnswerIds { get; set; }
    }
}
