<%@ Page Language="C#" ContentType="text/html" AutoEventWireup="true" Inherits="user_Constr_up" Debug="true" Codebehind="Constr_up.aspx.cs" %>
<%@ Register Src="../../controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<%@ Import NameSpace="System.Data"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>	
<script type="text/javascript" src="../../editor/fckeditor.js"></script>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
</head>
<body onload="DispChange('<%= ConstrTF %>')"><form id="form1" name="form1" method="post" action="" runat="server"> 
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
    <tr>
      <td height="1" colspan="2"></td>
    </tr>
    <tr>
      <td width="57%"  class="sysmain_navi"  style="PADDING-LEFT: 14px" >���¹���</td>
      <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="Constrlist.aspx" class="menulist">���¹���</a></div>
      </td>
    </tr>
</table>
      <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
        <tr>
          <td style="padding-left:14px;">          
          <a href="Constr.aspx" class="menulist">��������</a>&nbsp; &nbsp;<a href="Constrlistpass.aspx" class="topnavichar" >�����˸�</a>&nbsp; &nbsp;<a href="Constrlist.aspx" class="menulist">���¹���</a>&nbsp; &nbsp;<a href="ConstrClass.aspx" class="menulist">�������</a>&nbsp; &nbsp;<a href="Constraccount.aspx" class="menulist">�˺Ź���</a>
          </td>
        </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <tr class="TR_BG_list">
    <td class="list_link" style="text-align: right; width: 110px;">
        �������ƣ�</td>
      <td class="list_link" colspan="5">
        <asp:TextBox ID="Title" runat="server" Width="325px" CssClass="form" MaxLength="100"></asp:TextBox>
        <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_Constr_0001',this)">����</span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Title" ErrorMessage="�������������"></asp:RequiredFieldValidator>
      </td>   
  </tr>
  <tr class="TR_BG_list">
    <td class="list_link" style="text-align: right; width: 110px;">
        �������ݣ�</td>
      <td class="list_link" colspan="5" style="width: 750px;height:250px;">
        <script type="text/javascript" language="JavaScript">
             window.onload = function()
	        {
	        var sBasePath = "../../editor/"
            var oFCKeditor = new FCKeditor('Contentbox') ;
            oFCKeditor.BasePath	= sBasePath ;
            oFCKeditor.ToolbarSet = 'Foosun_User';
            oFCKeditor.Width = '100%' ;
            oFCKeditor.Height = '350' ;	
            oFCKeditor.ReplaceTextarea() ;
            }
        </script>
		<textarea rows="1" cols="1" name="Contentbox" style="display:none" id="Contentbox" runat="server" ></textarea>
      </td>
  </tr>
    <tr class="TR_BG_list">
    <td class="list_link" style="text-align: right; width: 110px;"> �� �ߣ�</td>
        <td class="list_link" colspan="5">
            <asp:TextBox ID="Author" runat="server"  CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_Constr_0003',this)">����</span> &nbsp; &nbsp; &nbsp; �� �� �֣�<asp:TextBox ID="Tags" runat="server"  CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_Constr_0019',this)">����</span> &nbsp; &nbsp; &nbsp; �� �ͣ�<asp:DropDownList ID="lxList1" runat="server" Width="146px" CssClass="form">
            <asp:ListItem>ԭ��</asp:ListItem>
            <asp:ListItem>ת��</asp:ListItem>
            <asp:ListItem>����</asp:ListItem>
        </asp:DropDownList>
        <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_Constr_0008',this)">����</span>
        </td>
  </tr>
      <tr class="TR_BG_list">
    <td class="list_link" style="text-align: right; width: 110px;"> 
                          ��Ϣ����</td>
          <td class="list_link" colspan="5" valign="top"><table border="0" cellpadding="0" cellspacing="0" Width="100%" height="100%">
                  <tr>
                      <td Width="7%">
        <asp:RadioButtonList ID="inList1" runat="server" RepeatDirection="Horizontal"
            Width="192px">
            <asp:ListItem Selected="True" Value="0">��ͨ</asp:ListItem>
            <asp:ListItem Value="1">����</asp:ListItem>
            <asp:ListItem Value="2">�Ӽ�</asp:ListItem>
        </asp:RadioButtonList></td>
                      <td Width="18%" style="text-align: right;display:;" id="site1">
                          Ͷ�嵽��վ��</td>
                      <td Width="75%" style="display:;" id="site2">
        <asp:RadioButtonList ID="fbList1" runat="server" RepeatDirection="Horizontal" Width="103px">
            <asp:ListItem Value="1">��</asp:ListItem>
            <asp:ListItem Value="0">��</asp:ListItem>
        </asp:RadioButtonList></td>
                  </tr>
              </table>
          </td>
  </tr>
   <tr class="TR_BG_list">
    <td class="list_link" style="text-align: right; width: 110px;">Ƶ�����ࣺ</td>
       <td class="list_link" colspan="5">
        &nbsp;<asp:DropDownList ID="site" runat="server" Width="147px" CssClass="form" Enabled="false"></asp:DropDownList>
        <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_Constr_0005',this)">����</span>
           &nbsp; &nbsp; &nbsp; ���·��ࣺ<asp:DropDownList ID="ConstrClass" runat="server" Width="146px" CssClass="form"></asp:DropDownList>
        <span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_Constr_0006',this)">����</span>
       </td>
  </tr>
   <tr class="TR_BG_list">
    <td class="list_link" style="text-align: right; width: 110px;">�� ����</td>
       <td class="list_link" colspan="5" valign="top"><table border="0" cellpadding="0" cellspacing="0"  Width="100%" height="100%">
               <tr>
                   <td style="width: 3%">
        <asp:RadioButtonList ID="Locking" runat="server" RepeatDirection="Horizontal" Width="93px">
            <asp:ListItem Value="1">��</asp:ListItem>
            <asp:ListItem Value="0">��</asp:ListItem>
        </asp:RadioButtonList></td>
                   <td style="text-align: right; width: 15%;">
                       �� ����</td>
                   <td Width="92%">
                       <asp:RadioButtonList ID="Recommendation" runat="server" RepeatDirection="Horizontal" Width="94px">
                            <asp:ListItem Value="1">��</asp:ListItem>
                            <asp:ListItem Value="0">��</asp:ListItem>
                        </asp:RadioButtonList></td>
               </tr>
           </table>
       </td>
  </tr>
   <tr class="TR_BG_list">
    <td class="list_link" style="height: 32px; text-align: right; width: 110px;">ͼ Ƭ��</td>
       <td class="list_link" colspan="5">
           <asp:TextBox ID="photo" runat="server" Width="265px"  CssClass="form"></asp:TextBox>
         <input  class="form" type="button" value="ѡ��ͼƬ"  onclick="selectFile('user_pic',document.form1.photo,400,500);document.form1.photo.focus();" /><span class="helpstyle" style="cursor:help;" title="����鿴����" onClick="Help('H_Constr_0011',this)">����</span> 
       </td>
  </tr>
   <tr class="TR_BG_list">
    <td class="list_link" style="text-align: right; width: 110px;"></td>
       <td class="list_link" colspan="5">
        &nbsp;<asp:Button ID="Button1" runat="server" CssClass="form" Text="�� ��" OnClick="Button1_Click" />
           &nbsp; &nbsp;&nbsp; &nbsp;<input type="reset" name="Submit3" value="�� ��" class="form"></td>
  </tr>
 
</table>
<br />
<br />
<table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
  <tr>
    <td><div align="center"><%Response.Write(Foosun.Config.UIConfig.HeadTitle); %> </div></td>
  </tr>
</table>
</form>
</body>
</html>
<script language="javascript">
function DispChange(contf)
{
    if(contf =="1")
    {
            document.getElementById("site1").style.display="";
            document.getElementById("site2").style.display="";
    }
}
</script>