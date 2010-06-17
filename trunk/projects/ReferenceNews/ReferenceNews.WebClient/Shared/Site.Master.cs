using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReferenceNews.WebClient.Shared
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 注意jsText可以在配置文件中设置
            string jsText = "<script type=\"text/javascript\" src=\"" + Page.ResolveUrl("~/Shared/js/jquery-1.4.2.min.js") + "\" ></script>\n";
            jsText += "<script type=\"text/javascript\" src=\"" + Page.ResolveUrl("~/Shared/js/jquery.validate.min.js") + "\" ></script>\n";
            jsText += "<script type=\"text/javascript\" src=\"" + Page.ResolveUrl("~/Shared/js/jquery.formValidator.js") + "\" ></script>\n";
            jsText += "<script type=\"text/javascript\" src=\"" + Page.ResolveUrl("~/Shared/js/member.js") + "\" ></script>\n";
            jsText += "<script type=\"text/javascript\" src=\"" + Page.ResolveUrl("~/Shared/js/swfobject2.js") + "\" ></script>\n";
            jsText += "<script type=\"text/javascript\" src=\"" + Page.ResolveUrl("~/Shared/js/ext_main.js") + "\" ></script>\n";

            jsText += "\n";
            jsText += "<link rel=\"stylesheet\" type=\"text/css\" media=\"all\" href=\"" + Page.ResolveUrl("~/Shared/css/layout.css") + "\" />\n";
            jsText += "<link rel=\"stylesheet\" type=\"text/css\" media=\"all\" href=\"" + Page.ResolveUrl("~/Shared/css/public.css") + "\" />\n";
            jsText += "<link rel=\"stylesheet\" type=\"text/css\" media=\"all\" href=\"" + Page.ResolveUrl("~/Shared/css/user.css") + "\" />\n";
            jsText += "<link rel=\"stylesheet\" type=\"text/css\" media=\"all\" href=\"" + Page.ResolveUrl("~/Shared/css/ext_main.css") + "\" />\n";

            js.Text = jsText;
        }
    }
}
