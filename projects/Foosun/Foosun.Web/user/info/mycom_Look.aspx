<%@ Page Language="C#" AutoEventWireup="true" Inherits="mycom_Look" Codebehind="mycom_Look.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" name="form1" method="post" action="" runat="server">
  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%"  class="sysmain_navi"  style="PADDING-LEFT: 14px" >���۹���</td>
          <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="mycom.aspx" class="menulist">���۹���</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />������Ϣ</div></td>
        </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
  <tr>
     <td><span class="topnavichar" style="PADDING-LEFT: 14px"><a href="mycom.aspx" class="menulist">���۹���</a></td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <tr class="TR_BG_list">
    <td class="list_link" width="25%" style="text-align: right">
        ���۱��⣺</td>
      <td class="list_link" width="75%">
          <asp:TextBox ID="TitleBox" runat="server" Width="280px" CssClass="form" ReadOnly="True"></asp:TextBox>&nbsp;<span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('usermycom_up_0001',this)">����</span>
          </td>
 </tr>
    <tr class="TR_BG_list">
    <td class="list_link" style="text-align: right">�������ݣ�</td>
      <td class="list_link"><asp:TextBox ID="ContentBox" runat="server" Height="98px" TextMode="MultiLine" Width="280px" CssClass="form" ReadOnly="True"></asp:TextBox>&nbsp;<span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('usermycom_up_0002',this)">����</span></td>
 </tr>
    <tr class="TR_BG_list">
    <td class="list_link"></td>
        <td class="list_link"><asp:Button ID="sumbitsave" runat="server" CssClass="form" Text=" ȷ �� "  OnClick="shortCutsubmit" /></td>
 </tr>
</table>
<table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
  <tr>
    <td><div align="center"><%Response.Write(CopyRight); %></div></td>
  </tr>
</table>
</form>
</body>
</html>
