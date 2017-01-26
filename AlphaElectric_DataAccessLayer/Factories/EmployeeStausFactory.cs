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
    public class EmployeeStatusFactory
    {
        EmployeeStatusDA empStatusDa;

        public EmployeeStatusFactory()
        {
            empStatusDa = new EmployeeStatusDA();
        }

        public List<EmployeeStatus> SelectAll()
        {
            return empStatusDa.SelectAll();
        }

        public bool InsertEmployeeStatus(EmployeeStatus desig)
        {
            return empStatusDa.InsertEmployeeStatus(desig);
        }
    }
}
