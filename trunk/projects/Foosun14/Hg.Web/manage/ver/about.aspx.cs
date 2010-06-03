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

public partial class manage_ver_about : Hg.Web.UI.ManagePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            copyright.InnerHtml = CopyRight;
        }
        linkus1.InnerHtml = linkus();
    }
    string linkus()
    { 
       string  linkstr = "公司全称： 潍坊北大青鸟华光照排有限公司 <br />" ;
       linkstr = linkstr + " 地　　址： 山东省潍坊市高新技术开发区北宫东街6号<br /> ";
             linkstr = linkstr + " 邮政编码： 261061<BR>  ";
             linkstr = linkstr + " 售前咨询：0536-2991100<br /> ";
             linkstr = linkstr + " 客户服务：0536-2991100 <br />";
             linkstr = linkstr + " 传　　真：0536-2991100<br />";
             linkstr = linkstr + " 站　　点：www.hg.net<br />";
             linkstr = linkstr + " 论　　坛：bbs.hg.net<br />";
             linkstr = linkstr + " 电子邮件：<a class=\"list_link\" href=\"mailto:service@hg.cn\">service@hg.cn</a>, <a class=\"list_link\" href=\"mailto:office@hg.cn\">office@hg.cn</a> <BR> ";
             linkstr = linkstr + " 项目MSN：j_xia@hg.cn<br /> ";
             linkstr = linkstr + "项目ＱＱ：10000";
             return linkstr;
    }
}
