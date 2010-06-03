using System;
using System.Collections.Generic;
using Hg.Model;

public partial class manage_label_FreeLabel_Ajax : Hg.Web.UI.ManagePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.Form["Option"] != null)
            {
                Hg.CMS.FreeLabel fb = new Hg.CMS.FreeLabel();
                if (Request.Form["Option"].Equals("GetFields"))
                {
                    if (Request.Form["TableName"] != null && !Request.Form["TableName"].Equals(""))
                    {
                        IList<FreeLablelDBInfo> fds = fb.GetFields(Request.Form["TableName"]);
                        int i = 0;
                        foreach (FreeLablelDBInfo info in fds)
                        {
                            if (i > 0)
                                Response.Write(",");
                            Response.Write(info.Name);
                            i++;
                        }
                    }

                }
                else if (Request.Form["Option"].Equals("TestSQL"))
                {
 
                }
            }
        }
        Response.End();
    }
}
