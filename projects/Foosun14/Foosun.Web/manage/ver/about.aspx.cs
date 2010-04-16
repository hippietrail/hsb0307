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
using Foosun.CMS;

public partial class manage_ver_about : Foosun.Web.UI.ManagePage
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
       string  linkstr = "公司全称： 四川风讯科技发展有限公司 <br />" ;
             linkstr = linkstr + " 地　　址： 四川省成都市高新区孵化园11栋2207室<br /> ";
             linkstr = linkstr + " 邮政编码： 610042<BR>  ";
             linkstr = linkstr + " 售前咨询：028-85336900转600<br /> ";
             linkstr = linkstr + " 客户服务：028-85336900转608 <br />";
             linkstr = linkstr + " 传　　真：028-85336900转603<br />";
             linkstr = linkstr + " 站　　点：www.foosun.net<br />";
             linkstr = linkstr + " 论　　坛：bbs.foosun.net<br />";
             linkstr = linkstr + " 电子邮件：<a class=\"list_link\" href=\"mailto:service@foosun.cn\">service@foosun.cn</a>, <a class=\"list_link\" href=\"mailto:office@foosun.cn\">office@foosun.cn</a> <BR> ";
             linkstr = linkstr + " 项目MSN：j_xia@foosun.cn<br /> ";
             linkstr = linkstr + "项目ＱＱ：542159324";
             return linkstr;
    }
}
