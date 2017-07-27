using ElectronicStoreConnection;
using System.Collections.Generic;

namespace ElectronicStore.Models.Bus
{
    public class ImageBus
    {
        // get images by product id
        public static IEnumerable<Image> List(int? id)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.Query<Image>("SELECT * FROM Images WHERE ProductId = @0", id);
            }
        }

        // find image
        public static Image Find(int id)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.SingleOrDefault<Image>("SELECT * FROM Images WHERE Id = @0", id);
            }
        }

        // add new image
        public static void Add(Image image)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                db.Insert(image);
            }

        }

        // edit image
        public static void Edit(Image image)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                db.Update(image);
            }

        }

        // delete image
        public static bool ChangeStatus(int id)
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                var image = db.SingleOrDefault<Image>("WHERE Id = @0", id);
                image.Status = !image.Status;
                db.Save(image);
                return image.Status;
            }
        }
    }
}