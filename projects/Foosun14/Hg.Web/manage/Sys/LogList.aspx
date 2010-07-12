<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogList.aspx.cs" Inherits="manage_Sys_LogList" %>
<%@ Register Src="../../controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<%@ Import NameSpace="System.Data"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../../sysImages/default/css/css.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/RiQi.js"></script>
    <style type="text/css">
        .style1
        {
            width: 586px;
        }
        .style2
        {
            color: #4B6888;
            font-size: 14px;
            text-decoration: none;
            font-weight: bold;
            width: 587px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table style="width: 100%;" cellpadding="0" cellspacing="0" border="0" class="toptable">
        <tr>
            <td class="style2" style="padding-left: 15px;">
                日志管理
            </td>
            <td class="topnavichar">
                位置导航：<a href="../main.aspx" target="sys_main" class="list_link">首页</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />日志管理
            </td>
        </tr>
    </table>
    <table style="width: 100%;" border="0" cellpadding="0" cellspacing="0" class="Navitable">
        <tr>
            <td style="padding-left: 15px;" class="style1">
               操作者：<asp:TextBox ID="txtUserName" runat="server" Width="75" MaxLength="20"></asp:TextBox>
               起始日期：<asp:TextBox ID="txtStartTime" runat="server" Width="86px"  MaxLength="10" 
                    Columns="10" onblur="setday(this);" onclick="setday(this);" ></asp:TextBox>
               截止日期：<asp:TextBox ID="txtEndTime" runat="server" Width="84px" MaxLength="10" 
                    Columns="10" onblur="setday(this);" onclick="setday(this);" ></asp:TextBox>
                
                <asp:Button ID="Button1" runat="server" Text="查询" onclick="Button1_Click" />
                
            </td>
            <td>
              清理
            <asp:TextBox ID="txtDayCount" runat="server" Width="50" MaxLength="5"></asp:TextBox>
            天前的日志 <asp:Button ID="btnClear" runat="server"  Text="清理" 
                    onclick="btnClear_Click" />
            </td>
        </tr>
    </table>
    
    <asp:Repeater ID="Repeater1" runat="server" >
          <HeaderTemplate>
            <table width="98%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#FFFFFF" class="table">
                <tr class="TR_BG">
                    <td align="left" valign="middle" class="sys_topBg">编号</td>
                    <td align="left" valign="middle" class="sys_topBg">操作者</td>
                    <td align="left" valign="middle" class="sys_topBg">操作标题</td>
                    <td align="left" valign="middle" class="sys_topBg">操作描述</td>
                    <td align="left" valign="middle" class="sys_topBg">操作时间</td>
                    <td align="left" valign="middle" class="sys_topBg">站点</td>
                    <td align="left" valign="middle" class="sys_topBg">IP地址</td>
                </tr>
    </HeaderTemplate>
    <ItemTemplate>
            <tr class="TR_BG_list" onmouseover="overColor(this)" onmouseout="outColor(this)">
            <td align="left" valign="middle" height="20"><%#((DataRowView)Container.DataItem)[0]%></td>
            <td align="left" valign="middle" ><%#((DataRowView)Container.DataItem)[1]%></td>
            <td align="left" valign="middle" ><%#((DataRowView)Container.DataItem)[2]%></td>
            <td align="left" valign="middle" style="width:300px;"><%#((DataRowView)Container.DataItem)[3]%></td>
            <td align="left" valign="middle" ><%#((DataRowView)Container.DataItem)[4]%></td>
            <td align="left" valign="middle" ><%#((DataRowView)Container.DataItem)[5]%></td>
            <td align="left" valign="middle" ><%#((DataRowView)Container.DataItem)[6]%></td>
            </tr>
          </ItemTemplate>
          <FooterTemplate>
          </table>
         </FooterTemplate>
    </asp:Repeater>
    <div style="width:98%;" align="right"><uc1:PageNavigator ID="PageNavigator1" runat="server" /></div>
    <asp:Literal ID="litMsg" runat="server"></asp:Literal>
    <br />
    <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px" align="center">
       <tr>
         <td align="center"><label id="copyright" runat="server" /></td>
       </tr>
    </table>
    </form>
</body>
</html>
