<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_survey_setClass" Codebehind="setClass.aspx.cs" %>
<%@ Register Src="~/controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../../sysImages/<%Response.Write(Hg.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
<form id="form1" runat="server">
  <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" class="toptable">
    <tr>
      <td width="57%" class="sysmain_navi"  style="PADDING-LEFT: 14px" Height="30">�����</td>
      <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">�λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�����</div></td>
    </tr>
  </table>
    <div>
    <table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" class="Navitable">
      <tr class="menulist">
        <td height="18" style="width: 45%" colspan="2" style="PADDING-LEFT: 14px"><div align="left"><label id="param_id" runat="server" /><a href="setClass.aspx" class="menulist">�ͶƱ�������</a>&nbsp;é�&nbsp;<a href="setTitle.aspx" class="menulist">ͶƱ�������</a>&nbsp;é�&nbsp;<a href="setItem.aspx" class="menulist">ͶƱѡ�����</a>&nbsp;é�&nbsp;<a href="setSteps.aspx" class="menulist">�ಽͶƱ���</a>&nbsp;���&nbsp;<a href="ManageVote.aspx" class="menulist">ͶƱ�����</a> </div></td>
      </tr>
    </table>
  </div>
  <div id="NoContent" runat="server"></div>
  <%
         string type = Request.QueryString["type"];
         if(type !="add"&&type!="edit")
         {
      %>
      <div>
    <table width="100%" border="0" align="center" cellpadding="5" cellspacing="1">
      <tr>
        <td height="18" style="width: 45%" colspan="2" ><div align="right"><a href="?type=add" class="topnavichar">�������</a> |
            <asp:LinkButton ID="DelP" runat="server" CssClass="topnavichar" OnClientClick="{if(confirm('�ȷ��ɾ����ѡ��Ϣ�?')){return true;}return false;}" OnClick="DelP_Click">����ɾ�</asp:LinkButton>
            |
            <asp:LinkButton ID="DelAll" runat="server" CssClass="topnavichar" OnClientClick="{if(confirm('�ȷ��ɾ��ȫ����Ϣ�?')){return true;}return false;}" OnClick="DelAll_Click">�ɾ��ȫ��</asp:LinkButton></div></td>
      </tr>
    </table>
  </div>
  <asp:Repeater ID="DataList1" runat="server">
    <HeaderTemplate>
      <table width="98%" border="0" align="center" cellpadding="4" cellspacing="1" class="table">
      <tr class="TR_BG">
        <td width="7%" align="center" valign="middle" class="sys_topBg">��</td>
        <td width="10%" align="center" valign="middle" class="sys_topBg">������</td>
        <td width="9%" align="center" valign="middle" class="sys_topBg">����</td>
        <td width="27%" align="center" valign="middle" class="sys_topBg">���
          <input type="checkbox" id="vote_checkbox" value="-1" name="vote_checkbox" onclick="javascript:return selectAll(this.form,this.checked);"/></td>
      </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="TR_BG_list">
        <td width="7%" align="center" valign="middle" height=20><%#((DataRowView)Container.DataItem)[0]%></td>
        <td width="10%" align="center" valign="middle" ><%#((DataRowView)Container.DataItem)[1]%></td>
        <td width="9%" align="center" valign="middle" ><%#((DataRowView)Container.DataItem)[2]%></td>
        <td width="27%" align="center" valign="middle" ><%#((DataRowView)Container.DataItem)["oPerate"]%> </td>
      </tr>
    </ItemTemplate>
    <FooterTemplate>
      </table>
    </FooterTemplate>
  </asp:Repeater>
  <div align="right" style="width:98%">
    <uc1:PageNavigator ID="PageNavigator1" runat="server" />
  </div>
  <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
    <tr class="TR_BG_list">
      <td class="list_link"> �����ѯ:
        &nbsp;
        �ؼ��:
        <asp:TextBox runat="server" ID="KeyWord" size="15"  CssClass="form"/>
        &nbsp;&nbsp;
        ֲ�ѯ���:
        <asp:DropDownList ID="DdlKwdType" runat="server"  CssClass="form">
          <asp:ListItem Value="choose" Text="���ѡ�" />
          <asp:ListItem Value="number" Text="��" />
          <asp:ListItem Value="classname" Text="����" />
          <asp:ListItem Value="description" Text="����" />
        </asp:DropDownList>
        &nbsp;&nbsp;
        <asp:Button runat="server" ID="BtnSearch" Text=" ��ѯ " CssClass="form" OnClick="BtnSearch_Click" />
        &nbsp;<span class="helpstyle" style="cursor:help;" title="���鿴���" onClick="Help('H_searchClass_0001',this)">���</span> </td>
    </tr>
  </table>
  <%
      }
       %>
  <%
         if(type == "add")
         {
             this.PageNavigator1.Visible = false;
             this.NoContent.Visible=false;
      %>
  <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1"  class="table" id="Addvote_Class">
    <tr class="TR_BG_list">
      <td class="list_link" colspan="2">������ʾ��������Ϣ</td>
    </tr>
    <tr class="TR_BG_list">
      <td align="right"  class="list_link" style="width: 171px"> �����ƣ�</td>
      <td  align="left" class="list_link"><asp:TextBox ID="ClassName" runat="server" Width="124px" CssClass="form"/>
        <span class=reshow>(*)</span> <span class="helpstyle" style="cursor:help;" title="���鿴���" onClick="Help('H_surverClass_0001',this)">���</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="right"  class="list_link" style="width: 171px"> ����</td>
      <td  align="left" class="list_link"><textarea ID="Description" runat="server" Width="124px" style="width: 266px; height: 99px" class="form"/>
        <span class="helpstyle" style="cursor:help;" title="���鿴���" onClick="Help('H_surverClass_0002',this)">���</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="center"  colspan="2" class="list_link"><label>
        <input type="submit" name="Saveupload" value=" �� ύ " class="form" id="SaveClass" runat="server" onserverclick="SaveClass_ServerClick"/>
        </label>
        &nbsp;&nbsp;
        <label>
        <input type="reset" name="Clearupload" value=" � �� " class="form" id="ClearClass" runat="server" />
        </label></td>
    </tr>
  </table>
  <%
      }
     %>
  <%
         if(type == "edit")
         {
      %>
  <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1"  class="table" id="Editvote_Class">
    <tr class="TR_BG_list">
      <td class="list_link" colspan="2">��޸��ʾ��������Ϣ</td>
    </tr>
    <tr class="TR_BG_list">
      <td align="right"  class="list_link" style="width: 175px"> �����ƣ�</td>
      <td  align="left" class="list_link"><asp:TextBox ID="ClassNameEdit" runat="server" Width="124px" CssClass="form"/>
        <span class=reshow>(*)</span> <span class="helpstyle" style="cursor:help;" title="���鿴���" onClick="Help('H_surverClass_0001',this)">���</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="right"  class="list_link" style="width: 175px"> ����</td>
      <td  align="left" class="list_link"><textarea ID="DescriptionE" runat="server" rows="5" Width="124px" style="width: 266px; height: 99px" class="form"/>
        <span class="helpstyle" style="cursor:help;" title="���鿴���" onClick="Help('H_surverClass_0002',this)">���</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="center"  colspan="2" class="list_link"><label>
        <input type="submit" name="Savevote" value=" �� ύ " class="form" id="EditSave" runat="server" onserverclick="EditSave_ServerClick"/>
        </label>
        &nbsp;&nbsp;
        <label>
        <input type="reset" name="Clearvote" value=" � �� " class="form" id="EditClear" runat="server" />
        </label></td>
    </tr>
  </table>
  <%
      }
     %>
</form>
<table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
  <tr>
    <td align="center"><label id="copyright" runat="server" /></td>
  </tr>
</table>
</body>
</html>
