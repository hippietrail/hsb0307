using System;
using System.Data;
using System.Data.SqlClient;
using Hg.DALFactory;
using Hg.DALProfile;
using Hg.Config;
using Hg.Model;

namespace Hg.SQLServerDAL
{
    public class FsLog : DbBase, IFsLog
    {

        public int Add(int IsManager, string Title, string Content, string IP, string UserNum, string SiteID)
        {
            string SQL = "Insert Into " + Pre + "sys_logs(title,content,creatTime,IP,usernum,SiteID,ismanage) Values(@title,@content,@creatTime,@IP,@usernum,@SiteID,@ismanage)";
            SqlParameter[] parm = new SqlParameter[7];
            parm[0] = new SqlParameter("@title", SqlDbType.NVarChar, 50);
            parm[0].Value = Title;
            parm[1] = new SqlParameter("@content", SqlDbType.NText);
            parm[1].Value = Content;
            parm[2] = new SqlParameter("@creatTime", SqlDbType.DateTime);
            parm[2].Value = DateTime.Now;
            parm[3] = new SqlParameter("@IP", SqlDbType.NVarChar, 16);
            parm[3].Value = IP;
            parm[4] = new SqlParameter("@usernum", SqlDbType.NVarChar, 15);
            parm[4].Value = UserNum;
            parm[5] = new SqlParameter("@SiteID", SqlDbType.NVarChar, 12);
            parm[5].Value = SiteID;
            parm[6] = new SqlParameter("@ismanage", SqlDbType.NVarChar, 50);
            parm[6].Value = IsManager;
            return DbHelper.ExecuteNonQuery(CommandType.Text, SQL, parm);
        }

        public DataTable GetPage(string user, DateTime? startDate, DateTime? endDate, string siteId, int PageIndex, int PageSize, out int RecordCount, out int PageCount)
        {
            string sFilter = " where 1=1 ";
            if (!string.IsNullOrEmpty ( user))
            {
                sFilter += " and usernum ='" + user+"' ";
            }
            if (startDate !=null)
            {
                sFilter += " AND creatTime >= '" + startDate.Value.ToString("yyyy-MM-dd") + " 00:00:00.000' ";
            }
            if (endDate != null)
            {
                sFilter += " AND creatTime < '" + endDate.Value.AddDays(1).ToString("yyyy-MM-dd") + " 00:00:00.000' ";
            }
            if (siteId != "0")
            {
                sFilter += " AND SiteID ='" + siteId + "'";

 
            }
            string AllFields = " id,usernum,title,[content],creatTime,SiteID,IP,ismanage ";
            string Condition = Pre + "sys_logs " + sFilter;
            string IndexField = "id";
            string OrderFields = "order by id desc";
            return DbHelper.ExecutePage(AllFields, Condition, IndexField, OrderFields, PageIndex, PageSize, out RecordCount, out PageCount, null);
        }

        public void Delete(DateTime logTime)
        {
            string sql = "Delete From " + Pre + "sys_logs Where creatTime<@creatTime";
            SqlParameter[] parm=new SqlParameter[1];
            parm[0] = new SqlParameter("@creatTime", SqlDbType.DateTime);
            parm[0].Value = logTime;
            DbHelper.ExecuteNonQuery(CommandType.Text, sql, parm);
        }



    }
}
