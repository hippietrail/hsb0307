<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_Sys_navimenuEdit" Codebehind="navimenuEdit.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<link href="../../sysImages/<% Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
<table width="100%" height="32" align="center" border="0" cellpadding="0" cellspacing="0" background="../../sysImages/<% Response.Write(Foosun.Config.UIConfig.CssPath()); %>/admin/reght_1_bg_1.gif">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%" height="32" class="sysmain_navi"  style="PADDING-LEFT: 14px" >�������ܲ˵�</td>
          <td width="43%" height="32" class="topnavichar"  style="PADDING-LEFT: 14px" >λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�������ܲ˵�</td>
        </tr>
</table>
      <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
        <tr>
          <td><span class="topnavichar" style="PADDING-LEFT: 14px"><a class="topnavichar" href="Navimenu_list.aspx">�����ܲ˵�</a>��<a class="topnavichar" href="Navimenu.aspx">�������ܲ˵�</a></span></td>
        </tr>
      </table>
      <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="table">
        <form id="form1" runat="server"><tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">�˵�����</div></td>
          <td class="list_link"><asp:TextBox ID="menuName" runat="server"  Width="250"  MaxLength="50"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_navimenu_0001',this)">����</span><asp:RequiredFieldValidator ID="f_menuName" runat="server" ControlToValidate="menuName" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����д�˵����ƣ�����Ϊ20�ֽ�</span>"></asp:RequiredFieldValidator></td>
        </tr>                                                                                                                                                                                                                                                                                             
        <tr class="TR_BG_list"  id="parent_ID" runat="server">
          <td class="list_link" style="width: 114px"><div align="right">���˵���</div></td>
          <td class="list_link"><label id="parentIDs" runat="server" />
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onClick="Help('H_navimenu_0002',this)">����</span></td>
        </tr>
        <tr class="TR_BG_list"  id="position_ID" runat="server">
          <td class="list_link" style="width: 114px"><div align="right">λ�ñ�ʶ</div></td>
          <td class="list_link"><input id="position" name="position" style="width:250px" maxlength="5" value="99999" runat=server />
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onClick="Help('H_navimenu_0003',this)">����</span></td>
        </tr>
        <tr class="TR_BG_list"  id="type_ID" runat="server">
          <td class="list_link" style="width: 114px; height: 26px;"><div align="right">�˵�����</div></td>
          <td class="list_link" style="height: 26px">
             <asp:DropDownList ID="type" runat="server">
            </asp:DropDownList><span class="helpstyle" style="cursor:help;"  title="����鿴����" onClick="Help('H_navimenu_0004',this)">����</span></td>
        </tr>
        <tr class="TR_BG_list" id="isys_ID" runat="server">
          <td class="list_link" style="width: 114px; height: 23px;"><div align="right">ϵͳ����</div></td>
          <td class="list_link" style="height: 23px"><asp:CheckBox ID="isSys" runat="server" /><span class="helpstyle" style="cursor:help;"  title="����鿴����" onClick="Help('H_navimenu_0005',this)">����</span></td>
        </tr>
        <tr class="TR_BG_list" id="link_ID" runat="server">
          <td class="list_link" style="width: 114px"><div align="right">����·��</div></td>
          <td class="list_link"><asp:TextBox ID="FilePath" runat="server" Width="250" MaxLength="200"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onClick="Help('H_navimenu_0006',this)">����</span><asp:RequiredFieldValidator ID="f_FilePath" runat="server" ControlToValidate="FilePath" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����д��ݲ˵�����·��������Ϊ200�ֽ�</span>"></asp:RequiredFieldValidator></td>
        </tr>
        <tr class="TR_BG_list" id="target_ID" runat="server">
          <td class="list_link" style="width: 114px"><div align="right">�򿪴���</div></td>
          <td class="list_link"><asp:TextBox ID="f_target" runat="server"></asp:TextBox><span class="helpstyle" style="cursor:help;"  title="����鿴����" onClick="Help('H_navimenu_0008',this)">����</span><asp:RequiredFieldValidator ID="f_f_target" runat="server" ControlToValidate="f_target" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����д��ݲ˵�����·��������Ϊ200�ֽ�</span>"></asp:RequiredFieldValidator></td>
        </tr>
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">����˳��</div></td>
          <td class="list_link">
          <asp:TextBox ID="orderID" runat="server" MaxLength="2" value="0" Width="100" />
          <asp:HiddenField ID="am_id" runat="server" />
          <asp:HiddenField ID="Hiddenissys" runat="server" />
          <span class="helpstyle" style="cursor:help"; title="����鿴����"  onclick="Help('H_navimenu_0007',this)">����</span><asp:RequiredFieldValidator ID="f_orderID_1" runat="server" ControlToValidate="orderID" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����д���</span>"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="f_orderID" runat="server" ControlToValidate="orderID"  Display="Static" ErrorMessage="(*)������Ų���ȷ" ValidationExpression="^[0-9]{0,2}"></asp:RegularExpressionValidator></td>
        </tr>
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">Ȩ�޴���</div></td>
          <td class="list_link">
          <asp:TextBox ID="popCode" runat="server" MaxLength="50" Width="100" />
          <span class="helpstyle" style="cursor:help"; title="����鿴����"  onclick="Help('H_navimenu_pop',this)">����</span></td>
        </tr>
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px; height: 28px;">&nbsp;</td>
          <td class="list_link" style="height: 28px">&nbsp;<asp:Button ID="sumbitsave" runat="server" CssClass="form" Text=" �ޡ��� " OnClick="naviedit" />
            <input name="reset" type="reset" value=" �� �� "  class="form">          </td>
        </tr>
</form>
</table>
<br />
<br />
 <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
   <tr>
     <td align="center"><label id="copyright" runat=server /></td>
   </tr>
 </table>
<script language="JavaScript" type="text/javascript">
function changevalue(value)
{
	if(value=='0')
	{
		form1.position.value="99999";
	}
	else
	{
		form1.position.value="88888";
	}
}
</script>
</html>
