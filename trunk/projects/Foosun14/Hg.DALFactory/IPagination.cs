using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Hg.Model;
using System.Reflection;

namespace Hg.DALFactory
{
    public interface IPagination
    {
        DataTable GetPage(string PageName, int PageIndex, int PageSize, out int RecordCount, out int PageCount, params SQLConditionInfo[] SqlCondition);
    }
    public sealed partial class DataAccess
    {
        public static IPagination CreatePagination()
        {
            string className = path + ".Pagination";
            return (IPagination)Assembly.Load(path).CreateInstance(className);
        }
    }
}
