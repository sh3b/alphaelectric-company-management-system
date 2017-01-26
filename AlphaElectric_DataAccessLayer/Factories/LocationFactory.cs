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
    public class LocationFactory
    {
        LocationDA locDa;

        public LocationFactory()
        {
            locDa = new LocationDA();
        }

        public List<Location> SelectAll()
        {
            return locDa.SelectAll();
        }

        public bool InsertLocation(Location desig)
        {
            return locDa.InsertLocation(desig);
        }
    }
}
