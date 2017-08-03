using ElectronicStore.Helper;
using ElectronicStore.Models;
using ElectronicStore.Models.Bus;
using ElectronicStoreConnection;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace ElectronicStore.Controllers
{
    public class CartController : Controller
    {
        private const string CartSession = "CartSession";

        // GET: Cart
        public ActionResult Index()
        {
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }

        //POST: Delete all products from cart
        public JsonResult DeleteAll()
        {
            Session[CartSession] = null;
            return Json(new
            {
                status = true
            });
        }

        //POST: Delete each product from cart
        public JsonResult Delete(int id)
        {
            var sessionCart = (List<CartItem>)Session[CartSession];
            sessionCart.RemoveAll(x => x.Product.Id == id);
            Session[CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }

        //Update quantity of each product
        public JsonResult Update(string cartModel)
        {
            var jsonCart = new JavaScriptSerializer().Deserialize<List<CartItem>>(cartModel);
            var sessionCart = (List<CartItem>)Session[CartSession];

            foreach (var item in sessionCart)
            {
                var jsonItem = jsonCart.SingleOrDefault(x => x.Product.Id == item.Product.Id);
                if (jsonItem != null)
                {
                    item.Quantity = jsonItem.Quantity;
                }
            }
            Session[CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }

        //add a product to cart
        public ActionResult AddItem(int productId, int quantity)
        {
            var cart = Session[CartSession];
            if (cart != null)
            {
                var list = (List<CartItem>)cart;
                if (list.Exists(x => x.Product.Id == productId))
                {

                    foreach (var item in list)
                    {
                        if (item.Product.Id == productId)
                        {
                            item.Quantity += quantity;
                        }
                    }
                }
                else
                {
                    //create new cartItem object
                    var item = new CartItem();
                    item.Product = ProductBus.Details(productId);
                    item.Quantity = quantity;
                    list.Add(item);
                }
                //set to session
                Session[CartSession] = list;
            }
            else
            {
                //create new cartItem object
                var item = new CartItem();
                item.Product = ProductBus.Details(productId);
                item.Quantity = quantity;
                var list = new List<CartItem>();
                list.Add(item);
                //set to session
                Session[CartSession] = list;
            }
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Payment()
        {
            return View();
        }

        // Payment
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Payment(Order order)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    // insert into orders
                    order.OrderDate = DateTime.Now;
                    order.Status = 1;
                    int total = 0;
                    var cart = (List<CartItem>)Session[CartSession];
                    foreach (var item in cart)
                    {
                        total += item.Product.Price * item.Quantity;
                    }
                    order.Total = total;
                    order.UserId = User.Identity.GetUserId();
                    int id = OrderBus.Insert(order);
                    // insert into orderdetails
                    foreach (var item in cart)
                    {
                        var orderDetail = new OrderDetail();
                        orderDetail.ProductId = item.Product.Id;
                        orderDetail.OrderId = id;
                        orderDetail.UnitPrice = item.Product.Price;
                        orderDetail.Quantity = item.Quantity;
                        OrderDetailBus.Add(orderDetail);
                    }
                    // send mail to admin and client
                    string content = System.IO.File.ReadAllText(Server.MapPath("~/Assets/Client/template/neworder.html"));

                    content = content.Replace("{{CustomerName}}", order.Name);
                    content = content.Replace("{{Phone}}", order.Phone);
                    content = content.Replace("{{Email}}", order.Email);
                    content = content.Replace("{{Address}}", order.Address);
                    content = content.Replace("{{Total}}", order.Total.ToString());
                    var toEmail = ConfigurationManager.AppSettings["ToEmailAddress"].ToString();

                    new MailHelper().SendMail(order.Email, "Đơn hàng mới từ OnlineShop", content);
                    new MailHelper().SendMail(toEmail, "Đơn hàng mới từ OnlineShop", content);

                    return Redirect("/Cart/Finish");
                }
                catch (Exception ex)
                {
                    return View(ex.Message);
                }
            }
            else
            {
                ModelState.AddModelError("", "An error has ocurred, please try again");
                return View(order);
            }

        }

        // simple notification
        public ActionResult Finish()
        {
            return View();
        }
    }
}
