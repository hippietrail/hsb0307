<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" AutoEventWireup="true" Inherits="user_getPassword" Codebehind="getPassword.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<title><%Response.Write(Foosun.Config.UIConfig.HeadTitle); %>__ȡ������</title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
</head>
<body><form id="form1" name="form1" method="post" action="" runat="server">
<div style="width:100%" id="topshow">
    <table border="0" cellpadding="2" class="2" style="width:100%;">
    <tr>
        <td style="width:30%;"><a href="http://www.foosun.net" target="_blank"><img src="../../sysImages/user/userlogo.gif" border="0" /></a></td>
        <td style="width:70%;">�˴��������Ĺ��</td>
    </tr>
    </table>
</div>
 <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
   <tr>
     <td style="padding:5px 8px 5 5px;"><div style="width:98%;"><span style="width:70%;">�û����һ�����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="width:30%;text-align:right;">���ʺ��ˣ�<a href="../Login.aspx"><font color="red">�������½</font></a></span></div></td>
   </tr>
 </table>
 
<asp:Panel ID="Panel1" runat="server" Height="32%" Width="100%">
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
            <tr class="TR_BG_list">
                <td class="sys_topBg">
                    �һ������һ��
                    </td>
            </tr>
            <tr class="TR_BG_list">
                <td class="list_link" style="text-align: left">
                    �û���
                    <asp:TextBox ID="firstnameBox" runat="server" Width="200px" CssClass="form"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="firstnameBox" ErrorMessage="�������û���"></asp:RequiredFieldValidator><asp:Button ID="firstBut" runat="server" Text="�һ������һ��" OnClick="firstBut_Click" CssClass="form"/></td>
            </tr>
        </table>
        </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Height="27%" Width="100%" Visible="False">
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
            <tr class="TR_BG_list">
                <td class="sys_topBg" colspan="2">
                    �һ�����ڶ���</td>
            </tr>
                   <tr class="TR_BG_list">
                <td class="list_link" style="text-align: right">
                    �����������⣺</td>
                <td class="list_link">
                    &nbsp;<asp:TextBox ID="pwdBox1" runat="server" Width="221px" CssClass="form"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="pwdBox1"
                        ErrorMessage="������������������"></asp:RequiredFieldValidator>
                    <asp:Label ID="nms" runat="server" Visible="False" Width="80px"></asp:Label></td>
            </tr>
            <tr class="TR_BG_list">
                <td class="list_link" style="text-align: right">
                    ��д��������𰸣�</td>
                <td class="list_link">
                    &nbsp;<asp:TextBox ID="pwdBox2" TextMode="Password" runat="server" Width="220px" CssClass="form"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="pwdBox2"
                        ErrorMessage="���������������"></asp:RequiredFieldValidator></td>
            </tr>
           <tr class="TR_BG_list">
                <td class="list_link" style="text-align: right">
                    ���ĵ����ʼ���</td>
               <td class="list_link">
                   &nbsp;<asp:TextBox ID="emailBox" runat="server" Width="220px" CssClass="form"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="emailBox"
                       ErrorMessage="���������ĵ����ʼ�"></asp:RequiredFieldValidator></td>
            </tr>
          <tr class="TR_BG_list">
              <td class="list_link">
              </td>
              <td class="list_link">
                  <asp:Button ID="secindBut" runat="server" Text="�һ�����ڶ���" Width="112px" OnClick="secindBut_Click" CssClass="form"/></td>
            </tr>
        </table>
    </asp:Panel>
         <asp:Panel ID="Panel3" runat="server" Height="27%" Width="100%" Visible="False">
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
            <tr class="TR_BG_list">
                <td class="sys_topBg" colspan="2">
                    �һ����������</td>
                </tr>
                   <tr class="TR_BG_list">
                <td class="list_link" style="text-align: right">
                    ���������������룺</td>
                <td class="list_link">
                    &nbsp;<asp:TextBox ID="newpwdBox1" runat="server" TextMode="Password" Width="175px" CssClass="form"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="newpwdBox1"
                        ErrorMessage="����������������"></asp:RequiredFieldValidator>&nbsp;
                    <asp:Label ID="nms2" runat="server" Visible="False"></asp:Label></td>
            </tr>
            <tr class="TR_BG_list">
                <td class="list_link" style="text-align: right">
                    �ٴ��������������룺</td>
                <td class="list_link">
                    &nbsp;<asp:TextBox ID="newpwdBox2" runat="server" TextMode="Password" Width="174px" CssClass="form"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="newpwdBox2"
                        Display="Dynamic" ErrorMessage="���ٴ���������������"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="������������벻һ��" ControlToCompare="newpwdBox1" ControlToValidate="newpwdBox2"></asp:CompareValidator></td>
            </tr>
           <tr class="TR_BG_list">
                <td class="list_link">
                    </td>
               <td class="list_link">
                   <asp:Button ID="pwds" runat="server" Text="�һ�����" Width="88px" OnClick="pwds_Click" CssClass="form"/></td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <br />
    <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 38px">
       <tr>
         <td align="center"><label id="copyright" runat="server" /></td>
       </tr>
     </table>
</form>
</body>
</html>
