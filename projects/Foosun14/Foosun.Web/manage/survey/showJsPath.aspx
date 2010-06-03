<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_survey_showJsPath" Codebehind="showJsPath.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../../sysImages/<%Response.Write(Hg.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body class="TR_BG_list">
<form id="form1" runat="server">
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="1">
    <tr class="TR_BG_list">
      <td colspan="2" class="list_link">�JSõ��ô���Ϊ:</td>
    </tr>
    <tr class="TR_BG_list">
      <td colspan="2" class="list_link">
          <textarea name="textfield" style="width:98%;height:80px;" id="CodePath" runat="server" class="form" cols="20" rows="4"></textarea>
        </td>
    </tr>
    <tr class="TR_BG_list">
      <td class="list_link" style="padding-top:14px;padding-bottom:14px;"><div align="center">
          <input type="button" name="Submit" value=" � ر " onClick="window.close();" class="form">
        </div></td>
      <td class="list_link" style="padding-top:14px;padding-bottom:14px;"><div align="center">
          <input type="button" name="copy" value=" ո� � " onClick="copyToClipBoard();"  class="form">
        </div></td>
    </tr>
  </table>
</form>
<table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 30px">
  <tr>
    <td align="center"><label id="copyright" runat=server /></td>
  </tr>
</table>
</body>
<script  language="JavaScript">   
function copyToClipBoard()
{ 
    if(confirm("�ȷ�����Ƶ�������?\n�������ǻ�(FireFox)�������û�����ֱ�Ӹ������ϴ��!"))
    {
        var clipBoardContent=document.getElementById("CodePath").value;
        window.clipboardData.setData("Text",clipBoardContent);
	}
		alert("븴�Ƴɹ�");
}
</script>
</html>
