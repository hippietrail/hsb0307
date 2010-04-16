<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_collect_Collect_RuleAdd" Codebehind="Collect_RuleAdd.aspx.cs" %>

<%@ Register Src="CollectEditor.ascx" TagName="CollectEditor" TagPrefix="uc1" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>FoosunCMS For .NET v1.0.0</title>
    <link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/css.css" rel="stylesheet"
        type="text/css" />

    <script language="JavaScript" type="text/javascript" charset="utf-8" src="../../configuration/js/Prototype.js"></script>

    <script language="JavaScript" type="text/javascript" charset="utf-8" src="../../configuration/js/Public.js"></script>

</head>
<body>
    <form id="Form2" runat="server">
        <div>
            <table id="top1" width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
                <tr>
                    <td height="1" colspan="2">
                    </td>
                </tr>
                <tr>
                    <td width="57%" class="sysmain_navi" style="padding-left: 14px">
                        �ɼ�ϵͳ</td>
                    <td width="43%" class="topnavichar" style="padding-left: 14px">
                        <div align="left">
                            λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt=""
                                src="../../sysImages/folder/navidot.gif" border="0" />
                            <a href="Collect_RuleList.aspx" target="sys_main" class="list_link">�ؼ��ֹ���</a><img
                                alt="" src="../../sysImages/folder/navidot.gif" border="0" /><asp:Label ID="LblTitle"
                                    runat="server"></asp:Label>
                        </div>
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
                <tr>
                    <td>
                        ���ܣ�<a class="topnavichar" href="Collect_List.aspx">վ������</a>&nbsp;��&nbsp;<a class="topnavichar"
                            href="Collect_News.aspx">���Ŵ���</a>&nbsp;��&nbsp;<a class="topnavichar" href="Collect_RuleList.aspx">���˹����б�</a></td>
                </tr>
            </table>
            <table id="tabList" width="98%" border="0" align="center" cellpadding="5" cellspacing="1"
                class="table">
                <tr class="TR_BG_list">
                    <td class="list_link" width="30%" align="center">
                        ��������:
                    </td>
                    <td class="list_link" width="70%">
                        <asp:TextBox runat="server" ID="TxtRuleName" Width="98%" MaxLength="50" CssClass="form"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="����д��������!"
                            ControlToValidate="TxtRuleName" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
                </tr>
                <tr class="TR_BG_list">
                    <td class="list_link" width="30%" align="center">
                        �����ַ���:
                    </td>
                    <td class="list_link" width="70%">
                        <uc1:CollectEditor ID="EdtOldStr" runat="server" SetMaxLength="100" />
                        <br />
                        <asp:CheckBox runat="server" ID="ChbCase" Text="���Դ�Сд" />
                    </td>
                </tr>
                <tr class="TR_BG_list">
                    <td class="list_link" width="30%" align="center">
                        �滻Ϊ:
                    </td>
                    <td class="list_link" width="70%">
                        <asp:TextBox runat="server" ID="TxtNewStr" Width="98%" Height="51px" TextMode="MultiLine"
                            MaxLength="100" CssClass="form"></asp:TextBox>
                    </td>
                </tr>
                <tr class="TR_BG_list">
                    <td class="list_link" width="30%" align="center">
                        Ӧ�õ�:
                    </td>
                    <td class="list_link" width="70%">
                        <div style="width: 520px; height: 120px; overflow: auto; background-color: White;
                            border-color: #cccccc; border-width: 1px; border-style: groove;">
                            <asp:Table ID="TabRuleApply" runat="server">
                            </asp:Table>
                        </div>
                        <span style="color: #ff0033">ע��ÿ��վ��ֻ��Ӧ��һ������ÿ���������Ӧ�õ����վ��;
                            <br />
                            ��ɫ�ֱ�ʾ�òɼ�վ���Ѿ�Ӧ�������Ĺ���</span></td>
                </tr>
                <tr class="TR_BG_list">
                    <td class="list_link" colspan="2" align="center">
                        <asp:HiddenField ID="RID" runat="server" />
                        <asp:Button ID="BtnOK" Text=" �� �� " runat="server" CssClass="form" OnClick="BtnOK_Click" />
                        <asp:Button ID="Button1" Text=" �� �� " runat="server" CssClass="form" CausesValidation="False" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg"
                style="height: 76px">
                <tr>
                    <td align="center">
                        <%Response.Write(CopyRight);%>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
