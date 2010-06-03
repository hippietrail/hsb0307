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

namespace Hg.Web.manage.adapt
{
    public partial class delete : Hg.Web.UI.ManagePage
    {
        public delete()
        {
            Authority_Code = "Q030";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string appid = Request.QueryString["appid"];
            Hg.Config.API.APIConfig config = Hg.Config.API.APIConfigs.GetConfig();
            Hg.Config.API.ApplicationInfo _appInfo=null;
            if (config.ApplicationList != null)
            {
                foreach (Hg.Config.API.ApplicationInfo appInfo in config.ApplicationList)
                {
                    if (appInfo.AppID == appid)
                    {
                        _appInfo = appInfo;
                        break;
                    }
                }
                if (_appInfo != null)
                {
                    config.ApplicationList.Remove(_appInfo);
                    Hg.Config.API.APIConfigs.SaveConfig(config);
                }
            }
            Response.Redirect("adapt.aspx");
        }
    }
}
