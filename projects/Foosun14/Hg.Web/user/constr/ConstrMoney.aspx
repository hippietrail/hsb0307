<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" AutoEventWireup="true" Inherits="user_constr_ConstrMoney" Debug="true" Codebehind="ConstrMoney.aspx.cs" %>

<%@ Register Src="../../controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<%@ Import NameSpace="System.Data"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="../../sysImages/<%Response.Write(Hg.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
</head>
<body><form id="form1" name="form1" method="post" action="" runat="server"> 




<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%"  class="sysmain_navi"  style="PADDING-LEFT: 14px" >
              ���¹��</td>
          <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">�λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="Constrlist.aspx" class="menulist">���¹��</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />����¼</div></td>
        </tr>
</table>
      <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
        <tr>
          <td style="padding-left:14px;"><a href="Constr.aspx" class="menulist">�������</a>&nbsp; &nbsp;<a href="Constrlistpass.aspx" class="topnavichar" >������˸</a>&nbsp; &nbsp;<a href="Constrlist.aspx" class="menulist">����¹��</a>&nbsp; &nbsp;<a href="ConstrClass.aspx" class="menulist">������</a>&nbsp; &nbsp;<a href="Constraccount.aspx" class="menulist">��˺Ź��</a></td>
        </tr>
</table>
<div id="no" runat="server"></div>
 <table width="98%">
 <tr><td>
<div>
    <asp:Repeater ID="DataList1" runat="server" >
    <HeaderTemplate>
    <table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
    <tr class="TR_BG">
    <td class="sys_topBg" align="center" width="15%">����</td>
    <td class="sys_topBg" align="center" width="15%">Ÿ����Ŀ</td>
    <td class="sys_topBg" align="center" width="15%">֧��ʱ�</td>
    </tr>
    <div id="tnzlist" runat="server"></div>
    </HeaderTemplate>
    <ItemTemplate>
        <tr class="TR_BG_list" onmouseover="overColor(this)" onmouseout="outColor(this)">
        <td align="center" width="15%"><%#((DataRowView)Container.DataItem)["constrPayID"]%></td>
        <td align="center" width="15%"><%#((DataRowView)Container.DataItem)["Moneys"]%></td>
        <td align="center" width="15%"><%#((DataRowView)Container.DataItem)["payTime"]%></td>           
        </tr>
     </ItemTemplate>
     <FooterTemplate>
     </table>
     </FooterTemplate>
    </asp:Repeater>
</div>
</td></tr>
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
</html>
