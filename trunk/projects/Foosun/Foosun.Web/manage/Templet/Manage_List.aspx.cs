///************************************************************************************************************
///**********ģ�����Code By DengXi****************************************************************************
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

public partial class manage_Templet_Manage_List : Foosun.Web.UI.ManagePage
{
    public manage_Templet_Manage_List()
    {
        Authority_Code = "T001";
    }
    private string str_dirMana = Foosun.Config.UIConfig.dirDumm;
    private string str_Templet = Foosun.Config.UIConfig.dirTemplet;  //��ȡģ��·��
    private string str_FilePath = "";
    private string s_url = "";
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
        //if (SiteID == "0")
        //{
            str_FilePath = Server.MapPath(str_dirMana + "\\" + str_Templet);
        //}
        //else
        //{
        //    string _sitePath = str_dirMana + "\\" + Foosun.Config.UIConfig.dirSite + "\\" + Foosun.Global.Current.SiteID + "\\" + str_Templet;
        //    if (!Directory.Exists(Server.MapPath(_sitePath))) { Directory.CreateDirectory(Server.MapPath(_sitePath)); }
        //    str_FilePath = Server.MapPath(_sitePath);
        //}
        
        string Path = str_FilePath + Request.QueryString["Path"];
        string ParentPath = str_FilePath + Request.QueryString["ParentPath"]; //����
        try
        {
            if (Path.IndexOf(str_FilePath, 0) == -1 || ParentPath.IndexOf(str_FilePath, 0) == -1)
                Response.End();
        }
        catch { }

        switch (type)
        {
            case "EidtDirName":     //�޸��ļ�������
                this.Authority_Code = "T003";
                this.CheckAdminAuthority();
                EidtDirName(Path);
                break;
            case "EidtFileName":    //�޸��ļ�����
                this.Authority_Code = "T007";
                this.CheckAdminAuthority();
                EidtFileName(Path);
                break;
            case "DelDir":          //ɾ���ļ���
                this.Authority_Code = "T004";
                this.CheckAdminAuthority();
                DelDir(Path);
                break;
            case "DelFile":          //ɾ���ļ�
                this.Authority_Code = "T004";
                this.CheckAdminAuthority();
                DelFile(Path);
                break;
            case "AddDir":
                this.Authority_Code = "T003";
                this.CheckAdminAuthority();
                AddDir(Path);        //����ļ���
                break;
            default:
                break;
        }
        ShowFile(str_FilePath, Path, ParentPath);
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

    protected void ShowFile(string defaultpath, string path, string parentPath)
    {

        if (path != "" && path != null && path != string.Empty)
        {
            defaultpath = path;
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

    protected string GetDirFile(string dir, string ParPath)
    {
        //bug�޸�,Ԥ�����˿ڲ���������ʾ�� arjun 2008.2.17
        string DomainAndPort = Request.ServerVariables["Server_Name"];
        if (Convert.ToString(Request.ServerVariables["Server_Port"]) != "80")
        {
            DomainAndPort += ":" + Request.ServerVariables["Server_Port"];
        }
       
        DirectoryInfo[] ChildDirectory;                         //��Ŀ¼��
        FileInfo[] NewFileInfo;                                 //��ǰ�����ļ�

        DirectoryInfo FatherDirectory = new DirectoryInfo(dir); //��ǰĿ¼

        ChildDirectory = FatherDirectory.GetDirectories("*.*"); //�õ���Ŀ¼��

        NewFileInfo = FatherDirectory.GetFiles();               //�õ��ļ��������Խ��в���
        //-----------��ȡĿ¼�Լ��ļ��б�
        string str_TempFileStr;
        string str_TrStart = "<tr class=\"TR_BG_list\" onmouseover=\"javascript:overColor(this);\" onmouseout=\"javascript:outColor(this);\">";
        string str_TrEnd = "</tr>";
        string str_TdStart = "<td class=\"list_link\" align=\"left\">";
        string str_TdEnd = "</td>";
        string Str_TempParentstr;
        string TempParentPath = dir.Replace("\\", "\\\\");      //·��ת��


        //------------ȡ�õ�ǰ����Ŀ¼
        if (ParPath == "" || ParPath == null || ParPath == string.Empty || ParPath == "undefined")
        {
            Str_TempParentstr = "��ǰĿ¼:" + dir;
        }
        else
        {
            string _str_TempletTF = "";
            if (SiteID == "0")
            {
                _str_TempletTF = str_dirMana + "\\" + str_Templet;
            }
            else
            {
                _str_TempletTF = str_dirMana + "\\" + Foosun.Config.UIConfig.dirSite + "\\" + Foosun.Global.Current.SiteID + "\\" + str_Templet;
            }
            if (dir == Server.MapPath(_str_TempletTF))      //�ж��Ƿ���ģ��Ŀ¼,���������ʾ�����ϼ�Ŀ¼
            {
                Str_TempParentstr = "��ǰĿ¼:" + _str_TempletTF.Replace("\\", "/");
            }
            else
            {
                string str_thispath = "";
                if (str_dirMana != null && str_dirMana != "")
                    str_thispath = Server.MapPath(str_dirMana);
                else
                    str_thispath = Server.MapPath("/");

                ParPath = ParPath.Replace("\\", "\\\\");
                string Str_strpath = TempParentPath.Remove(TempParentPath.LastIndexOf("\\") - 1).Replace(str_FilePath.Replace("\\", "\\\\"), "");//��ȡ��ǰĿ¼���ϼ�Ŀ¼
                Str_TempParentstr = "<a href=\"javascript:ListGo('" + Str_strpath.Replace(str_FilePath.Replace("\\", "\\\\"), "") + "','" + TempParentPath.Replace(str_FilePath.Replace("\\", "\\\\"), "") + "');\" class=\"list_link\" title=\"����ص��ϼ�Ŀ¼\">�����ϼ�Ŀ¼</a>   |   ��ǰĿ¼:/" + dir.Replace(str_thispath, "").Replace("\\", "/");
            }
        }
        ShowAddfiledir(TempParentPath.Replace(str_FilePath.Replace("\\", "\\\\"), "")); //������ʾ����Ŀ¼,�����ļ�����

        str_TempFileStr = "<table border=\"0\" class=\"table\" width=\"100%\" cellpadding=\"5\" cellspacing=\"1\">";
        str_TempFileStr += str_TrStart + "<td class=\"list_link\" align=\"left\"colspan=\"5\">" + Str_TempParentstr + str_TrEnd;
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
        TempParentPath = TempParentPath.Replace(str_FilePath.Replace("\\", "\\\\"), "");

        foreach (DirectoryInfo dirInfo in ChildDirectory)       //��ȡ�˼�Ŀ¼�µ�һ��Ŀ¼
        {
            str_TempFileStr += str_TrStart;
            string TempPath = dirInfo.FullName.Replace("\\", "\\\\");

            TempPath = TempPath.Replace(str_FilePath.Replace("\\", "\\\\"), "");

            str_TempFileStr += "<td class=\"list_link\" align=\"left\"><img src=\"../../sysImages/FileIcon/folder.gif\" alt=\"��������¼�Ŀ¼\"><a href=\"javascript:ListGo('" + TempPath + "','" + TempParentPath + "');\" class=\"list_link\" title=\"��������¼�Ŀ¼\">" + dirInfo.Name.ToString() + "</a></td>";
            str_TempFileStr += str_TdStart + "�ļ���</td>";
            str_TempFileStr += str_TdStart + "-" + str_TdEnd;
            str_TempFileStr += str_TdStart + "<span style=\"font-size:10px\">" + dirInfo.LastWriteTime.ToString() + "</span>" + str_TdEnd;
            str_TempFileStr += str_TdStart + "<a href=\"javascript:EditFolder('" + TempParentPath + "','" + dirInfo.Name + "');\" class=\"list_link\"><img src=\"../../sysImages/" + Foosun.Config.UIConfig.CssPath() + "/sysico/editname.gif\" border=\"0\" alt=\"����\" /></a><a href=\"javascript:DelDir('" + TempPath + "');\" class=\"list_link\"><img src=\"../../sysImages/" + Foosun.Config.UIConfig.CssPath() + "/sysico/del.gif\" border=\"0\" alt=\"ɾ��\" />" + str_TdEnd;
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

                str_TempFileStr += str_TdStart + "<a href=\"editor.aspx?dir=" + TempParentPath + "&ch=" + Request.QueryString["ch"] + "&filename=" + DirFile.Name + "\" class=\"list_link\"><img src=\"../../sysImages/" + Foosun.Config.UIConfig.CssPath() + "/sysico/editonline.gif\" border=\"0\" alt=\"���ӱ༭\" /></a><a href=\"Txteditor.aspx?dir=" + TempParentPath + "&ch=" + Request.QueryString["ch"] + "&filename=" + DirFile.Name + "\" class=\"list_link\"><img src=\"../../sysImages/" + Foosun.Config.UIConfig.CssPath() + "/sysico/edittxt.gif\" border=\"0\" alt=\"�ı��༭\" /></a><a href='http://" + DomainAndPort + str_dirMana + "\\" + PathPre() + "\\" + DirFile.Name + "' class=\"list_link\" target=\"_blank\"><img src=\"../../sysImages/" + Foosun.Config.UIConfig.CssPath() + "/sysico/review.gif\" border=\"0\" alt=\"Ԥ��\" /></a><a href=\"javascript:EditFile('" + TempParentPath + "','" + DirFile.Name + "')\" class=\"list_link\"><img src=\"../../sysImages/" + Foosun.Config.UIConfig.CssPath() + "/sysico/editname.gif\" border=\"0\" alt=\"����\" /></a><a href=\"javascript:DelFile('" + TempParentPath + "','" + DirFile.Name + "')\" class=\"list_link\"><img src=\"../../sysImages/" + Foosun.Config.UIConfig.CssPath() + "/sysico/del.gif\" border=\"0\" alt=\"ɾ��\" /></a>" + str_TdEnd;
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
        Foosun.CMS.Templet.Templet tpClass = new Foosun.CMS.Templet.Templet();
        string str_path = tpClass.PathPre(str_FilePath + Request.QueryString["Path"], str_Templet);
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

        Foosun.CMS.Templet.Templet tpClass = new Foosun.CMS.Templet.Templet();
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

        Foosun.CMS.Templet.Templet tpClass = new Foosun.CMS.Templet.Templet();
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
        Foosun.CMS.Templet.Templet tpClass = new Foosun.CMS.Templet.Templet();
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
        Foosun.CMS.Templet.Templet tpClass = new Foosun.CMS.Templet.Templet();
        result = tpClass.Del(path, str_FileName, 1);
        if (result == 1)
            PageRight("ɾ���ļ��ɹ�!", s_url);
        else
            PageError("��������!", s_url);
    }

    /// <summary>
    /// ����ļ���
    /// </summary>
    /// <param name="path">�ļ���·��</param>
    /// <returns>����ļ���</returns>
    /// Code By DengXi


    protected void AddDir(string path)
    {
        string str_DirName = Request.QueryString["filename"];

        int result = 0;
        Foosun.CMS.Templet.Templet tpClass = new Foosun.CMS.Templet.Templet();
        result = tpClass.AddDir(path, str_DirName);
        if (result == 1)
            PageRight("����ļ��гɹ�!", s_url);
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
