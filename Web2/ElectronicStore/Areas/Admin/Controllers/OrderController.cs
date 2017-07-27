using ElectronicStore.Models.Bus;
using System.Linq;
using System.Web.Mvc;

namespace ElectronicStore.Areas.Admin.Controllers
{
    public class OrderController : Controller
    {
        // GET: Admin/Order
        public ActionResult Index()
        {
            return View();
        }

        // GET: Admin/Order/LoadData
        [HttpGet]
        public JsonResult LoadData(string status, int page, int pageSize)
        {
            var model = OrderBus.List();
            
            
            if (!string.IsNullOrEmpty(status))
            {
                var statusInt = int.Parse(status);
                model = model.Where(x => x.Status == statusInt);
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

        [HttpGet]
        public JsonResult Details(int id)
        {
            var model = OrderDetailBus.Details(id);
            return Json(new
            {
                data = model,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult ChangeStatus(int id)
        {
            var result = OrderBus.ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}
