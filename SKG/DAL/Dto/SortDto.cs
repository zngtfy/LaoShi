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

namespace SKG.DAL.Dto
{
    /// <summary>
    /// Sort data transfer object
    /// </summary>
    public class SortDto
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public SortDto()
        {
            Field = string.Empty;
            Direction = string.Empty;
        }

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="field">Field</param>
        public SortDto(string field)
        {
            Field = field;
            Direction = string.Empty;
        }

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="field">Field</param>
        /// <param name="direction">Direction</param>
        public SortDto(string field, string direction)
        {
            Field = field;
            Direction = direction;
        }

        #endregion

        #region -- Properties --

        /// <summary>
        /// Field
        /// </summary>
        public string Field { get; set; }

        /// <summary>
        /// Direction
        /// </summary>
        public string Direction
        {
            get
            {
                return direction;
            }
            set
            {
                if ("ASC" != value && "DESC" != value)
                {
                    value = "ASC";
                }

                direction = value;
            }
        }

        #endregion

        #region -- Fields --

        /// <summary>
        /// Direction
        /// </summary>
        private string direction;

        #endregion
    }
}