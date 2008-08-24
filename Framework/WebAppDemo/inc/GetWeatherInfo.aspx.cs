using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Text;
using System.Xml;
using HtmlAgilityPack;

namespace WebAppDemo.inc
{
    public partial class GetWeatherInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string response = "<span class='city'>潍坊&nbsp;" + "</span><span class=weather>";
            try
            {
                HtmlWeb htmlWeb = new HtmlWeb();
                //HtmlAgilityPack.HtmlDocument doc = htmlWeb.Load("http://weather.tq121.com.cn/mapanel/index1_new.php?city=%CE%AB%B7%BB",  Encoding.GetEncoding("gb2312"));
                HtmlAgilityPack.HtmlDocument doc = htmlWeb.Load("http://weather.tq121.com.cn/mapanel/index1.php?city=%CE%AB%B7%BB", Encoding.GetEncoding("gb2312"));
                HtmlNodeCollection nodes = doc.DocumentNode.SelectNodes("//td");

                foreach (HtmlNode node in nodes)
                {
                    if (node.FirstChild != null && node.FirstChild.Name.ToLower() != "table" && node.FirstChild.Name.ToLower() != "form")
                    {
                        if (node.InnerText.Length > 0 && node.InnerText.Length < 30 && (node.FirstChild.NodeType == HtmlNodeType.Text || node.FirstChild.Name.ToLower() == "span"))
                        {
                            response += node.InnerText;
                        }
                    }
                }
            }
            catch
            {
                response += "抱歉，未能获取气象信息";
            }

            Response.Write(response + "</span>");
        }

        private string OpenUrl(PageInfo pageInfo)
        {
            WebRequest request = WebRequest.Create(pageInfo.Url);
            request.Credentials = CredentialCache.DefaultCredentials;
            WebResponse response = request.GetResponse();

            if (pageInfo.CharSet == "")
            {
                string encoding = response.Headers["Content-Type"];
                if (String.IsNullOrEmpty(encoding))
                {
                    encoding = "utf-8";
                }
                else
                {
                    int startIndex = encoding.ToLower().IndexOf("charset=");
                    if (startIndex > -1)
                    {
                        encoding = encoding.Substring(startIndex + 8);
                    }
                    else
                    {
                        encoding = "utf-8";
                    }
                }
                pageInfo.CharSet = encoding;
            }
            Stream dataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(dataStream, Encoding.GetEncoding(pageInfo.CharSet));
            string responseText = reader.ReadToEnd();

            reader.Close();
            response.Close();

            return responseText;
        }

        private class PageInfo
        {
            public string Url { get; set; }
            public string CharSet { get; set; }
        }
    }
}
