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

namespace Hg.Web
{
    public partial class _default : Hg.Web.UI.BasePage
    {
        protected string SiteRootPath = Hg.Common.ServerInfo.GetRootPath();
        protected string dimm = Hg.Config.UIConfig.dirDumm;
        protected string TempletDir = Hg.Config.UIConfig.dirTemplet;
        public static string gInstallDir = "{$InstallDir}";
        public static string gTempletDir = "{$TempletDir}";
        protected void Page_Load(object sender, EventArgs e)
        {
            string gChID = Request.QueryString["ChID"];
            int ChID = 0;
            if (gChID != null && gChID != string.Empty)
            {
                if (Hg.Common.Input.IsInteger(gChID.ToString()))
                {
                    ChID = int.Parse(gChID.ToString());
                }
            }
            Hg.Publish.CommonData.Initialize();
            string indexname = "index.html";
            string TempletPath = Hg.Common.Public.readparamConfig("IndexTemplet");
            if (ChID != 0)
            {
                TempletPath = "/" + Hg.Config.UIConfig.dirTemplet + "/" + Hg.Common.Public.readCHparamConfig("channeltemplet", ChID);
            }
            TempletPath = TempletPath.Replace("/", "\\");
            TempletPath = TempletPath.ToLower().Replace("{@dirtemplet}", TempletDir);
            indexname = Hg.Common.Public.readparamConfig("IndexFileName");
            Hg.Publish.Template indexTemp = null;
            if (ChID != 0)
            {
                indexname = Hg.Common.Public.readCHparamConfig("channelindexname", ChID);
                indexTemp = new Hg.Publish.Template(SiteRootPath.Trim('\\') + TempletPath, Hg.Publish.TempType.ChIndex);
            }
            else
            {
                indexTemp = new Hg.Publish.Template(SiteRootPath.Trim('\\') + TempletPath, Hg.Publish.TempType.Index);
            }
            indexTemp.GetHTML();
            indexTemp.ReplaceLabels();
            string getContent = indexTemp.FinallyContent;

            if (Regex.Match(getContent, @"\</head\>[\s\S]*\<body", RegexOptions.IgnoreCase | RegexOptions.Compiled).Success)
            {
                getContent = Regex.Replace(getContent, "<body", getjs() + "<body", RegexOptions.IgnoreCase | RegexOptions.Compiled);
            }
            else
            {
                getContent = getjs() + getContent;
            }
            getContent = (getContent.Replace(gInstallDir, Hg.Publish.CommonData.getUrl())).Replace(gTempletDir, TempletDir);
            Response.Write(getContent);
        }

        protected string getjs()
        {
            string getajaxJS = "<script language=\"javascript\" type=\"text/javascript\" src=\"" + Hg.Publish.CommonData.getUrl() + "/configuration/js/Prototype.js\"></script>\r\n";
            getajaxJS += "<script language=\"javascript\" type=\"text/javascript\" src=\"" + Hg.Publish.CommonData.getUrl() + "/configuration/js/jspublic.js\"></script>\r\n";
            getajaxJS += "<!--Created by WebFastCMS v1.0 For Hg Inc. at " + DateTime.Now + "-->\r\n";
            return getajaxJS;
        }

    }
}
