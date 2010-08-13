///************************************************************************************************************
///**********ģ�����Code By lsd****************************************************************************
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
	private string str_Templet = Hg.Config.UIConfig.dirTemplet;  //��ȡģ��·��
	//private string str_FilePath = "";
	private string s_url = "";
    private string RootServerPath = string.Empty;//������·��
    private string RootPath = string.Empty;//��Ը�·��
    private string CurrentPath = string.Empty;//��ǰ·��
	protected void Page_Load(object sender, EventArgs e)
	{
		Response.CacheControl = "no-cache";
		if (!IsPostBack)                                                        //�ж�ҳ���Ƿ�����
		{
			copyright.InnerHtml = CopyRight;                            //��ȡ��Ȩ��Ϣ
		}
		if (str_dirMana.Trim() != string.Empty)//�ж�����·���Ƿ�Ϊ��,������������//
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
        string ParentPath = RootServerPath + Request.QueryString["ParentPath"]; //����
        string currentServerPath = RootServerPath + Request.QueryString["Path"];
        string ParentServerPath = RootServerPath + Request.QueryString["ParentPath"]; //����
        CurrentPath = RootPath + Request.QueryString["Path"];


		try
		{
            if (currentServerPath.IndexOf(RootServerPath, 0) == -1 || ParentServerPath.IndexOf(RootServerPath, 0) == -1)
				Response.End();
		}
		catch { }

		switch (type)
		{
			case "EidtDirName":     //�޸��ļ�������
				this.Authority_Code = "T003";
				this.CheckAdminAuthority();
                EidtDirName(currentServerPath);
				break;
			case "EidtFileName":    //�޸��ļ�����
				this.Authority_Code = "T007";
				this.CheckAdminAuthority();
                EidtFileName(currentServerPath);
				break;
			case "DelDir":          //ɾ���ļ���
				this.Authority_Code = "T004";
				this.CheckAdminAuthority();
                DelDir(currentServerPath);
				break;
			case "DelFile":          //ɾ���ļ�
				this.Authority_Code = "T004";
				this.CheckAdminAuthority();
                DelFile(currentServerPath);
				break;
			case "AddDir":
				this.Authority_Code = "T003";
				this.CheckAdminAuthority();
                AddDir(currentServerPath);        //�����ļ���
				break;
			default:
				break;
		}
        ShowFile(RootServerPath, currentServerPath, ParentServerPath );
		s_url = "Manage_List.aspx?Path=" + Request.QueryString["Path"] + "&ch=" + Request.QueryString["ch"] + "&ParentPath=" + Request.QueryString["ParentPath"];
	}

	/// <summary>
	/// ��ʾ�ļ��б�
	/// </summary>
	/// <param name="defaultpath">Ĭ��·��</param>
	/// <param name="path">��ǰ·��</param>
	/// <param name="parentPath">��Ŀ¼·��</param>
	/// <returns>��ʾ�ļ��б�</returns>
	/// Code By DengXi
	protected void ShowFile(string defaultpath, string currentPath, string parentPath)
	{

        if (currentPath != "" && currentPath != null && currentPath != string.Empty)
		{
            defaultpath = currentPath;
		}
		if (Directory.Exists(defaultpath) == false)            //�ж�ģ��Ŀ¼�Ƿ����
		{
			PageError("Ŀ¼������", "");
		}
		File_List.InnerHtml = GetDirFile(defaultpath, parentPath);
	}

	/// <summary>
	/// ��ʾ�ļ��б�
	/// </summary>
	/// <param name="dir">��ǰ·��</param>
	/// <param name="ParPath">��Ŀ¼·��</param>
	/// <returns>��ʾ�ļ��б�</returns>
	/// Code By DengXi
    protected string GetDirFile(string currentServerPath, string ParentServerPath)//currentServerPath, ParentServerPath
	{
		//bug�޸�,Ԥ�����˿ڲ���������ʾ�� arjun 2008.2.17
		string DomainAndPort = Request.ServerVariables["Server_Name"];
		if (Convert.ToString(Request.ServerVariables["Server_Port"]) != "80")
		{
			DomainAndPort += ":" + Request.ServerVariables["Server_Port"];
		}

		DirectoryInfo[] ChildDirectory;                         //��Ŀ¼��
		FileInfo[] NewFileInfo;                                 //��ǰ�����ļ�

        DirectoryInfo FatherDirectory = new DirectoryInfo(currentServerPath); //��ǰĿ¼

		ChildDirectory = FatherDirectory.GetDirectories("*.*"); //�õ���Ŀ¼��

		NewFileInfo = FatherDirectory.GetFiles();               //�õ��ļ��������Խ��в���
		//-----------��ȡĿ¼�Լ��ļ��б�
		string str_TempFileStr;
		string str_TrStart = "<tr class=\"TR_BG_list\" onmouseover=\"javascript:overColor(this);\" onmouseout=\"javascript:outColor(this);\">";
		string str_TrEnd = "</tr>";
		string str_TdStart = "<td class=\"list_link\" align=\"left\">";
		string str_TdEnd = "</td>";
		//string Str_TempParentstr;
        string str_tempCurrentServerPath;
        //string TempParentPath = currentServerPath.Replace("\\", "\\\\");      //·��ת��
        string tempCurrentServerPath = currentServerPath.Replace("\\", "\\\\");      //·��ת��
        


		//------------ȡ�õ�ǰ����Ŀ¼
        if (ParentServerPath == "" || ParentServerPath == null || ParentServerPath == string.Empty || ParentServerPath == "undefined")
		{
            str_tempCurrentServerPath = "��ǰĿ¼:" + currentServerPath;
		}
		else
		{

            if (currentServerPath == Server.MapPath(RootPath))      //�ж��Ƿ���ģ��Ŀ¼,���������ʾ�����ϼ�Ŀ¼
			{
                str_tempCurrentServerPath = "��ǰĿ¼:" + RootPath.Replace("\\", "/");
			}
			else
			{
				string str_thispath = "";
				if (str_dirMana != null && str_dirMana != "")
					str_thispath = Server.MapPath(str_dirMana);
				else
					str_thispath = Server.MapPath("/");

                ParentServerPath = ParentServerPath.Replace("\\", "\\\\");
                //��ȡ��ǰĿ¼���ϼ�Ŀ¼
                string Str_strpath = tempCurrentServerPath.Remove(tempCurrentServerPath.LastIndexOf("\\") - 1).Replace(RootServerPath.Replace("\\", "\\\\"), "");//��ȡ��ǰĿ¼���ϼ�Ŀ¼
                str_tempCurrentServerPath = "<a href=\"javascript:ListGo('" + Str_strpath.Replace(RootServerPath.Replace("\\", "\\\\"), "") + "','" + tempCurrentServerPath.Replace(RootServerPath.Replace("\\", "\\\\"), "") + "');\" class=\"list_link\" title=\"����ص��ϼ�Ŀ¼\">�����ϼ�Ŀ¼</a>   |   ��ǰĿ¼:/" + currentServerPath.Replace(str_thispath, "").Replace("\\", "/");
			}
		}
        ShowAddfiledir(tempCurrentServerPath.Replace(RootServerPath.Replace("\\", "\\\\"), "")); //������ʾ����Ŀ¼,�����ļ�����

		str_TempFileStr = "<table border=\"0\" class=\"table\" width=\"100%\" cellpadding=\"5\" cellspacing=\"1\">";
        str_TempFileStr += str_TrStart + "<td class=\"list_link\" align=\"left\"colspan=\"5\">" + str_tempCurrentServerPath + str_TrEnd;
		str_TempFileStr += "</table>";
		str_TempFileStr += "<table border=\"0\" class=\"table\" width=\"100%\" cellpadding=\"5\" cellspacing=\"1\">";
		str_TempFileStr += "<tr class=\"TR_BG\">";

		str_TempFileStr += str_TdStart + "����" + str_TdEnd;
		str_TempFileStr += str_TdStart + "����" + str_TdEnd;
		str_TempFileStr += str_TdStart + "��С(byte)" + str_TdEnd;
		str_TempFileStr += str_TdStart + "����޸�ʱ��" + str_TdEnd;
		str_TempFileStr += str_TdStart + "����" + str_TdEnd;
		str_TempFileStr += str_TrEnd;
		//---------------��ȡĿ¼��Ϣ
        //tempCurrentServerPath:��ǰĿ¼
        tempCurrentServerPath = tempCurrentServerPath.Replace(RootServerPath.Replace("\\", "\\\\"), "");

		foreach (DirectoryInfo dirInfo in ChildDirectory)       //��ȡ�˼�Ŀ¼�µ�һ��Ŀ¼
		{
			str_TempFileStr += str_TrStart;
			string TempPath = dirInfo.FullName.Replace("\\", "\\\\");

            TempPath = TempPath.Replace(RootServerPath.Replace("\\", "\\\\"), "");

            str_TempFileStr += "<td class=\"list_link\" align=\"left\"><img src=\"../../sysImages/FileIcon/folder.gif\" alt=\"��������¼�Ŀ¼\"><a href=\"javascript:ListGo('" + TempPath + "','" + tempCurrentServerPath + "');\" class=\"list_link\" title=\"��������¼�Ŀ¼\">" + dirInfo.Name.ToString() + "</a></td>";
			str_TempFileStr += str_TdStart + "�ļ���</td>";
			str_TempFileStr += str_TdStart + "-" + str_TdEnd;
			str_TempFileStr += str_TdStart + "<span style=\"font-size:10px\">" + dirInfo.LastWriteTime.ToString() + "</span>" + str_TdEnd;
            str_TempFileStr += str_TdStart + "<a href=\"javascript:EditFolder('" + tempCurrentServerPath + "','" + dirInfo.Name + "');\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/editname.gif\" border=\"0\" alt=\"����\" /></a><a href=\"javascript:DelDir('" + TempPath + "');\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/del.gif\" border=\"0\" alt=\"ɾ��\" />" + str_TdEnd;
			str_TempFileStr += str_TrEnd;
		}

		//--------------��ȡ�ļ���Ϣ
		foreach (FileInfo DirFile in NewFileInfo)                    //��ȡ�˼�Ŀ¼�µ������ļ�
		{
			if (SelectFile(DirFile.Extension))                       //�����ļ���׺��,�ж��Ƿ��Ǳ���ʾ���ļ�����,Ĭ����ʾhtml,htm,css
			{
				str_TempFileStr += str_TrStart;
				str_TempFileStr += "<td class=\"list_link\" align=\"left\"><img src=\"../../sysImages/FileIcon/" + GetFileIco(DirFile.Extension.ToString()) + "\">" + DirFile.Name.ToString() + str_TdEnd;
				str_TempFileStr += str_TdStart + DirFile.Extension.ToString() + "�ļ�" + str_TdEnd;
				str_TempFileStr += str_TdStart + DirFile.Length.ToString() + str_TdEnd;
				str_TempFileStr += str_TdStart + "<span style=\"font-size:10px\">" + DirFile.LastWriteTime.ToString() + "</span>" + str_TdEnd;
                if (DirFile.Extension.ToString().ToLower() == ".jpg" || DirFile.Extension.ToString().ToLower() == ".gif")
                {
                    //str_TempFileStr += str_TdStart + "<a href=\"javascript:MoveFile('" + TempParentPath + "','" + DirFile.Name + "')\" class=\"list_link\" title=\"�ƶ����ļ�\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/remove1.gif\" border=\"0\" alt=\"ת�ƴ���\" /></a><a href='http://" + Request.ServerVariables["Server_Name"] + _paths + "\\" + PathPre() + "\\" + DirFile.Name + "' class=\"list_link\" title=\"���Ԥ�����ļ�\" target=\"_blank\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/review.gif\" border=\"0\" alt=\"Ԥ�����ļ�\" /></a><a href=\"javascript:EditFile('" + TempParentPath + "','" + DirFile.Name + "')\" class=\"list_link\" title=\"���Ϊ���ļ�����\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/editname.gif\" border=\"0\" alt=\"Ϊ�������\" /></a><a href=\"javascript:DelFile('" + TempParentPath + "','" + DirFile.Name + "')\" class=\"list_link\" title=\"���ɾ�����ļ�\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/del.gif\" border=\"0\" alt=\"ɾ������\" /></a>" + Str_help1 + Str_TdEnd;
                    str_TempFileStr += str_TdStart + "<a href='http://" + DomainAndPort + CurrentPath + "\\" + DirFile.Name + "' class=\"list_link\" target=\"_blank\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/review.gif\" border=\"0\" alt=\"Ԥ��\" /></a><a href=\"javascript:EditFile('" + tempCurrentServerPath + "','" + DirFile.Name + "')\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/editname.gif\" border=\"0\" alt=\"����\" /></a><a href=\"javascript:DelFile('" + tempCurrentServerPath + "','" + DirFile.Name + "')\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/del.gif\" border=\"0\" alt=\"ɾ��\" /></a>" + str_TdEnd;
                }
                else
                {
                    //str_TempFileStr += str_TdStart + "<a href=\"editor.aspx?dir=" + Server.UrlEncode(TempParentPath) + "&ch=" + Request.QueryString["ch"] + "&filename=" + Server.UrlEncode(DirFile.Name) + "\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/editonline.gif\" border=\"0\" alt=\"���ӱ༭\" /></a><a href=\"Txteditor.aspx?dir=" + Server.UrlEncode(TempParentPath) + "&ch=" + Request.QueryString["ch"] + "&filename=" + Server.UrlEncode(DirFile.Name) + "\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/edittxt.gif\" border=\"0\" alt=\"�ı��༭\" /></a><a href='http://" + DomainAndPort + str_dirMana + "\\" + PathPre() + "\\" + DirFile.Name + "' class=\"list_link\" target=\"_blank\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/review.gif\" border=\"0\" alt=\"Ԥ��\" /></a><a href=\"javascript:EditFile('" + TempParentPath + "','" + DirFile.Name + "')\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/editname.gif\" border=\"0\" alt=\"����\" /></a><a href=\"javascript:DelFile('" + TempParentPath + "','" + DirFile.Name + "')\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/del.gif\" border=\"0\" alt=\"ɾ��\" /></a>" + str_TdEnd;
                    str_TempFileStr += str_TdStart + "<a href=\"editor.aspx?dir=" + Server.UrlEncode(tempCurrentServerPath) + "&ch=" + Request.QueryString["ch"] + "&filename=" + Server.UrlEncode(DirFile.Name) + "\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/editonline.gif\" border=\"0\" alt=\"���ӱ༭\" /></a><a href=\"Txteditor.aspx?dir=" + Server.UrlEncode(tempCurrentServerPath) + "&ch=" + Request.QueryString["ch"] + "&filename=" + Server.UrlEncode(DirFile.Name) + "\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/edittxt.gif\" border=\"0\" alt=\"�ı��༭\" /></a><a href='http://" + DomainAndPort + CurrentPath + "\\" + DirFile.Name + "' class=\"list_link\" target=\"_blank\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/review.gif\" border=\"0\" alt=\"Ԥ��\" /></a><a href=\"javascript:EditFile('" + tempCurrentServerPath + "','" + DirFile.Name + "')\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/editname.gif\" border=\"0\" alt=\"����\" /></a><a href=\"javascript:DelFile('" + tempCurrentServerPath + "','" + DirFile.Name + "')\" class=\"list_link\"><img src=\"../../sysImages/" + Hg.Config.UIConfig.CssPath() + "/sysico/del.gif\" border=\"0\" alt=\"ɾ��\" /></a>" + str_TdEnd;

                }
                
                str_TempFileStr += str_TrEnd;
			}
		}

		str_TempFileStr += "</table>";
		return str_TempFileStr;
	}

	/// <summary>
	/// ��ȡ�ϼ�Ŀ¼
	/// </summary>
	/// <returns>��ȡ�ϼ�Ŀ¼</returns>
	/// Code By DengXi
	string PathPre()
	{
		Hg.CMS.Templet.Templet tpClass = new Hg.CMS.Templet.Templet();
        string str_path = tpClass.PathPre(RootServerPath + Request.QueryString["Path"], str_Templet);
		return str_path;
	}

	/// <summary>
	/// �ж��ļ���׺��,ѡȡҪ�оٳ������ļ�
	/// </summary>
	/// <param name="Extension">�ļ���׺��</param>
	/// <returns>��������оٵ�����,�򷵻�true,����Ϊfalse</returns>
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
            case ".js":
                value = true;
                break;
			default:
				value = false;
				break;
		}
		return value;
	}

	/// <summary>
	/// ��ȡ�ļ�ͼ��
	/// </summary>
	/// <param name="type">�ļ���׺��</param>
	/// <returns>�������ļ���׺����ƥ���ICOͼ��</returns>
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
	/// �޸��ļ�������
	/// </summary>
	/// <param name="path">�ļ���·��</param>
	/// <returns>�޸��ļ�������</returns>
	/// Code By DengXi
	protected void EidtDirName(string path)
	{
		string str_OldName = Request.QueryString["OldFileName"];
		string str_NewName = Request.QueryString["NewFileName"];
		if (str_OldName == "" || str_OldName == null || str_OldName == string.Empty || str_NewName == "" || str_NewName == null || str_NewName == string.Empty)
			PageError("�������ݴ���!", s_url);

		Hg.CMS.Templet.Templet tpClass = new Hg.CMS.Templet.Templet();
		int result = tpClass.EidtName(path, str_OldName, str_NewName, 0);
		if (result == 1)
			PageRight("�����ļ������ɹ���", s_url);
		else
			PageError("�������ݴ���", s_url);
	}

	/// <summary>
	/// �޸��ļ�����
	/// </summary>
	/// <param name="path">�ļ�·��</param>
	/// <returns>�޸��ļ�����</returns>
	/// Code By DengXi
	protected void EidtFileName(string path)
	{
		string str_OldName = Request.QueryString["OldFileName"];
		string str_NewName = Request.QueryString["NewFileName"];

		if (str_OldName == "" || str_OldName == null || str_OldName == string.Empty || str_NewName == "" || str_NewName == null || str_NewName == string.Empty)
			PageError("�������ݴ���!", s_url);

		Hg.CMS.Templet.Templet tpClass = new Hg.CMS.Templet.Templet();
		int result = tpClass.EidtName(path, str_OldName, str_NewName, 1);
		if (result == 1)
			PageRight("�����ļ����ɹ���", s_url);
		else
			PageError("�������ݴ���", s_url);
	}

	/// <summary>
	/// ɾ���ļ���
	/// </summary>
	/// <param name="path">�ļ���·��</param>
	/// <returns>ɾ���ļ���</returns>
	/// Code By DengXi
	protected void DelDir(string path)
	{
		int result = 0;
		Hg.CMS.Templet.Templet tpClass = new Hg.CMS.Templet.Templet();
		result = tpClass.Del(path, "", 0);
		if (result == 1)
			PageRight("ɾ���ļ��гɹ�!", s_url);
		else
			PageError("��������!", s_url);
	}

	/// <summary>
	/// ɾ���ļ�
	/// </summary>
	/// <param name="path">�ļ�·��</param>
	/// <returns>ɾ���ļ�</returns>
	/// Code By DengXi
	protected void DelFile(string path)
	{
		string str_FileName = Request.QueryString["filename"];

		int result = 0;
		Hg.CMS.Templet.Templet tpClass = new Hg.CMS.Templet.Templet();
		result = tpClass.Del(path, str_FileName, 1);
		if (result == 1)
			PageRight("ɾ���ļ��ɹ�!", s_url);
		else
			PageError("��������!", s_url);
	}

	/// <summary>
	/// �����ļ���
	/// </summary>
	/// <param name="path">�ļ���·��</param>
	/// <returns>�����ļ���</returns>
	/// Code By DengXi
	protected void AddDir(string path)
	{
		string str_DirName = Request.QueryString["filename"];

		int result = 0;
		Hg.CMS.Templet.Templet tpClass = new Hg.CMS.Templet.Templet();
		result = tpClass.AddDir(path, str_DirName);
		if (result == 1)
			PageRight("�����ļ��гɹ�!", s_url);
		else
			PageError("δ֪����!", s_url);
	}

	/// <summary>
	/// ��ʾ�����ļ�,����Ŀ¼
	/// </summary>
	/// <param name="path">�ļ�·��</param>
	/// <returns>���ز�������</returns>
	/// Code By DengXi
	protected void ShowAddfiledir(string path)
	{
		string str_Addfiledir = "<table width=\"100%\" border=\"0\" cellpadding=\"3\" cellspacing=\"1\" class=\"Navitable\" align=\"center\">";
		str_Addfiledir += "<tr>";
		str_Addfiledir += "<td style=\"padding-left:10px;\"><a href=\"javascript:AddDir('" + path + "');\" class=\"topnavichar\">����Ŀ¼</a>&nbsp;&nbsp;<a href=\"javascript:void(0);\" onclick=\"UpFile('" + path + "','templets');\" class=\"topnavichar\">�����ļ�</a>&nbsp;&nbsp;<span class=\"helpstyle\" style=\"cursor:help;\" title=\"�����ʾ����\" onclick=\"Help('H_Templet_Note',this)\">����ģ��ʹ��˵��</span>";
		str_Addfiledir += "</td>";
		str_Addfiledir += "</tr>";
		str_Addfiledir += "</table>";
		addfiledir.InnerHtml = str_Addfiledir;
	}
}