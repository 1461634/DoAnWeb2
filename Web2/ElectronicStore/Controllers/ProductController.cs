using ElectronicStore.Models.Bus;
using ElectronicStoreConnection;
using System;
using System.Linq;
using System.Web.Mvc;
using PagedList;
using System.Net;

namespace ElectronicStore.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product/
        public ActionResult Index(int? BrandId, int? currentBrand, int? CateId, int? currentCate, int? TypeId, int? currentType, string currentFilter, string SearchString, int page = 1, int pageSize = 4)
        {
            ViewBag.BrandId = new SelectList(BrandBus.List(), "Id", "Name");
            ViewBag.CateId = new SelectList(CategoryBus.List().Where(x => x.Status == true), "Id", "Name");
            ViewBag.TypeId = new SelectList(TypeBus.List(), "Id", "Name");

            if (SearchString != null)
            {
                page = 1;
            }
            else
            {
                SearchString = currentFilter;
            }
            ViewBag.CurrentFilter = SearchString;

            if (CateId != null)
            {
                page = 1;
            }
            else
            {
                CateId = currentCate;
            }
            ViewBag.CurrentCate = CateId;

            if (TypeId != null)
            {
                page = 1;
            }
            else
            {
                TypeId = currentType;
            }
            ViewBag.CurrentType = TypeId;

            if (BrandId != null)
            {
                page = 1;
            }
            else
            {
                BrandId = currentBrand;
            }
            ViewBag.CurrentBrand = BrandId;

            var model = ProductBus.List().Where(x => x.Status == true);
            if (!string.IsNullOrEmpty(SearchString))
            {
                model = model.Where(x => x.Description.ToLower().Contains(SearchString.ToLower()) || x.Name.ToLower().Contains(SearchString.ToLower()));
            }
            if (BrandId != null)
            {
                model = model.Where(x => x.BrandId == BrandId);
            }
            
            ViewBag.CurrentBrand = BrandId;
            if (CateId != null)
            {
                model = model.Where(x => x.CateId == CateId);
            }
            if (TypeId != null)
            {
                model = model.Where(x => x.TypeId == TypeId);
            }
            return View(model.ToPagedList(page, pageSize));
        }

        // GET: Product/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return Redirect("/");
            }

            var product = ProductBus.Find(id);
            if (product == null)
            {
                return Redirect("/");
            }

            ViewBag.Images = ImageBus.List(id);

            return View(ProductBus.Details(id));
        }

    }
}
