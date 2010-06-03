<%@ Page Language="C#" AutoEventWireup="true" Inherits="Manage_Survey_setParam" Codebehind="setParam.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../../sysImages/<%Response.Write(Hg.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
<form id="form1" runat="server">
  <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" class="toptable">
    <tr>
      <td width="57%" class="sysmain_navi"  style="PADDING-LEFT: 14px" Height="30">�����</td>
      <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">�λ�õ�����<a href="../main.aspx" class="list_link" target="sys_main">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�����</div></td>
    </tr>
  </table>
  <div>
    <table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" class="Navitable">
      <tr class="menulist">
        <td height="18" style="width: 45%" colspan="2"  style="PADDING-LEFT: 14px" ><div align="left"> <a href="ManageVote.aspx" class="menulist"> <a href="setParam.aspx" class="menulist">�ϵͳ�������</a>&nbsp;é�&nbsp;<a href="setClass.aspx" class="menulist">ͶƱ�������</a>&nbsp;é�&nbsp;<a href="setTitle.aspx" class="menulist">ͶƱ�������</a>&nbsp;é�&nbsp;<a href="setItem.aspx" class="menulist">ͶƱѡ�����</a>&nbsp;é�&nbsp;<a href="setSteps.aspx" class="menulist">�ಽͶƱ���</a>&nbsp;���&nbsp;<a href="ManageVote.aspx" class="menulist">ͶƱ�����</a> </div></td>
      </tr>
    </table>
  </div>
  <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1"  class="table">
    <tr class="TR_BG_list">
      <td class="list_link" colspan="2">��ʾ���ϵͳ�������</td>
    </tr>
    <tr class="TR_BG_list">
      <td align="right"  class="list_link" style="width: 257px"> IP�ʱ���</td>
      <td  align="left" class="list_link"><asp:TextBox ID="IPtime" runat="server" Width="124px" CssClass="form"/>
        <span class="helpstyle" style="cursor:help;" title="���鿴���" onClick="Help('H_surverParam_0001',this)">���</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="right"  class="list_link" style="width: 257px"> ��Ƿ�ע�����ͶƱ��</td>
      <td  align="left" class="list_link"><asp:DropDownList ID="IsReg" runat="server" CssClass="form">
          <asp:ListItem Value="1">�</asp:ListItem>
          <asp:ListItem Value="0" Selected="True">Ƿ</asp:ListItem>
        </asp:DropDownList>
        <span class="helpstyle" style="cursor:help;" title="���鿴���" onClick="Help('H_surverParam_0002',this)">���</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="right"  class="list_link" style="width: 257px"> ��ֹͶƱ�IPĶΣ�</td>
      <td  align="left" class="list_link"><textarea ID="IpLimit" runat="server" style="width: 251px; height: 105px" class="form"/>
        <span class="helpstyle" style="cursor:help;" title="���鿴���" onClick="Help('H_surverParam_0003',this)">���</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="center"  colspan="2" class="list_link"><label>
        <input type="submit" name="Saveupload" value=" �� ύ " class="form" id="SavePram" runat="server" onserverclick="SavePram_ServerClick"/>
        </label>
        &nbsp;&nbsp;
        <label>
        <input type="reset" name="Clearupload" value=" � �� " class="form" id="ClearPram" runat="server" />
        </label></td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
    <tr>
      <td align="center"><label id="copyright" runat=server /></td>
    </tr>
  </table>
</form>
</body>
</html>
