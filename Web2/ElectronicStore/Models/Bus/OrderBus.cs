using ElectronicStoreConnection;
using System.Collections.Generic;

namespace ElectronicStore.Models.Bus
{
    public class OrderBus
    {
        public static int Insert(Order o)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                db.Insert(o);
                return o.Id;
            }
        }

        public static IEnumerable<Order> List()
        {
            using(var db = new ElectronicStoreConnectionDB())
            {
                return db.Query<Order>("SELECT * FROM Orders ORDER BY OrderDate DESC");
            }
        }

        public static int ChangeStatus(int id)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                var order = db.SingleOrDefault<Order>("WHERE Id = @0", id);
                if(order.Status == 0)
                {
                    order.Status = 1;
                }
                else if (order.Status == 1)
                {
                    order.Status = 2;
                }   
                else
                {
                    order.Status = 2;
                }   
                db.Save(order);
                return order.Status;
            }
        }
    }
}