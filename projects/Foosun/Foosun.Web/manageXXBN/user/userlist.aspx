<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" Inherits="manage_user_userlist" Codebehind="userlist.aspx.cs" %>
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
              <td width="57%" class="sysmain_navi" style="padding-left:14px;">��Ա����</td>
              <td width="43%">λ�õ�����<a href="../main.aspx" class="list_link" target="sys_main">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />��Ա����</td>
            </tr>
    </table>
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
      <tr>
        <td  style="padding-left:12px;"><a href="userlist.aspx" class="topnavichar">��Ա��ҳ</a>��<a href="userlist.aspx?usertype=" class="topnavichar" >���л�Ա</a>��<a href="userlist.aspx?usertype=0" class="topnavichar" >���ŵĻ�Ա</a>��<a href="userlist.aspx?usertype=1" class="topnavichar" >�����Ļ�Ա</a>��<a href="userlist.aspx?iscert=1" class="topnavichar" >ʵ����֤�û�</a>��<a href="userlist.aspx?iscert=2" class="topnavichar" >���ʵ����֤�û�</a>��<span style="CURSOR: hand"  onclick="opencats('searchuserID');">��ѯ</span>��<span id="groupList" runat="server" /><span id="channelList" runat="server" /></td>
      </tr>
    </table> 
     
     <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable" style="display:none;" id="searchuserID">
      <tr>
        <td  style="padding-left:12px;">�û�����
        <input type="text" name="username" id="TxtUserNm" value="" style="width:80px;" />
        &nbsp;������<input type="text" name="realname" id="realname" value="" style="width:80px;" />
        &nbsp;��ţ�<input type="text" name="userNum" id="userNum" value="" style="width:80px;" />
        &nbsp;�Ա�<select name="sex" id="sex">
            <option value="1">��</option>
            <option value="2">Ů</option>
            <option value="0">����</option>
            <option value="" selected="selected">������</option>
          </select>
          </td>
          </tr>
       <tr>
        <td style="padding-left:12px;">
        ���֣�>=<input type="text" name="ipoint" id="ipoint" value="" style="width:40px;"  /><=<input type="text" name="bipoint" id="bipoint" value="" style="width:40px;"  />
        &nbsp;&nbsp;G �ң�>=<input type="text" name="gpoint" id="gpoint" value="" style="width:40px;" /><=<input type="text" name="bgpoint" id="bgpoint" value="" style="width:40px;" />
       <input type="button" name="Submit" value="����" runat="server" class="form" id="Button8" onserverclick="Button8_ServerClick" />
        </td>
       </tr>
    </table>  
    
<asp:Repeater ID="userlists" runat="server">
   <HeaderTemplate>
       <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" class="table">
        <tr class="TR_BG">
        <td class="sys_topBg" style="width:120px">�û���</td>
        <td class="sys_topBg" style="width:85px">������Ա��</td>
        <td class="sys_topBg" align="center" style="width:45px">����</td>
        <td class="sys_topBg" align="center" style="width:45px">G��</td>
<%--        <td class="sys_topBg" style="width:130px">ע������</td>
--%>        <td class="sys_topBg" align="center" style="width:45px">״̬</td>
        <td class="sys_topBg">��½����</td>
        <td class="sys_topBg">����<input type="checkbox" value="-222" onclick="selectAll(this.form,this.checked);" /></td>
        </tr>
    </HeaderTemplate>
      <ItemTemplate>
        <tr class="TR_BG_list"  onmouseover="overColor(this)" onmouseout="outColor(this)">
        <td align="left" valign="middle"><%#((DataRowView)Container.DataItem)["userNames"]%></td>
        <td align="left" valign="middle" ><%#((DataRowView)Container.DataItem)["groupname"]%></td>
        <td align="center" valign="middle" ><%#((DataRowView)Container.DataItem)["iPoint"]%></td>
        <td align="center" valign="middle" ><%#((DataRowView)Container.DataItem)["gPoint"]%></td>
<%--        <td align="left" valign="middle" ><%#((DataRowView)Container.DataItem)["regTime"]%></td>
--%>        <td align="center" valign="middle" ><%#((DataRowView)Container.DataItem)["lock"]%></td>
        <td align="left" valign="middle" ><%#((DataRowView)Container.DataItem)["LastLoginTime"]%></td>
        <td align="left" valign="middle" ><%#((DataRowView)Container.DataItem)["op"]%></td>
        </tr>
      </ItemTemplate>
      <FooterTemplate>
      </table>
     </FooterTemplate>
</asp:Repeater> 

<table width="98%" border="0" align="center" cellpadding="3" cellspacing="2" style="height: 20px">
   <tr>
     <td align="left">
         <uc1:PageNavigator ID="PageNavigator1" runat="server" /></td>
   </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="height: 20px">
   <tr>
     <td align="left">
         <asp:Button ID="Button1" CssClass="form" runat="server" onclick="islock" Text="��������"  OnClientClick="{if(confirm('ȷ��Ҫ������')){return true;}return false;}" />&nbsp;
         <asp:Button  ID="Button2" CssClass="form" runat="server" onclick="unlock" Text="��������" OnClientClick="{if(confirm('ȷ��Ҫ������')){return true;}return false;}" />&nbsp;
         <asp:Button ID="Button3" CssClass="form"  runat="server" onclick="dels" Text="����ɾ��"  OnClientClick="{if(confirm('ȷ��Ҫɾ����')){return true;}return false;}"/>&nbsp;
         <asp:Button ID="Button4" CssClass="form" runat="server" onclick="bIpoint" Text="���ӵ���" />&nbsp;
         <asp:Button ID="Button5" CssClass="form" onclick="sIpoint"  runat="server" Text="�۳�����"/>&nbsp;
         <asp:Button ID="Button6" CssClass="form" onclick="bGpoint"  runat="server" Text="����G��" />&nbsp;
         <asp:Button ID="Button7" CssClass="form" onclick="sGpoint"  runat="server" Text="�۳�G��" />&nbsp;
         </td>
   </tr>
</table>

</form><br />
<table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
   <tr>
     <td align="center"><label id="copyright" runat="server" /></td>
   </tr>
</table>
</body>
</html>
<script type="text/javascript" language="javascript">
    function getFormInfo(obj)
    {
       var GroupNumber=obj.value;
       window.location.href="userList.aspx?GroupNumber="+GroupNumber+"";
    }
    function getchanelInfo(obj)
    {
       var SiteID=obj.value;
       window.location.href="userList.aspx?SiteID="+SiteID+"";
    }
    
    function opencats(cat)
    {
      if(document.getElementById(cat).style.display=="none")
      {
         document.getElementById(cat).style.display="";
      } else {
         document.getElementById(cat).style.display="none";
      }
    }
</script>