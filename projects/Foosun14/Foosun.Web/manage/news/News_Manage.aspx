<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_news_News_Manage" Codebehind="News_Manage.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>

</head>
<body>
<form id="Form1" runat="server">
<div>
<table id="top1" width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%"  class="sysmain_navi"  style="PADDING-LEFT: 14px" >���Ź���</td>
          <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="javascript:history.back();" target="sys_main" class="list_link">���Ź���</a></div></td>
        </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
    <tr class="TR_BG_list">
        <td class="list_link" width="30%" valign="top">
            <table border="0" width="100%" cellpadding="1" cellspacing="1">
                <tr>
                    <td>
                        <asp:DropDownList ID="DdlType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DdlType_SelectedIndexChanged" Width="100%">
                            <asp:ListItem Value="0">ָ������</asp:ListItem>
                            <asp:ListItem Value="1">ָ����Ŀ</asp:ListItem>
                        </asp:DropDownList>
                     </td>
                </tr>
                <tr height="231">
                    <td>
                      <asp:ListBox ID="LstOriginal" runat="server" Width="100%" Height="231" SelectionMode="Multiple"></asp:ListBox>
                    </td>
                </tr>
            </table>
        </td>
	    <td class="list_link" width="10%" align="center">
            <asp:Label ID="LblNarrate" runat="server"/><asp:Label ID="LblIDs" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="LblNewsTable" runat="server" Visible="False"></asp:Label></td>
	    <td class="list_link" width="60%" valign="top">
	    <!--�ƶ����Ǹ���-->
            <asp:Panel ID="Panel1" runat="server">
                <table border="0" width="100%">
                    <tr>
                        <td>
                        </td>
                     </tr>
                     <tr>
                        <td>
                        </td>
                     </tr>
                     <tr>
                        <td><asp:ListBox ID="LstTarget" runat="server" Width="100%" Height="231"></asp:ListBox></td>
                     </tr>
                  </table>
            </asp:Panel>
            <!--������������-->
            <asp:Panel runat="server" ID="Panel2">
                <table border="0" width="100%">
                    <tr>
                        <td><asp:CheckBox
                            ID="CheckBox1" runat="server" /> Ĭ�ϰ������·�ʽȫ������<span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_News_Manage_001',this)">����</span>

				        </td>
		            </tr>
                    <tr>
                        <td>���ԣ�
                            <asp:CheckBox ID="NewsProperty_CommTF1" runat="server" />��������&nbsp;
                            <asp:CheckBox ID="NewsProperty_DiscussTF1" runat="server" />������������&nbsp;
                            <asp:CheckBox ID="NewsProperty_RECTF1" runat="server" />�Ƽ�&nbsp;
                            <asp:CheckBox ID="NewsProperty_MARTF1" runat="server" />����&nbsp;
                            <asp:CheckBox ID="NewsProperty_HOTTF1" runat="server" />�ȵ�&nbsp;
                            <asp:CheckBox ID="NewsProperty_FILTTF1" runat="server" />�õ�&nbsp;
                            <asp:CheckBox ID="NewsProperty_TTTF1"  runat="server" />ͷ��&nbsp;
                            <asp:CheckBox ID="NewsProperty_ANNTF1" runat="server" />����&nbsp;
                            <asp:CheckBox ID="NewsProperty_JCTF1" runat="server" />����&nbsp;
                            <asp:CheckBox ID="NewsProperty_WAPTF1" runat="server" />WAP&nbsp;
                            <asp:Button ID="Button9" runat="server" OnClick="pro_click" Text="��������" />
				        </td>
		            </tr>
		            <tr>
			            <td>ģ���壺
			                <asp:TextBox Width="40%" ID="Templet" runat="server" CssClass="form"/>
			                <img src="../../sysImages/folder/s.gif" alt="" border="0" style="cursor:pointer;" onclick="selectFile('templet',document.Form1.Templet,250,400);document.Form1.Templet.focus();" />
                            <asp:Button ID="Button2" runat="server" OnClick="templet_click" Text="����ģ��" /></td>
		            </tr>
		            <tr>
			            <td>Ȩ���أ�
			              <asp:DropDownList ID="OrderIDDropDownList" runat="server" CssClass="form">
                            <asp:ListItem Value="" Text="ѡ��Ȩ��" />
                            <asp:ListItem Value="10" Text="10" />
                            <asp:ListItem Value="9" Text="9" />
                            <asp:ListItem Value="8" Text="8" />
                            <asp:ListItem Value="7" Text="7" />
                            <asp:ListItem Value="6" Text="6" />
                            <asp:ListItem Value="5" Text="5" />
                            <asp:ListItem Value="4" Text="4" />
                            <asp:ListItem Value="3" Text="3" />
                            <asp:ListItem Value="2" Text="2" />
                            <asp:ListItem Value="1" Text="1" />
                            <asp:ListItem Value="0" Text="0"/>
                          </asp:DropDownList>
                            <asp:Button ID="Button3" runat="server" OnClick="order_click" Text="����Ȩ��" /></td>
		            </tr>   	
		            <tr>
			            <td>�����ۣ�
			                <asp:CheckBox ID="CommLinkTF" runat="server"/>
				            �������ʾ&quot;����&quot;����
                            <asp:Button ID="Button4" runat="server" OnClick="comm_click" Text="��������" /></td>
		            </tr>
		            <tr>
			            <td>�ꡡǩ��
			            <asp:TextBox ID="Tags" runat="server" MaxLength="100" Width="40%" CssClass="form"></asp:TextBox><img src="../../sysImages/folder/s.gif" alt="ѡ�����б�ǩ" border="0" style="cursor:pointer;" onclick="selectFile('Tag',document.Form1.Tags,220,480);document.Form1.Tags.focus();" />
                            <asp:Button ID="Button5" runat="server" OnClick="tag_click" Text="����TAG��ǩ" /></td>
		            </tr>
		            <tr>
			            <td>�������
			                <asp:TextBox ID="Click" Width="40%" runat="server" CssClass="form"/>
                            <asp:Button ID="Button6" runat="server" OnClick="click_click" Text="���õ��" /></td>
		            </tr>
		            <tr>
			            <td>
                            ����Դ��
                            <asp:TextBox ID="Souce" runat="server"  Width="40%" MaxLength="100" CssClass="form"></asp:TextBox><img src="../../sysImages/folder/s.gif" alt="ѡ��������Դ" border="0" style="cursor:pointer;" onclick="selectFile('Souce',document.Form1.Souce,220,450);document.Form1.Souce.focus();" />
                            <asp:Button ID="Button7" runat="server" OnClick="source_click" Text="������Դ" /></td>
		            </tr>
		            <tr>
			            <td class="hback"> ��չ����
			        <asp:DropDownList ID="FileEXName" runat="server" Height="21px" Width="92px" CssClass="form">
                    <asp:ListItem Value="">ѡ����չ��</asp:ListItem>
                    <asp:ListItem>.html</asp:ListItem>
                    <asp:ListItem>.htm</asp:ListItem>
                    <asp:ListItem>.shtml</asp:ListItem>
                    <asp:ListItem>.shtm</asp:ListItem>
                    <asp:ListItem>.aspx</asp:ListItem>
                </asp:DropDownList>
                            <asp:Button ID="Button8" runat="server" OnClick="exname_click" Text="������չ��" /> ˵�������Ϊ�������ţ������ò�������</td>
		            </tr>
		            <tr>
			            <td></td>
		            </tr>
               </table>
            </asp:Panel>
	    </td>
	</tr>
	<tr class="TR_BG_list">
	    <td colspan="3" align="center" class="list_link">
	    <asp:Button runat="server" ID="BtnOK" OnClick="BtnOK_Click" CssClass="form"/>
            <asp:Button ID="Button1" runat="server" Text=" ���� " CssClass="form" /></td>
	</tr>
  </table>
  <br />
  <br />
 <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
  <tr>
    <td class="list_link" align="center"><%Response.Write(CopyRight); %></td>
  </tr>
</table>
</div>
</form>
</body>
</html>
