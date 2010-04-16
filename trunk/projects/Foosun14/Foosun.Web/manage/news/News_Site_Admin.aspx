<%@ Page Language="C#" AutoEventWireup="true" Codebehind="News_Site_Admin.aspx.cs"
    Inherits="Foosun.Web.manage.news.News_Site_Admin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="../../sysImages/<% Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
    <title>新闻统计</title>

    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>

    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
            <tr>
                <td height="1" colspan="2">
                </td>
            </tr>
            <tr>
                <td width="30%" class="sysmain_navi" style="padding-left: 14px; height: 32px;">
                    新闻统计</td>
            </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
            <tr>
                <td style="padding-left: 14px;">
                    <a href="News_Site_Admin.aspx?type=newsStat" class="topnavichar" title="新闻统计">新闻统计</a>&nbsp;┊&nbsp;<a href="News_Site_Admin.aspx?type=newsClick"
                        class="topnavichar"><font color="red">新闻点击量统计</font></a>
                        
                        &nbsp;&nbsp;
                        统计日期<asp:Label
                            ID="Label1" runat="server" Text="Label"></asp:Label>至<asp:Label
                            ID="Label2" runat="server" Text="Label"></asp:Label>
                        </td>
            </tr>
        </table>
        <asp:DataList runat="server" ID="newsStat" Width="100%">
            <HeaderTemplate>
                <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1"
                    class="table">
                    <tr class="TR_BG">
                        <td align="center" class="sysmain_navi">
                            管理员</td>
                        <td align="center" class="sysmain_navi">
                            当月发布新闻数</td>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr class="TR_BG_list" onmouseover="overColor(this)" onmouseout="outColor(this)">
                    <td class="list_link" align="center">
                        <%#Eval("Editor")%>
                    </td>
                    <td align="center">
                        <%#Eval("NewsCount")%>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:DataList>
        
        <asp:DataList runat="server" ID="NewsClickList" Width="100%">
        <HeaderTemplate>
            <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1"
                    class="table">
                    <tr class="TR_BG">
                        <td align="center" class="sysmain_navi">
                            新闻标题</td>
                        <td align="center" class="sysmain_navi">
                            点击量</td>
                            <td align="center" class="sysmain_navi">
                            发布时间</td>
                        <td align="center" class="sysmain_navi">
                            发布人</td>
                    </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr class="TR_BG_list" onmouseover="overColor(this)" onmouseout="outColor(this)">
                    <td class="list_link" align="center">
                        <%#Eval("NewsTitle")%>
                    </td>
                    <td align="center">
                        <%#Eval("Click")%>
                    </td>
                     <td align="center">
                        <%#Eval("CreatTime")%>
                    </td>
                    <td align="center">
                        <%#Eval("Editor")%>
                    </td>
                </tr>
        </ItemTemplate>
        <FooterTemplate>
        </table>
        </FooterTemplate>
        </asp:DataList>
        <table width="98%" border="0" align="center" cellpadding="3" cellspacing="2" style="height: 20px">
            <tr>
                <td style="width: 118px">
                    搜索前<asp:TextBox ID="TextBox1" runat="server" Text="20" Width="41px"></asp:TextBox>条</td>
                <td colspan="3">
                    年:<asp:DropDownList ID="yearList" runat="server"></asp:DropDownList>月:<asp:DropDownList ID="monthList" runat="server">
                    <asp:ListItem Value="1">1月</asp:ListItem>
                    <asp:ListItem Value="2">2月</asp:ListItem>
                    <asp:ListItem Value="3">3月</asp:ListItem>
                    <asp:ListItem Value="4">4月</asp:ListItem>
                    <asp:ListItem Value="5">5月</asp:ListItem>
                    <asp:ListItem Value="6">6月</asp:ListItem>
                    <asp:ListItem Value="7">7月</asp:ListItem>
                    <asp:ListItem Value="8">8月</asp:ListItem>
                    <asp:ListItem Value="9">9月</asp:ListItem>
                    <asp:ListItem Value="10">10月</asp:ListItem>
                    <asp:ListItem Value="11">11月</asp:ListItem>
                    <asp:ListItem Value="12">12月</asp:ListItem>                    
                </asp:DropDownList>
                    <asp:Button ID="butSearch"  runat="server" Text=" 搜索 " CssClass="form" OnClick="butSearch_Click"/>
                </td>
            </tr>
        </table>
         <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
  <tr>
    <td align="center"><div id="SiteCopyRight" runat="server" /></td>
  </tr>
</table>
    </form>
</body>
</html>
