﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class configuration_system_selectNewsspecial : Hg.Web.UI.DialogPage
{
    public configuration_system_selectNewsspecial()
    {
        BrowserAuthor = EnumDialogAuthority.ForAdmin;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Response.CacheControl = "no-cache";
            Response.Expires = 0;
            
        }
    }
}
