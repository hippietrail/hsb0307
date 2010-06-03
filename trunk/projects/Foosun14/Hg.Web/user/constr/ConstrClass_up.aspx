<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" AutoEventWireup="true" Inherits="user_ConstrClass_up" Debug="true" Codebehind="ConstrClass_up.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="../../sysImages/<%Response.Write(Hg.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
</head>
<body><form id="form1" name="form1" method="post" action="" runat="server"> 
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
    <tr>
      <td height="1" colspan="2"></td>
    </tr>
    <tr>
      <td width="57%"  class="sysmain_navi"  style="PADDING-LEFT: 14px" >������</td>
      <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">�λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="Constrlist.aspx" class="menulist">���¹��</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />������</div></td>
    </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable"> 
    <tr>
      <td style="padding-left:14px;">          
      <a href="Constr.aspx" class="menulist">��������</a>&nbsp; &nbsp;<a href="Constrlistpass.aspx" class="topnavichar" >������˸</a>&nbsp; &nbsp;<a href="Constrlist.aspx" class="menulist">����¹��</a>&nbsp; &nbsp;<a href="ConstrClass.aspx" class="menulist">������</a>&nbsp; &nbsp;<a href="Constraccount.aspx" class="menulist">��˺Ź��</a></td>
      <td align="right" style="padding-right:28px;">���<a href="#" class="menulist" onclick="Constrclass(1);">�������</a></td>
    </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table" >
  <tr class="TR_BG_list">
    <td class="list_link" width="25%">������</td>
    <td class="list_link" width="75%">
        <asp:TextBox ID="cNameBox" runat="server" Width="325px" CssClass="form" MaxLength="14"></asp:TextBox><span class="helpstyle" style="cursor:help;" title="Ƶ��鿴���" onClick="Help('H_ConstrClass_up_0001',this)">���</span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="cNameBox" ErrorMessage="������������"></asp:RequiredFieldValidator></td>
  </tr>
  <tr class="TR_BG_list">
    <td class="list_link">Ʒ������</td>
    <td class="list_link">
        <asp:TextBox ID="ContentBox" runat="server" Height="107px" TextMode="MultiLine" Width="325px" CssClass="form"></asp:TextBox>
        <span class="helpstyle" style="cursor:help;" title="���鿴���" onClick="Help('H_ConstrClass_up_0002',this)">���</span>
    </td>
  </tr>
   <tr class="TR_BG_list">
    <td class="list_link"></td>
    <td class="list_link">&nbsp; &nbsp;
        <asp:Button ID="Button1" runat="server" Text="�� ύ" OnClick="Button1_Click" CssClass="form" />&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="�� �" CssClass="form"/>
    </td>
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