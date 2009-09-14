using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Data.Common;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace Foosun.Web.Update.FS3
{
    public partial class Update : System.Web.UI.Page
    {
        public static string SourConnstr = string.Empty;
        public static string TagConnstr = Foosun.Config.DBConfig.CmsConString;
        public static readonly string Prefix = Foosun.Config.UIConfig.dataRe;
        public static int GisSQL = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Server.ScriptTimeout = 1000;
            string gSet = Request.QueryString["set"];
            if (gSet != null && gSet != string.Empty)
            {
                string gtype = Request.QueryString["type"];
                string GConnstr = Request.QueryString["connstr"];
                string MConnstr = Request.QueryString["mConnstr"];
                string isSQL = Request.QueryString["isSQL"];
                if (GConnstr != null && GConnstr != string.Empty)
                {
                    SourConnstr = GConnstr;
                    if (isSQL != "1")
                    {
                        GisSQL = 0;
                        //if (gtype == "news" || gtype == "class" || gtype == "special" || gtype == "gen")
                        //{
                            SourConnstr = "Provider=Microsoft.Jet.OleDb.4.0;Data Source=" + Server.MapPath(GConnstr) + ";Persist Security Info=True;";
                        //}
                        //else
                        //{
                        //    SourConnstr = "Provider=Microsoft.Jet.OleDb.4.0;Data Source=" + Server.MapPath(MConnstr) + ";Persist Security Info=True;";
                        //}
                    }
                    else
                    {
                        GisSQL = 1;
                    }
                    StatConvertTodotNETCMS(gtype, isSQL);
                }
                else
                {
                    Response.Write("����ȷ��д�����ַ�������ACCESS·��");
                    Response.End();
                }
            }
        }

        public void StatConvertTodotNETCMS(string gtype, string isSQL)
        {
            IDataReader dr = null;
            int i = 0;
            int m = 0;
            string sql = string.Empty;

            switch (gtype)
            {
                case "news":
                    sql = "select * from FS_News order by id asc";
                    if (GisSQL != 1)
                    {
                        OleDbConnection con = new OleDbConnection(SourConnstr);
                        con.Open();
                        OleDbCommand cmd = new OleDbCommand(sql, con);
                        dr = cmd.ExecuteReader();
                    }
                    else
                    {
                        dr = SqlHelper.ExecuteReader(SourConnstr, CommandType.Text, sql, null);
                    }
                    while (dr.Read())
                    {
                        #region ת����ͷ
                        string NewsID = dr["NewsID"].ToString();
                        try
                        {
                            if (NewsID.Length > 5)
                            {
                                NewsID = NewsID.Substring(5);
                            }
                            int NewsType = 0;//IsURL
                            if (dr["HeadNewsTF"].ToString() == "1")
                            {
                                NewsType = 2;
                            }
                            if (dr["PicNewsTF"].ToString() == "1")
                            {
                                NewsType = 1;
                            }
                            string ClassID = dr["ClassID"].ToString();
                            ClassID = ClassID + "000000000000000";
                            ClassID = ClassID.Substring(5, 12);
                            string NewsProperty = "0,0,0,0,0,0,0,0";
                            DateTime CreatTime = DateTime.Now;
                            if (Foosun.Common.Input.IsDate(dr["AddDate"].ToString()))
                            {
                                CreatTime = DateTime.Parse(dr["AddDate"].ToString());
                            }
                            int ContentPicTF = 0;
                            string CheckStat = "0|0|0|0";
                            int isLock = 0;
                            if (dr["AuditTF"].ToString() == "0")
                            {
                                CheckStat = "1|1|0|0";
                                isLock = 1;
                            }
                            int isRecyle = 0;
                            if (dr["DelTF"].ToString() == "1")
                            {
                                isRecyle = 1;
                            }
                            string TSTYLE = dr["TitleStyle"].ToString();
                            string TSTYLE1 = "";
                            string TSTYLE2 = "0";
                            string TSTYLE3 = "0";
                            if (TSTYLE != null && TSTYLE != string.Empty && TSTYLE.Length == 9)
                            {
                                TSTYLE1 = TSTYLE.Substring(1, 6);
                                TSTYLE2 = TSTYLE.Substring(7, 1);
                                TSTYLE3 = TSTYLE.Substring(8, 1);
                                if (TSTYLE1 == "UUUUUU")
                                {
                                    TSTYLE1 = "";
                                }
                            }

                            SqlParameter param = new SqlParameter("@Content", dr["Content"].ToString());
                            //�Ƽ�,����,�ȵ�,�õ�,ͷ��,����,WAP,����
                            string insertsql = "insert into " + Prefix + "News(NewsID,NewsType,OrderID,NewsTitle,NewsTitleRefer,sNewsTitle,TitleColor,TitleITF,TitleBTF,CommLinkTF,SubNewsTF,URLaddress,PicURL,SPicURL,ClassID";
                            insertsql += ",SpecialID,Author,Souce,Tags,NewsProperty,NewsPicTopline,Templet,Content,Metakeywords,Metadesc,naviContent,Click,CreatTime,EditTime,SavePath,FileName,FileEXName";
                            insertsql += ",isDelPoint,Gpoint,iPoint,GroupNumber,ContentPicTF,ContentPicURL,ContentPicSize,CommTF,DiscussTF,TopNum,VoteTF,CheckStat,isLock,isRecyle,SiteID,DataLib,DefineID,isVoteTF";
                            insertsql += ",Editor,isHtml,isConstr,isFiles,vURL";
                            insertsql += ") values (";
                            insertsql += "'" + NewsID.Trim() + "'," + NewsType + ",0,'" + dr["Title"].ToString() + "','" + dr["SubTitle"].ToString() + "','" + TSTYLE1 + "'," + Convert.ToInt16(TSTYLE2) + "," + Convert.ToInt16(TSTYLE3) + "," + Convert.ToInt16(dr["ShowReviewTF"].ToString()) + ",0,'" + dr["HeadNewsPath"].ToString() + "','" + dr["PicPath"].ToString() + "','','" + ClassID + "'";
                            insertsql += ",'0','" + dr["Author"].ToString() + "','" + dr["TxtSource"].ToString() + "','" + (dr["KeyWords"].ToString()).Replace(",", "|") + "','" + NewsProperty + "',0,'" + dr["NewsTemplet"].ToString() + "',@Content,'','','" + dr["NaviWords"].ToString() + "'," + Convert.ToInt32(dr["ClickNum"].ToString()) + ",'" + CreatTime + "','" + CreatTime + "','" + dr["Path"].ToString() + "','" + dr["FileName"].ToString() + "','." + dr["FileExtName"].ToString() + "'";
                            insertsql += "," + Convert.ToInt32(dr["BrowPop"].ToString()) + ",0,0,''," + ContentPicTF + ",'','0|0',1,0,0,0,'" + CheckStat + "'," + isLock + "," + isRecyle + ",'0','" + Prefix + "news',0,0";
                            insertsql += ",'" + dr["Editer"].ToString() + "',0,0,0,''";
                            insertsql += ")";
                            SqlHelper.ExecuteNonQuery(TagConnstr, CommandType.Text, insertsql, param);
                            i++;
                        }
                        catch(Exception ex)
                        {
                            m++;
                            Foosun.Common.Public.saveConvertLogFiles("����ID��"+NewsID, ex.ToString());
                        }
                        #endregion
                    }
                    Response.Write("�� �ɹ�ת������" + i + "��,ת��ʧ��" + m + "��.");
                    Response.End();
                    dr.Close();
                    //con.Close();
                    break;
                case "class":
                    sql = "select * from FS_NewsClass order by id asc";
                    if (GisSQL != 1)
                    {
                        OleDbConnection con = new OleDbConnection(SourConnstr);
                        con.Open();
                        OleDbCommand cmd = new OleDbCommand(sql, con);
                        dr = cmd.ExecuteReader();
                    }
                    else
                    {
                        dr = SqlHelper.ExecuteReader(SourConnstr, CommandType.Text, sql, null);
                    }
                    while (dr.Read())
                    {
                        string ClassID = dr["ClassID"].ToString();
                        try
                        {
                            ClassID = ClassID + "000000000000000";
                            ClassID = ClassID.Substring(5, 12);

                            //string GetExsit1 = "select count(*) from " + Prefix + "news_class where ClassID='" + ClassID + "'";
                            //int CCTF1 = Convert.ToInt32(SqlHelper.ExecuteNonQuery(TagConnstr, CommandType.Text, GetExsit1, null));
                            //if (CCTF1 > 0)
                            //{
                            //    ClassID = Foosun.Common.Rand.Number(12);
                            //}

                            string ParentID = dr["ParentID"].ToString();
                            if (ParentID != "0")
                            {
                                ParentID = ParentID + "000000000000000";
                                ParentID = ParentID.Substring(5, 12);
                            }
                            int Checkint = 0;
                            DateTime Addtime = DateTime.Now;
                            if (Foosun.Common.Input.IsDate(dr["AddTime"].ToString()))
                            {
                                Addtime = DateTime.Parse(dr["AddTime"].ToString());
                            }
                            string insertsql = "insert into " + Prefix + "news_Class(ClassID,ClassCName,ClassEName,ParentID,IsURL,OrderID,URLaddress,[Domain],ClassTemplet,ReadNewsTemplet,SavePath,SaveClassframe,Checkint,ClassSaveRule";
                            insertsql += ",ClassIndexRule,NewsSavePath,NewsFileRule,PicDirPath,ContentPicTF,ContentPICurl,ContentPicSize,InHitoryDay,DataLib,SiteID,NaviShowtf,NaviPIC,NaviContent,MetaKeywords,MetaDescript,isDelPoint,Gpoint";
                            insertsql += ",iPoint,GroupNumber,FileName,isLock,isRecyle,NaviPosition,NewsPosition,isComm,Defineworkey,CreatTime,isPage,PageContent,ModelID,isunHTML";
                            insertsql += ") values (";
                            insertsql += "'" + ClassID + "','" + dr["ClassCName"].ToString() + "','" + dr["ClassEName"].ToString() + "','" + ParentID + "'," + Convert.ToInt32(dr["IsOutClass"].ToString()) + ",0,'" + dr["ClassLink"].ToString() + "','" + dr["DoMain"].ToString() + "','" + dr["ClassTemp"].ToString() + "','" + dr["NewsTemp"].ToString() + "','" + dr["SaveFilePath"].ToString() + "','',0,'" + dr["ClassEName"].ToString() + "/index.html'";
                            insertsql += ",'{@year04}-{@month}/{@day}','{@year04}{@month}','{@year04}-{@month}-{@day}-{@hour}-{@minute}','',0,'','0|0',0,'" + Prefix + "news','0'," + Convert.ToInt32(dr["ShowTF"].ToString()) + ",'','','',''," + Convert.ToInt32(dr["BrowPop"].ToString()) + ",0";
                            insertsql += ",0,'','." + dr["FileExtName"].ToString() + "',0," + Convert.ToInt32(dr["DelFlag"].ToString()) + ",'','',1,'','" + Addtime + "',0,'','',0";
                            insertsql += ")";
                            SqlHelper.ExecuteNonQuery(TagConnstr, CommandType.Text, insertsql, null);
                            i++;
                        }
                        catch (Exception ex)
                        {
                            m++;
                            Foosun.Common.Public.saveConvertLogFiles("��ĿID��" + ClassID, ex.ToString());
                        }
                    }
                    dr.Close();
                    Response.Write("�� �ɹ�ת��������Ŀ" + i + "��,ת��ʧ��" + m + "��.������ڴ���Ŀ����ת��ʧ��");
                    Response.End();
                    break;

                case "special":
                    sql = "select * from FS_Special order by ID asc";
                    if (GisSQL != 1)
                    {
                        OleDbConnection con = new OleDbConnection(SourConnstr);
                        con.Open();
                        OleDbCommand cmd = new OleDbCommand(sql, con);
                        dr = cmd.ExecuteReader();
                    }
                    else
                    {
                        dr = SqlHelper.ExecuteReader(SourConnstr, CommandType.Text, sql, null);
                    }
                    while (dr.Read())
                    {
                        string SpecialID = dr["SpecialID"].ToString();
                        try
                        {
                            SpecialID = SpecialID.Substring(5);
                            string ParentID ="0";
                            int Checkint = 0;
                            DateTime Addtime = DateTime.Now;
                            if (Foosun.Common.Input.IsDate(dr["AddTime"].ToString()))
                            {
                                Addtime = DateTime.Parse(dr["AddTime"].ToString());
                            }
                            string insertsql = "insert into " + Prefix + "news_special(SpecialID,SpecialCName,specialEName,ParentID,[Domain],isDelPoint,Gpoint,[iPoint],GroupNumber,saveDirPath,SavePath,FileName,FileEXName,NaviPicURL";
                            insertsql += ",NaviContent,SiteID,Templet,isLock,isRecyle,CreatTime,NaviPosition,ModelID";
                            insertsql += ") values (";
                            insertsql += "'" + SpecialID + "','" + dr["CName"].ToString() + "','" + dr["EName"].ToString() + "','" + ParentID + "','',0,0,0,'','','" + dr["SaveFilePath"].ToString() + "','" + dr["EName"].ToString() + "','." + dr["FileExtName"].ToString() + "',''";
                            insertsql += ",'" + dr["IndexNaviWord"].ToString() + "','0','" + dr["Templet"].ToString() + "',0,0,'" + Addtime + "','','0'";
                            insertsql += ")";
                            SqlHelper.ExecuteNonQuery(TagConnstr, CommandType.Text, insertsql, null);
                            i++;
                        }
                        catch (Exception ex)
                        {
                            m++;
                            Foosun.Common.Public.saveConvertLogFiles("ר��ID��" + SpecialID, ex.ToString());
                        }
                    }
                    dr.Close();
                    Response.Write("�� �ɹ�ת������ר��" + i + "��,ת��ʧ��" + m + "��");
                    Response.End();
                    break;
                case "user":
                    sql = "select * from FS_Members order by id asc";
                    if (GisSQL != 1)
                    {
                        OleDbConnection con = new OleDbConnection(SourConnstr);
                        con.Open();
                        OleDbCommand cmd = new OleDbCommand(sql, con);
                        dr = cmd.ExecuteReader();
                    }
                    else
                    {
                        dr = SqlHelper.ExecuteReader(SourConnstr, CommandType.Text, sql, null);
                    }
                    while (dr.Read())
                    {
                        string UserNumber = Foosun.Common.Rand.Number(12, true);
                        try
                        {
                            int Checkint = 0;
                            DateTime BothYear = DateTime.Now;
                            if (Foosun.Common.Input.IsDate(dr["Birthday"].ToString()))
                            {
                                BothYear = DateTime.Parse(dr["Birthday"].ToString());
                            }

                            DateTime RegTime = DateTime.Now;
                            if (Foosun.Common.Input.IsDate(dr["RegTime"].ToString()))
                            {
                                RegTime = DateTime.Parse(dr["RegTime"].ToString());
                            }
                            DateTime LastLoginTime = DateTime.Now;
                            if (Foosun.Common.Input.IsDate(dr["LastLoginTime"].ToString()))
                            {
                                LastLoginTime = DateTime.Parse(dr["LastLoginTime"].ToString());
                            }

                            string insertsql = "insert into " + Prefix + "sys_User(UserNum,UserName,UserPassword,NickName,RealName,isAdmin,UserGroupNumber,PassQuestion,PassKey,CertType,CertNumber,Email,mobile,Sex";
                            insertsql += ",birthday,Userinfo,UserFace,userFacesize,marriage,iPoint,gPoint,cPoint,ePoint,aPoint,isLock,RegTime,LastLoginTime,OnlineTime,OnlineTF,LoginNumber,FriendClass";
                            insertsql += ",LoginLimtNumber,LastIP,SiteID,Addfriend,isOpen,ParmConstrNum,isIDcard,IDcardFiles,Addfriendbs,EmailATF,EmailCode,isMobile,BindTF,MobileCode";
                            insertsql += ") values (";
                            insertsql += "'" + UserNumber + "','" + dr["MemName"].ToString() + "','" + dr["Password"].ToString() + "','" + dr["MemName"].ToString() + "','" + dr["Name"].ToString() + "',0,'00000000001','" + dr["PassQuestion"].ToString() + "','" + dr["PassAnswer"].ToString() + "',0,'','" + dr["Email"].ToString() + "',''," + Convert.ToInt32(dr["Sex"].ToString()) + "";
                            insertsql += ",'" + BothYear + "','','" + dr["HeadPic"].ToString() + "','50|50',0," + Convert.ToInt32(dr["Point"].ToString()) + ",0,0,0,0," + Convert.ToInt32(dr["Lock"].ToString()) + ",'" + RegTime + "','" + LastLoginTime + "',0,0," + Convert.ToInt32(dr["LoginNum"].ToString()) + ",''";
                            insertsql += ",0,'" + dr["LastLoginIP"].ToString() + "','0',0," + Convert.ToInt32(dr["OpenInfTF"].ToString()) + ",0,0,'','',0,'',0,0,''";
                            insertsql += ")";
                            SqlHelper.ExecuteNonQuery(TagConnstr, CommandType.Text, insertsql, null);
                            i++;
                        }
                        catch (Exception ex)
                        {
                            m++;
                            Foosun.Common.Public.saveConvertLogFiles("�û�ID��" + UserNumber, ex.ToString());
                        }
                    }
                    dr.Close();
                    Response.Write("�� �ɹ�ת����Ա" + i + "��,ת��ʧ��" + m + "��");
                    Response.End();
                    break;
                case "gen":
                    //��1�ؼ��� 2��Դ 3���� 4�༭ 5�ڲ����ӣ�
                    sql = "select * from FS_Routine order by id asc";
                    if (GisSQL != 1)
                    {
                        OleDbConnection con = new OleDbConnection(SourConnstr);
                        con.Open();
                        OleDbCommand cmd = new OleDbCommand(sql, con);
                        dr = cmd.ExecuteReader();
                    }
                    else
                    {
                        dr = SqlHelper.ExecuteReader(SourConnstr, CommandType.Text, sql, null);
                    }
                    while (dr.Read())
                    {
                        string ID = dr["ID"].ToString();
                        try
                        {
                            //0��ʾ�ؼ��֣�1��ʾ���ߣ�2��ʾ��Դ��3��ʾ�ڲ�����
                            int G_Type = 0;
                            switch (dr["Type"].ToString())
                            {
                                case "1":
                                    G_Type = 0;
                                    break;
                                case "2":
                                    G_Type = 2;
                                    break;
                                case "3":
                                    G_Type = 1;
                                    break;
                                case "4":
                                    G_Type = 1;
                                    break;
                                case "5":
                                    G_Type = 3;
                                    break;
                            }
                            string insertsql = "insert into " + Prefix + "news_Gen(Cname,gType,URL,EmailURL,isLock,SiteID";
                            insertsql += ") values (";
                            insertsql += "'" + dr["Name"].ToString() + "'," + G_Type + ",'" + dr["Url"].ToString() + "','',0,'0'";
                            insertsql += ")";
                            i++;
                            SqlHelper.ExecuteNonQuery(TagConnstr, CommandType.Text, insertsql, null);
                        }
                        catch (Exception ex)
                        {
                            m++;
                            Foosun.Common.Public.saveConvertLogFiles("����ID��" + ID, ex.ToString());
                        }
                    }
                    dr.Close();
                    Response.Write("�� �ɹ�ת���������" + i + "��,ת��ʧ��" + m + "��");
                    Response.End();
                    break;

            }
        }

        public abstract class SqlHelper
        {


            //���ݿ��ͨ��ǰ׺
            // Hashtable to store cached parameters
            private static Hashtable parmCache = Hashtable.Synchronized(new Hashtable());

            /// <summary>
            /// Execute a SqlCommand (that returns no resultset) against the database specified in the connection string 
            /// using the provided parameters.
            /// </summary>
            /// <remarks>
            /// e.g.:  
            ///  int result = ExecuteNonQuery( CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
            /// </remarks>
            /// <param name="commandType">the CommandType (stored procedure, text, etc.)</param>
            /// <param name="commandText">the stored procedure name or T-SQL command</param>
            /// <param name="commandParameters">an array of SqlParamters used to execute the command</param>
            /// <returns>an int representing the number of rows affected by the command</returns>
            public static int ExecuteNonQuery(CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
            {
                return ExecuteNonQuery(SourConnstr, cmdType, cmdText, commandParameters);
            }

            /// <summary>
            /// Execute a SqlCommand (that returns no resultset) against the database specified in the connection string 
            /// using the provided parameters.
            /// </summary>
            /// <remarks>
            /// e.g.:  
            ///  int result = ExecuteNonQuery(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
            /// </remarks>
            /// <param name="connectionString">a valid connection string for a SqlConnection</param>
            /// <param name="commandType">the CommandType (stored procedure, text, etc.)</param>
            /// <param name="commandText">the stored procedure name or T-SQL command</param>
            /// <param name="commandParameters">an array of SqlParamters used to execute the command</param>
            /// <returns>an int representing the number of rows affected by the command</returns> 
            public static int ExecuteNonQuery(string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
            {

                SqlCommand cmd = new SqlCommand();

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    PrepareCommand(cmd, conn, null, cmdType, cmdText, commandParameters);
                    int val = cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    return val;
                }
            }

            /// <summary>
            /// Execute a SqlCommand (that returns no resultset) against an existing database connection 
            /// using the provided parameters.
            /// </summary>
            /// <remarks>
            /// e.g.:  
            ///  int result = ExecuteNonQuery(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
            /// </remarks>
            /// <param name="conn">an existing database connection</param>
            /// <param name="commandType">the CommandType (stored procedure, text, etc.)</param>
            /// <param name="commandText">the stored procedure name or T-SQL command</param>
            /// <param name="commandParameters">an array of SqlParamters used to execute the command</param>
            /// <returns>an int representing the number of rows affected by the command</returns>
            public static int ExecuteNonQuery(SqlConnection connection, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
            {

                SqlCommand cmd = new SqlCommand();

                PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
                int val = cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                return val;
            }

            /// <summary>
            /// Execute a SqlCommand (that returns no resultset) using an existing SQL Transaction 
            /// using the provided parameters.
            /// </summary>
            /// <remarks>
            /// e.g.:  
            ///  int result = ExecuteNonQuery(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
            /// </remarks>
            /// <param name="trans">an existing sql transaction</param>
            /// <param name="commandType">the CommandType (stored procedure, text, etc.)</param>
            /// <param name="commandText">the stored procedure name or T-SQL command</param>
            /// <param name="commandParameters">an array of SqlParamters used to execute the command</param>
            /// <returns>an int representing the number of rows affected by the command</returns>
            public static int ExecuteNonQuery(SqlTransaction trans, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
            {
                SqlCommand cmd = new SqlCommand();
                PrepareCommand(cmd, trans.Connection, trans, cmdType, cmdText, commandParameters);
                int val = cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                return val;
            }

            /// <summary>
            /// Execute a SqlCommand that returns a resultset against the database specified in the connection string 
            /// using the provided parameters.
            /// </summary>
            /// <remarks>
            /// e.g.:  
            ///  SqlDataReader r = ExecuteReader(CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
            /// </remarks>
            /// <param name="commandType">the CommandType (stored procedure, text, etc.)</param>
            /// <param name="commandText">the stored procedure name or T-SQL command</param>
            /// <param name="commandParameters">an array of SqlParamters used to execute the command</param>
            /// <returns>A SqlDataReader containing the results</returns>
            public static SqlDataReader ExecuteReader(CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
            {
                return ExecuteReader(SourConnstr, cmdType, cmdText, commandParameters);
            }

            /// <summary>
            /// Execute a SqlCommand that returns a resultset against the database specified in the connection string 
            /// using the provided parameters.
            /// </summary>
            /// <remarks>
            /// e.g.:  
            ///  SqlDataReader r = ExecuteReader(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
            /// </remarks>
            /// <param name="connectionString">a valid connection string for a SqlConnection</param>
            /// <param name="commandType">the CommandType (stored procedure, text, etc.)</param>
            /// <param name="commandText">the stored procedure name or T-SQL command</param>
            /// <param name="commandParameters">an array of SqlParamters used to execute the command</param>
            /// <returns>A SqlDataReader containing the results</returns>
            public static SqlDataReader ExecuteReader(string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
            {

                SqlCommand cmd = new SqlCommand();
                SqlConnection conn = new SqlConnection(connectionString);

                // we use a try/catch here because if the method throws an exception we want to 
                // close the connection throw code, because no datareader will exist, hence the 
                // commandBehaviour.CloseConnection will not work
                try
                {
                    PrepareCommand(cmd, conn, null, cmdType, cmdText, commandParameters);
                    SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    cmd.Parameters.Clear();
                    return rdr;
                }
                catch
                {
                    conn.Close();
                    throw;
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
            public static SqlDataReader ExecuteReaderPage(string connectionString, string SqlAllFields, string SqlTablesAndWhere, string IndexField, string GroupClause, string OrderFields, int PageIndex, int PageSize, out int RecordCount, out int PageCount, params SqlParameter[] commandParameters)
            {
                SqlCommand cmd = new SqlCommand();
                SqlConnection conn = new SqlConnection(connectionString);
                try
                {
                    conn.Open();

                    RecordCount = 0;
                    PageCount = 0;
                    if (PageSize <= 0)
                    {
                        PageSize = 10;
                    }
                    string SqlCount = "select count(*) from " + SqlTablesAndWhere;
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = SqlCount;
                    if (commandParameters != null)
                    {
                        foreach (SqlParameter parm in commandParameters)
                            cmd.Parameters.Add(parm);
                    }
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
                        Sql = "select top " + PageSize + " " + SqlAllFields + " from " + SqlTablesAndWhere + " " + GroupClause + " " + OrderFields;
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
                        Sql += ")) " + GroupClause + " " + OrderFields;
                    }
                    cmd.CommandText = Sql;
                    SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    cmd.Parameters.Clear();
                    return rdr;
                }
                catch
                {
                    conn.Close();
                    throw;
                }
            }

            /// <summary>
            /// Execute a SqlCommand that returns a resultset against the database specified in the connection string 
            /// using the provided parameters.
            /// </summary>
            /// <remarks>
            /// e.g.:  
            ///  SqlDataReader r = ExecuteReader(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
            /// </remarks>
            /// <param name="connectionString">a valid connection string for a SqlConnection</param>
            /// <param name="commandType">the CommandType (stored procedure, text, etc.)</param>
            /// <param name="commandText">the stored procedure name or T-SQL command</param>
            /// <param name="commandParameters">an array of SqlParamters used to execute the command</param>
            /// <returns>A SqlDataReader containing the results</returns>
            public static SqlDataReader ExecuteReader(SqlConnection connection, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
            {
                SqlCommand cmd = new SqlCommand();
                // we use a try/catch here because if the method throws an exception we want to 
                // close the connection throw code, because no datareader will exist, hence the 
                // commandBehaviour.CloseConnection will not work
                PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
                SqlDataReader rdr = cmd.ExecuteReader();
                cmd.Parameters.Clear();
                return rdr;
            }

            /// <summary>
            /// Execute a SqlCommand that returns the first column of the first record against the database specified in the connection string 
            /// using the provided parameters.
            /// </summary>
            /// <remarks>
            /// e.g.:  
            ///  Object obj = ExecuteScalar(CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
            /// </remarks>
            /// <param name="commandType">the CommandType (stored procedure, text, etc.)</param>
            /// <param name="commandText">the stored procedure name or T-SQL command</param>
            /// <param name="commandParameters">an array of SqlParamters used to execute the command</param>
            /// <returns>An object that should be converted to the expected type using Convert.To{Type}</returns>
            public static object ExecuteScalar(CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
            {
                return ExecuteScalar(SourConnstr, cmdType, cmdText, commandParameters);
            }

            /// <summary>
            /// Execute a SqlCommand that returns the first column of the first record against the database specified in the connection string 
            /// using the provided parameters.
            /// </summary>
            /// <remarks>
            /// e.g.:  
            ///  Object obj = ExecuteScalar(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
            /// </remarks>
            /// <param name="connectionString">a valid connection string for a SqlConnection</param>
            /// <param name="commandType">the CommandType (stored procedure, text, etc.)</param>
            /// <param name="commandText">the stored procedure name or T-SQL command</param>
            /// <param name="commandParameters">an array of SqlParamters used to execute the command</param>
            /// <returns>An object that should be converted to the expected type using Convert.To{Type}</returns>
            public static object ExecuteScalar(string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
            {
                SqlCommand cmd = new SqlCommand();

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
                    object val = cmd.ExecuteScalar();
                    cmd.Parameters.Clear();
                    return val;
                }
            }

            /// <summary>
            /// Execute a SqlCommand that returns the first column of the first record against an existing database connection 
            /// using the provided parameters.
            /// </summary>
            /// <remarks>
            /// e.g.:  
            ///  Object obj = ExecuteScalar(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
            /// </remarks>
            /// <param name="conn">an existing database connection</param>
            /// <param name="commandType">the CommandType (stored procedure, text, etc.)</param>
            /// <param name="commandText">the stored procedure name or T-SQL command</param>
            /// <param name="commandParameters">an array of SqlParamters used to execute the command</param>
            /// <returns>An object that should be converted to the expected type using Convert.To{Type}</returns>
            public static object ExecuteScalar(SqlConnection connection, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
            {

                SqlCommand cmd = new SqlCommand();

                PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
                object val = cmd.ExecuteScalar();
                cmd.Parameters.Clear();
                return val;
            }

            /// <summary>
            /// Execute a SqlCommand that returns the first column of the first record against an existing database connection 
            /// using the provided parameters.
            /// </summary>
            /// <remarks>
            /// e.g.:  
            ///  Object obj = ExecuteScalar(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
            /// </remarks>
            /// <param name="trans">an existing sql transaction</param>
            /// <param name="commandType">the CommandType (stored procedure, text, etc.)</param>
            /// <param name="commandText">the stored procedure name or T-SQL command</param>
            /// <param name="commandParameters">an array of SqlParamters used to execute the command</param>
            /// <returns>An object that should be converted to the expected type using Convert.To{Type}</returns>
            public static object ExecuteScalar(SqlTransaction trans, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
            {
                SqlCommand cmd = new SqlCommand();

                PrepareCommand(cmd, trans.Connection, trans, cmdType, cmdText, commandParameters);
                object val = cmd.ExecuteScalar();
                cmd.Parameters.Clear();
                return val;
            }

            /// <summary>
            /// Execute a SqlCommand that returns the DataTable object against the database specified in the connection string 
            /// using the provided parameters.
            /// </summary>
            /// <remarks>
            /// e.g.:  
            ///  DataTable tb = ExecuteTable( CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
            /// </remarks>
            /// <param name="commandType">the CommandType (stored procedure, text, etc.)</param>
            /// <param name="commandText">the stored procedure name or T-SQL command</param>
            /// <param name="commandParameters">an array of SqlParamters used to execute the command</param>
            /// <returns>A DataTable containing the results</returns>
            public static DataTable ExecuteTable(CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
            {
                return ExecuteTable(SourConnstr, cmdType, cmdText, commandParameters);
            }

            /// <summary>
            /// Execute a SqlCommand that returns the DataTable object against the database specified in the connection string 
            /// using the provided parameters.
            /// </summary>
            /// <remarks>
            /// e.g.:  
            ///  DataTable tb = ExecuteTable(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
            /// </remarks>
            /// <param name="connectionString">a valid connection string for a SqlConnection</param>
            /// <param name="commandType">the CommandType (stored procedure, text, etc.)</param>
            /// <param name="commandText">the stored procedure name or T-SQL command</param>
            /// <param name="commandParameters">an array of SqlParamters used to execute the command</param>
            /// <returns>A DataTable containing the results</returns>
            public static DataTable ExecuteTable(string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
            {
                SqlCommand cmd = new SqlCommand();

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
                    SqlDataAdapter ap = new SqlDataAdapter();
                    ap.SelectCommand = cmd;
                    DataSet st = new DataSet();
                    ap.Fill(st, "Result");
                    cmd.Parameters.Clear();
                    return st.Tables["Result"];
                }
            }

            /// <summary>
            /// Execute a SqlCommand that returns the DataTable object against an existing database connection 
            /// using the provided parameters.
            /// </summary>
            /// <remarks>
            /// e.g.:  
            ///  DataTable tb = ExecuteTable(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
            /// </remarks>
            /// <param name="conn">an existing database connection</param>
            /// <param name="commandType">the CommandType (stored procedure, text, etc.)</param>
            /// <param name="commandText">the stored procedure name or T-SQL command</param>
            /// <param name="commandParameters">an array of SqlParamters used to execute the command</param>
            /// <returns>A DataTable containing the results </returns>
            public static DataTable ExecuteTable(SqlConnection connection, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
            {

                SqlCommand cmd = new SqlCommand();

                PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
                SqlDataAdapter ap = new SqlDataAdapter();
                ap.SelectCommand = cmd;
                DataSet st = new DataSet();
                ap.Fill(st, "Result");
                cmd.Parameters.Clear();
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
            public static DataTable ExecutePage(string SqlAllFields, string SqlTablesAndWhere, string IndexField, string OrderFields, int PageIndex, int PageSize, out int RecordCount, out int PageCount, params SqlParameter[] commandParameters)
            {
                return ExecutePage(SourConnstr, SqlAllFields, SqlTablesAndWhere, IndexField, OrderFields, PageIndex, PageSize, out  RecordCount, out  PageCount, commandParameters);
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
            public static DataTable ExecutePage(string connectionString, string SqlAllFields, string SqlTablesAndWhere, string IndexField, string OrderFields, int PageIndex, int PageSize, out int RecordCount, out int PageCount, params SqlParameter[] commandParameters)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    return ExecutePage(connection, SqlAllFields, SqlTablesAndWhere, IndexField, OrderFields, PageIndex, PageSize, out RecordCount, out PageCount, commandParameters);
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
            public static DataTable ExecutePage(SqlConnection connection, string SqlAllFields, string SqlTablesAndWhere, string IndexField, string OrderFields, int PageIndex, int PageSize, out int RecordCount, out int PageCount, params SqlParameter[] commandParameters)
            {
                RecordCount = 0;
                PageCount = 0;
                if (PageSize <= 0)
                {
                    PageSize = 10;
                }
                if (connection.State != ConnectionState.Open)
                    connection.Open();
                string SqlCount = "select count(*) from " + SqlTablesAndWhere;
                SqlCommand cmd = new SqlCommand(SqlCount, connection);
                if (commandParameters != null)
                {
                    foreach (SqlParameter parm in commandParameters)
                        cmd.Parameters.Add(parm);
                }
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
                cmd.CommandText = Sql;
                SqlDataAdapter ap = new SqlDataAdapter();
                ap.SelectCommand = cmd;
                DataSet st = new DataSet();
                ap.Fill(st, "PageResult");
                cmd.Parameters.Clear();
                return st.Tables["PageResult"];
            }

            /// <summary>
            /// add parameter array to the cache
            /// </summary>
            /// <param name="cacheKey">Key to the parameter cache</param>
            /// <param name="cmdParms">an array of SqlParamters to be cached</param>
            public static void CacheParameters(string cacheKey, params SqlParameter[] commandParameters)
            {
                parmCache[cacheKey] = commandParameters;
            }

            /// <summary>
            /// Retrieve cached parameters
            /// </summary>
            /// <param name="cacheKey">key used to lookup parameters</param>
            /// <returns>Cached SqlParamters array</returns>
            public static SqlParameter[] GetCachedParameters(string cacheKey)
            {
                SqlParameter[] cachedParms = (SqlParameter[])parmCache[cacheKey];

                if (cachedParms == null)
                    return null;

                SqlParameter[] clonedParms = new SqlParameter[cachedParms.Length];

                for (int i = 0, j = cachedParms.Length; i < j; i++)
                    clonedParms[i] = (SqlParameter)((ICloneable)cachedParms[i]).Clone();

                return clonedParms;
            }

            /// <summary>
            /// Prepare a command for execution
            /// </summary>
            /// <param name="cmd">SqlCommand object</param>
            /// <param name="conn">SqlConnection object</param>
            /// <param name="trans">SqlTransaction object</param>
            /// <param name="cmdType">Cmd type e.g. stored procedure or text</param>
            /// <param name="cmdText">Command text, e.g. Select * from Products</param>
            /// <param name="cmdParms">SqlParameters to use in the command</param>
            private static void PrepareCommand(SqlCommand cmd, SqlConnection conn, SqlTransaction trans, CommandType cmdType, string cmdText, SqlParameter[] cmdParms)
            {

                if (conn.State != ConnectionState.Open)
                    conn.Open();

                cmd.Connection = conn;
                cmd.CommandText = cmdText;

                if (trans != null)
                    cmd.Transaction = trans;

                cmd.CommandType = cmdType;

                if (cmdParms != null)
                {
                    foreach (SqlParameter parm in cmdParms)
                        cmd.Parameters.Add(parm);
                }
            }
        }
    }
}
