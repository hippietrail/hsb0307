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

public partial class user_discuss_discussphoto_del : Hg.Web.UI.UserPage
{

    Discuss dis = new Discuss();
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.CacheControl = "no-cache";
        
        if (!Page.IsPostBack)
        {
            string PhotoID = Hg.Common.Input.Filter(Request.QueryString["PhotoID"].ToString());
            string DisID = Hg.Common.Input.Filter(Request.QueryString["DisID"].ToString());
            if (dis.sel_62(PhotoID) == Hg.Global.Current.UserNum)
            {
                if (dis.Delete_16(PhotoID) == 0)
                {
                    PageError("删除失败!", "discussPhotoalbumlist.aspx?DisID=" + DisID + "");
                }
                else
                {
                    PageRight("删除成功!", "discussPhotoalbumlist.aspx?DisID=" + DisID + "");
                }
            }
            else
            {
                PageError("删除失败!这个图片不是你的你无权删除", "");
            }
        }
    }
}
