#region Information
/*
 * Author       : ZngTfy
 * Email        : toan.nguyen@tanvieta.co
 * Phone        : +84 345 515 010
 * ------------------------------- *
 * Create       : 2020-Jan-09 08:41
 * Update       : 2020-Jan-09 08:41
 * Checklist    : 1.0
 * Status       : Done
 */
#endregion

namespace SKG.DAL.Dto
{
    /// <summary>
    /// Parameter data transfer object
    /// </summary>
    public class ParameterDto
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public ParameterDto(string name, object value)
        {
            Name = name;
            Value = value;
        }

        #endregion

        #region -- Properties --

        /// <summary>
        /// Name
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// Value
        /// </summary>
        public object Value { get; set; }

        #endregion
    }
}