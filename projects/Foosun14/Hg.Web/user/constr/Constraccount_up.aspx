<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" AutoEventWireup="true" Inherits="user_Constraccount_up" Debug="true" Codebehind="Constraccount_up.aspx.cs" %>

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
                  <td colspan="2" style="height: 1px"></td>
                </tr>
                <tr>
                  <td width="57%"  class="sysmain_navi"  style="PADDING-LEFT: 14px" >�˺Ź��</td>
                  <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">�λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="Constrlist.aspx" class="menulist">�����</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />��޸��˺</div></td>
                </tr>
        </table>
      <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
        <tr>
          <td style="padding-left:14px;">          
          <a href="Constr.aspx" class="menulist">ŷ������</a>&nbsp; &nbsp;<a href="Constrlistpass.aspx" class="topnavichar" >������˸</a>&nbsp; &nbsp;<a href="Constrlist.aspx" class="menulist">����¹��</a>&nbsp; &nbsp;<a href="ConstrClass.aspx" class="menulist">������</a>&nbsp; &nbsp;<a href="Constraccount.aspx" class="menulist">��˺Ź��</a>&nbsp; &nbsp;<a href="Constraccount_add.aspx" class="menulist">�����˺</a></td>
        </tr>
        </table>
        <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">

 
    <tr class="TR_BG_list">
    <td class="list_link">
        ���ʵ���</td>
    <td class="list_link">
        <asp:TextBox ID="RealNameBox" runat="server" Width="349px" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:help;" title="���鿴���" onClick="Help('H_Constraccount_add_0001',this)">���</span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="���ʵ������Ϊ�" ControlToValidate="RealNameBox"></asp:RequiredFieldValidator></td>
  </tr>
    <tr class="TR_BG_list">
    <td class="list_link">
        տ������У�</td>
    <td class="list_link">
        <asp:TextBox ID="bankNameBox" runat="server" Width="349px" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:help;" title="���鿴���" onClick="Help('H_Constraccount_add_0002',this)">���</span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="����в���Ϊ�" ControlToValidate="bankNameBox"></asp:RequiredFieldValidator></td>
        
  </tr>
    <tr class="TR_BG_list">
    <td class="list_link">
        տ����</td>
    <td class="list_link">
        <asp:TextBox ID="bankRealNameBox" runat="server" Width="349px" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:help;" title="���鿴���" onClick="Help('H_Constraccount_add_0003',this)">���</span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="�����Ϊ�" ControlToValidate="bankRealNameBox"></asp:RequiredFieldValidator></td>
  </tr>
    <tr class="TR_BG_list">
    <td class="list_link">
        ������˺ţ�</td>
    <td class="list_link">
        <asp:TextBox ID="bankaccountBox" runat="server" Width="349px" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:help;" title="���鿴���" onClick="Help('H_Constraccount_add_0004',this)">���</span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="������˺Ų���Ϊ�" ControlToValidate="bankaccountBox"></asp:RequiredFieldValidator></td>
  </tr>
    <tr class="TR_BG_list">
    <td class="list_link">
        տ��ţ�</td>
    <td class="list_link">
        <asp:TextBox ID="bankcardBox" runat="server" Width="349px" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:help;" title="���鿴���" onClick="Help('H_Constraccount_add_0005',this)">���</span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="�Ų���Ϊ�" ControlToValidate="bankcardBox"></asp:RequiredFieldValidator></td>
  </tr>
   <tr class="TR_BG_list">
    <td class="list_link" width="25%">
        յ�ַ��</td>
    <td class="list_link" width="75%">
       <asp:TextBox ID="addressBox" runat="server" Width="349px" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:help;" title="���鿴���" onClick="Help('H_Constraccount_add_0006',this)">���</span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="��ַ����Ϊ�" ControlToValidate="addressBox"></asp:RequiredFieldValidator></td>
  </tr>

  <tr class="TR_BG_list">
    <td class="list_link">
        �������룺</td>
    <td class="list_link">
        <asp:TextBox ID="postcodeBox" runat="server" Width="349px" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:help;" title="���鿴���" onClick="Help('H_Constraccount_add_0007',this)">���</span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic"
            ErrorMessage="�������벻��Ϊ�" ControlToValidate="postcodeBox"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="�������벻�"
            ValidationExpression="\d{6}" ControlToValidate="postcodeBox"></asp:RegularExpressionValidator></td>
  </tr>
   <tr class="TR_BG_list">
    <td class="list_link"></td>
    <td class="list_link">
        &nbsp; &nbsp;
        <asp:Button ID="Button1" runat="server" Text="�� ύ" OnClick="Button1_Click" CssClass="form"/>
        &nbsp; &nbsp;<input type="reset" name="Submit3"  class="form" value="� ��">
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
