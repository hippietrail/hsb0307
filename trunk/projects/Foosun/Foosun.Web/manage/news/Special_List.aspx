<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_news_Special_List" ResponseEncoding="utf-8" Codebehind="Special_List.aspx.cs" %>
<%@ Import NameSpace="System.Data"%>
<%@ Register Src="../../controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title></title>
    <link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/css.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
<form id="form1" runat="server"> 
  <table width="100%" border="0" cellpadding="0" cellspacing="0"  class="toptable">
    <tr>
      <td width="57%" class="sysmain_navi"  style="PADDING-LEFT: 14px" Height="30">ר�����</td>
      <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />ר�����</div></td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="Navitable" align="center">
  <tr>
    <td style="padding-left:15px;width:34%;"><a href="Special_Add.aspx" class="topnavichar">���ר��</a></td>
    <td style="padding-left:15px;"><a href="javascript:PDel();" class="topnavichar">����ɾ��</a>&nbsp;��&nbsp;<a href="javascript:PRDel();" class="topnavichar">ɾ��������վ</a>&nbsp;��&nbsp;<a href="javascript:PUnlock();" class="topnavichar">��������</a>&nbsp;��&nbsp;<a href="javascript:Plock();" class="topnavichar">��������</a>&nbsp;��&nbsp;<a href="javascript:Publish();" class="topnavichar">���ɾ�̬�ļ�</a>&nbsp;��&nbsp;<a href="special_templet.aspx" class="topnavichar">��������ģ��</a> <span id="channelList" runat="server" style="display:none;"  /> </td></tr>
</table>

<asp:Repeater ID="DataList1" runat="server">
   <HeaderTemplate>
       <table width="98%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#FFFFFF" class="table">
      <tr class="TR_BG">
        <td align="left" valign="middle" class="sys_topBg">ר������</td>
        <td align="left" valign="middle" class="sys_topBg">���ʱ��</td>
        <td align="left" valign="middle" class="sys_topBg">״̬</td>
        <td align="left" valign="middle" class="sys_topBg">ר��������Ϣ</td>
        <td align="left" valign="middle" class="sys_topBg">���� <input type="checkbox" value="'-1'" name="S_ID" id="S_ID" onclick="javascript:selectAll(this.form,this.checked)" /></td>
      </tr>   
    </HeaderTemplate>
      <ItemTemplate>
       <%#((DataRowView)Container.DataItem)["Colum"]%>
      </ItemTemplate>
      <FooterTemplate>
      </table>
     </FooterTemplate>
</asp:Repeater>
<div style="width:98%;" align="right">
    <uc1:PageNavigator ID="PageNavigator1" runat="server" />
</div>
<br />
<table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px" align="center">
   <tr>
     <td align="center"><label id="copyright" runat="server" /></td>
   </tr>
</table>
</form>
</body>
<script language="javascript" type="text/javascript">
function Lock(ID)
{
    self.location="?Type=Lock&ID="+ID;
}
function UnLock(ID)
{
    self.location="?Type=UnLock&ID="+ID;
}
function Del(ID)
{
    if (confirm('��ȷ��ɾ����ר��\n�Լ���ר�����ר����?'))
    {
        self.location="?Type=Del&ID="+ID;
    }
}
function Update(ID)
{
    self.location="Special_edit.aspx?ID="+ID;
}
function AddChild(ID)
{
    self.location="Special_add.aspx?parentID="+ID;
}

function PDel()
{
    if(confirm("��ȷ��Ҫ����ɾ����?\r�˲�������ɾ��ѡ�е�ר��\r�Լ�ѡ��ר�����ר��\rɾ��֮���޷��ָ���"))
    {
	    document.form1.action="?Type=PDel&Mode=Del";
	    document.form1.submit();
	}
}
function PUnlock()
{
    if(confirm("��ȷ��Ҫ����������?"))
    {
	    document.form1.action="?Type=PUnlock";
	    document.form1.submit();
	}
}
function Plock()
{
    if(confirm("��ȷ��Ҫ����������?\r�˲�����������ѡ�е�ר��\r�Լ�ѡ��ר�����ר��"))
    {
	    document.form1.action="?Type=Plock";
	    document.form1.submit();
	}
}
function PRDel()
{
    if(confirm("��ȷ��Ҫɾ��������վ��?\r�˲��������ѡ�е�ר��\r�Լ�ѡ��ר�����ר����뵽����վ��\rɾ��֮����Դӻ���վ�лָ���"))
    {
	    document.form1.action="?Type=PDel&Mode=Re";
	    document.form1.submit();
	}
}

function Publish()
{
    document.form1.action="?Type=Publish";
    document.form1.submit();
}

function getchanelInfo(obj)
{
   var SiteID=obj.value;
   window.location.href="special_List.aspx?SiteID="+SiteID+"";
}
</script>
</html>
