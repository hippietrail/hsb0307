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

namespace Foosun.Web.manage.label
{
    public partial class createLabel_Class : Foosun.Web.UI.ManagePage
    {
        public string APIID = "0";
        Foosun.CMS.Label rd = new Foosun.CMS.Label();
        protected void Page_Load(object sender, EventArgs e)
        {
            APIID = SiteID;
            if (!IsPostBack)
            {

                string _dirdumm = Foosun.Config.UIConfig.dirDumm;
                if (_dirdumm.Trim() != "") { _dirdumm = "/" + _dirdumm; }
                style_class.InnerHtml = Foosun.Common.Public.getxmlstylelist("styleContent2", _dirdumm + "/xml/cuslabeStyle/cstyleClassInfo.xml");
                GetStyleList(this.StyleClassID); ;
            }
        }

        protected void GetStyleList(DropDownList lst)
        {
            IDataReader dr = rd.GetStyleList(SiteID);
            while (dr.Read())
            {
                ListItem it = new ListItem();
                it.Value = dr["ClassID"].ToString();
                it.Text = dr["Sname"].ToString();
                lst.Items.Add(it);
            }
            dr.Close();
        }

    }
}
