<%@ Page Language="C#" AutoEventWireup="true" Codebehind="CustomForm_Item_Add.aspx.cs" Inherits="Foosun.Web.manage.Sys.CustomForm_Item_Add" %>

<%@ Register Src="../../controls/UserPop.ascx" TagName="UserPop" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/css.css"
        rel="stylesheet" type="text/css" />

    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>

    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<script language="javascript" type="text/javascript">
    <!--
    function changetype(obj)
    {
        var val = obj.options[obj.selectedIndex].value;
        var f = 'none';
        if(val == 'RadioBox' || val == 'CheckBox' || val == 'DropList' || val == 'List')
            f = '';
        document.getElementById('tr_sel').style.display = f;
    }
    function LoadMe(i)
    {
        changetype(document.getElementById('DdlItemType')); 
    }
    //-->
    </script>
</head>
<body onload="LoadMe(Math.random())">
    <form id="Form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
            <tr>
                <td height="1" colspan="2">
                </td>
            </tr>
            <tr>
                <td width="57%" class="sysmain_navi" style="padding-left: 14px; height: 32px;">
                    �Զ������<span class="helpstyle" style="cursor: hand;" title="����鿴����" onclick="Help('',this)">(����)</span></td>
                <td width="43%" class="topnavichar" style="padding-left: 14px; height: 32px;">
                    <div align="left">
                        λ�õ�����<a href="../main.aspx" target="sys_main" class="topnavichar">��ҳ</a><img alt=""
                            src="../../sysImages/folder/navidot.gif" border="0" /><a href="CustomForm.aspx" class="topnavichar">�Զ����</a>
                            <img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><asp:HyperLink ID="HlkManage" runat="server" class="topnavichar">�������</asp:HyperLink>
                            <img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><asp:Literal runat="server" ID="LtrCaption"></asp:Literal></div>
                </td>
            </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
            <tr>
                <td>
                    &nbsp;&nbsp;<asp:HyperLink ID="HlkBack" runat="server" class="topnavichar">����</asp:HyperLink></td>
            </tr>
        </table>
        <table width="98%" border="0" align="center" cellpadding="4" cellspacing="1" id="tablist"
            class="table">
             <tr class="TR_BG_list">
                <td width="20%" align="right" class="list_link">
                    ��ǰ����</td>
                <td width="80%" align="left" class="list_link">
                    <asp:Label runat="server" ID="LblFormName"></asp:Label>
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td width="20%" align="right" class="list_link">
                    �������ƣ�</td>
                <td width="80%" align="left" class="list_link">
                    <asp:TextBox runat="server" ID="TxtName" Width="310px" CssClass="form" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtName"
                        Display="Dynamic" ErrorMessage="����д��������" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td width="20%" align="right" class="list_link">
                    �ֶ�����</td>
                <td width="80%" align="left" class="list_link">
                    <asp:TextBox runat="server" ID="TxtFieldName" Width="310px" CssClass="form" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtFieldName"
                        Display="Dynamic" ErrorMessage="����д�ֶ���" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtFieldName"
                        Display="Dynamic" ErrorMessage="�ֶ���������Ӣ����ĸ�����֡��»������!" SetFocusOnError="True"
                        ValidationExpression="^[A-Za-z0-9_]+$"></asp:RegularExpressionValidator></td>
            </tr>
            <tr class="TR_BG_list">
                <td align="right" class="list_link">
                    ������ţ�</td>
                <td class="list_link">
                    <asp:DropDownList ID="DdlSN" runat="server">
                    </asp:DropDownList>���ԽС������Խǰ��</td>
            </tr>
             <tr class="TR_BG_list">
                <td width="20%" align="right" class="list_link">
                    �Ƿ����ã�</td>
                <td width="80%" align="left" class="list_link">
                    <asp:RadioButton runat="server" ID="RadOpenYes" GroupName="RadGrpState" Text="��" Checked="True" />
                    <asp:RadioButton runat="server" ID="RadOpenNo" GroupName="RadGrpState" Text="��" />
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td align="right" class="list_link">
                    �Ƿ���</td>
                <td class="list_link">
                    <asp:RadioButton ID="RadNotNullYes" runat="server" Text="��" GroupName="RadGrpNull" />
                    <asp:RadioButton ID="RadNotNullNo" runat="server" Text="��" GroupName="RadGrpNull" Checked="True" /></td>
            </tr>
            <tr class="TR_BG_list">
                <td width="20%" align="right" class="list_link">
                    �������ͣ�</td>
                <td width="80%" align="left" class="list_link">
                    <asp:DropDownList ID="DdlItemType" runat="server" onchange="changetype(this);">
                    </asp:DropDownList></td>
            </tr>
            <tr class="TR_BG_list">
               <td align="right" class="list_link">
                    �ı�����</td>
               <td class="list_link">
                    <asp:TextBox runat="server" ID="TxtMaxSize" Width="66px" CssClass="form" MaxLength="10">20</asp:TextBox>0��ʾ������<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TxtMaxSize"
                       Display="Dynamic" ErrorMessage="�ı����ȱ���������" MaximumValue="4000" MinimumValue="0"
                       SetFocusOnError="True" Type="Integer"></asp:RangeValidator></td>
            </tr>
            <tr class="TR_BG_list">
                <td width="20%" align="right" class="list_link">
                    Ĭ��ֵ��</td>
                <td width="80%" align="left" class="list_link">
                    <asp:TextBox ID="TxtDefault" runat="server" MaxLength="50" Width="310px"></asp:TextBox></td>
            </tr>
            <tr class="TR_BG_list" id="tr_sel">
                <td width="20%" align="right" class="list_link">
                    ѡ�</td>
                <td width="80%" align="left" class="list_link">
                    <asp:TextBox ID="TxtSelectItem" runat="server" Height="143px" TextMode="MultiLine" Width="288px"></asp:TextBox>
                    ÿһ��Ϊһ���б�ѡ��</td>
            </tr>
            <tr class="TR_BG_list">
                <td width="20%" align="right" class="list_link">
                    ������ʾ��</td>
                <td width="80%" align="left" class="list_link">
                    <asp:TextBox TextMode="multiLine" runat="server" ID="TxtPrompt" Height="140px" Width="292px"></asp:TextBox>
                    (�������Ե���ʾ��Ϣ��255���ַ�������Ч)</td>
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
        <asp:HiddenField runat="server" ID="HidItemID" />
        <asp:HiddenField runat="server" ID="HidFormID" />
    </form>
</body>
</html>
