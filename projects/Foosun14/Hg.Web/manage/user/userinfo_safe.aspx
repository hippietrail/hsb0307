<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" Inherits="manage_user_userinfo_safe" Codebehind="userinfo_safe.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
 <title></title>
<link href="../../sysImages/<% Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
      <form id="form1" runat="server">
      
      
     <table width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
            <tr>
              <td height="1" colspan="2"></td>
            </tr>
            <tr>
              <td width="57%" height="32" class="sysmain_navi"  style="PADDING-LEFT: 14px" >�޸Ļ�Ա����</td>
              <td width="43%" height="32" class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="userlist.aspx" class="list_link">��Ա����</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />��ȫ����</div></td>
            </tr>
    </table>
          <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
            <tr>
              <td style="padding-left:14px;"><a class="topnavichar" href="userinfo.aspx?id=<% Response.Write(Request.QueryString["id"]);%>">������Ϣ</a>��<a class="topnavichar" href="userinfo_contact.aspx?id=<% Response.Write(Request.QueryString["id"]);%>">��ϵ����</a>��<a class="topnavichar" href="userinfo_safe.aspx?id=<% Response.Write(Request.QueryString["id"]);%>"><font color="red">��ȫ����</font></a>��<a class="topnavichar" href="userinfo_base.aspx?id=<% Response.Write(Request.QueryString["id"]);%>">����״̬/ʵ����֤</a></td>
            </tr>
    </table>

      <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="table">
       
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">������</div></td> 
          <td class="list_link"><asp:TextBox CssClass="form" TextMode="Password" ID="oldpassword" runat="server"  Width="250"  MaxLength="20"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_userinfo_safe_0004',this)">����</span><asp:RequiredFieldValidator ID="f_oldpassword" runat="server" ControlToValidate="oldpassword" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����д�����룬����Ϊ3-18</span>"></asp:RequiredFieldValidator></td>
          </tr>
          
                  <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">ȷ��������</div></td> 
          <td class="list_link"><asp:TextBox CssClass="form" TextMode="Password" ID="password" runat="server"  Width="250"  MaxLength="20"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_userinfo_safe_0003',this)">����</span><asp:RequiredFieldValidator ID="f_password" runat="server" ControlToValidate="password" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����дȷ�����룬����Ϊ3-18</span>"></asp:RequiredFieldValidator></td>
          </tr>

        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">��������</div></td> 
          <td class="list_link"><asp:TextBox CssClass="form" ID="PassQuestion" runat="server"  Width="250"  MaxLength="20"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_userinfo_safe_0001',this)">����</span><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PassQuestion" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����д��������</span>"></asp:RequiredFieldValidator></td>
          </tr>
          
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">�����</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="PassKey" runat="server"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_safe_0002',this)">����</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="PassKey" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����д�����</span>"></asp:RequiredFieldValidator></td>
        </tr>
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px; height: 28px;">&nbsp;</td>
          <td class="list_link" style="height: 28px">&nbsp;<asp:Button ID="sumbitsave" runat="server" CssClass="form" Text=" ȷ �� "  OnClick="submitSave" />
            <input name="reset" type="reset" value=" �� �� "  class="form"><asp:HiddenField ID="suid" runat="server" />          </td>
        </tr>

</table></form>
<br />
<br />
 <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
   <tr>
     <td align="center"><label id="copyright" runat=server /></td>
   </tr>
 </table>

</body>
</html>
