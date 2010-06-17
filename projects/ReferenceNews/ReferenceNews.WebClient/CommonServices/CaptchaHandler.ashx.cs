using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Husb.Common.Web;

namespace ReferenceNews.WebClient.CommonServices
{
    /// <summary>
    /// $codebehindclassname$ 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class CaptchaHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            //context.Response.ContentType = "text/plain";
            
            //context.Response.Write("Hello World");

            string checkCode = EncryptUtil.GetRandWord(5);
            context.Response.Cookies.Add(new HttpCookie("CheckCode", checkCode));

            WebUtil.CreateCheckImage(checkCode);
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
