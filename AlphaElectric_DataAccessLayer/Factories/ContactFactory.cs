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
    public class ContactFactory
    {
        ContactDA conDa;

        public ContactFactory()
        {
            conDa = new ContactDA();
        }

        public List<Contact> SelectAll()
        {
            return conDa.SelectAll();
        }

        public bool InsertContact(Contact con)
        {
            return conDa.InsertContact(con);
        }
    }
}
