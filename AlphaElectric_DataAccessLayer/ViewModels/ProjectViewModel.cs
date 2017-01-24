using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ViewModels
{
    public class ProjectViewModel : IDataErrorInfo
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public DateTime DeliveryDate { get; set; }

        //Proj Item
        public int ProdID { get; set; } //Panel
        public int Quantity { get; set; }

        //Order Details
        public int CustomerOrderID { get; set; }
        public DateTime OrderDate { get; set; }
        public int ContactID { get; set; }
        public int AssignedEmployeeID { get; set; }
        public int OrderStatusID { get; set; }

        public string Error
        {
            get
            {
                return null;
            }
        }
        public string this[string columnName]
        {
            get
            {
                string result = null;

                //if (columnName == "Name")
                //    if (string.IsNullOrEmpty(this.Name))
                //        result = "Name is required";

                //if (columnName == "SerialNo")
                //    if (string.IsNullOrEmpty(this.SerialNo))
                //        result = "Serial no. is required";

                return result;
            }
        }
       
    }
}
