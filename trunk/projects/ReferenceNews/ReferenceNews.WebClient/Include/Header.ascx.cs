using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReferenceNews.WebClient.Include
{
    public partial class Header : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (this.Page.User.Identity.IsAuthenticated)
                {
                    lblAuthenticated.Text = "<li>" + this.Page.User.Identity.Name + "</li><li><a href=\"reader\">读者平台</a></li><li><a href=\"author_studio\">作者办公室</a></li> <li><a href=\"logout.aspx\" title=\"退出\">退出</a></li>";
                }
                else
                {
                    lblAuthenticated.Text = "<li class=\"slogn\">参考消息精华版</li> <li><a href=\"login.aspx\" >登录</a></li> <li><a href=\"register.aspx\"  target=\"_blank\">注册</a></li>";
                    
                }
            }

        }
    }
}