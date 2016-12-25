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
    public class InventoryFactory
    {
        InventoryDA invenDa;

        public InventoryFactory()
        {
            invenDa = new InventoryDA();
        }

        public List<Inventory> SelectAll()
        {
            return invenDa.SelectAll();
        }

        public bool InsertInventory(Inventory inven)
        {
            return invenDa.InsertInventory(inven);
        }
    }
}
