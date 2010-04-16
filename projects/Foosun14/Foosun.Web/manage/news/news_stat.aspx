<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" Inherits="manage_news_news_stat" Codebehind="news_stat.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" charset="gb2312" type="text/javascript" src="../../configuration/js/Public.js">
</script>
<meta http-equiv="Content-Type" content="text/html"; />
</head>
<body>
   <form id="form1" runat="server" method="post">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
            <tr>
              <td style="height:1px;" colspan="2"></td>
            </tr>
            <tr>
              <td class="sysmain_navi"  style="width:57%;PADDING-LEFT: 14px; height: 32px;" >
                 统筹</td>
              <td class="topnavichar"  style="width:43%;PADDING-LEFT: 14px; height: 32px;" ><div align="left">位置导航:<a href="../main.aspx" target="sys_main" class="topnavichar">首页</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="news_list.aspx" class="topnavichar">新闻管理</a> <img alt="" src="../../sysImages/folder/navidot.gif" border="0" />统筹</div></td>
            </tr>
    </table>
     <table width="98%" border="0" align="center" cellpadding="8" cellspacing="0" class="table">
       <tr>
         <td class="TR_BG_list">
         <div runat="server" id="AdminList" />
         </td>
         </tr>
<%--         <tr>
         <td class="TR_BG_list">
          <img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="News_stat.aspx.asp?hit=1" class="list_link">点击率最高的50篇文章</a>&nbsp; &nbsp;<img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="News_stat.aspx.asp?comm=1" class="list_link">所有的稿件</a>&nbsp; &nbsp;<img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="News_stat.aspx.aspx?hit=1&isconstr=1" class="list_link"></a>&nbsp; &nbsp;<img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="News_stat.aspx.asp?hit=1&isconstr=1" class="list_link">点击最高的稿件50篇</a>
         </td>
       </tr>
--%>     </table>
	    <br />
	    <br />
     <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height:76px">
       <tr>
         <td align="center"><div runat="server" id="SiteCopyRight" /></td>
       </tr>
     </table>
    </form>
</body>
</html>
