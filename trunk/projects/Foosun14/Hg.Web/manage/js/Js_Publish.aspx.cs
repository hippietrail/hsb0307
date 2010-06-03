using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Drawing;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Hg.Model;

namespace Hg.Web.manage.js
{
    public partial class Js_Publish : Hg.Web.UI.ManagePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ids = Request.QueryString["ids"];
            if (string.IsNullOrEmpty(ids))
            {
                Response.Write("û���κ�Ҫ���µ�js");
                Response.End();
            }
            int sucNum = 0;
            int errNum = 0;
            string[] ida = ids.Split(',');
            Hg.CMS.NewsJS nj = new Hg.CMS.NewsJS();
            for (int i = 0; i < ida.Length; i++)
            {
                try
                {
                    int tid = Convert.ToInt32(ida[i]);
                    NewsJSInfo nji = nj.GetSingle(tid);
                    nj.EstablishJsFile(nji);
                    sucNum++;
                }
                catch
                {
                    errNum++;
                }
            }
            Response.Write(String.Format("�ɹ�����{0}����ʧ��{1}��", sucNum, errNum));
            Response.End();
        }
    }
}
