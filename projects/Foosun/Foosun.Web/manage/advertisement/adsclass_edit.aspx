<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_advertisement_adsclass_edit" ResponseEncoding="utf-8" Codebehind="adsclass_edit.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>�޸ķ�����Ϣ</title>
    <link href="../../sysImages/<%Response.Write( Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
    <form id="form1" runat="server" method="post" action="adsclass_edit.aspx">
      <table width="100%" border="0" cellpadding="0" cellspacing="0"  class="toptable">
        <tr>
          <td width="57%" class="sysmain_navi"  style="PADDING-LEFT: 14px" Height="30">�޸ķ�����Ϣ</td>
          <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="list.aspx" target="sys_main" class="list_link">���ϵͳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�޸ķ�����Ϣ</div></td>
        </tr>
      </table>
      
        <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
        <tr class="TR_BG_list">
          <td align="center" class="navi_link" style="width: 13%">��������</td>
          <td Width="90%" align="left"><asp:TextBox ID="AdsClassName" runat="server" Width="200px" MaxLength="50" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_AdsAdd_018',this)">����</span><asp:RequiredFieldValidator ID="RequireAdsClassName" runat="server" ControlToValidate="AdsClassName" Display="Dynamic" ErrorMessage="<span class=reshow>(*)����д��������</spna>"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr class="TR_BG_list">
          <td align="center" class="navi_link" style="width: 13%">������</td>
          <td Width="90%" align="left"><asp:TextBox ID="AdsParentID" runat="server" Width="200px" MaxLength="12" CssClass="form" ReadOnly="true"></asp:TextBox><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_AdsAdd_019',this)">����</span></td>
        </tr>
        <tr class="TR_BG_list">
          <td align="center" class="navi_link" style="width: 13%"> �� �� </td>
          <td Width="90%" align="left"><asp:TextBox ID="AdsPrice" runat="server" Width="200px" MaxLength="10" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_AdsAdd_020',this)">����</span><span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="AdsPrice" Display="Dynamic" ErrorMessage="<span class=reshow>(*)����д�۸�</spna>"></asp:RequiredFieldValidator></span><span><asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="<span class=reshow>(*)�۸��ʽ����ȷ,ֻ��Ϊ������</spna>" Type="Integer" ControlToValidate="AdsPrice" MaximumValue="1000000000" MinimumValue="0" Display="Dynamic"></asp:RangeValidator></span></td>
        </tr>
         <tr class="TR_BG_list">
          <td class="navi_link" colspan="2"><label><asp:Button ID="Button1" runat="server" Text=" ȷ �� " CssClass="form" OnClick="Button1_Click"/></label>      <label><input type="reset" name="UnDo" value=" �� �� " class="form" /></label><input name="adsclassid" type="hidden" runat="server" id="adsclassid" /></td>
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
</html>

