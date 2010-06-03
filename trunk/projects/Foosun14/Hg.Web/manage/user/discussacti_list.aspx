﻿<%@ Page Language="C#" ContentType="text/html" AutoEventWireup="true" Inherits="manage_user_discussacti_list" Codebehind="discussacti_list.aspx.cs" %>
<%@ Import NameSpace="System.Data"%>
<%@ Register Src="../../controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<link href="../../sysImages/<%Response.Write(Hg.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>	
</head>
<body style="background-color: #ffffff">
<form id="form1" name="form1" method="post" action="" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%"  class="sysmain_navi"  style="PADDING-LEFT: 14px" >讨论组管理</td>
          <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">位置导航：<a href="../main.aspx" target="sys_main" class="list_link">首页</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="userdiscuss_list.aspx" class="menulist">讨论组管理</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />讨论组活动列表</div></td>
        </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
  <tr>
     <td><span class="topnavichar" style="PADDING-LEFT: 14px"><a href="userdiscuss_list.aspx" class="menulist">讨论组</a>┋<a href="discussacti_list.aspx" class="menulist">讨论组活动</a>┋<a href="discussclass.aspx" class="menulist">讨论组分类</a>┋<a href="discussacti.aspx" class="menulist"><span
             style="color: #ff6666">添加讨论组活动</span></a>┋<asp:TextBox ID="dicname" runat="server"></asp:TextBox>&nbsp;&nbsp;<asp:Button ID="selss" runat="server" Text="搜　索" CssClass="form" OnClick="selss_Click"/></span><span id="channelList" runat="server" /></td>
     <td><span class="topnavichar" style="PADDING-right: 25px" id="pdel" runat="server"></span></td>
  </tr>
</table>
<div id="no" runat="server"></div>
<asp:Repeater ID="DataList1" runat="server" >
    <HeaderTemplate>
    <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
    <tr class="TR_BG">
    <td class="sys_topBg" align="left" width="40%">活动名称</td>
    <td class="sys_topBg" align="center" width="15%">建立人</td>
    <td class="sys_topBg" align="center" width="15%">创建时间</td>
    <td class="sys_topBg" align="center" width="15%">参加人数</td>
    <td class="sys_topBg" align="center" width="15%">操作&nbsp; &nbsp;<input type="checkbox" name="Checkbox1" onclick="javascript:selectAll(this.form,this.checked)" /></td>
    </tr>
    <div id="tnzlist" runat="server"></div>
    </HeaderTemplate>
    <ItemTemplate>
        <tr class="TR_BG_list">
        <td class="list_link" align="left" width="40%"><%#((DataRowView)Container.DataItem)[2]%></td>
        <td class="list_link" align="center" width="15%"><%#((DataRowView)Container.DataItem)[3]%></td>
        <td class="list_link" align="center" width="15%"><%#((DataRowView)Container.DataItem)[8]%></td>
        <td class="list_link" align="center" width="15%"><%#((DataRowView)Container.DataItem)[6]%></td>
        <td class="list_link" align="center" width="15%"><%#((DataRowView)Container.DataItem)[7]%></td>            
        </tr>
     </ItemTemplate>
     <FooterTemplate>
     </table>
     </FooterTemplate>
</asp:Repeater>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="2">
<tr><td align="right" style="width: 928px"><uc1:PageNavigator ID="PageNavigator1" runat="server" /></td></tr>
</table>
<table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
  <tr>
    <td><div align="center"><%Response.Write(CopyRight); %></div></td>
  </tr>
</table>
</form>
</body>
<script language="javascript" type="text/javascript">
function del(ID)
{
   if(confirm("你确定要删除吗?"))
   { 
        self.location="?Type=del&ID="+ID;
   }
}
function PDel()
{
    if(confirm("你确定要彻底删除吗?"))
    {
	    document.form1.action="?Type=PDel";
	    document.form1.submit();
	}
}
   function getchanelInfo(obj)
    {
       var SiteID=obj.value;
       window.location.href="?SiteID="+SiteID+"";
    }
</script>
</html>
