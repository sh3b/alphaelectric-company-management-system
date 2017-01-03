using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AlphaElectric_DataAccessLayer;

namespace ViewModels
{
    public class CustomerOrderViewModel : IDataErrorInfo
    {
        public int ID { get; set; }
        public System.DateTime OrderDate { get; set; }
        public System.DateTime DeliveryDate { get; set; }
        public int ContactID { get; set; }
        public int Quantity { get; set; }

        public int prodID { get; set; }

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
