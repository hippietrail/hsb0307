<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" AutoEventWireup="true" Inherits="user_Photoalbum" Debug="true" Codebehind="Photoalbum.aspx.cs" %>
<%@ Register Src="../../controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<%@ Import NameSpace="System.Data"%>
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
      <td width="57%"  class="sysmain_navi"  style="PADDING-LEFT: 14px" >�����</td>
      <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">�λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="Photoalbum.aspx" target="sys_main" class="list_link">�����</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />������</div></td>
    </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
  <tr>
     <td><span class="topnavichar" style="PADDING-LEFT: 14px"><a href="Photoalbumlist.aspx" class="menulist">������ҳ</a>��<a href="photo_add.aspx" class="menulist">���ͼƬ</a>&nbsp;&nbsp;<a href="photoclass.aspx" class="menulist">�����</a> &nbsp;&nbsp; <a href="Photoalbum.aspx" class="menulist">������</a></span></td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table" id="insert">
  <tr class="TR_BG_list">
    <td class="list_link" width="25%" style="text-align: right">
        ������ƣ�</td>
    <td class="list_link" width="75%">
        <asp:TextBox ID="PhotoalbumName" runat="server" Width="241px" CssClass="form" MaxLength="14"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="PhotoalbumName"
            ErrorMessage="�������Ϊ�"></asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr class="TR_BG_list">
    <td class="list_link" width="25%" style="text-align: right">����Ȩ�ޣ�</td>
    <td class="list_link" width="75%">
        &nbsp;<input id="Radio1" type="radio" onclick="DispChanges()" runat="server" />�����˿����ϴ� &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<input id="Radio2" type="radio" runat="server" onclick="DispChanges()" checked="true"/>ֻ�������ϴ�</td>
  </tr>
  <tr class="TR_BG_list" style="display:none" id="numbers">
    <td class="list_link" width="25%" style="text-align: right">����ϴ�ͼƬ��Ŀ��</td>
    <td class="list_link" width="75%">&nbsp;<asp:TextBox ID="number" runat="server" Width="235px" CssClass="form">0</asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="number" ErrorMessage="������ĸ�ʽ���" ValidationExpression="^[1-9]\d*|0$"></asp:RegularExpressionValidator>
    </td>
  </tr>
    <tr class="TR_BG_list">
    <td class="list_link" width="25%" style="text-align: right">�������ͣ�</td>
    <td class="list_link" width="75%">&nbsp;<asp:DropDownList ID="Photoalbum" runat="server" Width="141px"></asp:DropDownList>&nbsp; &nbsp;<input type="checkbox" id="chkAdvance" onclick="DispChange()" />���뱣��
    </td>
  </tr>
    <tr class="TR_BG_list" id="pwd" style="display:none">
    <td class="list_link" width="25%" style="text-align: right" >���룺</td>
    <td class="list_link" width="75%">
        <asp:TextBox ID="pwd" runat="server" Width="242px" Height="18px" CssClass="form" TextMode="Password"></asp:TextBox>
    </td>
  </tr>
  <tr class="TR_BG_list" id="pwds" style="display:none">
    <td class="list_link" width="25%" style="text-align: right">ȷ�����룺</td>
    <td class="list_link" width="75%"><asp:TextBox ID="pwds" runat="server" Width="242px" Height="18px" CssClass="form" TextMode="Password"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="pwd" ControlToValidate="pwds" ErrorMessage="������벻һ�"></asp:CompareValidator>
    </td>
  </tr>
  <tr class="TR_BG_list">
    <td class="list_link"></td>
    <td class="list_link">
        <asp:Button ID="Button1" runat="server" Text="´� ��" Width="75px" OnClick="Button1_Click"  CssClass="form"/>
        &nbsp;&nbsp;&nbsp;
        <input name="reset" type="reset" value=" � �� "  class="form"/>
    </td>
  </tr>
</table>
<table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
  <tr>
    <td style="height: 74px"><div align="center"><%Response.Write(CopyRight); %>  </div></td>
  </tr>
</table>
</form>
</body>
</html>
<script language="javascript">
function DispChange()
{
    var obj = document.getElementById("chkAdvance").checked;
    if(obj)
    {
            document.getElementById("pwd").style.display="";
            document.getElementById("pwds").style.display="";
    }
    else
    {
            document.getElementById("pwds").style.display="none";
            document.getElementById("pwd").style.display="none";
    }
}
function DispChanges()
{
    var obj = document.getElementById("Radio1").checked;
    var objs = document.getElementById("Radio2").checked;
    if(obj)
    {
            document.getElementById("numbers").style.display="";
    }
    if(objs)
    {
            document.getElementById("numbers").style.display="none";
    }
}
</script>