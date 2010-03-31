using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration.Install;

using System.IO;

using System.DirectoryServices;

using System.Reflection;

using System.Data;

using System.Data.SqlClient;


using System.Management;

using System.Collections;

using Microsoft.Win32;

using System.Collections.Specialized;
using System.Text;//如果编译的时候出错，请添加相关引用。



namespace SetupClassLibrary
{
    [RunInstaller(true)]
    public partial class Installer1 : Installer
    {
        public Installer1()
        {
            InitializeComponent();
        }

        private System.Data.SqlClient.SqlConnection sqlConn;
        private System.Data.SqlClient.SqlCommand Command;
        private string DBName;
        private string ServerName;
        private string AdminName;
        private string AdminPwd;
        private string iis;
        private string port;
        private string dir;
        public static string VirDirSchemaName = "IIsWebVirtualDir";
        private string _target;

        private DirectoryEntry _iisServer;
        private ManagementScope _scope;
        private ConnectionOptions _connection;

        #region ConnectDatabase 连接数据库

        private bool ConnectDatabase()
        {
            if (Command.Connection.State != ConnectionState.Open)
            {
                try
                {
                    Command.Connection.Open();
                }
                catch (Exception e)
                {
                    return false;
                }
            }
            return true;
        }

        #endregion


        #region GetSql 从文件中读取SQL，在读取包含SQL脚本的文件时需要用到，参考自MSDN

        private string GetSql(string Name)
        {
            try
            {
                Assembly Asm = Assembly.GetExecutingAssembly();
                Stream strm = Asm.GetManifestResourceStream(Asm.GetName().Name + "." + Name);
                StreamReader reader = new StreamReader(strm);
                return reader.ReadToEnd();
            }

            catch (Exception getException)
            {
                throw new ApplicationException(getException.Message);
            }
        }

        #endregion

        #region ExecuteSql 执行SQL语句，参考自MSDN

        private void ExecuteSql(string DataBaseName, string sqlstring)
        {
            Command = new System.Data.SqlClient.SqlCommand(sqlstring, sqlConn);
            if (ConnectDatabase())
            {
                try
                {
                    Command.Connection.ChangeDatabase(DataBaseName);
                    Command.ExecuteNonQuery();
                }
                finally
                {
                    Command.Connection.Close();
                }
            }
        }

        #endregion

        #region CreateDBAndTable 创建数据库及数据库表，参考自MSDN

        protected bool CreateDBAndTable(string DBName)
        {
            bool Restult = false;
            try
            {
                ExecuteSql("master", "USE MASTER IF EXISTS (SELECT NAME FROM SYSDATABASES WHERE NAME='" + DBName + "') DROP DATABASE " + DBName);
                ExecuteSql("master", "CREATE DATABASE " + DBName);
                ExecuteSql(DBName, GetSql("DBSQL.txt"));
                Restult = true;
            }
            catch
            {
            }
            return Restult;
        }

        #endregion


        #region RestoreDB 从备份文件恢复数据库及数据库表

        /// 

        /// 从备份文件恢复数据库及数据库表

        /// 

        /// 数据库名

        /// 配件中数据库脚本资源的名称

        /// 

        protected bool RestoreDB(string DBName)
        {

            dir = this.Context.Parameters["targetdir"];

            bool Restult = false;

            string MSQL = "RESTORE DATABASE " + DBName +

                " FROM DISK = '" + dir + @"data.bak' " +

                " WITH MOVE 'Test' TO '" + @"c:" + DBName + ".mdf', " +

                " MOVE 'Test_log' TO '" + @"c:" + DBName + ".ldf' ";

            try
            {

                ExecuteSql("master", "USE MASTER IF EXISTS (SELECT NAME FROM SYSDATABASES WHERE NAME='" + DBName + "') DROP DATABASE " + DBName);

                ExecuteSql("master", MSQL);

                Restult = true;

            }

            finally
            {

                // 删除备份文件

                try
                {

                    File.Delete(dir + @"data.bak");

                }

                catch
                {

                }

            }

            return Restult;

        }

        #endregion

        #region WriteWebConfig 修改web.config的连接数据库的字符串

        private bool WriteWebConfig()
        {

            System.IO.FileInfo FileInfo = new System.IO.FileInfo(this.Context.Parameters["targetdir"] + "/web.config");

            if (!FileInfo.Exists)
            {

                throw new InstallException("Missing config file :" + this.Context.Parameters["targetdir"] + "/web.config");

            }

            System.Xml.XmlDocument xmlDocument = new System.Xml.XmlDocument();

            xmlDocument.Load(FileInfo.FullName);

            bool FoundIt = false;

            foreach (System.Xml.XmlNode Node in xmlDocument["configuration"]["appSettings"])
            {

                if (Node.Name == "add")
                {

                    if (Node.Attributes.GetNamedItem("key").Value == "ConnectionString")
                    {

                        Node.Attributes.GetNamedItem("value").Value = String.Format("Persist Security Info=False;Data Source={0};database={1};User ID={2};Password={3};Packet Size=4096;Pooling=true;Max Pool Size=100;Min Pool Size=1", ServerName, DBName, AdminName, AdminPwd);

                        FoundIt = true;

                    }

                }

            }

            if (!FoundIt)
            {

                throw new InstallException("Error when writing the config file: web.config");

            }

            xmlDocument.Save(FileInfo.FullName);

            return FoundIt;

        }

        #endregion

        #region WriteRegistryKey 写注册表。安装部署中，直接有一个注册表编辑器，可以在那里面设置。

        private void WriteRegistryKey()
        {

            // 写注册表

            RegistryKey hklm = Registry.LocalMachine;

            RegistryKey cqfeng = hklm.OpenSubKey("SOFTWARE", true);

            RegistryKey F = cqfeng.CreateSubKey("cqfeng");

            F.SetValue("FilePath", "kkkk");

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

                _scope = new ManagementScope(@"""" + iis + "\"root\"MicrosoftIISV2", _connection);

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

        public string CreateVirtualDirectory(string nameDirectory, string realPath, string defaultPage)
        {

            string _serverName = "localhost";

            DirectoryEntry _iisServer = new DirectoryEntry("IIS://" + _serverName + "/W3SVC/1");

            DirectoryEntry folderRoot = _iisServer.Children.Find("ROOT", VirDirSchemaName);

            if (folderRoot == null)

                return "IIS 未正常安装";

            if (folderRoot.Children == null)

                return "IIS 可能未启动";

            DirectoryEntry existPath = null;

            try
            {

                existPath = folderRoot.Children.Find(nameDirectory, VirDirSchemaName);

            }

            catch (Exception e)

            { }

            if (existPath != null)
            {

                StringBuilder sb;

                sb = new StringBuilder();

                System.DirectoryServices.PropertyCollection props = existPath.Properties;

                foreach (System.DirectoryServices.PropertyValueCollection valcol in existPath.Properties)
                {

                    sb.Append(valcol.PropertyName);

                    sb.Append(":");

                    sb.Append(valcol.Value.ToString());

                    sb.Append("\r");

                }

                string f = sb.ToString();

            }

            DirectoryEntry newVirDir = null;

            try
            {

                newVirDir = folderRoot.Children.Add(nameDirectory, folderRoot.SchemaClassName);

            }

            catch (Exception e)
            {

                return "Sorry!Error when adding the virtual path. Return message is : " + e.Message;

            }



            try
            {

                newVirDir.Properties["Path"].Insert(0, realPath);       // 虚拟目录的绝对路径

                newVirDir.Properties["AuthFlags"][0] = 5; //1:anonymouse, 4:windows

                newVirDir.Properties["AccessExecute"][0] = false;       // 可执行文件。执行权限下拉菜单中

                newVirDir.Properties["AccessRead"][0] = true;           // 读取

                newVirDir.Properties["AccessWrite"][0] = false;          // 写入

                newVirDir.Properties["AccessScript"][0] = true;         // 可执行脚本。执行权限下拉菜单中

                newVirDir.Properties["ContentIndexed"][0] = true;       // 资源索引

                newVirDir.Properties["DefaultDoc"][0] = defaultPage; // DefaultPage;    // 默认页面

                newVirDir.Properties["AppFriendlyName"][0] = "友好的目录名称";   // 友好的显示名称

                newVirDir.Properties["AppIsolated"][0] = 2;             // 值0 表示应用程序在进程内运行，值1 表示进程外，值2 表示进程池

                newVirDir.Properties["DontLog"][0] = true;

                newVirDir.Properties["ScriptMaps"].Value = ScriptArray().ToArray();

                newVirDir.Invoke("AppCreate", true); //q确保创建成功

                newVirDir.CommitChanges();

                folderRoot.CommitChanges();

                _iisServer.CommitChanges();

                return "Add success";

            }

            catch (Exception e)
            {

                return "Error  message is : " + e.Message;

            }

            return "-----------";

        }

        public ArrayList ScriptArray()
        {
            ArrayList list = new ArrayList();
            string[] array ={ ".ascx", ".asmx", ".aspx", ".config" };
            for (int i = 0; i < array.Length; i++)
            {
                list.Add(array[i] + @",c:\windows\microsoft.net\framework\v2.0.50727\aspnet_isapi.dll,5,GET,HEAD,POST,DEBUG");
            }
            return list;
        }


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



        public override void Install(System.Collections.IDictionary stateSaver)
        {
            base.Install(stateSaver);

            dir = this.Context.Parameters["dir"];
            DBName = this.Context.Parameters["DBNAME"].ToString();
            ServerName = this.Context.Parameters["server"].ToString();
            AdminName = this.Context.Parameters["user"].ToString();
            AdminPwd = this.Context.Parameters["pwd"].ToString();
            iis = this.Context.Parameters["iis"].ToString(); ;

            port = this.Context.Parameters["port"].ToString();


            #region 

            if (!System.Diagnostics.EventLog.SourceExists("EpowerInstall"))
            {
                System.Diagnostics.EventLog.CreateEventSource(
                    "EpowerInstall", "");
            }
            myLog.Source = "EpowerInstall";

            System.Reflection.Assembly Asm = System.Reflection.Assembly.GetExecutingAssembly();
            string strTemp = Asm.Location;
            System.Diagnostics.Debug.WriteLine(strTemp);
            strFolderName = strTemp.Remove(strTemp.LastIndexOf(@"\"), strTemp.Length - strTemp.LastIndexOf(@"\"));


            //确保IIS为正确的版本
            InstallToVersion2(strFolderName.Substring(strFolderName.LastIndexOf(@"\") + 1));

            //this.InstallMyConfig(stateSaver);//调用上面的方法
            this.InstallMyConfigTemp(stateSaver);


            //创建桌面快捷方式
            CreateE8UrlShortCut(System.Environment.GetFolderPath(Environment.SpecialFolder.Desktop), strFolderName.Substring(strFolderName.LastIndexOf(@"\") + 1));

            stateSaver.Add("E8HelpDeskDeskSC", System.Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + "\\E8.HelpDesk服务管理系统.url"); //保存桌面快诫方式文件绝对地址 

            //创建程序快截方式
            string strStartMenue = Environment.GetFolderPath(Environment.SpecialFolder.StartMenu);
            if (File.Exists(strStartMenue + "\\E8.HelpDesk服务管理系统.url"))
            {
                File.Copy(System.Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + "\\E8.HelpDesk服务管理系统.url", strStartMenue + "\\E8.HelpDesk服务管理系统.url", true);

            }
            else
            {
                File.Copy(System.Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + "\\E8.HelpDesk服务管理系统.url", strStartMenue + "\\E8.HelpDesk服务管理系统.url", false);
            }
            stateSaver.Add("E8StartMenueSC", strStartMenue + "\\E8.HelpDesk服务管理系统.url"); //保存开始菜单文件绝对地址 



            #endregion




            //写入获取的安装程序中的变量，此段代码为调试用可以不添加

            this.sqlConn.ConnectionString = "Packet size=4096;User ID=" + AdminName + ";Data Source=" + ServerName + ";Password=" + AdminPwd + ";Persist Security Info=False;Integrated Security=false";

            // 执行SQL 安装数据库 可选择时恢复或者时直接创建

            if (!CreateDBAndTable(DBName))
            {

                throw new ApplicationException("创建数据库时出现严重错误！");

            }

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

            if (defaultVrootPath.EndsWith(@""))
            {

                defaultVrootPath = defaultVrootPath.Substring(0, defaultVrootPath.Length - 1);

            }

            string HostName = "";

            string IP = "";

            string Port = port;

            string sReturn = CreateWebSite(serverID, serverComment, defaultVrootPath, HostName, IP, Port);

            // 修改web.config

            if (!WriteWebConfig())
            {

                throw new ApplicationException("设置数据库连接字符串时出现错误");

            }

            // 写注册表

            WriteRegistryKey();
        }

        // 删除时的方法。在本文中未详细操作，比如删除站点，删除数据库等。如果需要，请你自己补足
        public override void Uninstall(System.Collections.IDictionary savedState)
        {
            base.Uninstall(savedState);

        }
    }
}