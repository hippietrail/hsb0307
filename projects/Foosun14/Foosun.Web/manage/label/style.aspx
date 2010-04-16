<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_label_style" ResponseEncoding="utf-8" Codebehind="style.aspx.cs" %>
<%@ Import NameSpace="System.Data"%>
<%@ Register Src="../../controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title></title>
    <link href="../../sysImages/<% Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script></head>
<body>
    <form id="form1" runat="server">
      <table width="100%" border="0" cellpadding="0" cellspacing="0"  class="toptable">
        <tr>
          <td width="57%" class="sysmain_navi"  style="PADDING-LEFT: 14px" height="30">��ʽ����</td>
          <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />��ʽ����</div></td>
        </tr>
      </table>
     
    <table width="100%" border="0" cellpadding="3" cellspacing="1" class="Navitable" align="center">
      <tr>
        <td style="padding-left:15px;"><a href="style_add.aspx?ClassID=<%Response.Write(Request.QueryString["ClassID"]); %>" class="topnavichar">�����ʽ</a>&nbsp;��&nbsp;<a href="styleclass_add.aspx" class="topnavichar">��ӷ���</a>&nbsp;��&nbsp; <a class="reshow" href="syslable_add.aspx">�½���ǩ</a>&nbsp;&nbsp;��&nbsp; <a class="list_link" href="syslabel_list.aspx">���ر�ǩ����</a>&nbsp; <span id="Back" runat="server"></span></td>
       </tr>
    </table>
      <asp:Repeater ID="DataList1" runat="server">
       <HeaderTemplate>
           <table width="98%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#FFFFFF" class="table">
          <tr class="TR_BG">
            <td align="left" valign="middle" class="sys_topBg"><% Response.Write(Cname); %></td>
            <td align="left" valign="middle" class="sys_topBg">��������</td>
            <td align="left" valign="middle" class="sys_topBg">����</td>
          </tr>   
        </HeaderTemplate>
          <ItemTemplate>
            <tr class="TR_BG_list" onmouseover="javascript:overColor(this);" onmouseout="javascript:outColor(this);">
            <td align="left" valign="middle"><%#((DataRowView)Container.DataItem)[6]%></a></td>
            <td align="left" valign="middle" ><%#((DataRowView)Container.DataItem)[3]%></td>
            <td align="left" valign="middle" ><%#((DataRowView)Container.DataItem)[5]%></td>
            </tr>
            <tr style="display:none;background-color:#FFF;" id="<%#((DataRowView)Container.DataItem)[0]%>"><td colspan="4"><div style="padding-top:10px;padding-left:10px;padding-bottom:10px;"><%#((DataRowView)Container.DataItem)["contents"]%></div></td></tr>
          </ItemTemplate>
          <FooterTemplate>
          </table>
         </FooterTemplate>
    </asp:Repeater>
    <div style="width:98%;" align="right"><span style="float:left;">&nbsp;&nbsp;������<input type="text" id="keywords" title="������ʽ���ƺ�����" value="" /> <input type="button" value="������ʽ" onclick="getKeywords(this);return false;" /> </span><span style="float:right;"><uc1:PageNavigator ID="PageNavigator1" runat="server" /></span></div>
      <br />
      <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px" align="center">
        <tr>
          <td align="center"><label id="copyright" runat="server" /></td>
        </tr>
      </table>
    </form>
</body>
</html>
<script language="javascript" type="text/javascript">
function Update(type,id)
{
    switch (type)
    {
        case "style":
            self.location="style_edit.aspx?styleID="+id;
            break;
        case "styleclass":
            self.location="styleclass_edit.aspx?ClassID="+id;
           break;
    }
}

function getReview(id)
{
    if(document.getElementById(id).style.display=="")
    {
       document.getElementById(id).style.display="none";
    }   
    else
    {
       document.getElementById(id).style.display="";
    }
}

function Del(type,id)
{
    switch (type)
    {
        case "style":
            if(confirm('��ȷ�Ͻ�����ʽ�������վ��?'))
            {
                self.location="?Op=Del&type=style&ID="+id;
            }
            break;
        case "styleclass":
            if(confirm('��ȷ�Ͻ�����Ŀ�������վ��?\r�˲������Ὣ����Ŀ�Լ����ڴ���Ŀ����ʽ�������վ.'))
            {
                self.location="?Op=Del&type=styleclass&ID="+id;
            }
           break;
    }
}

function Dels(type,id)
{
    switch (type)
    {
        case "style":
            if(confirm('�㽫����ɾ������ʽ'))
            {
                self.location="?Op=Dels&type=style&ID="+id;
            }
            break;
        case "styleclass":
            if(confirm('�㽫����ɾ������Ŀ\r�˲������᳹��ɾ������Ŀ�Լ����ڴ���Ŀ����ʽ'))
            {
                self.location="?Op=Dels&type=styleclass&ID="+id;
            }    
           break;
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
       window.location.href="style.aspx?s=1&keyword="+getValue.value+""; 
    }
}
</script>
