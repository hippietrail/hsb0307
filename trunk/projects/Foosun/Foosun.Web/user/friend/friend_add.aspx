<%@ Page Language="C#" AutoEventWireup="true" Inherits="user_friend_add" Codebehind="friend_add.aspx.cs" %>
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
          <td width="57%"  class="sysmain_navi"  style="PADDING-LEFT: 14px" >���ѹ���</td>
          <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="friendList.aspx" class="menulist">���ѹ���</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />��Ӻ���</div></td>
        </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
  <tr>
     <td><span class="topnavichar" style="PADDING-LEFT: 14px"><a href="friendList.aspx" class="menulist">���ѹ���</a>��<a href="friendmanage.aspx" class="menulist">���ѷ���</a>&nbsp;&nbsp; <a href="friend_add.aspx" class="menulist">��Ӻ���</a>&nbsp;&nbsp; <a href="friend_Establishment.aspx" class="menulist">��������</a></span></td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
  
   <tr class="TR_BG_list">
    <td class="list_link" Width="30%">�û���</td>
      <td class="list_link" colspan="4" Width="70%">
          <asp:TextBox ID="usernameBox" runat="server" Width="198px" CssClass="form"></asp:TextBox>&nbsp;&nbsp;<span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('u_friend_add_0001',this)">����</span> &nbsp; &nbsp;
          &nbsp;&nbsp;
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="�û�������Ϊ��" ControlToValidate="usernameBox"></asp:RequiredFieldValidator></td>
  </tr>

  <tr class="TR_BG_list">
    <td class="list_link">���ѷ���</td>
      <td class="list_link" colspan="4">
          <asp:DropDownList ID="friendmanageList" runat="server" Width="205px">
          </asp:DropDownList>&nbsp;&nbsp;<span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('u_friend_add_0001',this)">����</span></td>
  </tr>
       <tr class="TR_BG_list">
            <td class="list_link">
        ������Ϣ</td>
            <td class="list_link">
            <asp:TextBox ID="AddfriendContent" runat="server" Enabled="true" Height="89px" TextMode="MultiLine" Width="284px" CssClass="form"></asp:TextBox>&nbsp;&nbsp;<span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('u_friend_add_0001',this)">����</span> <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddfriendContent" runat="server" ErrorMessage="������Ϣ����Ϊ��" ControlToValidate="AddfriendContent"></asp:RequiredFieldValidator></td>
  </tr>
     
  <tr class="TR_BG_list">
    <td class="list_link"></td>
   <td class="list_link"><asp:Button ID="addfriend" runat="server" Text="��  ��"  OnClick="addfriend_Click"  CssClass="form"/>&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp; &nbsp;
       <input type="reset" name="Submit3" value="��  ��" class="form"></td>   
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
