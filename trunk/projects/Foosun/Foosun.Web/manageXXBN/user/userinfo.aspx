<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" Inherits="manage_user_userinfo" Codebehind="userinfo.aspx.cs" %>

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
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%" height="32" class="sysmain_navi"  style="PADDING-LEFT: 14px" >�޸Ļ�Ա����</td>
          <td width="43%" height="32" class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="userlist.aspx" class="list_link">��Ա����</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�޸Ļ�������</div></td>
        </tr>
</table>
      <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
        <tr>
          <td style="padding-left:14px;"><a class="topnavichar" href="userinfo.aspx?id=<% Response.Write(Request.QueryString["id"]);%>"><font color="red">������Ϣ</font></a>��<a class="topnavichar" href="userinfo_contact.aspx?id=<% Response.Write(Request.QueryString["id"]);%>">��ϵ����</a>��<a class="topnavichar" href="userinfo_safe.aspx?id=<% Response.Write(Request.QueryString["id"]);%>">��ȫ����</a>��<a class="topnavichar" href="userinfo_base.aspx?id=<% Response.Write(Request.QueryString["id"]);%>">����״̬/ʵ����֤</a></td>
        </tr>
</table>
      
      <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="table">
        
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">�ǳ�</div></td>
          <td class="list_link"><asp:TextBox ID="NickName" CssClass="form" runat="server"  Width="250"  MaxLength="20"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_userinfo_manage_0001',this)">����</span><asp:RequiredFieldValidator ID="f_NickName" runat="server" ControlToValidate="NickName" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����д�ǳƣ���󳤶�Ϊ20�ַ�</span>"></asp:RequiredFieldValidator></td>
        </tr>   
          
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">��ʵ����</div></td>
          <td class="list_link"><asp:TextBox ID="RealName" runat="server"  Width="250"  MaxLength="20" CssClass="form"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_userinfo_update_00030',this)">����</span></td>
        </tr>   
         
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">��Ա��</div></td>
          <td class="list_link"><label id="GroupNumber" runat="server" />
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_userinfo_update_group',this)">����</span></td>
        </tr>   
                                                                                                                                                                                                                                                                                                                 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">�Ա�</div></td>
          <td class="list_link"><label id="sex" runat="server" />
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_manage_0002',this)">����</span></td>
        </tr>
        
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">�����ʼ�</div></td>
          <td class="list_link"><asp:TextBox  CssClass="form" ID="email" runat="server"  Width="250"  MaxLength="220"></asp:TextBox>
          </td>
          </tr>
        
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">��������</div></td>
          <td class="list_link"><asp:TextBox  CssClass="form" ID="birthday" runat="server"  Width="250"  MaxLength="12"></asp:TextBox>
          <img src="../../sysImages/folder/s.gif" title="ѡ������" style="cursor:pointer;" onclick="selectFile('date',document.form1.birthday,140,500);document.form1.birthday.focus();" /> 
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_userinfo_manage_0003',this)">����</span>       <asp:RegularExpressionValidator ID="f_birthday" runat="server"  ControlToValidate="birthday"  ErrorMessage="��ȷ��д��������" ValidationExpression="^[12]{1}(\d){3}[-][01]?(\d){1}[-][0123]?(\d){1}$"></asp:RegularExpressionValidator></td>
          </tr>
          
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">����</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="Nation" runat="server"  Width="250"  MaxLength="12"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_manage_0004',this)">����</span></td>
        </tr>
 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">����</div></td>
          <td class="list_link"> <asp:TextBox CssClass="form" ID="nativeplace" runat="server"  Width="250"  MaxLength="20"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_manage_0005',this)">����</span></td>
        </tr>
        
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">�û�ǩ��</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="Userinfo" runat="server" TextMode="MultiLine" MaxLength="3000" Width="400px" Height="100px"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_manage_0006',this)">
              ����</span></td>
        </tr>        
        
         <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">ͷ��</div></td>
          <td class="list_link"> <asp:TextBox CssClass="form" ID="UserFace" runat="server"  Width="250"  MaxLength="220"></asp:TextBox><img src="../../sysImages/folder/s.gif" title="ѡ������" style="cursor:pointer;" onclick="selectFile('pic',document.form1.UserFace,350,500);document.form1.UserFace.focus();" />  ͷ���|��&nbsp;<asp:TextBox ID="userFacesize" runat="server"  Width="85" CssClass="form"  MaxLength="7"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_manage_0007',this)">����</span></td>
        </tr>      
        
          <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">�Ը�</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="character" runat="server" TextMode="MultiLine" MaxLength="3000" Width="400px" Height="100px"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_manage_0008',this)">����</span></td>
        </tr>      
        
          <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">����</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="UserFan" runat="server" TextMode="MultiLine" MaxLength="3000" Width="400px" Height="100px"></asp:TextBox>   
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_manage_0009',this)">����</span></td>
        </tr>      


          <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">��֯��ϵ</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="orgSch" runat="server"  Width="250"  MaxLength="12"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_manage_0010',this)">����</span></td>
        </tr>     
 
          <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">ְҵ</div></td>
          <td class="list_link"> <asp:TextBox CssClass="form" ID="job" runat="server"  Width="250"  MaxLength="30"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_manage_0011',this)">����</span></td>
        </tr>   
        
          <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">ѧ��</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="education" runat="server"  Width="250"  MaxLength="20"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_manage_0012',this)">����</span></td>
        </tr>   
        
          <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">��ҵԺУ</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="Lastschool" runat="server"  Width="250"  MaxLength="80"></asp:TextBox> 
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_manage_0013',this)">����</span></td>
        </tr>   
 
          <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">�Ƿ���</div></td>
          <td class="list_link"><label id="marriage" runat="server" />
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_manage_0014',this)">����</span></td>
        </tr>    

         
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">���⿪����ϵ��ʽ</div></td>
          <td class="list_link"><label id="isopen" runat="server" />
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_manage_00015',this)">����</span></td>
        </tr>
        
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px; height: 28px;">&nbsp;</td>
          <td class="list_link" style="height: 28px">&nbsp;<asp:Button ID="sumbitsave" runat="server" OnClick="submitSave" CssClass="form" Text=" ȷ �� " />
            <input name="reset" type="reset" value=" �� �� "  class="form" />  
              <asp:HiddenField ID="suid" runat="server" />        </td>
        </tr>

</table></form>
<br />
<br />
 <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
   <tr>
     <td align="center"><label id="copyright" runat="server" /></td>
   </tr>
 </table>
</body>
</html>
