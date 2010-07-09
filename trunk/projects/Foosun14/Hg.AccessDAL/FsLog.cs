using System;
using System.Data;
using System.Data.OleDb;
using Hg.DALFactory;
using Hg.DALProfile;
using Hg.Config;

namespace Hg.AccessDAL
{
    public class FsLog : DbBase, IFsLog
    {

        public int Add(int IsManager, string Title, string Content, string IP, string UserNum, string SiteID)
        {
            OleDbParameter[] parm = new OleDbParameter[7];
            parm[0] = new OleDbParameter("@title", OleDbType.VarWChar, 50);
            parm[0].Value = Title;
            parm[1] = new OleDbParameter("@content", OleDbType.VarWChar);
            parm[1].Value = Content;
            parm[2] = new OleDbParameter("@creatTime", OleDbType.Date);
            parm[2].Value = DateTime.Now;
            parm[3] = new OleDbParameter("@IP", OleDbType.VarWChar, 16);
            parm[3].Value = IP;
            parm[4] = new OleDbParameter("@usernum", OleDbType.VarWChar, 15);
            parm[4].Value = UserNum;
            parm[5] = new OleDbParameter("@SiteID", OleDbType.VarWChar, 12);
            parm[5].Value = SiteID;
            parm[6] = new OleDbParameter("@ismanage", OleDbType.VarWChar, 50);
            parm[6].Value = IsManager; 
            string SQL = "Insert Into " + Pre + "sys_logs("+Database.getParam(parm)+") Values("+Database.getAParam(parm)+")";
            
            return DbHelper.ExecuteNonQuery(CommandType.Text, SQL, parm);
        }
        public DataTable GetPage(string user, DateTime? startDate, DateTime? endDate, string siteId, int PageIndex, int PageSize, out int RecordCount, out int PageCount)
        {
            string sFilter = " where 1=1 ";
            if (!string.IsNullOrEmpty(user))
            {
                sFilter += " and usernum ='" + user + "' ";
            }
            if (startDate != null)
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
            string AllFields = " id,usernum,title,content,creatTime,SiteID,IP,ismanage ";
            string Condition = Pre + "sys_logs " + sFilter;
            string IndexField = "id";
            string OrderFields = "order by id desc";
            return DbHelper.ExecutePage(AllFields, Condition, IndexField, OrderFields, PageIndex, PageSize, out RecordCount, out PageCount, null);
        }

        public void Delete(DateTime logTime)
        {
            string sql = "Delete From " + Pre + "sys_logs Where creatTime<@creatTime";
            OleDbParameter[] parm = new OleDbParameter[1];
            parm[0] = new OleDbParameter("@creatTime", OleDbType.Date);
            parm[0].Value = logTime;
            DbHelper.ExecuteNonQuery(CommandType.Text, sql, parm);
        }

    }
}
