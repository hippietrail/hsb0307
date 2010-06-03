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
using System.Net.Mail;

public partial class SendMail : Hg.Web.UI.UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            getNewsInfo();
    }

    /// <summary>
    /// 取得相关信息
    /// </summary>
    protected void getNewsInfo()
    {
        string NewsID = Hg.Common.Input.Filter(Request.QueryString["id"]);
        if (NewsID != "" && NewsID != null)
        {
            Hg.CMS.UserMisc user = new Hg.CMS.UserMisc();
            DataTable dt = user.getUserUserNumRecord(Hg.Global.Current.UserNum);
            if (dt != null && dt.Rows.Count > 0)
            {
                FROM.Text = dt.Rows[0]["Email"].ToString();
                dt.Clear(); dt.Dispose();
            }
            Hg.CMS.ContentManage news = new Hg.CMS.ContentManage();
            IDataReader dr = news.getNewsID(NewsID);
            if (dr.Read())
            {
                NewsTitle.InnerHtml = dr["NewsTitle"].ToString();
                Title.Value = dr["NewsTitle"].ToString();
                if (dr["Content"] != DBNull.Value)
                    Content.Value = Hg.Common.Input.GetSubString(dr["Content"].ToString(), 500);

                if (dr["NewsType"].ToString() == "2")
                    NewsLinkURL.Value = dr["URLaddress"].ToString();
                else
                {
                    string SaveClassframe = "";
                    DataTable dc = news.getClassContent(dr["ClassID"].ToString());
                    if (dc != null && dc.Rows.Count > 0)
                    {
                        SaveClassframe = dc.Rows[0]["SavePath"] + "/" + dc.Rows[0]["SaveClassframe"].ToString();
                        dc.Clear(); dc.Dispose();
                        SaveClassframe = SaveClassframe.Replace("//", "/");
                    }
                    NewsLinkURL.Value = Hg.Publish.CommonData.getUrl() + SaveClassframe + "/" + dr["SavePath"].ToString() + "/" + dr["FileName"].ToString() + dr["FileEXName"].ToString();
                }
                dr.Close();
            }
            else
            {
                dr.Close();
                Response.Write("<script language=\"javascript\">alert('参数传递错误!');history.back();</script>");
                Response.End();
            }
        }
        else
        {
            Response.Write("<script language=\"javascript\">alert('参数传递错误!');history.back();</script>");
            Response.End();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string smtpserver = Hg.Config.UIConfig.smtpserver;
            string userName = Hg.Config.UIConfig.emailuserName;
            string pwd = Hg.Config.UIConfig.emailuserpwd;
            string strfrom = Hg.Config.UIConfig.emailfrom;
            string strto = TO.Text;
            string subj = FROM.Text + " 给你发送了一篇精彩新闻";
            string bodys = "<div><a href=\"" + NewsLinkURL.Value + "\">" + Title.Value + "</a><div>";
            bodys += "<br /><br />";
            bodys += "<div>" + Content.Value + "</div>";
            Hg.Common.Public.sendMail(smtpserver, userName, pwd, strfrom, strto, subj, bodys);
            PageRight("发送成功！", "");
        }
    }
}
