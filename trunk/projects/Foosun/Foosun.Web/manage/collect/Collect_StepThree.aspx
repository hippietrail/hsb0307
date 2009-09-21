<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_collect_Collect_StepThree" Codebehind="Collect_StepThree.aspx.cs" %>
<%@ Register Src="CollectEditor.ascx" TagName="CollectEditor" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>FoosunCMS For .NET v1.0.0</title>
    <link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/css.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" type="text/javascript" charset="utf-8" src="../../configuration/js/Prototype.js"></script>
    <script language="JavaScript" type="text/javascript" charset="utf-8" src="../../configuration/js/Public.js"></script>
    <script language="javascript" type="text/javascript">
    function StepBack()
	{
	    location.href = "Collect_StepTwo.aspx?ID="+ document.getElementById("HidSiteID").value;
	}
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
                                src="../../sysImages/folder/navidot.gif" border="0" />������
                        </div>
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
                <tr>
                    <td>
                        ���ܣ�<a href="Collect_List.aspx" class="list_link">վ���б�</a>&nbsp;��&nbsp;<a class="topnavichar"
                            href="Collect_RuleList.aspx">�ؼ��ֹ���</a>&nbsp;��&nbsp;<a class="topnavichar" href="Collect_News.aspx">���Ŵ���</a></td>
                </tr>
            </table>
            <table id="tabList" width="98%" border="0" align="center" cellpadding="5" cellspacing="1"
                class="table">
                <tr class="TR_BG_list" id="tt">
                    <td class="list_link" width="15%" align="center">
                        �б�URL:
                    </td>
                    <td class="list_link" width="85%">
                        <uc1:CollectEditor ID="EdtListURL" runat="server" />
                    </td>
                </tr>
                <tr class="TR_BG">
                    <td class="sys_topBg" colspan="2" align="center">
                        <b>����</b>
                    </td>
                </tr>
                <tr class="TR_BG_list">
                    <td class="list_link" colspan="2" align="center">
                        <asp:TextBox runat="server" ReadOnly="true" ID="TxtContentCode" TextMode="MultiLine"
                            Height="271" Style="width: 770px; height: 130px" CssClass="form" /></td>
                </tr>
                <tr class="TR_BG">
                    <td class="sys_topBg" colspan="2" align="center">
                        <b>���</b></td>
                </tr>
                <tr class="TR_BG_list">
                    <td class="list_link" colspan="2" align="center">
                        <iframe frameborder="1" src="about:blank" id="PreviewArea" name="PreviewArea" marginheight="1"
                            marginwidth="1" style="width: 770px; height: 150px" scrolling="yes" class="form">
                        </iframe>
                    </td>
                </tr>

                <script language="javascript" type="text/javascript">
            var txtarea = document.getElementById("TxtContentCode");
            window.frames["PreviewArea"].document.write(unescape(txtarea.value));
                </script>

                <tr class="TR_BG_list">
                    <td class="list_link" align="center" colspan="2">
                        <asp:HiddenField ID="HidSiteID" runat="server" />
                        <asp:HiddenField ID="HidUrl" runat="server" />
                        <input type="button" value="��һ��" class="form" onclick="StepBack()" />
                        <asp:Button runat="server" ID="BtnNext" Text="��һ��" CssClass="form" OnClick="BtnNext_Click" />
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
