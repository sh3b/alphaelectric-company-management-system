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
    public class Panel_ProjectBTFactory
    {
        Panel_ProjectBTDA panelProjBTDa;

        public Panel_ProjectBTFactory()
        {
            panelProjBTDa = new Panel_ProjectBTDA();
        }

        public List<Panel_ProjectBT> SelectAll()
        {
            return panelProjBTDa.SelectAll();
        }

        public bool InsertPanel_ProjectBT(Panel_ProjectBT productPurchaseBT)
        {
            return panelProjBTDa.InsertPanel_ProjectBT(productPurchaseBT);
        }
    }
}
