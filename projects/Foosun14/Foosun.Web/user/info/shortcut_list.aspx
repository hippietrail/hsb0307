<%@ Page Language="C#" AutoEventWireup="true" Inherits="user_info_shortcut_list"  ResponseEncoding="utf-8" Codebehind="shortcut_list.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<link href="../../sysImages/<% Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%" height="32" class="sysmain_navi"  style="PADDING-LEFT: 14px" >��ݷ�ʽ����</td>
          <td width="43%" height="32" class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />��ݷ�ʽ����</div></td>
        </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
  <tr>
          <td style="padding-left:14px;"><a class="topnavichar" href="shortcut_list.aspx">�����ݷ�ʽ</a>��<a class="topnavichar" href="shortcut.aspx">������ݷ�ʽ</a></td>
  </tr>
</table>
<div id="shortcut_list" runat="server" />

<table width="98%" border="0" cellspacing="0" cellpadding="5" align="center">
  <tr>
    <td class="reshow">ע�⣺�������������20����ݷ�ʽ</td>
  </tr>
</table>
<br />
<br />
 <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
   <tr>
     <td align="center"><label id="copyright" runat=server /></td>
   </tr>
</table>

</body>
</html>