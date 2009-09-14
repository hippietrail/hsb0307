<%@ Page Language="C#" AutoEventWireup="true" Inherits="user_info_onlinePoint" Codebehind="onlinePoint.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
         <tr>
              <td height="1" colspan="2"></td>
            </tr>
            <tr>
              <td width="57%" height="32" class="sysmain_navi"  style="PADDING-LEFT: 14px" >银行冲值</td>
              <td width="43%" height="32" class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">位置导航：<a href="../main.aspx" target="sys_main" class="list_link">首页</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />冲值管理</div></td>
            </tr>
            </table>
          <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
            <tr>
              <td style="padding-left:14px;"><a class="topnavichar" href="getPoint.aspx">点卡冲值</a>&nbsp;┊&nbsp;<a class="topnavichar" href="onlinePoint.aspx">在线银行冲值</a>&nbsp;┊&nbsp;<a href="buyCard.aspx" class="list_link">购买点卡</a>&nbsp;┊&nbsp;<a href="history.aspx"  class="topnavichar">交易明晰</a></td>
            </tr>
          </table>
          <div align="center" id="div_1" runat="server">
              <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" class="table">
                <tr class="TR_BG_list">
                  <td style="padding-left:14px;width:20%;">请输入冲值金额</td><td align="left"><asp:TextBox MaxLength="4" CssClass="form" ID="pointNumber" runat="server">100</asp:TextBox>&nbsp;金币&nbsp;&nbsp;
                  <asp:RequiredFieldValidator ID="f_pointNumber" runat="server" ControlToValidate="pointNumber" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)请输入金额。必须输入正整数</span>"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="pointNumber"  Display="Static" ErrorMessage="(*)格式不正确。请填写正整数.最大长度为4位" ValidationExpression="^[0-9]{0,4}"></asp:RegularExpressionValidator>                  
                  </td>
                </tr>  
                <tr class="TR_BG_list">
                  <td style="padding-left:14px;width:20%;"></td><td align="left"><asp:Button ID="Button1" runat="server" Text="开始冲值" OnClick="Button1_Click" /></td>
                </tr>          
            </table>
        </div>
      <div align="center" id="div_2" runat="server">
          <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" class="table">
                <tr class="TR_BG_list">
                  <td style="padding-left:14px;width:20%;" align="right">您输入的冲值金额</td><td align="left"><label id="pointNumber_1" runat="server" />&nbsp;金币<asp:HiddenField ID="getpointNumber" runat="server" />
                  </td>
                </tr>  
                <tr class="TR_BG_list">
                  <td style="padding-left:14px;width:20%;" align="right">定单编号(临时)</td><td align="left"><label id="orderNumber_1" runat="server" /><asp:HiddenField ID="getorderNumber" runat="server" />
                  </td>
                </tr>  
                <tr class="TR_BG_list">
                  <td style="padding-left:14px;width:20%;" align="right">支付接口</td>
                  <td align="left">
                      <label id="ispName" runat="server" />                                 
                  </td>
                </tr>  
                <tr class="TR_BG_list">
                  <td style="padding-left:14px;width:20%;"></td><td align="left">
                  <asp:HiddenField ID="v_md5info" runat="server" />
                  <asp:HiddenField ID="v_mid" runat="server" />
                  <asp:HiddenField ID="v_oid" runat="server" />
                  <asp:HiddenField ID="v_amount" runat="server" />
                  <asp:HiddenField ID="v_moneytype" runat="server" />
                  <asp:HiddenField ID="v_url" runat="server" /> 
                  <asp:HiddenField ID="postUrl" runat="server" /> 
                  <asp:Button ID="Button2" runat="server" CssClass="form" Text="转到在线银行进行冲值"  OnClientClick="{if(confirm('确认要开始冲值吗？')){return true;}return false;}" OnClick="Button2_Click" />
                   <span class="helpstyle" style="cursor:help"; title="点击查看帮助"  onclick="Help('H_onlinePoint_001',this)">如何冲值的?</span>
                   &nbsp;<span class="helpstyle" style="cursor:help"; title="点击查看帮助"  onclick="Help('H_onlinePoint_002',this)">金币和冲值的金额关系?</span>
                   </td>
                </tr>          
            </table>
    </div>
    </form>
    <br />
    <br />
     <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
       <tr>
         <td align="center"><% Response.Write(CopyRight); %></td>
       </tr>
     </table>    
</body>
</html>
