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

public partial class usermycom_up : Hg.Web.UI.ManagePage
{
    public usermycom_up()
    {
        Authority_Code = "U035";
    }
    Mycom myc = new Mycom();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        Response.CacheControl = "no-cache";
        string Commid = Hg.Common.Input.Filter(Request.QueryString["Commid"]);
        DataTable dt = myc.sel(Commid);
        this.TitleBox.Text=dt.Rows[0]["Title"].ToString();
        this.ContentBox.Text=dt.Rows[0]["Content"].ToString();
    }   
    protected void shortCutsubmit(object sender, EventArgs e)
    {
        if (Page.IsValid)//判断是否通过验证
        {
            string Title = string.Empty;//Request.Form["TitleBox"];
            string Contents=Hg.Common.Input.Filter(Request.Form["ContentBox"]);
            if (Contents.Length > 200)
            {
                PageError("内容最多200个字符", "javascript:history()");
            }
            DateTime CreatTime = DateTime.Now;
            string Commid = Hg.Common.Input.Filter(Request.QueryString["Commid"]);
            if (myc.Update(Title, Contents, CreatTime, Commid) == 0)
            {
                PageError("修改错误", "usermycom.aspx");
            }
            else
            {
                PageRight("修改成功", "usermycom.aspx");
            }
        }
    }
}
