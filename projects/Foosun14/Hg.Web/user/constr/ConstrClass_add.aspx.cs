﻿//===========================================================
//==     (c)2007 Hg Inc. by WebFastCMS 1.0              ==
//==             Forum:bbs.hg.net                      ==
//==            website:www.hg.net                     ==
//==     Address:NO.109 HuiMin ST.,Chengdu ,China          ==
//==         TEL:86-28-85098980/66026180                   ==
//==         qq:655071,MSN:ikoolls@gmail.com               ==
//==            Code By ZhenJiang.Wang                     == 
//===========================================================
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

public partial class user_ConstrClass_add : Hg.Web.UI.UserPage
{
    //连接数据库
    Constr con = new Constr();
    /// <summary>
    /// 初始化
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    /// 
    #region 初始化
    protected void Page_Load(object sender, EventArgs e)
    {
        
        Response.CacheControl = "no-cache";
    }
    #endregion
    /// <summary>
    /// 添加分类
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    /// 
    #region 添加分类
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string cName = Hg.Common.Input.Htmls(Request.Form["cNameBox"].ToString());
            string Content = Hg.Common.Input.Htmls(Request.Form["ContentBox"].ToString());
            string Ccid = Hg.Common.Rand.Number(12);
            DataTable dt = con.sel6();
            int cut = dt.Rows.Count;
            string Ccids = "";
            if (cut > 0)
            {
                Ccids = dt.Rows[0]["Ccid"].ToString();
            }
            string UserNum = Hg.Global.Current.UserNum;
            Hg.Model.STConstrClass stcn;
            stcn.cName = cName;
            stcn.Content = Content;

            if (Ccids != Ccid)
            {
                if (con.Add2(stcn, Ccid,UserNum)!=0)
                { 
                    PageRight("创建成功","ConstrClass.aspx");
                }
                    else
                {
                    PageError("添加失败<br>", "ConstrClass.aspx");
                }         
            }
            else
            {
                PageError("添加失败可能编号重复<br>","");
            } 
        }
    }
    #endregion
}