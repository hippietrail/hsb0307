<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_label_style_add" ResponseEncoding="utf-8" Codebehind="style_add.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<script type="text/javascript" src="../../editor/fckeditor.js"></script>
</head>
<body>
    <form id="Form_Style" runat="server">
      <table width="100%" border="0" cellpadding="0" cellspacing="0"  class="toptable">
        <tr>
          <td width="57%" class="sysmain_navi"  style="PADDING-LEFT: 14px" height="30">�����ʽ</td>
          <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="style.aspx" class="list_link">��ʽ����</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�����ʽ</div></td>
        </tr>
      </table>     
      
       <table border="0" cellpadding="5" cellspacing="1" class="Navitable" style="width: 100%">
    <tr class="TR_BG_list">
    <td style="padding-left:14px;">
      <span style="cursor:pointer;width:100px;" id="TD_putongstyle"  onclick="javascript:ChangeDiv('putongstyle')">��ͨ��ʽ</span>&nbsp;�� &nbsp;
      <span style="cursor:pointer;width:100px;" id="TD_denglustyle" onclick="javascript:ChangeDiv('denglustyle')">��½��ʽ</span>
    </td>
    </tr>
    </table> 
  <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 13%">��ʽ����</td>
      <td width="90%" align="left"><asp:TextBox CssClass="form" ID="styleName" runat="server" width="195px" MaxLength="30"></asp:TextBox>
          <asp:DropDownList CssClass="form" ID="styleClass" runat="server" width="195px">
          </asp:DropDownList><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_styleadd_001',this)">����</span><span><asp:RequiredFieldValidator ID="RequirestyleName" runat="server" ControlToValidate="styleName" Display="Dynamic" ErrorMessage="<span class=reshow>(*)����д��ʽ����</spna>"></asp:RequiredFieldValidator></span><span></span>
        </td>
    </tr>
    <tr class="TR_BG_list" id="TR_putongstyle">
      <td align="center" class="navi_link" style="width: 13%">��������<label id="picContentTF"></label></td>
      <td width="90%" align="left" >
          <label id="style_base" runat="server" />
          <label id="style_class" runat="server" />
          <label id="style_special" runat="server" />                 
          <asp:DropDownList CssClass="form" ID="define" runat="server" width="150px" onchange="javascript:setValue(this.value);">
          <asp:ListItem Value="">�Զ����ֶ�</asp:ListItem>
          </asp:DropDownList>  
          <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_styleadd_002',this)">����</span></td>
       
    </tr>   
    <tr class="TR_BG_list" id="TR_denglustyle" style="display:none;">
      <td align="center" class="navi_link" style="width: 13%">��������<label id="Label1"></label></td>
      <td width="90%" align="left" >               
          <asp:DropDownList CssClass="form" ID="dengluqian" runat="server" width="150px" onchange="javascript:getValue(this.value);">
          <asp:ListItem Value="">ѡ���½ǰ��ʾ�ֶ�</asp:ListItem>
          <asp:ListItem Value="{#Login_Name}">�û��������(��ѡ)</asp:ListItem>
          <asp:ListItem Value="{#Login_Password}">���������(��ѡ)</asp:ListItem>
          <asp:ListItem Value="{#Login_Submit}">��½�ύ��ť(��ѡ)</asp:ListItem>
          <asp:ListItem Value="{#Login_Reset}">��½ȡ����ť</asp:ListItem>
          <asp:ListItem Value="{#Reg_LinkUrl}">ע�����û�����</asp:ListItem>
          <asp:ListItem Value="{#Get_PassLink}">ȡ����������</asp:ListItem>
          <asp:ListItem Value="{#Reg_LinkUrlAdr}">ע�����û���ַ</asp:ListItem>
          <asp:ListItem Value="{#Get_PassLinkAdr}">ȡ�������ַ</asp:ListItem>
          </asp:DropDownList>��
          <asp:DropDownList CssClass="form" ID="dengluhou" runat="server" width="150px" onchange="javascript:getValue(this.value);">
          <asp:ListItem Value="">ѡ���½����ʾ�ֶ�</asp:ListItem>
          <asp:ListItem Value="{#User_Name}">��Ա����</asp:ListItem>
          <asp:ListItem Value="{#User_HomePage}">��Ա��ҳ</asp:ListItem>
          <asp:ListItem Value="{#User_DiscussGroup}">����������</asp:ListItem>
          <asp:ListItem Value="{#User_AdminCenter}">�����������</asp:ListItem>
          <asp:ListItem Value="{#User_logout}">�˳�����</asp:ListItem>
          <asp:ListItem Value="{#User_HomePageAdr}">��Ա��ҳ��ַ</asp:ListItem>
          <asp:ListItem Value="{#User_DiscussGroupAdr}">�������ַ</asp:ListItem>
          <asp:ListItem Value="{#User_AdminCenterAdr}">��������ַ</asp:ListItem>
          <asp:ListItem Value="{#User_logoutAdr}">�˳���ַ</asp:ListItem>
          </asp:DropDownList>
          <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_styleadd_002',this)">����</span><br /><span style="color:Red">���ڴ˴�����html����������ʾ��ʽ����������ڱ�ǩ����;��½��ʽ����ʾ��ʽ��"$*$"�ָ�����½��ʽ $*$ ��ʾ��ʽ�������������ʾ����</span></td>
       
    </tr>   
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 13%">��ʽ����
      <div style="margin-top:10px;"><a style="cursor:pointer;" onclick="selectFile('picEdit',document.getElementById('picContentTF'),320,500);" title="���ϴ���ʱ�����ڱ༭�������������Ҫ�ϴ�ͼƬ��λ�á�"><font color="blue">ѡ��ͼƬ</font></a></div>
      </td>
      <td width="90%" align="left" >
        <script type="text/javascript" language="JavaScript">
        window.onload = function()
            {
            var sBasePath = "../../editor/"
            var oFCKeditor = new FCKeditor('ContentTextBox') ;
            oFCKeditor.BasePath	= sBasePath ;
            oFCKeditor.Width = '100%' ;
            oFCKeditor.ToolbarSet = 'Foosun_style';
            oFCKeditor.Height = '250px' ;	
            oFCKeditor.ReplaceTextarea() ;
            }
        </script>
      <textarea rows="1" cols="1" name="ContentTextBox" runat="server" style="display:none" id="ContentTextBox" ></textarea>
      </td>
    </tr>
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 13%">��ʽ����</td>
      <td width="90%" align="left">
          <asp:TextBox ID="Description" runat="server" Height="50px" TextMode="MultiLine" width="400px" MaxLength="200"></asp:TextBox><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_styleadd_003',this)">����</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td class="navi_link" style="width:10%;text-align:center;" colspan="2"><label>
        <asp:Button ID="Button1" runat="server" Text="����" OnClick="Button1_Click" />
        </label>
        <label>
        <input type="reset" name="UnDo" value="����" />
        </label></td>
    </tr>    
    </table>      
     
      <br />
      <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px" align="center">
        <tr>
          <td align="center"><label id="copyright" runat="server" /></td>
        </tr>
      </table>
    </form>
</body>
</html>
<script language="javascript" type="text/javascript">

	function ChangeDiv(ID)
	{
		document.getElementById("TD_putongstyle").className='';
		document.getElementById('TD_denglustyle').className='';
		document.getElementById('TD_'+ID).className='reshow';

		document.getElementById("TR_putongstyle").style.display="none";
		document.getElementById("TR_denglustyle").style.display="none";
		document.getElementById("TR_"+ID).style.display="";
	}
	
function insertHTMLEdit(url)
{
    var urls = url.replace('{@dirfile}','<% Response.Write(Foosun.Config.UIConfig.dirFile); %>')
    var oEditor = FCKeditorAPI.GetInstance("ContentTextBox");
    if (oEditor.EditMode==FCK_EDITMODE_WYSIWYG)
    {
       oEditor.InsertHtml('<img src=\"'+urls+'\" border=\"0\" />');
    }
    else
    {
        return false;
    }
    return;
}

function getValue(value)
{
    var oEditor = FCKeditorAPI.GetInstance("ContentTextBox");
    if (oEditor.EditMode==FCK_EDITMODE_WYSIWYG)
    {
       oEditor.InsertHtml(value);
    }
    else
    {
    return false;
    }
}
function setValue(value)
{
    var oEditor = FCKeditorAPI.GetInstance("ContentTextBox");
    if (oEditor.EditMode==FCK_EDITMODE_WYSIWYG)
    {
       oEditor.InsertHtml('{#FS:define='+value+'}');
    }
    else
    {
    return false;
    }
}
</script>
