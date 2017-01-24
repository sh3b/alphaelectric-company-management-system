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
    public class OrderStatusFactory
    {
        OrderStatusDA ordstatusDa;

        public OrderStatusFactory()
        {
            ordstatusDa = new OrderStatusDA();
        }

        public List<OrderStatus> SelectAll()
        {
            return ordstatusDa.SelectAll();
        }

        public bool InsertOrderStatus(OrderStatus con)
        {
            return ordstatusDa.InsertOrderStatus(con);
        }

        public bool Update(int id, string name)
        {
            return ordstatusDa.Update(id, name);
        }
    }
}
