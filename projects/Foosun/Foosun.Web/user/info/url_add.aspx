<%@ Page Language="C#" AutoEventWireup="true" Inherits="user_info_url_add" Codebehind="url_add.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body><form id="form1" runat="server">
    <table id="top1" width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
            <tr>
              <td height="1" colspan="2"></td>
            </tr>
            <tr>
              <td width="57%" class="sysmain_navi" style="padding-left:14px;">��ַ�ղؼ�</td>
              <td width="43%">λ�õ�����<a href="../main.aspx" class="list_link" target="sys_main">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="url.aspx" class="list_link" target="sys_main">��ַ�ղؼ�</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />���/�޸�</td>
            </tr>
    </table>
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
      <tr>
        <td  style="padding-left:12px;"><a href="url.aspx" class="topnavichar">��ַ�б�</a> ��  <a href="url_add.aspx" class="topnavichar">�����ַ</a> ��  <a href="url_class.aspx" class="topnavichar">��������</a></td>
      </tr>
      </table>
      
    <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" class="table">
      <tr class="TR_BG_list">
        <td style="width:10%;">
            ��վ����*
        </td>
        <td >
            <asp:TextBox ID="URLName" runat="server" Width="200px"></asp:TextBox>
        </td>
      </tr>
      <tr class="TR_BG_list">
        <td style="width:10%;">
            ��վ��ַ*
        </td>
        <td >
            <asp:TextBox ID="URL" runat="server" Width="200px"></asp:TextBox>
        </td>
      </tr>
      <tr class="TR_BG_list">
        <td style="width:10%;">
            ��ʾ��ɫ
        </td>
        <td >
            <asp:DropDownList ID="URLColor" runat="server">
            <asp:ListItem Value="">��ͨ</asp:ListItem>
            <asp:ListItem Value="#FF0000">��ɫ</asp:ListItem>
            <asp:ListItem Value="#0033CC">��ɫ</asp:ListItem>
            <asp:ListItem Value="#FF0099">��ɫ</asp:ListItem>
            <asp:ListItem Value="#339900">��ɫ</asp:ListItem>
            <asp:ListItem Value="#FF6600">��ɫ</asp:ListItem>
            <asp:ListItem Value="#999999">����ɫ</asp:ListItem>
            </asp:DropDownList> 
        </td>
      </tr>
      <tr class="TR_BG_list">
        <td style="width:10%;">
            ����*
        </td>
        <td >
            <asp:DropDownList ID="ClassID" runat="server">
            </asp:DropDownList> 
        </td>
      </tr>
      <tr class="TR_BG_list">
        <td style="width:10%;">
            ��ע(���200�ַ�)
        </td>
        <td >
            <asp:TextBox ID="Content" runat="server" Width="300px" Height="50" TextMode="MultiLine"></asp:TextBox>
        </td>
      </tr>
      <tr class="TR_BG_list">
        <td style="width:10%;">
        </td>
        <td >
            <asp:Button ID="Button1" runat="server" Text="������ַ" OnClick="Button1_Click" />
        </td>
      </tr>
      </table>
    </form>
</body>
</html>
