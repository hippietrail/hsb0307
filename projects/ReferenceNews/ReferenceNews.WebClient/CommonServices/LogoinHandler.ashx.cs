using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace ReferenceNews.WebClient.CommonServices
{
    /// <summary>
    /// $codebehindclassname$ 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class LogoinHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string isAuthenticated = "haha";
            string username = context.Request.Form["username"];
            string password = context.Request.Form["password"];
            if (context.User.Identity.IsAuthenticated)
            {
                isAuthenticated = "已验证，你提供的certification为：username：" + username + "   password:" + password;
            }
            else
            {
                isAuthenticated = "未验证";
            }
            context.Response.Write(isAuthenticated);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
