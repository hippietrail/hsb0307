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
    public class MembershipHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            
            string username = context.Request.Form["username"];
            string password = context.Request.Form["password"];

            string returnValue = "";

            if (context.Request.QueryString["action"] == "check")
            {

                returnValue = "1";
            }

            // 
            if (context.Request.QueryString["action"] == "check_captcha")
            {
                //context.Response.ContentType = "application/json;charset=UTF-8";
                returnValue = "1";
            }

            context.Response.Write(returnValue);
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
