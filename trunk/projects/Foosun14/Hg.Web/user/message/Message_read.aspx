<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" AutoEventWireup="true" Inherits="user_Message_read" EnableEventValidation="true" Codebehind="Message_read.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<script type="text/javascript" src="../../editor/fckeditor.js"></script>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
</head>
<body>
 <form id="form1" name="form1" method="post" action="" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
    <tr>
      <td height="1" colspan="2"></td>
    </tr>
    <tr>
      <td width="57%"  class="sysmain_navi"  style="PADDING-LEFT: 14px" >
          ���Ź���</td>
      <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />���Ź���</div></td>
    </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
    <tr>
        <td style="padding-left:14px;">
            <a href="Message_write.aspx" class="navi_link">д����Ϣ</a> &nbsp; &nbsp;<a href="Message_box.aspx?Id=1" class="navi_link">�ռ���</a> &nbsp; &nbsp;<a href="Message_box.aspx?Id=2" class="navi_link">������</a>&nbsp; &nbsp;<a href="Message_box.aspx?Id=3" class="navi_link">�ݸ���</a>&nbsp; &nbsp;<a href="Message_box.aspx?Id=4" class="navi_link">�ϼ���</a>
        </td>
    </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <tr class="TR_BG_list">
    <td class="list_link" width="20%" style="text-align: right">
        �ռ��ˣ�</td>
    <td class="list_link">
        <asp:TextBox ID="Rec_UserNumBox" runat="server" Width="252px" CssClass="form"></asp:TextBox>&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" Width="127px" CssClass="form" onchange="javascript:_add(this.options[this.selectedIndex].text);"></asp:DropDownList>&nbsp;
        <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_Message_write_0001',this)">����</span>
        <asp:Label ID="FileTFLabel" runat="server" ForeColor="Red" Height="11px" Width="393px"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Rec_UserNumBox" Display="Dynamic" ErrorMessage="������������"></asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr class="TR_BG_list">
    <td class="list_link" style="text-align: right">
        ��Ϣ���⣺</td>
    <td class="list_link">
        <asp:TextBox ID="TitleBox" runat="server" Width="387px" CssClass="form" ReadOnly="True"></asp:TextBox>&nbsp;
        <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_Message_write_0002',this)">����</span>
    </td>
  </tr>
  <tr class="TR_BG_list">
    <td class="list_link" style="text-align: right">
        ��Ϣ���ݣ�</td>
    <td class="list_link">
        <div style="margin-top:3px;">
         <script type="text/javascript" language="JavaScript">
            window.onload = function()
	        {
	        var sBasePath = "../../editor/"
            var oFCKeditor = new FCKeditor('ContentBox') ;
            oFCKeditor.BasePath	= sBasePath ;
            oFCKeditor.ToolbarSet = 'Foosun_User';
            oFCKeditor.Width = '100%' ;
            oFCKeditor.Height = '300' ;	
            oFCKeditor.ReplaceTextarea() ;
            }
        </script>
		<textarea rows="1" cols="1" name="ContentBox" style="display:none" id="ContentBox" runat="server" ></textarea>
        <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_Message_write_0003',this)">����</span>
    </td>
  </tr>
  <tr class="TR_BG_list">
    <td class="list_link" style="text-align: right">
        ��Ҫ�̶ȣ�</td>
    <td class="list_link">
        <asp:Label ID="LevelFlagLabel" runat="server" Width="103px"></asp:Label>
    </td>
  </tr>
    <tr class="TR_BG_list">
    <td class="list_link" style="text-align: right">
        �������أ�</td>
    <td class="list_link">
    <span id="FileTFLabelp" runat="server"></span>
                 <asp:HiddenField ID="MidID" runat="server" />
<%--        <asp:LinkButton ID="FileTFLabelp" runat="server" OnClick="LinkButton1_Click" CssClass="list_link"></asp:LinkButton>
--%>    </td>
  </tr>
  <tr class="TR_BG_list">
    <td class="list_link"></td>
    <td class="list_link">&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="ת����Ϣ" OnClick="Button1_Click" CssClass="form" />
        &nbsp; &nbsp; &nbsp;&nbsp;<input type="reset" name="Submit3" value="������д" class="form">
    </td>
  </tr>
</table>
 <iframe id="Message_export" src="about:blank" border="0" height="0" width="0" style="visibility: hidden"></iframe>
<br />
<br />
<table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
  <tr>
    <td><div align="center"><%Response.Write(CopyRight); %> </div></td>
  </tr>
</table>
</form>
</body>  
<script language="javascript" type="text/javascript">
function _add(value)
{
    if(document.form1.Rec_UserNumBox.value!="")
    {
    document.form1.Rec_UserNumBox.value += ',';
    }
        document.form1.Rec_UserNumBox.value += value ;
}
function sExport()
{
	var ifm = document.getElementById("Message_export");
    var MidID = document.getElementById("MidID").value;
	ifm.src = "Message_file.aspx?Mid="+MidID+"";
	alert(ifm.src);
}
</script>
</html>
