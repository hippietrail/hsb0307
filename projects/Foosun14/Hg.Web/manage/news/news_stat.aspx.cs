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
using Hg.CMS;
using Hg.CMS.Common;
using Hg.Common;

public partial class manage_news_news_stat : Hg.Web.UI.ManagePage
{
    Admin rd = new Admin();
    rootPublic pd = new rootPublic();
    ContentManage cd = new ContentManage();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        SiteCopyRight.InnerHtml = CopyRight;
        AdminList.InnerHtml = getAdminList();
    }


    protected string getAdminList()
    {
        string list = "";
        DataTable dt = rd.getAdmininfoList();
        if (dt != null && dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                list += dt.Rows[i]["UserName"].ToString() + "&nbsp;(<a href=\"News_list.aspx?ClassID=&Editor=" + dt.Rows[i]["UserName"].ToString() + "\" class=\"list_link\" title=\"共编辑" + cd.getNewsRecordEdior(dt.Rows[i]["UserName"].ToString()) + "篇文章&#13;点击查看\">" + cd.getNewsRecordEdior(dt.Rows[i]["UserName"].ToString()) + "</a>)&nbsp;&nbsp;&nbsp;&nbsp;";
            }
            dt.Clear(); dt.Dispose();
        }
        return list;
    }
}
