<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" AutoEventWireup="true" Inherits="user_info_history" Debug="true" Codebehind="history.aspx.cs" %>

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
<form id="form1" runat = "Server">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%" height="32" class="sysmain_navi"  style="PADDING-LEFT: 14px" >
              ��������</td>
          <td width="43%" height="32" class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />��������<a href="userinfo.aspx" class="list_link"></a></div></td>
        </tr>
</table>
      <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
        <tr><td  style="padding-left:12px;"><a href="?type=0" class="topnavichar">ȫ������</a>&nbsp; &nbsp;<a href="?type=2" class="topnavichar">���߳�ֵ</a>&nbsp; &nbsp;<a href="?type=3" class="topnavichar" >���ֶһ�</a>&nbsp; &nbsp;<a href="?type=4" class="topnavichar" >���</a>&nbsp; &nbsp;<a href="?type=5" class="topnavichar" >�Ķ�Ȩ��</a>&nbsp; &nbsp;<a href="?type=1" class="topnavichar" >����</a>&nbsp; &nbsp;<a href="?type=6" class="topnavichar" >��¼���</a>&nbsp; &nbsp;<a href="?type=7" class="topnavichar" >ע����</a> &nbsp; &nbsp;<a href="?ghtype=2" class="menulist">����</a>&nbsp; &nbsp;<a href="?ghtype=1" class="menulist">֧��</a></td>
        </tr>
</table>

    <div id="no" runat="server"></div>
<asp:Repeater ID="userlists" runat="server">
   <HeaderTemplate>
       <table width="98%" border="0" align="center" cellpadding="4" cellspacing="1" class="table">
        <tr class="TR_BG">
        <td class="sys_topBg" align="center" width="15%">�û���</td>
        <td class="sys_topBg" align="center" width="10%">����/֧��</td>
        <td class="sys_topBg" align="center" width="10%">G��</td>
        <td class="sys_topBg" align="center" width="10%">����</td>   
        <td class="sys_topBg" align="center" width="10%">�ֽ�</td> 
        <td class="sys_topBg" align="center" width="18%">˵��</td>              
        <td class="sys_topBg" align="center" width="17%">��������</td>
        </tr>
    </HeaderTemplate>
      <ItemTemplate>
        <tr class="TR_BG_list"  onmouseover="overColor(this)" onmouseout="outColor(this)">
        <td align="center" valign="middle"><%#((DataRowView)Container.DataItem)["UserName"]%></td>
        <td align="center" valign="middle" ><%#((DataRowView)Container.DataItem)["ghtypes"]%></td>
        <td align="center" valign="middle" ><%#((DataRowView)Container.DataItem)["Gpoint"]%></td>
        <td align="center" valign="middle" ><%#((DataRowView)Container.DataItem)["iPoint"]%></td>
        <td align="center" valign="middle" ><%#((DataRowView)Container.DataItem)["Moneys"]%></td>
        <td align="center" valign="middle" ><%#((DataRowView)Container.DataItem)["content"]%></td>
        <td align="center" valign="middle" ><%#((DataRowView)Container.DataItem)["CreatTime"]%></td>
        </tr>
      </ItemTemplate>
      <FooterTemplate>
      </table>
     </FooterTemplate>
</asp:Repeater> 

<table width="98%" border="0" align="center" cellpadding="3" cellspacing="2" style="height: 20px">
   <tr><td align="right">
         <uc1:PageNavigator ID="PageNavigator1" runat="server" /></td>
   </tr>
</table>
<table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
   <tr>
     <td align="center"><label id="copyright" runat="server" /></td>
   </tr>
</table>
</form>
</body>
</html>
