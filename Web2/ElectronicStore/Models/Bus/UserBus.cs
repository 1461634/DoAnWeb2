using ElectronicStoreConnection;
using System.Collections.Generic;

namespace ElectronicStore.Models.Bus
{
    public class UserBus
    {
        public static IEnumerable<View_Profile> List()
        {
            using(var db = new ElectronicStoreConnectionDB())
            {
                return db.Query<View_Profile>("SELECT * FROM View_Profile ORDER BY Email, FirstName, LastName");
            }
        }

        public static IEnumerable<View_PurchaseHistory> PurchaseHistory(string id)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.Query<View_PurchaseHistory>("SELECT DISTINCT * FROM View_PurchaseHistory WHERE Id = @0", id);
            }
        }

        public static IEnumerable<Order> OrderPurchase(string id)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.Query<Order>("SELECT * FROM Orders WHERE UserId = @0 ORDER By OrderDate DESC", id);
            }
        }

        public static View_Profile Details(string id)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.SingleOrDefault<View_Profile>("SELECT * FROM View_Profile WHERE Id = @0", id);
            }
        }

        public static AspNetUser Find(string id)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.SingleOrDefault<AspNetUser>("SELECT * FROM AspNetUsers WHERE Id = @0", id);
            }
        }

        public static void Add(View_Profile entity)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                db.Insert(entity);
            }
        }

        public static int Edit(AspNetUser entity)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.Update(entity);
            }
        }

        public static int Delete(string id)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                var user = Details(id);
                return db.Delete(user);
            }
        }

        public static AspNetUserRole UserRoleDetails(string id)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.SingleOrDefault<AspNetUserRole>("SELECT * FROM AspNetUserRoles WHERE UserId = @0", id);
            }
        }

        public static int RoleEdit(AspNetUserRole entity)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.Update(entity);
            }
        }
    }
}