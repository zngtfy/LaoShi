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

using System.ComponentModel;

namespace YEX
{
    /// <summary>
    /// Enumeration
    /// </summary>
    public class YEnum
    {
        /// <summary>
        /// Status
        /// </summary>
        public enum Status
        {
            /// <summary>
            /// Inactive, just created
            /// </summary>
            [Description("Inactive")]
            Inactive = 0,

            /// <summary>
            /// Normal
            /// </summary>
            [Description("Normal")]
            Normal = 1 << 0,

            /// <summary>
            /// Deleted
            /// </summary>
            [Description("Deleted")]
            Deleted = 1 << 1,

            /// <summary>
            /// Activated
            /// </summary>
            [Description("Activated")]
            Activated = 1 << 2,

            /// <summary>
            /// Notified
            /// </summary>
            [Description("Notified")]
            Notified = 1 << 3
        }

        public enum ClassStatus
        {
            /// <summary>
            /// Inactive, just created
            /// </summary>
            [Description("Inactive")]
            Inactive = 0,

            /// <summary>
            /// Active
            /// </summary>
            [Description("Active")]
            Active = 1 << 0,

            /// <summary>
            /// Deleted
            /// </summary>
            [Description("Completed")]
            Completed = 1 << 1,

            /// <summary>
            /// Activated
            /// </summary>
            [Description("Suspended")]
            Suspended = 1 << 2,

            /// <summary>
            /// Notified
            /// </summary>
            [Description("Archived")]
            Archived = 1 << 3
        }

        public enum ClassAnnouncementStatus
        {
            /// <summary>
            /// Inactive, just created
            /// </summary>
            [Description("Inactive")]
            Inactive = 0,

            /// <summary>
            /// Active
            /// </summary>
            [Description("Active")]
            Active = 1 << 0,

            /// <summary>
            /// Deleted
            /// </summary>
            [Description("Deleted")]
            Deleted = 1 << 1,
        }

        public enum ClassAssignmentStatus
        {
            /// <summary>
            /// Inactive, just created
            /// </summary>
            [Description("Inactive")]
            Inactive = 0,

            /// <summary>
            /// Active
            /// </summary>
            [Description("Active")]
            Active = 1 << 0,

            /// <summary>
            /// Deleted
            /// </summary>
            [Description("Deleted")]
            Deleted = 1 << 1,

            /// <summary>
            /// Overdue
            /// </summary>
            [Description("Overdue")]
            Overdue = 1 << 2
        }

        public enum ClassAttendanceStatus
        {
            /// <summary>
            /// Inactive, just created
            /// </summary>
            [Description("Inactive")]
            Inactive = 0,

            /// <summary>
            /// Active
            /// </summary>
            [Description("Active")]
            Active = 1 << 0,

            /// <summary>
            /// Deleted
            /// </summary>
            [Description("Deleted")]
            Deleted = 1 << 1
        }

        public enum ClassDocumentStatus
        {
            /// <summary>
            /// Inactive, just created
            /// </summary>
            [Description("Inactive")]
            Inactive = 0,

            /// <summary>
            /// Active
            /// </summary>
            [Description("Active")]
            Active = 1 << 0,

            /// <summary>
            /// Deleted
            /// </summary>
            [Description("Deleted")]
            Deleted = 1 << 1
        }

        public enum ClassMemberStatus
        {
            /// <summary>
            /// Inactive, just created
            /// </summary>
            [Description("Inactive")]
            Inactive = 0,

            /// <summary>
            /// Active
            /// </summary>
            [Description("Active")]
            Active = 1 << 0,

            /// <summary>
            /// Deleted
            /// </summary>
            [Description("Deleted")]
            Deleted = 1 << 1
        }

        public enum ClassScoreConfigStatus
        {
            /// <summary>
            /// Inactive, just created
            /// </summary>
            [Description("Inactive")]
            Inactive = 0,

            /// <summary>
            /// Active
            /// </summary>
            [Description("Active")]
            Active = 1 << 0,

            /// <summary>
            /// Deleted
            /// </summary>
            [Description("Deleted")]
            Deleted = 1 << 1
        }

        public enum ClassSessionStatus
        {
            /// <summary>
            /// Inactive, just created
            /// </summary>
            [Description("Inactive")]
            Inactive = 0,

            /// <summary>
            /// Active
            /// </summary>
            [Description("Active")]
            Active = 1 << 0,

            /// <summary>
            /// Deleted
            /// </summary>
            [Description("Deleted")]
            Deleted = 1 << 1,

            /// <summary>
            /// Overdue
            /// </summary>
            [Description("Overdue")]
            Overdue = 1 << 2
        }
    }
}