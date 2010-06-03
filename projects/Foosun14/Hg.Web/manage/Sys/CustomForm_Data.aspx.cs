using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace Hg.Web.manage.Sys
{
    public partial class CustomForm_Data : Hg.Web.UI.ManagePage
    {
        Hg.CMS.CustomForm cf = new Hg.CMS.CustomForm();
        protected int formid = 0;
        protected string tablenm = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.Form["Option"] != null && Request.Form["ID"] != null
                    && Request.Form["Option"] == "TruncateTb")
                {
                    try
                    {
                        int id = int.Parse(Request.Form["ID"]);
                        cf.TruncateTable(id);
                        Response.Write("1%操作成功!");
                    }
                    catch (Exception ex)
                    {
                        Response.Write("0%" + ex.Message);
                    }
                    Response.End();
                }
                if (Request.QueryString["id"] != null)
                {
                    formid = int.Parse(Request.QueryString["id"]);
                    string fname;
                    DataTable dt = cf.GetSubmitData(formid, out fname, out tablenm);
                    this.LblName.Text = fname;

                    //表头
                    HtmlTableRow handerRow = new HtmlTableRow();
                    handerRow.Attributes.Add("class","TR_BG");
                    for (int i = 0; i < dt.Columns.Count; i++)
                    {
                        HtmlTableCell td = new HtmlTableCell();
                        td.InnerText = dt.Columns[i].ColumnName;
                        handerRow.Cells.Add(td);
                    }
                    this.grddatas.Controls.Add(handerRow);

                    string[] cellObj = new string[dt.Columns.Count];
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        for (int j = 0; j < cellObj.Length; j++)
                        {
                            cellObj[j] = dt.Rows[i][j] + "";
                        }
                        this.grddatas.Controls.Add(getRow(cellObj));
                    }

                    //this.GrdData.DataSource = dt.DefaultView;
                    //this.GrdData.DataBind();
                    //DataBind();
                    this.clearTableForm.HRef = "javascript:TruncateTb(" + formid + ",'" + tablenm + "');";
                }
                else
                {
                    PageError("参数不完整!", "CustomForm.aspx");
                }
            }
        }

        /// <summary>
        /// 得到一行
        /// </summary>
        /// <param name="str">列值</param>
        /// <param name="str">是否是标题</param>
        /// <returns></returns>
        private HtmlTableRow getRow(string[] str)
        {
            HtmlTableRow dr = new HtmlTableRow();
            HtmlTableCell input = null;
            dr.Style.Add("class", "TR_BG_list");
            for (int i = 0; i < str.Length; i++)
            {
                dr.Cells.Add(getCell(str[i]));
                if (i + 1 == str.Length)
                {
                    input = new HtmlTableCell();
                    input.InnerHtml = "<a href=\"CustomFormData_Info.aspx?customID=" + str[0] + "&FormID=" + Request.QueryString["id"] + "\"><img src=\"../../sysImages/default/sysico/review.gif\" alt=\"详请\" border=\"0\" /></a>";
                    dr.Cells.Add(input);
                }
            }
            return dr;
        }

        /// <summary>
        /// 得到一列
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        private HtmlTableCell getCell(string str)
        {
            HtmlTableCell t = new HtmlTableCell();
            if (str.Length >= 30)
            {
                str = str.Substring(0,30) + "...";
            }
            t.InnerText = str;
            return t;
        }
    }
}
