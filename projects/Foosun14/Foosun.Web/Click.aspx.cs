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

public partial class Click : Hg.Web.UI.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string NewsID = Request.QueryString["id"];
        string ChID = Request.QueryString["ChID"];
        if (ChID != null && ChID != string.Empty)
        {
            if (Hg.Common.Input.IsInteger(ChID))
            {
                Hg.CMS.Channel rd = new Hg.CMS.Channel();
                Response.Write(rd.AddinfoClick(int.Parse(NewsID.ToString()), int.Parse(ChID.ToString())));
            }
            else
            {
                Response.Write("0");
            }
        }
        else
        {
            Hg.CMS.News news = new Hg.CMS.News();
            Response.Write(news.AddNewsClick(NewsID));
        }
        
    }
}
