﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using Hg.Model;
using Hg.DALFactory;
using Hg.DALProfile;
using Hg.Config;

namespace Hg.AccessDAL
{
    public class AdminGroup : DbBase, IAdminGroup
    {
        private string SiteID;
        public AdminGroup()
        {
            SiteID = Hg.Global.Current.SiteID;
        }
        /// <summary>
        /// 增加管理员组
        /// </summary>
        /// <param name="agci">构造参数</param>
        /// <returns></returns>
        public int add(Hg.Model.AdminGroupInfo agci)
        {
            string checkSql = "";
            int recordCount = 0;
            string AdminGruopNum = Hg.Common.Rand.Number(8);
            while (true)
            {
                checkSql = "select count(*) from " + Pre + "sys_AdminGroup where adminGroupNumber='" + AdminGruopNum + "'";
                recordCount = (int)DbHelper.ExecuteScalar(CommandType.Text, checkSql, null);
                if (recordCount < 1)
                    break;
                else
                    AdminGruopNum = Hg.Common.Rand.Number(12, true);
            }
            checkSql = "select count(*) from " + Pre + "sys_AdminGroup where GroupName='" + agci.GroupName + "'";
            recordCount = (int)DbHelper.ExecuteScalar(CommandType.Text, checkSql, null);
            if (recordCount > 0)
            {
                throw new Exception("管理员组名称重复,请重新添加!");
            }
            OleDbParameter[] param = GetAdminGroupParameters(agci);
            OleDbParameter[] parm = Database.getNewParam(param, "GroupName,ClassList,channelList,SpecialList,CreatTime,SiteID");
            string Sql = "insert into " + Pre + "sys_AdminGroup (";
            Sql += "adminGroupNumber,GroupName,ClassList,channelList,SpecialList,CreatTime,SiteID";
            Sql += ") values ('" + AdminGruopNum + "',";
            Sql += "@GroupName,@ClassList,@channelList,@SpecialList,@CreatTime,@SiteID)";
            
            return Convert.ToInt32(DbHelper.ExecuteNonQuery(CommandType.Text, Sql, parm));
        }

        public int Edit(Hg.Model.AdminGroupInfo agci)
        {
            OleDbParameter[] param = GetAdminGroupParameters(agci);
            OleDbParameter[] parm = Database.getNewParam(param, "ClassList,SpecialList,channelList");

            string str_Sql = "Update " + Pre + "sys_AdminGroup Set ClassList='" + agci.ClassList + "',SpecialList='" + agci.SpecialList + "',";
            str_Sql += "channelList='" + agci.channelList + "' Where adminGroupNumber='" + agci.adminGroupNumber + "'";


            return Convert.ToInt32(DbHelper.ExecuteNonQuery(CommandType.Text, str_Sql, param));
        }

        public void Del(string id)
        {
            string str_Sql = "Delete From  " + Pre + "sys_AdminGroup where adminGroupNumber='" + id + "'";
            DbHelper.ExecuteNonQuery(CommandType.Text, str_Sql, null);
        }

        public DataTable getInfo(string id)
        {
            string str_Sql = "Select adminGroupNumber,GroupName,ClassList,SpecialList,channelList From " + Pre + "sys_AdminGroup Where SiteID='" + SiteID + "' and adminGroupNumber='" + id + "'";
            return DbHelper.ExecuteTable(CommandType.Text, str_Sql, null);
        }

        public DataTable getClassList(string col, string TbName, string sqlselect)
        {
            string str_Sql = "Select " + col + " From " + Pre + TbName + " " + sqlselect + " Order By ID Asc";
            return DbHelper.ExecuteTable(CommandType.Text, str_Sql, null);
        }

        public DataTable getColCname(string colname, string TbName, string classid, string id)
        {
            string str_Sql = "Select " + colname + " From " + Pre + TbName + " Where " + classid + "='" + id + "'";
            return DbHelper.ExecuteTable(CommandType.Text, str_Sql, null);
        }

        private OleDbParameter[] GetAdminGroupParameters(Hg.Model.AdminGroupInfo agci)
        {
            OleDbParameter[] param = new OleDbParameter[7];
            param[0] = new OleDbParameter("@adminGroupNumber", OleDbType.VarWChar, 8);
            param[0].Value = agci.adminGroupNumber;
            param[1] = new OleDbParameter("@GroupName", OleDbType.VarWChar, 20);
            param[1].Value = agci.GroupName;
            param[2] = new OleDbParameter("@ClassList", OleDbType.VarWChar);
            param[2].Value = agci.ClassList;
            param[3] = new OleDbParameter("@SpecialList", OleDbType.VarWChar);
            param[3].Value = agci.SpecialList;

            param[4] = new OleDbParameter("@channelList", OleDbType.VarWChar);
            param[4].Value = agci.channelList;
            param[5] = new OleDbParameter("@CreatTime", OleDbType.Date, 8);
            param[5].Value = agci.CreatTime;
            param[6] = new OleDbParameter("@SiteID", OleDbType.VarWChar, 12);
            param[6].Value = agci.SiteID;
            return param;
        }
    }
}
