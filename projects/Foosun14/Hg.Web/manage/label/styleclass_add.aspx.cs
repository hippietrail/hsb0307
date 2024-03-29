﻿///************************************************************************************************************
///**********添加样式分类Code By DengXi************************************************************************
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
public partial class manage_label_styleclass_add : Hg.Web.UI.ManagePage
{
    rootPublic pd = new rootPublic();
    public manage_label_styleclass_add()
    {
        Authority_Code = "T019";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.CacheControl = "no-cache";                        //设置页面无缓存
        if (!IsPostBack)
        {
            
            copyright.InnerHtml = CopyRight;        //获取版权信息
        }
    }

    /// <summary>
    /// 保存分类
    /// </summary>
    /// <returns>保存分类</returns>
    /// 编写时间2007-04-20   Code By DengXi

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            int result = 0;
            Hg.Model.StyleClassInfo stClass= new Hg.Model.StyleClassInfo();
            stClass.Sname = styleClassName.Text;
            stClass.CreatTime = DateTime.Now;
            stClass.isRecyle = 0;

            Hg.CMS.Style.Style stcClass = new Hg.CMS.Style.Style();
            result = stcClass.sytleClassAdd(stClass);
            if (result == 1)
            {
                pd.SaveUserAdminLogs(0, 1, UserName, "样式管理", "添加分类" + stClass.Sname + " 成功!");
                PageRight("添加分类成功!", "style.aspx");
            }
            else
                PageError("添加分类失败!", "");
        }
    }
}
