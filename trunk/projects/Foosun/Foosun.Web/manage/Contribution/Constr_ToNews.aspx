<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" AutoEventWireup="true" Inherits="manage_Contribution_Constr_ToNews" Codebehind="Constr_ToNews.aspx.cs" %>
<%@ Import NameSpace="System.Data"%>
<%@ Register Src="../../controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>	
</head>
<body style="background-color: #ffffff">
<form id="form1" name="form1" method="post" action="" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%"  class="sysmain_navi"  style="PADDING-LEFT: 14px" >
              Ͷ�����</td>
          <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="Constr_List.aspx" class="topnavichar">�������</a></div></td>
        </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
  <tr>
    <td width="46%" class="navi_link">&nbsp; &nbsp; &nbsp;<a href="Constr_List.aspx" class="topnavichar">�������</a>&nbsp; &nbsp;<a href="Constr_Stat.aspx" class="topnavichar">���ͳ��</a>&nbsp; &nbsp;<a href="paymentannals.aspx" class="topnavichar">֧����ʷ</a>&nbsp; &nbsp;<a href="Constr_SetParam.aspx" class="topnavichar">����趨</a>&nbsp; &nbsp;<a href="Constr_chicklist.aspx" class="topnavichar">����ͨ����˸��</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
  <tr class="TR_BG_list">
    <td class="list_link" colspan="2"  >
        ��ȷ���ѡ�
        <asp:Label ID="Title" runat="server" Width="586px" ForeColor="Red"></asp:Label>��</td>
    </tr>
      <tr class="TR_BG_list">
    <td class="list_link" Width="15%">������Ƶ���Ŀ��</td>
    <td class="list_link" Width="85%"><asp:TextBox ID="ClassCName" runat="server" Width="212px"></asp:TextBox>
        &nbsp;<input  class="form" type="button" value="ѡ����Ŀ"  onclick="selectFile('newsclass',document.form1.ClassCName,300,500);document.form1.ClassCName.focus();" />
        &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
            runat="server" ControlToValidate="ClassCName" ErrorMessage="��Ŀ����Ϊ��"></asp:RequiredFieldValidator></td>
   </tr>
   <tr class="TR_BG_list">
    <td class="list_link">��ѡ���꣺</td>
    <td><asp:DropDownList ID="ParmConstr" runat="server" Width="146px"></asp:DropDownList></td>
</tr>
      <tr class="TR_BG_list">
    <td class="list_link">
</td><td class="list_link">
    &nbsp; &nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="��  ��"  CssClass="form"/>
    &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="��  ��"  CssClass="form"/></td>
        
</tr>
</table>
<table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
  <tr>
    <td><div align="center"><%Response.Write(CopyRight); %> </div></td>
  </tr>
</table>
</form>
</body>
</html>






