<%@ Page Language="C#" AutoEventWireup="true" Inherits="user_RequestinformationResult" Codebehind="RequestinformationResult.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<script language="JavaScript" type="text/javascript" src="../Configuration/JS/Public.js"></script>
<script language="JavaScript" type="text/javascript" src="../Configuration/JS/Prototype.js"></script>
<title></title>
<link href="../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
        <tr class="TR_BG_list">
        <td align="left" style="width:40%;">��ѡ������Ҫ�Ĳ���</td>
        <td align="left"><asp:CheckBox ID="isCheck" Text="�ܾ�" runat="server" /></td>
        </tr>
        <tr class="TR_BG_list">
        <td align="left" style="width:40%;">���ͬ��<br />��ѡ����ӵ����ѷ���</td>
        <td>
            <asp:DropDownList ID="infomationDownList" runat="server" Width="137px"></asp:DropDownList>
        </td>
        </tr>
        <tr class="TR_BG_list">
        <td align="left" colspan="2" style="text-align: center">
            <asp:Button ID="Button1" runat="server" CssClass="form" Text="ȷ�ϲ���" OnClick="Button1_Click" />&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" OnClientClick="javascript:window.close();" CssClass="form" Text="ȡ��" />
        </td>
        </tr>
        </table>
    </div>
    </form>
</body>
</html>