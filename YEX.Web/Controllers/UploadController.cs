using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.IO;
using System.Web;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace YEX.Web.Controllers
{    
    public class UploadController : ControllerBase
    {
        public async Task<IActionResult> Save(List<IFormFile> files, string pFolderName)
        {
            var tempFolderName = pFolderName;
            long size = files.Sum(f => f.Length);
            // The Name of the Upload component is "files"
            if (files != null)
            {
                foreach (var file in files)
                {
                    // Some browsers send file names with full path.
                    // We are only interested in the file name.
                    var fileName = Path.GetFileName(file.FileName);
                    var physicalPath = GetPathFileUpload();

                    string tempFolderPath = Path.Combine(physicalPath, tempFolderName);

                    if (!Directory.Exists(physicalPath))
                        Directory.CreateDirectory(physicalPath);
                    if (!Directory.Exists(fileName))
                        Directory.CreateDirectory(tempFolderPath);

                    var filePath = Path.Combine(tempFolderPath, fileName);
                    using (var stream = System.IO.File.Create(filePath))
                    {
                        await file.CopyToAsync(stream);
                    }
                }
            }
            // Return an empty string to signify success
            return Ok(new { count = files.Count, size }); 
        }

        public ActionResult Remove(string[] fileNames, string pFolderName)
        {
            // The parameter of the Remove action must be called "fileNames"
            var tempFolderName = pFolderName;

            if (fileNames != null)
            {
                foreach (var fullName in fileNames)
                {
                    var fileName = Path.GetFileName(fullName);
                    var physicalPath = GetPathFileUpload();
                    string tempFolderPath = Path.Combine(physicalPath, tempFolderName);
                    string filePath = Path.Combine(tempFolderPath, fileName);

                    // TODO: Verify user permissions
                    if (System.IO.File.Exists(filePath))
                    {
                        // The files are not actually removed in this demo
                        //System.IO.File.Delete(filePath);
                        FileInfo file = new FileInfo(filePath);
                        if (file != null)
                            file.Delete();
                        Directory.Delete(tempFolderPath);
                    }
                }
            }
            // Return an empty string to signify success
            return Content("");
        }

        public static string GetPathFileUpload()
        {
            //IAppSettingsService appSettingService = new AppSettingsService();
            //var appStt = appSettingService.GetAll()
            //            .Where(x => x.Key.Contains("AttachmentDirectory"))
            //            .Select(i => new { Value = i.Value }).ToList();

            //string path = string.Empty;
            //if (appStt != null)
            //    path = appStt[0].Value.ToString();
            //return path;
            return "assets/testUpload/";
        }
    }
}