<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" Inherits="manage_user_userinfo_base" Codebehind="userinfo_base.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<link href="../../sysImages/<% Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
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
              <td width="43%" height="32" class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="userlist.aspx" class="list_link">��Ա����</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />����״̬/ʵ����֤</div></td>
            </tr>
    </table>
          <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
            <tr>
              <td style="padding-left:14px;"><a class="topnavichar" href="userinfo.aspx?id=<% Response.Write(Request.QueryString["id"]);%>">������Ϣ</a>��<a class="topnavichar" href="userinfo_contact.aspx?id=<% Response.Write(Request.QueryString["id"]);%>">��ϵ����</a>��<a class="topnavichar" href="userinfo_safe.aspx?id=<% Response.Write(Request.QueryString["id"]);%>">��ȫ����</a>��<a class="topnavichar" href="userinfo_base.aspx?id=<% Response.Write(Request.QueryString["id"]);%>"><font color="red">����״̬/ʵ����֤</font></a></td>
            </tr>
    </table>
      <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="table">
       
       
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">����</div></td> 
          <td class="list_link"><label runat="server" id="lockTF" />
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_userinfo_base_0001',this)">����</span></td>
          </tr>
          
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">����Ա</div></td> 
          <td class="list_link"><label runat="server" id="adminTF" />
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_userinfo_base_0002',this)">����</span></td>
          </tr>          
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">��Ա��</div></td> 
          <td class="list_link"><label id="GroupList" runat="server" />
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_userinfo_base_0003',this)">����</span></td>
          </tr>

        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">֤������</div></td> 
          <td class="list_link"><asp:TextBox CssClass="form" ID="CertType" ReadOnly runat="server" Width="250"></asp:TextBox>
          <select class="form" name="glist" onchange="document.form1.CertType.value=this.options[this.selectedIndex].text;;">
          <option value="">ѡ��֤��</option>
          <option value="���֤">���֤</option>
          <option value="����֤">����֤</option>
          <option value="ѧ��֤">ѧ��֤</option>
          <option value="����">����</option>
          </select>
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_userinfo_base_0004',this)">����</span></td>
          </tr>
          
        <tr class="TR_BG_list"><label id="IDcard" runat="server" />
          <td class="list_link" style="width: 114px"><div align="right">֤������</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="CertNumber" runat="server"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_base_0005',this)">����</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="list_link" href="userIDCard.aspx?id=<% Response.Write(Request.QueryString["id"]);%>">��֤״̬:<span id="isCerts" runat="server" /></a></td>
        </tr>
        
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">����</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="ipoint" runat="server"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_base_0006',this)">����</span></td>
        </tr> 
        
        
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">G��</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="gpoint" runat="server"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_base_0007',this)">����</span></td>
        </tr>        
        
        
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">����ֵ</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="cpoint" runat="server"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_base_0008',this)">����</span></td>
        </tr> 
                
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">����ֵ</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="epoint" runat="server"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_base_0009',this)">����</span></td>
        </tr> 
                
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">��Ծֵ</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="apoint" runat="server"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_base_00010',this)">����</span></td>
        </tr> 
        
         <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">ע������</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ReadOnly ID="RegTime" runat="server"  Width="250"></asp:TextBox>
          <input  class="form" type="button" value="ѡ������"  onclick="selectFile('date',document.form1.RegTime,140,500);document.form1.RegTime.focus();" /> 
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_base_00011',this)">����</span></td>
        </tr>
 
         <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">����½</div></td>
          <td class="list_link"><asp:TextBox CssClass="form"  ReadOnly ID="LastLoginTime" runat="server"  Width="250"></asp:TextBox>
          <input  class="form" type="button" value="ѡ������"  onclick="selectFile('date',document.form1.LastLoginTime,140,500);document.form1.LastLoginTime.focus();" /> 
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_base_00017',this)">����</span></td>
        </tr>
       
       <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">����ʱ��</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="onlineTime" runat="server"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_base_00012',this)">����</span></td>
        </tr> 
                
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">��½����</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="LoginNumber" runat="server"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_base_00013',this)">����</span></td>
        </tr> 
                
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">ͬһIP����½����</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="LoginLimtNumber" runat="server"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_base_00014',this)">����</span></td>
        </tr> 
                
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">����½IP</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="lastIP" runat="server"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_base_00015',this)">����</span></td>
        </tr> 
                
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px"><div align="right">����Ƶ��</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="TxtSite" runat="server"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_userinfo_base_00016',this)">����</span></td>
        </tr> 
                

        
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px; height: 28px;">&nbsp;</td>
          <td class="list_link" style="height: 28px">&nbsp;<asp:Button ID="sumbitsave" runat="server" CssClass="form" Text=" ȷ �� "  OnClick="submitSave" />
            <input name="reset" type="reset" value=" �� �� "  class="form"><asp:HiddenField ID="userID" runat="server" />
              ˵��������ǰ̨��Ա�ǲ������޸ĵ�         </td>
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
 <script type="text/javascript" language="javascript">
    function getFormInfo(obj,value)
    {
       alert(value);
       document.obj.CertType.value=value;
    }

</script>