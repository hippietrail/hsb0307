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
    <td width="57%" class="sysmain_navi"  style="PADDING-LEFT: 14px" Height="30">�ļ�����</td>
          <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img src="../../sysImages/folder/navidot.gif" border="0" />�ɱ�����ǩ��</div></td>
  </tr>
</table>


<!----��ʾ���ܲ˵�------------------------>
<div id="operatefile"><table width="100%" border="0" cellpadding="3" cellspacing="1" class="Navitable" align="center"><tr>
<td style="padding-left:14px;">
<%--
<asp:HyperLink ID="aHome" runat="server" CssClass="menulist">������ҳ</asp:HyperLink>&nbsp;��&nbsp;
<asp:HyperLink ID="aCreateDir" runat="server" CssClass="menulist">����Ŀ¼</asp:HyperLink>&nbsp;��&nbsp;
<asp:HyperLink ID="aUpload" runat="server" CssClass="menulist">�ϴ��ļ�</asp:HyperLink>&nbsp;��&nbsp;
(<a href="javascript:getDateNum_del('\\ad');" class="menulist">&nbsp;���ͼƬ�ļ�</a>��ѡ����ǰ��ͼƬ��<input type="Text" name="dateNum" value="" class="form" style="width:30px;">)
--%>
 <input type="button" name="btnBatchAdd" id="Button1" value=" �������� " class="form" onclick="javascript:batchAdd();"   /> &nbsp;&nbsp;&nbsp;<span id="loading2"></span>
&nbsp;&nbsp;&nbsp;&nbsp;<a href="Class_Map.aspx">������ɱ���Ŀ�Ķ�Ӧ��ϵ</a>
</td></tr></table></div>
<!---------��ʾ�ļ��м��ļ��Ĺ���ҳ-------------------->
<div id="filemanage_list" style="margin-left:2px;"><table border="0" class="table" width="98%" cellpadding="5" cellspacing="1">
<tr class="TR_BG"><td class="list_link" align="left"colspan="5"><asp:HyperLink ID="aGoBack" runat="server" Visible="false" ToolTip="�����ϼ�Ŀ¼" CssClass="list_link" >�����ϼ�Ŀ¼ </asp:HyperLink> | ��ǰĿ¼:<asp:Literal ID="currentDir" runat="server"></asp:Literal></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left">����</td><td class="list_link" align="left">����</td><td class="list_link" align="left">��С(byte)</td><td class="list_link" align="left">����޸�ʱ��</td><td class="list_link" align="left">���� &nbsp;<input name="Checkboxc" type="checkbox" onclick="javascript:selectAll(this.form,this.checked);" /></td></tr>
<asp:Repeater ID="Repeater1" runat="server"  OnItemDataBound="RepeaterItemDataBound">
<ItemTemplate>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);">
<td class="list_link" align="left"><asp:Image ID="fileIcon" runat="server" ToolTip="��������Ŀ¼" /><asp:HyperLink ID="folder" ToolTip="��������Ŀ¼" runat="server" Visible="false"></asp:HyperLink><span class="SpecialFontFamily"><asp:Literal ID="fileName" runat="server"></asp:Literal></span></td>
<td class="list_link" align="left"><asp:Literal ID="fileExtension" runat="server"></asp:Literal></td>
<td class="list_link" align="left"><asp:Literal ID="fileSize" runat="server"></asp:Literal></td>
<td class="list_link" align="left"><span style="font-size:10px"><asp:Literal ID="fileCreateAt" runat="server"></asp:Literal></span></td>
<td class="list_link" align="left">
    <asp:HyperLink ID="aAddFile" runat="server" CssClass="list_link" ToolTip="���Ϊ����"></asp:HyperLink>
    <asp:HyperLink ID="aEnter" runat="server" CssClass="list_link" ToolTip="�ƶ����ļ�" Visible="false"></asp:HyperLink>
    <asp:CheckBox ID="chk" runat="server" Visible="false" /><asp:HiddenField ID="fileFullName" runat="server" />
    <%--<a href="javascript:MoveFile('\\ad','107_116.jpg')" class="list_link" title=""><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="ת�ƴ���" /></a>--%>
    <%--<a href='http://localhost:5516\files\ad\107_116.jpg' class="list_link" title="���Ԥ�����ļ�" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="Ԥ�����ļ�" /></a>
    <a href="javascript:EditFile('\\ad','107_116.jpg')" class="list_link" title="���Ϊ���ļ�����"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="Ϊ�������" /></a>
    <a href="javascript:DelFile('\\ad','107_116.jpg')" class="list_link" title="���ɾ�����ļ�"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="ɾ������" /></a>
    <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_FileManage_0002',this)">����</span>--%>
    
    </td></tr>
</ItemTemplate>
</asp:Repeater>

<%--<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/folder.gif" alt="��������¼�Ŀ¼"><a href="javascript:ListGo('\\ad','');" class="list_link" title="��������¼�Ŀ¼">ad</a></td><td class="list_link" align="left">�ļ���</td><td class="list_link" align="left">-</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-22 17:07:52</span></td><td class="list_link" align="left"><a href="javascript:EditFolder('','ad')" class="list_link" title="���Ϊ���ļ��и���"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="Ϊ�������" /></a><a href="javascript:MoveFileFolder('','ad')" class="list_link" title="�ƶ����ļ���"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="ת�ƴ���" /></a><a href="javascript:DelDir('\\ad')" class="list_link" title="���ɾ�����ļ���"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="ɾ������" /></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/folder.gif" alt="��������¼�Ŀ¼"><a href="javascript:ListGo('\\content','');" class="list_link" title="��������¼�Ŀ¼">content</a></td><td class="list_link" align="left">�ļ���</td><td class="list_link" align="left">-</td><td class="list_link" align="left"><span style="font-size:10px">2008-8-22 18:59:02</span></td><td class="list_link" align="left"><a href="javascript:EditFolder('','content')" class="list_link" title="���Ϊ���ļ��и���"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="Ϊ�������" /></a><a href="javascript:MoveFileFolder('','content')" class="list_link" title="�ƶ����ļ���"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="ת�ƴ���" /></a><a href="javascript:DelDir('\\content')" class="list_link" title="���ɾ�����ļ���"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="ɾ������" /></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/jpg.gif">107_116.jpg</td><td class="list_link" align="left">.jpg�ļ�</td><td class="list_link" align="left">2427</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-23 9:10:34</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','107_116.jpg')" class="list_link" title="�ƶ����ļ�"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="ת�ƴ���" /></a><a href='http://localhost:5516\files\ad\107_116.jpg' class="list_link" title="���Ԥ�����ļ�" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="Ԥ�����ļ�" /></a><a href="javascript:EditFile('\\ad','107_116.jpg')" class="list_link" title="���Ϊ���ļ�����"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="Ϊ�������" /></a><a href="javascript:DelFile('\\ad','107_116.jpg')" class="list_link" title="���ɾ�����ļ�"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="ɾ������" /></a><span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_FileManage_0002',this)">����</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/gif.gif">130-1.gif</td><td class="list_link" align="left">.gif�ļ�</td><td class="list_link" align="left">4148</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-22 14:33:08</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','130-1.gif')" class="list_link" title="�ƶ����ļ�"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="ת�ƴ���" /></a><a href='http://localhost:5516\files\ad\130-1.gif' class="list_link" title="���Ԥ�����ļ�" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="Ԥ�����ļ�" /></a><a href="javascript:EditFile('\\ad','130-1.gif')" class="list_link" title="���Ϊ���ļ�����"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="Ϊ�������" /></a><a href="javascript:DelFile('\\ad','130-1.gif')" class="list_link" title="���ɾ�����ļ�"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="ɾ������" /></a><span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_FileManage_0002',this)">����</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/jpg.gif">150_60.jpg</td><td class="list_link" align="left">.jpg�ļ�</td><td class="list_link" align="left">3243</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-23 9:11:54</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','150_60.jpg')" class="list_link" title="�ƶ����ļ�"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="ת�ƴ���" /></a><a href='http://localhost:5516\files\ad\150_60.jpg' class="list_link" title="���Ԥ�����ļ�" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="Ԥ�����ļ�" /></a><a href="javascript:EditFile('\\ad','150_60.jpg')" class="list_link" title="���Ϊ���ļ�����"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="Ϊ�������" /></a><a href="javascript:DelFile('\\ad','150_60.jpg')" class="list_link" title="���ɾ�����ļ�"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="ɾ������" /></a><span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_FileManage_0002',this)">����</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/jpg.gif">200951184020657.jpg</td><td class="list_link" align="left">.jpg�ļ�</td><td class="list_link" align="left">79712</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-23 9:23:54</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','200951184020657.jpg')" class="list_link" title="�ƶ����ļ�"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="ת�ƴ���" /></a><a href='http://localhost:5516\files\ad\200951184020657.jpg' class="list_link" title="���Ԥ�����ļ�" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="Ԥ�����ļ�" /></a><a href="javascript:EditFile('\\ad','200951184020657.jpg')" class="list_link" title="���Ϊ���ļ�����"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="Ϊ�������" /></a><a href="javascript:DelFile('\\ad','200951184020657.jpg')" class="list_link" title="���ɾ�����ļ�"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="ɾ������" /></a><span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_FileManage_0002',this)">����</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/jpg.gif">730044_205740082_2.jpg</td><td class="list_link" align="left">.jpg�ļ�</td><td class="list_link" align="left">142221</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-23 9:19:16</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','730044_205740082_2.jpg')" class="list_link" title="�ƶ����ļ�"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="ת�ƴ���" /></a><a href='http://localhost:5516\files\ad\730044_205740082_2.jpg' class="list_link" title="���Ԥ�����ļ�" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="Ԥ�����ļ�" /></a><a href="javascript:EditFile('\\ad','730044_205740082_2.jpg')" class="list_link" title="���Ϊ���ļ�����"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="Ϊ�������" /></a><a href="javascript:DelFile('\\ad','730044_205740082_2.jpg')" class="list_link" title="���ɾ�����ļ�"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="ɾ������" /></a><span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_FileManage_0002',this)">����</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/gif.gif">agriguagua.gif</td><td class="list_link" align="left">.gif�ļ�</td><td class="list_link" align="left">13026</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-23 10:00:36</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','agriguagua.gif')" class="list_link" title="�ƶ����ļ�"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="ת�ƴ���" /></a><a href='http://localhost:5516\files\ad\agriguagua.gif' class="list_link" title="���Ԥ�����ļ�" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="Ԥ�����ļ�" /></a><a href="javascript:EditFile('\\ad','agriguagua.gif')" class="list_link" title="���Ϊ���ļ�����"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="Ϊ�������" /></a><a href="javascript:DelFile('\\ad','agriguagua.gif')" class="list_link" title="���ɾ�����ļ�"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="ɾ������" /></a><span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_FileManage_0002',this)">����</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/jpg.gif">baoma.jpg</td><td class="list_link" align="left">.jpg�ļ�</td><td class="list_link" align="left">42373</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-23 14:35:28</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','baoma.jpg')" class="list_link" title="�ƶ����ļ�"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="ת�ƴ���" /></a><a href='http://localhost:5516\files\ad\baoma.jpg' class="list_link" title="���Ԥ�����ļ�" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="Ԥ�����ļ�" /></a><a href="javascript:EditFile('\\ad','baoma.jpg')" class="list_link" title="���Ϊ���ļ�����"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="Ϊ�������" /></a><a href="javascript:DelFile('\\ad','baoma.jpg')" class="list_link" title="���ɾ�����ļ�"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="ɾ������" /></a><span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_FileManage_0002',this)">����</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/gif.gif">bawojihuiwo.gif</td><td class="list_link" align="left">.gif�ļ�</td><td class="list_link" align="left">36437</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-23 9:53:50</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','bawojihuiwo.gif')" class="list_link" title="�ƶ����ļ�"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="ת�ƴ���" /></a><a href='http://localhost:5516\files\ad\bawojihuiwo.gif' class="list_link" title="���Ԥ�����ļ�" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="Ԥ�����ļ�" /></a><a href="javascript:EditFile('\\ad','bawojihuiwo.gif')" class="list_link" title="���Ϊ���ļ�����"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="Ϊ�������" /></a><a href="javascript:DelFile('\\ad','bawojihuiwo.gif')" class="list_link" title="���ɾ�����ļ�"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="ɾ������" /></a><span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_FileManage_0002',this)">����</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/jpg.gif">bdzx.jpg</td><td class="list_link" align="left">.jpg�ļ�</td><td class="list_link" align="left">34688</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-22 16:22:18</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','bdzx.jpg')" class="list_link" title="�ƶ����ļ�"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="ת�ƴ���" /></a><a href='http://localhost:5516\files\ad\bdzx.jpg' class="list_link" title="���Ԥ�����ļ�" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="Ԥ�����ļ�" /></a><a href="javascript:EditFile('\\ad','bdzx.jpg')" class="list_link" title="���Ϊ���ļ�����"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="Ϊ�������" /></a><a href="javascript:DelFile('\\ad','bdzx.jpg')" class="list_link" title="���ɾ�����ļ�"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="ɾ������" /></a><span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_FileManage_0002',this)">����</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/gif.gif">bnkuaixun.gif</td><td class="list_link" align="left">.gif�ļ�</td><td class="list_link" align="left">91583</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-22 14:53:18</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','bnkuaixun.gif')" class="list_link" title="�ƶ����ļ�"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="ת�ƴ���" /></a><a href='http://localhost:5516\files\ad\bnkuaixun.gif' class="list_link" title="���Ԥ�����ļ�" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="Ԥ�����ļ�" /></a><a href="javascript:EditFile('\\ad','bnkuaixun.gif')" class="list_link" title="���Ϊ���ļ�����"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="Ϊ�������" /></a><a href="javascript:DelFile('\\ad','bnkuaixun.gif')" class="list_link" title="���ɾ�����ļ�"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="ɾ������" /></a><span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_FileManage_0002',this)">����</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/jpg.gif">dx60y.jpg</td><td class="list_link" align="left">.jpg�ļ�</td><td class="list_link" align="left">24445</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-22 14:32:14</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','dx60y.jpg')" class="list_link" title="�ƶ����ļ�"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="ת�ƴ���" /></a><a href='http://localhost:5516\files\ad\dx60y.jpg' class="list_link" title="���Ԥ�����ļ�" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="Ԥ�����ļ�" /></a><a href="javascript:EditFile('\\ad','dx60y.jpg')" class="list_link" title="���Ϊ���ļ�����"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="Ϊ�������" /></a><a href="javascript:DelFile('\\ad','dx60y.jpg')" class="list_link" title="���ɾ�����ļ�"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="ɾ������" /></a><span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_FileManage_0002',this)">����</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/jpg.gif">dxlh.jpg</td><td class="list_link" align="left">.jpg�ļ�</td><td class="list_link" align="left">41626</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-22 16:23:04</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','dxlh.jpg')" class="list_link" title="�ƶ����ļ�"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="ת�ƴ���" /></a><a href='http://localhost:5516\files\ad\dxlh.jpg' class="list_link" title="���Ԥ�����ļ�" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="Ԥ�����ļ�" /></a><a href="javascript:EditFile('\\ad','dxlh.jpg')" class="list_link" title="���Ϊ���ļ�����"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="Ϊ�������" /></a><a href="javascript:DelFile('\\ad','dxlh.jpg')" class="list_link" title="���ɾ�����ļ�"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="ɾ������" /></a><span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_FileManage_0002',this)">����</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/jpg.gif">dzgg.jpg</td><td class="list_link" align="left">.jpg�ļ�</td><td class="list_link" align="left">18606</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-22 16:22:34</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','dzgg.jpg')" class="list_link" title="�ƶ����ļ�"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="ת�ƴ���" /></a><a href='http://localhost:5516\files\ad\dzgg.jpg' class="list_link" title="���Ԥ�����ļ�" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="Ԥ�����ļ�" /></a><a href="javascript:EditFile('\\ad','dzgg.jpg')" class="list_link" title="���Ϊ���ļ�����"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="Ϊ�������" /></a><a href="javascript:DelFile('\\ad','dzgg.jpg')" class="list_link" title="���ɾ�����ļ�"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="ɾ������" /></a><span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_FileManage_0002',this)">����</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/gif.gif">guanggao01.gif</td><td class="list_link" align="left">.gif�ļ�</td><td class="list_link" align="left">48294</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-23 9:46:34</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','guanggao01.gif')" class="list_link" title="�ƶ����ļ�"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="ת�ƴ���" /></a><a href='http://localhost:5516\files\ad\guanggao01.gif' class="list_link" title="���Ԥ�����ļ�" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="Ԥ�����ļ�" /></a><a href="javascript:EditFile('\\ad','guanggao01.gif')" class="list_link" title="���Ϊ���ļ�����"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="Ϊ�������" /></a><a href="javascript:DelFile('\\ad','guanggao01.gif')" class="list_link" title="���ɾ�����ļ�"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="ɾ������" /></a><span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_FileManage_0002',this)">����</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/jpg.gif">image21.jpg</td><td class="list_link" align="left">.jpg�ļ�</td><td class="list_link" align="left">2744</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-22 14:34:36</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','image21.jpg')" class="list_link" title="�ƶ����ļ�"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="ת�ƴ���" /></a><a href='http://localhost:5516\files\ad\image21.jpg' class="list_link" title="���Ԥ�����ļ�" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="Ԥ�����ļ�" /></a><a href="javascript:EditFile('\\ad','image21.jpg')" class="list_link" title="���Ϊ���ļ�����"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="Ϊ�������" /></a><a href="javascript:DelFile('\\ad','image21.jpg')" class="list_link" title="���ɾ�����ļ�"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="ɾ������" /></a><span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_FileManage_0002',this)">����</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/jpg.gif">images.jpg</td><td class="list_link" align="left">.jpg�ļ�</td><td class="list_link" align="left">2904</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-23 9:24:12</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','images.jpg')" class="list_link" title="�ƶ����ļ�"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="ת�ƴ���" /></a><a href='http://localhost:5516\files\ad\images.jpg' class="list_link" title="���Ԥ�����ļ�" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="Ԥ�����ļ�" /></a><a href="javascript:EditFile('\\ad','images.jpg')" class="list_link" title="���Ϊ���ļ�����"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="Ϊ�������" /></a><a href="javascript:DelFile('\\ad','images.jpg')" class="list_link" title="���ɾ�����ļ�"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="ɾ������" /></a><span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_FileManage_0002',this)">����</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/gif.gif">��ͷ���.gif</td><td class="list_link" align="left">.gif�ļ�</td><td class="list_link" align="left">18918</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-23 9:29:14</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','��ͷ���.gif')" class="list_link" title="�ƶ����ļ�"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="ת�ƴ���" /></a><a href='http://localhost:5516\files\ad\��ͷ���.gif' class="list_link" title="���Ԥ�����ļ�" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="Ԥ�����ļ�" /></a><a href="javascript:EditFile('\\ad','��ͷ���.gif')" class="list_link" title="���Ϊ���ļ�����"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="Ϊ�������" /></a><a href="javascript:DelFile('\\ad','��ͷ���.gif')" class="list_link" title="���ɾ�����ļ�"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="ɾ������" /></a><span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_FileManage_0002',this)">����</span></td></tr>
<tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);"><td class="list_link" align="left"><img src="../../sysImages/FileIcon/gif.gif">��.gif</td><td class="list_link" align="left">.gif�ļ�</td><td class="list_link" align="left">48338</td><td class="list_link" align="left"><span style="font-size:10px">2009-6-23 14:28:38</span></td><td class="list_link" align="left"><a href="javascript:MoveFile('\\ad','��.gif')" class="list_link" title="�ƶ����ļ�"><img src="../../sysImages/default/sysico/remove1.gif" border="0" alt="ת�ƴ���" /></a><a href='http://localhost:5516\files\ad\��.gif' class="list_link" title="���Ԥ�����ļ�" target="_blank"><img src="../../sysImages/default/sysico/review.gif" border="0" alt="Ԥ�����ļ�" /></a><a href="javascript:EditFile('\\ad','��.gif')" class="list_link" title="���Ϊ���ļ�����"><img src="../../sysImages/default/sysico/editname.gif" border="0" alt="Ϊ�������" /></a><a href="javascript:DelFile('\\ad','��.gif')" class="list_link" title="���ɾ�����ļ�"><img src="../../sysImages/default/sysico/del.gif" border="0" alt="ɾ������" /></a><span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_FileManage_0002',this)">����</span></td></tr>
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
    <td class="reshow"><%--��ʾ�����Ŀ¼������һ��Ŀ¼<br />
        ע�⣺ͬ��Ŀ¼֮���ת����ֱ����дĿ���ļ�������,��(content),ͬ�������¼�����ͬ���������ļ��е��¼�Ŀ¼֮���ת��,��д��ʽ��(content\netcms),ת�Ƶ��ϼ��ļ���Ŀ¼ʱ,��д��ʽ��(..\content\netcms) runat="server" onserverclick="btnBatchAdd_ServerClick" --%>
        <input type="button" name="btnBatchAdd" id="btnBatchAdd" value=" �������� " class="form" onclick="javascript:batchAdd();"   /> &nbsp;&nbsp;&nbsp;<span id="loading"></span>
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
//JS���������ݲ���EidtDirName,EidtFileName,DelDir,DelFile,AddDir,��.cs�ļ��е�����Ӧ����ʵ���书��
//---------------------������һ��Ŀ¼-----------
function ListGo(Path,ParentPath)
{
	document.FileList.Path.value=Path;
	document.FileList.ParentPath.value=ParentPath;
	//document.FileList.submit();
	//alert("path=" + encodeURIComponent(Path) + "&parentpath=" + ParentPath);
	window.location.href="CPNS_News_List.aspx?path=" + encodeURIComponent(Path) + "&parentpath=" + encodeURIComponent(ParentPath);
}
//--------------------�޸��ļ�������--------------
function EditFolder(path,filename)   
{
	var ReturnValue='';
	ReturnValue=prompt('�޸ĵ����ƣ�',filename.replace(/'|"/g,''));
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
	        alert('����дҪ����������');
	    }    
	}
}
//---------------------�޸��ļ�����---------------
function EditFile(path,filename)   
{
	var ReturnValue='';
	ReturnValue=prompt('�޸ĵ����ƣ�',filename.replace(/'|"/g,''));
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
	        alert('����дҪ����������');
	    }    
	}
}
//-------------------ɾ���ļ���------------------
function DelDir(path)
{
    if(confirm('��ȷ��������ʲô!!!\nȷ��ɾ�����ļ����Լ����ļ����������ļ���?'))
    {
	    document.FileList.Type.value="DelDir";
	    document.FileList.Path.value=path;
	    document.FileList.submit();
    }
}
//------------------���ͼƬ
function getDateNum_del(path)
{
    var dateNum = document.getElementById("dateNum").value;
    if(dateNum!="")
    {
        if(confirm('��ȷ��������ʲô!!!\nȷ�����' + dateNum + '��(����)ǰ��ͼƬ�ļ���?\n���ͼƬ��ʽ�У�jpg,jpeg,gif,swf,bmp,png,ico.'))
        {
	        document.FileList.Type.value="clearFile";
	        document.FileList.Path.value=path;
	        document.FileList.dateNums.value=dateNum;
	        document.FileList.submit();
        }  
    }
    else
    {
        alert('����д������');
        document.getElementById("dateNum").focus();
    }
      
}
//---------------ɾ���ļ�-------------------------
function DelFile(path,filename)
{
    if(confirm('��ȷ��������ʲô!!!\nȷ��ɾ�����ļ���'))
    {
	    document.FileList.Type.value="DelFile";
	    document.FileList.Path.value=path;
	    document.FileList.filename.value=filename;
	    document.FileList.submit();
    }
}
//-----------------�����ļ���---------------------
function AddDir(path)
{
	var ReturnValue='';
	var filename='';
	ReturnValue=prompt('Ҫ��ӵ��ļ�������',filename.replace(/'|"/g,''));
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
	        alert('����дҪ��ӵ��ļ�������');
	    }    
	}
}
//------------------�ϴ��ļ�---------------------
function UpFile(path)
{
     var WWidth = (window.screen.width-500)/2;
     var Wheight = (window.screen.height-150)/2;
     window.open ("../../configuration/system/Upload.aspx?Path="+path, '�ļ��ϴ�', 'height=150, width=500, top='+Wheight+', left='+WWidth+', toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no'); 
}
//-----------------�ƶ��ļ���--------------------
function MoveFileFolder(path,filename)
{ 
    var ReturnValue='';
	ReturnValue=prompt('��������ת�Ƶ�Ŀ���ļ�������','');
	if ((ReturnValue!='') && (ReturnValue!=null))
    {
	    document.FileList.Type.value="MoveFileFolder";
	    document.FileList.Path.value=path;
	    document.FileList.OldFileName.value=filename;
	    document.FileList.NewFileName.value=ReturnValue;
	    document.FileList.submit();
	}
}
//---------------�ƶ��ļ�------------------------
function MoveFile(path,filename)
{ 
    var ReturnValue='';
	ReturnValue=prompt('��������ת�Ƶ�Ŀ���ļ�������','');
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


//---------------��ȡ����ѡ�е��ļ�------------------------
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

//---------------������������------------------------
function batchAdd()
{
    var files = getAllFiles();
    if(files.length == 0) return false;
    
    window.setTimeout(function(){
                    document.getElementById("loading").innerHTML = "�������������У���ȴ�......";
                    document.getElementById("loading2").innerHTML = "�������������У���ȴ�......";
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
