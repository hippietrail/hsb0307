<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" Inherits="manage_user_icard" Codebehind="icard.aspx.cs" %>
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
    <table id="top1" width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
            <tr>
              <td height="1" colspan="2"></td>
            </tr>
            <tr>
              <td width="57%"  class="sysmain_navi" style="padding-left:14px;" >�㿨����</td>
              <td width="43%">λ�õ�����<a href="../main.aspx" class="list_link" target="sys_main">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="icard.aspx" class="list_link" target="sys_main">�㿨����</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�㿨�б�</td>
            </tr>
    </table>
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
      <tr>
        <td  style="padding-left:12px;"><a href="icard.aspx" class="topnavichar">ȫ���㿨</a>��<a href="icard.aspx?islock=1" class="topnavichar">������</a>��<a href="icard.aspx?islock=0" class="topnavichar">δ����</a>��<a href="icard.aspx?isuse=1" class="topnavichar">��ʹ��</a>��<a href="icard.aspx?isuse=0" class="topnavichar">δʹ��</a>��<a href="icard.aspx?isbuy=1" class="topnavichar">�ѹ���</a>��<a href="icard.aspx?isbuy=0" class="topnavichar">δ����</a>��<a href="icard.aspx?timeout=0" class="topnavichar">δ����</a>��<a href="icard.aspx?timeout=1" class="topnavichar">�ѹ���</a>��<a href="icard_add.aspx" class="topnavichar" >��ӵ㿨</a>��<a href="icard_adds.aspx" class="topnavichar" >�������ɵ㿨</a><span id="channelList" runat="server" /></td>
      </tr>
      </table>
   <asp:Repeater ID="cardlists" runat="server" OnItemCommand="DataList1_ItemCommand">
       <HeaderTemplate>
        <table width="98%" border="0" align="center" cellpadding="4" cellspacing="1" class="table">
            <tr class="TR_BG">
            <td class="sys_topBg" style="width:120px">����</td>
            <td class="sys_topBg" style="width:140px">����</td>
            <td class="sys_topBg" style="width:200px">���/����/��������</td>
            <td class="sys_topBg" align="center">����״̬</td>
            <td class="sys_topBg" align="center">ʹ��״̬</td>
            <td class="sys_topBg" align="center">״̬</td>
            <td class="sys_topBg" align="center">����<input type="checkbox" value="-222" onclick="selectAll(this.form,this.checked);" /></td>
            </tr>
        </HeaderTemplate>
          <ItemTemplate>
            <tr class="TR_BG_list"  onmouseover="overColor(this)" onmouseout="outColor(this)">
            <td title=""><%#((DataRowView)Container.DataItem)["UserNums"]%><%#((DataRowView)Container.DataItem)["CardNumber"]%></td>
            <td title=""><%#((DataRowView)Container.DataItem)["CardPassWords"]%></td>
            <td valign="middle" ><%#String.Format("{0:N}", ((DataRowView)Container.DataItem)["Money"])%> / <%#((DataRowView)Container.DataItem)["Point"]%> / <%#((DataRowView)Container.DataItem)["isTimeOut"]%></td>
            <td align="center" ><%#((DataRowView)Container.DataItem)["isBuyStr"]%></td>
            <td align="center"><%#((DataRowView)Container.DataItem)["isuseStr"]%></td>
            <td align="center"><%#((DataRowView)Container.DataItem)["islockStr"]%></td>
            <td align="center" ><%#((DataRowView)Container.DataItem)["op"]%></td>
            </tr>
          </ItemTemplate>
          <FooterTemplate>
          </table>
         </FooterTemplate>
    </asp:Repeater>       
    <table width="98%" border="0" align="center" cellpadding="3" cellspacing="2" style="height: 20px">
       <tr>
         <td align="left">
             <uc1:PageNavigator ID="PageNavigator1" runat="server" />
             ���ţ�<asp:TextBox ID="cardnumber" runat="server" Width="80px"></asp:TextBox>  
             ���룺<asp:TextBox ID="cardpassword" runat="server" Width="80px"></asp:TextBox>
             <asp:Button ID="search_button" runat="server" Text="����" OnClick="search_button_Click" />
             </td>
       </tr>
    </table>
    <table width="98%" border="0" align="center" cellpadding="5" cellspacing="2" style="height: 20px">
       <tr>
         <td align="left">
             <asp:Button ID="Button1" runat="server" onclick="islock" Text="����" OnClientClick="{if(confirm('ȷ��Ҫ������')){return true;}return false;}"  />
             <asp:Button ID="Button2" runat="server" onclick="unlock" Text="����" OnClientClick="{if(confirm('ȷ��Ҫ������')){return true;}return false;}"  />
             <asp:Button ID="Button3" runat="server" onclick="delmul" Text="ɾ��" OnClientClick="{if(confirm('ȷ��Ҫɾ����')){return true;}return false;}" />
             <asp:Button ID="Button10" runat="server" onclick="delAll" Text="ɾ������" OnClientClick="{if(confirm('ȷ��������е㿨��\n�˲���������!')){return true;}return false;}" />
             <asp:Button ID="Button4" runat="server" onclick="timeout" Text="����Ϊ����" OnClientClick="{if(confirm('ȷ������Ϊ������\n�˲���������!')){return true;}return false;}" />
             <asp:Button ID="Button6" runat="server" onclick="isuse" Text="����Ϊ��ʹ��" OnClientClick="{if(confirm('ȷ��Ҫ����Ϊ��ʹ����')){return true;}return false;}" />
             <asp:Button ID="Button7" runat="server" onclick="unisuse" Text="����Ϊδʹ��" OnClientClick="{if(confirm('ȷ��Ҫ����Ϊδʹ����')){return true;}return false;}" />
             <asp:Button ID="Button8" runat="server" onclick="isbuy" Text="����Ϊ�ѹ���" OnClientClick="{if(confirm('ȷ��Ҫ����Ϊ�ѹ�����')){return true;}return false;}" />
             <asp:Button ID="Button9" runat="server" onclick="unisbuy" Text="����Ϊδ����" OnClientClick="{if(confirm('ȷ��Ҫ����Ϊδ������')){return true;}return false;}" />
        </td>
       </tr>
    </table>
    </form> <br />
    <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
       <tr>
         <td align="center"><label id="copyright" runat="server" /></td>
       </tr>
    </table>

</body>
</html>
 <script type="text/javascript" language="javascript">
    function getchanelInfo(obj)
    {
       var SiteID=obj.value;
       window.location.href="icard.aspx?SiteID="+SiteID+"";
    }
 
   function getSearch(cardvalue,passvalue,typesvalue)
   {
       window.location.href="icard.aspx?cardNumber="+cardvalue+"&cardPassword="+passvalue+"&types="+typesvalue+"";
   }
 </script>