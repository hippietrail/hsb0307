<%@ Page Language="C#" AutoEventWireup="true" Inherits="user_friend_friendmanage" Codebehind="friendmanage.aspx.cs" %>

<%@ Register Src="../../controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<%@ Import NameSpace="System.Data"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <form id="form1" name="form1" method="get" action="friendmanage_del.aspx" runat="server">
  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%"  class="sysmain_navi"  style="PADDING-LEFT: 14px" >���ѹ���</td>
          <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="friendList.aspx" class="menulist">���ѹ���</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />���ѷ���</div></td>
        </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
  <tr>
     <td><span class="topnavichar" style="PADDING-LEFT: 14px"><a href="friendList.aspx" class="menulist">���ѹ���</a>��<a href="friendmanage.aspx" class="menulist">���ѷ���</a>&nbsp;&nbsp; <a href="friend_add.aspx" class="menulist">��Ӻ���</a>&nbsp;&nbsp; <a href="friendmanage_add.aspx" class="menulist">��Ӻ��ѷ���</a>&nbsp;&nbsp; <a href="friend_Establishment.aspx" class="menulist">��������</a>&nbsp; &nbsp;<span id="delp" runat="server"></span></span></td>
  </tr>
</table>
<div id="no" runat="server"></div>
  <asp:Repeater ID="DataList1" runat="server" >
    <HeaderTemplate>
    <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
    <tr class="TR_BG">
    <td class="sys_topBg">��������</td>
    <td class="sys_topBg" align="center" width="25%">���ʱ��</td>
    <td class="sys_topBg" align="center" width="25%">����&nbsp; &nbsp;<input type="checkbox" name="Checkbox1" onclick="javascript:selectAll(this.form,this.checked)" /></td>
    </tr>
    <div id="tnzlist" runat="server"></div>
    </HeaderTemplate>
    <ItemTemplate>
        <tr class="TR_BG_list" onmouseover="overColor(this)" onmouseout="outColor(this)">
        <td><a class="list_link" href="friendlist.aspx?FCID=<%#((DataRowView)Container.DataItem)["cutAId"]%>"><span title="<%#((DataRowView)Container.DataItem)["FriendName"]%><%#((DataRowView)Container.DataItem)["CNT"]%>����¼��"><%#((DataRowView)Container.DataItem)["FriendName"]%>(<%#((DataRowView)Container.DataItem)["CNT"]%>)</span></a></td>
        <td align="center" width="25%"><%#((DataRowView)Container.DataItem)["CreatTime"]%></td>
        <td align="center" width="25%"><%#((DataRowView)Container.DataItem)["idc"]%></td>            
        </tr>
     </ItemTemplate>
     <FooterTemplate>
     </table>
     </FooterTemplate>
    </asp:Repeater>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="2">
<tr><td align="right" style="width: 928px">
    <uc1:PageNavigator ID="PageNavigator1" runat="server" />
</td></tr>
</table>
<table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
  <tr>
    <td><div align="center"><%Response.Write(CopyRight); %></div></td>
  </tr>
</table>
</form>
</body>
<script language="javascript" type="text/javascript">
function del(ID)
{
   if(confirm("��ȷ��Ҫɾ����?"))
   { 
        self.location="?Type=del&ID="+ID;
   }
}
function PDel()
{
    if(confirm("��ȷ��Ҫ����ɾ����?"))
    {
	    document.form1.action="?Type=PDel";
	    document.form1.submit();
	}
}
</script>
</html>
