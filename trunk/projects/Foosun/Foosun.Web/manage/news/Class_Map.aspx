<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Class_Map.aspx.cs" Inherits="Foosun.Web.manageXXBN.news.Class_Map" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Untitled Page runat=server</title>
    <link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
    <form id="form1" runat="server">
  <!------ͷ������------>
  <table width="100%" border="0" cellpadding="0" cellspacing="0"class="toptable" id="toptb1">
    <tr>
      <td height="1" colspan="2"></td>
    </tr>
    <tr>
      <td width="57%" class="sysmain_navi"  style="PADDING-LEFT: 14px">�ɱ�ϵͳ����վϵͳ����Ŀ��Ӧ��ϵ</td>
      <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" >λ�ã�<a href="../main.aspx" class="navi_link">��ҳ</a> <img alt="" src="../../sysImages/folder/navidot.gif" border="0" /> ��Ŀ��Ӧ��ϵ</td>
    </tr>
  </table>
  <!----���ܲ˵�----->
  <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
    <tr>
      <td style="padding-left:14px;">���ܣ� <a href="Class_Map.aspx" class="topnavichar">ˢ��</a>
      &nbsp;��&nbsp;
      <asp:LinkButton ID="btnDelete1" runat="server" CssClass="topnavichar" OnClick="btnDelete_Click1" >ɾ��ѡ��</asp:LinkButton>
      &nbsp;��&nbsp;
      <asp:LinkButton ID="btnAdd" runat="server" CssClass="topnavichar" OnClick="btnAdd_Click1" >����</asp:LinkButton>
      &nbsp;��&nbsp;
      <span id="publicStat" style="color:Red;"></span>
      </td>
    </tr>
  </table>
  
  <asp:ObjectDataSource ID="odsSiteColumn" TypeName="Foosun.CMS.ContentManage" SelectMethod="GetAllClass" runat="server" ></asp:ObjectDataSource>
  
  <div>
      <table>
          <tr>
              <td>��վ��Ŀ</td>
              <td><asp:DropDownList ID="ddlSiteColumn" runat="server" DataSourceID="odsSiteColumn" DataTextField="ChineseName" DataValueField="ColumnId" AutoPostBack="True" OnSelectedIndexChanged="ddlSiteColumn_SelectedIndexChanged" OnDataBound="ddlSiteColumn_DataBound"></asp:DropDownList></td>
              <td></td>
              <td></td>
          </tr>
          <tr>
              <td>�ɱ���Ŀ</td>
              <td><asp:ListBox ID="lstCpsnColumn" runat="server" SelectionMode="Multiple" Height="300"></asp:ListBox></td>
              <td>
                  <asp:ImageButton ID="btnSave" runat="server" ImageUrl="~/sysImages/FileIcon/arrow_right.gif" ToolTip="������Ӧ��ϵ" OnClick="btnSave_Click" />
                  <br />
                  <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/sysImages/FileIcon/arrow_left.gif" ToolTip="ȡ����Ӧ��ϵ" OnClick="btnDelete_Click" />
              </td>
              <td><asp:ListBox ID="lstSiteColumn" runat="server" Height="300"></asp:ListBox></td>
          </tr>
      </table>
  
  </div>

    <br />
    <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
  <tr>
    <td align="center"><%Response.Write(CopyRight);%></td>
  </tr>
</table>
<asp:HiddenField ID="HidType" runat="server" />
    </form>
</body>
</html>
