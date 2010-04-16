<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_Sys_admin_edit" ResponseEncoding="utf-8" Codebehind="admin_edit.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
<form id="form1" runat="server" method="post">
<table width="100%" border="0" cellpadding="0" cellspacing="0"  class="toptable">
<tr>
  <td width="57%" class="sysmain_navi"  style="PADDING-LEFT: 14px" Height="30">�޸Ĺ���Ա��Ϣ</td>
  <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="admin_list.aspx" class="list_link">����Ա����</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�޸Ĺ���Ա��Ϣ</div></td>
</tr>
</table>
  <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 13%">�û���</td>
      <td align="left"><asp:TextBox ID="TxtUserName" runat="server" Width="200px" MaxLength="18" Enabled="False"></asp:TextBox><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_adminEdit_001',this)">����</span>
      </td>
    </tr>
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 13%"> �� ��</td>
      <td align="left"><asp:TextBox ID="UserPwd" runat="server" Width="200px" MaxLength="50" TextMode="Password"></asp:TextBox><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_adminEdit_002',this)">����</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 13%">ȷ������</td>
      <td align="left"><asp:TextBox ID="SecUserPwd" runat="server" Width="200px" MaxLength="50" TextMode="Password"></asp:TextBox>
        <asp:CompareValidator ID="CompareSecUserPwd" runat="server" ErrorMessage="<span class=reshow>(*)�������벻һ��</span>" ControlToValidate="UserPwd" ControlToCompare="SecUserPwd" Type="String"></asp:CompareValidator></td>
    </tr>
    <tr class="TR_BG_list" id="TrIsLock">
      <td align="center" class="navi_link" style="width: 13%">�Ƿ����</td>
      <td align="left"> <asp:RadioButtonList ID="IsInvocation" runat="server" RepeatDirection="Horizontal"
              RepeatLayout="Flow" Width="200px">
              <asp:ListItem Value="1">��</asp:ListItem>
              <asp:ListItem Value="0">��</asp:ListItem>
          </asp:RadioButtonList><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_adminAdd_003',this)">����</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 13%; height: 30px;"> �� ��</td>
      <td align="left" style="height: 30px"><span class="list_link"><asp:TextBox ID="RealName" runat="server" Width="200px" MaxLength="20"></asp:TextBox><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_adminAdd_005',this)">����</span></span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 13%"> �����ʼ�</td>
      <td align="left"><asp:TextBox ID="Email" runat="server" Width="200px" MaxLength="120"></asp:TextBox><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_adminAdd_006',this)">����</span><span><asp:RequiredFieldValidator ID="RequiredEmail" runat="server" ControlToValidate="Email" Display="Dynamic" ErrorMessage="<span class=reshow>(*)����д�����ʼ�</span>"></asp:RequiredFieldValidator></span>
        <span><asp:RegularExpressionValidator ID="RegularExpressionEmail" runat="server" Display="Static" ErrorMessage="<span class=reshow>�����ʽ����ȷ</span>" ControlToValidate="Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></span></td>
    </tr>
    <tr class="TR_BG_list" id="TrGroupNum">
      <td align="center" class="navi_link" style="width: 13%">��������Ա��</td>
      <td align="left"><span id="Group" runat="server" class="list_link"></span><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_adminAdd_007',this)">����</span></td>
    </tr>
    <tr class="TR_BG_list" id="TrIsSiteAdmin">
      <td align="center" class="navi_link" style="width: 13%">
          �Ƿ�Ƶ������Ա</td>
      <td align="left">
          <asp:RadioButtonList ID="isChannel" runat="server" RepeatDirection="Horizontal"
              RepeatLayout="Flow" Width="200px">
              <asp:ListItem Value="1" onclick="javascript:Hide(this.value)">��</asp:ListItem>
              <asp:ListItem Value="0" onclick="javascript:Hide(this.value)">��</asp:ListItem>
          </asp:RadioButtonList><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_adminAdd_004',this)">����</span></td>
    </tr>
    <tr class="TR_BG_list" id="Tr_SiteAdmin">
      <td align="center" class="navi_link" style="width: 13%">Ƶ����������Ա</td>
      <td align="left"><asp:RadioButtonList ID="isChSupper" runat="server" RepeatDirection="Horizontal"
              RepeatLayout="Flow" Width="200px">
              <asp:ListItem Value="1">��</asp:ListItem>
              <asp:ListItem Value="0">��</asp:ListItem>
          </asp:RadioButtonList><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_adminAdd_008',this)">����</span></td>
    </tr>
    <tr class="TR_BG_list" id="Tr_SiteList">
      <td align="center" class="navi_link" style="width: 13%">����Ƶ��</td>
      <td align="left"><label class="list_link" runat="server" id="Site_Span" /><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_adminAdd_012',this)">����</span></td>
    </tr>
<%--    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 13%">��̨��½����</td>
      <td align="left"><asp:TextBox ID="LimitType" runat="server" Width="200px" MaxLength="12"></asp:TextBox><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_adminAdd_010',this)">����</span><span><asp:RequiredFieldValidator ID="RequiredFieldLimitType" runat="server" ControlToValidate="LimitType" Display="Dynamic" ErrorMessage="<span class=reshow>(*)����д��������,����������д:0|0</span>"></asp:RequiredFieldValidator></span>
        <span><asp:RegularExpressionValidator ID="RegularLimitType" runat="server" Display="Static" ErrorMessage="<span class=reshow>��ʽ����ȷ,��ʽΪ:3|5,˵��,3��������¼�Ĵ���,5����������ʱ��(��λСʱ)</span>" ControlToValidate="LimitType" ValidationExpression="^[0-9]{1,4}\|[0-9]{1,4}"></asp:RegularExpressionValidator></span></td>
    </tr>--%>
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 13%">IP����</td>
      <td align="left">
          <asp:TextBox ID="Iplimited" runat="server" Height="74px" TextMode="MultiLine" Width="558px"></asp:TextBox><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_adminAdd_011',this)">����</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="left" class="navi_link" style="width: 10%" colspan="2"><label>
        <asp:Button ID="Button1" runat="server" Text=" ȷ �� " CssClass="form" OnClick="Button1_Click"/>
        </label>
        <label>
        <input type="reset" name="UnDo" value=" �� �� " class="form" /><span id="UserNumber" runat="server"></span>
        </label></td>
    </tr>
  </table>
  <br />
  <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px" align="center">
    <tr>
      <td align="center"><label id="copyright" runat="server" /></td>
    </tr>
  </table>
</form>
</body>
<script language="javascript" type="text/javascript">
    function Hide(value)
    {
        if (value=="1")
        {
            document.getElementById("Tr_SiteAdmin").style.display="";
            document.getElementById("Tr_SiteList").style.display="";
        }
        else
        {
            document.getElementById("Tr_SiteAdmin").style.display="none";
            document.getElementById("Tr_SiteList").style.display="none";
        }
    }
    if(document.form1.isSuper.value=="1")
    {
        document.getElementById("TrIsLock").style.display="none";
        document.getElementById("TrGroupNum").style.display="none";
        document.getElementById("Tr_SiteAdmin").style.display="none";
        document.getElementById("Tr_SiteList").style.display="none";
        document.getElementById("TrMore_Login").style.display="none";
        document.getElementById("TrIsSiteAdmin").style.display="none";
    }
    if(document.form1.HisChannel.value=="0")
    {
        document.getElementById("Tr_SiteAdmin").style.display="none";
        document.getElementById("Tr_SiteList").style.display="none";
    }
</script>
</html>
