//=====================================================================
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

public partial class user_friendmanage_add : Hg.Web.UI.UserPage
{
    Friend fri = new Friend();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        Response.CacheControl = "no-cache";
    }   
   
    protected void shortCutsubmit(object sender, EventArgs e)
    {
        if (Page.IsValid)//判断是否通过验证
        {
            string UserNum = Hg.Global.Current.UserNum;
            string FriendName = Hg.Common.Input.Filter(Request.Form["FriendNameBox"]);
            string Contents = Hg.Common.Input.Htmls(Request.Form["ContentBox"]);

            string Hail_Fellow = Hg.Common.Rand.Number(12);

            int cut = fri.sel_7(UserNum);

            string selHail_Fellow = fri.sel_8();

            Hg.Model.STFriendClass Fic;
            Fic.Content = Contents;
            Fic.FriendName = FriendName;
            Fic.HailFellow = Hail_Fellow;


            if (selHail_Fellow != Hail_Fellow)
            {
                if (cut > 5)
                {
                    PageError("添加错误,您所建立的好友分类超过五个不能在添加", "friendmanage.aspx");
                }
                else
                {
                    if (fri.Add_5(Fic,UserNum)==0)
                    {
                        PageError("添加错误", "friendmanage.aspx");
                    }
                    else
                    {
                        PageRight("添加成功", "friendmanage.aspx");
                    }
                }
            }
            else 
            {
                PageError("添加错误可能编号重复", "friendmanage.aspx");
            }
        }
    }
}


