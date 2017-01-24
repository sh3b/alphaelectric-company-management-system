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
    public class EmployeeFactory
    {
        EmployeeDA empDa;

        public EmployeeFactory()
        {
            empDa = new EmployeeDA();
        }

        public List<Employee> SelectAll()
        {
            return empDa.SelectAll();
        }

        public List<Employee> SelectByDesignation(int id)
        {
            return empDa.SelectByDesignation(id);
        }

        public bool InsertEmployee(Employee emp)
        {
            return empDa.InsertEmployee(emp);
        }

        public bool Update(int id, string firstname, string lastname, string phone, string passport, DateTime joindate, string address, int desigid)
        {
            return empDa.Update(id, firstname, lastname, phone, passport, joindate, address, desigid);
        }
    }
}
