﻿//=====================================================================
//==                  (C)2007 Hg Inc.By doNetCMS1.0              ==
//==                     Forum:bbs.hg.net                        ==
//==                     WebSite:www.hg.net                      ==
//==                 Address:No.109 HuiMin ST,.ChengDu,China         ==
//==                   Tel:86-28-85098980/66026180                   ==
//==                   QQ:655071,MSN:ikoolls@gmail.com               ==
//==                   Email:Service@hg.cn                       ==
//==                      Code By WangZhenjiang                      ==
//=====================================================================
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
using Hg.CMS;

public partial class mycom_Look : Hg.Web.UI.UserPage
{
    Info inf = new Info();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        Response.CacheControl = "no-cache";
        string Commid = Hg.Common.Input.Filter(Request.QueryString["Commid"]);
        DataTable dt = inf.sel_19(Commid);
        this.TitleBox.Text=dt.Rows[0]["Title"].ToString();
        this.ContentBox.Text=dt.Rows[0]["Content"].ToString();
    }   
    protected void shortCutsubmit(object sender, EventArgs e)
    {
        Response.Redirect("mycom.aspx");
    }
}
