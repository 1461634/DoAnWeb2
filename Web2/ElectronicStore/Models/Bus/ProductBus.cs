using ElectronicStoreConnection;
using System;
using System.Collections.Generic;

namespace ElectronicStore.Models.Bus
{
    public class ProductBus
    {
        // get products list
        public static IEnumerable<Product> List()
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.Query<Product>("SELECT * FROM Products ORDER BY DateModified DESC, DateCreated DESC");
            }
        }

        // get product by id
        public static Product Find(int? id)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.SingleOrDefault<Product>("SELECT * FROM Products WHERE Id = @0", id);
            }
        }

        // get product details by id
        public static Product Details(int? id)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                var product = db.SingleOrDefault<Product>("SELECT * FROM Products WHERE Id = @0", id);
                product.Viewed += 1;
                db.Update(product);
                return product;
            }
        }

        // add new product
        public static void Add(Product p)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                db.Insert(p);
            }
        }

        public static View_Product ViewProduct(int id)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.SingleOrDefault<View_Product>("SELECT * FROM View_Product WHERE Id = @0", id);
            }
        }

        // edit product
        public static int Edit(Product entity)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                Product p = ProductBus.Details(entity.Id);
                p.BrandId = entity.BrandId;
                p.CateId = entity.CateId;
                p.Description = entity.Description;
                p.ImageUrl = entity.ImageUrl;
                p.Name = entity.Name;
                p.Price = entity.Price;
                p.TypeId = entity.TypeId;
                p.Quantity = entity.Quantity;
                p.Warranty = entity.Warranty;
                p.DateModified = entity.DateModified;
                return db.Update(p);
                
            }
        }
        
        // change status of product
        public static bool ChangeStatus(int id)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                var product = db.SingleOrDefault<Product>("WHERE Id = @0", id);
                product.Status = !product.Status;
                product.DateModified = DateTime.Now;
                db.Save(product);
                return product.Status;
            }
        }
        // delete a product
        public static int Delete(int id)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.Delete<Product>("WHERE Id = @0", id);
            }
        }

        // get top 10 best selling products
        public static IEnumerable<Product> Top10Featured()
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.Query<Product>("SELECT TOP 10 * FROM Products WHERE Sold > 0 ORDER BY Sold DESC");
            }
        }

        // get top 10 best selling products by category
        public static IEnumerable<Product> Top10FeaturedByCate(int id)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.Query<Product>("SELECT TOP 10 * FROM Products WHERE Sold > 0 AND CateId = @0 ORDER BY Sold DESC", id);
            }
        }
    }
}