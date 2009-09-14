using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace Foosun.Web
{


    /// <summary> 
    /// 数据库操作控制类 
    /// </summary> 
    public class DataBaseControl
    {
        /// <summary> 
        /// 数据库连接字符串 
        /// </summary> 
        public string ConnectionString;

        /// <summary> 
        /// SQL操作语句/存储过程 
        /// </summary> 
        public string StrSQL;

        /// <summary> 
        /// 实例化一个数据库连接对象 
        /// </summary> 
        private SqlConnection Conn;

        /// <summary> 
        /// 实例化一个新的数据库操作对象Comm 
        /// </summary> 
        private SqlCommand Comm;

        /// <summary> 
        /// 要操作的数据库名称 
        /// </summary> 
        public string DataBaseName;

        /// <summary> 
        /// 数据库文件完整地址 
        /// </summary> 
        public string DataBase_MDF;

        /// <summary> 
        /// 数据库日志文件完整地址 
        /// </summary> 
        public string DataBase_LDF;

        /// <summary> 
        /// 备份文件名 
        /// </summary> 
        public string DataBaseOfBackupName;

        /// <summary> 
        /// 备份文件路径 
        /// </summary> 
        public string DataBaseOfBackupPath;

        /// <summary> 
        /// 执行创建/修改数据库和表的操作 
        /// </summary> 
        public void DataBaseAndTableControl()
        {
            try
            {
                Conn = new SqlConnection(ConnectionString);
                Conn.Open();

                Comm = new SqlCommand();
                Comm.Connection = Conn;
                Comm.CommandText = StrSQL;
                Comm.CommandType = CommandType.Text;
                Comm.ExecuteNonQuery();

                //MessageBox.Show("数据库操作成功！", "信息提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
                HttpContext.Current.Response.Write("数据库操作成功！");
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message, "信息提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
                HttpContext.Current.Response.Write(ex.Message);
            }
            finally
            {
                Conn.Close();
            }
        }

        /// <summary> 
        /// 附加数据库 
        /// </summary> 
        public void AddDataBase()
        {
            try
            {
                Conn = new SqlConnection(ConnectionString);
                Conn.Open();

                Comm = new SqlCommand();
                Comm.Connection = Conn;
                Comm.CommandText = "sp_attach_db";

                Comm.Parameters.Add(new SqlParameter(@"dbname", SqlDbType.NVarChar));
                Comm.Parameters[@"dbname"].Value = DataBaseName;
                Comm.Parameters.Add(new SqlParameter(@"filename1", SqlDbType.NVarChar));
                Comm.Parameters[@"filename1"].Value = DataBase_MDF;
                Comm.Parameters.Add(new SqlParameter(@"filename2", SqlDbType.NVarChar));
                Comm.Parameters[@"filename2"].Value = DataBase_LDF;

                Comm.CommandType = CommandType.StoredProcedure;
                Comm.ExecuteNonQuery();

                //MessageBox.Show("附加数据库成功", "信息提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
                HttpContext.Current.Response.Write("附加数据库成功");
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message, "信息提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
                HttpContext.Current.Response.Write(ex.Message);
            }
            finally
            {
                Conn.Close();
            }
        }

        /// <summary> 
        /// 分离数据库 
        /// </summary> 
        public void DeleteDataBase()
        {
            try
            {
                Conn = new SqlConnection(ConnectionString);
                Conn.Open();

                Comm = new SqlCommand();
                Comm.Connection = Conn;
                Comm.CommandText = @"sp_detach_db";

                Comm.Parameters.Add(new SqlParameter(@"dbname", SqlDbType.NVarChar));
                Comm.Parameters[@"dbname"].Value = DataBaseName;

                Comm.CommandType = CommandType.StoredProcedure;
                Comm.ExecuteNonQuery();

                //MessageBox.Show("分离数据库成功", "信息提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
                HttpContext.Current.Response.Write("分离数据库成功");
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message, "信息提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
                HttpContext.Current.Response.Write(ex.Message);
            }
            finally
            {
                Conn.Close();
            }
        }

        /// <summary> 
        /// 备份数据库 
        /// </summary> 
        public void BackupDataBase()
        {
            try
            {
                Conn = new SqlConnection(ConnectionString);
                Conn.Open();

                Comm = new SqlCommand();
                Comm.Connection = Conn;
                Comm.CommandText = "use master;backup database @dbname to disk = @backupname;";

                Comm.Parameters.Add(new SqlParameter(@"dbname", SqlDbType.NVarChar));
                Comm.Parameters[@"dbname"].Value = DataBaseName;
                Comm.Parameters.Add(new SqlParameter(@"backupname", SqlDbType.NVarChar));
                Comm.Parameters[@"backupname"].Value = @DataBaseOfBackupPath + @DataBaseOfBackupName;

                Comm.CommandType = CommandType.Text;
                Comm.ExecuteNonQuery();

                //MessageBox.Show("备份数据库成功", "信息提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
                HttpContext.Current.Response.Write("备份数据库成功");
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message, "信息提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
                HttpContext.Current.Response.Write(ex.Message);
            }
            finally
            {
                Conn.Close();
            }
        }

        /// <summary> 
        /// 还原数据库 
        /// </summary> 
        public void ReplaceDataBase()
        {
            try
            {
                string BackupFile = @DataBaseOfBackupPath + @DataBaseOfBackupName;
                Conn = new SqlConnection(ConnectionString);
                Conn.Open();

                Comm = new SqlCommand();
                Comm.Connection = Conn;
                Comm.CommandText = "use master;restore database @DataBaseName From disk = @BackupFile with replace;";

                Comm.Parameters.Add(new SqlParameter(@"DataBaseName", SqlDbType.NVarChar));
                Comm.Parameters[@"DataBaseName"].Value = DataBaseName;
                Comm.Parameters.Add(new SqlParameter(@"BackupFile", SqlDbType.NVarChar));
                Comm.Parameters[@"BackupFile"].Value = BackupFile;

                Comm.CommandType = CommandType.Text;
                Comm.ExecuteNonQuery();

                //MessageBox.Show("还原数据库成功", "信息提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
                HttpContext.Current.Response.Write("还原数据库成功");
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message, "信息提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
                HttpContext.Current.Response.Write(ex.Message);
            }
            finally
            {
                Conn.Close();
            }
        }
    }

}
