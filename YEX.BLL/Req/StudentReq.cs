using System;
using System.Collections.Generic;
using System.Text;

namespace YEX.BLL.Req
{
    public class StudentReq
    {
        #region -- Properties --

        /// <summary>
        /// Page
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// Size
        /// </summary>
        public int? Status { get; set; }

        #endregion
    }

    public class ClassReq
    {
        public int ClassId { get; set; }

        public int? Status { get; set; }
    }

    public class ClassDashboardReq
    {
        #region -- Properties --
        public int ClassId { get; set; }
        public int? Page { get; set; }
        public int? Size { get; set; }

        #endregion
    }

    public class ClassAssignmentReq
    {
        #region -- Properties --
        public int ClassId { get; set; }
        public int AssignmentId { get; set; }
        public int UserId { get; set; }
        public int? Page { get; set; }
        public int? Size { get; set; }

        #endregion
    }

    public class StudentScoreReq
    {
        #region -- Properties --
        public int ClassId { get; set; }
        public int StudentId { get; set; }

        #endregion
    }

    public class AttachmentReq
    {
        #region -- Properties --
        public int AttachmentId { get; set; }
        #endregion
    }

    public class AssignmentSubmissionReq
    {
        #region -- Properties --
        public string SubmissionUrl { get; set; }
        public int ClassAssignmentId { get; set; }
        public int UserId { get; set; }
        public int? Page { get; set; }
        public int? Size { get; set; }

        #endregion
    }

    public class ClassDiscussionReq
    {
        #region -- Properties --
        public int ClassId { get; set; }
        public int Level { get; set; }
        public int? ParentId { get; set; }
        public string Content { get; set; }
        public int UserId { get; set; }
        public int? Page { get; set; }
        public int? Size { get; set; }
        #endregion
    }

    public class ClassScoreReq
    {
        #region -- Properties --
        public int ClassId { get; set; }
        public int UserId { get; set; }
        #endregion
    }
}
