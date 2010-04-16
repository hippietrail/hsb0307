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
using Foosun.Config;
namespace Foosun.Web
{
    public partial class testseries : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ddd_Click(object sender, EventArgs e)
        {
            Series sn = new Series();
            dda.InnerHtml = "º”√‹∫Û£∫";
            dd.InnerHtml = sn.EnPas(tt.Value);
        }

        protected void newsn_Click(object sender, EventArgs e)
        {
            Series sn = new Series();
            dda.InnerHtml = "–Ú¡–∫≈£∫";
            dd.InnerHtml = sn.Code;
        }
    }
}
