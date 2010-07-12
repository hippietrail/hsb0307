using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Hg.Model;
public partial class manage_Sys_LogList : Hg.Web.UI.ManagePage
{
    public manage_Sys_LogList()
    {
        Authority_Code = "Q016";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        this.PageNavigator1.OnPageChange += new PageChangeHandler(PageNavigator1_PageChange);
        if (!IsPostBack)
        {
            StartLoad(1);
        }
    }
    /// 分页
    /// </summary>
    /// <returns>分页</returns>
    ///  Code By lsd
    protected void PageNavigator1_PageChange(object sender, int PageIndex)
    {
        StartLoad(PageIndex);
    }
    protected void StartLoad(int PageIndex)
    {
        int pageCount, recordCount;

        DateTime? startTime = null;
        DateTime? endTime = null;
        if (txtStartTime.Text.Length==10)
        {
            startTime = DateTime.Parse(txtStartTime.Text);
        }
        if (txtEndTime.Text.Length==10)
        {
            endTime = DateTime.Parse(txtEndTime.Text);
        }
        DataTable dt = Hg.CMS.Common.FsLog.GetPage(Hg.Common.Input.Filter(txtUserName.Text.Trim()), startTime, endTime, SiteID, PageIndex, 25, out recordCount, out pageCount);

        this.PageNavigator1.PageCount = pageCount;
        this.PageNavigator1.PageIndex = PageIndex;
        this.PageNavigator1.RecordCount = recordCount;
        if (dt != null)
        {
            Repeater1.DataSource = dt;                              //设置datalist数据源
            Repeater1.DataBind();                                   //绑定数据源
            dt.Clear();
            dt.Dispose();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        StartLoad(1);

    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        int dayCount = 0;
        if (!Hg.Common.Input.IsInteger(txtDayCount.Text.Trim()))
        {
            litMsg.Text = "<script type='text/javascript'>alert('清理日志的天数必须为整正数');</script>";
            return;
        }
        try
        {
            dayCount = int.Parse(txtDayCount.Text.Trim());
        }
        catch
        { }

        dayCount = dayCount * -1;
        DateTime logTime = DateTime.Now.AddDays(dayCount);
        Hg.CMS.Common.FsLog.Delete(logTime);
        StartLoad(1);
        litMsg.Text = "<script type='text/javascript'>alert('清理成功！');</script>";
    }
}