<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_label_syslabel_edit" ResponseEncoding="utf-8" Codebehind="syslabel_edit.aspx.cs" %>
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
    <form id="form1" runat="server">
      <table width="100%" border="0" cellpadding="0" cellspacing="0"  class="toptable">
        <tr>
          <td width="57%" class="sysmain_navi"  style="PADDING-LEFT: 14px" Height="30"><span id="adress"></span>�޸ı�ǩ</td>
          <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="SysLabel_List.aspx" class="list_link">��ǩ����</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�޸ı�ǩ</div></td>
        </tr>
      </table>
      
  <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 13%">��ǩ����</td>
      <td Width="90%" align="left"><span style="font-weight:bold;color:Red">{FS_</span><asp:TextBox ID="LabelName" runat="server" Width="100px" MaxLength="30"></asp:TextBox><span style="font-weight:bold;color:Red">}&nbsp;</span>
          <asp:DropDownList ID="LabelClass" runat="server" Width="195px">
          </asp:DropDownList><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_Labeladd_001',this)">����</span><span><asp:RequiredFieldValidator ID="RequireLabelName" runat="server" ControlToValidate="LabelName" Display="Dynamic" ErrorMessage="<span class=reshow>(*)����д��ǩ����</spna>"></asp:RequiredFieldValidator></span><span><asp:RequiredFieldValidator ID="RequiredFieldLabel" runat="server" ControlToValidate="LabelClass" Display="Dynamic" ErrorMessage="<span class=reshow>(*)��ѡ�����</spna>"></asp:RequiredFieldValidator></span>
           <span style="color:Red">ע�⣺��ǩ���Ƽ���ǩ�����ϸ����ִ�Сд��</span>
        </td>
    </tr>
    <tr class="TR_BG_list" id="Tr_Content">
      <td align="center" class="navi_link" style="width: 13%">��������</td>
      <td Width="90%" align="left" >
      <a href="javascript:show('List',document.getElementById('adress'),'ѡ���ǩ����(�б���(��))',700,420);"  class="list_link" title="�������¡��Ƽ����ȵ㡢ͷ����������ר�⡢���桢����">�б���</a> &nbsp; 
      <a href="javascript:show('Ultimate',document.getElementById('adress'),'ѡ���ǩ����(�ռ���)',700,420);" class="list_link" title="���������ռ���ר���ռ�">�ռ���</a> &nbsp;  
      <a href="javascript:show('Browse',document.getElementById('adress'),'ѡ���ǩ����(�����)',700,420);" class="list_link" >�����</a> &nbsp;  
      <a href="javascript:show('Routine',document.getElementById('adress'),'ѡ���ǩ����(������/�߼���չ)',700,430);" class="list_link" title="����SUB���ࡢ���������š�λ�õ�����������ͳ�ơ��õ�Ƭ��վ���ͼ��ͼƬͷ����������š��鵵����վ��������Ŀ������ר�⵼����RSS����Ŀ���á�������Ŀ��Ϣ(�ؼ��֡�meta)���Զ���ҳ�桢�������С���������">����&��չ��</a> &nbsp;  
      <a href="javascript:show('Member',document.getElementById('adress'),'ѡ���ǩ����(��Ա��)',700,420);" class="list_link" title="�����û���½���û����С�����ע���û���Ͷ���ǩ��������">��Ա��</a> &nbsp;  
      <a href="javascript:show('Other',document.getElementById('adress'),'ѡ���ǩ����(������)',700,300);" class="list_link" title="��������JS��ϵͳJS�����JS��ͳ��JS������JS����������">������</a> &nbsp;  
      <a style="display:none;" href="javascript:show('API',document.getElementById('adress'),'ѡ���ǩ����(API��)',700,340);" class="list_link">API��</a></td>
    </tr>    
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 13%">��ǩ����</td>
      <td Width="90%" align="left" ><!--�༭����ʼ-->
        <script type="text/javascript" language="JavaScript">
        window.onload = function()
            {
            var sBasePath = "../../editor/"
            var oFCKeditor = new FCKeditor('ContentTextBox') ;
            oFCKeditor.BasePath	= sBasePath ;
            oFCKeditor.Width = '100%' ;
            oFCKeditor.ToolbarSet = 'Foosun_style';
            oFCKeditor.Height = '300px' ;	
            oFCKeditor.ReplaceTextarea() ;
            }
        </script>
		<textarea rows="1" cols="1" name="ContentTextBox" style="display:none" id="ContentTextBox" runat="server" ></textarea>
      </td>
    </tr>
    <tr class="TR_BG_list" id="Tr_LabelBack">
      <td align="center" class="navi_link" style="width: 13%">���뱸�ݿ�</td>
      <td Width="90%" align="left" >
          <asp:RadioButtonList ID="LabelBack" runat="server" RepeatDirection="Horizontal"
              RepeatLayout="Flow" Width="200px">
              <asp:ListItem Value="1">��</asp:ListItem>
              <asp:ListItem Value="0" Selected="true">��</asp:ListItem>
          </asp:RadioButtonList></td>
    </tr>    
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 13%">��ǩ����</td>
      <td Width="90%" align="left">
          <asp:TextBox ID="LabelDescription" runat="server" Height="50px" TextMode="MultiLine" Width="400px" MaxLength="200"></asp:TextBox><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_Labeladd_003',this)">����</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="left" class="navi_link" style="width: 10%;text-align:center;" colspan="2"><label>
        <asp:Button ID="Button1" runat="server" Text=" �� �� " CssClass="form" OnClick="Button1_Click" />
        </label>
        <label>
        <input type="reset" name="UnDo" value=" �� �� " class="form" />
            <asp:HiddenField ID="LabelID" runat="server" />
        </label></td>
    </tr>    
    </table>      

      <br />
     <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
      <tr>
        <td align="center"><%Response.Write(CopyRight);%></td>
      </tr>
    </table>
  </form>
</body>
</html>
<script language="javascript" type="text/jscript">
function getValue(value)
{
    var oEditor = FCKeditorAPI.GetInstance("ContentTextBox");
    if (oEditor.EditMode==FCK_EDITMODE_WYSIWYG)
    {
       oEditor.InsertHtml(value);
    }else
    {
    return false;
    }
       document.getElementById("LabelDivid").style.display="none";
 
}
</script>
<% showJs(); %>
