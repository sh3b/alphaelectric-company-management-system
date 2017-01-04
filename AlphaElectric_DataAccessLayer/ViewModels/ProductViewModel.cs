using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ViewModels
{
    public class ProductViewModel : IDataErrorInfo
    {
        public int ID { get; set; }
        public string SerialNo { get; set; }
        public string Name { get; set; }
        public int MakeID { get; set; }

        public int PartTypeID { get; set; }
        public int PanelTypeID { get; set; }
        public int SizeID { get; set; }
        public int PanelIPNumberID { get; set; }
        public int CertComboBoxID { get; set; }



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

    //public class PanelViewModel
    //{
    //    public int ID { get; set; }
    //    public string SerialNo { get; set; }
    //    public string Name { get; set; }
    //    public int MakeID { get; set; }
    //    public int PanelShellGradeProtectionIPNumber { get; set; }
    //    public int SizeTypeID { get; set; }
    //    public int CertificationID { get; set; }
    //    public int TypeID { get; set; }

    //    public int MakeName { get; set; }
    //    public int PanelShellGradeProtectionIPNumberName { get; set; }
    //    public int SizeTypeName { get; set; }
    //    public int CertificationName { get; set; }
    //    public int TypeName { get; set; }
    //}
}
