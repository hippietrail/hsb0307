<%@ Page Language="C#" AutoEventWireup="true" Inherits="user_info_userinfo_contact" Codebehind="userinfo_contact.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<link href="../../sysImages/<% Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
      <form id="form1" runat="server">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%" height="32" class="sysmain_navi"  style="PADDING-LEFT: 14px" >�޸Ļ�Ա����</td>
          <td width="43%" height="32" class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="userinfo.aspx" class="list_link">�ҵ�����</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�޸���ϵ����</div></td>
        </tr>
</table>
      <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
        <tr>
          <td style="padding-left:14px;"><a class="topnavichar" href="userinfo.aspx">�ҵ�����</a>��<a class="topnavichar" href="userinfo_update.aspx">�޸Ļ�����Ϣ</a>��<a class="topnavichar" href="userinfo_contact.aspx"><font color="red">�޸���ϵ����</font></a>��<a class="topnavichar" href="userinfo_safe.aspx">�޸İ�ȫ����</a>��<a class="topnavichar" href="userinfo_idcard.aspx">�޸�ʵ����֤</a></td>
        </tr>
</table>

      <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="table">
        
                                                                                                                                                                                                                                                                                           
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">ʡ��</div></td> 
          <td class="list_link"><asp:TextBox ID="province" runat="server"  Width="250"  MaxLength="20" CssClass="form"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_update_0002',this)">����</span></td>
        </tr>
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">����</div></td> 
          <td class="list_link"><asp:TextBox ID="City" runat="server"  Width="250"  MaxLength="20" CssClass="form"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_userinfo_update_0003',this)">����</span> </td>
          </tr>
          
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">��ַ</div></td>
          <td class="list_link"><asp:TextBox ID="Address" runat="server"  Width="250" CssClass="form"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_update_0004',this)">����</span></td>
        </tr>
 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">��������</div></td>
          <td class="list_link"> <asp:TextBox ID="Postcode" runat="server"  Width="250"  MaxLength="10" CssClass="form"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_update_0005',this)">����</span><asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                  ControlToValidate="Postcode" ErrorMessage="��������ȷ����������" ValidationExpression="\d{6}"></asp:RegularExpressionValidator></td>
        </tr>
        
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">��ͥ��ϵ�绰</div></td>
          <td class="list_link"> <asp:TextBox ID="FaTel" runat="server"  Width="250"  MaxLength="30" CssClass="form"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_update_0006',this)">
              ����</span><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                  ControlToValidate="FaTel" ErrorMessage="��������ȷ�ĵ绰����" ValidationExpression="(\(\d{3}\)|\d{3}-)?\d{8}"></asp:RegularExpressionValidator></td>
        </tr>        
        
         <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">�����绰</div></td>
          <td class="list_link"> <asp:TextBox ID="WorkTel" runat="server"  Width="250"  MaxLength="30" CssClass="form"></asp:TextBox> 
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_update_0007',this)">����</span><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                  ControlToValidate="WorkTel" ErrorMessage="��������ȷ�ĵ绰����" ValidationExpression="(\(\d{3}\)|\d{3}-)?\d{8}"></asp:RegularExpressionValidator></td>
        </tr>      
        
        
          <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">����</div></td>  
          <td class="list_link"><asp:TextBox ID="Fax" runat="server"  Width="250"  MaxLength="30" CssClass="form"></asp:TextBox>   
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_update_0009',this)">����</span></td>
        </tr>      


          <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">QQ</div></td>
          <td class="list_link"><asp:TextBox ID="QQ" runat="server"  Width="250"  MaxLength="30" CssClass="form"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_update_0010',this)">����</span><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                  ControlToValidate="QQ" ErrorMessage="��������ȷ��QQ��" ValidationExpression="\d{5,10}"></asp:RegularExpressionValidator></td>
        </tr>     
 
          <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">MSN</div></td>
          <td class="list_link"> <asp:TextBox ID="MSN" runat="server"  Width="250"  MaxLength="30" CssClass="form"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_update_0011',this)">����</span></td>
        </tr>  
         
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px; height: 28px;">&nbsp;</td>
          <td class="list_link" style="height: 28px">&nbsp;<asp:Button ID="sumbitsave" runat="server" CssClass="form" Text=" ȷ �� "  OnClick="submitSave" />
            <input name="reset" type="reset" value=" �� �� "  class="form">          </td>
        </tr>

</table></form>
<br />
<br />
 <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
   <tr>
     <td align="center"><label id="copyright" runat=server /></td>
   </tr>
 </table>

</body>
</html>