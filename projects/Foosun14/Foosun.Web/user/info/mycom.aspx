<%@ Page Language="C#" AutoEventWireup="true" Inherits="user_info_mycom"  ResponseEncoding="utf-8" Codebehind="mycom.aspx.cs" %>
<%@ Import NameSpace="System.Data"%>
<%@ Register Src="../../controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body><form id="form1" runat="server">
    <table id="top1" width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
            <tr>
              <td height="1" colspan="2"></td>
            </tr>
            <tr>
              <td width="57%" class="sysmain_navi" style="padding-left:14px;">���۹���</td>
              <td width="43%">λ�õ�����<a href="../main.aspx" class="list_link" target="sys_main">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="#" class="list_link" target="sys_main">���۹���</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�����б�</td>
            </tr>
    </table>
    
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
      <tr>
        <td  style="padding-left:12px;"><div id="sc" runat="server"></div></td>
      </tr>
    </table>
           <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable" style="display:none;" id="searchuserID">
      <tr>
        <td>���⣺<asp:TextBox ID="Title1" runat="server" Width="72px" CssClass="form"></asp:TextBox>&nbsp;<br /></td>
        <td></td>
        <td>��������Ϣ��<asp:TextBox ID="InfoTitle1" runat="server" Width="72px" CssClass="form"></asp:TextBox></td>
        <td >
            ��ˣ�<asp:DropDownList ID="isCheck1" runat="server" Width="72px" CssClass="form">
                <asp:ListItem Value="0">��ѡ��</asp:ListItem>
                <asp:ListItem Value="1">��</asp:ListItem>
                <asp:ListItem Value="2">��</asp:ListItem>
            </asp:DropDownList></td>
        <td>
            ������<asp:DropDownList ID="islock1" runat="server" Width="72px" CssClass="form">
                <asp:ListItem Value="0">��ѡ��</asp:ListItem>
                <asp:ListItem Value="1">��</asp:ListItem>
                <asp:ListItem Value="2">��</asp:ListItem>
            </asp:DropDownList></td>
        <td>���ڣ� <asp:TextBox ID="creatTime1" runat="server" Width="72px" CssClass="form" onclick="selectFile('date',document.form1.creatTime1,160,500);document.form1.creatTime1.focus();"></asp:TextBox>--<asp:TextBox ID="creatTime2" runat="server" Width="72px" CssClass="form" onclick="selectFile('date',document.form1.creatTime1,160,500);document.form1.creatTime1.focus();"></asp:TextBox></td>
        <td ><input type="button" name="Submit" value="����" runat="server" class="form" id="Button8" onserverclick="Button8_ServerClick" CssClass="form"/></td>
       </tr>
    </table>    
      <span id="no" runat="server"></span>  
 <table width="98%" align="center">
 <tr><td colspan="7">
<div>   
    <asp:Repeater ID="DataList1" runat="server">
       <HeaderTemplate>
        <table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" class="table">
            <tr class="TR_BG">
            <td class="sys_topBg" align="center" width="5%"></td>
            <td class="sys_topBg" align="center" width="50%">����</td>
            <td class="sys_topBg" align="center" width="25%">��������Ϣ</td>
            <td class="sys_topBg" align="center" width="5%">����</td>
            <td class="sys_topBg" align="center" width="15%">����<input type="checkbox" name="Checkbox1" onclick="javascript:selectAll(this.form,this.checked)" /></td>
            </tr>
        </HeaderTemplate>
          <ItemTemplate>
            <tr class="TR_BG_list"  onmouseover="overColor(this)" onmouseout="outColor(this)">
            <td align="center"><%#((DataRowView)Container.DataItem)["OrderIDs"]%></td>
            <td align="left"><%#((DataRowView)Container.DataItem)["Content"]%>&nbsp;&nbsp;&nbsp;&nbsp;<%#((DataRowView)Container.DataItem)["GoodTitles"]%>
            <br /><span style="font-size:10px;color:#999999"><%#((DataRowView)Container.DataItem)["creatTime"]%></span>
            </td>
            <td align="center"><%#((DataRowView)Container.DataItem)["InfoTitle"]%></td>
            <td align="center"><%#((DataRowView)Container.DataItem)["islocks"]%></td>
            <td align="center"><%#((DataRowView)Container.DataItem)["Operation"]%></td>
            </tr>
          </ItemTemplate>
          <FooterTemplate>
          </table>
         </FooterTemplate>
    </asp:Repeater> 
</div>
</td></tr>
<tr><asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
    <td align="right">   
    <uc1:PageNavigator ID="PageNavigator1" runat="server" />
</td></tr>
</table>  
<br />
 <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
   <tr>
     <td align="center"><%Response.Write(CopyRight); %></td>
   </tr>
</table>
</form>
</body>
<script language="javascript" type="text/javascript">
function del(ID)
{
   if(confirm("��ȷ��Ҫɾ����?"))
   { 
        self.location="?Type=del&ID="+ID;
   }
}
function PDel()
{
    if(confirm("��ȷ��Ҫ����ɾ����?"))
    {
	    document.form1.action="?Type=PDel";
	    document.form1.submit();
	}
}
function API(ID)
{
    document.form1.action="?APIID="+ID;
    document.form1.submit();
}
function opencats()
{
  if(document.getElementById("searchuserID").style.display=="none")
  {
     document.getElementById("searchuserID").style.display="";
  } else {
     document.getElementById("searchuserID").style.display="none";
  }
}
</script>
</html>