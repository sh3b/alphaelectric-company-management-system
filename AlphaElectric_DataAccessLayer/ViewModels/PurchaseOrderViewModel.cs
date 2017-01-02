using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ViewModels
{
    public class PurchaseOrderViewModel : IDataErrorInfo
    {
        public int ID { get; set; }
        public System.DateTime PODate { get; set; }
        public int ContactID { get; set; }

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
