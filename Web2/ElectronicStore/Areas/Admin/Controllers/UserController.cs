using ElectronicStore.Models.Bus;
using ElectronicStoreConnection;
using System;
using System.Linq;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using Microsoft.AspNet.Identity;

namespace ElectronicStore.Areas.Admin.Controllers
{
    public class UserController : Controller
    {
        // GET: Admin/User
        public ActionResult Index()
        {
            return View();
        }

        // GET: Admin/User/LoadData
        [HttpGet]
        public JsonResult LoadData(string name, string status, int page, int pageSize)
        {
            var model = UserBus.List();
            
            if (!string.IsNullOrEmpty(name))
            {
                name = name.ToLower();
                model = model.Where(x => x.FirstName.ToLower().Contains(name) || x.LastName.ToLower().Contains(name) || x.Email.ToLower().Contains(name));
            }

            if (!string.IsNullOrEmpty(status))
            {
                model = model.Where(x => x.Role == status);
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
        public JsonResult Details(string id)
        {
            var user = UserBus.Details(id);
            return Json(new
            {
                data = user,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Roles()
        {
            return Json(new[] {
                new { id = "43ac247b-fce2-4539-95d4-735bda9225a8", name = "Admin" },
                new { id = "89660f70-6fdb-42cf-a98f-ed301c88c56d", name = "User" },
                new { id = "b7f77697-5e8f-4167-adf4-a05ef508bf0b", name = "Manager" }
            }, JsonRequestBehavior.AllowGet);
        }

        // POST: Save data
        [HttpPost]
        public JsonResult SaveData(string strUser, string role)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            View_Profile user = serializer.Deserialize<View_Profile>(strUser);
            bool status = false;
            string message = string.Empty;
            //add new User if id = 0

            //update existing DB
            //save db
            var entity = UserBus.Find(user.Id);
            entity.FirstName = user.FirstName;
            entity.LastName = user.LastName;
            entity.Address = user.Address;
            entity.PhoneNumber = user.PhoneNumber;
            var userRole = UserBus.UserRoleDetails(user.Id);
            userRole.RoleId = role;
            try
            {
                UserBus.Edit(entity);
                UserBus.RoleEdit(userRole);
                status = true;
            }
            catch (Exception ex)
            {
                status = false;
                message = ex.Message;
            }

            return Json(new
            {
                status = status,
                message = message
            });
        }

        [HttpPost]
        public JsonResult Delete(string id)
        {
            var currentId = User.Identity.GetUserId();
            try
            {
                if (currentId == id)
                {
                    return Json(new
                    {
                        status = false,
                        message = "Can't delete current user"
                    });
                }
                UserBus.Delete(id);
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
