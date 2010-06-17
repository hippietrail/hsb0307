using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace ReferenceNews.WebClient
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string username = Request.Form["email"];
            string password = Request.Form["password"];

            if (System.Web.Security.Membership.ValidateUser(username, password))
            {
                
                //FormsAuthentication.RedirectFromLoginPage(username, false);//_persistCookie.Checked
                FormsAuthentication.SetAuthCookie(username, false);
                Response.Redirect("default.aspx");
            }
        }

        private bool ValidateUser(string username, string password) //Authenticate(
        {
            if (String.IsNullOrEmpty(username) || String.IsNullOrEmpty(password))
            {
                return false;
            }

            MembershipUser user = System.Web.Security.Membership.GetUser(username);
            System.Web.Security.Membership.ValidateUser(username, password);

            //UserRow row = Users.GetById(username, false);

            //if (row != null && row.Password == password)
            //{
            //    SiteUtil.SetString("Username", username);
            //    return true;
            //}

            return false;
        }
    }
}
