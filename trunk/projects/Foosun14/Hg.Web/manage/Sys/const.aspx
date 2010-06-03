<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_Sys_const" Codebehind="const.aspx.cs" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="../../sysImages/<%Response.Write(Hg.Config.UIConfig.CssPath());%>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
<table width="100%" height="32" align="center" border="0" cellpadding="0" cellspacing="0" background="../../sysImages/<%Response.Write(Hg.Config.UIConfig.CssPath());%>/admin/reght_1_bg_1.gif">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="17%" height="32" class="sysmain_navi"  style="PADDING-LEFT: 14px" >
              �����ļ���</td>
          <td height="32" class="topnavichar"  style="PADDING-LEFT: 14px" ></td>
        </tr>
</table>
<form id="Form1" runat="server">
<table width="98%" border="0" cellspacing="1" cellpadding="5" class="table" bgcolor="#FFFFFF" align="center">
  <tr class="TR_BG_list">
    <td width="21%" height="29" align="right" valign="middle">��̨����Ŀ¼</td>
    <td width="79%" align="left" valign="middle">&nbsp;<asp:TextBox Width="200px" ID="dirMana" runat="server" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:hand;" title="���鿴���" onClick="Help('H_const_0001',this)">���</span>
        <font color="red">���ʾ:�޸�Ŀ¼��������ֶ��޸������ļ���(���Ʊ�����ͬ)</font>
        </td>
    </tr>
  <tr class="TR_BG_list">
    <td height="28" align="right" valign="middle">
        ��̨ģ��Ŀ¼</td>
    <td align="left" valign="middle">&nbsp;<asp:TextBox ID="dirTemplet" Width="200px" runat="server" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:hand;" title="���鿴���" onClick="Help('H_const_0002',this)">���</span>
    <font color="red">���ʾ:�޸Ĵ�Ŀ¼���ܻ��ԭ��������Ч��Ӱ�죬�������޸</font>
    </td>
    </tr>
  <tr class="TR_BG_list">
    <td height="28" align="right" valign="middle">�����Ŀ¼</td>
    <td align="left" valign="middle">&nbsp;<asp:TextBox ID="dirDumm" Width="200px" runat="server" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:hand;" title="���鿴���" onClick="Help('H_const_0003',this)">���</span></td>
    </tr>
  <tr class="TR_BG_list">
    <td height="28" align="right" valign="middle">������뱣��</td>
    <td align="left" valign="middle">&nbsp;<asp:TextBox ID="protPass" Width="200px" runat="server" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:hand;" title="���鿴���" onClick="Help('H_const_Pass',this)">���</span>
    </tr>
  <tr class ="TR_BG_list">
    <td height="28" align="right" valign="middle">�ȫ�</td>
    <td align="left" valign="middle">&nbsp;<asp:TextBox ID="protRand" Width="200px" runat="server" MaxLength="50" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:hand;" title="���鿴���" onClick="Help('H_const_0004',this)">���</span></td>
    </tr>
  <tr class = "TR_BG_list">
    <td height="28" align="right" valign="middle">��ļ��ϴ�Ŀ¼</td>
    <td align="left" valign="middle">&nbsp;<asp:TextBox ID="dirFile" Width="200px" runat="server" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:hand;" title="���鿴���" onClick="Help('H_const_0005',this)">���</span></td>
    </tr>
<%--  <tr class = "TR_BG_list">
    <td height="28" align="right" valign="middle">API�Ŀ¼(̨)</td>
    <td align="left" valign="middle">&nbsp;<asp:TextBox ID="dirManaApi" Width="200px" runat="server" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:hand;" title="? onClick="Help('H_const_0006',this)"></span></td>
    </tr>
  <tr class="TR_BG_list">
    <td height="28" align="right" valign="middle">API�Ŀ¼(ǰ̨)</td>
    <td align="left" valign="middle">&nbsp;<asp:TextBox ID="dirUserApi" Width="200px" runat="server" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:hand;" title="? onClick="Help('H_const_0007',this)"></span></td>
    </tr>
  <tr class="TR_BG_list">
    <td height="28" align="right" valign="middle">�ƻ·</td>
    <td align="left" valign="middle">&nbsp;<asp:TextBox ID="projPath" Width="200px" runat="server" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:hand;" title="? onClick="Help('H_const_0008',this)"></span></td>
    </tr>--%>
  <tr class="TR_BG_list"  style="display:none">
    <td height="28" align="right" valign="middle">�ͳ��ϵͳ�Ƿ�ʹ�ö����ݿ</td>
    <td align="left" valign="middle">
    <asp:RadioButton ID="stat1" runat="server" onclick="Change(1)" Text="��" GroupName="indeData" />&nbsp;<asp:RadioButton ID="stat0" runat="server" onclick="Change(0)" Text="Ƿ" GroupName="indeData" />
        <span class="helpstyle" style="cursor:hand;" title="���鿴���" onClick="Help('H_const_0009',this)">���</span></td>
    </tr>
    <tr class="TR_BG_list" id="stat_dis" style="display:none">
    <td height="28" align="right" valign="middle">�ͳ��ϵͳ����ݿ���</td>
    <td align="left" valign="middle">&nbsp;<asp:TextBox ID="sqlConnData" Width="200px" runat="server" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:hand;" title="ӵ��鿴���" onClick="Help('H_const_0014',this)">���</span></td>
    </tr>
  <tr class="TR_BG_list">
    <td height="28" align="right" valign="middle">������ļ�������</td>
    <td align="left" valign="middle">&nbsp;<asp:TextBox ID="constPass" Width="200px" runat="server" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:hand;" title="���鿴���" onClick="Help('H_const_0010',this)">���</span></td>
    </tr>
    
  <tr class="TR_BG_list">
    <td height="28" align="right" valign="middle">���Դ�ļ�������</td>
    <td align="left" valign="middle">&nbsp;<asp:TextBox ID="filePass" Width="200px" runat="server" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:hand;" title="���鿴���" onClick="Help('H_const_0010',this)">���</span></td>
    </tr>  
    
  <tr class="TR_BG_list">
    <td height="28" align="right" valign="middle">���Դ�ļ����Ŀ¼</td>
    <td align="left" valign="middle">&nbsp;<asp:TextBox ID="filePath" Width="200px" runat="server" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:hand;" title="���鿴���" onClick="Help('H_const_0010',this)">���</span></td>
    </tr>  

  <tr class="TR_BG_list">
    <td height="28" align="right" valign="middle">�鵵��̬�ļ���Ŀ¼</td>
    <td align="left" valign="middle">&nbsp;<asp:TextBox ID="dirPige" Width="200px" runat="server" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:hand;" title="���鿴���" onClick="Help('H_const_0013',this)">���</span></td>
    </tr>
  <tr class="TR_BG_list">
    <td height="28" align="right" valign="middle">����ʽĿ¼</td>
    <td align="left" valign="middle">&nbsp;<asp:TextBox ID="manner" Width="200px" runat="server" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:hand;" title="���鿴���" onClick="Help('H_const_0015',this)">���</span></td>
    </tr>
    <tr class="TR_BG_list">
        <td align="right" height="28" valign="middle">
        </td>
        <td align="left" valign="middle">
            <asp:Button ID="btn_const" runat="server" Height="27px" OnClick="btn_const_Click" Text="��  ύ" OnClientClick="{if(confirm('ȷ��Ҫ�޸��!')){return true;}return false;}" Width="60px" CssClass="form"/></td>
    </tr>
</table>
</form>
<br />

 <table width="100%" border="0" cellpadding="8" align="center" cellspacing="0" class="copyright_bg" style="height: 76px">
   <tr>
     <td align="center"><label id="copyright" runat=server /><%Response.Write(CopyRight); %></td>
   </tr>
</table>

</body>
<script language="javascript">
function Change(value)
{
    switch(parseInt(value))
    {
        case 1:
        document.getElementById("stat_dis").style.display="";
        break;
        case 0:
        document.getElementById("stat_dis").style.display="none";
        break;
    }
}

</script>
<% showjs(); %>
</html>
