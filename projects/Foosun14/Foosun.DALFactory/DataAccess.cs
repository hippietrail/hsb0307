using System.Reflection;
using System.Configuration;

namespace Hg.DALFactory
{
    public sealed partial class DataAccess
    {
        private static readonly string path =Hg.Config.UIConfig.WebDAL;
       
        public  DataAccess() { }
    }
}
