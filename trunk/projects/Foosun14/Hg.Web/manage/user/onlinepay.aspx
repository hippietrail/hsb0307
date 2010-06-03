<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" Inherits="manage_user_onlinepay" Codebehind="onlinepay.aspx.cs" %>
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
              <td width="57%"  class="sysmain_navi" style="padding-left:14px;" >����֧������</td>
              <td width="43%">λ�õ�����<a href="../main.aspx" class="list_link" target="sys_main">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />����֧������</td>
            </tr>
    </table>
     <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" class="table">
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              ѡ��ISP��</div></td>
          <td class="list_link">
               <asp:DropDownList ID="onpayType" runat="server" style="width: 250px">
                  <asp:ListItem Value="0">֧����(www.alipay.com)</asp:ListItem>
                  <asp:ListItem Value="1">����(www.chinabank.com)</asp:ListItem>
                  <asp:ListItem Value="2">����(www.cncard.net)</asp:ListItem>
                  <asp:ListItem Value="3">����</asp:ListItem>
              </asp:DropDownList>
              
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_onlinepay_0001',this)">����</span></td>
        </tr>

        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              �ʺ�</div></td>
          <td class="list_link">
           <asp:TextBox CssClass="form" ID="O_userName" style="width: 250px" runat="server"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_onlinepay_0002',this)">����</span>
           <asp:RequiredFieldValidator ID="f_O_userName" runat="server" ControlToValidate="O_userName" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����д�ʺ�</span>"></asp:RequiredFieldValidator>
          </td>
        </tr>
        

        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              ����</div></td>
          <td class="list_link">
           <asp:TextBox CssClass="form" ID="O_key" style="width: 250px" runat="server" TextMode="Password"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_onlinepay_0003',this)">����</span>
          <asp:RequiredFieldValidator ID="f_O_key" runat="server" ControlToValidate="O_key" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)��д����</span>"></asp:RequiredFieldValidator>
          </td>
        </tr>
        
 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              ISP����ҳ��</div></td>
          <td class="list_link">
           <asp:TextBox CssClass="form" ID="O_sendurl" style="width: 250px" runat="server"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_onlinepay_0004',this)">����</span></td>
        </tr>


        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              ISP����ҳ��/����ҳ��</div></td>
          <td class="list_link">
           <asp:TextBox CssClass="form" ID="O_returnurl" style="width: 250px" runat="server"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_onlinepay_0005',this)">����</span></td>
        </tr>
 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              MD5(����У��)</div></td>
          <td class="list_link">
           <asp:TextBox CssClass="form" ID="O_md5" style="width: 250px" runat="server"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_onlinepay_0006',this)">����</span></td>
        </tr>

        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              ��������һ</div></td>
          <td class="list_link">
           <asp:TextBox CssClass="form" ID="O_other1" style="width: 250px" runat="server"></asp:TextBox>
           </td>
        </tr>        
 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              ����������</div></td>
          <td class="list_link">
           <asp:TextBox CssClass="form" ID="O_other2" style="width: 250px" runat="server"></asp:TextBox>
           </td>
        </tr>    
        
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              ����������</div></td>
          <td class="list_link">
           <asp:TextBox CssClass="form" ID="O_other3" style="width: 250px" runat="server"></asp:TextBox>
           </td>
        </tr>  
                     
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
            </div></td>
          <td class="list_link">
              <asp:Button ID="Button1" runat="server"  CssClass="form" Text="ȷ���ύ" OnClick="Button1_Click" />     </td>

           </tr>               

        </table>    
    </form>
  <br />
    <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
       <tr>
         <td align="center"><label id="copyright" runat="server" /></td>
       </tr>
    </table>  
   </body>
</html>
