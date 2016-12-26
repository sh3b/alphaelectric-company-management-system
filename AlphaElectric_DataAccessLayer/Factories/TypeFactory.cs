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
    public class TypeFactory
    {
        TypeDA typeDa;

        public TypeFactory()
        {
            typeDa = new TypeDA();
        }

        public List<Type> SelectAll()
        {
            return typeDa.SelectAll();
        }

        public bool InsertType(Type type)
        {
            return typeDa.InsertType(type);
        }
    }
}
