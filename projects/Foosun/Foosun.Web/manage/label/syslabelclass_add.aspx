<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_label_syslabelclass_add" Codebehind="syslabelclass_add.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title></title>
    <link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>

<body>
    <form id="form1" runat="server">
      <table width="100%" border="0" cellpadding="0" cellspacing="0"  class="toptable">
        <tr>
          <td width="57%" class="sysmain_navi"  style="PADDING-LEFT: 14px" Height="30">��ӷ���</td>
          <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="SysLabel_List.aspx" class="list_link">��ǩ����</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />��ӷ���</div></td>
        </tr>
      </table>
      
       <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
        <tr class="TR_BG_list">
          <td align="center" class="navi_link" style="width: 13%">��������</td>
          <td Width="90%" align="left"><asp:TextBox ID="LabelClassName" runat="server" Width="200px" MaxLength="30"></asp:TextBox> <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_labelclassadd_001',this)">����</span><asp:RequiredFieldValidator ID="RequirestyleLabelClassName" runat="server" ControlToValidate="LabelClassName" Display="Dynamic" ErrorMessage="<span class=reshow>(*)����д��ǩ����</spna>"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr class="TR_BG_list">
          <td align="center" class="navi_link" style="width: 13%">������Ϣ</td>
          <td Width="90%" align="left"><asp:TextBox ID="ClassContent" runat="server" Width="400px" Height="100px" TextMode="MultiLine" MaxLength="200"></asp:TextBox> <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_labelclassadd_002',this)">����</span>
            </td>
        </tr>
        <tr class="TR_BG_list">
          <td align="left" class="navi_link" style="width: 10%" colspan="2"><label>
            <asp:Button ID="Button1" runat="server" Text=" �� �� " CssClass="form" OnClick="Button1_Click" />
            </label>
            <label>
            <input type="reset" name="UnDo" value=" �� �� " class="form" />
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

