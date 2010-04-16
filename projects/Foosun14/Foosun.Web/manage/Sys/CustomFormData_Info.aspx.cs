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

namespace Foosun.Web.manage.Sys
{
    public partial class CustomFormData_Info : Foosun.Web.UI.ManagePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string customID = Request.QueryString["customID"];
            string FormID = Request.QueryString["FormID"];

            Foosun.CMS.CustomForm cf = new Foosun.CMS.CustomForm();
            string fname = string.Empty;
            string tablenm = string.Empty;

            DataTable dt = cf.GetSubmitData(Convert.ToInt32(FormID), out fname, out tablenm);

            DataRow[] rowList = dt.Select("id='" + customID + "'");
            
            DataRow row = rowList[0];

            for (int i = 0; i < dt.Columns.Count; i++)
            {
                HtmlTableRow dr = new HtmlTableRow();
                dr.Attributes.Add("class", "TR_BG_list");
                HtmlTableCell td = new HtmlTableCell();
                td.Attributes.Add("class", "list_link");
                td.Align = "right";
                td.InnerText = dt.Columns[i].ColumnName + "：";
                dr.Controls.Add(td);
                td = new HtmlTableCell();
                td.Attributes.Add("class", "list_link");
                td.InnerText = row[i] + "";
                dr.Controls.Add(td);
                this.grddatas.Controls.Add(dr);
            }
        }
    }
}
