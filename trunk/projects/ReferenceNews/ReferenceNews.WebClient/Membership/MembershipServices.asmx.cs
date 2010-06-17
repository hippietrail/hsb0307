using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Security;

namespace ReferenceNews.WebClient.Membership
{
    /// <summary>
    /// MembershipServices 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消对下行的注释。
    // [System.Web.Script.Services.ScriptService]
    public class MembershipServices : System.Web.Services.WebService
    {

        [WebMethod]
        public MembershipUser CreateUser(string username, string password)
        {
            MembershipCreateStatus status;
            MembershipUser user = System.Web.Security.Membership.CreateUser(
                username,
                password,
                username,
                "Password Question",
                "Password Answer",
                true, //isAproved
                out status
                );
            return user;
            //FormsAuthentication.SetAuthCookie(username, false);
        }

        [WebMethod]
        public bool Login(string username, string password)
        {
            return System.Web.Security.Membership.ValidateUser(username, password);
            
            //FormsAuthentication.SetAuthCookie(username, false);
        }


    }
}
