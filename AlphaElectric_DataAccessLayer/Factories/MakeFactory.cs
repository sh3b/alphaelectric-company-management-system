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
    public class MakeFactory
    {
        MakeDA mkDa;

        public MakeFactory()
        {
            mkDa = new MakeDA();
        }

        public List<Make> SelectAll()
        {
            return mkDa.SelectAll();
        }

        public bool InsertMake(Make mk)
        {
            return mkDa.InsertMake(mk);
        }
    }
}
