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
    public partial class add : Hg.Web.UI.ManagePage
    {
        public add()
        {
            Authority_Code = "Q030";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
                return;
            //Hg.Config.API.APIConfig config = Hg.Config.API.APIConfigs.GetConfig();
            
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            if (!this.IsValid)
                return;
            Hg.Config.API.APIConfig config = Hg.Config.API.APIConfigs.GetConfig();
            if (config.ApplicationList == null)
                config.ApplicationList = new Hg.Config.API.ApplicaitonCollection();
            
            Hg.Config.API.ApplicationInfo appInfo = new Hg.Config.API.ApplicationInfo();
            appInfo.AppID = this.TextBoxAppID.Text;
            appInfo.AppUrl = this.Api_Url.Text;
            config.ApplicationList.Add(appInfo);
            Hg.Config.API.APIConfigs.SaveConfig(config);
            Response.Redirect("adapt.aspx");
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            Hg.Config.API.APIConfig config = Hg.Config.API.APIConfigs.GetConfig();
            if (config.ApplicationList == null)
                config.ApplicationList = new Hg.Config.API.ApplicaitonCollection();
            foreach (Hg.Config.API.ApplicationInfo _appInfo in config.ApplicationList)
            {
                if (_appInfo.AppID.ToLower() == this.TextBoxAppID.Text.ToLower())
                {
                    args.IsValid = false;
                    break;
                }

            }
        }
    }
}
