using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace ReferenceNews.WebClient
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // 这里 username 用的是 email.Value：用邮箱做会员帐号
            MembershipCreateStatus status;// = MembershipCreateStatus.Success;
            MembershipUser user = System.Web.Security.Membership.CreateUser(
                email.Value, 
                password.Value, 
                email.Value, 
                "Password Question",
                "Password Answer", 
                true, //isAproved
                out status
                );

            FormsAuthentication.SetAuthCookie(email.Value, false);

            Response.Redirect("RegisterSuccess.aspx");
        }
    }
}
