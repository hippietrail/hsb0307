<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_news_Site_List" Codebehind="Site_List.aspx.cs" %>
<%@ Register Src="../../controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<script language="javascript" type="text/javascript">
<!--
function OnRcvMsg(rtstr)
{
   var n = rtstr.indexOf("%");
   alert(rtstr.substr(n+1,rtstr.length-n-1));
   if(parseInt(rtstr.substr(0,n)) > 0)
   {
      __doPostBack('PageNavigator1$LnkBtnGoto','');
   }
}

function GetSelected()
{
    var num = 0;
    var param = "";
    var tb = document.getElementById("tablist");
    for(var i=1;i<tb.rows.length;i++)
    {
        var tcell = tb.rows[i].cells[3];
        for(var j=0;j<tcell.childNodes.length;j++)
        {
            var obj = tcell.childNodes[j];
            if(obj.name == "checkbox")
            {
                if(obj.checked)
                {
                    if(num > 0) param += ",";
                    param += obj.value;
                    num++;
                }
                break;
            }
        }
    }
    return param;
}

function RecyleSite(id)
{
    var l = "";
    if(id == "-")
    {
        l = GetSelected();
        if(l == "")
        {
            alert("��û��ѡ���κ�վȺ!");
            return;
        }
     }
     else
     {
        l = id;
     }
     if(window.confirm("��ȷ��Ҫ��ѡ�е�վȺ�������վ��?"))
     {
        if(window.confirm("���ٴ�ȷ�����Ĳ���,��վ�������е���Ŀ��ר�⡢���Ŷ������������վ!�Ƿ�Ҫ��������?"))
        {
            var  options={
            method:'post',
            parameters:"Option=RecyleSite&SiteID="+ l,
            onComplete:
                function(transport)
	            {
	                var retv =transport.responseText;
	                OnRcvMsg(retv);
	            } 
	        }
	        new  Ajax.Request('Site_List.aspx',options);
	    }
    }
}

function DeleteSite(id)
{
    var l = "";
    if(id == "-")
    {
        l = GetSelected();
        if(l == "")
        {
            alert("��û��ѡ���κ�վȺ!");
            return;
        }
     }
     else
     {
        l = id;
     }
    if(window.confirm("��ȷ��Ҫɾ��ѡ�е�վȺ��?���ݽ����ɻָ�!"))
    {
        if(window.confirm("���ٴ�ȷ�����Ĳ���,��վ�������е���Ŀ��ר�⡢���Ŷ���������ɾ��,���ݲ����ٻָ�!�Ƿ�Ҫ��������?"))
        {
            var  options={
            method:'post',
            parameters:"Option=DeleteSite&SiteID="+ l,
            onComplete:
                function(transport)
	            {
	                var retv =transport.responseText;
	                OnRcvMsg(retv);
	            } 
	        }
	        new  Ajax.Request('Site_List.aspx',options);
	    }
    }
}
//-->
</script>
</head>
<body>
<form id="Form1" runat="server">
<div>
<table id="top1" width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%"  class="sysmain_navi"  style="PADDING-LEFT: 14px" >վȺ����</td>
          <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />վȺ����</div></td>
        </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
  <tr>
    <td style="PADDING-LEFT: 14px"><label id="addsite" runat="server" /> <%--| <a class="topnavichar" href="javascript:RecyleSite('-')">ɾ��ѡ��վȺ</a> | <a class="topnavichar" href="javascript:DeleteSite('-')">����ɾ��ѡ��վȺ</a>--%></td>
  </tr>
</table>
<asp:Repeater ID="RptSite" runat="server" OnItemDataBound="RptSite_ItemDataBound">
<HeaderTemplate>
<table id="tablist" width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
  <tr class="TR_BG">
    <td class="sys_topBg" style="width:35%;">վȺ����[վȺӢ��]</td>
    <td class="sys_topBg" style="width:30%;">��Ŀ����</td>
    <td class="sys_topBg" style="width:20%;">��   ��</td>
    <td class="sys_topBg" style="width:15%;">��   ��</td>
  </tr>
 </HeaderTemplate>
 <ItemTemplate>
 <tr class="TR_BG_list" onmouseover="overColor(this)" onmouseout="outColor(this)">
    <td class="list_link">
    <a href="Site_add.aspx?ID=<%# DataBinder.Eval(Container.DataItem, "Id")%>" class="list_link"><%# DataBinder.Eval(Container.DataItem, "CName")%>[<%# DataBinder.Eval(Container.DataItem, "EName")%>]</a>
    </td>
    <td class="list_link">
    <%# DataBinder.Eval(Container.DataItem, "ChannCName")%>
    </td>
    <td class="list_link">
    <asp:Label runat="server" ID="LblIsURL" Text='<%# DataBinder.Eval(Container.DataItem, "IsURL")%>'/>��
    <asp:Label runat="server" ID="LblShowNaviTF" Text='<%# DataBinder.Eval(Container.DataItem, "ShowNaviTF")%>'/>
    <asp:Label runat="server" ID="LblContrTF" Text='<%# DataBinder.Eval(Container.DataItem, "ContrTF")%>'/>
    <asp:Label runat="server" ID="LblDomain" Text='<%# DataBinder.Eval(Container.DataItem, "Domain")%>'/>
    </td>
    <td class="list_link">
        <a href="Site_add.aspx?ID=<%# DataBinder.Eval(Container.DataItem, "Id")%>" class="list_link"><img src="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/sysico/edit.gif" border="0" alt="�޸�" /></a>&nbsp;<a href="javascript:RecyleSite('<%# DataBinder.Eval(Container.DataItem, "ChannelID")%>')" class="list_link"><img src="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/sysico/del.gif" border="0" alt="ɾ��" /></a>&nbsp;<a href="javascript:DeleteSite('<%# DataBinder.Eval(Container.DataItem, "ChannelID")%>');" class="list_link"><img src="../../sysImages/folder/dels.gif" border="0" alt="����ɾ��" /></a>&nbsp;<input type="checkbox" name="checkbox" value="<%# DataBinder.Eval(Container.DataItem, "ChannelID")%>"/>
    </td>
  </tr>
 </ItemTemplate>
  <FooterTemplate>
  </table>
  </FooterTemplate>
 </asp:Repeater>
  <div style="width:98%" align="right"><uc1:PageNavigator ID="PageNavigator1" runat="server" /></div>

<br />
<br />
 <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
  <tr>
    <td align="center"><%Response.Write(CopyRight);%></td>
  </tr>
</table>
</div>
</form>
</body>
</html>
