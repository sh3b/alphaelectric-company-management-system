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
    public class DesignationFactory
    {
        DesignationDA desigDa;

        public DesignationFactory()
        {
            desigDa = new DesignationDA();
        }

        public List<Designation> SelectAll()
        {
            return desigDa.SelectAll();
        }

        public bool InsertDesignation(Designation desig)
        {
            return desigDa.InsertDesignation(desig);
        }
    }
}
