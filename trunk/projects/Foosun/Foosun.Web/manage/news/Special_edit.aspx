<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_news_Special_edit" Codebehind="Special_edit.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head">
    <title></title>
    <link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/css.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
    <form id="F_Speical" runat="server" method="post">
      <table width="100%" border="0" cellpadding="0" cellspacing="0"  class="toptable">
        <tr>
          <td width="57%" class="sysmain_navi"  style="PADDING-LEFT: 14px" height="30">�޸�ר��</td>
          <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="Special_List.aspx" class="list_link">ר�����</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�޸�ר��</div></td>
        </tr>
      </table>
  <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
    <tr class="TR_BG_list">
      <td width="12%" align="center" class="navi_link" style="width: 13%">ר��������</td>
      <td colspan="2" align="left"><asp:TextBox ID="S_Cname" runat="server" Width="250px" CssClass="form" MaxLength="50"></asp:TextBox>
        <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_SpecialAdd_001',this)">����</span>
        <asp:RequiredFieldValidator ID="RequiredFieldS_Cname" runat="server" ErrorMessage="<span class=reshow>(*)����дר��������</spna>" ControlToValidate="S_Cname" Display="Static"></asp:RequiredFieldValidator></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 13%">ר��Ӣ����</td>
      <td colspan="2" align="left"><asp:TextBox ID="S_Ename" runat="server" CssClass="form" MaxLength="50" Width="250px" ReadOnly="true"></asp:TextBox>
        <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_SpecialAdd_002',this)">����</span>
        <asp:RequiredFieldValidator ID="RequiredFieldS_Ename" runat="server" ErrorMessage="<span class=reshow>(*)����дר��Ӣ����</spna>" ControlToValidate="S_Ename" Display="Static"></asp:RequiredFieldValidator></td>
    </tr>
          <tr class="TR_BG_list">
          <td align="center" class="navi_link" style="width: 13%">
              ר�⸸��Ŀ</td>
          <td align="left" colspan="2">
              <asp:TextBox ID="S_ParentName" runat="server" CssClass="form" MaxLength="12" ReadOnly="true"
                  Width="250px"></asp:TextBox></td>
      </tr>
    <tr class="TR_BG_list" style="display:none;">
      <td align="center" class="navi_link" style="width: 13%">ר�⸸��Ŀ</td>
      <td colspan="2" align="left"><asp:TextBox ID="S_Parent" runat="server" CssClass="form" MaxLength="12" Width="250px" ReadOnly="true"></asp:TextBox>
<%--        <img src="../../sysImages/folder/s.gif" style="cursor:pointer;" title="ѡ��ר��"  onclick="selectFile('special',document.F_Speical.S_Parent,300,380);document.F_Speical.S_Parent.focus();" /> <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_SpecialAdd_003',this)">����</span>
--%>        </td>
    </tr>
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 13%">ר������</td>
      <td colspan="2" align="left"><asp:TextBox ID="S_Domain" runat="server" CssClass="form" MaxLength="100" Width="250px"></asp:TextBox>
        <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_SpecialAdd_004',this)">����</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 13%">ר����չ��</td>
      <td colspan="2" align="left"><asp:DropDownList ID="S_FileExname" runat="server" CssClass="form" Width="250px" onchange="javascript:Hide(this.value);">
          <asp:ListItem Value=".html">.html</asp:ListItem>
          <asp:ListItem Value=".htm">.htm</asp:ListItem>
          <asp:ListItem Value=".shtml">.shtml</asp:ListItem>
          <asp:ListItem Value=".aspx">.aspx</asp:ListItem>
        </asp:DropDownList>
        <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_SpecialAdd_008',this)">����</span></td>
    </tr>
    <tr class="TR_BG_list" id="Tr_Pop" style="display:none;">
      <td align="center" class="navi_link" style="width: 13%">ר�����Ȩ��</td>
      <td colspan="2" align="left">��Ա��
        <select id="S_UserGroup" runat="server" class="form" multiple style="width:210px;height:100px;"> </select><p>
        ��&nbsp;&nbsp;&nbsp;��
        <asp:DropDownList ID="S_IsDel" runat="server" CssClass="form" Width="100px">
          <asp:ListItem Value="null">��ѡ��</asp:ListItem>
          <asp:ListItem Value="0">�����Բ鿴</asp:ListItem>
          <asp:ListItem Value="1">��ȡ���</asp:ListItem>
          <asp:ListItem Value="2">��ȡ����</asp:ListItem>
          <asp:ListItem Value="3">��ȡ��Һ͵���</asp:ListItem>
          <asp:ListItem Value="4">��Ҫ���</asp:ListItem>
          <asp:ListItem Value="5">��Ҫ����</asp:ListItem>
          <asp:ListItem Value="6">��Ҫ��Һ͵���</asp:ListItem>
        </asp:DropDownList>
        ����
        <asp:TextBox ID="S_Point" runat="server" CssClass="form" MaxLength="8" Width="35px"></asp:TextBox>
        ���
        <asp:TextBox ID="S_Money" runat="server" CssClass="form" MaxLength="8" Width="35px"></asp:TextBox>
        <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_SpecialAdd_005',this)">����</span></p></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 13%">����Ŀ¼����</td>
      <td colspan="2" align="left"><asp:TextBox ID="S_DirRule" runat="server" CssClass="form" MaxLength="100" Width="250px"></asp:TextBox>
          &nbsp;<img src="../../sysImages/folder/s.gif" style="cursor:pointer;" alt="ѡ�����" onclick="selectFile('rulePram',document.F_Speical.S_DirRule,100,500);document.F_Speical.S_DirRule.focus();" /><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_SpecialAdd_006',this)">����</span><asp:RequiredFieldValidator ID="RequiredFieldValidatorS_DirRule"
                      runat="server" ControlToValidate="S_DirRule" Display="Static" ErrorMessage="<span class=reshow>(*)��ѡ��Ŀ¼����</spna>"></asp:RequiredFieldValidator></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 13%">�����ļ�����</td>
      <td colspan="2" align="left"><asp:TextBox ID="S_FileRule" runat="server" CssClass="form" MaxLength="100" Width="250px"></asp:TextBox>
          &nbsp;<img src="../../sysImages/folder/s.gif" style="cursor:pointer;" alt="ѡ�����" onclick="selectFile('rulePram',document.F_Speical.S_FileRule,100,500);document.F_Speical.S_FileRule.focus();" /><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_SpecialAdd_007',this)">����</span><asp:RequiredFieldValidator ID="RequiredFieldValidatorS_FileRule"
                      runat="server" ControlToValidate="S_FileRule" Display="Static" ErrorMessage="<span class=reshow>(*)��ѡ���ļ�����</spna>"></asp:RequiredFieldValidator></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 13%">ר�Ᵽ��·��</td>
      <td colspan="2" align="left"><asp:TextBox ID="S_SavePath" runat="server" CssClass="form" MaxLength="100" Width="250px"></asp:TextBox>
          &nbsp;<img src="../../sysImages/folder/s.gif" style="cursor:pointer;" alt="ѡ��·��" onclick="selectFile('path',document.F_Speical.S_SavePath,300,500);document.F_Speical.S_SavePath.focus();" /><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_SpecialAdd_009',this)">����</span><asp:RequiredFieldValidator ID="RequiredFieldValidatorS_SavePath"
                      runat="server" ControlToValidate="S_SavePath" Display="Static" ErrorMessage="<span class=reshow>(*)��ѡ��ר�Ᵽ��·��</spna>"></asp:RequiredFieldValidator></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 13%">ר�⵼��ͼƬ</td>
      <td colspan="2" align="left"><asp:TextBox ID="S_Pic" runat="server" CssClass="form" MaxLength="200" Width="250px"></asp:TextBox>
          &nbsp;<img src="../../sysImages/folder/s.gif" style="cursor:pointer;" alt="ѡ�񵼺�ͼƬ" onclick="selectFile('pic',document.F_Speical.S_Pic,280,500);document.F_Speical.S_Pic.focus();" /><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_SpecialAdd_010',this)">����</span></td>
    </tr>
    
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 13%">ר�⵼������</td>
      <td colspan="2" align="left"><asp:TextBox ID="S_Text" runat="server" CssClass="form" Height="100px" TextMode="MultiLine"
              Width="360px"></asp:TextBox><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_SpecialAdd_011',this)">����</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 13%">ר��ģ���ַ</td>
      <td colspan="2" align="left"><asp:TextBox ID="S_Templet" runat="server" CssClass="form" MaxLength="200" Width="250px"></asp:TextBox>
          &nbsp;<img src="../../sysImages/folder/s.gif" style="cursor:pointer;" alt="ѡ��ģ��" onclick="selectFile('templet',document.F_Speical.S_Templet,280,500);document.F_Speical.S_Templet.focus();" /><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_SpecialAdd_012',this)">����</span> <asp:RequiredFieldValidator ID="RequiredFieldValidatorS_Templet" runat="server" ControlToValidate="S_Templet"
                Display="Static" ErrorMessage="<span class=reshow>(*)��ѡ��ר��ģ���ַ</spna>"></asp:RequiredFieldValidator></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 13%">ר��ҳ�浼��</td>
      <td colspan="2" align="left"><asp:TextBox ID="S_Page" runat="server" CssClass="form" Height="100px" TextMode="MultiLine"
              Width="360px"></asp:TextBox><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_SpecialAdd_013',this)">����</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="left" class="navi_link" colspan="3"><label>
        <asp:Button ID="Button1" runat="server" Text=" ȷ �� " CssClass="form" OnClick="Button1_Click"/>
        </label>
        <label>
        <input type="reset" name="UnDo" value=" �� �� " class="form" />
        </label><input type="hidden" value="0" name="isTrue" /><input type="hidden" value="0" id="SpaecilID" runat="server" /></td>
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
    if(value==".aspx")
    {
        document.getElementById("Tr_Pop").style.display="";
        document.F_Speical.isTrue.value="1";
    }
    else
    {
        document.getElementById("Tr_Pop").style.display="none";
        document.F_Speical.isTrue.value="0";
    }
}
</script>
<% Show(); %>
</html>