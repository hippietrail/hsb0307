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

public partial class user_show_showphotofilt : Hg.Web.UI.BasePage
{
    Photo pho = new Photo();
    protected string sImgUrl = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Response.CacheControl = "no-cache";
            getPhoto();
        }
    }

    protected void getPhoto()
    {
        string PhotoalbumID = Hg.Common.Input.Filter(Request.QueryString["PhotoalbumID"]);
        string pwd = pho.sel_1(PhotoalbumID);
        string UserNum = pho.sel_20(PhotoalbumID);
        if (pwd != "" && pwd != null && UserNum != Hg.Global.Current.UserNum)
        {
            PageError("你密码不正确","");
        }
        else
        {
            int n = 0;
            DataTable dt = pho.sel_18(PhotoalbumID);
            if (dt != null)
            {
                string dirDumm = Hg.Config.UIConfig.dirDumm;
                if (dirDumm.Trim() != "")
                {
                    dirDumm = "/" + dirDumm;
                }
                foreach (DataRow r in dt.Rows)
                {
                    if (!r.IsNull(0))
                    {
                        if (n > 0)
                            sImgUrl += "\t";
                        sImgUrl += r[0].ToString().Replace("{@userdirfile}", dirDumm + Hg.Config.UIConfig.UserdirFile);
                        n++;
                    }
                }
                dt.Dispose();
            }
            DataBind();
        }
    }
}
