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
using Hg.CMS.Common;

public partial class manage_user_discussacti : Hg.Web.UI.ManagePage
{
    Discuss dis = new Discuss();
    protected void Page_Load(object sender, EventArgs e)
    {

        Response.CacheControl = "no-cache";
    }
    /// <summary>
    /// 添加数据
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    #region 添加数据
    protected void inBox_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)//判断是否通过验证
        {
            rootPublic rd = new rootPublic();
            string Activesubject = Request.Form["ActivesubjectBox"].ToString();
            string ActivePlace = Request.Form["ActivePlaceBox"].ToString();
            int Anum = int.Parse(Request.Form["AnumBox"].ToString());
            string ActivePlan = Request.Form["ActivePlanBox"].ToString();
            string Contactmethod = Request.Form["ContactmethodBox"].ToString();
            DateTime Cutofftime = DateTime.Parse(Request.Form["CutofftimeBox"].ToString());

            DateTime CreaTime = DateTime.Now;//获取当前系统时间

            string AId = Hg.Common.Rand.Number(12);

            int ALabel = this.ALabelList.SelectedIndex;

            string ActiveExpense = Request.Form["ActiveExpenseBox"].ToString();


            DataTable dt1 = dis.sel(UserNum);
            string UName1 = dt1.Rows[0]["UserName"].ToString();
            string site = dt1.Rows[0]["SiteID"].ToString();

            Hg.Model.STDiscussActive DA = new Hg.Model.STDiscussActive();
            DA.ActiveExpense = ActiveExpense;
            DA.ActivePlace = ActivePlace;
            DA.ActivePlan = ActivePlan;
            DA.Activesubject = Activesubject;
            DA.AId = AId;
            DA.ALabel = ALabel;
            DA.Anum = Anum;
            DA.Contactmethod = Contactmethod;
            DA.CreaTime = CreaTime;
            DA.Cutofftime = Cutofftime;
            DA.siteID = site;
            DA.UserName = UName1;

            if (dis.sel_1() != AId)
            {
                if (dis.Add(DA) != 0)
                {
                    rd.SaveUserAdminLogs(1, 1, UserNum, "创建讨论组", "创建成功");
                    PageRight("创建成功", "discussacti_list.aspx");
                }
                else
                {
                    rd.SaveUserAdminLogs(1, 1, UserNum, "创建讨论组", "创建失败");
                    PageError("创建失败", "discussacti_list.aspx");
                }
            }
            else
            {
                PageError("创建失败可能编号重复", "discussacti_list.aspx");
            }
        }
    }
    #endregion
}
