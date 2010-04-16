//=====================================================================
//==                  (C)2007 Foosun Inc.By doNetCMS1.0              ==
//==                     Forum:bbs.foosun.net                        ==
//==                     WebSite:www.foosun.net                      ==
//==                 Address:No.109 HuiMin ST,.ChengDu,China         ==
//==                   Tel:86-28-85098980/66026180                   ==
//==                   QQ:655071,MSN:ikoolls@gmail.com               ==
//==                   Email:Service@foosun.cn                       ==
//==                      Code By WangZhenjiang                      ==
//=====================================================================
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
using Foosun.CMS;
using Foosun.Model;

public partial class user_friend_friendmanage : Foosun.Web.UI.UserPage
{
    Friend fri = new Friend();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        this.PageNavigator1.OnPageChange += new PageChangeHandler(PageNavigator1_PageChange);
        Response.CacheControl = "no-cache";
        if (!IsPostBack)
        {
            Showu_friendmanage(1);
        }
        string Type = Request.QueryString["Type"];  //ȡ�ò�������
        string ID = "";
        if (Request.QueryString["ID"] != null)
        {
            ID = Foosun.Common.Input.Filter(Request.QueryString["ID"]);  //ȡ����Ҫ�����ĸ��ID
        }
        switch (Type)
        {
            case "del":          //ɾ��
                del(ID);
                break;
            case "PDel":            //����ɾ��
                PDel();
                break;
            default:
                break;
        }
    }
    protected void PageNavigator1_PageChange(object sender, int PageIndex)
    {
        Showu_friendmanage(PageIndex);
    }
    protected void Showu_friendmanage(int PageIndex)
    {
        int i, j;
        SQLConditionInfo sts = new SQLConditionInfo("@UserNum", Foosun.Global.Current.UserNum);
        DataTable dts = Foosun.CMS.Pagination.GetPage(this.GetType().Name, PageIndex, 10, out i, out j, sts);
        this.PageNavigator1.PageCount = j;
        this.PageNavigator1.PageIndex = PageIndex;
        this.PageNavigator1.RecordCount = i;
        Friend fr=new Friend();
        if (dts.Rows.Count>0)
        {
            dts.Columns.Add("cutAId",typeof(string));
            dts.Columns.Add("idc",typeof(string));
            dts.Columns.Add("CNT",typeof(string));
            foreach (DataRow s in dts.Rows)
            {
                s["cutAId"] =  s["HailFellow"].ToString();
                s["idc"] = "<a href=\"friend_add.aspx?FCID=" + s["HailFellow"].ToString() + "\" class=\"list_link\">���</a>��<a href=\"#\" onclick=\"javascript:del('" + s["HailFellow"].ToString() + "');\" class=\"list_link\">ɾ��</a>��<input name=\"Checkbox1\" type=\"checkbox\" value=" + s["HailFellow"].ToString() + "  runat=\"server\" /></td>";
                s["CNT"] = fr.FriendClassCount(s["HailFellow"].ToString());
            }
            DataList1.DataSource = dts;
            DataList1.DataBind();
            delp.InnerHtml = Show_del();
        }
        else
        {
            no.InnerHtml = Show_no();
            this.PageNavigator1.Visible = false;
        }
    }
    /// <summary>
    /// ����ɾ��
    /// </summary>
    /// 
    #region ����ɾ��
    protected void PDel()
    {
        string checkboxq = Request.Form["Checkbox1"];
        if (checkboxq == null || checkboxq == String.Empty)
        {
            PageError("����ѡ��Ҫɾ���ĺ���!", "friendmanage.aspx");
        }
        else
        {
            string[] chSplit = checkboxq.Split(',');
            for (int i = 0; i < chSplit.Length; i++)
            {
                if (chSplit[i] != "on")
                {
                    if (fri.Delete1(chSplit[i]) == 0)
                    {
                        PageError("ɾ��ʧ��<br>", "friendmanage.aspx");
                    }
                }
            }
            PageRight("����ɾ���ɹ�", "friendmanage.aspx");
        }
    }
    #endregion
    /// <summary>
    /// ɾ��
    /// </summary>
    /// <param name="ID"></param>
    /// 
    #region ɾ��
    protected void del(string ID)
    {
        if (fri.Delete1(ID) != 0)
        {
            PageRight("ɾ���ɹ�", "friendmanage.aspx");
        }
        else
        {
            PageError("ɾ��ʧ��", "friendmanage.aspx");
        }
    }
    #endregion
    string Show_no()
    {
        string nos = "<table border=0 width='98%' align=center cellpadding=5 cellspacing=1 class='table'>";
        nos = nos + "<tr class='TR_BG_list'>";
        nos = nos + "<td class='navi_link'>û������</td>";
        nos = nos + "</tr>";
        nos = nos + "</table>";
        return nos;
    }
    string Show_del()//��ʾ�����б�
    {
        string dels = "<a href=\"javascript:PDel();\" class=\"topnavichar\">����ɾ��</a>";
        return dels;
    }   
}


