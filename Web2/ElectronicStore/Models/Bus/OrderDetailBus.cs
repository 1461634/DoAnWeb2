using ElectronicStoreConnection;
using System.Collections.Generic;

namespace ElectronicStore.Models.Bus
{
    public class OrderDetailBus
    {
        public static void Add(OrderDetail entity)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                db.Insert(entity);
            }
        }

        public static IEnumerable<View_OrderDetail> Details(int id)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.Query<View_OrderDetail>("SELECT * FROM View_OrderDetails WHERE Id = @0", id);
            }
        }
    }
}