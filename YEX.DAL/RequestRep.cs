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

using SKG.DAL;
using System.Linq;

namespace YEX.DAL
{
    using Models;
    public class RequestRep : GenericRep<ZContext, Request>
    {
        #region -- Overrides --

        /// <summary>
        /// Read single object
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Return the object</returns>
        public override Request Read(int id)
        {
            var res = All.FirstOrDefault(p => p.Id == id);
            return res;
        }


        /// <summary>
        /// Remove and not restore
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Number of affect</returns>
        public int Remove(int id)
        {
            var m = base.All.First(i => i.Id == id);
            m = base.Delete(m); //TODO
            return m.Id;
        }

        #endregion

        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public object loadRequest(int page, int size)
        {
            object res = new object();
            var users = base.Context.User.Where(p => p.Status == (short)YEnum.Status.Normal);
            var newsLs = base.All.Where(x => x.Status == (short)YEnum.Status.Normal);
            var query = newsLs.Join(users, a => a.CreatedBy, b => b.Id, (a, b) => new {
                a.Id,
                a.RequestBy,
                a.Content,
                a.CreatedBy,
                a.CreatedOn,
                CreatedByName = b == null ? string.Empty : b.FirstName + " " + b.LastName,
            });

            var offset = (page - 1) * size;
            var total = query.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = newsLs.OrderByDescending(x => x.CreatedOn).Skip(offset).Take(size).ToList();
            res = new
            {
                Data = data,
                TotalRecords = total,
                Page = page,
                Size = size,
                TotalPages = totalPage
            };
            return res;
        }

        #endregion
    }
}
