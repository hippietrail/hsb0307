using System;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Collections;
using System.Text.RegularExpressions;
using Foosun.Config;

namespace Foosun.DALProfile
{
    public abstract class DbHelper
    {
        public static void SetTimeoutDefault()
        {
            Timeout = 30;
        }
        public static int Timeout = 30;

        public static IDbBase Provider = null;

        public static DbConnection Conn = null;

        public static int ExecuteNonQuery(CommandType cmdType, string cmdText, params DbParameter[] commandParameters)
        {
            return ExecuteNonQuery(DBConfig.CmsConString, cmdType, cmdText, commandParameters);
        }

        public static int ExecuteNonQuery(string connectionString, CommandType cmdType, string cmdText, params DbParameter[] commandParameters)
        {

            DbCommand cmd = Provider.CreateCommand();

            using (DbConnection conn = Provider.CreateConnection())
            {
                try
                {
                    conn.ConnectionString = connectionString;
                    PrepareCommand(cmd, conn, null, cmdType, cmdText, commandParameters);
                    int val = cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    //DbHelper.Conn = conn;
                    return val;
                }
                catch
                {
                    throw;
                }
                finally
                {
                    if (conn.State == ConnectionState.Open)
                    {
                        conn.Close();

                    }
                    conn.Dispose();
                }
            }
        }

        public static int ExecuteNonQuery(DbConnection connection, CommandType cmdType, string cmdText, params DbParameter[] commandParameters)
        {

            DbCommand cmd = Provider.CreateCommand();

            PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
            int val = cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            DbHelper.Conn = connection;
            return val;
        }

        public static int ExecuteNonQuery(DbTransaction trans, CommandType cmdType, string cmdText, params DbParameter[] commandParameters)
        {
            DbCommand cmd = Provider.CreateCommand();
            PrepareCommand(cmd, trans.Connection, trans, cmdType, cmdText, commandParameters);
            int val = cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            DbHelper.Conn = trans.Connection;
            return val;
        }

        public static DbDataReader ExecuteReader(CommandType cmdType, string cmdText, params DbParameter[] commandParameters)
        {
            return ExecuteReader(DBConfig.CmsConString, cmdType, cmdText, commandParameters);
        }

        public static DbDataReader ExecuteReader(string connectionString, CommandType cmdType, string cmdText, params DbParameter[] commandParameters)
        {
            DbCommand cmd = Provider.CreateCommand();
            DbConnection conn = Provider.CreateConnection();
            conn.ConnectionString = connectionString;
            // we use a try/catch here because if the method throws an exception we want to 
            // close the connection throw code, because no datareader will exist, hence the 
            // commandBehaviour.CloseConnection will not work
            try
            {
                PrepareCommand(cmd, conn, null, cmdType, cmdText, commandParameters);
                DbDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                cmd.Parameters.Clear();
                DbHelper.Conn = conn;
                return rdr;
            }
            catch
            {
                
                throw;
            }
            finally
            {
                //conn.Close();
                //conn.Dispose();
                //conn = null;
            }
        }

        /// <summary>
        /// ִ�ж�Ĭ�����ݿ����Զ�������ķ�ҳ�Ĳ�ѯ
        /// </summary>
        /// <param name="connectionString">�����ַ���
        /// <param name="SqlAllFields">��ѯ�ֶΣ�����Ƕ���ѯ���뽫��Ҫ�ı�����������ϣ���:a.id,a.name,b.score</param>
        /// <param name="SqlTablesAndWhere">��ѯ�ı����������ѯ������Ҳ���������ϣ�����Ҫ����order by�Ӿ䣬Ҳ��Ҫ����"from"�ؼ��֣���:students a inner join achievement b on a.... where ....</param>
        /// <param name="IndexField">���Է�ҳ�Ĳ����ظ��������ֶ����������������������ֶΣ�����Ƕ���ѯ������ϱ������������:a.id</param>
        /// <param name="OrderASC">����ʽ,���Ϊtrue����������,false�򰴽�����</param>
        /// <param name="OrderFields">�����ֶ��Լ���ʽ�磺a.OrderID desc,CnName desc</OrderFields>
        /// <param name="PageIndex">��ǰҳ��ҳ��</param>
        /// <param name="PageSize">ÿҳ��¼��</param>
        /// <param name="RecordCount">������������ز�ѯ���ܼ�¼����</param>
        /// <param name="PageCount">������������ز�ѯ����ҳ��</param>
        /// <returns>���ز�ѯ���</returns>
        public static DbDataReader ExecuteReaderPage(string connectionString, string SqlAllFields, string SqlTablesAndWhere, string IndexField, string GroupClause, string OrderFields, int PageIndex, int PageSize, out int RecordCount, out int PageCount, params DbParameter[] commandParameters)
        {
            DbConnection conn = Provider.CreateConnection();
            conn.ConnectionString = connectionString;
            try
            {
                conn.Open();
                DbCommand cmd = Provider.CreateCommand();
                PrepareCommand(cmd, conn, null, CommandType.Text, "", commandParameters);
                string Sql = GetPageSql(conn, cmd, SqlAllFields, SqlTablesAndWhere, IndexField, OrderFields, PageIndex, PageSize, out  RecordCount, out  PageCount);
                if (GroupClause != null && GroupClause.Trim() != "")
                {
                    int n = Sql.ToLower().LastIndexOf(" order by ");
                    Sql = Sql.Substring(0, n) + " " + GroupClause + " " + Sql.Substring(n);
                }
                cmd.CommandText = Sql;
                DbDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                cmd.Parameters.Clear();
                //DbHelper.Conn = conn;
                return rdr;
            }
            catch
            {
                //if (conn.State == ConnectionState.Open)
                //    conn.Close();
                throw;
            }
            finally
            {
                //if (conn.State == ConnectionState.Open)
                //    conn.Close();
                //conn.Dispose();
                //conn = null;
            }
        }

        public static DbDataReader ExecuteReader(DbConnection connection, CommandType cmdType, string cmdText, params DbParameter[] commandParameters)
        {
            DbCommand cmd = Provider.CreateCommand();
            // we use a try/catch here because if the method throws an exception we want to 
            // close the connection throw code, because no datareader will exist, hence the 
            // commandBehaviour.CloseConnection will not work
            PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
            DbDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            cmd.Parameters.Clear();
            //DbHelper.Conn = connection;
            return rdr;
        }
        public static object ExecuteScalar(CommandType cmdType, string cmdText, params DbParameter[] commandParameters)
        {
            return ExecuteScalar(DBConfig.CmsConString, cmdType, cmdText, commandParameters);
        }

        public static object ExecuteScalar(string connectionString, CommandType cmdType, string cmdText, params DbParameter[] commandParameters)
        {
            DbCommand cmd = Provider.CreateCommand();

            using (DbConnection connection = Provider.CreateConnection())
            {
                try
                {
                    connection.ConnectionString = connectionString;
                    PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
                    object val = cmd.ExecuteScalar();
                    cmd.Parameters.Clear();
                    //DbHelper.Conn = connection;
                    return val;
                }
                catch
                {
                    throw;
                }
                finally
                {
                    if (connection.State == ConnectionState.Open)
                    {
                        connection.Close();
                    }
                    connection.Dispose();
                }
            }
        }

        public static object ExecuteScalar(DbConnection connection, CommandType cmdType, string cmdText, params DbParameter[] commandParameters)
        {

            DbCommand cmd = Provider.CreateCommand();

            PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
            object val = cmd.ExecuteScalar();
            cmd.Parameters.Clear();
            DbHelper.Conn = connection;
            return val;
        }

        public static object ExecuteScalar(DbTransaction trans, CommandType cmdType, string cmdText, params DbParameter[] commandParameters)
        {
            DbCommand cmd = Provider.CreateCommand();

            PrepareCommand(cmd, trans.Connection, trans, cmdType, cmdText, commandParameters);
            object val = cmd.ExecuteScalar();
            cmd.Parameters.Clear();
            DbHelper.Conn = trans.Connection;
            return val;
        }

        public static DataTable ExecuteTable(CommandType cmdType, string cmdText, params DbParameter[] commandParameters)
        {
            return ExecuteTable(DBConfig.CmsConString, cmdType, cmdText, commandParameters);
        }

        public static DataTable ExecuteTable(string connectionString, CommandType cmdType, string cmdText, params DbParameter[] commandParameters)
        {
            DbCommand cmd = Provider.CreateCommand();

            using (DbConnection connection = Provider.CreateConnection())
            {
                try
                {
                    connection.ConnectionString = connectionString;
                    PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
                    DbDataAdapter ap = Provider.CreateDataAdapter();
                    ap.SelectCommand = cmd;
                    DataSet st = new DataSet();
                    ap.Fill(st, "Result");
                    cmd.Parameters.Clear();
                    //DbHelper.Conn = connection;
                    return st.Tables["Result"];
                }
                catch
                {
                    throw;
                }
                finally
                {
                    if (connection.State == ConnectionState.Open)
                    {
                        connection.Close();
                    }
                    connection.Dispose();
                }
            }
        }

        public static DataTable ExecuteTable(DbConnection connection, CommandType cmdType, string cmdText, params DbParameter[] commandParameters)
        {

            DbCommand cmd = Provider.CreateCommand();
            PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
            DbDataAdapter ap = Provider.CreateDataAdapter();
            ap.SelectCommand = cmd;
            DataSet st = new DataSet();
            ap.Fill(st, "Result");
            cmd.Parameters.Clear();
            DbHelper.Conn = connection;
            return st.Tables["Result"];
        }

        /// <summary>
        /// ִ�ж�Ĭ�����ݿ����Զ�������ķ�ҳ�Ĳ�ѯ
        /// </summary>
        /// <param name="SqlAllFields">��ѯ�ֶΣ�����Ƕ���ѯ���뽫��Ҫ�ı�����������ϣ���:a.id,a.name,b.score</param>
        /// <param name="SqlTablesAndWhere">��ѯ�ı����������ѯ������Ҳ���������ϣ�����Ҫ����order by�Ӿ䣬Ҳ��Ҫ����"from"�ؼ��֣���:students a inner join achievement b on a.... where ....</param>
        /// <param name="IndexField">���Է�ҳ�Ĳ����ظ��������ֶ����������������������ֶΣ�����Ƕ���ѯ������ϱ������������:a.id</param>
        /// <param name="OrderASC">����ʽ,���Ϊtrue����������,false�򰴽�����</param>
        /// <param name="OrderFields">�����ֶ��Լ���ʽ�磺a.OrderID desc,CnName desc</OrderFields>
        /// <param name="PageIndex">��ǰҳ��ҳ��</param>
        /// <param name="PageSize">ÿҳ��¼��</param>
        /// <param name="RecordCount">������������ز�ѯ���ܼ�¼����</param>
        /// <param name="PageCount">������������ز�ѯ����ҳ��</param>
        /// <returns>���ز�ѯ���</returns>
        public static DataTable ExecutePage(string SqlAllFields, string SqlTablesAndWhere, string IndexField, string OrderFields, int PageIndex, int PageSize, out int RecordCount, out int PageCount, params DbParameter[] commandParameters)
        {
            return ExecutePage(DBConfig.CmsConString, SqlAllFields, SqlTablesAndWhere, IndexField, OrderFields, PageIndex, PageSize, out  RecordCount, out  PageCount, commandParameters);
        }

        /// <summary>
        /// ִ�����Զ�������ķ�ҳ�Ĳ�ѯ
        /// </summary>
        /// <param name="connectionString">SQL���ݿ������ַ���</param>
        /// <param name="SqlAllFields">��ѯ�ֶΣ�����Ƕ���ѯ���뽫��Ҫ�ı�����������ϣ���:a.id,a.name,b.score</param>
        /// <param name="SqlTablesAndWhere">��ѯ�ı����������ѯ������Ҳ���������ϣ�����Ҫ����order by�Ӿ䣬Ҳ��Ҫ����"from"�ؼ��֣���:students a inner join achievement b on a.... where ....</param>
        /// <param name="IndexField">���Է�ҳ�Ĳ����ظ��������ֶ����������������������ֶΣ�����Ƕ���ѯ������ϱ������������:a.id</param>
        /// <param name="OrderASC">����ʽ,���Ϊtrue����������,false�򰴽�����</param>
        /// <param name="OrderFields">�����ֶ��Լ���ʽ�磺a.OrderID desc,CnName desc</OrderFields>
        /// <param name="PageIndex">��ǰҳ��ҳ��</param>
        /// <param name="PageSize">ÿҳ��¼��</param>
        /// <param name="RecordCount">������������ز�ѯ���ܼ�¼����</param>
        /// <param name="PageCount">������������ز�ѯ����ҳ��</param>
        /// <returns>���ز�ѯ���</returns>
        public static DataTable ExecutePage(string connectionString, string SqlAllFields, string SqlTablesAndWhere, string IndexField, string OrderFields, int PageIndex, int PageSize, out int RecordCount, out int PageCount, params DbParameter[] commandParameters)
        {
            using (DbConnection connection = Provider.CreateConnection())
            {
                try
                {
                    connection.ConnectionString = connectionString;
                    connection.Open();
                    //DbHelper.Conn = connection;
                    return ExecutePage(connection, SqlAllFields, SqlTablesAndWhere, IndexField, OrderFields, PageIndex, PageSize, out RecordCount, out PageCount, commandParameters);
                }
                catch
                {
                    throw;
                }
                finally
                {
                    if (connection.State == ConnectionState.Open)
                    {
                        connection.Close();
                        connection.Dispose();
                    }
                }
            }
        }

        /// <summary>
        /// ִ�����Զ�������ķ�ҳ�Ĳ�ѯ
        /// </summary>
        /// <param name="connection">SQL���ݿ����Ӷ���</param>
        /// <param name="SqlAllFields">��ѯ�ֶΣ�����Ƕ���ѯ���뽫��Ҫ�ı�����������ϣ���:a.id,a.name,b.score</param>
        /// <param name="SqlTablesAndWhere">��ѯ�ı����������ѯ������Ҳ���������ϣ�����Ҫ����order by�Ӿ䣬Ҳ��Ҫ����"from"�ؼ��֣���:students a inner join achievement b on a.... where ....</param>
        /// <param name="IndexField">���Է�ҳ�Ĳ����ظ��������ֶ����������������������ֶΣ�����Ƕ���ѯ������ϱ������������:a.id</param>
        /// <param name="OrderASC">����ʽ,���Ϊtrue����������,false�򰴽�����</param>
        /// <param name="OrderFields">�����ֶ��Լ���ʽ�磺a.OrderID desc,CnName desc</OrderFields>
        /// <param name="PageIndex">��ǰҳ��ҳ��</param>
        /// <param name="PageSize">ÿҳ��¼��</param>
        /// <param name="RecordCount">������������ز�ѯ���ܼ�¼����</param>
        /// <param name="PageCount">������������ز�ѯ����ҳ��</param>
        /// <returns>���ز�ѯ���</returns>
        public static DataTable ExecutePage(DbConnection connection,string SqlAllFields, string SqlTablesAndWhere, string IndexField, string OrderFields, int PageIndex, int PageSize, out int RecordCount, out int PageCount, params DbParameter[] commandParameters)
        {
            DbCommand cmd = Provider.CreateCommand();
            PrepareCommand(cmd, connection, null, CommandType.Text, "", commandParameters);
            string Sql = GetPageSql(connection, cmd, SqlAllFields, SqlTablesAndWhere, IndexField, OrderFields, PageIndex, PageSize, out  RecordCount, out  PageCount);
            cmd.CommandText = Sql;
            DbDataAdapter ap = Provider.CreateDataAdapter();
            ap.SelectCommand = cmd;
            DataSet st = new DataSet();
            ap.Fill(st, "PageResult");
            cmd.Parameters.Clear();
            DbHelper.Conn = connection;
            return st.Tables["PageResult"];
        }

        /// <summary>
        /// �ر�����
        /// </summary>
        public static void CloseConn()
        {
            
            if (DbHelper.Conn != null )
            {
                if (DbHelper.Conn.State == ConnectionState.Open)
                {
                    DbHelper.Conn.Close();
                }
            }
        }
        /// <summary>
        /// ȡ�÷�ҳ��SQL���
        /// </summary>
        /// <param name="connection"></param>
        /// <param name="cmd"></param>
        /// <param name="SqlAllFields"></param>
        /// <param name="SqlTablesAndWhere"></param>
        /// <param name="IndexField"></param>
        /// <param name="OrderFields"></param>
        /// <param name="PageIndex"></param>
        /// <param name="PageSize"></param>
        /// <param name="RecordCount"></param>
        /// <param name="PageCount"></param>
        /// <returns></returns>
        private static string GetPageSql(DbConnection connection, DbCommand cmd, string SqlAllFields, string SqlTablesAndWhere, string IndexField, string OrderFields, int PageIndex, int PageSize, out int RecordCount, out int PageCount)
        {
            RecordCount = 0;
            PageCount = 0;
            if (PageSize <= 0)
            {
                PageSize = 10;
            }
            string SqlCount = "select count(" + IndexField + ") from " + SqlTablesAndWhere;
            cmd.CommandText = SqlCount;
            RecordCount = (int)cmd.ExecuteScalar();
            if (RecordCount % PageSize == 0)
            {
                PageCount = RecordCount / PageSize;
            }
            else
            {
                PageCount = RecordCount / PageSize + 1;
            }
            if (PageIndex > PageCount)
                PageIndex = PageCount;
            if (PageIndex < 1)
                PageIndex = 1;
            string Sql = null;
            if (PageIndex == 1)
            {
                Sql = "select top " + PageSize + " " + SqlAllFields + " from " + SqlTablesAndWhere + " " + OrderFields;
            }
            else
            {
                Sql = "select top " + PageSize + " " + SqlAllFields + " from ";
                if (SqlTablesAndWhere.ToLower().IndexOf(" where ") > 0)
                {
                    string _where = Regex.Replace(SqlTablesAndWhere, @"\ where\ ", " where (", RegexOptions.IgnoreCase | RegexOptions.Compiled);
                    Sql += _where + ") and (";
                }
                else
                {
                    Sql += SqlTablesAndWhere + " where (";
                }
                Sql += IndexField + " not in (select top " + (PageIndex - 1) * PageSize + " " + IndexField + " from " + SqlTablesAndWhere + " " + OrderFields;
                Sql += ")) " + OrderFields;
            }
            return Sql;
        }
        private static void PrepareCommand(DbCommand cmd, DbConnection conn, DbTransaction trans, CommandType cmdType, string cmdText, DbParameter[] cmdParms)
        {

            if (conn.State != ConnectionState.Open)
                conn.Open();

            cmd.Connection = conn;
            cmd.CommandText = cmdText;

            if (trans != null)
                cmd.Transaction = trans;

            cmd.CommandType = cmdType;
            cmd.CommandTimeout = Timeout;
            if (cmdParms != null)
            {
                foreach (DbParameter parm in cmdParms)
                    if (parm != null)
                    {
                        if (parm.Value == null)
                        {
                            parm.Value = DBNull.Value;
                        }
                        cmd.Parameters.Add(parm);
                    }
                        
            }
        }

    }
}