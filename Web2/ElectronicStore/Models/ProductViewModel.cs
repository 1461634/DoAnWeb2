using ElectronicStoreConnection;

namespace ElectronicStore.Models
{
    public class ProductViewModel
    {
        public Product Product { get; set; }
        public Category Category { get; set; }
        public Brand Brand { get; set; }
        public ElectronicStoreConnection.Type Type { get; set; }
    }
}