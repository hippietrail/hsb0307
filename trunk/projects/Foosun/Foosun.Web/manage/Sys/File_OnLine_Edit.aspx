<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_Sys_File_OnLine_Edit" Codebehind="File_OnLine_Edit.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
</head>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<script type="text/javascript" src="../../editor/Templet_editor.js"></script>
<body>
<form id="FileOnlineform" runat="server" method="post" action="">
  <%
      string FP = Foosun.Config.UIConfig.filePass;//��Web.config�ж�ȡ�ļ�������Ϣ
 %>
  <table width="100%" border="0" cellpadding="0" cellspacing="0"  class="toptable">
    <tr>
      <td width="57%" class="sysmain_navi"  style="PADDING-LEFT: 14px" Height="30">���߱༭<span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_File_Txt_edit_0001',this)">����</span></td>
      <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="File_GetIn.aspx?id=<%= FP %>" class="list_link">�ļ�����</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�ı��༭</div></td>
    </tr>
  </table>
  <table width="98%" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
    <tr class="TR_BG_list">
      <td class="TR_BG_list"><div id="dirPath" runat="server"></div></td>
    </tr>
    <tr class="TR_BG_list">
      <td class="list_link"><!--�༭����ʼ-->
        <script type="text/javascript" language="JavaScript">
        window.onload = function()
	        {
	        var sBasePath = "../../editor/"
            var oFCKeditor = new FCKeditor('ContentTextBox') ;
            oFCKeditor.BasePath	= sBasePath ;
            oFCKeditor.Width = '100%' ;
            oFCKeditor.ToolbarSet = 'Foosun_Templet';
            oFCKeditor.Height = '350px' ;	
            oFCKeditor.ReplaceTextarea() ;
            }
        </script>
		<textarea rows="1" cols="1" name="ContentTextBox" style="display:none" id="ContentTextBox" runat="server" ></textarea>
      </td>
    </tr>
    <tr class="TR_BG_list">
      <td class="list_link" align="center"><input type="button" name="Submit"  value=" ȷ���޸� " class="form" runat="server" id="Button1" onserverclick="Button1_ServerClick"/>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" name="Submit" value=" �� �� " class="form" onclick="javascript:UnDo();" /></td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px" align="center">
    <tr>
      <td align="center"><label id="copyright" runat="server" /></td>
    </tr>
  </table>
</form>
</body>
<script language="javascript" type="text/javascript">
function UnDo()
{
    if(confirm('��ȷ��Ҫȡ�������ĸ�����?'))
    {
        document.FileOnlineform.reset();
    }   
}
</script>
</html>
