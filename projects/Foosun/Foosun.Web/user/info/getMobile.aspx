<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" Inherits="user_info_getMobile" Codebehind="getMobile.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<title><%Response.Write(Foosun.Config.UIConfig.HeadTitle); %>__�����ֻ�</title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat = "Server">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%" height="32" class="sysmain_navi"  style="PADDING-LEFT: 14px" >�����ֻ�</td>
          <td width="43%" height="32" class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="userinfo.aspx" class="list_link">�ҵ�����</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�����ֻ�</div></td>
        </tr>
        </table>
       <div align="center" id="getmobileDiv" runat="server">
        <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px">
            �����ֻ�/С��ͨ </td>  
          <td class="list_link" align="left"><asp:TextBox ID="Mobile" MaxLength="15" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="f_Mobile" runat="server" ControlToValidate="Mobile" Display="Dynamic" ErrorMessage="<span class='reshow'>���������ֻ�/С��ͨ����</span>"></asp:RequiredFieldValidator><asp:CheckBox onclick="showDU();" ID="bindTF" Text="�����ֻ�/С��ͨ" runat="server" />
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_bMobile_001',this)">����</span></td>
          </tr>          
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"></td> 
          <td class="list_link" align="left">
             <asp:Button ID="Button1" runat="server" CssClass="form" Text="��ʼ����" OnClick="Button1_Click" OnClientClick="{if(confirm('ȷ��Ҫ������')){return true;}return false;}" />
          </td>
          </tr>
      </table>
      </div>
      <div align="center" id="bindCode" runat="server">
        <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px">
            ��������ֻ�����Ϊ </td>  
          <td class="list_link" align="left">
          <label id="_tmpMobile" runat="server" />
          </td>
          </tr>          
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px">
            �������յ�����֤�� </td>  
          <td class="list_link" align="left">
          <asp:TextBox ID="bindCodeNum" MaxLength="20" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="f_bindCodeNum" runat="server" ControlToValidate="bindCodeNum" Display="Dynamic" ErrorMessage="<span class='reshow'>���������ֻ�/С��ͨ�յ�����֤��</span>"></asp:RequiredFieldValidator>
          <asp:HiddenField ID="BindMobile" runat="server" />
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_bMobile_002',this)">����</span></td>
          </tr>          
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"></td> 
          <td class="list_link" align="left">
          <asp:Button ID="Button2" runat="server" CssClass="form" Text="��һ��" OnClientClick="{if(confirm('ȷ��Ҫ������')){return true;}return false;}" OnClick="Button1_Click_bindSave" />
          </td>
          </tr>
      </table> 
     </div>
      <table width="98%" id="showContents" style="display:none;" border="0" align="center" cellpadding="3" cellspacing="1" class="table">
        <tr class="TR_BG">
          <td style="PADDING-LEFT: 14px;height:30px;" class="sys_topBg"><label id="Label1" class="reshow" runat="server" />�����ֻ�/С��ͨ��Լ</td>
        </tr>
        <tr class="TR_BG_list">
          <td style="PADDING-LEFT: 14px;height:30px;"><div style="padding-top:8px;" id="showContents_div" runat="server" /></td>
        </tr>
      </table> 
     
    </form>
    
      <br />
      <br />
      <br />
     <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
       <tr>
         <td align="center"><label id="copyright" runat="server" /></td>
       </tr>
     </table>   </body>
</html>
<script type="text/javascript" language="javascript">
function showDU()
{
    if(document.getElementById("bindTF").checked)
    {
        document.getElementById("showContents").style.display="";
    }
    else
    {
        document.getElementById("showContents").style.display="none";
    }
    
}

</script>