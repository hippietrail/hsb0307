<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_label_sysLabel_inlabel" Codebehind="sysLabel_inlabel.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
<form id="Form1" runat="server">

    <table id="top1" width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
    <tr>
      <td width="57%"  class="sysmain_navi"  style="PADDING-LEFT: 14px" >��ǩ����</td>
      <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="SysLabel_List.aspx" class="list_link">��ǩ����</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><label id="outlabel_type" runat="server" /></div></td>
    </tr>
    </table>
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
      <tr>
        <td style="padding-left:15px;"><a href="SysLabel_List.aspx" class="list_link">��ǩ����</a>&nbsp;��&nbsp;<a class="topnavichar" href="syslabel_bak.aspx">���ݿ�</a>&nbsp;��&nbsp;<a class="reshow" href="syslable_add.aspx">�½���ǩ</a>&nbsp;��&nbsp; <a  class="topnavichar" href="syslabelclass_add.aspx">�½�����</a>&nbsp;��&nbsp;<a href="sysLabel_out.aspx?type=out" class="topnavichar" title="�������б�ǩ">������ǩ</a><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_label_out_001',this)">(��ε�����ǩ?)</span>&nbsp;��&nbsp; <a href="sysLabel_out.aspx?type=in" class="topnavichar">�����ǩ</a><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_label_in_001',this)">(��ε����ǩ?)</span> <span id="Back" runat="server"></span></td>
      </tr>
    </table>
    
      <table width="98%" border="0" align="center" cellpadding="4" runat="server" id="in_table" cellspacing="1" class="table">
      <tr class="TR_BG">
        <td align="left" valign="middle" class="sysmain_navi" style="width:400px;">ѡ��Ҫ�ѱ�ǩ����ķ���</td>
      </tr>   
        <tr class="TR_BG_list">
        <td align="left" style="height:50px;">
           <asp:DropDownList ID="LabelClass" runat="server" Width="195px">
          </asp:DropDownList> <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_label_in_tb',this)">�ر�˵��?</span>
          <asp:HiddenField ID="xmlPath" runat="server" />
          <asp:HiddenField ID="ATserverTF" runat="server" />
          <asp:Button ID="Button1" runat="server" Text="��ʼ����" CssClass="form" OnClick="In_click" />
        </td>
           
        </tr>
      </table>
    </form>
    
  <br />
  <br />
 <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
  <tr>
    <td align="center"><label id="copyright" runat="server" /></td>
  </tr>
</table>        
</body>
</html>
