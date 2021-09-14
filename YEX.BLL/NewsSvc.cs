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

using Newtonsoft.Json;
using SKG;
using SKG.BLL;
using SKG.Ext;
using SKG.Req;
using SKG.Rsp;
using System;
using System.Collections.Generic;
using System.Linq;

namespace YEX.BLL
{
    using DAL;
    using DAL.Models;
    using Filter;
    using System.Drawing;
    using System.Drawing.Imaging;
    using System.IO;
    using System.Text;
    using YEX.BLL.Req;

    /// <summary>
    /// News service
    /// </summary>
    public class NewsSvc : GenericSvc<NewsRep, News>
    {
        #region -- Overrides --

        /// <summary>
        /// Create the User
        /// </summary>
        /// <param name="m">The User</param>
        /// <returns>Return the result</returns>
        public override SingleRsp Create(News m)
        {
            m.Status = (short)YEnum.Status.Normal;
            return base.Create(m);
        }

        /// <summary>
        /// Update
        /// </summary>
        /// <param name="m"></param>
        /// <returns>Return the result</returns>
        public override SingleRsp Update(News m)
        {
            m.Status = (short)YEnum.Status.Normal;
            return base.Update(m);
        }

        /// <summary>
        /// Read by
        /// </summary>
        /// <param name="req">Paging request</param>
        /// <returns>Return the result</returns>
        public override SearchRsp Read(PagingReq req)
        {
            var res = new SearchRsp(req);

            try
            {
                // Get data
                var filter = new NewsFilter();
                if (req.Filter != null)
                {
                    filter = JsonConvert.DeserializeObject<NewsFilter>(req.Filter.ToString());
                }
                var page = req.Page;
                var size = req.Size;
                var offset = (page - 1) * size;
                var query = (from a in All
                             join b in _rep.Context.Code on a.Category equals b.Value
                             join c in _rep.Context.Code on a.NewsType equals c.Value
                             join d in _rep.Context.Group on a.Group equals d.Id into dd
                             from d in dd.DefaultIfEmpty()
                             join e in _rep.Context.User on a.CreatedBy equals e.Id into ee
                             from e in ee.DefaultIfEmpty()
                             where a.Status != (short)YEnum.Status.Deleted &&
                             a.Status != (short)YEnum.Status.Inactive
                             select new
                             {
                                 a.Id,
                                 a.Group,
                                 GroupName = d.Description,
                                 a.Category,
                                 CategoryName = b.DisplayAs,
                                 a.NewsType,
                                 TypeName = c.DisplayAs,
                                 a.Title,
                                 a.Brief,
                                 a.Content,
                                 a.ImgUrl,
                                 a.Thumbnail,
                                 NewsBy = e == null
                                ? string.Empty
                                : e.FirstName + ZConst.String.Space + e.LastName,
                                 a.Status,
                                 a.CreatedBy,
                                 a.CreatedOn,
                                 a.ModifiedBy,
                                 a.ModifiedOn
                             });

                #region -- Filter --

                if (filter.GroupId != null)
                {
                    query = query.Where(p => p.Group == filter.GroupId);
                }

                if (filter.CategoryCode != null)
                {
                    query = query.Where(p => p.Category == filter.CategoryCode);
                }

                if (filter.TypeCode != null)
                {
                    query = query.Where(p => p.NewsType == filter.TypeCode);
                }

                if (filter.Keyword != null)
                {
                    query = query.Where(p => p.Title.Contains(filter.Keyword));
                }

                #endregion

                res.TotalRecords = query.Count();

                if (req.Paging)
                {
                    query = query.OrderByDescending(p => p.Id)
                        .Sort(req.Sort)
                        .Skip(offset)
                        .Take(size);
                }


                var t2 = query.ToList()
                    .Select(p => new
                    {
                        p.Id,
                        p.Group,
                        p.GroupName,
                        p.NewsType,
                        p.TypeName,
                        p.Category,
                        p.CategoryName,
                        p.Title,
                        p.Brief,
                        p.Content,
                        p.ImgUrl,
                        p.Thumbnail,
                        p.NewsBy,
                        Status = ((YEnum.Status)p.Status).ToDescription()
                    });

                res.Data = t2;
            }
            catch (Exception ex)
            {
                res.SetError(ex.StackTrace);
            }

            return res;
        }

        /// <summary>
        /// Read single object
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Return the object</returns>
        public override SingleRsp Read(int id)
        {
            var res = new SingleRsp();

            var t = _rep.Read(id);
            res.Data = new
            {
                t.Id
            };

            return res;
        }

        /// <summary>
        /// Read single object
        /// </summary>
        /// <param name="code">Secondary key</param>
        /// <returns>Return the object</returns>
        public override SingleRsp Read(string code)
        {
            var res = new SingleRsp();

            var t = _rep.Read(code);
            res.Data = new
            {
                t.Id
            };

            return res;
        }

        #endregion

        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        public NewsSvc()
        {
        }

        /// <summary>
        /// Read by ID
        /// </summary>
        /// <param name="code">ID</param>
        /// <returns>Return the object</returns>
        public News ReadById(int id)
        {
            var m = All.Where(m => m.Id == id && m.Status != 0).FirstOrDefault();
            return m;
        }

        public SingleRsp CreateNew(News m)
        {
            SingleRsp res = new SingleRsp();
            m.Status = (short)YEnum.Status.Normal;
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.News.Add(m);
                        context.SaveChanges();
                        tran.Commit();
                        res.Data = m;
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            return res;
        }

        public SingleRsp UpdateNew(News m)
        {
            SingleRsp res = new SingleRsp();
            m.Status = (short)YEnum.Status.Normal;
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.News.Update(m);
                        context.SaveChanges();
                        tran.Commit();
                        res.Data = m;
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            return res;
        }

        /// <summary>
        /// Change status
        /// </summary>
        /// <param name="id">Id</param>
        /// <param name="status">Status</param>
        /// <returns>Return the result</returns>
        public SingleRsp Change(int id, YEnum.Status status)
        {
            var m = new News
            {
                Id = id,
                Status = (short)status
            };

            var res = base.Update(m);

            return res;
        }

        public object getNews(int page, int size)
        {
            object res = new object();            
            var lsCode1 = _rep.Context.Code.Where(x => x.CodeType == "NewsCategory");
            var lsCode2 = _rep.Context.Code.Where(x => x.CodeType == "NewsType");

            var newsLs = _rep.All.Where(x => x.Status == (short)YEnum.Status.Normal)
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
           
            var offset = (page - 1) * size;
            var total = newsLs.Count();
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

        public object getLatestNews(HomeReq req)
        {
            return _rep.getLatestNews(req.Page, req.Size, req.Filter.TypeCode, req.Filter.CategoryCode);
        }

        /// <summary> 
        /// Saves an image as a jpeg image, with the given quality 
        /// </summary> 
        /// <param name="path"> Path to which the image would be saved. </param> 
        /// <param name="quality"> An integer from 0 to 100, with 100 being the highest quality. </param> 
        public static void SaveJpeg(string thumbPath, Image img, int quality)
        {
            if (quality < 0 || quality > 100)
                throw new ArgumentOutOfRangeException("quality must be between 0 and 100.");

            // Encoder parameter for image quality 
            EncoderParameter qualityParam = new EncoderParameter(System.Drawing.Imaging.Encoder.Quality, quality);
            // JPEG image codec 
            ImageCodecInfo jpegCodec = GetEncoderInfo("image/jpeg");
            EncoderParameters encoderParams = new EncoderParameters(1);
            encoderParams.Param[0] = qualityParam;
            img.Save(thumbPath, jpegCodec, encoderParams);
        }

        /// <summary> 
        /// Returns the image codec with the given mime type 
        /// </summary> 
        private static ImageCodecInfo GetEncoderInfo(string mimeType)
        {
            // Get image codecs for all image formats 
            ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();

            // Find the correct image codec 
            for (int i = 0; i < codecs.Length; i++)
                if (codecs[i].MimeType == mimeType)
                    return codecs[i];

            return null;
        }

        public string UploadImage(string imageBase64)
        {
            var bytes = Convert.FromBase64String(imageBase64);

            // Check and create original folder by code type
            var uploadDir = "ClientApp/src/assets/img/news";
            if (!AppSetting.S.Dev)
            {
                uploadDir = "ClientApp/dist/assets/img/news";
            }

            string filedir = Path.Combine(Directory.GetCurrentDirectory(), uploadDir);
            if (!Directory.Exists(filedir))
            {
                Directory.CreateDirectory(filedir);
            }

            // Create primary file name 
            Guid guid = Guid.NewGuid();

            //imageGallery_id_small.jpg
            StringBuilder filename = new StringBuilder();
            filename.Append(guid.ToString() + "_");
            filename.Append("big");
            filename.Append(".jpg");

            string defaultPath = Path.Combine(filedir, filename.ToString().Replace("big", "big"));
            string previewPath = Path.Combine(filedir, filename.ToString().Replace("big", "medium"));
            string thumbPath = Path.Combine(filedir, filename.ToString().Replace("big", "small"));

            if (bytes.Length > 0)
            {
                MemoryStream originalMs = new MemoryStream(bytes);
                Image originaImage = Image.FromStream(originalMs);
                originaImage.Save(defaultPath, ImageFormat.Jpeg);

                var width = originaImage.Width;
                var height = originaImage.Height;
                var previewQuality = 50;
                var thumbQuality = 10;

                //10541760 10mb
                decimal size = originalMs.Length / 1000000;

                if (width < 1000 || height < 1000)
                {
                    thumbQuality = 50;
                    previewQuality = 100;
                }
                else if (width >= 1000 && width < 2000)
                {
                    thumbQuality = 10;
                    previewQuality = 50;
                }
                else if (width >= 2000 && width < 3000)
                {
                    thumbQuality = 5;
                    previewQuality = 40;
                }
                else if (width >= 3000 && width < 4000)
                {
                    thumbQuality = 9;
                    previewQuality = 33;
                }
                else if (width >= 4000)
                {
                    thumbQuality = 9;
                    previewQuality = 22;
                }

                // Make thumbnail
                SaveJpeg(thumbPath, originaImage, thumbQuality);

                // Make preview
                SaveJpeg(previewPath, originaImage, previewQuality);
            }

            string dir = "assets/img/news/";
            return dir + filename;
        }
        #endregion
    }
}
