<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_Sys_Navimenu_list" ResponseEncoding="utf-8" Codebehind="Navimenu_list.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<link href="../../sysImages/<% Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%"  class="sysmain_navi"  style="PADDING-LEFT: 14px" >�˵�����</td>
          <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�˵�����</div></td>
        </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
  <tr>
     <td><span class="topnavichar" style="PADDING-LEFT: 14px"><a class="topnavichar" href="Navimenu_list.aspx?type=all">���в˵�</a>&nbsp;��&nbsp;<a class="topnavichar" href="Navimenu.aspx">�������ܲ˵�</a>&nbsp;��&nbsp;<a class="topnavichar" href="Navimenu_list.aspx?type=manage">����Ա�˵�</a>&nbsp;��&nbsp;<a class="topnavichar" href="Navimenu_list.aspx?type=user">��Ա�˵�</a>&nbsp;��&nbsp;<a class="topnavichar" href="Navimenu_list.aspx?type=top">�����˵�</a>&nbsp;��&nbsp;<a class="topnavichar" href="Navimenu_list.aspx?type=normal">��ͨ�˵�</a>&nbsp;��&nbsp;<a class="topnavichar" href="Navimenu_list.aspx?type=api">API�˵�</a>&nbsp;��&nbsp;<a class="topnavichar" href="Navimenu_list.aspx?type=sys">ϵͳ�˵�</a>&nbsp;��&nbsp;<a class="topnavichar" href="Navimenu_list.aspx?type=unsys">��ϵͳ�˵�</a></span></td>
  </tr>
</table>
<div id="navimenu_list" runat="server" />


<br />
 <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
   <tr>
     <td align="center"><label id="copyright" runat=server /></td>
   </tr>
</table>

</body>
</html>
