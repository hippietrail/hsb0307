<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_survey_ManageVote" Codebehind="ManageVote.aspx.cs" %>
<%@ Register Src="~/controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
<form id="form1" runat="server">
  <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" class="toptable">
    <tr>
      <td width="57%" class="sysmain_navi"  style="PADDING-LEFT: 14px" Height="30">�������</td>
      <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�������</div></td>
    </tr>
  </table>
   <div>
    <table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" class="Navitable">
      <tr class="menulist">
        <td height="18" style="width: 45%" colspan="2" style="PADDING-LEFT: 14px"><div align="left"><label id="param_id" runat="server" /><a href="setClass.aspx" class="menulist">ͶƱ��������</a>&nbsp;��&nbsp;<a href="setTitle.aspx" class="menulist">ͶƱ��������</a>&nbsp;��&nbsp;<a href="setItem.aspx" class="menulist">ͶƱѡ������</a>&nbsp;��&nbsp;<a href="setSteps.aspx" class="menulist">�ಽͶƱ����</a>&nbsp;��&nbsp;<a href="ManageVote.aspx" class="menulist">ͶƱ�������</a> </div></td>
      </tr>
    </table>
  </div>
  <div id="NoContent" runat="server"></div>
  <div>
    <table width="100%" border="0" align="center" cellpadding="5" cellspacing="1">
      <tr>
        <td height="18" style="width: 45%" colspan="2" ><div align="right">
            <asp:LinkButton ID="DelP" runat="server" CssClass="topnavichar" OnClientClick="{if(confirm('ȷ��ɾ����ѡ��Ϣ��?')){return true;}return false;}" OnClick="DelP_Click">����ɾ��</asp:LinkButton>
            |
            <asp:LinkButton ID="DelAll" runat="server" CssClass="topnavichar" OnClientClick="{if(confirm('ȷ��ɾ��ȫ����Ϣ��?')){return true;}return false;}" OnClick="DelAll_Click">ɾ��ȫ��</asp:LinkButton></div></td>
      </tr>
    </table>
  </div>
  <asp:Repeater ID="DataList1" runat="server">
    <HeaderTemplate>
      <table width="98%" border="0" align="center" cellpadding="4" cellspacing="1" class="table">
      <tr class="TR_BG">
        <td width="4%" align="center" valign="middle" class="sys_topBg">���</td>
        <td width="7%" align="center" valign="middle" class="sys_topBg">����</td>
        <td width="7%" align="center" valign="middle" class="sys_topBg">ѡ��</td>
        <td width="12%" align="center" valign="middle" class="sys_topBg">����ͶƱ����</td>
        <td width="10%" align="center" valign="middle" class="sys_topBg">IP</td>
        <td width="14%" align="center" valign="middle" class="sys_topBg">����</td>
        <td width="6%" align="center" valign="middle" class="sys_topBg">��Ա</td>
        <td width="8%" align="center" valign="middle" class="sys_topBg">����
          <input type="checkbox" id="vote_checkbox" value="-1" name="vote_checkbox" onclick="javascript:return selectAll(this.form,this.checked);"/></td>
      </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="TR_BG_list">
        <td width="4%" align="center" valign="middle" ><%#((DataRowView)Container.DataItem)[0]%></td>
        <td width="7%" align="center" valign="middle" ><%#((DataRowView)Container.DataItem)["title"]%></td>
        <td width="7%" align="center" valign="middle" ><%#((DataRowView)Container.DataItem)["item"]%></td>
        <td width="12%" align="center" valign="middle" ><%#((DataRowView)Container.DataItem)[3]%></td>
        <td width="10%" align="center" valign="middle" ><%#((DataRowView)Container.DataItem)[4]%></td>
        <td width="10%" align="center" valign="middle" ><%#((DataRowView)Container.DataItem)[5]%></td>
        <td width="7%" align="center" valign="middle" ><%#((DataRowView)Container.DataItem)["usernum"]%></td>
        <td width="8%" align="center" valign="middle" ><%#((DataRowView)Container.DataItem)["oPerate"]%> </td>
      </tr>
    </ItemTemplate>
    <FooterTemplate>
      </table>
    </FooterTemplate>
  </asp:Repeater>
  <div align="right" style="width:98%">
    <uc1:PageNavigator ID="PageNavigator1" runat="server" />
  </div>
</form>
<br />
<br />
<table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
  <tr>
    <td align="center"><label id="copyright" runat=server /></td>
  </tr>
</table>
</body>
</html>
