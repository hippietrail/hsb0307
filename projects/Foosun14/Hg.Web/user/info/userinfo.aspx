<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" AutoEventWireup="true" Inherits="user_userinfo" Debug="true" Codebehind="userinfo.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat = "Server">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%" height="32" class="sysmain_navi"  style="PADDING-LEFT: 14px" >��Ա����</td>
          <td width="43%" height="32" class="list_link"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="userinfo.aspx" class="list_link">�ҵ�����</a></div></td>
        </tr>
    </table>
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
        <tr>
          <td style="padding-left:14px;"><a class="list_link" href="userinfo.aspx"><font color="red">�ҵ�����</font></a>��<a class="list_link" href="userinfo_update.aspx">�޸Ļ�����Ϣ</a>��<a class="list_link" href="userinfo_contact.aspx">�޸���ϵ����</a>��<a class="list_link" href="userinfo_safe.aspx">�޸İ�ȫ����</a>��<a class="list_link" href="userinfo_idcard.aspx">�޸�ʵ����֤</a></td>
        </tr>
    </table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr class="TR_BG_list">
      <td height="217" valign="top" style="width: 933px">
        <table width="100%" cellpadding="2" cellspacing="1">
        <tr class="TR_BG_list">
          <td  class="list_link"><strong>������Ϣ</strong></td>
        </tr>
        <tr class="TR_BG_list">
        <td  class="list_link">
        <table width="100%" cellpadding="4" cellspacing="1" class="table" align="center">
            <!--��������-->
            <!--�û���-->
            <tr class="TR_BG_list">
              <td  class="list_link" style="height: 8px; width: 122px;">�û���</td>
              <td width="529" style="width: 529px">
                  <asp:Label ID="UserNamex" runat="server" Width="100%" Height="100%" CssClass="list_link"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;<label id="levelsFace" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label id="Reviewmyfinfo" runat="server" /></td>
              <td rowspan="9" width="192" align="center"><asp:Image ID="UserFacex" runat="server" ImageUrl="~/sysImages/user/noHeadpic.gif" /></td>
            </tr>
            <!--��Ա�ǳ�-->
            <tr class="TR_BG_list">
              <td  class="list_link" style="width: 122px">�ǳ�</td>
              <td  class="list_link" style="width: 529px"><asp:Label ID="NickNamex" runat="server" Width="100%" Height="100%" CssClass="list_link"></asp:Label></td>
            </tr>
            <!--��Ա��ʵ����-->
            <tr class="TR_BG_list">
              <td  class="list_link" style="width: 122px">��ʵ����</td>
              <td  class="list_link" style="width: 529px"><asp:Label ID="RealNamex" runat="server" Width="100%" Height="100%" CssClass="list_link"></asp:Label></td>
            </tr>
            <!--��Ա�Ա�-->
            <tr class="TR_BG_list">
              <td  class="list_link" style="width: 122px">�ֻ�</td>
              <td  class="list_link" style="width: 529px">
              <asp:Label ID="Mobilex" runat="server" Width="100%" Height="100%"></asp:Label>
              <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_getMobile_0001',this)">��ô�����ֻ�/С��ͨ?</span>
              </td>
            </tr>
            <tr class="TR_BG_list">
              <td  class="list_link" style="width: 122px">�Ա�</td>
              <td  class="list_link" style="width: 529px"><asp:Label ID="Sexx" runat="server" Width="100%" Height="100%" CssClass="list_link"></asp:Label></td>
            </tr>
            
              
            <!--��������-->
            <tr class="TR_BG_list">
              <td  class="list_link" style="width: 122px">��������</td>
              <td  class="list_link" style="width: 529px"><asp:Label ID="birthdayx" runat="server" Width="100%" Height="100%" CssClass="list_link"></asp:Label></td>
            </tr>
            <!--��Ա�����ڵĻ�Ա��-->
            <tr class="TR_BG_list">
              <td  class="list_link" style="width: 122px">
                  ��Ա��</td>
              <td  class="list_link" style="width: 529px"><asp:Label ID="UserGroupNumberx" runat="server" Width="100%" Height="100%" CssClass="list_link"></asp:Label>&nbsp
              <span style="display:none;">
              <label id="reviewGroup" runat="server" />
              <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_getgroupUpdate',this)">��Ҫ��ô����</span>
              </span>
              </td>
            </tr>
            <!--���-->
            <tr class="TR_BG_list">
              <td  class="list_link" style="width: 122px">����״��</td>
              <td  class="list_link" style="width: 529px"><asp:Label ID="marriagex" runat="server" Width="100%" Height="100%" CssClass="list_link"></asp:Label></td>
            </tr>
            <!--ְҵ-->
            <tr class="TR_BG_list">
              <td  class="list_link" style="width: 122px">ְҵ</td>
              <td  class="list_link" style="width: 529px"><asp:Label ID="Jobx" runat="server" Width="100%" Height="100%" CssClass="list_link"></asp:Label></td>
            </tr>
            </table></td></tr>
            <tr class="TR_BG_list">
              <td  class="list_link"><strong>����״̬</strong></td>
            </tr>
            <tr class="TR_BG_list">
            <td  class="list_link">
           <table width="100%" cellpadding="4" cellspacing="1" class="table" align="center">
            <!--�û�ǩ��-->
            
            <tr class="TR_BG_list">
              <td width="15%" class="list_link">��Ծֵ</td><!--����-->
              <td width="35%"  class="list_link"><asp:Label ID="aPointx" runat="server" Width="100%" Height="100%"></asp:Label></td>
              <td width="15%"  class="list_link">ע������</td><!--ע������-->
              <td width="35%"  class="list_link"><asp:Label ID="RegTimex" runat="server" Width="100%" Height="100%"></asp:Label></td>
            </tr>
            <tr class="TR_BG_list">
              <td  class="list_link">����</td><!-- ����-->
              <td  class="list_link"><asp:Label ID="iPointx" runat="server" Width="100%" Height="100%"></asp:Label>&nbsp;&nbsp;<span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_iPoint_0001',this)">��ζһ�����/���?</span></td>
              <td  class="list_link">�û�����ʱ��</td><!--�û�����ʱ��-->
              <td  class="list_link"><asp:Label ID="OnlineTimex" runat="server" Width="100%" Height="100%"></asp:Label></td>
            </tr>
            <tr class="TR_BG_list">
              <td  class="list_link">���</td><!--���-->
              <td  class="list_link"><asp:Label ID="gPointx" runat="server" Width="100%" Height="100%"></asp:Label> <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_gPoint_0001',this)">����</span></td>
              <td  class="list_link">����ֵ</td><!--�û�����״̬-->
              <td  class="list_link"><asp:Label ID="ePointx" runat="server" Width="100%" Height="100%"></asp:Label></td>
            </tr>
            <tr class="TR_BG_list">
              <td  class="list_link">����ֵ</td> <!--����ֵ-->
              <td  class="list_link"><asp:Label ID="cPointx" runat="server" Width="100%" Height="100%"></asp:Label></td>
              <td  class="list_link">�û���½����</td><!-- �û���½����-->
              <td  class="list_link"><asp:Label ID="LoginNumberx" runat="server" Width="100%" Height="100%"></asp:Label></td>
            </tr>
            </table></td></tr>
            <tr class="TR_BG_list">
              <td  class="list_link"><strong>������Ϣ</strong></td>
            </tr>
            <tr class="TR_BG_list">
              <td  class="list_link"><table width="100%" cellpadding="4" cellspacing="1" class="table" align="center">
                <!--��ϸ����-->
                <tr class="TR_BG_list">
                  <td width="15%"  class="list_link">����</td>
                  <!-- ����-->
                  <td width="35%"><asp:Label ID="Nationx" runat="server" Width="100%" Height="100%"></asp:Label></td>
                  <td width="15%" class="list_link">�����ʼ�</td>
                  <!--�û�����-->
                  <td width="35%"><asp:Label ID="Emailx" runat="server" Width="100%" Height="100%"></asp:Label></td>
                </tr>
                <tr class="TR_BG_list">
                  <td  class="list_link">����</td>
                  <!-- ����-->
                  <td  class="list_link"><asp:Label ID="nativeplacex" runat="server" Width="100%" Height="100%"></asp:Label></td>
                  <td  class="list_link">ѧ��</td>
                  <!--ѧ��-->
                  <td  class="list_link"><asp:Label ID="educationx" runat="server" Width="100%" Height="100%"></asp:Label></td>
                </tr>
                <tr class="TR_BG_list">
                  <td  class="list_link">��֯��ϵ</td>
                  <!--��֯��ϵ-->
                  <td  class="list_link"><asp:Label ID="orgSchx" runat="server" Width="100%" Height="100%"></asp:Label></td>
                  <td  class="list_link">��ҵѧУ</td>
                  <!--��ҵѧУ-->
                  <td  class="list_link"><asp:Label ID="Lastschoolx" runat="server" Width="100%" Height="100%"></asp:Label></td>
                </tr>
                <tr class="TR_BG_list">
                  <td  class="list_link">�Ը�</td>
                  <!--�Ը�-->
                  <td colspan="3"  class="list_link"><asp:Label ID="characterx" runat="server" Width="100%" Height="100%"></asp:Label></td>
                  <!-- �����ʼ�-->
                </tr>
                <tr class="TR_BG_list">
                  <td  class="list_link">�û�ǩ��</td>
                  <td colspan="3"  class="list_link"><asp:Label ID="Userinfox" runat="server" Width="100%" Height="100%"></asp:Label></td>
                </tr>
                <tr class="TR_BG_list">
                  <td  class="list_link">�û�����</td>
                  <td colspan="3"  class="list_link"><asp:Label ID="UserFanx" runat="server" Width="100%" Height="100%"></asp:Label></td>
                </tr>
                
              </table></td>
            </tr>
            
            <tr class="TR_BG_list">
              <td  class="list_link"><strong>��ϵ����</strong></td>
            </tr>
            <tr class="TR_BG_list">
              <td  class="list_link"><table width="100%" cellpadding="4" cellspacing="1" class="table" align="center">
                <!--��ϵ��ʽ-->
                <tr class="TR_BG_list">
                  <td  class="list_link">ʡ��</td>
                  <td><asp:Label ID="provincex" runat="server" Width="100%" Height="100%"></asp:Label></td>
                  <td class="list_link">����</td>
                  <td><asp:Label ID="Cityx" runat="server" Width="100%" Height="100%"></asp:Label></td>
                </tr>
                <tr class="TR_BG_list">
                  <td width="15%"  class="list_link">��ַ</td>
                  <!-- ��ַ-->
                  <td width="35%"><asp:Label ID="Addressx" runat="server" Width="100%" Height="100%"></asp:Label></td>
                  <td width="15%" class="list_link">MSN</td>
                  <!--�ֻ�-->
                  <td width="35%"><asp:Label ID="MSNx" runat="server" Width="100%" Height="100%"></asp:Label></td>
                </tr>
                <tr class="TR_BG_list">
                  <td  class="list_link">��������</td>
                  <!--��������-->
                  <td  class="list_link"><asp:Label ID="Postcodex" runat="server" Width="100%" Height="100%"></asp:Label></td>
                  <td  class="list_link">QQ</td>
                  <!--����-->
                  <td  class="list_link"><asp:Label ID="QQx" runat="server" Width="100%" Height="100%"></asp:Label></td>
                </tr>
                <tr class="TR_BG_list">
                  <td  class="list_link">��ͥ��ϵ�绰</td>
                  <!-- ��ͥ��ϵ�绰-->
                  <td  class="list_link"><asp:Label ID="FaTelx" runat="server" Width="100%" Height="100%"></asp:Label></td>
                  <td  class="list_link">����</td>
                  <!-- QQ-->
                  <td  class="list_link"><asp:Label ID="Faxx" runat="server" Width="100%" Height="100%"></asp:Label></td>
                </tr>
                <tr class="TR_BG_list">
                  <td class="list_link">������λ��ϵ�绰</td>
                  <!--������λ��ϵ�绰-->
                  <td  class="list_link"><asp:Label ID="WorkTelx" runat="server" Width="100%" Height="100%"></asp:Label></td>
                  <td  class="list_link"></td>
                  <!--MSN-->
                  <td  class="list_link"></td>
                </tr>
              </table></td>
            </tr>
        </table>
     </td>
    </tr>
  </table>
  <table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
    <tr>
      <td  class="list_link" align="center"><label id="copyright" runat=server /></td>
    </tr>
  </table>
</form>
</body>
<script language="javascript" type="text/javascript">
	function ChangeDiv(ID)
	{
		document.getElementById('td_Fundamental').className='m_up_bg';
		document.getElementById('td_Detailed').className='m_up_bg';
		document.getElementById('td_contact').className='m_up_bg';
		document.getElementById("td_"+ID).className='m_down_bg';

		document.getElementById("div_Fundamental").style.display="none";
		document.getElementById("div_Detailed").style.display="none";
		document.getElementById("div_contact").style.display="none";
		document.getElementById("div_"+ID).style.display="";
	}
</script>
</html>
