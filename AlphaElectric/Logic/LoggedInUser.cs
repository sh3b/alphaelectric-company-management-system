using AlphaElectric_DataAccessLayer;

namespace AlphaElectric.Logic
{
    public class LoggedInUser
    {
        public Login Info;
        public void RemoveData()
        {
            Info = null;
        }
        private static LoggedInUser instance;

        private LoggedInUser() { }

        public static LoggedInUser Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new LoggedInUser();
                }
                return instance;
            }
        }

        //Multithreaded
        //For both C# and Java, "volatile" tells the compiler that the value of a variable must never be cached as 
        //its value may change outside of the scope of the program itself. The compiler will then avoid any optimisations 
        //that may result in problems if the variable changes "outside of its control".
        //private static volatile LoggedInUser instance;
        //private static object syncRoot = new Object();

        //public static LoggedInUser Instance
        //{
        //    get
        //    {
        //        if (instance == null)
        //        {
        //            lock (syncRoot)
        //            {
        //                if (instance == null)
        //                    instance = new LoggedInUser();
        //            }
        //        }

        //        return instance;
        //    }
        //}
    }
}
