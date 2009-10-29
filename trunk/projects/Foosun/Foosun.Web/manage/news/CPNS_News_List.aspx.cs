using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Collections.Generic;

namespace Foosun.Web.manageXXBN.news
{
    public partial class CPNS_News_List : Foosun.Web.UI.ManagePage
    {
        private string str_FilePath = "";
        private string root = "";
        string FP = Foosun.Config.UIConfig.filePass;//从Web.config中读取文件密码信息
        public string str_dirMana = Foosun.Config.UIConfig.dirDumm;//获取用户虚拟路径
        public string fpath1 = Foosun.Config.UIConfig.filePath.Split(',')[0];//userfiles目录

        protected void Page_Load(object sender, EventArgs e)
        {
            //
            string op = Request.QueryString["op"];
            if (!String.IsNullOrEmpty(op))
            {
                string filename = Request.QueryString["file"];
                NewsInfo news = BatchAddNewsHandler.CreateNewsInfo(filename);
                if (!String.IsNullOrEmpty(news.Attachment))
                {
                    BatchAddNewsHandler.DeleteFile(filename.Substring(0, filename.LastIndexOf('\\') + 1) + news.Attachment);
                }
                BatchAddNewsHandler.DeleteFile(filename);
            }

                if (str_dirMana != "" && str_dirMana != null && str_dirMana != string.Empty)
                    str_dirMana = "//" + str_dirMana;
                string FileID = Request.QueryString["Id"];
                Response.CacheControl = "no-cache"; //清除缓存

                if (SiteID == "0")
                {
                    str_FilePath = Server.MapPath(str_dirMana + "\\" + fpath1);
                }
                else
                {
                    string _sitePath = str_dirMana + "\\" + Foosun.Config.UIConfig.dirSite + "\\" + SiteID;
                    if (!Directory.Exists(Server.MapPath(_sitePath))) { Directory.CreateDirectory(Server.MapPath(_sitePath)); }
                    str_FilePath = Server.MapPath(_sitePath);
                }
                string cpsn = Foosun.Config.UIConfig.CpsnDir;

                root = str_FilePath;

                str_FilePath = str_FilePath + "\\" + cpsn;
                //string ParentPath = root + Request.Form["ParentPath"]; //父级
                //string ParentPath = root + Request.QueryString["parentpath"]; //父级

                //string type = Request.Form["Type"];
                //string Path = ParentPath + (String.IsNullOrEmpty(Request.Form["Path"]) ? "\\" + cpsn : Request.Form["Path"]);
                //string Path = ParentPath + (String.IsNullOrEmpty(Request.QueryString["path"]) ? "\\" + cpsn : Request.QueryString["path"]);
                //string ParentPath = str_FilePath + Request.Form["ParentPath"]; //父级
                //string path = str_FilePath;

                //string parentPath = Request.QueryString["parentpath"];

                //string type = Request.Form["Type"];
                //string path = str_FilePath + Request.Form["path"];
                //string parentPath = str_FilePath + Request.Form["parentpath"]; //父级

                string path = str_FilePath + Request.QueryString["path"];
                string parentPath = (Request.QueryString["parentpath"] != null && Request.QueryString["parentpath"].StartsWith(str_FilePath)) ? Request.QueryString["parentpath"] : str_FilePath + Request.QueryString["parentpath"]; //父级



                //aHome.NavigateUrl = "CPNS_News_List.aspx?id=" + FP;
                //aCreateDir.NavigateUrl = "javascript:AddDir('\\" + path + "');";
                //aUpload.NavigateUrl = "javascript:UpFile('\\" + path + "');";

                if (str_FilePath == path)
                {
                    aGoBack.Visible = false;
                }
                else
                {
                    if (parentPath == str_FilePath)
                    {
                        aGoBack.NavigateUrl = "javascript:ListGo('','" + path.Replace("\\", "\\\\") + "');";
                    }
                    else
                    {
                        if (parentPath.Length <= path.Length)
                        {
                            string p = parentPath.Remove(0, str_FilePath.Length).Replace("\\", "\\\\");
                            aGoBack.NavigateUrl = "javascript:ListGo('" + p + "','" + path.Replace("\\", "\\\\") + "');";
                        }
                        else
                        {
                            aGoBack.NavigateUrl = "javascript:ListGo('','" + path.Replace("\\", "\\\\") + "');";
                        }
                        
                    }
                    aGoBack.Visible = true;
                }
                //currentDir.Text = String.IsNullOrEmpty(Request.Form["Path"]) ? str_FilePath : Request.Form["Path"];
                currentDir.Text = String.IsNullOrEmpty(Request.QueryString["path"]) ? str_FilePath : Request.QueryString["path"];


                Repeater1.DataSource = GetNews(path);
                Repeater1.DataBind();

                if (!IsPostBack) //判断页面是否重载
                {
                    copyright.InnerHtml = CopyRight;  //获取版权信息
                }

        }

        private List<NewsFileInfo> GetNews(string path)
        {
            string excludeFile = Foosun.Config.UIConfig.ColumnFile;

            List<NewsFileInfo> news = new List<NewsFileInfo>();

            DirectoryInfo dir = new DirectoryInfo(path);
            DirectoryInfo[] childDirectory = dir.GetDirectories();                      //子目录集
            FileInfo[] files = dir.GetFiles();

            foreach (DirectoryInfo d in childDirectory)
            {
                NewsFileInfo f = new NewsFileInfo();
                f.FileName = d.Name;
                f.FullName = d.FullName;
                f.FileSize = -1;
                f.IsDir = true;
                f.ParentDirectory = path;
                f.FileType = "文件夹";
                f.CreateAt = d.LastWriteTime;

                news.Add(f);
            }

            foreach (FileInfo file in files)
            {
                if (file.Name == excludeFile || !file.Name.EndsWith(".xml"))
                    continue;
                NewsFileInfo f = new NewsFileInfo();
                f.FileName = file.Name;
                f.FullName = file.FullName;
                f.FileSize = file.Length;
                f.ParentDirectory = file.DirectoryName;
                f.FileType = file.Extension + "文件";
                f.IsDir = false;
                f.CreateAt = file.LastWriteTime;

                news.Add(f);
            }

            return news;

        }

        protected void RepeaterItemDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                NewsFileInfo fileInfo = e.Item.DataItem as NewsFileInfo;

                if (fileInfo.IsDir)
                {
                    ((Image)e.Item.FindControl("fileIcon")).ImageUrl = "../../sysImages/FileIcon/folder.gif";

                    string sub = "";

                    if (str_FilePath == fileInfo.ParentDirectory)
                    {
                        //((HyperLink)e.Item.FindControl("folder")).NavigateUrl = "javascript:ListGo('\\\\" + fileInfo.FileName + "','" + fileInfo.ParentDirectory.Remove(0, root.Length).Replace("\\", "\\\\") + "');";
                        sub = "javascript:ListGo('\\\\" + fileInfo.FileName + "','');";
                        ((HyperLink)e.Item.FindControl("folder")).NavigateUrl = sub;
                    }
                    else
                    {
                        string tmp = fileInfo.ParentDirectory.Remove(0, str_FilePath.Length);
                        //string t = tmp.Remove(tmp.LastIndexOf('\\') + 1);
                        sub = "javascript:ListGo('" + tmp.Replace("\\", "\\\\") + "\\\\" + fileInfo.FileName + "','" + fileInfo.ParentDirectory.Remove(0, str_FilePath.Length).Replace("\\", "\\\\") + "');";
                        ((HyperLink)e.Item.FindControl("folder")).NavigateUrl = sub;
                    }
                    
                    ((HyperLink)e.Item.FindControl("folder")).Text = fileInfo.FileName;
                    ((HyperLink)e.Item.FindControl("folder")).Visible = true;
                    ((Literal)e.Item.FindControl("fileSize")).Text = "-";

                    ((HyperLink)e.Item.FindControl("aEnter")).NavigateUrl = sub;// "javascript:ListGo('\\\\" + fileInfo.FileName + "','" + fileInfo.ParentDirectory.Remove(0, root.Length).Replace("\\", "\\\\") + "');";
                    ((HyperLink)e.Item.FindControl("aEnter")).Text = "<img src='../../sysImages/default/sysico/enter.gif' border='0' alt='进入此目录' />";
                    ((HyperLink)e.Item.FindControl("aEnter")).Visible = true;
                    ((CheckBox)e.Item.FindControl("chk")).Visible = false;
                }
                else
                {
                    ((Literal)e.Item.FindControl("fileName")).Text = fileInfo.FileName;
                    ((Image)e.Item.FindControl("fileIcon")).ImageUrl = "../../sysImages/FileIcon/" + GetFileIco(fileInfo.FileType);
                    ((Literal)e.Item.FindControl("fileSize")).Text = fileInfo.FileSize.ToString("N");

                    ((HyperLink)e.Item.FindControl("aAddFile")).NavigateUrl = "News_add.aspx?file=" + System.Web.HttpUtility.UrlEncode( fileInfo.FullName);// Server.HtmlEncode(fileInfo.FullName); //"javascript:MoveFile('\\\\" + fileInfo.ParentDirectory + "','" + fileInfo.FileName + "');";
                    ((HyperLink)e.Item.FindControl("aAddFile")).Text = "<img src='../../sysImages/default/sysico/add.gif' border='0' alt='添加为新闻' />";
                    ((HyperLink)e.Item.FindControl("aEnter")).Visible = false;
                    ((CheckBox)e.Item.FindControl("chk")).Visible = true; //

                    ((HyperLink)e.Item.FindControl("aDelete")).Visible = true;
                    ((HyperLink)e.Item.FindControl("aDelete")).NavigateUrl = "CPNS_News_List.aspx?file=" + System.Web.HttpUtility.UrlEncode(fileInfo.FullName) + "&op=delete";
                    ((HyperLink)e.Item.FindControl("aDelete")).Text = "<img src='../../sysImages/default/sysico/del.gif' border='0' alt='添加为新闻' />";
                    ((HyperLink)e.Item.FindControl("aDelete")).Attributes.Add("onclick", "return confirm('您确实要删除本条新闻吗？');");
                }
                
                ((Literal)e.Item.FindControl("fileExtension")).Text = fileInfo.FileType;
                ((Literal)e.Item.FindControl("fileCreateAt")).Text = fileInfo.CreateAt.ToString("");
                ((HiddenField)e.Item.FindControl("fileFullName")).Value = fileInfo.FullName;
                 

                //((Label)e.Item.FindControl("RatingLabel")).Text
 
                //if (((Evaluation)e.Item.DataItem).Rating == "Good")
                //{
                //    ((Label)e.Item.FindControl("RatingLabel")).Text = "<b>***Good***</b>";
                //}
            }
        }

        protected string GetFileIco(string type)
        {
            string Str_ImgPath;
            switch (type.ToLower())
            {
                case ".htm":
                    Str_ImgPath = "html.gif";
                    break;
                case ".html":
                    Str_ImgPath = "html.gif";
                    break;
                case ".shtm":
                    Str_ImgPath = "html.gif";
                    break;
                case ".shtml":
                    Str_ImgPath = "html.gif";
                    break;
                case ".aspx":
                    Str_ImgPath = "aspx.gif";
                    break;
                case ".cs":
                    Str_ImgPath = "c.gif";
                    break;
                case ".asp":
                    Str_ImgPath = "asp.gif";
                    break;
                case ".doc":
                    Str_ImgPath = "doc.gif";
                    break;
                case ".exe":
                    Str_ImgPath = "exe.gif";
                    break;
                case ".swf":
                    Str_ImgPath = "flash.gif";
                    break;
                case ".gif":
                    Str_ImgPath = "gif.gif";
                    break;
                case ".jpg":
                    Str_ImgPath = "jpg.gif";
                    break;
                case ".jpeg":
                    Str_ImgPath = "jpg.gif";
                    break;
                case ".js":
                    Str_ImgPath = "script.gif";
                    break;
                case ".txt":
                    Str_ImgPath = "txt.gif";
                    break;
                case ".xml":
                    Str_ImgPath = "xml.gif";
                    break;
                case ".zip":
                    Str_ImgPath = "zip.gif";
                    break;
                case ".rar":
                    Str_ImgPath = "zip.gif";
                    break;
                default:
                    Str_ImgPath = "unknown.gif";
                    break;
            }
            return Str_ImgPath;
        }

        protected void btnBatchAdd_ServerClick(object sender, EventArgs e)
        {
            foreach (RepeaterItem item in Repeater1.Items)
            {
                object o = item.DataItem;
            }
        }
    }

    public class NewsFileInfo
    {
        private string fileName;
        private string fullName;
        private long fileSize;
        private string parentDirectory;
        private string fileType;
        private DateTime createAt;
        private bool isDir;

        public string FileName { get { return fileName; } set { fileName = value; } }
        public string FullName { get { return fullName; } set { fullName = value; } }
        public long FileSize { get { return fileSize; } set { fileSize = value; } }
        public string ParentDirectory { get { return parentDirectory; } set { parentDirectory = value; } }
        public DateTime CreateAt { get { return createAt; } set { createAt = value; } }
        public bool IsDir { get { return isDir; } set { isDir = value; } }
        public string FileType { get { return fileType; } set { fileType = value; } }
    }
}
