﻿<%@ Page Language="C#" AutoEventWireup="true"   ResponseEncoding="GB2312" %>
<script type="text/C#" runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        //Foosun.Common.Public.savePublicLogFiles("整合登录", "登录", Context.Request.QueryString["username"]);
        
        Response.AppendHeader("P3P", "CP=CURa ADMa DEVa PSAo PSDo OUR BUS UNI PUR INT DEM STA PRE COM NAV OTC NOI DSP COR");
        Foosun.PlugIn.Passport.DPO_Reponse dpo_response = new Foosun.PlugIn.Passport.DPO_Reponse(this.Context);
        dpo_response.DoWork();
    }
     
</script>       