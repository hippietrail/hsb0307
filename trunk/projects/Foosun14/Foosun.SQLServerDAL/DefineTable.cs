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
    public class DefineTable : DbBase, IDefineTable
    {
        #region DefineTable.aspx
        public DataTable Sel_DefineInfoId()
        {
            string Sql = "Select DefineInfoId,DefineName,ParentInfoId From " + Pre + "define_class where SiteID='" + Hg.Global.Current.SiteID + "'";
            return DbHelper.ExecuteTable(CommandType.Text, Sql, null);
        }
        public DataTable Sel_ParentInfoId(string PID)
        {
            SqlParameter param = new SqlParameter("@ParentInfoId",PID);
            string Sql = "Select DefineInfoId,DefineName,ParentInfoId From " + Pre + "define_class where ParentInfoId=@ParentInfoId and SiteID='" + Hg.Global.Current.SiteID + "'";
            return DbHelper.ExecuteTable(CommandType.Text, Sql, param);
        }
        public int sel_defCname(string defCname)
        {
            SqlParameter param = new SqlParameter("@DefineCname", defCname);
            string Sql = "Select count(id) From " + Pre + "Define_Data  Where DefineCname=@DefineCname";
            return (int)DbHelper.ExecuteScalar(CommandType.Text, Sql, param);
        }
        public int sel_defEname(string defEname)
        {
            SqlParameter param = new SqlParameter("@defineColumns", defEname);
            string Sql = "Select count(id) From " + Pre + "Define_Data  Where defineColumns=@defineColumns";
            return (int)DbHelper.ExecuteScalar(CommandType.Text, Sql, param);
        }

        public int Add(string Str_ColumnsType, string defCname, string defEname, int definSelected, int Isnull, string defColumns, string defExp, string definedvalue)
        {
            SqlParameter[] param = new SqlParameter[8];
            param[0] = new SqlParameter("@ColumnsType",SqlDbType.NVarChar,12);
            param[0].Value= Str_ColumnsType;
            param[1] = new SqlParameter("@defCname",SqlDbType.NVarChar,50);
            param[1].Value= defCname;
            if (defEname == null)
                defEname = "";
            param[2] = new SqlParameter("@defEname",SqlDbType.NVarChar,50);
            param[2].Value= defEname;
            param[3] = new SqlParameter("@defineType",SqlDbType.Int,4);
            param[3].Value= definSelected;
            param[4] = new SqlParameter("@Is_null",SqlDbType.Int,4);
            param[4].Value= Isnull;
            if (defColumns == null)
                defColumns = "";
            param[5] = new SqlParameter("@defColumns",SqlDbType.NText);
            param[5].Value= defColumns;
            if (defExp == null)
                defExp = "";
            param[6] = new SqlParameter("@defExp",SqlDbType.NVarChar,200);
            param[6].Value= defExp;
            if (definedvalue == null)
                definedvalue = "";
            param[7] = new SqlParameter("@definedvalue", SqlDbType.NVarChar, 200);
            param[7].Value= definedvalue;

            string Sql = "Insert Into " + Pre + "Define_Data(defineInfoId,DefineCname,DefineColumns,defineType,IsNull,defineValue," +
                         "defineExpr,SiteID,definedvalue) Values(@ColumnsType,@defCname,@defEname,@defineType,@Is_null,@defColumns," +
                         "@defExp,'" + Hg.Global.Current.SiteID + "',@definedvalue)";
            return DbHelper.ExecuteNonQuery(CommandType.Text, Sql, param);
        }
        #endregion

        #region DefineTable_Edit_List.aspx
        public DataTable Str_Start_Sql(int ID)
        {
            SqlParameter param = new SqlParameter("@ID", ID);
            string Sql = "Select id,defineInfoId,defineCname,defineColumns,defineType,IsNull,defineValue,defineExpr,definedvalue From " + Pre + "define_data where Id=@ID";
            return DbHelper.ExecuteTable(CommandType.Text, Sql, param);
        }
        public int Update(string Str_ColumnsType, string Str_DefName, string Str_DefEname, string Str_DefType, int Str_DefIsNull, string Str_DefColumns, string Str_DefExpr, int DefID, string definedvalue)
        {
            SqlParameter[] param = new SqlParameter[9];
            param[0] = new SqlParameter("@ColumnsType", SqlDbType.NVarChar, 12);
            param[0].Value = Str_ColumnsType;
            param[1] = new SqlParameter("@defCname", SqlDbType.NVarChar, 50);
            param[1].Value = Str_DefName;
            if (Str_DefEname == null)
                Str_DefEname = "";
            param[2] = new SqlParameter("@defEname", SqlDbType.NVarChar, 50);
            param[2].Value = Str_DefEname;
            param[3] = new SqlParameter("@defineType", SqlDbType.Int, 4);
            param[3].Value = Convert.ToInt32(Str_DefType);
            param[4] = new SqlParameter("@Is_null", SqlDbType.Int, 4);
            param[4].Value = Convert.ToInt32(Str_DefIsNull);
            param[5] = new SqlParameter("@defColumns", SqlDbType.NText);
            if (Str_DefColumns == null)
                Str_DefColumns = "";
            param[5].Value = Str_DefColumns;
            param[6] = new SqlParameter("@defExp", SqlDbType.NVarChar, 200);
            if (Str_DefExpr == null)
                Str_DefExpr = "";
            param[6].Value = Str_DefExpr;
            param[7] = new SqlParameter("@definedvalue", SqlDbType.NVarChar, 200);
            if (definedvalue == null)
                definedvalue = "";
            param[7].Value = definedvalue;
            param[8] = new SqlParameter("@DefID", SqlDbType.Int, 4);
            param[8].Value = DefID;

            string Sql = "Update " + Pre + "define_data Set defineInfoId=@ColumnsType,defineCname=@defCname," +
                         "defineColumns=@defEname,defineType=@defineType,IsNull=@Is_null,defineValue=@defColumns," +
                         "defineExpr=@defExp,definedvalue=@definedvalue where id=@DefID";
            return DbHelper.ExecuteNonQuery(CommandType.Text, Sql, param);
        }
        #endregion

        #region DefineTable_Edit_Manage.aspx
        public DataTable Str_DefID(string DefID)
        {
            SqlParameter param = new SqlParameter("@DefineInfoId", DefID);
            string Sql = "Select DefineInfoId,DefineName,ParentInfoId From " + Pre + "define_class where DefineInfoId=@DefineInfoId";
            return DbHelper.ExecuteTable(CommandType.Text, Sql, param);
        }
        public int Update1(string Str_NewText, string DefID)
        {
            SqlParameter[] param = new SqlParameter[] { new SqlParameter("@DefineName", Str_NewText), new SqlParameter("@DefineInfoId", DefID) };
            string Sql = "Update " + Pre + "define_class Set DefineName=@DefineName where DefineInfoId=@DefineInfoId";
            return DbHelper.ExecuteNonQuery(CommandType.Text, Sql, param);
        }
        #endregion

        #region DefineTable_List.aspx

        public DataTable GetPage(string defid, int PageIndex, int PageSize, out int RecordCount, out int PageCount, params SQLConditionInfo[] SqlCondition)
        {
            string where = "";
            if (defid == null && defid == string.Empty)
            {
                where = "";
            }
            else
            {
                where = "  where defineInfoId=@defineInfoId";
            }
            SqlParameter param = new SqlParameter("@defineInfoId", defid);
            string AllFields = "id,defineInfoId,defineCname,defineType,[IsNull]";
            string Condition = "" + Pre + "Define_Data " + where + "";
            string IndexField = "id";
            string OrderFields = "order by id Desc";
            return DbHelper.ExecutePage(AllFields, Condition, IndexField, OrderFields, PageIndex, PageSize, out RecordCount, out PageCount, param);
        }
        public int Str_Del_Data(string pr)
        {
            SqlParameter param = new SqlParameter("@defineInfoId", pr);
            string Sql = "Delete From " + Pre + "define_data where defineInfoId=@defineInfoId";
            return DbHelper.ExecuteNonQuery(CommandType.Text, Sql, param);
        }
        public void Delete(string CheckboxArray)
        {
            string Sql = "Delete From " + Pre + "define_data where Id in(" + CheckboxArray + ")";
            DbHelper.ExecuteNonQuery(CommandType.Text, Sql, null);
        }
        public int Delete1(int DefID)
        {
            string Sql = "Delete From " + Pre + "define_data where Id=" + DefID + "";
            return DbHelper.ExecuteNonQuery(CommandType.Text, Sql, null);
        }
        #endregion


        public DataTable sel_Str(string Classid)
        {
            SqlParameter param = new SqlParameter("@ParentInfoID", Classid);
            string Sql = "Select DefineID,DefineInfoId,DefineName,ParentInfoID From " + Pre + "define_class where ParentInfoID=@ParentInfoID";
            return DbHelper.ExecuteTable(CommandType.Text, Sql, param);
        }
        public int sel_1(string _NewText)
        {
            SqlParameter param = new SqlParameter("@DefineName", _NewText);
            string Sql = "Select count(DefineId) From " + Pre + "Define_Class Where DefineName=@DefineName";
            return (int)DbHelper.ExecuteScalar(CommandType.Text, Sql, param);
        }
        public int sel_2(string rand)
        {
            SqlParameter param = new SqlParameter("@DefineInfoId", rand);
            string Sql = "Select count(DefineId) From " + Pre + "Define_Class Where DefineInfoId=@DefineInfoId";
            return (int)DbHelper.ExecuteScalar(CommandType.Text, Sql, param);
        }
        public int Add2(string rand, string _NewText, string _PraText)
        {
            SqlParameter[] param = new SqlParameter[] { new SqlParameter("@DefineInfoId", rand), new SqlParameter("@DefineName", _NewText), new SqlParameter("@ParentInfoId", _PraText) };
            string Sql = "Insert Into " + Pre + "Define_Class(DefineInfoId,DefineName,ParentInfoId,SiteID) values(@DefineInfoId,@DefineName,@ParentInfoId,'" + Hg.Global.Current.SiteID + "')";
            return DbHelper.ExecuteNonQuery(CommandType.Text, Sql, param);
        }
        public void Delete3(string DefID)
        {
            SqlParameter param = new SqlParameter("@DefineInfoId", DefID);
            string Sql = "Delete From " + Pre + "define_class where DefineInfoId=@DefineInfoId";
            DbHelper.ExecuteNonQuery(CommandType.Text, Sql, param);
        }
        public void Delete4(string DefID)
        {
            SqlParameter param = new SqlParameter("@ParentInfoId", DefID);
            string Sql = "Delete From " + Pre + "define_class where ParentInfoId=@ParentInfoId";
            DbHelper.ExecuteNonQuery(CommandType.Text, Sql, param);
        }
        public void Delete5(string DefID)
        {
            SqlParameter param = new SqlParameter("@defineInfoId", DefID);
            string Sql = "Delete From " + Pre + "define_data where defineInfoId=@defineInfoId";
            DbHelper.ExecuteNonQuery(CommandType.Text, Sql, param);
        }
        public int Delete6()
        {
            string Sql = "";
            if (Hg.Global.Current.SiteID == "0") { Sql = "Delete From " + Pre + "define_class"; }
            else { Sql = "Delete From " + Pre + "define_class where SiteID='" + Hg.Global.Current.SiteID + "'"; }
            return DbHelper.ExecuteNonQuery(CommandType.Text, Sql, null);
        }

        public int Delete7()
        {
            string Sql = "";
            if (Hg.Global.Current.SiteID == "0")
            { Sql = "Delete From " + Pre + "define_data"; }
            else { Sql = "Delete From " + Pre + "define_data where SiteID='" + Hg.Global.Current.SiteID + "'"; }
            return DbHelper.ExecuteNonQuery(CommandType.Text, Sql, null);
        }

        public void Delete8(string CheckboxArray)
        {
            string Sql = "Delete From " + Pre + "define_class where DefineInfoId in(" + CheckboxArray + ")";
            DbHelper.ExecuteNonQuery(CommandType.Text, Sql, null);
        }
        public void Delete9(string CheckboxArray)
        {
            string Sql = "Delete From " + Pre + "define_class where ParentInfoId in(" + CheckboxArray + ")";
            DbHelper.ExecuteNonQuery(CommandType.Text, Sql, null);
        }
    }
}