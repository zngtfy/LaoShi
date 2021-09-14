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
    public class NewsRep : GenericRep<ZContext, News>
    {
        #region -- Overrides --

        /// <summary>
        /// Read single object
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Return the object</returns>
        public override News Read(int id)
        {
            var res = All.FirstOrDefault(p => p.Id == id);
            return res;
        }

        public object getLatestNews(int page, int size, string typeFilter, string categoryFilter)
        {
            object res = new object();
            var users = base.Context.User.Where(p => p.Status == (short)YEnum.Status.Normal);
            var lsCode1 = base.Context.Code.Where(x => x.CodeType == "NewsCategory");
            var lsCode2 = base.Context.Code.Where(x => x.CodeType == "NewsType");

            if (typeFilter != null && typeFilter != "")
            {
                lsCode2 = lsCode2.Where(x => x.Value == typeFilter);
            }

            if (categoryFilter != null && categoryFilter != "")
            {
                lsCode1 = lsCode1.Where(x => x.Value == categoryFilter);
            }

            var newsLs = base.All.Where(x => x.Status == (short)YEnum.Status.Normal)
                .Join(lsCode1, a => a.Category, b => b.Value, (a, b) => new
                {
                    a.Id,
                    a.Group,
                    a.Title,
                    a.Brief,
                    a.Category,
                    a.NewsType,
                    a.Content,
                    a.ImgUrl,
                    a.Thumbnail,
                    a.CreatedBy,
                    a.CreatedOn,
                    a.NewsBy,
                    CategoryName = b.DisplayAs
                })
                .Join(lsCode2, a => a.NewsType, b => b.Value, (a, b) => new
                {
                    a.Id,
                    a.Group,
                    a.Title,
                    a.Brief,
                    a.Category,
                    a.NewsType,
                    a.Content,
                    a.ImgUrl,
                    a.Thumbnail,
                    a.CreatedBy,
                    a.CreatedOn,
                    a.NewsBy,
                    a.CategoryName,
                    NewsTypeName = b.DisplayAs
                });

            //var query = (from a in newsLs
            //             join b in users on a.CreatedBy equals b.Id into gB
            //             join c in users on a.NewsBy equals c.Id into gC
            //             from b in gB.DefaultIfEmpty()
            //             from c in gC.DefaultIfEmpty()
            //             select new
            //             {
            //                 a.Id,
            //                 a.Group,
            //                 a.Title,
            //                 a.Brief,
            //                 a.Category,
            //                 a.NewsType,
            //                 a.Content,
            //                 a.ImgUrl,
            //                 a.Thumbnail,
            //                 a.CreatedBy,
            //                 a.CreatedOn,
            //                 a.NewsBy,
            //                 a.CategoryName,
            //                 a.NewsTypeName,
            //                 CreatedByName = b == null ? string.Empty : b.FirstName + " " + b.LastName,
            //                 NewsByName = c == null ? string.Empty : c.FirstName + " " + c.LastName
            //             });
            var query = newsLs.Join(users, a => a.CreatedBy, b => b.Id, (a, b) => new {
                a.Id,
                a.Group,
                a.Title,
                a.Brief,
                a.Category,
                a.NewsType,
                a.Content,
                a.ImgUrl,
                a.Thumbnail,
                a.CreatedBy,
                a.CreatedOn,
                a.NewsBy,
                a.CategoryName,
                a.NewsTypeName,
                CreatedByName = b == null ? string.Empty : b.FirstName + " " + b.LastName,
            });

            var offset = (page - 1) * size;
            var total = query.Count();
            int totalPage = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = query.OrderByDescending(x => x.CreatedOn).Skip(offset).Take(size).ToList();
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

        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public NewsRep() { }

        #endregion
    }
}
