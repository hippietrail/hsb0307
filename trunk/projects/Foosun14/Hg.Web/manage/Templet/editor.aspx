<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_Templet_editor"  ResponseEncoding="utf-8" Codebehind="editor.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title></title>
    <link href="../../sysImages/<%Response.Write(Hg.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
</head>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<script type="text/javascript" src="../../editor/Templet_editor.js"></script>
<body>
<form id="fromeditor" runat="server">
  <table width="100%" border="0" cellpadding="0" cellspacing="0"  class="toptable">
    <tr>
      <td width="57%" class="sysmain_navi"  style="PADDING-LEFT: 14px" Height="30">���߱༭</td>
      <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="Manage_List.aspx" class="list_link">ģ�����</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />���߱༭<asp:TextBox ID="FilePath"
            runat="server" Visible="False"></asp:TextBox></div></td>
    </tr>
  </table>

<table width="98%" align="center" cellpadding="5" cellspacing="1" class="table">
  <tr class="TR_BG_list">
    <td class="TR_BG_list"><div>
        <span id="adress"></span>
        <span class="reshow">����ҳ���ǩ��</span><asp:DropDownList ID="LabelList1" runat="server">
        <asp:ListItem Value="">=��ҳ���ǩ=</asp:ListItem>
        <asp:ListItem Value="{#Page_Title}">ҳ�����</asp:ListItem>
        <asp:ListItem Value="{#Page_MetaKey}">meta�ؼ���</asp:ListItem>
        <asp:ListItem Value="{#Page_MetaDesc}">meta����</asp:ListItem>
        <asp:ListItem Value="{#Page_Split}">���ݷ�ҳ</asp:ListItem>
        <asp:ListItem Value="{#Page_Content}">����</asp:ListItem>
        <asp:ListItem Value="{#Page_Navi}">����</asp:ListItem>
        </asp:DropDownList>
        <input id="Button2" style="width:35px;" type="button" value="����" onclick="javascript:getValue(document.fromeditor.LabelList1.value);" />
        <asp:DropDownList ID="history" runat="server">
        <asp:ListItem Value="">=�鵵ҳ���ǩ=</asp:ListItem>
        <asp:ListItem Value="{#history_list}">�б�</asp:ListItem>
        <asp:ListItem Value="{#history_PageTitle}">ҳ�����</asp:ListItem>
        </asp:DropDownList>
        <input id="Button4" style="width:35px;" type="button" value="����" onclick="javascript:getValue(document.fromeditor.history.value);" />
        <asp:DropDownList ID="Search1" runat="server">
        <asp:ListItem Value="">=����ҳ���ǩ=</asp:ListItem>
        <asp:ListItem Value="{#Page_SearchContent}">�б�(����/����)</asp:ListItem>
        <asp:ListItem Value="{#Page_SearchPages}">��ҳ</asp:ListItem>
        </asp:DropDownList>
        <input id="Button5" style="width:35px;" type="button" value="����" onclick="javascript:getValue(document.fromeditor.Search1.value);" />
        <asp:DropDownList ID="Comm1" runat="server">
        <asp:ListItem Value="">=����ҳ���ǩ=</asp:ListItem>
        <asp:ListItem Value="{#Page_CommTitle}">��������[ͨ��]</asp:ListItem>
        <asp:ListItem Value="{#Page_CommPages}">��ҳ[ͨ��]</asp:ListItem>
        <asp:ListItem Value="{#Page_Commidea}">��ʾ�۵�ͳ��[ͨ��]</asp:ListItem>
        <asp:ListItem Value="{#Page_CommStat}">��������ͳ��[ͨ��]</asp:ListItem>
        <asp:ListItem Value="{#Page_PageTitle}">����ҳ�����[���۶����б�]</asp:ListItem>
        <asp:ListItem Value="{#Page_PostComm}">��������[���۶����б�]</asp:ListItem>
        <asp:ListItem Value="{#Page_NewsURL}">��������[���۶����б�]</asp:ListItem>
        </asp:DropDownList>
        <input id="Button6" style="width:35px;" type="button" value="����" onclick="javascript:getValue(document.fromeditor.Comm1.value);" />
        <div style="height:6px;border-bottom:1px #999999 dotted;"></div>
        <div style="padding-top:5px;padding-bottom:5px;">
        <asp:DropDownList ID="LabelList" runat="server" Width="180px">
        </asp:DropDownList>
        <input id="sbutton1" style="width:35px;" type="button" value="����" onclick="javascript:getValue(document.fromeditor.LabelList.value);" />
        <input id="sbutton2" style="width:100px;" type="button" value="ϵͳ��ǩ(����)" onclick="javascript:show('Label1',document.getElementById('adress'),'ϵͳ��ǩ�б�(���ѡ��)',600,380);" />
        <input id="sbutton3" style="width:150px;" type="button" value="��̬��ǩ(����)" onclick="javascript:show('Labelm',document.getElementById('adress'),'��̬��Ŀ/ר���ǩ(����)�б�(���ѡ��)',600,380);" />
        <input id="sbutton4" style="width:80px;color:Red;" type="button" value="�Զ����ǩ" onclick="javascript:show('Label',document.getElementById('adress'),'�Զ����ǩ�б�(���ѡ��)',600,380);" />
        <input id="sbutton5" style="width:100px;" type="button" value="���ɱ�ǩ" onclick="javascript:show('freeLabel',document.getElementById('adress'),'���ɱ�ǩ�б�(���ѡ��)',600,380);" />
        <input id="Button3" style="width:100px;color:Blue;" type="button" value="Ƶ����ǩ" onclick="javascript:show('ChannelLabel',document.getElementById('adress'),'Ƶ����ǩ(���ѡ��)',600,380);" />
        </div>
        </div>
        <input type="button" name="Submit" style="border:1px dotted #999999;padding:2px 0 0 0;background-color:#eeeeee;" runat="server" value="����ģ��" id="Button7" onserverclick="Button1_ServerClick" />	
        <input type="button" name="Submit" value=" �� �� "  style="border:1px dotted #999999;padding:2px 0 0 0;background-color:#eeeeee;" onclick="javascript:UnDo();" />                
	    <span>���ű༭��&nbsp;&nbsp;<a href="javascript:ZoonEdit('400')" class="list_link" style="text-decoration:underline;">ԭʼ</a>&nbsp;&nbsp;<a class="list_link" style="text-decoration:underline;" href="javascript:ZoonEdit('600')">��</a>&nbsp;&nbsp;<a class="list_link" style="text-decoration:underline;" href="javascript:ZoonEdit('800')">��</a></span>&nbsp;&nbsp;
        <span id="dirPath" runat="server" />
     
    </td>
  </tr>
  <tr class="TR_BG_list">
    <td class="list_link" id="EditSizeID" style="height:400px;padding-top:0;padding-left:0;padding-right:0;padding-bottom:0;">
        <script type="text/javascript" language="JavaScript">
        window.onload = function()
	        {
	        var sBasePath = "../../editor/"
            var oFCKeditor = new FCKeditor('ContentTextBox') ;
            oFCKeditor.BasePath	= sBasePath ;
            oFCKeditor.Width = '100%' ;
            oFCKeditor.ToolbarSet = 'Foosun_Templet';
            oFCKeditor.Height = '100%' ;	
            oFCKeditor.ReplaceTextarea() ;
            }
        </script>
		<textarea rows="1" cols="1" name="ContentTextBox" style="display:none" id="ContentTextBox" runat="server" ></textarea>
                    
     </td>
  </tr>
  <tr class="TR_BG_list">
  <td>
     վ��Ŀ¼��{$InstallDir}&nbsp;&nbsp;&nbsp;ģ��·����{@dirTemplet} ������ֱ����ģ���в���˱�ǩ�������ͼƬ��CSS��Ŀ¼.<br />
     �Զ����ǩ��ʽ��{FS_xx}<br />
     (����)ϵͳ��ǩ��{FS_S_xx}<br />
     (����)��̬��Ŀ��ǩ��{FS_Class*_xx}(����������)��{FS_Class*C_xx}(��������)��xxΪ��Ŀ��ClassID <br />
     (����)��̬ר���ǩ��{FS_Special*_xx}��xxΪר���SpecialID<br />
     ���ɱ�ǩ��{FS_FREE_xx}
     <div class="reshow">�ر�ע�⣺��ǩ�ϸ����ִ�Сд</div>
  </td>
  </tr>
  <tr class="TR_BG_list">
    <td class="list_link">
     <input type="button" name="Submit" runat="server" value="����ģ��" id="Button1" onserverclick="Button1_ServerClick" />
	<input type="button" name="Submit" value=" �� �� " onclick="javascript:UnDo();" />
	&nbsp;&nbsp;<a style="color:Red;" onClick="{if(confirm('ȷ��Ҫ�л����ı��༭��?�����л�ǰ�ȱ����������ݣ�����ᶪʧ!\nȷ���л���')){return true;}return false;}" href="Txteditor.aspx?dir=<%Response.Write(dir); %>&filename=<%Response.Write(filename); %>">�л����ı��༭��</a>
</td>
  </tr>
  </table>
  <br />
  <br />
   <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px" align="center">
   <tr>
     <td align="center"><label id="copyright" runat="server" /></td>
   </tr>
</table>
</form>
</body>
<script language="javascript" type="text/javascript">
function UnDo()
{
    if(confirm('��ȷ��Ҫȡ�������ĸ�����?'))
    {
        document.fromeditor.reset();
    }   
}
function getValue(value)
{
    if(value!="")
    {
        var oEditor = FCKeditorAPI.GetInstance("ContentTextBox");
        if (oEditor.EditMode==FCK_EDITMODE_WYSIWYG)
        {
           oEditor.InsertHtml(value);
        }else
        {
        return false;
        }
    }
}

function ZoonEdit(obj)
{
   document.getElementById('EditSizeID').style.height=obj+'px';
}  
</script>
</html>