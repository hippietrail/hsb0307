<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CPNS_News_List.aspx.cs" Inherits="Foosun.Web.manageXXBN.news.CPNS_News_List" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Untitled Page</title>
    <link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/css.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
    <form id="FileList" runat="server">
    <table width="100%"  align="center" border="0" cellpadding="0" cellspacing="0" class="toptable">
  <tr>
    <td width="57%" class="sysmain_navi"  style="PADDING-LEFT: 14px" Height="30">文件管理</td>
          <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">位置导航：<a href="../main.aspx" target="sys_main" class="list_link">首页</a><img src="../../sysImages/folder/navidot.gif" border="0" />采编新闻签发</div></td>
  </tr>
</table>


<!----显示功能菜单------------------------>
<div id="operatefile"><table width="100%" border="0" cellpadding="3" cellspacing="1" class="Navitable" align="center"><tr>
<td style="padding-left:14px;">
<%--
<asp:HyperLink ID="aHome" runat="server" CssClass="menulist">管理首页</asp:HyperLink>&nbsp;┊&nbsp;
<asp:HyperLink ID="aCreateDir" runat="server" CssClass="menulist">创建目录</asp:HyperLink>&nbsp;┊&nbsp;
<asp:HyperLink ID="aUpload" runat="server" CssClass="menulist">上传文件</asp:HyperLink>&nbsp;┊&nbsp;
(<a href="javascript:getDateNum_del('\\ad');" class="menulist">&nbsp;清空图片文件</a>，选择几天前的图片：<input type="Text" name="dateNum" value="" class="form" style="width:30px;">)
--%>
 <input type="button" name="btnBatchAdd" id="Button1" value=" 批量发布 " class="form" onclick="javascript:batchAdd();"   /> &nbsp;&nbsp;&nbsp;<span id="loading2"></span>
&nbsp;&nbsp;&nbsp;&nbsp;<a href="Class_Map.aspx">设置与采编栏目的对应关系</a>
</td></tr></table></div>
<!---------显示文件夹及文件的管理页-------------------->
<div id="filemanage_list" style="margin-left:2px;"><table border="0" class="table" width="98%" cellpadding="5" cellspacing="1">
<tr class="TR_BG"><td class="list_link" align="left"colspan="5"><asp:HyperLink ID="aGoBack" runat="server" Visible="false" ToolTip="返回上级目录" CssClass="list_link" >返回上级目录 </asp:HyperLink> | 当前目录:<asp:Literal ID="currentDir" runat="server"></asp:Literal></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left">名称</td><td class="list_link" align="left">类型</td><td class="list_link" align="left">大小(byte)</td><td class="list_link" align="left">最后修改时间</td><td class="list_link" align="left">操作 &nbsp;<input name="Checkboxc" type="checkbox" onclick="javascript:selectAll(this.form,this.checked);" /></td></tr>
<asp:Repeater ID="Repeater1" runat="server"  OnItemDataBound="RepeaterItemDataBound">
<ItemTemplate>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);">
<td class="list_link" align="left"><asp:Image ID="fileIcon" runat="server" ToolTip="点击进入此目录" /><asp:HyperLink ID="folder" ToolTip="点击进入此目录" runat="server" Visible="false"></asp:HyperLink><span class="SpecialFontFamily"><asp:Literal ID="fileName" runat="server"></asp:Literal></span></td>
<td class="list_link" align="left"><asp:Literal ID="fileExtension" runat="server"></asp:Literal></td>
<td class="list_link" align="left"><asp:Literal ID="fileSize" runat="server"></asp:Literal></td>
<td class="list_link" align="left"><span style="font-size:10px"><asp:Literal ID="fileCreateAt" runat="server"></asp:Literal></span></td>
<td class="list_link" align="left">
    <asp:HyperLink ID="aAddFile" runat="server" CssClass="list_link" ToolTip="添加为新闻"></asp:HyperLink>
    <asp:HyperLink ID="aEnter" runat="server" CssClass="list_link" ToolTip="移动此文件" Visible="false"></asp:HyperLink>
    <asp:CheckBox ID="chk" runat="server" Visible="false" /><asp:HiddenField ID="fileFullName" runat="server" />
    <%--<a href="javascript:MoveFile('\\ad','107_116.jpg')" class="list_link" title=""><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="转移此项" /></a>--%>
    <%--<a href='http://localhost:5516\files\ad\107_116.jpg' class="list_link" title="点击预览此文件" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="预览该文件" /></a>
    <a href="javascript:EditFile('\\ad','107_116.jpg')" class="list_link" title="点击为此文件更名"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="为此项改名" /></a>
    <a href="javascript:DelFile('\\ad','107_116.jpg')" class="list_link" title="点击删除此文件"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="删除此项" /></a>
    <span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_FileManage_0002',this)">帮助</span>--%>
    
    </td></tr>
</ItemTemplate>
</asp:Repeater>

<%--<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/folder.gif" alt="点击进入下级目录"><a href="javascript:ListGo('\\ad','');" class="list_link" title="点击进入下级目录">ad</a></td><td class="list_link" align="left">文件夹</td><td class="list_link" align="left">-</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-22 17:07:52</span></td><td class="list_link" align="left"><a href="javascript:EditFolder('','ad')" class="list_link" title="点击为此文件夹更名"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="为此项改名" /></a><a href="javascript:MoveFileFolder('','ad')" class="list_link" title="移动此文件夹"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="转移此项" /></a><a href="javascript:DelDir('\\ad')" class="list_link" title="点击删除此文件夹"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="删除此项" /></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/folder.gif" alt="点击进入下级目录"><a href="javascript:ListGo('\\content','');" class="list_link" title="点击进入下级目录">content</a></td><td class="list_link" align="left">文件夹</td><td class="list_link" align="left">-</td><td class="list_link" align="left"><span style="font-size:10px">2008-8-22 18:59:02</span></td><td class="list_link" align="left"><a href="javascript:EditFolder('','content')" class="list_link" title="点击为此文件夹更名"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="为此项改名" /></a><a href="javascript:MoveFileFolder('','content')" class="list_link" title="移动此文件夹"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="转移此项" /></a><a href="javascript:DelDir('\\content')" class="list_link" title="点击删除此文件夹"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="删除此项" /></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/jpg.gif">107_116.jpg</td><td class="list_link" align="left">.jpg文件</td><td class="list_link" align="left">2427</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-23 9:10:34</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','107_116.jpg')" class="list_link" title="移动此文件"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="转移此项" /></a><a href='http://localhost:5516\files\ad\107_116.jpg' class="list_link" title="点击预览此文件" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="预览该文件" /></a><a href="javascript:EditFile('\\ad','107_116.jpg')" class="list_link" title="点击为此文件更名"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="为此项改名" /></a><a href="javascript:DelFile('\\ad','107_116.jpg')" class="list_link" title="点击删除此文件"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="删除此项" /></a><span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_FileManage_0002',this)">帮助</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/gif.gif">130-1.gif</td><td class="list_link" align="left">.gif文件</td><td class="list_link" align="left">4148</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-22 14:33:08</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','130-1.gif')" class="list_link" title="移动此文件"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="转移此项" /></a><a href='http://localhost:5516\files\ad\130-1.gif' class="list_link" title="点击预览此文件" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="预览该文件" /></a><a href="javascript:EditFile('\\ad','130-1.gif')" class="list_link" title="点击为此文件更名"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="为此项改名" /></a><a href="javascript:DelFile('\\ad','130-1.gif')" class="list_link" title="点击删除此文件"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="删除此项" /></a><span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_FileManage_0002',this)">帮助</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/jpg.gif">150_60.jpg</td><td class="list_link" align="left">.jpg文件</td><td class="list_link" align="left">3243</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-23 9:11:54</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','150_60.jpg')" class="list_link" title="移动此文件"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="转移此项" /></a><a href='http://localhost:5516\files\ad\150_60.jpg' class="list_link" title="点击预览此文件" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="预览该文件" /></a><a href="javascript:EditFile('\\ad','150_60.jpg')" class="list_link" title="点击为此文件更名"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="为此项改名" /></a><a href="javascript:DelFile('\\ad','150_60.jpg')" class="list_link" title="点击删除此文件"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="删除此项" /></a><span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_FileManage_0002',this)">帮助</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/jpg.gif">200951184020657.jpg</td><td class="list_link" align="left">.jpg文件</td><td class="list_link" align="left">79712</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-23 9:23:54</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','200951184020657.jpg')" class="list_link" title="移动此文件"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="转移此项" /></a><a href='http://localhost:5516\files\ad\200951184020657.jpg' class="list_link" title="点击预览此文件" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="预览该文件" /></a><a href="javascript:EditFile('\\ad','200951184020657.jpg')" class="list_link" title="点击为此文件更名"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="为此项改名" /></a><a href="javascript:DelFile('\\ad','200951184020657.jpg')" class="list_link" title="点击删除此文件"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="删除此项" /></a><span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_FileManage_0002',this)">帮助</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/jpg.gif">730044_205740082_2.jpg</td><td class="list_link" align="left">.jpg文件</td><td class="list_link" align="left">142221</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-23 9:19:16</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','730044_205740082_2.jpg')" class="list_link" title="移动此文件"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="转移此项" /></a><a href='http://localhost:5516\files\ad\730044_205740082_2.jpg' class="list_link" title="点击预览此文件" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="预览该文件" /></a><a href="javascript:EditFile('\\ad','730044_205740082_2.jpg')" class="list_link" title="点击为此文件更名"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="为此项改名" /></a><a href="javascript:DelFile('\\ad','730044_205740082_2.jpg')" class="list_link" title="点击删除此文件"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="删除此项" /></a><span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_FileManage_0002',this)">帮助</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/gif.gif">agriguagua.gif</td><td class="list_link" align="left">.gif文件</td><td class="list_link" align="left">13026</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-23 10:00:36</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','agriguagua.gif')" class="list_link" title="移动此文件"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="转移此项" /></a><a href='http://localhost:5516\files\ad\agriguagua.gif' class="list_link" title="点击预览此文件" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="预览该文件" /></a><a href="javascript:EditFile('\\ad','agriguagua.gif')" class="list_link" title="点击为此文件更名"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="为此项改名" /></a><a href="javascript:DelFile('\\ad','agriguagua.gif')" class="list_link" title="点击删除此文件"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="删除此项" /></a><span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_FileManage_0002',this)">帮助</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/jpg.gif">baoma.jpg</td><td class="list_link" align="left">.jpg文件</td><td class="list_link" align="left">42373</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-23 14:35:28</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','baoma.jpg')" class="list_link" title="移动此文件"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="转移此项" /></a><a href='http://localhost:5516\files\ad\baoma.jpg' class="list_link" title="点击预览此文件" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="预览该文件" /></a><a href="javascript:EditFile('\\ad','baoma.jpg')" class="list_link" title="点击为此文件更名"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="为此项改名" /></a><a href="javascript:DelFile('\\ad','baoma.jpg')" class="list_link" title="点击删除此文件"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="删除此项" /></a><span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_FileManage_0002',this)">帮助</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/gif.gif">bawojihuiwo.gif</td><td class="list_link" align="left">.gif文件</td><td class="list_link" align="left">36437</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-23 9:53:50</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','bawojihuiwo.gif')" class="list_link" title="移动此文件"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="转移此项" /></a><a href='http://localhost:5516\files\ad\bawojihuiwo.gif' class="list_link" title="点击预览此文件" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="预览该文件" /></a><a href="javascript:EditFile('\\ad','bawojihuiwo.gif')" class="list_link" title="点击为此文件更名"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="为此项改名" /></a><a href="javascript:DelFile('\\ad','bawojihuiwo.gif')" class="list_link" title="点击删除此文件"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="删除此项" /></a><span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_FileManage_0002',this)">帮助</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/jpg.gif">bdzx.jpg</td><td class="list_link" align="left">.jpg文件</td><td class="list_link" align="left">34688</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-22 16:22:18</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','bdzx.jpg')" class="list_link" title="移动此文件"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="转移此项" /></a><a href='http://localhost:5516\files\ad\bdzx.jpg' class="list_link" title="点击预览此文件" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="预览该文件" /></a><a href="javascript:EditFile('\\ad','bdzx.jpg')" class="list_link" title="点击为此文件更名"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="为此项改名" /></a><a href="javascript:DelFile('\\ad','bdzx.jpg')" class="list_link" title="点击删除此文件"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="删除此项" /></a><span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_FileManage_0002',this)">帮助</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/gif.gif">bnkuaixun.gif</td><td class="list_link" align="left">.gif文件</td><td class="list_link" align="left">91583</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-22 14:53:18</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','bnkuaixun.gif')" class="list_link" title="移动此文件"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="转移此项" /></a><a href='http://localhost:5516\files\ad\bnkuaixun.gif' class="list_link" title="点击预览此文件" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="预览该文件" /></a><a href="javascript:EditFile('\\ad','bnkuaixun.gif')" class="list_link" title="点击为此文件更名"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="为此项改名" /></a><a href="javascript:DelFile('\\ad','bnkuaixun.gif')" class="list_link" title="点击删除此文件"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="删除此项" /></a><span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_FileManage_0002',this)">帮助</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/jpg.gif">dx60y.jpg</td><td class="list_link" align="left">.jpg文件</td><td class="list_link" align="left">24445</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-22 14:32:14</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','dx60y.jpg')" class="list_link" title="移动此文件"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="转移此项" /></a><a href='http://localhost:5516\files\ad\dx60y.jpg' class="list_link" title="点击预览此文件" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="预览该文件" /></a><a href="javascript:EditFile('\\ad','dx60y.jpg')" class="list_link" title="点击为此文件更名"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="为此项改名" /></a><a href="javascript:DelFile('\\ad','dx60y.jpg')" class="list_link" title="点击删除此文件"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="删除此项" /></a><span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_FileManage_0002',this)">帮助</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/jpg.gif">dxlh.jpg</td><td class="list_link" align="left">.jpg文件</td><td class="list_link" align="left">41626</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-22 16:23:04</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','dxlh.jpg')" class="list_link" title="移动此文件"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="转移此项" /></a><a href='http://localhost:5516\files\ad\dxlh.jpg' class="list_link" title="点击预览此文件" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="预览该文件" /></a><a href="javascript:EditFile('\\ad','dxlh.jpg')" class="list_link" title="点击为此文件更名"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="为此项改名" /></a><a href="javascript:DelFile('\\ad','dxlh.jpg')" class="list_link" title="点击删除此文件"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="删除此项" /></a><span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_FileManage_0002',this)">帮助</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/jpg.gif">dzgg.jpg</td><td class="list_link" align="left">.jpg文件</td><td class="list_link" align="left">18606</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-22 16:22:34</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','dzgg.jpg')" class="list_link" title="移动此文件"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="转移此项" /></a><a href='http://localhost:5516\files\ad\dzgg.jpg' class="list_link" title="点击预览此文件" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="预览该文件" /></a><a href="javascript:EditFile('\\ad','dzgg.jpg')" class="list_link" title="点击为此文件更名"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="为此项改名" /></a><a href="javascript:DelFile('\\ad','dzgg.jpg')" class="list_link" title="点击删除此文件"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="删除此项" /></a><span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_FileManage_0002',this)">帮助</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/gif.gif">guanggao01.gif</td><td class="list_link" align="left">.gif文件</td><td class="list_link" align="left">48294</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-23 9:46:34</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','guanggao01.gif')" class="list_link" title="移动此文件"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="转移此项" /></a><a href='http://localhost:5516\files\ad\guanggao01.gif' class="list_link" title="点击预览此文件" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="预览该文件" /></a><a href="javascript:EditFile('\\ad','guanggao01.gif')" class="list_link" title="点击为此文件更名"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="为此项改名" /></a><a href="javascript:DelFile('\\ad','guanggao01.gif')" class="list_link" title="点击删除此文件"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="删除此项" /></a><span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_FileManage_0002',this)">帮助</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/jpg.gif">image21.jpg</td><td class="list_link" align="left">.jpg文件</td><td class="list_link" align="left">2744</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-22 14:34:36</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','image21.jpg')" class="list_link" title="移动此文件"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="转移此项" /></a><a href='http://localhost:5516\files\ad\image21.jpg' class="list_link" title="点击预览此文件" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="预览该文件" /></a><a href="javascript:EditFile('\\ad','image21.jpg')" class="list_link" title="点击为此文件更名"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="为此项改名" /></a><a href="javascript:DelFile('\\ad','image21.jpg')" class="list_link" title="点击删除此文件"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="删除此项" /></a><span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_FileManage_0002',this)">帮助</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/jpg.gif">images.jpg</td><td class="list_link" align="left">.jpg文件</td><td class="list_link" align="left">2904</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-23 9:24:12</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','images.jpg')" class="list_link" title="移动此文件"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="转移此项" /></a><a href='http://localhost:5516\files\ad\images.jpg' class="list_link" title="点击预览此文件" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="预览该文件" /></a><a href="javascript:EditFile('\\ad','images.jpg')" class="list_link" title="点击为此文件更名"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="为此项改名" /></a><a href="javascript:DelFile('\\ad','images.jpg')" class="list_link" title="点击删除此文件"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="删除此项" /></a><span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_FileManage_0002',this)">帮助</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/gif.gif">版头广告.gif</td><td class="list_link" align="left">.gif文件</td><td class="list_link" align="left">18918</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-23 9:29:14</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','版头广告.gif')" class="list_link" title="移动此文件"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="转移此项" /></a><a href='http://localhost:5516\files\ad\版头广告.gif' class="list_link" title="点击预览此文件" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="预览该文件" /></a><a href="javascript:EditFile('\\ad','版头广告.gif')" class="list_link" title="点击为此文件更名"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="为此项改名" /></a><a href="javascript:DelFile('\\ad','版头广告.gif')" class="list_link" title="点击删除此文件"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="删除此项" /></a><span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_FileManage_0002',this)">帮助</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/gif.gif">车.gif</td><td class="list_link" align="left">.gif文件</td><td class="list_link" align="left">48338</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-23 14:28:38</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','车.gif')" class="list_link" title="移动此文件"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="转移此项" /></a><a href='http://localhost:5516\files\ad\车.gif' class="list_link" title="点击预览此文件" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="预览该文件" /></a><a href="javascript:EditFile('\\ad','车.gif')" class="list_link" title="点击为此文件更名"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="为此项改名" /></a><a href="javascript:DelFile('\\ad','车.gif')" class="list_link" title="点击删除此文件"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="删除此项" /></a><span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_FileManage_0002',this)">帮助</span></td></tr>
--%>

</table>
</div>


<input type="hidden" name="Type" />
  <input type="hidden" name="Path"/>
  <input type="hidden" name="ParentPath" />
  <input type="hidden" name="OldFileName" />
  <input type="hidden" name="NewFileName" />
  <input type="hidden" name="filename" />
  <input type="hidden" name="Urlx" />
  <input type="hidden" name="dateNums" />
<table width="98%" border="0" cellspacing="0" cellpadding="5" align="center">
  <tr>
    <td class="reshow"><%--提示：点击目录进入下一级目录<br />
        注意：同级目录之间的转移请直接填写目的文件夹名称,如(content),同级到其下级或是同级间其他文件夹的下级目录之间的转移,填写方式如(content\netcms),转移到上级文件夹目录时,填写方式如(..\content\netcms) runat="server" onserverclick="btnBatchAdd_ServerClick" --%>
        <input type="button" name="btnBatchAdd" id="btnBatchAdd" value=" 批量发布 " class="form" onclick="javascript:batchAdd();"   /> &nbsp;&nbsp;&nbsp;<span id="loading"></span>
        </td>
  </tr>
</table>
<br />
<br />
<!-------CopyRight------->
<table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
  <tr>
    <td align="center"><label id="copyright" runat="server" /></td>
  </tr>
</table>
    </form>
    
    
    <script language="javascript" type="text/javascript">
//JS函数，传递参数EidtDirName,EidtFileName,DelDir,DelFile,AddDir,在.cs文件中调用相应函数实现其功能
//---------------------进入下一级目录-----------
function ListGo(Path,ParentPath)
{
	document.FileList.Path.value=Path;
	document.FileList.ParentPath.value=ParentPath;
	//document.FileList.submit();
	//alert("path=" + encodeURIComponent(Path) + "&parentpath=" + ParentPath);
	window.location.href="CPNS_News_List.aspx?path=" + encodeURIComponent(Path) + "&parentpath=" + encodeURIComponent(ParentPath);
}
//--------------------修改文件夹名称--------------
function EditFolder(path,filename)   
{
	var ReturnValue='';
	ReturnValue=prompt('修改的名称：',filename.replace(/'|"/g,''));
	if ((ReturnValue!='') && (ReturnValue!=null))
	{
	    document.FileList.Type.value="EidtDirName";
	    document.FileList.Path.value=path;
	    document.FileList.OldFileName.value=filename;
	    document.FileList.NewFileName.value=ReturnValue;
	    document.FileList.submit();
	}
	else
	{
	    if(ReturnValue!=null)
	    {
	        alert('请填写要更名的名称');
	    }    
	}
}
//---------------------修改文件名称---------------
function EditFile(path,filename)   
{
	var ReturnValue='';
	ReturnValue=prompt('修改的名称：',filename.replace(/'|"/g,''));
	if ((ReturnValue!='') && (ReturnValue!=null))
	{
	    document.FileList.Type.value="EidtFileName";
	    document.FileList.Path.value=path;
	    document.FileList.OldFileName.value=filename;
	    document.FileList.NewFileName.value=ReturnValue;
	    document.FileList.submit();
	}
	else
	{
	    if(ReturnValue!=null)
	    {
	        alert('请填写要更名的名称');
	    }    
	}
}
//-------------------删除文件夹------------------
function DelDir(path)
{
    if(confirm('请确定你在做什么!!!\n确定删除此文件夹以及此文件夹下所有文件吗?'))
    {
	    document.FileList.Type.value="DelDir";
	    document.FileList.Path.value=path;
	    document.FileList.submit();
    }
}
//------------------清空图片
function getDateNum_del(path)
{
    var dateNum = document.getElementById("dateNum").value;
    if(dateNum!="")
    {
        if(confirm('请确定你在做什么!!!\n确定清除' + dateNum + '天(包括)前的图片文件吗?\n清除图片格式有：jpg,jpeg,gif,swf,bmp,png,ico.'))
        {
	        document.FileList.Type.value="clearFile";
	        document.FileList.Path.value=path;
	        document.FileList.dateNums.value=dateNum;
	        document.FileList.submit();
        }  
    }
    else
    {
        alert('请填写天数！');
        document.getElementById("dateNum").focus();
    }
      
}
//---------------删除文件-------------------------
function DelFile(path,filename)
{
    if(confirm('请确定你在做什么!!!\n确定删除此文件吗'))
    {
	    document.FileList.Type.value="DelFile";
	    document.FileList.Path.value=path;
	    document.FileList.filename.value=filename;
	    document.FileList.submit();
    }
}
//-----------------新增文件夹---------------------
function AddDir(path)
{
	var ReturnValue='';
	var filename='';
	ReturnValue=prompt('要添加的文件夹名称',filename.replace(/'|"/g,''));
	if ((ReturnValue!='') && (ReturnValue!=null))
	{
	    document.FileList.Type.value="AddDir";
	    document.FileList.Path.value=path;
	    document.FileList.filename.value=ReturnValue;
	    document.FileList.submit();
	}
	else
	{
	    if(ReturnValue!=null)
	    {
	        alert('请填写要添加的文件夹名称');
	    }    
	}
}
//------------------上传文件---------------------
function UpFile(path)
{
     var WWidth = (window.screen.width-500)/2;
     var Wheight = (window.screen.height-150)/2;
     window.open ("../../configuration/system/Upload.aspx?Path="+path, '文件上传', 'height=150, width=500, top='+Wheight+', left='+WWidth+', toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no'); 
}
//-----------------移动文件夹--------------------
function MoveFileFolder(path,filename)
{ 
    var ReturnValue='';
	ReturnValue=prompt('请输入您转移的目的文件夹名称','');
	if ((ReturnValue!='') && (ReturnValue!=null))
    {
	    document.FileList.Type.value="MoveFileFolder";
	    document.FileList.Path.value=path;
	    document.FileList.OldFileName.value=filename;
	    document.FileList.NewFileName.value=ReturnValue;
	    document.FileList.submit();
	}
}
//---------------移动文件------------------------
function MoveFile(path,filename)
{ 
    var ReturnValue='';
	ReturnValue=prompt('请输入您转移的目的文件夹名称','');
	if ((ReturnValue!='') && (ReturnValue!=null))
    {
	    document.FileList.Type.value="MoveFile";
	    document.FileList.Path.value=path;
	    document.FileList.OldFileName.value=filename;
	    document.FileList.NewFileName.value=ReturnValue;
	    document.FileList.submit();
	}
}


if (window.HTMLElement) {  
  HTMLElement.prototype.__defineSetter__("outerHTML",function(sHTML) {  
        var r=this.ownerDocument.createRange();  
        r.setStartBefore(this);  
        var df=r.createContextualFragment(sHTML);  
        this.parentNode.replaceChild(df,this);  
        return sHTML;  
    });  
  
    HTMLElement.prototype.__defineGetter__("outerHTML",function() {  
     var attr;  
        var attrs=this.attributes;  
        var str="<"+this.tagName.toLowerCase();  
        for (var i=0;i<attrs.length;i++) {  
            attr=attrs[i];  
            if(attr.specified)  
                str+=" "+attr.name+'="'+attr.value+'"';  
        }  
        if(!this.canHaveChildren)  
            return str+">";  
        return str+">"+this.innerHTML+"</"+this.tagName.toLowerCase()+">";  
        });  
  
   HTMLElement.prototype.__defineGetter__("canHaveChildren",function() {  
     switch(this.tagName.toLowerCase()) {  
         case "area":  
         case "base":  
         case "basefont":  
         case "col":  
         case "frame":  
         case "hr":  
         case "img":  
         case "br":  
         case "input":  
         case "isindex":  
         case "link":  
         case "meta":  
         case "param":  
         return false;  
     }  
     return true;  
   });  
}


//---------------获取所有选中的文件------------------------
function getAllFiles()
{
    var files = "";
    var form = document.forms[0];
    for(var i=0;i < form.length;i++)
    {
        var chk =form.elements[i];
	    if(chk.type=="checkbox" && chk.checked && chk.nextSibling && chk.nextSibling.nodeName == "INPUT" && chk.nextSibling.type == "hidden")
	    {
	        files = files + chk.nextSibling.value + ",";
	    }
    }
    return files;
}

//---------------批量发布新闻------------------------
function batchAdd()
{
    var files = getAllFiles();
    if(files.length == 0) return false;
    
    window.setTimeout(function(){
                    document.getElementById("loading").innerHTML = "正在批量发布中，请等待......";
                    document.getElementById("loading2").innerHTML = "正在批量发布中，请等待......";
    }, 500);
    
    var param = "files="+ files;
    var options={
        method:'post',
        parameters:param,
        onComplete:function(response)
	    {
		   window.document.write(response.responseText);
		}
	  }
	new Ajax.Request('BatchAddNewsHandler.ashx',options);
}

</script>
</body>
</html>
