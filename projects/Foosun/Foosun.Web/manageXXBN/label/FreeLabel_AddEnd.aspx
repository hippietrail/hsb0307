<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_label_FreeLabel_AddEnd" Codebehind="FreeLabel_AddEnd.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/css.css"
    rel="stylesheet" type="text/css" />
<style type="text/css">
p{padding-left:20px;padding-top:0px;padding-bottom:0px;margin-top:3px;margin-bottom:0px;}
</style>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<script type="text/javascript" src="../../editor/fckeditor.js"></script>
<script language="javascript" type="text/javascript">
<!--
function AddTag(val)
{
    var oEditor = FCKeditorAPI.GetInstance("EdtContent");
    var str = val.trim();
    if(str != '')
    {
        if (oEditor.EditMode==FCK_EDITMODE_WYSIWYG)
        {
             oEditor.InsertHtml(str);
        }
    }
}
function AddDate()
{
    var str = document.getElementById('TxtDateStyle').value.trim();
    if(str != '')
    {
        str = '[$'+ str +'$]'
        AddTag(str);
    }
}
//-->
</script>
</head>
<body>
    <form id="Form1" runat="server">
        <div>
            <table id="top1" width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
                <tr>
                    <td height="1" colspan="2">
                    </td>
                </tr>
                <tr>
                    <td width="57%" class="sysmain_navi" style="padding-left: 14px">
                        <asp:Label ID="LblCaption" runat="server" Text="������ɱ�ǩ"></asp:Label></td>
                    <td width="43%" class="topnavichar" style="padding-left: 14px">
                        <div align="left">
                            λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a
                                href="FreeLabel_List.aspx" target="sys_main" class="list_link">���ɱ�ǩ����</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><asp:Label
                                    ID="LblNavigt" runat="server" Text="������ɱ�ǩ"></asp:Label></div>
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
                <tr>
                    <td style="padding-left: 14px">
                        <a class="topnavichar" href="javascript:history.back();" id="PreSteps" runat="server">��һ��</a> <asp:LinkButton CssClass="topnavichar" ID="LnkBtnSave" runat="server" OnClick="LnkBtnSave_Click">����</asp:LinkButton>  <asp:LinkButton CssClass="topnavichar" ID="reviewBtn" runat="server" OnClick="reviewBtn_Click">Ԥ��</asp:LinkButton></td>
                </tr>
            </table>
            <div runat="server" id="review"></div>
            <table width="98%" cellpadding="5" cellspacing="1" align="center" class="table">
                <tr class="TR_BG_list">
                    <td align="right" width="15%">��ǩ���ƣ�</td>
                    <td width="85%">
                        <asp:TextBox runat="server" Width="200" ID="TxtLabelName" CssClass="form"></asp:TextBox>
                    </td>
                </tr>
                <tr class="TR_BG_list">
                    <td align="right">��ǩ˵����</td>
                    <td>
                        <asp:TextBox runat="server" Width="200" ID="TxtDescrpt" CssClass="form" TextMode="MultiLine" MaxLength="200"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        �Զ��壺</td>
                    <td>
                        <input type="button" value="ѭ������" onclick="javascript:AddTag('{# ��Ҫ�ӵ����� #}')" />  <input type="button" value="��ѭ������" onclick="javascript:AddTag('{*��¼��� ��Ҫ�ӵ����� *}')" />  <input type="button" value="����" onclick="javascript:AddTag('(#��������#)')" /></td>
                </tr>
                <tr class="TR_BG_list">
                    <td align="right">�����ֶΣ�</td>
                    <td>
                        <asp:DropDownList runat="server" ID="DdlField1" onchange="AddTag(this.options[this.selectedIndex].value)" >
                            <asp:ListItem Value="">��ѡ���ֶ�</asp:ListItem></asp:DropDownList> �� <asp:DropDownList runat="server" ID="DdlField2" onchange="AddTag(this.options[this.selectedIndex].value)" ><asp:ListItem Value="">��ѡ���ֶ�</asp:ListItem>
</asp:DropDownList>
                        <span style="color:Red">���ű�ź�������Ŀ��Ż��Զ��滻Ϊ����</span></td>
                </tr>
                <tr class="TR_BG_list">
                    <td align="right">������ʽ��</td>
                    <td>
                        <asp:TextBox runat="server" ID="TxtDateStyle" Text="YY02��MM��DD��" CssClass="form" MaxLength="200"></asp:TextBox> <input type="button" value=" ���� " onclick="AddDate()" />
                        <span style="color:Red">��Ҫѡ��ʱ���ֶΣ���ʽ��˵�� 2</span>
                    </td>
                </tr>
                <tr class="TR_BG_list">
                    <td align="right">��ǩ���ݣ�</td>
                    <td>
                        <span style="color:Red">��HTML�������ѡ���ֶΡ��Զ��庯����ɣ����������ѯ��¼����ʾ��ʽ</span>
                    </td>
                </tr>
                <tr class="TR_BG_list">
                    <td colspan="2">
                        <script type="text/javascript" language="JavaScript">
                        window.onload = function()
                            {
                            var sBasePath = "../../editor/"
                            var oFCKeditor = new FCKeditor('EdtContent') ;
                            oFCKeditor.BasePath	= sBasePath ;
                            oFCKeditor.Width = '100%' ;
                            oFCKeditor.ToolbarSet = 'Foosun_style';
                            oFCKeditor.Height = '200px' ;	
                            oFCKeditor.ReplaceTextarea() ;
                            }
                        </script>
                        <textarea rows="1" cols="1" name="EdtContent" style="display:none" id="EdtContent" runat="server" ></textarea>
                    </td>
                </tr>
            </table>
            <div style="color:Red">
            <p>˵����</p>
            <p>1.Ԥ�����ֶ���Ҫѡ����Զ�Ӧ��š����������·����Ҫѡ�����ű�ţ���Ŀ���·����Ҫѡ����Ŀ���(ע�⣺�����ű�ţ����Ǳ��)��</p>
            <p>2.���ڸ�ʽ:YY02����2λ�����(��06��ʾ2006��),YY04��ʾ4λ�������(2006)��MM�����£�DD�����գ�HH����Сʱ��MI����֣�SS�����롣</p>  
            <p>3.�Զ��庯����ѭ������{#...#}����ѭ������{*n...*}(n>0)�����¼��š�����(#...#)����(#Left([*FS_News.Title*],20)#) </p> 
            </div>
            <br />
            <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg"
                style="height: 76px">
                <tr>
                    <td align="center">
                        <%Response.Write(CopyRight);%>
                    </td>
                </tr>
            </table>
        </div>
         <asp:HiddenField ID="HidID" runat="server" />
         <asp:HiddenField ID="HidName" runat="server" />
         <asp:HiddenField ID="HidSQL" runat="server" />
    </form>
</body>
</html>

