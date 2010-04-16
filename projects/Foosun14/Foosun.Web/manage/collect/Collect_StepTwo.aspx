<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_collect_Collect_StepTwo" Codebehind="Collect_StepTwo.aspx.cs" %>

<%@ Register Src="CollectEditor.ascx" TagName="CollectEditor" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>FoosunCMS For .NET v1.0.0</title>
    <link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/css.css"
        rel="stylesheet" type="text/css" />
    <script language="JavaScript" type="text/javascript" charset="utf-8" src="../../configuration/js/Prototype.js"></script>
    <script language="JavaScript" type="text/javascript" charset="utf-8" src="../../configuration/js/Public.js"></script>
    <script language="javascript" type="text/javascript">
function ChangeCutPara(obj,flag)
{
    var flag;
    if(document.getElementById('RadPageNone').checked)
        flag = 0;
    else if(document.getElementById('RadPageFlag').checked)
        flag = 1;
    else if(document.getElementById('RadPageSingle').checked)
        flag = 2;
    else if(document.getElementById('RadPageIndex').checked)
        flag = 3;
    var tb = document.getElementById('tabList');
    var n = 1;
    var sp = document.getElementById('SpanPage');
    switch(flag)
    {
        case 0:
            tb.rows[n+1].style.display = 'none';
            tb.rows[n+2].style.display = 'none';
            break;
        case 1:
            tb.rows[n+1].style.display = '';
            tb.rows[n+2].style.display = 'none';
            sp.innerText = '�ӵ�ǰҳ��ȡ��һҳ�ĵ�ַ���ٴ���һҳ�л�ȡ��һҳ�ĵ�ַ���Դ����ơ�����:<a href=[����ҳ��]>��һҳ,��ǰҳ�����һҳ����զһ';
            break;
        case 2:
            tb.rows[n+1].style.display = '';
            tb.rows[n+2].style.display = 'none';
            sp.innerText = '�ӵ�ǰҳ��ȡ���з�ҳ�ĵ�ַ��';
            break;
        case 3:
            tb.rows[n+1].style.display = 'none';
            tb.rows[n+2].style.display = '';
            //sp.innerText = '����:<a href=?page=^$^&class_ID=32>  ^$^Ϊ�����仯��ҳ��ֵ';
            break;
    }
}
function StepBack()
{
    location.href = "Collect_Add.aspx?Type=Site&ID="+ document.getElementById("HidSiteID").value;
}
function LoadMe(flag)
{
    ChangeCutPara();
}
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
                            λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />
                            <a href="Collect_List.aspx" target="sys_main" class="list_link">վ������</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />������
                        </div>
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
                <tr>
                    <td>
                        ���ܣ�<a href="Collect_List.aspx" class="list_link">վ���б�</a>&nbsp;��&nbsp;<a class="topnavichar" href="Collect_RuleList.aspx">�ؼ��ֹ���</a>&nbsp;��&nbsp;<a class="topnavichar" href="Collect_News.aspx">���Ŵ���</a></td>
                </tr>
            </table>
    <table id="tabList" width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
        <tr class="TR_BG_list" id="tt">
            <td class="list_link" width="30%" align="center">
                �б�����:
            </td>
            <td class="list_link" width="70%">
                <uc1:CollectEditor ID="EdtList" runat="server" />
            </td>
        </tr>
        <tr class="TR_BG_list">
            <td class="list_link" width="30%" align="center">��ҳ����</td>
            <td class="list_link">
                <asp:RadioButton onclick="ChangeCutPara();" runat="server" ID="RadPageNone" GroupName="RadPageSet" Text="����ҳ"/>
                <asp:RadioButton onclick="ChangeCutPara();" runat="server" ID="RadPageFlag" GroupName="RadPageSet" Text="�ݹ��ҳ����"/>
                <asp:RadioButton onclick="ChangeCutPara();" runat="server" ID="RadPageSingle" GroupName="RadPageSet" Text="��ҳ��ҳ����" OnCheckedChanged="RadPageSingle_CheckedChanged"/>
                <asp:RadioButton onclick="ChangeCutPara();" runat="server" ID="RadPageIndex" GroupName="RadPageSet" Text="������ҳ����"/>
            </td>
        </tr>
        <tr class="TR_BG_list">
            <td class="list_link" align="center">
                ����ҳ��</td>
            <td class="list_link">
                <uc1:CollectEditor ID="EdtPageFlag" runat="server" />
                <br />
                <span style="color:Red" id="SpanPage"></span>
            </td>
        </tr>
        <tr class="TR_BG_list">
            <td class="list_link" align="center">
                ��������</td>
            <td class="list_link">
                <uc1:CollectEditor ID="EdtPageIndex" runat="server" />
                ҳ�뿪ʼ��
                <asp:TextBox runat="server" size="5" ID="TxtPageStart" CssClass="form"/>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TxtPageStart"
                    Display="Dynamic" ErrorMessage="��ʼҳ�������1-1000���ڵ�����!" MaximumValue="1000" MinimumValue="1"
                    SetFocusOnError="True" Type="Integer" CssClass="form"></asp:RangeValidator>
                &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                ҳ�������
                <asp:TextBox runat="server" size="5" ID="TxtPageEnd"/>
                <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TxtPageEnd"
                    Display="Dynamic" ErrorMessage="����ҳ�������1-1000���ڵ�����!" MaximumValue="1000" MinimumValue="1"
                    SetFocusOnError="True" Type="Integer"></asp:RangeValidator><br><FONT color=#ff4500>����:&lta href=?page=[ҳ��]&amp;class_ID=32&gt; ע: [ҳ��]Ϊ�����仯��ҳ��ֵ</FONT>
                </td>
        </tr>
        <tr class="TR_BG_list">
            <td class="list_link" align="center" colspan="2">
                <asp:HiddenField ID="HidSiteID" runat="server" />
                <input type="button" value="��һ��" class="form" onclick="StepBack()"/>
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