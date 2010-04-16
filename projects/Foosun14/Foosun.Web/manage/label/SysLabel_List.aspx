<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_label_SysLabel_List" Codebehind="SysLabel_List.aspx.cs" %>
<%@ Import NameSpace="System.Data"%>
<%@ Register Src="../../controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
<form id="Form1" runat="server">
<div>
<table id="top1" width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
<tr>
  <td width="57%"  class="sysmain_navi"  style="PADDING-LEFT: 14px" >��ǩ����</td>
  <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="SysLabel_List.aspx" class="list_link">��ǩ����</a></div></td>
</tr>
</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
  <tr>
    <td style="padding-left:15px;"><a class="topnavichar" href="syslabel_bak.aspx">���ݿ�</a>&nbsp;��&nbsp; <a class="reshow" href="syslable_add.aspx?ClassID=<%Response.Write(Request.QueryString["ClassID"]); %>">�½���ǩ</a>&nbsp;��&nbsp; <a  class="topnavichar" href="syslabelclass_add.aspx">�½�����</a>&nbsp;��&nbsp;<a href="sysLabel_out.aspx?type=out" class="topnavichar" title="�������б�ǩ">������ǩ</a><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_label_out_001',this)">(��ε���?)</span>&nbsp;��&nbsp; <a href="sysLabel_out.aspx?type=in" class="topnavichar">�����ǩ</a><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_label_in_001',this)">(��ε���?)</span>&nbsp;��&nbsp; <a href="style.aspx" class="topnavichar">��ʾ��ʽ(��ʽ����)</a> <span id="Back" runat="server"></span>&nbsp;<span id="channelList" runat="server" /></td>
  </tr>
</table>

 <asp:Repeater ID="DataList1" runat="server">
   <HeaderTemplate>
       <table width="98%" border="0" align="center" cellpadding="4" cellspacing="1" class="table">
      <tr class="TR_BG">
        <td align="left" valign="middle" class="sysmain_navi" style="width:400px;"><% =Cname %></td>
        <td align="left" valign="middle" class="sysmain_navi">��������</td>
        <td align="left" valign="middle" class="sysmain_navi" style="width:200px;">����</td>
      </tr>   
    </HeaderTemplate>
      <ItemTemplate>
        <tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);">
        <td align="left" valign="middle" style="width:400px;"><%#((DataRowView)Container.DataItem)[7]%></td>
        <td align="left" valign="middle" ><%#((DataRowView)Container.DataItem)[3]%></td>
        <td align="left" valign="middle" style="width:200px;"><%#((DataRowView)Container.DataItem)[6]%></td>
        </tr>
        <tr style="display:none;background-color:#FFFFFF;" id="<%#((DataRowView)Container.DataItem)[1]%>">
        <td colspan="3" style="padding-top:12px;padding-left:12px;padding-bottom:12px;padding-right:12px;">
            <div style="font-size:11.5px;word-wrap:bread-word;word-break:break-all;"><%#((DataRowView)Container.DataItem)[5]%></div>
        </td>
        </tr>
      </ItemTemplate>
      <FooterTemplate>
      </table>
     </FooterTemplate>
</asp:Repeater>

    <div style="width:98%;" align="right"><span style="float:left;">&nbsp;&nbsp;������<input type="text" id="keywords" title="������ǩ���ƺ�����" value="" /> <input type="button" value="������ǩ" onclick="getKeywords(this);return false;" /> </span><span style="float:right;"><uc1:PageNavigator ID="PageNavigator1" runat="server" /></span></div>
  <iframe id="reloadfromfoosun" src="about:blank" border="0" height="0" width="0" style="visibility: hidden"></iframe>
  <br />
  <br />
 <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
  <tr>
    <td align="center"><label id="copyright" runat="server" /></td>
  </tr>
</table>
</div>
</form>
</body>
</html>
<script language="javascript" type="text/javascript">
function Update(type,id)
{
    switch (type)
    {
        case "Label":
            self.location="syslabel_edit.aspx?LabelID="+id;
            break;
        case "LabelClass":
            self.location="syslabelclass_edit.aspx?ClassID="+id;
           break;
    }
}
function Bak(id)
{
    if(confirm('��ȷ�Ͻ��˱�ǩ���뱸�ݿ���?�����ɹ���˱�ǩ��ʧЧ!'))
    {
        self.location="?Op=Bak&ID="+id;
    }
}
function Del(type,id)
{
    switch (type)
    {
        case "Label":
            if(confirm('��ȷ�Ͻ��˱�ǩ�������վ��?'))
            {
                self.location="?Op=Del&type=Label&ID="+id;
            }
            break;
        case "LabelClass":
            if(confirm('��ȷ�Ͻ�����Ŀ�������վ��?\r�˲������Ὣ����Ŀ�Լ����ڴ���Ŀ�ı�ǩ�������վ.'))
            {
                self.location="?Op=Del&type=LabelClass&ID="+id;
            }
           break;
    }
}

function reload()
{
    if(confirm('��ȷ��Ҫ���´ӷ�Ѷ(Foosun.net)���� [ϵͳ���ñ�ǩ] ��?\n�������ر�ǩ��������ϵͳ���ñ�ǩȫ����ա�\n�ر�ע�⣺���ص���xml�ļ�����xml�ļ�ͨ�������ǩ���ܵ���!\n�����ȷ�ϡ����[ȷ��]��ť'))
    {
	    var ifm = document.getElementById("reloadfromfoosun");
	    ifm.src = "<%Response.Write(ReloadURL);%>";
    }
}

function Dels(type,id)
{
    switch (type)
    {
        case "Label":
            if(confirm('�㽫����ɾ���˱�ǩ'))
            {
                self.location="?Op=Dels&type=Label&ID="+id;
            }
            break;
        case "LabelClass":
            if(confirm('�㽫����ɾ������Ŀ\r�˲������᳹��ɾ������Ŀ�Լ����ڴ���Ŀ�ı�ǩ'))
            {
                self.location="?Op=Dels&type=LabelClass&ID="+id;
            }    
           break;
    }
}

function getchanelInfo(obj)
{
   var SiteID=obj.value;
   window.location.href="sysLabel_list.aspx?SiteID="+SiteID+"&ClassID=<%Response.Write(Request.QueryString["ClassID"]); %>";
}

function shdivlabel(id)
{
    var gid=document.getElementById(id);
    if(gid.style.display=="")
    {
        gid.style.display="none";
    }
    else
    {
        gid.style.display="";
    }
}
function getKeywords(obj)
{
    var getValue = document.getElementById("keywords");
    if(getValue.value=="")
    {
        alert('������ؼ���!');
        return false;
    }
    else
    {
       window.location.href="SysLabel_List.aspx?s=1&keyword="+getValue.value+""; 
    }
}
</script>
