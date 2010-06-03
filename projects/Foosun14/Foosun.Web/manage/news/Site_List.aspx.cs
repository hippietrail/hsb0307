//===========================================================
//==     (c)2007 Foosun Inc. by dotNETCMS 1.0              ==
//==             Forum:bbs.foosun.net                      ==
//==            website:www.foosun.net                     ==
//==     Address:NO.109 HuiMin ST.,Chengdu ,China          ==
//==         TEL:86-28-85098980/66026180                   ==
//==         qq:655071,MSN:ikoolls@gmail.com               ==
//==               Code By JiangDong                       ==
//===========================================================
using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class manage_news_Site_List : Hg.Web.UI.ManagePage
{
    private Hg.CMS.Site site;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.PageNavigator1.OnPageChange += new PageChangeHandler(PageNavigator1_PageChage);
        site = new Hg.CMS.Site();
        if (!IsPostBack)
        {
            if (SiteID == "0")
            {
                //addsite.InnerHtml = "<a class=\"list_link\" href=\"site_add.aspx?id=1\">新建站群</a>";
                addsite.InnerHtml = "<a class=\"list_link\" href=\"site_add.aspx\">新建站群</a>";
            }
            else
            {
                addsite.InnerHtml = "<span class=\"tbie\">目前不支持下级站群创建子站群</a>";
            }
            if (Request.Form["Option"] != null && !Request.Form["Option"].Trim().Equals("")
                && Request.Form["SiteID"] != null && !Request.Form["SiteID"].Trim().Equals(""))
            {
                string id = Hg.Common.Input.Filter(Request.Form["SiteID"].Trim());
                try
                {
                    if (id.ToString() == "0")
                    {
                        Response.Write("0%总站站群不允许删除!\n");
                    }
                    if (id.ToString().ToUpper() != SiteID)
                    {
                        switch (Request.Form["Option"])
                        {
                            case "RecyleSite":
                                site.Recyle(id);
                                Response.Write("1%成功将选中站群及其所属栏目、专题、新闻放入回收站中！");
                                break;
                            case "DeleteSite":
                                site.Delete(id);
                                Response.Write("1%操作成功!");
                                break;
                        }
                    }
                    else
                    {
                        Response.Write("0%不能删除自己站群,请与系统管理员联系!\n");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("0%操作失败:" + ex.Message);
                }
                Response.End();
            }
            if (!Page.IsPostBack)
            {
                DataListBind(1);
            }
        }
    }

    private void PageNavigator1_PageChage(object sender, int PageIndex)
    {
        DataListBind(PageIndex);
    }

    private void DataListBind(int PageIndex)
    {
        int nRCount, nPCount;
        DataTable tb = Hg.CMS.Pagination.GetPage(this.GetType().Name, PageIndex, 20, out nRCount, out nPCount);
        this.PageNavigator1.PageCount = nPCount;
        this.PageNavigator1.PageIndex = PageIndex;
        this.PageNavigator1.RecordCount = nRCount;
        this.RptSite.DataSource = tb;
        this.RptSite.DataBind();
    }
    protected void RptSite_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lbl1 = (Label)e.Item.FindControl("LblIsURL");
            if (lbl1 != null)
            {
                if (lbl1.Text.Equals("1"))
                    lbl1.Text = "外部";
                else if (lbl1.Text.Equals("0"))
                    lbl1.Text = "系统";
            }
            Label lbl2 = (Label)e.Item.FindControl("LblShowNaviTF");
            if (lbl2 != null)
            {
                if (lbl2.Text.Equals("1"))
                    lbl2.Text = "显示";
                else if (lbl2.Text.Equals("0"))
                    lbl2.Text = "隐藏";
            }
            Label lbl3 = (Label)e.Item.FindControl("LblContrTF");
            if (lbl3 != null)
            {
                if (lbl3.Text.Equals("1"))
                    lbl3.Text = "┆稿";
                else
                    lbl3.Text = "";
            }
            Label lbl4 = (Label)e.Item.FindControl("LblDomain");
            if (lbl4 != null)
            {
                if (!lbl4.Text.Equals(""))
                    lbl4.Text = "┆域";
                else
                    lbl4.Text = "";
            }
        }
    }
}
