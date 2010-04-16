<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_collect_Collect_StepFour" Codebehind="Collect_StepFour.aspx.cs" %>

<%@ Register Src="CollectEditor.ascx" TagName="CollectEditor" TagPrefix="uc1" %>
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
    function ChangeSet(obj)
    {
        var td2 = obj.parentNode.parentNode.lastChild;
        if(obj.checked)
        {
            td2.firstChild.style.display = 'none';
            td2.childNodes[1].style.display = '';
        }
        else
        {
            td2.firstChild.style.display = '';
            td2.childNodes[1].style.display = 'none';
        }
    }
    function ChangePage()
    {
        var flag;
        if(document.getElementById('RadPageNone').checked)
            flag = 0;
        else if(document.getElementById('RadPageOther').checked)
            flag = 1;
        else if(document.getElementById('RadPageCode').checked)
            flag = 2;
        var tr1 = document.getElementById("Tr_PageOther");
        var tr2 = document.getElementById("Tr_PageCode");
        switch(flag)
        {
            case 0:
                tr1.style.display = 'none';
                tr2.style.display = 'none';
                break;
            case 1:
                tr1.style.display = '';
                tr2.style.display = 'none';
                break;
            case 2:
                tr1.style.display = 'none';
                tr2.style.display = '';
                break;
        }
    }
    function ChangeDiv(ID)
    {
	    document.getElementById('td_baseinfo').className='m_up_bg';
	    document.getElementById('td_preview').className='m_up_bg';
        document.getElementById('tr_baseinfo').style.display='none';
        document.getElementById('tr_preview').style.display='none';
        document.getElementById('td_'+ ID).className='m_down_bg';
        document.getElementById('tr_'+ ID).style.display='';
	}
	function ChangeUrl(obj)
	{
	    var url = obj.options[obj.selectedIndex].value;
	    var frm = document.getElementById("PreviewArea");
	    frm.src = url;
    }
	function StepBack()
	{
	    location.href = "Collect_StepThree.aspx?ID="+ document.getElementById("HidSiteID").value;
	}
	function LoadMe(flag)
	{
	    ChangeDiv('baseinfo');
        ChangeSet(document.getElementById('ChbAuthor'));
        ChangeSet(document.getElementById('ChbSource'));
        ChangeSet(document.getElementById('ChbTime'));
        ChangePage();
    }
    //-->
    </script>

</head>
<body onload="LoadMe(Math.random())">
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
                                src="../../sysImages/folder/navidot.gif" border="0" /><a href="Collect_List.aspx" target="sys_main" class="list_link">վ������</a><img alt="" src="../../sysImages/folder/navidot.gif"
                                        border="0" />������
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
            <table border="0" cellpadding="0" align="center" cellspacing="0" width="98%" class="toptable">
                <tr class="TR_BG_list">
                    <td width="30%" class="m_down_bg" id="td_baseinfo" onclick="javascript:ChangeDiv('baseinfo');"
                        style="cursor: hand;" align="center">
                        ��������</td>
                    <td width="30%" class="m_up_bg" id="td_preview" onclick="javascript:ChangeDiv('preview');"
                        style="cursor: hand;" align="center">
                        Ԥ��</td>
                    <td width="30%" class="m_up_bg">
                    </td>
                </tr>
                <tr class="TR_BG_list" id="tr_baseinfo">
                    <td colspan="3" valign="top" class="list_link">
                        <table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
                            <tr class="TR_BG_list">
                                <td class="list_link" width="30%" align="center">
                                    ����:
                                </td>
                                <td class="list_link" width="70%">
                                    <uc1:CollectEditor ID="EdtCaption" runat="server" />
                                </td>
                            </tr>
                            <tr class="TR_BG_list">
                                <td class="list_link" width="30%" align="center">
                                    ����:
                                </td>
                                <td class="list_link" width="70%">
                                    <uc1:CollectEditor ID="EdtContent" runat="server" />
                                </td>
                            </tr>
                            <tr class="TR_BG_list">
                                <td class="list_link" width="30%" align="center">
                                    ����:<br />
                                    �ֶ�<asp:CheckBox runat="server" ID="ChbAuthor" onclick="ChangeSet(this)" />
                                </td>
                                <td class="list_link" width="70%">
                                    <div>
                                        <uc1:CollectEditor ID="EdtAuthor" Text="[����]" runat="server" />
                                    </div>
                                    <div>
                                        <asp:TextBox runat="server" ID="TxtAuthor" Width="98%" MaxLength="100" CssClass="form" /></div>
                                </td>
                            </tr>
                            <tr class="TR_BG_list">
                                <td class="list_link" width="30%" align="center">
                                    ��Դ:<br />
                                    �ֶ�<asp:CheckBox runat="server" ID="ChbSource" onclick="ChangeSet(this)" />
                                </td>
                                <td class="list_link" width="70%">
                                    <div>
                                        <uc1:CollectEditor Text="[����]" ID="EdtSource" runat="server" />
                                    </div>
                                    <div>
                                        <asp:TextBox runat="server" ID="TxtSource" Width="98%" MaxLength="100" CssClass="form" /></div>
                                </td>
                            </tr>
                            <tr class="TR_BG_list">
                                <td class="list_link" width="30%" align="center">
                                    ʱ��:<br />
                                    �ֶ�<asp:CheckBox runat="server" ID="ChbTime" onclick="ChangeSet(this)" />
                                </td>
                                <td class="list_link" width="70%">
                                    <div>
                                        <uc1:CollectEditor Text="[����]" ID="EdtTime" runat="server" />
                                    </div>
                                    <div>
                                        <asp:TextBox runat="server" ID="TxtTime" Width="98%" MaxLength="25" CssClass="form" />
                                    </div>
                                </td>
                            </tr>
                            <tr class="TR_BG_list">
                                <td class="list_link" align="center">
                                    ��ҳ��ʽ</td>
                                <td class="list_link">
                                    <asp:RadioButton runat="server" Checked="true" onclick="ChangePage()" ID="RadPageNone" GroupName="RadGroupPage"
                                        Text="���������ŷ�ҳ" />
                                    <asp:RadioButton runat="server" onclick="ChangePage()" ID="RadPageOther" GroupName="RadGroupPage"
                                        Text="�ݹ��ҳ����" />
                                    <asp:RadioButton runat="server" onclick="ChangePage()" ID="RadPageCode" GroupName="RadGroupPage"
                                        Text="��ҳ��ȡ��ҳ����" />
                                </td>
                            </tr>
                            <tr class="TR_BG_list" runat="server" id="Tr_PageOther">
                                <td class="list_link" width="30%" align="center">
                                    �ݹ��ҳ����
                                </td>
                                <td class="list_link" width="70%">
                                    <uc1:CollectEditor ID="EdtPageOther" runat="server" />
                                    <br />
                                    <span style="color: red;">��:&lt;a href="[��ҳ����]"&gt;��һҳ Ҫ��:��һҳ,����Ϊ����ҳ����Ψһ�ַ�,ֻ�е�һ��"[��ҳ����]"��Ч��</span>
                                </td>
                            </tr>
                            <tr class="TR_BG_list" runat="server" id="Tr_PageCode">
                                <td class="list_link" width="30%" align="center">
                                    ��ҳ��ȡ��ҳ����:
                                </td>
                                <td class="list_link" width="70%">
                                    <uc1:CollectEditor ID="EdtPageRule" runat="server" />
                                    <br />
                                    <span style="color: red;">��:&lt;a href="[��ҳ����]"&gt;[����]&lt;/a&gt; Ҫ�� [��ҳ����] ǰ�ַ�������Ϊ����ҳ����Ψһ����</span>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr class="TR_BG_list" id="tr_preview">
                    <td colspan="3" valign="top" class="list_link">
                        <table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
                            <tr class="TR_BG">
                                <td class="sys_topBg" align="center">
                                    <b>�ɼ�����ҳ��ַ</b>
                                </td>
                            </tr>
                            <tr class="TR_BG_list">
                                <td class="list_link" align="center">
                                    <asp:DropDownList runat="server" onchange="ChangeUrl(this)" ID="DdlObtUrl" Style="width: 770px;"
                                        CssClass="form" />
                                </td>
                            </tr>
                            <tr class="TR_BG">
                                <td class="sys_topBg" align="center">
                                    <b>���</b>
                                </td>
                            </tr>
                            <tr class="TR_BG_list">
                                <td class="list_link" align="center">
                                    <iframe frameborder="1" src="about:blank" id="PreviewArea" name="PreviewArea" marginheight="1"
                                        marginwidth="1" style="width: 770px; height: 371px" scrolling="yes" class="form">
                                    </iframe>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr class="TR_BG_list">
                    <td class="list_link" align="center" colspan="3">
                        <asp:HiddenField ID="HidSiteID" runat="server" />
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
