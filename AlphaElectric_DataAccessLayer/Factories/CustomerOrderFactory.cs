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
    public class CustomerOrderFactory
    {
        CustomerOrderDA coDa;

        public CustomerOrderFactory()
        {
            coDa = new CustomerOrderDA();
        }

        public List<CustomerOrder> SelectAll()
        {
            return coDa.SelectAll();
        }

        public bool InsertCustomerOrder(CustomerOrder po)
        {
            return coDa.InsertCustomerOrder(po);
        }
    }
}
