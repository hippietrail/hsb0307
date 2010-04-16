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
using Foosun.CMS;

namespace Foosun.Web.manage.news
{
	public partial class News_Site_Admin : Foosun.Web.UI.ManagePage
	{
		protected internal string CopyRight = "<span style=\"font-size:10px;\">(c)2002-2010 Foosun Inc. By " + Foosun.Config.verConfig.Productversion + "</span>";
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{

				this.SiteCopyRight.InnerHtml = CopyRight;
				//从2008年开始
				int countYear = DateTime.Now.Year - 2008;
				for (int i = 0; i <= countYear; i++)
				{
					ListItem item = new ListItem();
					item.Value = DateTime.Now.Year - i + "";
					item.Text = DateTime.Now.Year - i + "年";
					this.yearList.Items.Add(item);
				}

				for (int i = 0; i < this.monthList.Items.Count; i++)
				{
					if (this.monthList.Items[i].Value.Equals(DateTime.Now.Month.ToString()))
					{
						this.monthList.SelectedIndex = i;
					}
				}
				this.Label1.Text = DateTime.Now.ToString("yyyy-MM") + "-1";
				this.Label2.Text = DateTime.Now.ToString("yyyy-MM") + "-30";
				string type = Request.QueryString["type"];
				if (string.IsNullOrEmpty(type))
				{
					type = "newsStat";
				}

				if (type.Equals("newsStat"))
				{
					this.NewsClickList.Visible = false;
					ContentManage rd = new ContentManage();
					//得到本月的排名
					DataTable table = rd.getNewsStat(DateTime.Now.Year, DateTime.Now.Month, 20);
					this.newsStat.DataSource = table;
					this.newsStat.DataBind();


				}
				if (!string.IsNullOrEmpty(type) && type.Equals("newsClick"))
				{
					this.newsStat.Visible = false;
					ContentManage rd = new ContentManage();
					//得到本月的排名
					DataTable table = rd.getNewsClick(DateTime.Now.Year, DateTime.Now.Month, 20);
					this.NewsClickList.DataSource = table;
					this.NewsClickList.DataBind();
				}
			}
		}

		protected void butSearch_Click(object sender, EventArgs e)
		{
			string year = this.yearList.SelectedValue;
			string month = this.monthList.SelectedValue;
			string tops = this.TextBox1.Text;
			int countSel = 20;
			try
			{
				countSel = int.Parse(tops);
			}
			catch
			{
				this.TextBox1.Text = "20";
				countSel = 20;
			}

			this.Label1.Text = year + "-" + month + "-1";
			this.Label2.Text = year + "-" + month + "-30";

			ContentManage rd = new ContentManage();

			if (this.newsStat.Visible)
			{
				DataTable table = rd.getNewsStat(Convert.ToInt32(year), Convert.ToInt32(month), Convert.ToInt32(countSel));
				this.newsStat.DataSource = table;
				this.newsStat.DataBind();
			}
			else
			{
				DataTable table = rd.getNewsClick(Convert.ToInt32(year), Convert.ToInt32(month), Convert.ToInt32(countSel));
				this.NewsClickList.DataSource = table;
				this.NewsClickList.DataBind();
			}
		}
	}
}
