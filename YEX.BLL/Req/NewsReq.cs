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

using SKG.Req;
using System.Collections.Generic;
using System.Linq;

namespace YEX.BLL.Req
{
    using DAL.Models;

    /// <summary>
    /// News request
    /// </summary>
    public class NewsReq : BaseReq<News>
    {
        #region -- Overrides --

        /// <summary>
        /// Convert the request to the model
        /// </summary>
        /// <param name="createdBy">Created by</param>
        /// <returns>Return the result</returns>
        public override News ToModel(int? createdBy = null)
        {
            var res = new News
            {
                Id = Id,
                Title = Title,
                Brief = Brief,
                Content = Content,
                Category = Category,
                NewsType = NewsType,
                Group = Group,
                ImgUrl = ImgUrl,
                Thumbnail = Thumbnail,
                NewsBy = NewsBy,
                CreatedBy = createdBy
            };

            return res;
        }

        #endregion

        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public NewsReq() { }

        /// <summary>
        /// Convert the requests to the models
        /// </summary>
        /// <param name="l">List requests</param>
        /// <param name="createdBy">Created by</param>
        /// <returns>Return the result</returns>
        public static List<News> ToModel(List<NewsReq> l, int? createdBy)
        {
            var res = new List<News>();

            if (l != null)
            {
                res = l.Select(p => p.ToModel(createdBy)).ToList();
            }

            return res;
        }

        #endregion

        #region -- Properties --

        /// <summary>
        /// Subject
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// Brief
        /// </summary>
        public string Brief { get; set; }

        /// <summary>
        /// Content
        /// </summary>
        public string Content { get; set; }

        /// <summary>
        /// Category
        /// </summary>
        public string Category { get; set; }

        /// <summary>
        /// News type
        /// </summary>
        public string NewsType { get; set; }

        /// <summary>
        /// Group
        /// </summary>
        public int? Group { get; set; }

        /// <summary>
        /// Image url
        /// </summary>
        public string ImgUrl { get; set; }

        /// <summary>
        /// Thumbnail
        /// </summary>
        public string Thumbnail { get; set; }

        /// <summary>
        /// News by
        /// </summary>
        public int? NewsBy { get; set; }

        /// <summary>
        /// Image base64
        /// </summary>
        public string ImageBase64 { get; set; }
        

        #endregion
    }
}