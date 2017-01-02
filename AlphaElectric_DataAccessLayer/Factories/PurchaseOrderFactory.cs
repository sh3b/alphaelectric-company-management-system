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
    public class PurchaseOrderFactory
    {
        PurchaseOrderDA poDa;

        public PurchaseOrderFactory()
        {
            poDa = new PurchaseOrderDA();
        }

        public List<PurchaseOrder> SelectAll()
        {
            return poDa.SelectAll();
        }

        public bool InsertPurchaseOrder(PurchaseOrder po)
        {
            return poDa.InsertPurchaseOrder(po);
        }
    }
}
