using ElectronicStore.Models.Bus;
using ElectronicStoreConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ElectronicStore.Areas.Admin.Controllers
{
    public class ImgController : Controller
    {
        // GET: Admin/Img
        public ActionResult Index(int id)
        {
            ViewBag.ProId = id;
            return View();
        }

        [HttpGet]
        public JsonResult LoadData(int id, string status)
        {

            var data = ImageBus.List(id);
            if (!string.IsNullOrEmpty(status))
            {
                var statusBool = bool.Parse(status);
                data = data.Where(x => x.Status == statusBool);
            }
            return Json(new
            {
                data = data,
                status = true

            }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveData(int imgId, int proId)
        {
            bool status = false;
            string message = string.Empty;

            if (imgId == 0)
            {
                if (HttpContext.Request.Files.Count > 0)
                {
                    try
                    {
                        for (int i = 1; i < HttpContext.Request.Files.Count; i++)
                        {
                            var img = new Image();
                            img.ProductId = proId;
                            img.Status = true;
                            var hrf = HttpContext.Request.Files[i];
                            if (hrf.ContentLength > 0)
                            {
                                string fileName = Guid.NewGuid().ToString();
                                string fullPathWithFileName = "/Data/Images/" + fileName + ".jpg";
                                hrf.SaveAs(Server.MapPath(fullPathWithFileName));
                                img.ImageUrl = fullPathWithFileName;
                                ImageBus.Add(img);
                            }
                        }
                        status = true;
                    }
                    catch (Exception ex)
                    {
                        status = false;
                        message = ex.Message;
                    }
                }

            }
            else
            {
                if (HttpContext.Request.Files.Count > 0)
                {
                    try
                    {
                        var img = ImageBus.Find(proId);
                        var hpf = HttpContext.Request.Files[0];
                        if (hpf.ContentLength > 0)
                        {
                            string fileName = Guid.NewGuid().ToString();
                            string fullPathWithFileName = "/Data/Images/" + fileName + ".jpg";
                            hpf.SaveAs(Server.MapPath(fullPathWithFileName));
                            img.ImageUrl = fullPathWithFileName;
                        }
                        ImageBus.Edit(img);
                        status = true;
                    }
                    catch (Exception ex)
                    {
                        status = false;
                        message = ex.Message;
                    }
                }
            }

            return Json(new
            {
                status = status,
                message = message
            });
        }

        [HttpGet]
        public JsonResult LoadDetails(int id)
        {
            var image = ImageBus.Find(id);
            return Json(new
            {
                data = image,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult ChangeStatus(int id)
        {
            var result = ImageBus.ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}
