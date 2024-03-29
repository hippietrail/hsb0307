﻿///************************************************************************************************************
///**********添加标签栏目Code By DengXi************************************************************************
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
public partial class manage_label_syslabelclass_add : Hg.Web.UI.ManagePage
{
    rootPublic pd = new rootPublic();
    public manage_label_syslabelclass_add()
    {
        Authority_Code = "T016";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.CacheControl = "no-cache";                        //设置页面无缓存
        if (!IsPostBack)
        {
            
        }
    }

    /// <summary>
    /// 保存分类
    /// </summary>
    /// <returns>保存分类</returns>
    /// 编写时间2007-04-23   Code By DengXi


    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string str_Cname = LabelClassName.Text;
            string str_Content = ClassContent.Text;

            Hg.Model.LabelClassInfo lbcc = new Hg.Model.LabelClassInfo();
            lbcc.ClassName = str_Cname;
            lbcc.Content = str_Content;
            lbcc.CreatTime = DateTime.Now;
            lbcc.SiteID = SiteID;
            lbcc.isRecyle = 0;

            int result = 0;

            Hg.CMS.Label lbc =  new Hg.CMS.Label();
            result = lbc.LabelClassAdd(lbcc);

            if (result == 1)
            {
                pd.SaveUserAdminLogs(0, 1, UserName, "标签管理", "添加分类" + lbcc.ClassName + " 成功!");
                PageRight("添加分类成功!", "SysLabel_List.aspx");
            }
            else
                PageError("添加分类失败!", "");
        }
    }
}
