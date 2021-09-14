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

using System.Collections.Generic;

namespace YEX.DAL.Dto
{
    using Models;

    /// <summary>
    /// Customer data transfer object
    /// </summary>
    public partial class CustomerDto
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="m">Model</param>
        public CustomerDto(Customer m)
        {
            if (m != null)
            {
                Id = m.Id;
                Description = m.Description;
            }
        }

        /// <summary>
        /// Convert list model to list data transfer object
        /// </summary>
        /// <param name="l">List model</param>
        /// <returns>Return the result</returns>
        public static List<CustomerDto> ToDto(List<Customer> l)
        {
            var res = new List<CustomerDto>();

            foreach (var i in l)
            {
                res.Add(new CustomerDto(i));
            }

            return res;
        }

        #endregion

        #region -- Properties --

        /// <summary>
        /// Id
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Description
        /// </summary>
        public string Description { get; set; }

        #endregion
    }
}