<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_Sys_checkFiles" Codebehind="checkFiles.aspx.cs" %>

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
function CheckFile()
{
    var chb = document.getElementById('ChbIsLocal');
    var fl = document.getElementById('localfile');
    if(!chb.checked)
    {
        chb.checked = true;
        document.getElementById('divselfile').style.display = '';
        fl.focus();
        alert('��ѡ�񱾵��ļ���Ϊ�Աȱ�׼!');
        return false;
    }
    if(fl.value.trim() == '')
    {
        alert('��ѡ�񱾵��ļ���Ϊ�Աȱ�׼!');
        fl.focus();
        return false;
    }
}
function RemoveFile()
{
    document.getElementById('ChbIsLocal').checked = false;
}
function LoadMe(i)
{
    var chb = document.getElementById('ChbIsLocal');
    var obj = document.getElementById('divselfile');
    if(chb != null)
    {
        if(chb.checked)
            obj.style.display = '';
        else
            obj.style.display = 'none';
    }
}
function Hint()
{
    alert();
}
//-->
</script>
</head>
<body onload="LoadMe(Math.random());">
    <form id="form1" runat="server">
        <table id="top1" width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
            <tr>
                <td height="1" colspan="2">
                </td>
            </tr>
            <tr>
                <td width="57%" class="sysmain_navi" style="padding-left: 14px;">
                    �ļ��Ա�</td>
                <td width="43%">
                    λ�õ�����<a href="../main.aspx" class="list_link" target="sys_main">��ҳ</a><img alt=""
                        src="../../sysImages/folder/navidot.gif" border="0" />�ļ��Ա�</td>
            </tr>
        </table>
        <asp:Panel runat="server" ID="PnlStart">
            <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
                <tr>
                    <td style="padding-left: 12px;">
                        <a href="javascript:getDownfilexml();" class="list_link">�ӷ�Ѷ�ٷ�վ�����ļ���</a>
                        <asp:LinkButton runat="server" CssClass="list_link" Text="���������ļ���" ID="LnkDownload" OnClick="LnkDownload_Click"></asp:LinkButton>
                        <a href="CreateCheckfile.aspx" target="_blank" onclick="Hint();" class="list_link"></a>
                     </td>
                </tr>
            </table>
            <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" class="table">
                <tr class="TR_BG_list">
                    <td style="padding-left: 12px;">
                        <asp:CheckBox ID="ChbIsLocal" onclick="sLocal(this);" Text="ѡ�񱾵صİ�(XML��,��ʹ�÷�Ѷ�涨�ĸ�ʽ��xml�ļ�)"
                            runat="server" /><font color="red">Ϊ�˰�ȫ,�뽫�Ա��ļ�����վ�ֿ�,����ڱ���!</font>
                        <br />
                        <br />
                        <div id="divselfile">
                        <asp:FileUpload runat="server" ID="localfile" />
                            <br />
                            <br />
                        </div>
                    </td>
                </tr>
                <tr class="TR_BG_list">
                    <td align="center">
                        <asp:Button ID="BtnCompare" runat="server" CssClass="form" Text="�Ա����ļ���Ϊ��׼�Ա�" OnClick="BtnCompare_Click" />
                        <asp:Button ID="BtnOnline" runat="server" CssClass="form" Text="�Թٷ��ļ���Ϊ��׼�Ա�" OnClick="BtnOnline_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel runat="server" ID="PnlResult">
            <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
                <tr>
                    <td style="padding-left: 12px;">
                        <a href="checkFiles.aspx" class="list_link">����</a>
                        <asp:LinkButton runat="server" ID="LnkAll" Text="ȫ����ʾ" CssClass="list_link" OnClick="LnkAll_Click"></asp:LinkButton>
                        <asp:LinkButton runat="server" ID="LnkDiff" Text="ֻ��ʾ�����ļ�" CssClass="list_link" OnClick="LnkDiff_Click"></asp:LinkButton>
                    </td>
                </tr>
                 <tr>
                    <td style="padding-left: 12px;"><font color="red">ע:</font>
                '��'----���ߴ�Сʱ����ȫ��ͬ '<font color="red">��</font>'----���ߴ�С����ͬ '<font color="sienna">��</font>'----���߽���ʱ�䲻ͬ<br />
                '<font style="border-left:inherit; text-decoration: line-through;color:Blue;">��</font>'----��ʾ������,���Ǳ�׼�ļ���û�е��ļ�
                '<font color="gray">��</font>'----��ʾ����û�е��ļ�
                �ļ��Ĵ�С�ĵ�λΪ�ֽ�(byte)
                  </td>
                </tr>
            </table>
            <table runat="server" id="TabResult" width="98%" border="0" align="center" cellpadding="4"
                cellspacing="1" bgcolor="#ffffff" class="table">
                <tr class="TR_BG" style="color: Green">
                    <td align="center" class="sys_topBg" width="2%">
                    </td>
                    <td align="center" class="sys_topBg" width="38%">
                        �ļ���</td>
                    <td align="center" class="sys_topBg" width="10%">
                        ��׼��С</td>
                    <td align="center" class="sys_topBg" width="20%">
                        ��׼�޸�ʱ��</td>
                    <td align="center" class="sys_topBg" width="10%">
                        ���ش�С</td>
                    <td align="center" class="sys_topBg" width="20%">
                        �����޸�ʱ��</td>
                </tr>
            </table>
            <table runat="server" id="Table1" width="98%" border="0" align="center" cellpadding="4"
                cellspacing="1" bgcolor="#ffffff" class="table">
                <tr>
                    <td>
                        <asp:Label runat="server" ID="LblStat"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:HiddenField runat="server" ID="HidStandard" />
        </asp:Panel>
        <br />
        <br />
        <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg"
            style="height: 76px">
            <tr>
                <td align="center">
                    <label id="copyright" runat="server" />
                </td>
            </tr>
        </table>
    </form>
    <iframe id="downloadfromfoosun" src="about:blank" border="0" height="0" width="0"
        style="visibility: hidden"></iframe>
</body>
</html>

<script language="javascript" type="text/javascript">
function getDownfilexml()
{
    if(confirm('��ȷ��Ҫ���´ӷ�Ѷ(Foosun.net)���� [�ļ���] ��?\n�����ȷ�ϡ����[ȷ��]��ť'))
    {
	    var ifm = document.getElementById("downloadfromfoosun");
	    ifm.src = "<%Response.Write(ReloadURL);%>";
    }
}

function sLocal(obj)
{
   var objdiv = document.getElementById("divselfile");
   if(obj.checked){objdiv.style.display="";}else{objdiv.style.display="none";}                      
}
</script>

