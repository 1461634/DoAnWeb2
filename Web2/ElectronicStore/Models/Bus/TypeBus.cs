using ElectronicStoreConnection;
using System.Collections.Generic;

namespace ElectronicStore.Models.Bus
{
    public class TypeBus
    {
        /// <summary>
        /// Get all product types
        /// </summary>
        /// <returns></returns>
        public static IEnumerable<Type> List()
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.Query<Type>("SELECT * FROM Types WHERE Status = 1 ORDER BY Name");
            }
        }
    }
}