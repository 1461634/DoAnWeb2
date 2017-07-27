using ElectronicStoreConnection;
using System.Collections.Generic;

namespace ElectronicStore.Models.Bus
{
    public class CategoryBus
    {
        public static IEnumerable<Category> List()
        {
            using(var db = new ElectronicStoreConnectionDB())
            {
                return db.Query<Category>("SELECT * FROM Categories ORDER BY DateCreated DESC, DateModified DESC");
            }
            
        }

        public static Category Details(int id)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.SingleOrDefault<Category>("WHERE Id = @0", id);
            }
        }

        public static void Add(Category entity)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                db.Insert(entity);
            }
        }

        public static int Edit(Category entity)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.Update(entity);
            }
        }

        public static int Delete(int id)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                var cate = Details(id);
                cate.Status = !cate.Status;
                return db.Update(cate);
            }
        }
    }
}