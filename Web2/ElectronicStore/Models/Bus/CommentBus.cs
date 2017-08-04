using ElectronicStoreConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ElectronicStore.Models.Bus
{
    public class CommentBus
    {
        public static void Insert(Comment entity)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                db.Insert(entity);
            }
        }

        public static IEnumerable<Comment> ProductComments(int id)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.Query<Comment>("SELECT * FROM Comments WHERE Status = 1 AND ProductId = @0 ORDER BY DateCreated DESC", id);
            }
        }
    }
}