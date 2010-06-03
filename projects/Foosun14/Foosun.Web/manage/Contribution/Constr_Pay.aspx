<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" AutoEventWireup="true" Inherits="manage_Contribution_Constr_Pay" Codebehind="Constr_Pay.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%Response.Write(Hg.Config.UIConfig.HeadTitle); %></title>
<link href="../../sysImages/<%Response.Write(Hg.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>	
</head>
<body style="background-color: #ffffff">
<form id="form1" name="form1" method="post" action="" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%"  class="sysmain_navi"  style="PADDING-LEFT: 14px" >
              Ͷ����</td>
          <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">�λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="Constr_List.aspx" class="topnavichar">�����</a></div></td>
        </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
  <tr>
    <td width="46%" class="navi_link">&nbsp; &nbsp; &nbsp;<a href="Constr_List.aspx" class="topnavichar">�����</a>&nbsp; &nbsp;<a href="Constr_Stat.aspx" class="topnavichar">���ͳ�</a>&nbsp; &nbsp;<a href="paymentannals.aspx" class="topnavichar">�֧����ʷ</a>&nbsp; &nbsp;<a href="Constr_SetParam.aspx" class="topnavichar">����趨</a>&nbsp; &nbsp;<a href="Constr_chicklist.aspx" class="topnavichar">����ͨ����˸�</a></td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <tr class="TR_BG_list">
      <td class="list_link" colspan="4">
      <span>���ѡ���Ҫ֧�������û��
          <asp:Label ID="LblName" runat="server" Width="127px" ForeColor="Red"></asp:Label>
      </span>
     <span id="no" runat="server" width="140px">
     </span>
    <span>���Ҫ֧���ĸ��Ϊ��<label id="money_1" runat="server" />&nbsp;&nbsp;&nbsp;
          <asp:Button ID="Button1" runat="server" Text="����֧��״̬"  CssClass="form" OnClientClick="{if(confirm('ȷ��Ҫ֧���')){return true;}return false;}" OnClick="Button1_Click1"/>
      </span> 
      </td>
    </tr>
    <tr class="TR_BG">
      <td class="list_link" colspan="2">
          &nbsp;
          <asp:Label ID="LblName1" runat="server" ForeColor="Red" Width="80px"></asp:Label>𣿵������˺���Ϣ</td>
      <td class="list_link" colspan="2">
          ����ַ</td>
   </tr>
      <tr class="TR_BG_list">
    <td class="list_link" Width="10%">
        �ʻ��</td>
    <td class="list_link" Width="40%">
        <asp:Label ID="bankRealName" runat="server" Text="Label" Width="100%"></asp:Label></td>
        <td class="list_link" Width="10%">
            ��ַ��</td>
    <td class="list_link" Width="40%">
        <asp:Label ID="address" runat="server" Text="Label" Width="100%"></asp:Label></td>
   </tr>
   <tr class="TR_BG_list">
    <td class="list_link">
        ���ţ�</td>
    <td>
        <asp:Label ID="bankcard" runat="server" Text="Label" Width="100%"></asp:Label></td>
        <td class="list_link">
            �ʱࣺ</td>
    <td class="list_link">
        <asp:Label ID="postcode" runat="server" Text="Label" Width="100%"></asp:Label></td>
</tr>
   <tr class="TR_BG_list">
    <td class="list_link">
        �������У�</td>
    <td>
        <asp:Label ID="bankName" runat="server" Text="Label" Width="100%"></asp:Label></td>
        <td class="list_link">
            ���</td>
    <td class="list_link">
        <asp:Label ID="RealName" runat="server" Text="Label" Width="100%"></asp:Label></td>
</tr>
</table>
<br />
<br />
<table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
  <tr>
    <td><div align="center"><%Response.Write(CopyRight); %> </div></td>
  </tr>
</table>
</form>
</body>
</html>






