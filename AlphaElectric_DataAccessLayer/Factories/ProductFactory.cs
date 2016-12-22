using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

// Add DA namespace
using AlphaElectric_DataAccessLayer.DA;


namespace AlphaElectric_DataAccessLayer.Factories
{
    // Set it as public so we can access it in other project
    public class ProductFactory
    {
        ProductDA prodDa;

        public ProductFactory()
        {
            prodDa = new ProductDA();
        }

        public List<Product> SelectAll()
        {
            return prodDa.SelectAll();
        }

        public bool InsertStudent(Product prod)
        {
            return prodDa.InsertLocation(prod);
        }
    }
}
