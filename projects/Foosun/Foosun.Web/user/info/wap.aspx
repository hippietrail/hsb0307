<%@ Page Language="C#" AutoEventWireup="true" Inherits="user_info_wap" Codebehind="wap.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
<form id="form1" runat="server">
    <table align="center" width="98%"  border="0" cellpadding="5" cellspacing="1" class="table" style="position: static">
            <tr class="TR_BG">
                <td class="sysmain_navi">WAP����</td>
            </tr>                                              
            <tr class="TR_BG_list">
            <td>��ӭͨ���ֻ��������±�վ��Ϣ�����ʱ�վ�������·��ʣ�<span id="wapGetParam" runat="server" /></td>
            </tr>
            <tr class="TR_BG_list">
            <td class="sys_topBg">ͨ���ֻ������Է��ʵ�������Ϣ��</td>
            </tr>
            <tr class="TR_BG_list">
            <td><div style="height:20px;" class="reshow">����ֻ�ʺϲ鿴Ч�������ʺ����</div><div id="wapContent" style="padding-left:10px;" runat="server" /></td>
            </tr>
    </table>
    
    </form>
    <br />
    <br />
     <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
       <tr>
         <td align="center"><label id="copyright" runat=server /></td>
       </tr>
     </table>    
</body>
</html>
