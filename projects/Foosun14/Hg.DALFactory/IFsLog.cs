using System;
using System.Reflection;
using System.Data;
namespace Hg.DALFactory
{
    public interface IFsLog
    {
        int Add(int IsManager,string Title,string Content,string IP,string UserNum,string SiteID);
        DataTable GetPage(string user, DateTime? startDate, DateTime? endDate, string siteId, int PageIndex, int PageSize, out int RecordCount, out int PageCount);
        void Delete(DateTime logTime);
    }
    public sealed partial class DataAccess
    {
        public static IFsLog CreateFsLog()
        {
            string className = path + ".FsLog";
            return (IFsLog)Assembly.Load(path).CreateInstance(className);
        }
    }
}
