<%@ Page Language="C#" AutoEventWireup="true" Inherits="user_info_shortcut" Codebehind="shortcut.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<link href="../../sysImages/<% Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%" height="32" class="sysmain_navi"  style="PADDING-LEFT: 14px" >������ݷ�ʽ</td>
          <td width="43%" height="32" class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />��ݷ�ʽ</div></td>
        </tr>
</table>
      <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
        <tr>
          <td style="padding-left:14px;"><a class="topnavichar" href="shortcut_list.aspx">�����ݷ�ʽ</a>��<a class="topnavichar" href="shortcut.aspx">������ݷ�ʽ</a></td>
        </tr>
</table>
      <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="table">
        <form id="form1" runat="server"><tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">�������</div></td>
          <td class="list_link"><asp:TextBox ID="qName" runat="server"  Width="250"  MaxLength="50" CssClass="form"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_shortcut_0001',this)">����</span><asp:RequiredFieldValidator ID="f_qName" runat="server" ControlToValidate="qName" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����д��ݲ˵����ƣ�����Ϊ50�ֽ�</span>"></asp:RequiredFieldValidator></td>
        </tr>                                                                                                                                                                                                                                                                                             
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">����·��</div></td>
          <td class="list_link"><asp:TextBox ID="FilePath" runat="server" Width="250" MaxLength="200" CssClass="form"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onClick="Help('H_shortcut_0002',this)">����</span><asp:RequiredFieldValidator ID="f_FilePath" runat="server" ControlToValidate="FilePath" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����д��ݲ˵�����·��������Ϊ200�ֽ�</span>"></asp:RequiredFieldValidator></td>
        </tr>
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">����˳��</div></td>
          <td class="list_link">
          <asp:TextBox ID="orderID" runat="server" value="0" Width="100" />
           <asp:HiddenField ID="action_edit" runat="server" />
           <asp:HiddenField ID="action_id" runat="server" />
          <span class="helpstyle" style="cursor:help"; title="����鿴����"  onclick="Help('H_shortcut_0003',this)">����</span><asp:RequiredFieldValidator ID="f_orderID_1" runat="server" ControlToValidate="orderID" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����д���</span>"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="f_orderID" runat="server" ControlToValidate="orderID"  Display="Static" ErrorMessage="(*)������Ų���ȷ" ValidationExpression="^[0-9]{0,2}"></asp:RegularExpressionValidator></td>
        </tr>
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px; height: 28px;">&nbsp;</td>
          <td class="list_link" style="height: 28px">&nbsp;<asp:Button ID="sumbitsave" runat="server" CssClass="form" Text=" ȷ �� "  OnClick="shortCutsubmit" />
            <input name="reset" type="reset" value=" �� �� "  class="form">          </td>
        </tr>
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px; height: 28px;">&nbsp;</td>
          <td class="list_link" style="height: 28px">���ʹ�ÿ�ݷ�ʽ���鿴<span class="helpstyle" style="cursor:help"  onclick="Help('H_shortcut_0004',this)">����</span></td>
        </tr>
</form>
</table>
<br />
<br />
 <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
   <tr>
     <td align="center"><label id="copyright" runat=server /></td>
   </tr>
 </table>

</body>
</html>
 