﻿using System;
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
using Hg.CMS.Common;
public partial class manage_news_unnews_Del : Hg.Web.UI.ManagePage
{
    rootPublic pd = new rootPublic();
    public manage_news_unnews_Del()
    {
        Authority_Code = "C050";
    }
    ContentManage nes = new ContentManage();
    protected void Page_Load(object sender, EventArgs e)
    {
        String UnID;
        UnID = Request.QueryString["UnID"];    
        if (UnID != null)
        {
            UnID = Hg.Common.Input.Filter(UnID);
            if (nes.Str_DelSql(UnID) != 0)
            {
                pd.SaveUserAdminLogs(0, 1, UserName, "不规则新闻", "删除不规则新闻成功！");
                PageRight("删除不规则新闻成功!", "unNews.aspx");
            }
            else
            {
                PageError("删除不规则新闻失败!", "unNews.aspx");
            }
        }
    }
}
