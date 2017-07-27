using ElectronicStore.Models.Bus;
using ElectronicStoreConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace ElectronicStore.Areas.Admin.Controllers
{
    public class ProController : Controller
    {
        // GET: Admin/Pro
        public ActionResult Index()
        {
            return View();
        }
        
        //GET: Products
        [HttpGet]
        public JsonResult LoadData(string name, string status, int page, int pageSize)
        {
            var model = ProductBus.List();

            if (!string.IsNullOrEmpty(name))
                model = model.Where(x => x.Name.ToUpper().Contains(name.ToUpper()));

            if (!string.IsNullOrEmpty(status))
            {
                var statusBool = bool.Parse(status);
                model = model.Where(x => x.Status == statusBool);
            }

            int totalRow = model.Count();
            model = model.Skip((page - 1) * pageSize).Take(pageSize);
            return Json(new
            {
                data = model,
                total = totalRow,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }

        // GET: Details
        [HttpGet]
        public JsonResult Details(int id)
        {
            var product = ProductBus.ViewProduct(id);
            return Json(new
            {
                data = product,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }

        // POST: Save data
        [HttpPost]
        public JsonResult SaveData(string name, string description, int id, int brand, int category, int type, int price, int quantity, int warranty )
        {
            bool status = false;
            string message = string.Empty;
        
            var model = new Product();
            model.Name = name;
            model.Id = id;
            model.Description = description;
            model.Price = price;
            model.Quantity = quantity;
            model.Warranty = warranty;
            model.BrandId = brand;
            model.CateId = category;
            model.TypeId = type;
            if (HttpContext.Request.Files.Count > 0)
            {
                // TODO: Add insert logic here
                var hpf = HttpContext.Request.Files[0];
                if (hpf.ContentLength > 0)
                {
                    string fileName = Guid.NewGuid().ToString();
                    string fullPathWithFileName = "/Data/Images/" + fileName + ".jpg";
                    hpf.SaveAs(Server.MapPath(fullPathWithFileName));
                    model.ImageUrl = fullPathWithFileName;
                }
            }
            
            //add new productgory if id = 0
            if (model.Id == 0)
            {
                model.DateCreated = DateTime.Now;
                model.DateModified = DateTime.Now;
                model.Status = true;
                model.Viewed = 0;
                model.Sold = 0;
                try
                {
                    ProductBus.Add(model);
                    for (int i = 1; i < HttpContext.Request.Files.Count; i++)
                    {
                        var proImage = new Image();
                        var pro = ProductBus.Find(model.Id);
                        proImage.ProductId = pro.Id;
                        proImage.Status = true;
                        var hrf = HttpContext.Request.Files[i];
                        if (hrf.ContentLength > 0)
                        {
                            string fileName = Guid.NewGuid().ToString();
                            string fullPathWithFileName = "/Data/Images/" + fileName + ".jpg";
                            hrf.SaveAs(Server.MapPath(fullPathWithFileName));
                            proImage.ImageUrl = fullPathWithFileName;
                            ImageBus.Add(proImage);
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
            else
            {
                //update existing DB
                //save db
                var entity = ProductBus.Find(model.Id);
                if (HttpContext.Request.Files.Count > 0)
                {
                    // TODO: Add insert logic here
                    var hpf = HttpContext.Request.Files[0];
                    if (hpf.ContentLength > 0)
                    {
                        string fileName = Guid.NewGuid().ToString();
                        string fullPathWithFileName = "/Data/Images/" + fileName + ".jpg";
                        hpf.SaveAs(Server.MapPath(fullPathWithFileName));
                        entity.ImageUrl = fullPathWithFileName;
                    }
                }
                entity.DateModified = DateTime.Now;
                entity.Name = model.Name;
                entity.BrandId = model.BrandId;
                entity.CateId = model.CateId;
                entity.TypeId = model.TypeId;
                entity.Price = model.Price;
                entity.Quantity = model.Quantity;
                entity.Description = model.Description;
                entity.Warranty = model.Warranty;
                entity.DateModified = DateTime.Now;
                try
                {
                    ProductBus.Edit(entity);
                    status = true;
                }
                catch (Exception ex)
                {
                    status = false;
                    message = ex.Message;
                }

            }

            return Json(new
            {
                status = status,
                message = message
            });
        }

        [HttpPost]
        public JsonResult ChangeStatus(int id)
        {
            var result = ProductBus.ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }

        [HttpPost]
        public JsonResult Brands()
        {
            var brands = BrandBus.List();
            return Json(new {
                data = brands,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult Categories()
        {
            var categories = CategoryBus.List();
            return Json(new
            {
                data = categories,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult Types()
        {
            var types = TypeBus.List();
            return Json(new
            {
                data = types,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }

        // get Top 10 best selling products
        [HttpGet]
        public JsonResult Top10Featured()
        {
            var model = ProductBus.Top10Featured();
            return Json(new
            {
                data = model,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }

        // get Top 10 best selling products by category
        [HttpGet]
        public JsonResult Top10FeaturedByCate(int id)
        {
            var model = ProductBus.Top10FeaturedByCate(id);
            return Json(new
            {
                data = model,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }
    }
}