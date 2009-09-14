<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_Sys_DefineTable_Edit_List" Codebehind="DefineTable_Edit_List.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<script language="javascript" type="text/javascript" src="../../Editor/scripts/editor.js"></script>
</head>
<body>
<form id="form1" runat="server">
  <table id="top1" width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
    <tr>
      <td height="1" colspan="2"></td>
    </tr>
    <tr>
      <td width="57%"  class="sysmain_navi"  style="PADDING-LEFT: 14px" >���/�޸��Զ����ֶ�</td>
      <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�Զ����ֶ�</div></td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="Navitable" align="center">
    <tr>
      <td style="padding-left:15px;"><a href="DefineTable_Manage.aspx" class="topnavichar">�������</a>&nbsp;��&nbsp;<a href="DefineTable.aspx" class="topnavichar">�����ֶ�</a>&nbsp;��&nbsp;<a href="DefineTable_Manage.aspx?action=add" class="topnavichar">��������</a></td>
    </tr>
  </table>
  <table width="98%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#FFFFFF" class="table">
    <tr class="TR_BG">
      <td align=left valign="middle" colspan="2" height="20">�޸��Զ����ֶ���Ϣ</td>
    </tr>
    <tr class="TR_BG_list">
      <td width="215" height="20" align="right" valign="middle"> ѡ�����</td>
      <td width="705" height="20" align="left" valign="middle"><asp:DropDownList ID="ColumnsType" runat="server" CssClass="form"> </asp:DropDownList></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="right" height="20" valign="middle"> �ֶ��������ƣ�</td>
      <td align="left" height="20" valign="middle"><asp:TextBox ID="DefName" runat="server" CssClass="form"></asp:TextBox>
        &nbsp;<span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('Def_Table_001',this)">����</span>&nbsp;
        <asp:RequiredFieldValidator ID="f_menuName" runat="server" ControlToValidate="DefName" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����д�ֶ���������,���Ȳ��ܳ���20�������ַ�!</span>"></asp:RequiredFieldValidator></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="right" height="20" valign="middle"> �ֶ���(Ӣ����)��</td>
      <td align="left" height="20" valign="middle"><asp:TextBox ID="DefEname" runat="server" CssClass="form"></asp:TextBox>
        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ӣ�����Ʊ�����Ӣ�Ļ����ּ��»���!" ControlToValidate="DefEname" Display="Dynamic" SetFocusOnError="True" ValidationExpression="^[a-zA-Z_0-9__]+$"></asp:RegularExpressionValidator>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DefEname" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����д�ֶ�Ӣ������,���Ȳ��ܳ���50���ַ�!</span>"></asp:RequiredFieldValidator><span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('Def_Table_002',this)">����</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="right" height="20" valign="middle"> �ؼ����ͣ�</td>
      <td align="left" height="20" valign="middle">
      <asp:DropDownList ID="DefType" runat="server" CssClass="form">
        <asp:ListItem Value="1">�����ı���(text)</asp:ListItem>
        <asp:ListItem Value="2">�����б�(select)</asp:ListItem>
        <asp:ListItem Value="3">��ѡ��ť(radio)</asp:ListItem>
        <asp:ListItem Value="4">��ѡ��ť(checkbox)</asp:ListItem>
        <asp:ListItem Value="6">ѡ��ͼƬ(img)</asp:ListItem>
        <asp:ListItem Value="7">ѡ���ļ�(files)</asp:ListItem>
        <asp:ListItem Value="8">�����ı���(ntext)</asp:ListItem>
        <asp:ListItem Value="9">�����(password)</asp:ListItem>
       </asp:DropDownList>
        &nbsp;<span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('Def_Table_003',this)">����</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="right" height="20" valign="middle"> �Ƿ�����Ϊ�գ�</td>
      <td align="left" height="20" valign="middle"><asp:CheckBox ID="DefIsNull" runat="server" />
        &nbsp;<span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('Def_Table_004',this)">����</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="right" height="20" valign="middle"> �ֶ�Ĭ��ֵ��</td>
      <td align="left" height="20" valign="middle"><asp:TextBox ID="DefColumns" runat="server" Width="232px" CssClass="form"></asp:TextBox>
        &nbsp;<span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('Def_Table_005',this)">����</span></td>
    </tr>
    
      <tr class="TR_BG_list">
        <td align="right" height="20" valign="middle"> �ֶ�ѡ�</td>
        <td align="left" height="20" valign="middle"><asp:TextBox ID="definedvalue" runat="server" TextMode="MultiLine" Height="55px" Width="232px" CssClass="form"></asp:TextBox>
          &nbsp;<span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('Def_Table_definedvalue',this)">����</span></td>
      </tr>
      
          
    <tr class="TR_BG_list">
      <td align="right" height="20" valign="middle"> �ֶ���˵����</td>
      <td align="left" height="20" valign="middle"><asp:TextBox ID="DefExpr" runat="server" TextMode="MultiLine" Width="231px" CssClass="form"></asp:TextBox>
        &nbsp;<span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('Def_Table_006',this)">����</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="center" colspan="2" height="20" valign="middle"><asp:Button ID="btnData" runat="server" Text="�ύ����" CssClass="form" OnClick="btnData_Click"/></td>
    </tr>
  </table>
</form>
<table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
  <tr>
    <td class="list_link" align="center"><%Response.Write(CopyRight); %></td>
  </tr>
</table>
</body>
</html>
