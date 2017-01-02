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
    public class Product_PurchaseOrderBTFactory
    {
        Product_PurchaseOrderBTDA productPurchaseBTDa;

        public Product_PurchaseOrderBTFactory()
        {
            productPurchaseBTDa = new Product_PurchaseOrderBTDA();
        }

        public List<Product_PurchaseOrderBT> SelectAll()
        {
            return productPurchaseBTDa.SelectAll();
        }

        public bool InsertCertification(Product_PurchaseOrderBT productPurchaseBT)
        {
            return productPurchaseBTDa.InsertProduct_PurchaseOrderBT(productPurchaseBT);
        }
    }
}
