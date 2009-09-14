using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration.Install;
using System.Collections.Specialized;
using System.IO;
using System.Reflection;
using System.Management;
using System.Collections;
using Microsoft.Win32;
using System.DirectoryServices;
namespace Foosun.Install
{
    [RunInstaller(true)]
    public partial class Installer1 : Installer
    {
        private string iis;

        private string port;

        private string dir;

        public static string VirDirSchemaName = "IIsWebVirtualDir";

 

        private string _target;

        private DirectoryEntry _iisServer;

        private ManagementScope _scope;

        private ConnectionOptions _connection;

        public Installer1()
        {
            InitializeComponent();
        }



        #region Install 安装

        /// 

        /// 安装数据库

        /// 

        /// 

        public override void Install(IDictionary stateSaver)

        {

             

            base.Install(stateSaver);

 

            dir = this.Context.Parameters["dir"];

 

            //DBName = this.Context.Parameters["DBNAME"].ToString();

            //ServerName = this.Context.Parameters["server"].ToString();

            //AdminName = this.Context.Parameters["user"].ToString();

            //AdminPwd = this.Context.Parameters["pwd"].ToString();

            iis = this.Context.Parameters["iis"].ToString(); ;

            port = this.Context.Parameters["port"].ToString();

            

            //写入获取的安装程序中的变量，此段代码为调试用可以不添加

            //this.sqlConn.ConnectionString = "Packet size=4096;User ID=" + AdminName + ";Data Source=" + ServerName + ";Password=" + AdminPwd + ";Persist Security Info=False;Integrated Security=false";

 

            // 执行SQL 安装数据库 可选择时恢复或者时直接创建

            //if(!CreateDBAndTable(DBName))

            //{

            //    throw new ApplicationException("创建数据库时出现严重错误！");

            //}

            

 

            // 从备份数据库文件恢复数据库

            /*

            if (!RestoreDB(DBName))

            {

                throw new ApplicationException("恢复数据库时出现严重错误！");

            }

            */

 

            // 添加网站

            Connect();

            //string serverID = GetNextOpenID().ToString();

            //string serverComment = websitenName;

 

                     // 下面的信息为测试，可以自己编写文本框来接收用户输入信息

            string serverID = "5555";

            string serverComment = "cqfeng";

            string defaultVrootPath = this.Context.Parameters["targetdir"];

            if (defaultVrootPath.EndsWith(@"\"))

            {

                defaultVrootPath = defaultVrootPath.Substring(0, defaultVrootPath.Length-1);

            }

            string HostName = "";

            string IP = "";

            string Port = port;

            string sReturn = CreateWebSite(serverID, serverComment, defaultVrootPath, HostName, IP, Port);

            

            // 修改web.config

            //if (!WriteWebConfig())

            //{

            //    throw new ApplicationException("设置数据库连接字符串时出现错误");

            //}

 

            //// 写注册表

            //WriteRegistryKey();

        }

        #endregion


        #region Uninstall 删除

                public override void Uninstall(IDictionary savedState)

                {

                    if (savedState == null)

                    {

                        throw new ApplicationException("未能卸载！");

                    }

                    else

                    {

                        base.Uninstall(savedState);

                    }

        }

                #endregion



        #region Connect 连接IIS服务器

        public bool Connect()

        {

 

            if (iis == null)

                return false;

            try

            {

                _iisServer = new DirectoryEntry("IIS://" + iis + "/W3SVC/1");

                _target = iis;

                _connection = new ConnectionOptions();

                _scope = new ManagementScope(@"\\" + iis + @"\root\MicrosoftIISV2", _connection);

                _scope.Connect();

            }

            catch

            {

                  

return false;

            }

            return IsConnected();

        }

 

        public bool IsConnected()

        {

            if (_target == null || _connection == null || _scope == null) return false;

            return _scope.IsConnected;

        }

        #endregion

 

        #region IsWebSiteExists 判断网站是否已经存在

                    public bool IsWebSiteExists(string serverID)

                    {

                        try

                        {

                            string siteName = "W3SVC/" + serverID;

                            ManagementObjectSearcher searcher = new ManagementObjectSearcher(_scope, new ObjectQuery("SELECT * FROM IIsWebServer"), null);

             

                            ManagementObjectCollection webSites = searcher.Get();

                            foreach (ManagementObject webSite in webSites)

                            {

                                if ((string)webSite.Properties["Name"].Value == siteName)

                                    return true;

                            }

             

                            return false;

                        }

                        catch

                        {

                            return false;

                        }

                    }

                    #endregion

 

        #region GetNextOpenID 获得一个新的ServerID

        private int GetNextOpenID()

        {

            DirectoryEntry iisComputer = new DirectoryEntry("IIS://localhost/w3svc");

            int nextID = 0;

            foreach (DirectoryEntry iisWebServer in iisComputer.Children)

            {

                string sname = iisWebServer.Name;

                try

                {

                    int name = int.Parse(sname);

                    if (name > nextID)

                    {

                        nextID = name;

                    }

                }

                catch

                {

                }

            }

            return ++nextID;

        }

        #endregion

 

        #region CreateWebsite 添加网站

                    public string CreateWebSite(string serverID, string serverComment, string defaultVrootPath, string HostName, string IP, string Port)

                    {

                        try

                        {

                            ManagementObject oW3SVC = new ManagementObject(_scope, new ManagementPath(@"IIsWebService='W3SVC'"), null);

             

                            if (IsWebSiteExists(serverID))

                            {

                                return "Site Already Exists...";

                            }

             

                            ManagementBaseObject inputParameters = oW3SVC.GetMethodParameters("CreateNewSite");

                            ManagementBaseObject[] serverBinding = new ManagementBaseObject[1];

                            serverBinding[0] = CreateServerBinding(HostName, IP, Port);

                            inputParameters["ServerComment"] = serverComment;

                            inputParameters["ServerBindings"] = serverBinding;

                            inputParameters["PathOfRootVirtualDir"] = defaultVrootPath;

                            inputParameters["ServerId"] = serverID;

                            

                            ManagementBaseObject outParameter = null;

                            outParameter = oW3SVC.InvokeMethod("CreateNewSite", inputParameters, null);

                            

                            // 启动网站

                            string serverName = "W3SVC/" + serverID;

                            ManagementObject webSite = new ManagementObject(_scope, new ManagementPath(@"IIsWebServer='" + serverName + "'"), null);

                            webSite.InvokeMethod("Start", null);

             

                            return (string)outParameter.Properties["ReturnValue"].Value;

                        }

                        catch (Exception ex)

                        {

                            return ex.Message;

                        }

                    }

             

                    public ManagementObject CreateServerBinding(string HostName, string IP, string Port)

                    {

                        try

                        {

                            ManagementClass classBinding = new ManagementClass(_scope, new ManagementPath("ServerBinding"), null);

                            ManagementObject serverBinding = classBinding.CreateInstance();

                            serverBinding.Properties["Hostname"].Value = HostName;

                            serverBinding.Properties["IP"].Value = IP;

                            serverBinding.Properties["Port"].Value = Port;

                            serverBinding.Put();

                            return serverBinding;

                        }

                        catch

                        {

                            return null;

                        }

                    }

                    #endregion



    }
}