<%@ Page Language="C#" AutoEventWireup="true" Codebehind="CustomForm.aspx.cs" Inherits="Foosun.Web.manage.Sys.CustomForm" %>

<%@ Register Src="../../controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/css.css"
        rel="stylesheet" type="text/css" />

    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>

    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<script type="text/javascript" language="javascript">
<!--
function GetJS(id)
{
    var WWidth = (window.screen.width-500)/2;
    var Wheight = (window.screen.height-150)/2-50;
    window.open ('CustomForm_JS.aspx?ID='+id, '��ȡJS', 'height=165px, width=400px,toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no,top='+Wheight+', left='+WWidth+', status=no');
}
function DeleteFrm(id)
{
    if(window.confirm('��ȷ��Ҫɾ���ñ���?���ݽ����ܱ��ָ�!'))
    {
        var options={
            method:'post',
            parameters:"Option=DeleteForm&ID="+ id,
            onComplete:
                function(transport)
	            {
	                var retv =transport.responseText;
	                OnRcvMsg(retv);
	            } 
	    }
	    new  Ajax.Request('CustomForm.aspx',options);
    }
}
function OnRcvMsg(rtstr)
{
   var n = rtstr.indexOf("%");
   alert(rtstr.substr(n+1,rtstr.length-n-1));
   if(parseInt(rtstr.substr(0,n)) > 0)
   {
      __doPostBack('PageNavigator1$LnkBtnGoto','');
   }
}
function GetHtml(id,f)
{
    var WWidth = (window.screen.width-600)/2;
    var Wheight = (window.screen.height-500)/2-50;
    window.open('CustomForm_HtmlCode.aspx?ID='+id +'&op='+ f, '��ȡHTML', 'height=500px, width=600px,toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no,top='+Wheight+', left='+WWidth+', status=no'); 
}
//-->
</script>
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
                            src="../../sysImages/folder/navidot.gif" border="0" />�Զ��������</div>
                </td>
            </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
            <tr>
                <td>
                   &nbsp;&nbsp;<a href="CustomForm_Add.aspx" class="topnavichar">�½���</a></td>
            </tr>
        </table>
        <div>
            <asp:Repeater ID="RptData" runat="server">
                <HeaderTemplate>
                    <table width="98%" border="0" align="center" cellpadding="4" cellspacing="1" id="tablist"
                        class="table">
                        <tr class="TR_BG">
                            <td width="15%" align="center" class="sysmain_navi">
                                ������</td>
                            <td width="10%" align="center" class="sysmain_navi">
                                ����</td>
                            <td width="35%" align="center" class="sysmain_navi">
                                ˵��</td>
                            <td width="40%" align="center" class="sysmain_navi">
                                ����</td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr class="TR_BG_list" onmouseover="overColor(this)" onmouseout="outColor(this)">
                        <td class="list_link">
                            <%# DataBinder.Eval(Container.DataItem, "formname")%>
                        </td>
                        <td class="list_link">
                            <%# DataBinder.Eval(Container.DataItem, "formtablename")%>
                        </td>
                        <td class="list_link">
                            <%# DataBinder.Eval(Container.DataItem, "memo")%>
                        </td>
                        <td class="list_link" align="center"><a class="list_link" href="CustomForm_Item.aspx?ID=<%# DataBinder.Eval(Container.DataItem, "id")%>">�������</a> <a class="list_link" href="javascript:GetHtml(<%# DataBinder.Eval(Container.DataItem, "id")%>,0);">HTML����</a> <a class="list_link" href="javascript:GetHtml(<%# DataBinder.Eval(Container.DataItem, "id")%>,1);">Ԥ��</a> <a class="list_link" href="CustomForm_Data.aspx?id=<%# DataBinder.Eval(Container.DataItem, "id")%>">����</a> <a class="list_link" href="javascript:GetJS(<%# DataBinder.Eval(Container.DataItem, "id")%>);">JS����</a> <a class="list_link" href="CustomForm_Add.aspx?ID=<%# DataBinder.Eval(Container.DataItem, "id")%>">�޸�</a> <a class="list_link" href="javascript:DeleteFrm(<%# DataBinder.Eval(Container.DataItem, "id")%>);">ɾ��</a></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <div align="right" style="width: 98%">
                <uc1:PageNavigator ID="PageNavigator1" runat="server" />
            </div>
        </div>
        <br />
        <br />
        <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg"
            style="height: 76px">
            <tr>
                <td align="center">
                    <%Response.Write(CopyRight); %>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
