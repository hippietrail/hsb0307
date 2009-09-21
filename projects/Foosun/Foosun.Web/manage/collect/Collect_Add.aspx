<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_collect_Collect_Add" Codebehind="Collect_Add.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>FoosunCMS For .NET v1.0.0</title>
    <link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/css.css" rel="stylesheet"
        type="text/css" />

    <script language="JavaScript" type="text/javascript" charset="utf-8" src="../../configuration/js/Prototype.js"></script>

    <script language="JavaScript" type="text/javascript" charset="utf-8" src="../../configuration/js/Public.js"></script>

    <script language="javascript" type="text/javascript">
    <!--
    function ChangeUrl()
    {
        var obj = document.getElementById("A_Preview");
        obj.href = obj.parentNode.firstChild.value;
    }
    function ChooseEncode(obj)
    {
        obj.parentNode.firstChild.value = obj.innerText;
    }
    //-->
    </script>

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
                            <a href="Collect_List.aspx" target="sys_main" class="list_link">վ������</a><img alt=""
                                src="../../sysImages/folder/navidot.gif" border="0" /><asp:Label ID="LblTitle" runat="server"></asp:Label>
                        </div>
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
                <tr>
                    <td>
                        ���ܣ�<a href="Collect_List.aspx" class="list_link">վ���б�</a>&nbsp;��&nbsp;<a class="topnavichar"
                            href="Collect_Add.aspx?Type=Site">�½�վ��</a>&nbsp;��&nbsp;<a class="topnavichar" href="Collect_RuleList.aspx">�ؼ��ֹ���</a>&nbsp;��&nbsp;<a
                                class="topnavichar" href="Collect_News.aspx">���Ŵ���</a></td>
                </tr>
            </table>
            <asp:Panel runat="server" ID="PnlFolder" Width="100%">
                <table id="tabList" width="98%" border="0" align="center" cellpadding="5" cellspacing="1"
                    class="table">
                    <tr class="TR_BG_list">
                        <td class="list_link" width="30%" align="center">
                            ��Ŀ����:
                        </td>
                        <td class="list_link" width="70%">
                            <asp:TextBox runat="server" ID="TxtFolderName" Width="300px" MaxLength="40" CssClass="form"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="����д��Ŀ����!"
                                ControlToValidate="TxtFolderName" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr class="TR_BG_list">
                        <td class="list_link" width="30%" align="center">
                            ��Ŀ˵��:
                        </td>
                        <td class="list_link" width="70%">
                            <asp:TextBox runat="server" ID="TxtFolderMemo" Width="400px" Height="131px" TextMode="MultiLine"
                                CssClass="form"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="TR_BG_list">
                        <td class="list_link" colspan="2" align="center">
                            <asp:HiddenField ID="HddFolderID" runat="server" />
                            <asp:Button ID="BtnFolderOK" Text=" �� �� " runat="server" CssClass="form" OnClick="BtnFolderOK_Click" />
                            <input type="reset" value=" �� �� " class="form" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel runat="server" ID="PnlSite" Width="100%">
                <table id="Table1" width="98%" border="0" align="center" cellpadding="5" cellspacing="1"
                    class="table">
                    <tr class="TR_BG_list">
                        <td class="list_link" width="30%" align="center" style="height: 33px">
                            �ɼ�վ������:
                        </td>
                        <td class="list_link" width="70%" style="height: 33px">
                            <asp:TextBox runat="server" ID="TxtSiteName" Width="300" MaxLength="40" CssClass="form"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="����д�ɼ�վ������!"
                                ControlToValidate="TxtSiteName" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr class="TR_BG_list">
                        <td class="list_link" width="30%" align="center">
                            �ɼ�վ�����:
                        </td>
                        <td class="list_link" width="70%">
                            <asp:DropDownList ID="DdlSiteFolder" runat="server" CssClass="form">
                            </asp:DropDownList></td>
                    </tr>
                    <tr class="TR_BG_list">
                        <td class="list_link" width="30%" align="center">
                            �ɼ�����ҳ:
                        </td>
                        <td class="list_link" width="70%">
                            <asp:TextBox runat="server" ID="TxtSiteURL" Width="300px" onchange="ChangeUrl()"
                                MaxLength="250" CssClass="form">http://</asp:TextBox>
                            <a id="A_Preview" href="#" target="_blank" class="list_link">Ԥ��</a>

                            <script language="javascript" type="text/javascript">
                    ChangeUrl();
                            </script>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtSiteURL"
                                Display="Dynamic" ErrorMessage="����д�ɼ�����ҳ!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtSiteURL"
                                Display="Dynamic" ErrorMessage="������ȷ��URL��ʽ����http://��https://��ͷ" SetFocusOnError="True"
                                ValidationExpression="^[hH][tT]{2}[pP][sS]?://.+"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr class="TR_BG_list">
                        <td class="list_link" width="30%" align="center">
                            �ɼ�ҳ���뷽ʽ:
                        </td>
                        <td class="list_link" width="70%">
                            <asp:TextBox runat="server" ID="TxtEncode" Width="200px" MaxLength="50" Text="GB2312"
                                CssClass="form" />
                            ����: <span style="cursor: hand" onclick="ChooseEncode(this)">GB2312</span>��<span style="cursor: hand"
                                onclick="ChooseEncode(this)">UTF-8</span>��<span style="cursor: hand" onclick="ChooseEncode(this)">BIG5</span>
                        </td>
                    </tr>
                    <tr class="TR_BG_list">
                        <td class="list_link" align="center">
                            ��������������Ŀ:
                        </td>
                        <td class="list_link">
                            <asp:TextBox ID="TxtClassName" Width="200px" runat="server" CssClass="form"></asp:TextBox>
                            <img src="../../sysImages/folder/s.gif" alt="ѡ����Ŀ" style="cursor: pointer;" onclick="selectFile('newsclass',new Array(document.getElementById('HidClassID'),document.getElementById('TxtClassName')),300,500);document.getElementById('TxtClassName').focus();" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtClassName"
                                ErrorMessage="��ѡ������������Ŀ" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:HiddenField ID="HidClassID" runat="server" Value="" />
                        </td>
                    </tr>
                    <tr class="TR_BG_list">
                        <td class="list_link" width="30%" align="center">
                            ���״̬:
                        </td>
                        <td class="list_link" width="70%">
                            <asp:DropDownList ID="DdlAudit" runat="server" Height="21px" Width="92px" CssClass="form">
                                <asp:ListItem Value="0">�����</asp:ListItem>
                                <asp:ListItem Value="1">һ�����</asp:ListItem>
                                <asp:ListItem Value="2">�������</asp:ListItem>
                                <asp:ListItem Value="3">�������</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr class="TR_BG_list">
                        <td class="list_link" width="30%" align="center">
                            �ɼ�����:
                        </td>
                        <td class="list_link" width="70%">
                            <asp:CheckBox runat="server" ID="ChbSavePic" Text="����Զ��ͼƬ" />
                            <asp:CheckBox runat="server" ID="ChbReverse" Text="�Ƿ���ɼ�" />
                            <asp:CheckBox runat="server" ID="ChbPicNews" Text="�����а���ͼƬʱ����ΪͼƬ����" />
                        </td>
                    </tr>
                    <tr class="TR_BG_list">
                        <td class="list_link" width="30%" align="center">
                            ����ѡ��:
                        </td>
                        <td class="list_link" width="70%">
                            <asp:CheckBox runat="server" ID="ChbHTML" Text="HTML" />
                            <asp:CheckBox runat="server" ID="ChbSTYLE" Text="STYLE" />
                            <asp:CheckBox runat="server" ID="ChbDIV" Text="DIV" />
                            <asp:CheckBox runat="server" ID="ChbA" Text="A" />
                            <asp:CheckBox runat="server" ID="ChbCLASS" Text="CLASS" />
                            <asp:CheckBox runat="server" ID="ChbFONT" Text="FONT" />
                            <asp:CheckBox runat="server" ID="ChbSPAN" Text="SPAN" />
                            <asp:CheckBox runat="server" ID="ChbOBJECT" Text="OBJECT" />
                            <asp:CheckBox runat="server" ID="ChbIFRAME" Text="IFRAME" />
                            <asp:CheckBox runat="server" ID="ChbSCRIPT" Text="SCRIPT" />
                        </td>
                    </tr>
                    <tr class="TR_BG_list">
                        <td class="list_link" colspan="2" align="center">
                            <asp:HiddenField ID="HidSiteID" runat="server" />
                            <asp:Button ID="BtnSiteOK" Text=" �� �� " runat="server" CssClass="form" OnClick="BtnSiteOK_Click" />
                            <asp:Button ID="BtnNext" Text="��һ��" CssClass="form" runat="server" OnClick="BtnNext_Click" />
                            <input type="reset" value=" �� �� " class="form" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
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