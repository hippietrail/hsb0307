<%@ Page Language="C#" AutoEventWireup="true" Inherits="Help_HelpAdd" Codebehind="HelpAdd.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>��������</title>
<script type="text/javascript" src="../editor/fckeditor.js"></script>
<link href="../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="HelpAdd" runat="server" action="HelpAdd.aspx" method="post">
  <table width="98%" align="center" height="32" border="0" cellpadding="0" cellspacing="0" background="../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/admin/reght_1_bg_1.gif">
    <tr>
      <td Height="1" colspan="2"></td>
    </tr>
    <tr>
      <td Width="46%" class="navi_link">λ�ã�<a href="#" class="navi_link">��ҳ</a> <img alt="" src="../sysImages/folder/navidot.gif" border="0" /> ��������</td>
    </tr>
  </table>
      <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
  <tr>
     <td><span class="topnavichar" style="PADDING-LEFT: 14px"><a href="HelpAdd.aspx" class="menulist">��Ӱ���</a> | <a href="HelpList.aspx" class="menulist">��������</a></span></td>
  </tr>
</table>
  <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
    <tr class="TR_BG_list">
      <td Width="10%" align="center" class="navi_link">�������</td>
      <td Width="90%" align="left"><asp:TextBox ID="HelpID" runat="server" Width="300px" MaxLength="30"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequireHelpID" runat="server" ControlToValidate="HelpID"
                        Display="Dynamic" ErrorMessage="<span class=reshow>(*)����д�������</span>"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RequireHelpID_1" runat="server" ControlToValidate="HelpID"
                        Display="Static" ErrorMessage="(*)<span class=reshow>�������ֻ������ĸ��������_��</span>" ValidationExpression="[a-zA-Z0-9_]{0,}"></asp:RegularExpressionValidator></td>
    </tr>
  </table>
  <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
    <tr class="TR_BG_list">
      <td Width="10%" align="left" class="navi_link" colspan="2">�������İ���</td>
    </tr>
    <tr class="TR_BG_list">
      <td Width="10%" align="center" class="navi_link">��������</td>
      <td Width="90%" align="left"><asp:TextBox ID="CnHelpTitle" runat="server" Width="300px" MaxLength="15"></asp:TextBox>
        <asp:RequiredFieldValidator ID="CnRequireHelpTitle" runat="server" ControlToValidate="CnHelpTitle"
                        Display="Dynamic" ErrorMessage="<span class=reshow>(*)����д�������İ�������</span>"></asp:RequiredFieldValidator></td>
    </tr>
    <tr class="TR_BG_list">
      <td Width="10%" align="center" class="navi_link">��������</td>
      <td Width="90%" align="left">
        <script type="text/javascript" language="JavaScript">
             window.onload = function()
            {
            var sBasePath = "../../editor/"
            var oFCKeditor = new FCKeditor('CnHelpContent') ;
            oFCKeditor.BasePath	= sBasePath ;
            oFCKeditor.ToolbarSet = 'Foosun_style';
            oFCKeditor.Width = '100%' ;
            oFCKeditor.Height = '250' ;	
            oFCKeditor.ReplaceTextarea() ;
            }
        </script>
	    <textarea rows="1" cols="1" name="CnHelpContent" style="display:none" id="CnHelpContent" runat="server" ></textarea>
           
      </td>
    </tr>
  </table>
  <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
    <tr class="TR_BG_list">
      <td colspan="2"  class="list_link">
      <label>
        <asp:HiddenField ID="id" runat="server" />
        <asp:Button ID="Button1" runat="server" Text=" ȷ �� " OnClick="Submit1_Click" CssClass="form"/>
        </label>
        <label>
        <input type="reset" name="UnDo" value=" �� �� " class="form" />
        </label>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
