<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" AutoEventWireup="true" Inherits="user_discussclass_add" EnableEventValidation="false"  Codebehind="discussclass_add.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-color: #ffffff">
<form id="form1" name="form1" method="post" action="" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%"  class="sysmain_navi"  style="PADDING-LEFT: 14px" >讨论组管理</td>
          <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">位置导航：<a href="../main.aspx" target="sys_main" class="list_link">首页</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="userdiscuss_list.aspx" class="menulist">讨论组管理</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />添加讨论组分类</div></td>
        </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
  <tr>
     <td><span class="topnavichar" style="PADDING-LEFT: 14px"><a href="userdiscuss_list.aspx" class="menulist">讨论组</a>
         &nbsp; <a href="userdiscuss_list.aspx" class="menulist">讨论组活动</a> &nbsp;&nbsp; <a href="discussclass.aspx" class="menulist">讨论组分类</a> &nbsp;&nbsp; <a href="discussclass_add.aspx" class="menulist"><span style="color: #ff6666">添加讨论组分类</span></a></span></td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table" id="addmanage">
  <tr class="TR_BG_list">
    <td class="list_link" Width="25%">
        讨论组分类名称</td>
    <td class="list_link" Width="75%">
        <asp:TextBox ID="Cname" runat="server" Width="314px" CssClass="form"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Cname"
            ErrorMessage="请输入讨论组分类名称"></asp:RequiredFieldValidator></td>
  </tr>

    <tr class="TR_BG_list">
    <td class="list_link" Width="25%">
        讨论组分类描述分类</td>
    <td class="list_link" Width="75%">
        <asp:TextBox ID="Content" runat="server" Height="77px" TextMode="MultiLine" Width="314px" CssClass="form"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Content"
            ErrorMessage="请输入讨论组分类描述"></asp:RequiredFieldValidator></td>
  </tr>

   <tr class="TR_BG_list">
    <td class="list_link"></td>
    <td class="list_link">
        &nbsp; &nbsp; &nbsp;
        <asp:Button ID="but1" runat="server" Text="提  交" OnClick="but1_Click" CssClass="form" />
        &nbsp; &nbsp;&nbsp;
        <input type="reset" name="Submit3" value="重  置" class="form"></td>  
   </tr>
</table>
<table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
  <tr>
    <td><div align="center"><%Response.Write(CopyRight); %></div> </div></td>
  </tr>
</table>
</form>
</body>
</html>