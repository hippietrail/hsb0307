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
using System.Text.RegularExpressions;
using Foosun.CMS;
using Foosun.CMS.Common;
using Foosun.Model;

public partial class General_manage : Foosun.Web.UI.ManagePage
{
    public General_manage()
    {
        Authority_Code = "Q018";
    }
    #region ����ʾ��
    sys rd = new sys();
    rootPublic pd = new rootPublic();
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        #region ��ҳ���ú���
        this.PageNavigator1.OnPageChange += new PageChangeHandler(PageNavigator1_PageChange);
        #endregion

        if (!IsPostBack)
        {

            //LoginInfo.CheckPop("Ȩ�޴���", "0", "1", "9");//Ȩ�޴���
            copyright.InnerHtml = CopyRight;
            Response.CacheControl = "no-cache";//����ҳ���޻���

            #region ȡ�ò����������¼�

            string type = Request.QueryString["type"];
            switch (type)
            {
                case "del":
                    this.Authority_Code = "Q019";
                    this.CheckAdminAuthority();
                    General_M_Del();//����ɾ��
                    break;
                case "suo":
                    this.Authority_Code = "Q019";
                    this.CheckAdminAuthority();
                    General_M_Suo();//��������
                    break;
                case "unsuo":
                    this.Authority_Code = "Q019";
                    this.CheckAdminAuthority();
                    General_M_UnSuo();//��������
                    break;
                case "delall":
                    this.Authority_Code = "Q019";
                    this.CheckAdminAuthority();
                    General_DelAll();//ɾ��ȫ��
                    break;
            }
            GenManageList(1);//��ʼ��ҳ����
            #endregion
        }

    }

    protected void PageNavigator1_PageChange(object sender, int PageIndex)
    {
        GenManageList(PageIndex);
    }

    /// <summary>
    /// ����ɾ���¼�����
    /// </summary>
    ///Code by ChenZhaoHui

    #region ����ɾ���¼�����
    protected void General_M_Del()
    {
        int GID = int.Parse(Request.QueryString["ID"]);
        if (GID <= 0)
        {
            PageError("����Ĳ�������!", "");
        }
        else
        {
            rd.General_M_Del(GID);
            pd.SaveUserAdminLogs(1, 1, UserNum, "����ɾ��", "���������ɾ���ɹ�.ID:" + GID + "");
            PageRight("ɾ���ɹ���", "General_manage.aspx");
        }
    }
    #endregion


    /// <summary>
    /// �����¼�����
    /// </summary>
    ///Code by ChenZhaoHui

    #region �����¼�����
    protected void General_M_Suo()
    {
        int GID = int.Parse(Request.QueryString["ID"]);
        if (GID <= 0)
        {
            PageError("����Ĳ�������!", "");
        }
        else
        {
            rd.General_M_Suo(GID);
            pd.SaveUserAdminLogs(1, 1, UserNum, "��������", "��������������ɹ�.ID:" + GID + "");
            PageRight("�����ɹ���", "General_manage.aspx");
        }
    }
    #endregion

    /// <summary>
    /// �������¼�����
    /// </summary>
    ///Code by ChenZhaoHui

    #region �������¼�����
    protected void General_M_UnSuo()
    {
        int GID = int.Parse(Request.QueryString["ID"]);
        if (GID <= 0)
        {
            PageError("����Ĳ�������!", "");
        }
        else
        {
            rd.General_M_UnSuo(GID);
            pd.SaveUserAdminLogs(1, 1, UserNum, "��������", "��������������ɹ�.ID:" + GID + "");
            PageRight("�����ɹ���", "General_manage.aspx");
        }
    }
    #endregion

    /// <summary>
    /// ɾ��ȫ���¼�����
    /// </summary>
    ///Code by ChenZhaoHui

    #region ɾ��ȫ���¼�����
    protected void General_DelAll()
    {
        rd.General_DelAll();
        pd.SaveUserAdminLogs(1, 1, UserNum, "ɾ��ȫ��", "�������ȫ��ɾ���ɹ�");
        PageRight("ɾ��ȫ���ɹ���", "General_manage.aspx");
    }
    #endregion

    /// <summary>
    /// ����ɾ���¼�
    /// </summary>
    ///Code by ChenZhaoHui

    #region ����ɾ���¼�
    protected void Del_ClickP(object sender, EventArgs e)
    {
        string general_checkbox = Request.Form["general_checkbox"];
        if (general_checkbox == null || general_checkbox == String.Empty)
        {
            PageError("����ѡ����������������!", "");
        }
        else
        {
            String[] CheckboxArray = general_checkbox.Split(',');
            general_checkbox = null;
            for (int i = 0; i < CheckboxArray.Length; i++)
            {
                rd.General_M_Del(int.Parse(CheckboxArray[i].ToString()));
            }
            pd.SaveUserAdminLogs(1, 1, UserNum, "����ɾ��", "�����������ɾ���ɹ�.ID:" + general_checkbox + "");
            PageRight("ɾ�����ݳɹ�,�뷵�ؼ�������!", "General_manage.aspx");
        }
    }
    #endregion

    /// <summary>
    /// ���������¼�
    /// </summary>
    ///Code by ChenZhaoHui

    #region ���������¼�
    protected void Suo_ClickP(object sender, EventArgs e)
    {
        string general_checkbox = Request.Form["general_checkbox"];
        if (general_checkbox == null || general_checkbox == String.Empty)
        {
            PageError("����ѡ����������������!", "");
        }
        else
        {
            String[] CheckboxArray = general_checkbox.Split(',');
            general_checkbox = null;
            for (int i = 0; i < CheckboxArray.Length; i++)
            {
                rd.General_M_Suo(int.Parse(CheckboxArray[i].ToString()));
            }
            pd.SaveUserAdminLogs(1, 1, UserNum, "�������������������", "��������������������ɹ�.ID:" + general_checkbox + "");
            PageRight("�������ݳɹ�,�뷵�ؼ�������!", "General_manage.aspx");
        }
    }
    #endregion

    /// <summary>
    /// ���������¼�
    /// </summary>
    ///Code by ChenZhaoHui

    #region ���������¼�
    protected void Unsuo_ClickP(object sender, EventArgs e)
    {
        string general_checkbox = Request.Form["general_checkbox"];
        if (general_checkbox == null || general_checkbox == String.Empty)
        {
            PageError("����ѡ����������������!", "");
        }
        else
        {
            String[] CheckboxArray = general_checkbox.Split(',');
            general_checkbox = null;
            for (int i = 0; i < CheckboxArray.Length; i++)
            {
                rd.General_M_UnSuo(int.Parse(CheckboxArray[i].ToString()));
            }
            pd.SaveUserAdminLogs(1, 1, UserNum, "�������������������", "�������������ݳɹ�.ID:" + general_checkbox + "");
            PageRight("�������ݳɹ�,�뷵�ؼ�������!", "General_manage.aspx");
        }
    }
    #endregion

    /// <summary>
    /// ��ʾ�������ҳ��
    /// </summary>
    ///Code by ChenZhaoHui

    #region ��ʾ�������ҳ��
    protected void GenManageList(int PageIndex)
    {
        string key = Request.QueryString["key"];
        int i, j;
        DataTable dt = null;
        if (key != null && key != "")
        {
            SQLConditionInfo st = new SQLConditionInfo("@gType", int.Parse(key.ToString()));
            dt = Foosun.CMS.Pagination.GetPage("General_manage_2_aspx", PageIndex, 20, out i, out j, st);
        }
        else
        {
            dt = Foosun.CMS.Pagination.GetPage("General_manage_1_aspx", PageIndex, 20, out i, out j, null);
        }
        #region �Ӳ���������ȡ��ÿҳ��ʾ��¼������
        int num = PAGESIZE;
        #endregion

        this.PageNavigator1.PageCount = j;
        this.PageNavigator1.PageIndex = PageIndex;
        this.PageNavigator1.RecordCount = i;
        if (dt != null)
        {
            if (dt.Rows.Count > 0)
            {

                dt.Columns.Add("Type", typeof(String));//����
                dt.Columns.Add("stat", typeof(String));//״̬
                dt.Columns.Add("oPerate", typeof(String));//����

                for (int k = 0; k < dt.Rows.Count; k++)
                {
                    int id = int.Parse(dt.Rows[k]["id"].ToString());
                    int gType = int.Parse(dt.Rows[k]["gType"].ToString());
                    int isLock = int.Parse(dt.Rows[k]["isLock"].ToString());

                    #region �ж�����ӵ���ʲô����
                    if (gType >= 0 && gType <= 3)
                    {
                        switch (gType)
                        {
                            case 0:
                                dt.Rows[k]["Type"] = "�ؼ���(TAG)";
                                break;
                            case 1:
                                dt.Rows[k]["Type"] = "��Դ";
                                break;
                            case 2:
                                dt.Rows[k]["Type"] = "����";
                                break;
                            case 3:
                                dt.Rows[k]["Type"] = "�ڲ�����";
                                break;
                        }
                    }
                    else
                    {
                        dt.Rows[k]["Type"] = "δ֪����";
                    }
                    #endregion

                    #region �ж�����ӵĳ���ѡ����ʲô״̬
                    switch (isLock)
                    {
                        case 0:
                            dt.Rows[k]["stat"] = "<img src=\"../../sysImages/folder/yes.gif\" border=\"0\">";
                            break;
                        case 1:
                            dt.Rows[k]["stat"] = "<img src=\"../../sysImages/folder/no.gif\" border=\"0\">";
                            break;
                        default:
                            dt.Rows[k]["stat"] = "<img src=\"../../sysImages/folder/yes.gif\" border=\"0\">";
                            break;
                    }
                    #endregion
                    dt.Rows[k]["Cname"] = "<a class=\"list_link\"  href=\"General_Edit_Manage.aspx?Action=edit&id=" + id + "&kkey=" + gType + "\" title=\"����鿴������޸�\">" + dt.Rows[k]["Cname"].ToString() + "</a>";
                    dt.Rows[k]["oPerate"] = "<a class=\"list_link\"  href=\"General_Edit_Manage.aspx?Action=edit&id=" + id + "&kkey=" + gType + "\" title=\"����鿴������޸�\"><img src=\"../../sysImages/" + Foosun.Config.UIConfig.CssPath() + "/sysico/edit.gif\" border=\"0\" alt=\"�޸Ĵ˳�����\" /></a><a class=\"list_link\" href=\"General_manage.aspx?type=suo&id=" + id + "\" title=\"�������\"><img src=\"../../sysImages/" + Foosun.Config.UIConfig.CssPath() + "/sysico/lock.gif\" border=\"0\" alt=\"�����˳�����\" /></a><a class=\"list_link\" href=\"General_manage.aspx?type=unsuo&id=" + id + "\" title=\"�������\"><img src=\"../../sysImages/" + Foosun.Config.UIConfig.CssPath() + "/sysico/unlock.gif\" border=\"0\" alt=\"�����˳�����\" /></a><a class=\"list_link\" href=\"General_manage.aspx?type=del&id=" + id + "\" title=\"���ɾ��\" onclick=\"{if(confirm('ȷ��ɾ����')){return true;}return false;}\"><img src=\"../../sysImages/" + Foosun.Config.UIConfig.CssPath() + "/sysico/del.gif\" border=\"0\" alt=\"ɾ���˳�����\" /></a><input type='checkbox' name='general_checkbox' id='general_checkbox'value=\"" + id + "\"/>";
                }
                DataList1.DataSource = dt;
                DataList1.DataBind();
            }
            else
            {
                NoContent.InnerHtml = Show_NoContent();
                this.PageNavigator1.Visible = false;
            }
        }
        else
        {
            NoContent.InnerHtml = Show_NoContent();
            this.PageNavigator1.Visible = false;
        }
    }
    #endregion


    /// <summary>
    /// ��ʾ���������������ʾ
    /// </summary>
    ///Code by ChenZhaoHui

    string Show_NoContent()
    {

        string nos = "<table border=0 width='98%' align=center cellpadding=5 cellspacing=1 class='table'>";
        nos = nos + "<tr class='TR_BG_list'>";
        nos = nos + "<td class='navi_link'>��ǰû�м�¼��</td>";
        nos = nos + "</tr>";
        nos = nos + "</table>";
        return nos;
    }
}