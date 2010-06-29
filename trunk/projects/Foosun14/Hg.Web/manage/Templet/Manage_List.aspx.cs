///************************************************************************************************************
///**********模板管理Code By lsd****************************************************************************
///************************************************************************************************************
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

public partial class manage_Templet_Manage_List : Hg.Web.UI.ManagePage
{
	public manage_Templet_Manage_List()
	{
		Authority_Code = "T001";
	}
	private string str_dirMana = Hg.Config.UIConfig.dirDumm;
	private string str_Templet = Hg.Config.UIConfig.dirTemplet;  //获取模板路径
	//private string str_FilePath = "";
	private string s_url = "";
    private string RootServerPath = string.Empty;//物理根路径
    private string RootPath = string.Empty;//相对根路径
    private string CurrentPath = string.Empty;//当前路径
	protected void Page_Load(object sender, EventArgs e)
	{
		Response.CacheControl = "no-cache";
		if (!IsPostBack)                                                        //判断页面是否重载
		{
			copyright.InnerHtml = CopyRight;                            //获取版权信息
		}
		if (str_dirMana.Trim() != string.Empty)//判断虚拟路径是否为空,如果不是则加上//
		{
			str_dirMana = "\\" + str_dirMana;
		}
		string type = Request.QueryString["Type"];
        if (SiteID == "0")
        {
            RootServerPath = Server.MapPath(str_dirMana + "\\" + str_Templet);
            RootPath = str_dirMana + "\\" + str_Templet;
            
        }
        else
        {
            string _sitePath = str_dirMana + "\\" + Hg.Config.UIConfig.dirSite + "\\" + Hg.Global.Current.SiteEName + "\\" + str_Templet;
            if (!Directory.Exists(Server.MapPath(_sitePath))) { Directory.CreateDirectory(Server.MapPath(_sitePath)); }
            RootServerPath = Server.MapPath(_sitePath);
            RootPath = _sitePath;
        }
        

        string Path = RootServerPath + Request.QueryString["Path"];
        string ParentPath = RootServerPath + Request.QueryString["ParentPath"]; //父级
        string currentServerPath = RootServerPath + Request.QueryString["Path"];
        string ParentServerPath = RootServerPath + Request.QueryString["ParentPath"]; //父级
        CurrentPath = RootPath + Request.QueryString["Path"];


		try
		{
            if (currentServerPath.IndexOf(RootServerPath, 0) == -1 || ParentServerPath.IndexOf(RootServerPath, 0) == -1)
				Response.End();
		}
		catch { }

		switch (type)
		{
			case "EidtDirName":     //修改文件夹名称
				this.Authority_Code = "T003";
				this.CheckAdminAuthority();
                EidtDirName(currentServerPath);
				break;
			case "EidtFileName":    //修改文件名称
				this.Authority_Code = "T007";
				this.CheckAdminAuthority();
                EidtFileName(currentServerPath);
				break;
			case "DelDir":          //删除文件夹
				this.Authority_Code = "T004";
				this.CheckAdminAuthority();
                DelDir(currentServerPath);
				break;
			case "DelFile":          //删除文件
				this.Authority_Code = "T004";
				this.CheckAdminAuthority();
                DelFile(currentServerPath);
				break;
			case "AddDir":
				this.Authority_Code = "T003";
				this.CheckAdminAuthority();
                AddDir(currentServerPath);        //添加文件夹
				break;
			default:
				break;
		}
        ShowFile(RootServerPath, currentServerPath, ParentServerPath );
		s_url = "Manage_List.aspx?Path=" + Request.QueryString["Path"] + "&ch=" + Request.QueryString["ch"] + "&ParentPath=" + Request.QueryString["ParentPath"];
	}

	/// <summary>
	/// 显示文件列表
	/// </summary>
	/// <param name="defaultpath">默认路径</param>
	/// <param name="path">当前路径</param>
	/// <param name="parentPath">父目录路径</param>
	/// <returns>显示文件列表</returns>
	/// Code By DengXi
	protected void ShowFile(string defaultpath, string currentPath, string parentPath)
	{

        if (currentPath != "" && currentPath != null && currentPath != string.Empty)
		{
            defaultpath = currentPath;
		}
		if (Directory.Exists(defaultpath) == false)            //判断模板目录是否存在
		{
			PageError("目录不存在", "");
		}
		File_List.InnerHtml = GetDirFile(defaultpath, parentPath);
	}

	/// <summary>
	/// 显示文件列表
	/// </summary>
	/// <param name="dir">当前路径</param>
	/// <param name="ParPath">父目录路径</param>
	/// <returns>显示文件列表</returns>
	/// Code By DengXi
    protected string GetDirFile(string currentServerPath, string ParentServerPath)//currentServerPath, ParentServerPath
	{
		//bug修改,预览带端口不能正常显示， arjun 2008.2.17
		string DomainAndPort = Request.ServerVariables["Server_Name"];
		if (Convert.ToString(Request.ServerVariables["Server_Port"]) != "80")
		{
			DomainAndPort += ":" + Request.ServerVariables["Server_Port"];
		}

		DirectoryInfo[] ChildDirectory;                         //子目录集
		FileInfo[] NewFileInfo;                                 //当前所有文件

        DirectoryInfo FatherDirectory = new DirectoryInfo(currentServerPath); //当前目录

		ChildDirectory = FatherDirectory.GetDirectories("*.*"); //得到子目录集

		NewFileInfo = FatherDirectory.GetFiles();               //得到文件集，可以进行操作
		//-----------获取目录以及文件列表
		string str_TempFileStr;
		string str_TrStart = "<tr class=\"TR_BG_list\" onmouseover=\"javascript:overColor(this);\" onmouseout=\"javascript:outColor(this);\">";
		string str_TrEnd = "</tr>";
		string str_TdStart = "<td class=\"list_link\" align=\"left\">";
		string str_TdEnd = "</td>";
		//string Str_TempParentstr;
        string str_tempCurrentServerPath;
        //string TempParentPath = currentServerPath.Replace("\\", "\\\\");      //路径转意
        string tempCurrentServerPath = currentServerPath.Replace("\\", "\\\\");      //路径转意
        


		//------------取得当前所在目录
        if (ParentServerPath == "" || ParentServerPath == null || ParentServerPath == string.Empty || ParentServerPath == "undefined")
		{
            str_tempCurrentServerPath = "当前目录:" + currentServerPath;
		}
		else
		{

            if (currentServerPath == Server.MapPath(RootPath))      //判断是否是模板目录,如果是则不显示返回上级目录
			{
                str_tempCurrentServerPath = "当前目录:" + RootPath.Replace("\\", "/");
			}
			else
			{
				string str_thispath = "";
				if (str_dirMana != null && str_dirMana != "")
					str_thispath = Server.MapPath(str_dirMana);
				else
					str_thispath = Server.MapPath("/");

                ParentServerPath = ParentServerPath.Replace("\\", "\\\\");
                //获取当前目录的上级目录
                string Str_strpath = tempCurrentServerPath.Remove(tempCurrentServerPath.LastIndexOf("\\") - 1).Replace(RootServerPath.Replace("\\", "\\\\"), "");//获取当前目录的上级目录
                str_tempCurrentServerPath = "<a href=\"javascript:ListGo('" + Str_strpath.Replace(RootServerPath.Replace("\\", "\\\\"), "") + "','" + tempCurrentServerPath.Replace(RootServerPath.Replace("\\", "\\\\"), "") + "');\" class=\"list_link\" title=\"点击回到上级目录\">返回上级目录</a>   |   当前目录:/" + currentServerPath.Replace(str_thispath, "").Replace("\\", "/");
			}
		}
        ShowAddfiledir(tempCurrentServerPath.Replace(RootServerPath.Replace("\\", "\\\\"), "")); //调用显示创建目录,导入文件函数

		str_TempFileStr = "<table border=\"0\" class=\"table\" width=\"100%\" cellpadding=\"5\" cellspacing=\"1\">";
        str_TempFileStr += str_TrStart + "<td class=\"list_link\" align=\"left\"colspan=\"5\">" + str_tempCurrentServerPath + str_TrEnd;
		str_TempFileStr += "</table>";
		str_TempFileStr += "<table border=\"0\" class=\"table\" width=\"100%\" cellpadding=\"5\" cellspacing=\"1\">";
		str_TempFileStr += "<tr class=\"TR_BG\">";

		str_TempFileStr += str_TdStart + "名称" + str_TdEnd;
		str_TempFileStr += str_TdStart + "类型" + str_TdEnd;
		str_TempFileStr += str_TdStart + "大小(byte)" + str_TdEnd;
		str_TempFileStr += str_TdStart + "最后修改时间" + str_TdEnd;
		str_TempFileStr += str_TdStart + "操作" + str_TdEnd;
		str_TempFileStr += str_TrEnd;
		//---------------获取目录信息
        //tempCurrentServerPath:当前目录
        tempCurrentServerPath = tempCurrentServerPath.Replace(RootServerPath.Replace("\\", "\\\\"), "");

		foreach (DirectoryInfo dirInfo in ChildDirectory)       //获取此级目录下的一级目录
		{
			str_TempFileStr += str_TrStart;
			string TempPath = dirInfo.FullName.Replace("\\", "\\\\");

            TempPath = TempPath.Replace(RootServerPath.Replace("\\", "\\\\"), "");

            str_TempFileStr += "<td class=\"list_link\" align=\"left\"><img src=\"../../sysImages/FileIcon/folder.gif\" alt=\"点击进入下级目录\"><a href=\"javascript:ListGo('" + TempPath + "','" + tempCurrentServerPath + "');\" class=\"list_link\" title=\"点击进入下级目录\">" + dirInfo.Name.ToString() + "</a></td>";
			str_TempFileStr += str_TdStart + "文件夹</td>";
			str_TempFileStr += str_TdStart + "-" + str_TdEnd;
			str_TempFileStr += str_TdStart + "<span style=\"font-size:10px\">" + dirInfo.LastWriteTime.ToString() + "</span>" + str_TdEnd;
            str_TempFileStr += str_TdStart + "<a href=\"javascript:EditFolder('" + tempCurrentServerPath + "','" + dirInfo.Name + "');\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/editname.gif\" border=\"0\" alt=\"改名\" /></a><a href=\"javascript:DelDir('" + TempPath + "');\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/del.gif\" border=\"0\" alt=\"删除\" />" + str_TdEnd;
			str_TempFileStr += str_TrEnd;
		}

		//--------------获取文件信息
		foreach (FileInfo DirFile in NewFileInfo)                    //获取此级目录下的所有文件
		{
			if (SelectFile(DirFile.Extension))                       //传入文件后缀名,判断是否是被显示的文件类型,默认显示html,htm,css
			{
				str_TempFileStr += str_TrStart;
				str_TempFileStr += "<td class=\"list_link\" align=\"left\"><img src=\"../../sysImages/FileIcon/" + GetFileIco(DirFile.Extension.ToString()) + "\">" + DirFile.Name.ToString() + str_TdEnd;
				str_TempFileStr += str_TdStart + DirFile.Extension.ToString() + "文件" + str_TdEnd;
				str_TempFileStr += str_TdStart + DirFile.Length.ToString() + str_TdEnd;
				str_TempFileStr += str_TdStart + "<span style=\"font-size:10px\">" + DirFile.LastWriteTime.ToString() + "</span>" + str_TdEnd;
                if (DirFile.Extension.ToString().ToLower() == ".jpg" || DirFile.Extension.ToString().ToLower() == ".gif")
                {
                    //str_TempFileStr += str_TdStart + "<a href=\"javascript:MoveFile('" + TempParentPath + "','" + DirFile.Name + "')\" class=\"list_link\" title=\"移动此文件\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/remove1.gif\" border=\"0\" alt=\"转移此项\" /></a><a href='http://" + Request.ServerVariables["Server_Name"] + _paths + "\\" + PathPre() + "\\" + DirFile.Name + "' class=\"list_link\" title=\"点击预览此文件\" target=\"_blank\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/review.gif\" border=\"0\" alt=\"预览该文件\" /></a><a href=\"javascript:EditFile('" + TempParentPath + "','" + DirFile.Name + "')\" class=\"list_link\" title=\"点击为此文件更名\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/editname.gif\" border=\"0\" alt=\"为此项改名\" /></a><a href=\"javascript:DelFile('" + TempParentPath + "','" + DirFile.Name + "')\" class=\"list_link\" title=\"点击删除此文件\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/del.gif\" border=\"0\" alt=\"删除此项\" /></a>" + Str_help1 + Str_TdEnd;
                    str_TempFileStr += str_TdStart + "<a href='http://" + DomainAndPort + CurrentPath + "\\" + DirFile.Name + "' class=\"list_link\" target=\"_blank\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/review.gif\" border=\"0\" alt=\"预览\" /></a><a href=\"javascript:EditFile('" + tempCurrentServerPath + "','" + DirFile.Name + "')\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/editname.gif\" border=\"0\" alt=\"改名\" /></a><a href=\"javascript:DelFile('" + tempCurrentServerPath + "','" + DirFile.Name + "')\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/del.gif\" border=\"0\" alt=\"删除\" /></a>" + str_TdEnd;
                }
                else
                {
                    //str_TempFileStr += str_TdStart + "<a href=\"editor.aspx?dir=" + Server.UrlEncode(TempParentPath) + "&ch=" + Request.QueryString["ch"] + "&filename=" + Server.UrlEncode(DirFile.Name) + "\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/editonline.gif\" border=\"0\" alt=\"可视编辑\" /></a><a href=\"Txteditor.aspx?dir=" + Server.UrlEncode(TempParentPath) + "&ch=" + Request.QueryString["ch"] + "&filename=" + Server.UrlEncode(DirFile.Name) + "\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/edittxt.gif\" border=\"0\" alt=\"文本编辑\" /></a><a href='http://" + DomainAndPort + str_dirMana + "\\" + PathPre() + "\\" + DirFile.Name + "' class=\"list_link\" target=\"_blank\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/review.gif\" border=\"0\" alt=\"预览\" /></a><a href=\"javascript:EditFile('" + TempParentPath + "','" + DirFile.Name + "')\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/editname.gif\" border=\"0\" alt=\"改名\" /></a><a href=\"javascript:DelFile('" + TempParentPath + "','" + DirFile.Name + "')\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/del.gif\" border=\"0\" alt=\"删除\" /></a>" + str_TdEnd;
                    str_TempFileStr += str_TdStart + "<a href=\"editor.aspx?dir=" + Server.UrlEncode(tempCurrentServerPath) + "&ch=" + Request.QueryString["ch"] + "&filename=" + Server.UrlEncode(DirFile.Name) + "\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/editonline.gif\" border=\"0\" alt=\"可视编辑\" /></a><a href=\"Txteditor.aspx?dir=" + Server.UrlEncode(tempCurrentServerPath) + "&ch=" + Request.QueryString["ch"] + "&filename=" + Server.UrlEncode(DirFile.Name) + "\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/edittxt.gif\" border=\"0\" alt=\"文本编辑\" /></a><a href='http://" + DomainAndPort + CurrentPath + "\\" + DirFile.Name + "' class=\"list_link\" target=\"_blank\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/review.gif\" border=\"0\" alt=\"预览\" /></a><a href=\"javascript:EditFile('" + tempCurrentServerPath + "','" + DirFile.Name + "')\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/editname.gif\" border=\"0\" alt=\"改名\" /></a><a href=\"javascript:DelFile('" + tempCurrentServerPath + "','" + DirFile.Name + "')\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/del.gif\" border=\"0\" alt=\"删除\" /></a>" + str_TdEnd;

                }
                
                str_TempFileStr += str_TrEnd;
			}
		}

		str_TempFileStr += "</table>";
		return str_TempFileStr;
	}

	/// <summary>
	/// 获取上级目录
	/// </summary>
	/// <returns>获取上级目录</returns>
	/// Code By DengXi
	string PathPre()
	{
		Hg.CMS.Templet.Templet tpClass = new Hg.CMS.Templet.Templet();
        string str_path = tpClass.PathPre(RootServerPath + Request.QueryString["Path"], str_Templet);
		return str_path;
	}

	/// <summary>
	/// 判断文件后缀名,选取要列举出来的文件
	/// </summary>
	/// <param name="Extension">文件后缀名</param>
	/// <returns>如果是所列举的类型,则返回true,否则为false</returns>
	/// Code By DengXi
	protected bool SelectFile(string Extension)
	{
		bool value = false;
		switch (Extension.ToLower())
		{
			case ".htm":
				value = true;
				break;
			case ".html":
				value = true;
				break;
			case ".shtml":
				value = true;
				break;
			case ".shtm":
				value = true;
				break;
			case ".text":
				value = true;
				break;
			case ".xsl":
				value = true;
				break;
			case ".xml":
				value = true;
				break;
			case ".css":
				value = true;
				break;
			case ".aspx":
				value = true;
				break;
            case ".jpg":
            case ".gif":
                value = true;
                break;
			default:
				value = false;
				break;
		}
		return value;
	}

	/// <summary>
	/// 获取文件图标
	/// </summary>
	/// <param name="type">文件后缀名</param>
	/// <returns>返回与文件后缀名相匹配的ICO图标</returns>
	/// Code By DengXi
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


	/// <summary>
	/// 修改文件夹名称
	/// </summary>
	/// <param name="path">文件夹路径</param>
	/// <returns>修改文件夹名称</returns>
	/// Code By DengXi
	protected void EidtDirName(string path)
	{
		string str_OldName = Request.QueryString["OldFileName"];
		string str_NewName = Request.QueryString["NewFileName"];
		if (str_OldName == "" || str_OldName == null || str_OldName == string.Empty || str_NewName == "" || str_NewName == null || str_NewName == string.Empty)
			PageError("参数传递错误!", s_url);

		Hg.CMS.Templet.Templet tpClass = new Hg.CMS.Templet.Templet();
		int result = tpClass.EidtName(path, str_OldName, str_NewName, 0);
		if (result == 1)
			PageRight("更改文件夹名成功！", s_url);
		else
			PageError("参数传递错误！", s_url);
	}

	/// <summary>
	/// 修改文件名称
	/// </summary>
	/// <param name="path">文件路径</param>
	/// <returns>修改文件名称</returns>
	/// Code By DengXi
	protected void EidtFileName(string path)
	{
		string str_OldName = Request.QueryString["OldFileName"];
		string str_NewName = Request.QueryString["NewFileName"];

		if (str_OldName == "" || str_OldName == null || str_OldName == string.Empty || str_NewName == "" || str_NewName == null || str_NewName == string.Empty)
			PageError("参数传递错误!", s_url);

		Hg.CMS.Templet.Templet tpClass = new Hg.CMS.Templet.Templet();
		int result = tpClass.EidtName(path, str_OldName, str_NewName, 1);
		if (result == 1)
			PageRight("更改文件名成功！", s_url);
		else
			PageError("参数传递错误！", s_url);
	}

	/// <summary>
	/// 删除文件夹
	/// </summary>
	/// <param name="path">文件夹路径</param>
	/// <returns>删除文件夹</returns>
	/// Code By DengXi
	protected void DelDir(string path)
	{
		int result = 0;
		Hg.CMS.Templet.Templet tpClass = new Hg.CMS.Templet.Templet();
		result = tpClass.Del(path, "", 0);
		if (result == 1)
			PageRight("删除文件夹成功!", s_url);
		else
			PageError("参数错误!", s_url);
	}

	/// <summary>
	/// 删除文件
	/// </summary>
	/// <param name="path">文件路径</param>
	/// <returns>删除文件</returns>
	/// Code By DengXi
	protected void DelFile(string path)
	{
		string str_FileName = Request.QueryString["filename"];

		int result = 0;
		Hg.CMS.Templet.Templet tpClass = new Hg.CMS.Templet.Templet();
		result = tpClass.Del(path, str_FileName, 1);
		if (result == 1)
			PageRight("删除文件成功!", s_url);
		else
			PageError("参数错误!", s_url);
	}

	/// <summary>
	/// 添加文件夹
	/// </summary>
	/// <param name="path">文件夹路径</param>
	/// <returns>添加文件夹</returns>
	/// Code By DengXi
	protected void AddDir(string path)
	{
		string str_DirName = Request.QueryString["filename"];

		int result = 0;
		Hg.CMS.Templet.Templet tpClass = new Hg.CMS.Templet.Templet();
		result = tpClass.AddDir(path, str_DirName);
		if (result == 1)
			PageRight("添加文件夹成功!", s_url);
		else
			PageError("未知错误!", s_url);
	}

	/// <summary>
	/// 显示导入文件,创建目录
	/// </summary>
	/// <param name="path">文件路径</param>
	/// <returns>返回操作区域</returns>
	/// Code By DengXi
	protected void ShowAddfiledir(string path)
	{
		string str_Addfiledir = "<table width=\"100%\" border=\"0\" cellpadding=\"3\" cellspacing=\"1\" class=\"Navitable\" align=\"center\">";
		str_Addfiledir += "<tr>";
		str_Addfiledir += "<td style=\"padding-left:10px;\"><a href=\"javascript:AddDir('" + path + "');\" class=\"topnavichar\">创建目录</a>&nbsp;&nbsp;<a href=\"javascript:void(0);\" onclick=\"UpFile('" + path + "','templets');\" class=\"topnavichar\">导入文件</a>&nbsp;&nbsp;<span class=\"helpstyle\" style=\"cursor:help;\" title=\"点击显示帮助\" onclick=\"Help('H_Templet_Note',this)\">关于模板使用说明</span>";
		str_Addfiledir += "</td>";
		str_Addfiledir += "</tr>";
		str_Addfiledir += "</table>";
		addfiledir.InnerHtml = str_Addfiledir;
	}
}
