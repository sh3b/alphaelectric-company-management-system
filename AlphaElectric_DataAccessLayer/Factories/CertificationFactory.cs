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
    public class CertificationFactory
    {
        CertificationDA certDa;

        public CertificationFactory()
        {
            certDa = new CertificationDA();
        }

        public List<Certification> SelectAll()
        {
            return certDa.SelectAll();
        }

        public bool InsertCertification(Certification cert)
        {
            return certDa.InsertCertification(cert);
        }
    }
}
