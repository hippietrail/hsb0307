<%@ Page Language="C#" AutoEventWireup="true" Codebehind="Form_Add.aspx.cs" Inherits="Foosun.Web.manage.Sys.Form_Add" %>

<%@ Register Src="../../controls/UserPop.ascx" TagName="UserPop" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/css.css"
        rel="stylesheet" type="text/css" />

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
                <td width="57%" class="sysmain_navi" style="padding-left: 14px; height: 32px;">
                    �Զ��������<span class="helpstyle" style="cursor: hand;" title="����鿴����" onclick="Help('',this)">(����)</span></td>
                <td width="43%" class="topnavichar" style="padding-left: 14px; height: 32px;">
                    <div align="left">
                        λ�õ�����<a href="../main.aspx" target="sys_main" class="topnavichar">��ҳ</a><img alt=""
                            src="../../sysImages/folder/navidot.gif" border="0" /><a href="Form.aspx" class="topnavichar">�Զ��������</a><img
                                alt="" src="../../sysImages/folder/navidot.gif" border="0" /><asp:Literal runat="server"
                                    ID="LtrCaption"></asp:Literal></div>
                </td>
            </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
            <tr>
                <td>
                    &nbsp;&nbsp;
                </td>
            </tr>
        </table>
        <table width="98%" border="0" align="center" cellpadding="4" cellspacing="1" id="tablist"
            class="table">
            <tr class="TR_BG_list">
                <td width="20%" align="right" class="list_link">
                    �����ƣ�</td>
                <td width="80%" align="left" class="list_link">
                    <asp:TextBox runat="server" ID="Txt" Width="309px" CssClass="form"></asp:TextBox>
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td align="right" class="list_link">
                    �����ƣ�</td>
                <td class="list_link">
                    <asp:Label runat="server" ID="LblTablePre"></asp:Label>
                    <asp:TextBox runat="server" ID="TxtTableName" Width="222px" CssClass="form"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTableName"
                        Display="Dynamic" ErrorMessage="RequiredFieldValidator" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtTableName"
                        Display="Dynamic" ErrorMessage="����������Ӣ����ĸ�������ֵ����" SetFocusOnError="True" ValidationExpression="^\w+$"></asp:RegularExpressionValidator></td>
            </tr>
            <tr class="TR_BG_list">
                <td width="20%" align="right" class="list_link">
                    �ϴ����������ַ��</td>
                <td width="80%" align="left" class="list_link">
                    <asp:TextBox runat="server" ID="TextBox1" Width="309px" CssClass="form"></asp:TextBox>
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td width="20%" align="right" class="list_link">
                    �ϴ��ļ���С��</td>
                <td width="80%" align="left" class="list_link">
                    ���ֵ<asp:TextBox runat="server" ID="TextBox2" Width="169px" CssClass="form"></asp:TextBox>KB
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td width="20%" align="right" class="list_link">
                    ״̬��</td>
                <td width="80%" align="left" class="list_link">
                    <asp:TextBox runat="server" ID="TextBox3" Width="309px" CssClass="form"></asp:TextBox>
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td width="20%" align="right" class="list_link">
                    ����ʱ�����ƣ�</td>
                <td width="80%" align="left" class="list_link">
                    <asp:RadioButton runat="server" ID="RadOpen" GroupName="RadGrpTimeSet" Text="����" />
                    <asp:RadioButton runat="server" ID="RadForbid" GroupName="RadGrpTimeSet" Text="������" />
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td width="20%" align="right" class="list_link">
                    ��ʼʱ�䣺</td>
                <td width="80%" align="left" class="list_link">
                    <asp:TextBox runat="server" ID="TextBox5" Width="163px" CssClass="form"></asp:TextBox>
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td width="20%" align="right" class="list_link">
                    ����ʱ�䣺</td>
                <td width="80%" align="left" class="list_link">
                    <asp:TextBox runat="server" ID="TextBox6" Width="150px" CssClass="form"></asp:TextBox>
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td width="20%" align="right" class="list_link">
                    �ύȨ�ޣ�</td>
                <td width="80%" align="left" class="list_link">
                    <uc1:UserPop ID="UserPop1" runat="server" />
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td width="20%" align="right" class="list_link">
                    ��֤�����ã�</td>
                <td width="80%" align="left" class="list_link">
                    <asp:Checkbox runat="server" ID="ChbShowValidate" Text="��ʾ��֤��" />
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td align="center" class="list_link" colspan="2">
                    <asp:Button runat="server" ID="BtnOK" Text=" ȷ�� " CssClass="form" OnClick="BtnOK_Click" />
                    <input type="reset" value=" ��д " class="form" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
            <tr>
                <td align="center">
                    <%Response.Write(CopyRight); %>
                </td>
            </tr>
        </table>
        <asp:HiddenField runat="server" ID="HidID" />
    </form>
</body>
</html>
