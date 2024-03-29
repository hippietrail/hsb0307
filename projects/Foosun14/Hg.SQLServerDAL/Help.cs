﻿using System;
using System.Data;
using System.Data.SqlClient;
using Hg.DALFactory;
using Hg.Model;
using System.Text.RegularExpressions;
using System.Text;
using System.Reflection;
using Hg.DALProfile;
using Hg.Config;

namespace Hg.SQLServerDAL
{
    public class Help : DbBase, IHelp
    {
        private string cnstr;
        public Help()
        {
            cnstr = DBConfig.HelpConString;
        }
        public int Str_CheckSql(string Str_HelpID)
        {
            SqlParameter param = new SqlParameter("@HelpID",Str_HelpID);
            string Sql = "Select count(HelpID) From " + Pre + "Sys_Help Where HelpID=@HelpID";
            return (int)DbHelper.ExecuteScalar(cnstr, CommandType.Text, Sql, param);
        }
        public int Str_InsSql(string Str_HelpID, string Str_CnHelpTitle, string Str_CnHelpContent)
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@HelpID",SqlDbType.NVarChar,30);
            param[0].Value = Str_HelpID;
            param[1] = new SqlParameter("@TitleCN", SqlDbType.NVarChar, 80);
            param[1].Value = Str_CnHelpTitle;
            param[2] = new SqlParameter("@ContentCN", SqlDbType.NText);
            param[2].Value = Str_CnHelpContent;
            string Sql = "Insert Into " + Pre + "Sys_Help(HelpID,TitleCN,ContentCN) Values(@HelpID,@TitleCN,@ContentCN)";
            return DbHelper.ExecuteNonQuery(cnstr, CommandType.Text, Sql, param);
        }

        public int updatehelp(int Str_HelpID, string Str_CnHelpTitle, string Str_CnHelpContent)
        {
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@HelpID", SqlDbType.NVarChar, 30);
            param[0].Value = Str_HelpID;
            param[1] = new SqlParameter("@TitleCN", SqlDbType.NVarChar, 80);
            param[1].Value = Str_CnHelpTitle;
            param[2] = new SqlParameter("@ContentCN", SqlDbType.NText);
            param[2].Value = Str_CnHelpContent;

            string Sql = "update " + Pre + "Sys_Help set TitleCN=@TitleCN,ContentCN=@ContentCN where id=@HelpID";
            return DbHelper.ExecuteNonQuery(cnstr, CommandType.Text, Sql, param);
        }

        public int Str_DelSql(int ID)
        {
            string Sql = "Delete From " + Pre + "Sys_Help Where id=" + ID;
            return DbHelper.ExecuteNonQuery(cnstr, CommandType.Text, Sql, null);
        }
        public DataTable GetPage(string _helpID, int PageIndex, int PageSize, out int RecordCount, out int PageCount, params SQLConditionInfo[] SqlCondition)
        {
            string QSQL = "";
            SqlParameter param = null;
            if (_helpID != "" && _helpID != null)
            {
                param = new SqlParameter("@HelpID", _helpID);
                QSQL = " and HelpID=@HelpID";
            }

            string AllFields = "id,HelpID,TitleCN";
            string Condition = "" + Pre + "Sys_Help where 1=1 " + QSQL + "";
            string IndexField = "id";
            string OrderFields = "order by id desc";
            return DbHelper.ExecutePage(cnstr, AllFields, Condition, IndexField, OrderFields, PageIndex, PageSize, out RecordCount, out PageCount, param);
        }

        public DataTable getHelpID(int ID)
        {
            string Sql = "select ID,HelpID,TitleCN,ContentCN from " + Pre + "Sys_Help where ID=" + ID + "";
            return DbHelper.ExecuteTable(cnstr, CommandType.Text, Sql, null);
        }

        public DataTable getHelpID1(string HelpID)
        {
            SqlParameter param = new SqlParameter("@HelpID", HelpID);
            string Sql = "select ID,HelpID,TitleCN,ContentCN from " + Pre + "Sys_Help where HelpID=@HelpID";
            return DbHelper.ExecuteTable(cnstr, CommandType.Text, Sql, param);
        }
    }
}
