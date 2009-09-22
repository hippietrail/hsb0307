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
  <!------头部导航------>
  <table width="100%" border="0" cellpadding="0" cellspacing="0"class="toptable" id="toptb1">
    <tr>
      <td height="1" colspan="2"></td>
    </tr>
    <tr>
      <td width="57%" class="sysmain_navi"  style="PADDING-LEFT: 14px">采编系统与网站系统的栏目对应关系</td>
      <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" >位置：<a href="../main.aspx" class="navi_link">首页</a> <img alt="" src="../../sysImages/folder/navidot.gif" border="0" /> 栏目对应关系</td>
    </tr>
  </table>
  <!----功能菜单----->
  <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
    <tr>
      <td style="padding-left:14px;">功能： <a href="Class_Map.aspx" class="topnavichar">刷新</a>
      &nbsp;┊&nbsp;
      <asp:LinkButton ID="btnDelete1" runat="server" CssClass="topnavichar" OnClick="btnDelete_Click1" >删除选中</asp:LinkButton>
      &nbsp;┊&nbsp;
      <asp:LinkButton ID="btnAdd" runat="server" CssClass="topnavichar" OnClick="btnAdd_Click1" >设置</asp:LinkButton>
      &nbsp;┊&nbsp;
      <span id="publicStat" style="color:Red;"></span>
      </td>
    </tr>
  </table>
  
  <asp:ObjectDataSource ID="odsSiteColumn" TypeName="Foosun.CMS.ContentManage" SelectMethod="GetAllClass" runat="server" ></asp:ObjectDataSource>
  
  <div>
      <table>
          <tr>
              <td>网站栏目</td>
              <td><asp:DropDownList ID="ddlSiteColumn" runat="server" DataSourceID="odsSiteColumn" DataTextField="ChineseName" DataValueField="ColumnId" AutoPostBack="True" OnSelectedIndexChanged="ddlSiteColumn_SelectedIndexChanged" OnDataBound="ddlSiteColumn_DataBound"></asp:DropDownList></td>
              <td></td>
              <td></td>
              <td rowspan="2" valign="top" style="padding-top:24px; padding-left:20px;">
              
              <table id="tablist" width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
              
        <tr class="TR_BG">
            <td class="sys_topBg" align="center" style=" width:150px;" >媒体</td>
            <td class="sys_topBg" align="center" style=" width:150px;">采编栏目</td>
            <td class="sys_topBg" align="center" style=" width:150px;">对应的网站栏目</td>
        </tr>
        
        <asp:Repeater ID="rtColumnMap" runat="server">
        <ItemTemplate>
        <tr class="TR_BG_list" > 
            <td><%# Eval("Media") %></td><%--<%# Container.DataItem("Media")%>--%>
            <td><%# Eval("CpClassName") %></td>
            <td><%# Eval("SiteClassName") %></td>
        </tr>
        </ItemTemplate>
        </asp:Repeater>
    </table>
    
    </td>
          </tr>
          <tr>
              <td>采编栏目</td>
              <td valign="top"><asp:ListBox ID="lstCpsnColumn" runat="server" SelectionMode="Multiple" Height="300"></asp:ListBox></td>
              <td valign="middle">
                  <asp:ImageButton ID="btnSave" runat="server" ImageUrl="~/sysImages/FileIcon/arrow_right.gif" ToolTip="建立对应关系" OnClick="btnSave_Click" />
                  <br />
                  <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/sysImages/FileIcon/arrow_left.gif" ToolTip="取消对应关系" OnClick="btnDelete_Click" />
              </td>
              <td valign="top"><asp:ListBox ID="lstSiteColumn" runat="server" Height="300"></asp:ListBox></td>
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
