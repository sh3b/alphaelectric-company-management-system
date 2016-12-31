using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AlphaElectric.ViewModels
{
    public class ContactViewModel : IDataErrorInfo
    {
        public int ID { get; set; }
        public string CompanyName { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }

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
