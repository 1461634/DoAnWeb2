using ElectronicStoreConnection;
using System;

namespace ElectronicStore.Models
{
    [Serializable]
    public class CartItem
    {
        public Product Product { get; set; }
        public int Quantity { get; set; }
    }
}