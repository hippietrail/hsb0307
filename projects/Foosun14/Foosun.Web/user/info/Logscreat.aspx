<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_Logscreat" ResponseEncoding="utf-8" Codebehind="Logscreat.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<link href="../../sysImages/<% Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
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
          <td width="57%" height="32" class="sysmain_navi"  style="PADDING-LEFT: 14px" >��������</td>
          <td width="43%" height="32" class="topnavichar"  style="PADDING-LEFT: 14px" >λ�õ�����<a href="main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />��������</td>
        </tr>
</table>
      <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
        <tr>
          <td style="PADDING-LEFT: 14px;"><a class="topnavichar" href="logs.aspx">��������</a>��<a class="topnavichar" href="logsCreat.aspx">��������</a></td>
        </tr>
      </table>
      <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="table">
        
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">��������</div></td>
          <td class="list_link"><asp:TextBox ID="title" runat="server"  Width="250"  MaxLength="50" CssClass="form"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_logscreat_0001',this)">����</span><asp:RequiredFieldValidator ID="f_title" runat="server" ControlToValidate="title" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����д�������⣬����Ϊ50</span>"></asp:RequiredFieldValidator></td>
        </tr>                                                                                                                                                                                                                                                                                             
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">��������</div></td>
          <td class="list_link"><asp:TextBox ID="LogDateTime" runat="server" Width="250" MaxLength="200" CssClass="form"></asp:TextBox><input type="button" value="ѡ������"  onclick="selectFile('date',document.form1.LogDateTime,160,400);document.form1.LogDateTime.focus();" />
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onClick="Help('H_logscreat_0002',this)">����</span><asp:RequiredFieldValidator ID="f_LogDateTime" runat="server" ControlToValidate="LogDateTime" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����д���ڡ���ʽΪ��2007-2-14</span>"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="f_LogDateTime1" runat="server"  ControlToValidate="LogDateTime"  ErrorMessage="��ȷ��д����"
                  ValidationExpression="^[12]{1}(\d){3}[-][01]?(\d){1}[-][0123]?(\d){1}$"></asp:RegularExpressionValidator></td>
        </tr> 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px; height: 112px;"><div align="right">�¼�����</div></td>
          <td class="list_link" style="height: 112px"><asp:TextBox ID="Content" runat="server" Width="400" TextMode="MultiLine" Height="100px" CssClass="form"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onClick="Help('H_logscreat_0003',this)">����</span></td>
        </tr>
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">��ǰ����</div></td>
          <td class="list_link">
          <asp:TextBox ID="dateNum" runat="server" value="0" Width="100"  CssClass="form"/> ��
          <span class="helpstyle" style="cursor:help"; title="����鿴����"  onclick="Help('H_logscreat_0004',this)">����</span><asp:RequiredFieldValidator ID="f_dateNum" runat="server" ControlToValidate="dateNum" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����д��Ҫ��ǰ���ѵ�����</span>"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="f_dateNum1" runat="server" ControlToValidate="dateNum"  Display="Static" ErrorMessage="(*)��ǰ���ѵĸ�ʽ����ȷ������д������" ValidationExpression="^[0-9]{0,2}"></asp:RegularExpressionValidator></td>
        </tr>
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px; height: 28px;">&nbsp;</td>
          <td class="list_link" style="height: 28px">&nbsp;<asp:Button ID="sumbitsave" runat="server" CssClass="form" Text=" ȷ �� "  OnClick="Logssubmit" />
            <input name="reset" type="reset" value=" �� �� "  class="form"><asp:HiddenField ID="log_id" runat="server" />         </td>
        </tr>

</table>
<br />
<br />
 <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
   <tr>
     <td align="center"><label id="copyright" runat=server /></td>
   </tr>
 </table>
</form>
</body>
</html>