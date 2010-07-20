///************************************************************************************************************
///**********修改标签栏目Code By DengXi************************************************************************
///************************************************************************************************************
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
using Hg.CMS.Common;

public partial class manage_label_syslabelclass_edit : Hg.Web.UI.ManagePage
{
    rootPublic pd = new rootPublic();
    public manage_label_syslabelclass_edit()
    {
        Authority_Code = "T012";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.CacheControl = "no-cache";                        //设置页面无缓存
        if (!IsPostBack)
        {
            
            getLabelClassInfo();
        }
    }

    /// <summary>
    /// 获得分类信息
    /// </summary>
    /// <returns>在前台显示分类信息</returns>
    /// 编写时间2007-04-23   Code By DengXi

    protected void getLabelClassInfo()
    {
        string str_ClassID = Hg.Common.Input.checkID(Request.QueryString["ClassID"]);
        LabelClassID.Value = str_ClassID;
        string str_ClassName = "";
        string str_ClassContent = "";
        
        Hg.CMS.Label lbcc = new Hg.CMS.Label();
        DataTable dt = lbcc.GetLabelClassInfo(str_ClassID);
        
        if (dt != null)
        {
            if (dt.Rows.Count > 0)
            {
                str_ClassName = dt.Rows[0][0].ToString();
                str_ClassContent = dt.Rows[0][1].ToString();
            }
            else
                PageError("参数错误!", "");
            dt.Clear();
            dt.Dispose();
        }
        LabelClassName.Text = str_ClassName;
        ClassContent.Text = str_ClassContent;
    }

    /// <summary>
    /// 保存分类信息
    /// </summary>
    /// <returns>保存分类信息</returns>
    /// 编写时间2007-04-23   Code By DengXi

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string str_Name = Request.Form["LabelClassName"];
            string str_ClassID = Request.Form["LabelClassID"];
            string str_Content = Request.Form["ClassContent"];

            Hg.Model.LabelClassInfo lbc = new Hg.Model.LabelClassInfo();
            lbc.ClassName = str_Name;
            lbc.ClassID = Hg.Common.Input.checkID(str_ClassID);
            lbc.Content = str_Content;
            lbc.CreatTime = DateTime.Now;
            lbc.SiteID = SiteID;
            
            int result = 0;

            Hg.CMS.Label lbcc = new Hg.CMS.Label();
            result = lbcc.LabelClassEdit(lbc);
            if (result == 1)
            {
                pd.SaveUserAdminLogs(0, 1, UserName, "标签管理", "修改分类" + lbc.ClassName + " 成功!");
                PageRight("修改分类成功!", "SysLabel_List.aspx");
            }
            else
                PageError("修改分类失败!", "");        
        }
    }
}
