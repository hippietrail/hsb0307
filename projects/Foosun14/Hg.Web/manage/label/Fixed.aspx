<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_label_Fixed" Codebehind="Fixed.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title></title>
<link href="../../sysImages/<%Response.Write(Hg.Config.UIConfig.CssPath());%>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<script language="javascript" type="text/javascript">
<!--
//-->
</script>
</head>
<body>
<form id="Form1" runat="server">
<div>
<table id="top1" width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%"  class="sysmain_navi"  style="PADDING-LEFT: 14px" >固定标签管理</td>
          <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">位置导航：<a href="../main.aspx" target="sys_main">首页</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />固定标签管理</div></td>
        </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
  <tr>
    <td>功能：<a class="topnavichar" href="#">空白</a>　<a class="topnavichar" href="#">空白</a></td>
  </tr>
</table>
<table id="tablist" width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
  <tr class="TR_BG">
    <td class="sys_topBg" width="20%">名称</td>
    <td class="sys_topBg" width="10%">类型</td>
    <td class="sys_topBg" width="20%">样式</td>
    <td class="sys_topBg" width="10%">新闻条数</td>
    <td class="sys_topBg" width="20%">代码</td>
    <td class="sys_topBg" width="20%">添加时间</td>
  </tr>
  </table>
 <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
  <tr>
    <td align="center"><%Response.Write(CopyRight);%></td>
  </tr>
</table>
</div>
</form>
</body>
</html>
