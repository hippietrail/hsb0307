<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_Sys_admin_POPSet" Codebehind="admin_POPSet.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0"  class="toptable">
    <tr>
      <td class="sysmain_navi" style="PADDING-LEFT: 14px;height:30px;width:57%">����ԱȨ�޹���</td>
      <td class="topnavichar"  style="PADDING-LEFT: 14px;height:30px;width:43%"><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="admin_list.aspx" target="sys_main" class="list_link">����Ա����</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />Ȩ������</div></td>
    </tr>
    </table>
    
    <table style="width:98%" border="0" align="center" cellpadding="5" cellspacing="1"  class="table">
      <tr>
        <td style="width:43%;">���ù̶�Ȩ���飺<a href="javascript:getPopGroup(5)" class="list_link">¼��Ա</a>&nbsp;��&nbsp;<a href="javascript:getPopGroup(4)" class="list_link">�༭</a>&nbsp;��&nbsp;<a href="javascript:getPopGroup(3)" class="list_link">���α༭</a>&nbsp;��&nbsp; <a href="javascript:getPopGroup(2)" class="list_link">�ܱ༭</a>&nbsp;��&nbsp;<a href="javascript:getPopGroup(1)" class="list_link">��ͨ����Ա</a>&nbsp;��&nbsp;<a href="javascript:getPopGroup(0)" class="list_link">�߼�����Ա</a>&nbsp;&nbsp;<span class="helpstyle" style="cursor:help;" title="���ʹ����չȨ��" onclick="Help('H_pop_ext',this)">���ʹ����չȨ��?</span> <input type="checkbox" value="-222" onclick="selectAll(this.form,this.checked);" />ȫѡ</td>
      </tr>
    </table>
    
    <table style="width:98%" border="0" align="center" cellpadding="5" cellspacing="1"  class="table">
      <tr>
        <td style="width:43%;" class="sys_topBg"> ���ݹ���&nbsp;&nbsp;<img src="../../sysImages/folder/bs.gif" border="0" style="cursor:pointer;" onclick="hiddenShowDiv('contentPop');" title="�������/չ��" /></td>
      </tr>
      <tr>
        <td style="width:43%;line-height:25px;" class="TR_BG_list">
        <div id="contentPop" runat="server" />
        </td>
      </tr>
    </table>
    <table style="width:98%" border="0" align="center" cellpadding="5" cellspacing="1"  class="table">
      <tr>
        <td style="width:43%;" class="sys_topBg"> ��Ա����&nbsp;&nbsp;<img src="../../sysImages/folder/bs.gif" border="0" style="cursor:pointer;" onclick="hiddenShowDiv('UserPop');" title="�������/չ��" /></td>
      </tr>
      <tr>
        <td style="width:43%;" class="TR_BG_list">
            <div id="UserPop" runat="server" />
        </td>
      </tr>
    </table>
    <table style="width:98%" border="0" align="center" cellpadding="5" cellspacing="1"  class="table">
      <tr>
        <td style="width:43%;" class="sys_topBg"> ģ�����&nbsp;&nbsp;<img src="../../sysImages/folder/bs.gif" border="0" style="cursor:pointer;" onclick="hiddenShowDiv('TempletPop');" title="�������/չ��" /></td>
      </tr>
      <tr>
        <td style="width:43%;" class="TR_BG_list">
            <div id="TempletPop" runat="server" />
        </td>
      </tr>
    </table>
    <table style="width:98%" border="0" align="center" cellpadding="5" cellspacing="1"  class="table">
      <tr>
        <td style="width:43%;" class="sys_topBg"> ��������&nbsp;&nbsp;<img src="../../sysImages/folder/bs.gif" border="0" style="cursor:pointer;" onclick="hiddenShowDiv('PublishPop');" title="�������/չ��" /></td>
      </tr>
      <tr>
        <td style="width:43%;" class="TR_BG_list">
         <div id="PublishPop" runat="server" />
        </td>
      </tr>
    </table>
    <table style="width:98%" border="0" align="center" cellpadding="5" cellspacing="1"  class="table">
      <tr>
        <td style="width:43%;" class="sys_topBg"> ϵͳ���&nbsp;&nbsp;<img src="../../sysImages/folder/bs.gif" border="0" style="cursor:pointer;" onclick="hiddenShowDiv('sysPlusPop');" title="�������/չ��" /></td>
      </tr>
      <tr>
        <td style="width:43%;" class="TR_BG_list">
         <div id="sysPlusPop" runat="server" />
        </td>
      </tr>
    </table>
    <table style="width:98%" border="0" align="center" cellpadding="5" cellspacing="1"  class="table">
      <tr>
        <td style="width:43%;" class="sys_topBg"> �������&nbsp;&nbsp;<img src="../../sysImages/folder/bs.gif" border="0" style="cursor:pointer;" onclick="hiddenShowDiv('ControlPop');" title="�������/չ��" /></td>
      </tr>
      <tr>
        <td style="width:43%;" class="TR_BG_list">
         <div id="ControlPop" runat="server" />
        </td>
      </tr>
    </table>
    <table style="width:98%" border="0" align="center" cellpadding="5" cellspacing="1"  class="table">
      <tr>
        <td style="width:43%;" class="sys_topBg"> API����&nbsp;&nbsp;<img src="../../sysImages/folder/bs.gif" border="0" style="cursor:pointer;" onclick="hiddenShowDiv('APIPop');" title="�������/չ��" /></td>
      </tr>
      <tr>
        <td style="width:43%;" class="TR_BG_list">
         <div id="APIPop" runat="server" />
        </td>
      </tr>
    </table>
    <table style="width:98%" border="0" align="center" cellpadding="5" cellspacing="1"  class="table">
      <tr>
        <td style="width:43%;" class="TR_BG_list">
          <asp:Button ID="Button1" runat="server" Text="����Ȩ��" OnClick="Button1_Click" />
            <input type="button" name="Submit" value="��������" onclick="javascript:UnDo();" />
            </td>
          
      </tr>
    </table>
    </form>
    <br />
    <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px" align="center">
       <tr>
         <td align="center"><div id="copyright" runat="server" /></td>
       </tr>
    </table>
</body>
</html>
 <script language="javascript" type="text/javascript">
    function UnDo()
    {
        if(confirm('��ȷ��Ҫȡ�������ĸ�����?'))
        {
            document.form1.reset();
        }   
    }
    function getPopGroup(num)
    {
       var  UserNum = <%Response.Write(Request.QueryString["UserNum"]); %>
       var  id = <%Response.Write(Request.QueryString["id"]); %>
       window.location.href="admin_POPSet.aspx?UserNum="+UserNum+"&id="+id+"&num="+num+""
    }
    function getPopCode(code)
    {
	    var ie4=document.all&&navigator.userAgent.indexOf("Opera")==-1
	    var ns6=document.getElementById&&!document.all
        if (ie4)
        {
            var clipBoardContent=code;
            window.clipboardData.setData("Text",clipBoardContent);
            alert("�����Ѿ����ơ����룺"+code+"");
        }
        else
        {
            alert("FireFox������û���ֱ�Ӹ��ƴ���!");
        }
    }
    function hiddenShowDiv(id)
    {
        var objs = document.getElementById(id);
        if(objs.style.display=="")
        {
           objs.style.display = "none"; 
        }
        else
        {
           objs.style.display = ""; 
        }
    }
</script>