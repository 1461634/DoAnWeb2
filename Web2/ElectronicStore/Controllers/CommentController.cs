using ElectronicStore.Models.Bus;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using ElectronicStoreConnection;

namespace ElectronicStore.Controllers
{
    public class CommentController : Controller
    {
        // GET: Comment
        public ActionResult Index(int id, int page = 1, int pageSize = 2)
        {
            ViewBag.ProductId = id;
            return View(CommentBus.ProductComments(id).ToPagedList(page, pageSize));
        }

        public ActionResult Create(string Name, string Telephone, string Review, string Email, int id)
        {
            var cmt = new Comment();
            cmt.Content = Review;
            cmt.DateCreated = DateTime.Now;
            cmt.ProductId = id;
            cmt.Status = true;
            cmt.Name = Name;
            cmt.Email = Email;
            cmt.Telephone = Telephone;
            CommentBus.Insert(cmt);
            return Redirect("/Product/Details/" + cmt.ProductId);
        }
    }
}