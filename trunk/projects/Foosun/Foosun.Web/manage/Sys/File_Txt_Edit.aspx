<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_Sys_File_Txt_Edit" Codebehind="File_Txt_Edit.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
</head>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<script language="JavaScript" type="text/javascript" src="../../editor/editor.js"></script>
<body>
<form id="FileTxtform" runat="server" method="post" action="">
  <%
      string FP = Foosun.Config.UIConfig.filePass;//��Web.config�ж�ȡ�ļ�������Ϣ
 %>
  <table width="100%" border="0" cellpadding="0" cellspacing="0"  class="toptable">
    <tr>
      <td width="57%" class="sysmain_navi"  style="PADDING-LEFT: 14px" Height="30">�ı��༭<span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_File_Txt_edit_0001',this)">����</span></td>
      <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="File_GetIn.aspx?id=<%= FP %>" class="list_link">�ļ�����</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�ı��༭</div></td>
    </tr>
  </table>
  <table width="98%" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
    <tr class="TR_BG_list">
      <td class="TR_BG_list"><div id="dirPath" runat="server"></div></td>
    </tr>
    <tr class="TR_BG_list">
      <td class="list_link" style="padding-top:0;padding-left:0;padding-right:0;padding-bottom:0;"><!--�༭����ʼ-->
        <asp:TextBox ID="FileContent" runat="server" Width="810" Height="289px" CssClass="form" TextMode="MultiLine"></asp:TextBox>
        <div id="test" runat="server"></div>
        <!--�༭������--></td>
    </tr>
    <tr class="TR_BG_list">
      <td class="list_link"><div align="center">
          <input type="button" name="Submit" onclick="javascript:CheckForm();" value=" ȷ���ύ " class="form" />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="button" name="Submit" value=" �� �� " class="form" onclick="javascript:UnDo();" />
        </div></td>
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
function CheckForm()
{
    if(confirm('��ȷ��Ҫ���������ĸ�����?'))
    {
        document.FileTxtform.action='File_Txt_Edit.aspx?action=Save&dir=<% Response.Write(Request.QueryString["dir"]); %>&filename=<% Response.Write(Request.QueryString["filename"]); %>';
        document.FileTxtform.submit();
    }   
}
function UnDo()
{
    if(confirm('��ȷ��Ҫȡ�������ĸ�����?'))
    {
        document.FileTxtform.reset();
    }   
}
</script>
</html>
