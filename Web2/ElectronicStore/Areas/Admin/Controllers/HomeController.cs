using System.Web.Mvc;

namespace ElectronicStore.Areas.Admin.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        // GET: Admin/Home
        [Authorize(Roles = "Admin, Manager")]
        public ActionResult Index()
        {
            return View();
        }
    }

}