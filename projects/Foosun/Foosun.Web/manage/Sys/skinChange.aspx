<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" Inherits="manage_Sys_skinChange" Codebehind="skinChange.aspx.cs" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body onload="lsrc();">
    <form id="form1" runat="server">
      <table width="100%" border="0" cellpadding="0" cellspacing="0"  class="toptable">
        <tr>
          <td width="57%" class="sysmain_navi"  style="PADDING-LEFT: 14px"">����Ƥ��</td>
          <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />����Ƥ��</div></td>
        </tr>
      </table>
      <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
        <tr class="TR_BG_list">
          <td align="center" class="navi_link" style="width: 13%">ѡ��Ƥ�����</td>
          <td Width="90%" align="left">
          <label id="skinlist" runat="server" />
          <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_changeSkin_001',this)">����</span>
          </td>
        </tr>
        <tr class="TR_BG_list">
          <td align="center" class="navi_link" style="width: 13%"></td>
          <td width="90%" align="left"> 
             <table border="0" cellpadding="1" cellspacing="0" class="table" style="height:194px;width:300px;">
               <tr>
                 <td align="center"><img src="" id="dsrc" /></td>
               </tr>
             </table>
           </td>
        </tr>
         <tr class="TR_BG_list">
          <td align="center" class="navi_link" style="width: 13%"></td>
          <td width="90%" align="left"> 
           <asp:Button ID="buttons" runat="server" CssClass="form" OnClientClick="{if(confirm('��ȷ��Ҫ����Ƥ����\n���ĺ�ǰ̨��ԱƤ��Ҳ���ı�\n���棺�ı�Ƥ������������Ҫ���µ�½ϵͳ��')){return true;}return false;}" OnClick="buttonsave" Text="����Ƥ��" />
           
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
<script language="javascript" type="text/javascript">
    function lsrc()
    {
        var gskin = document.getElementById("styleDir").value;
        var gimg = document.getElementById("dsrc");
        switch(gskin)
        {
	        case "blue":
	           gimg.src="../../sysImages/skinreview/1.gif";
	           break;
	        case "red":
	           gimg.src="../../sysImages/skinreview/2.gif";
	           break;
	        case "sblue":
	           gimg.src="../../sysImages/skinreview/3.gif";
	           break;
	        case "green":
	           gimg.src="../../sysImages/skinreview/4.gif";
	           break;
	        case "blackwhite":
	           gimg.src="../../sysImages/skinreview/5.gif";
	           break;
	        case "default":
	           gimg.src="../../sysImages/skinreview/6.gif";
	           break;
        }
    }
</script>