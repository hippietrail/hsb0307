<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" AutoEventWireup="true" Inherits="user_arealist_cadd" EnableEventValidation="true"  Codebehind="arealist_cadd.aspx.cs" %>
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
          <td width="57%"  class="sysmain_navi"  style="PADDING-LEFT: 14px" >�������</td>
          <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="userdiscuss_list.aspx" class="menulist">�������</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�����</div></td>
        </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
  <tr>
     <td><span class="topnavichar" style="PADDING-LEFT: 14px">&nbsp; <a href="arealist.aspx" class="menulist">����</a> &nbsp;&nbsp;&nbsp;<a href="arealist_add.aspx" class="menulist">��Ӵ���</a>&nbsp;</span></td>
                <td><span class="topnavichar" style="PADDING-right: 25px" id="pdel" runat="server"></span></td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table" id="addmanage">
  <tr class="TR_BG_list">
    <td class="list_link" Width="25%" style="text-align: right">
        �������ƣ�</td>
    <td class="list_link" Width="75%">
        <asp:DropDownList ID="DropDownList1" runat="server" Width="167px">
        </asp:DropDownList></td>
  </tr>
  <tr class="TR_BG_list">
    <td class="list_link" Width="25%" style="text-align: right">
        С�����ƣ�</td>
    <td class="list_link" Width="75%">
        <asp:TextBox ID="cityName" runat="server" Width="163px" CssClass="form"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="cityName"
            ErrorMessage="������ʡ����"></asp:RequiredFieldValidator></td>
  </tr>
  
    <tr class="TR_BG_list">
    <td class="list_link" Width="25%" style="text-align: right">
        ����</td>
    <td class="list_link" Width="75%">
        <asp:TextBox ID="OrderID" runat="server" MaxLength="2" Width="163" CssClass="form">0</asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="OrderID"
            ErrorMessage="�����������"></asp:RequiredFieldValidator>&nbsp;����Խ��Խ��ǰ��</td>
  </tr>
   <tr class="TR_BG_list">
    <td class="list_link"></td>
    <td class="list_link">
        &nbsp; &nbsp; &nbsp;
        <asp:Button ID="but1" runat="server" Text="��  ��" OnClick="but1_Click" CssClass="form" />
        &nbsp; &nbsp;&nbsp;
        <input type="reset" name="Submit3" value="��  ��" class="form"></td>  
   </tr>
</table>
<table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
  <tr>
    <td><div align="center"><%Response.Write(CopyRight); %> </div></td>
  </tr>
</table>
</form>
</body>
</html>