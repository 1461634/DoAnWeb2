using ElectronicStoreConnection;
using System.Collections.Generic;

namespace ElectronicStore.Models.Bus
{
    public class BrandBus
    {
        public static IEnumerable<Brand> List()
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.Query<Brand>("SELECT * FROM Brands WHERE Status = 1 ORDER BY Name");
            }
        }
    }
}