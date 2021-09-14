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
    using SKG.Ext;
    using YEX.BLL.Filter;
    using SKG.Req;

    using System;
    using System.IO;
    using System.Drawing;
    using System.Drawing.Imaging;
    using System.Text;

    /// <summary>
    /// Code service
    /// </summary>
    public class CodeSvc : GenericSvc<CodeRep, Code>
    {
        #region -- Overrides --

        public override SingleRsp Create(Code m)
        {
            m.Status = (short)YEnum.Status.Normal;
            return base.Create(m);
        }

        public override SingleRsp Update(Code m)
        {
            m.Status = (short)YEnum.Status.Normal;
            return base.Update(m);
        }

        /// <summary>
        /// Read By KeyWord with paging
        /// </summary>
        /// <param name="req"></param>
        /// <returns></returns>
        public override SearchRsp Read(PagingReq req)
        {
            var res = new SearchRsp(req);

            try
            {
                // Get data
                var filter = new CodeFilter();
                if (req.Filter != null)
                {
                    filter = JsonConvert.DeserializeObject<CodeFilter>(req.Filter.ToString());
                }
                var page = req.Page;
                var size = req.Size;
                var offset = (page - 1) * size;
                var query = All.Where(p => p.Status != 0);

                #region -- Filter --

                if (!string.IsNullOrEmpty(filter.CodeType))
                {
                    query = query.Where(p => p.CodeType == filter.CodeType);
                }

                #endregion

                res.TotalRecords = query.ToList().Count();

                if (req.Paging)
                {
                    query = query.OrderByDescending(p => p.Id)
                        .Sort(req.Sort)
                        .Skip(offset)
                        .Take(size);
                }

                var t = query.ToList()
                    .Select(p => new
                    {
                        p.Id,
                        p.Value,
                        p.DisplayAs,
                        p.CodeType,
                        p.Status
                    });

                res.Data = t;
            }
            catch (Exception ex)
            {
                res.SetError(ex.Message);
            }

            return res;
        }

        #endregion

        #region -- Methods --

        public SingleRsp CreateNew(Code m)
        {
            SingleRsp res = new SingleRsp();
            m.Status = (short)YEnum.Status.Normal;
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.Code.Add(m);
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

        public SingleRsp UpdateNew(Code m)
        {
            SingleRsp res = new SingleRsp();
            m.Status = (short)YEnum.Status.Normal;
            using (var context = new ZContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.Code.Update(m);
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
        /// Initialize
        /// </summary>
        public CodeSvc()
        {
            _repType = new CodeTypeRep();
        }

        /// <summary>
        /// Get all holidays of the year
        /// </summary>
        /// <param name="codeType">Year</param>
        /// <returns>Return the result</returns>
        public MultipleRsp ReadByCodeType(List<string> codeType)
        {
            MultipleRsp res = new MultipleRsp();
            foreach (string i in codeType)
            {
                var o = All.Where(p => p.CodeType.Contains(i) && p.Status != 0).ToList();
                res.SetData(i, o);
            };

            return res;
        }

        /// <summary>
        /// Read by ID
        /// </summary>
        /// <param name="code">ID</param>
        /// <returns>Return the object</returns>
        public Code ReadById(int id)
        {
            var m = All.Where(m => m.Id == id && m.Status != 0).FirstOrDefault();
            return m;
        }

        /// <summary>
        /// Get code type
        /// </summary>
        /// <returns>Return the result</returns>
        public SingleRsp ReadType()
        {
            var res = new SingleRsp();

            var t = (from a in _repType.Context.CodeType
                     select new
                     {
                         a.Code,
                         a.DisplayAs
                     }).ToList();

            res.Data = t;

            return res;
        }

        public IQueryable<object> LoadImageGallery()
        {
            var gallery = All.Where(p => p.CodeType == "ImageGallery" && p.Status != 0);
            var t = (from a in gallery
                     select new
                     {
                         Small= a.Value.Replace(Path.GetFileName(a.Value), Path.GetFileName(a.Value).Replace("big", "small")),
                         Medium = a.Value.Replace(Path.GetFileName(a.Value), Path.GetFileName(a.Value).Replace("big", "medium")),
                         Big = a.Value,
                         Description = a.DisplayAs
                     });
            return t;
        }

        public IQueryable<object> LoadImageByCodeType(string codeType)
        {
            var gallery = All.Where(p => p.CodeType == codeType && p.Status != 0);
            var t = (from a in gallery
                     select new
                     {
                         Small = a.Value.Replace(Path.GetFileName(a.Value), Path.GetFileName(a.Value).Replace("big", "small")),
                         Medium = a.Value.Replace(Path.GetFileName(a.Value), Path.GetFileName(a.Value).Replace("big", "medium")),
                         Big = a.Value,
                         Description = a.DisplayAs
                     });
            return t;
        }

        public List<Code> LoadRequestType()
        {
            return All.Where(p => p.CodeType == "RequestType").ToList();
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

        public string UploadImage(string imageBase64, string codeType)
        {
            var bytes = Convert.FromBase64String(imageBase64);

            // Check and create original folder by code type
            var uploadDir = "ClientApp/src/assets/imageGallery";
            if (!AppSetting.S.Dev)
            {
                uploadDir = "ClientApp/dist/assets/imageGallery";
            }

            string filedir = Path.Combine(Directory.GetCurrentDirectory(), uploadDir);
            if (!Directory.Exists(filedir))
            {
                Directory.CreateDirectory(filedir);
            }

            // Create primary file name 
            Guid guid = Guid.NewGuid();

            //imageGallery_id_small.jpg
            StringBuilder filename = new StringBuilder(codeType + "_");
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

            string dir = "assets/imageGallery/";
            return dir + filename;
        }

        #endregion


        #region -- Fields --

        /// <summary>
        /// Code type rep
        /// </summary>
        CodeTypeRep _repType;

        #endregion
    }
}
