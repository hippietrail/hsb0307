﻿<%@ Page Language="C#" AutoEventWireup="true"   ResponseEncoding="GB2312" %>
<script type="text/C#" runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        
        System.Diagnostics.Process.Start("notepad.exe");
        Response.AppendHeader("P3P", "CP=CURa ADMa DEVa PSAo PSDo OUR BUS UNI PUR INT DEM STA PRE COM NAV OTC NOI DSP COR");
        Hg.PlugIn.Passport.DPO_Reponse dpo_response = new Hg.PlugIn.Passport.DPO_Reponse(Context);
        dpo_response.DoWork();
    }
     
</script> 
