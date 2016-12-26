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
    public class SizeTypeFactory
    {
        SizeTypeDA sztypeDa;

        public SizeTypeFactory()
        {
            sztypeDa = new SizeTypeDA();
        }

        public List<SizeType> SelectAll()
        {
            return sztypeDa.SelectAll();
        }

        public bool InsertSizeType(SizeType sztype)
        {
            return sztypeDa.InsertSizeType(sztype);
        }
    }
}
