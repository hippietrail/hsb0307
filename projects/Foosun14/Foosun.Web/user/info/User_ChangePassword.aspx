<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" Inherits="User_ChangePassword" Codebehind="User_ChangePassword.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%" height="32" class="sysmain_navi"  style="PADDING-LEFT: 14px" >�޸�����</td>
          <td width="43%" height="32" class="topnavichar"  style="PADDING-LEFT: 14px" >λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�޸�����</td>
        </tr>
</table>
       <form id="form1" runat="server">
       <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="table">
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">����ԭ������</div></td>
          <td class="list_link"><asp:TextBox ID="oPass" runat="server"  Width="250"  MaxLength="20" TextMode="Password"  CssClass="form"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_ChangePass_0001',this)">����</span><asp:RequiredFieldValidator ID="f_oPass" runat="server" ControlToValidate="oPass" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����дԭʼ����</span>"></asp:RequiredFieldValidator></td>
        </tr>                                                                                                                                                                                                                                                                                             
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">������</div></td>
          <td class="list_link"><asp:TextBox ID="newPass" runat="server" Width="250" MaxLength="20" TextMode="Password" CssClass="form"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_ChangePass_0002',this)">����</span><asp:RequiredFieldValidator ID="f_newPass" runat="server" ControlToValidate="newPass" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����д������</span>"></asp:RequiredFieldValidator>
          </td>
        </tr> 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">ȷ������</div></td>
          <td class="list_link">
          <asp:TextBox ID="pnewPass" runat="server"  Width="250" TextMode="Password" CssClass="form" /> 
          <span class="helpstyle" style="cursor:help"; title="����鿴����"  onclick="Help('H_ChangePass_0003',this)">����</span>&nbsp;
              <asp:CompareValidator ID="f_pnewPass" runat="server" ControlToCompare="pnewPass"
                  ControlToValidate="newPass" ErrorMessage="(*)2��������д��һ�£�"></asp:CompareValidator></td>
        </tr>
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px; height: 28px;">&nbsp;</td>
          <td class="list_link" style="height: 28px">&nbsp;<asp:Button ID="sumbitsave" runat="server" onclick="saveSumbit" CssClass="form" Text=" �ޡ��� " />
            <input name="reset" type="reset" value=" �� �� "  class="form"/>         </td>
        </tr>

</table> </form>
<br />
<br />
 <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
   <tr>
     <td align="center"><%Response.Write(CopyRight); %></td>
   </tr>
 </table>

</body>
</html>