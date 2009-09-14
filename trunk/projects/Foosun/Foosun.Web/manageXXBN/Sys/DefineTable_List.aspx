<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_Sys_DefineTable_List" Codebehind="DefineTable_List.aspx.cs" %>
<%@ Register Src="../../controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
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
      <td width="57%"  class="sysmain_navi"  style="PADDING-LEFT: 14px" >�Զ����Զι���</td>
      <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�Զ����ֶ�</div></td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="Navitable" align="center">
    <tr>
      <td style="padding-left:15px;"><a href="DefineTable_Manage.aspx" class="topnavichar">�������</a>&nbsp;��&nbsp;<a href="DefineTable.aspx?pr=<%Response.Write(Request.QueryString["pr"]); %>" class="topnavichar">�����ֶ�</a>&nbsp;��&nbsp;<a href="DefineTable_Manage.aspx?action=add" class="topnavichar">��������</a>&nbsp;��&nbsp;
        <asp:LinkButton ID="delall" runat="server" CssClass="topnavichar" OnClientClick="{if(confirm('ȷ��ɾ��ȫ����Ϣ��?')){return true;}return false;}" OnClick="delall_Click">ɾ��ȫ��</asp:LinkButton>
        &nbsp;��&nbsp;
        <asp:LinkButton ID="DelP" runat="server" CssClass="topnavichar" OnClientClick="{if(confirm('ȷ��ɾ����ѡ��Ϣ��?')){return true;}return false;}" OnClick="DelP_Click">����ɾ��</asp:LinkButton></td>
    </tr>
  </table>
  <div id="noContent" runat="server" />
  <div>
    <asp:Repeater ID="DataList1" runat="server">
      <HeaderTemplate>
        <table width="98%" border="0" align="center" cellpadding="4" cellspacing="1"  class="table">
        <tr class="TR_BG">
          <td width="5%" align="center" valign="middle" class="sys_topBg">���</td>
          <td width="9%" align="center" valign="middle" class="sys_topBg">�ֶ�����</td>
          <td width="6%" align="center" valign="middle" class="sys_topBg">����</td>
          <td width="5%" align="center" valign="middle" class="sys_topBg">�Ƿ�����Ϊ��</td>
          <td width="12%" align="center" valign="middle" class="sys_topBg">����
            <input type="checkbox" id="define_checkbox11" value="-1" name="define_checkbox11" onclick="javascript:return selectAll(this.form,this.checked);"/></td>
        </tr>
      </HeaderTemplate>
      <ItemTemplate>
        <tr class="TR_BG_list">
          <td width="5%" align="center" valign="middle"><%#DataBinder.Eval(Container.DataItem, "id")%></td>
          <td width="9%" align="center" valign="middle"><%#DataBinder.Eval(Container.DataItem, "defineCname")%></td>
          <td width="6%" align="center" valign="middle"><%#DataBinder.Eval(Container.DataItem, "type")%></td>
          <td width="5%" align="center" valign="middle"><%#DataBinder.Eval(Container.DataItem, "IsNullC")%></td>
          <td width="12%" align="center" valign="middle"><%#DataBinder.Eval(Container.DataItem, "operate")%></td>
        </tr>
      </ItemTemplate>
      <FooterTemplate>
        </table>
      </FooterTemplate>
    </asp:Repeater>
    <div style="width:95%;text-align:right;"><uc1:PageNavigator ID="PageNavig" runat="server" /></div>
  </div>
</form>
<br />
<br />
<table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
  <tr>
    <td class="list_link" align="center"><%Response.Write(CopyRight); %></td>
  </tr>
</table>
</body>
</html>
