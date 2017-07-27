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
    public class CategoryController : Controller
    {
        // GET: Admin/Category
        public ActionResult Index()
        {
            return View();
        }

        // GET: Load data
        [HttpGet]
        public JsonResult LoadData(string name, string status, int page, int pageSize = 3)
        {
            name = name.ToUpper();
            var model = CategoryBus.List();

            if (!string.IsNullOrEmpty(name))
                model = model.Where(x => x.Name.Contains(name));

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
            var cate = CategoryBus.Details(id);
            return Json(new
            {
                data = cate,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }

        // POST: Save data
        [HttpPost]
        public JsonResult SaveData(string strCategory)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            Category cate = serializer.Deserialize<Category>(strCategory);
            bool status = false;
            string message = string.Empty;
            //add new category if id = 0
            if (cate.Id == 0)
            {
                cate.DateCreated = DateTime.Now;
                cate.DateModified = DateTime.Now;
                try
                {
                    CategoryBus.Add(cate);
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
                var entity = CategoryBus.Details(cate.Id);
                entity.Status = cate.Status;
                entity.Name = cate.Name;
                entity.DateModified = DateTime.Now;
                try
                {
                    CategoryBus.Edit(entity);
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

        // POST: Delete category
        [HttpPost]
        public JsonResult Delete(int id)
        {
            try
            {
                CategoryBus.Delete(id);
                return Json(new
                {
                    status = true
                });
            }
            catch (Exception ex)
            {
                return Json(new
                {
                    status = false,
                    message = ex.Message
                });
            }

        }
    }
}
