using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ElectronicStore.Helper
{
    public class InternetConnection
    {
        public static bool isConnected()
        {
            try
            {
                using (var client = new System.Net.WebClient())
                {
                    using (client.OpenRead("http://clients3.google.com/generate_204"))
                    {
                        return true;
                    }
                }
            }
            catch
            {
                return false;
            }
        }
    }
}