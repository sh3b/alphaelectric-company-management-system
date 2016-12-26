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
    public class PaTypeFactory
    {
        PaTypeDA patypeDa;

        public PaTypeFactory()
        {
            patypeDa = new PaTypeDA();
        }

        public List<PaType> SelectAll()
        {
            return patypeDa.SelectAll();
        }

        public bool InsertPaType(PaType patype)
        {
            return patypeDa.InsertPaType(patype);
        }
    }
}
