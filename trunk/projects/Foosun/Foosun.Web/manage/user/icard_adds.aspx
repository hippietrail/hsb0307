<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" Inherits="manage_user_icard_adds" Codebehind="icard_adds.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <table id="top1" width="100%"  border="0" cellpadding="0" cellspacing="0" class="toptable">
            <tr>
              <td height="1" colspan="2"></td>
            </tr>
            <tr>
              <td width="57%"  class="sysmain_navi" style="padding-left:14px;" >�㿨����</td>
              <td width="43%">λ�õ�����<a href="../main.aspx" class="list_link" target="sys_main">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="icard.aspx" class="list_link" target="sys_main">�㿨����</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�㿨�б�</td>
            </tr>
    </table>
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
      <tr>
        <td  style="padding-left:12px;"><a href="icard.aspx" class="topnavichar">ȫ���㿨</a>��<a href="icard.aspx?islock=1" class="topnavichar">������</a>��<a href="icard.aspx?islock=0" class="topnavichar">δ����</a>��<a href="icard.aspx?isuse=1" class="topnavichar">��ʹ��</a>��<a href="icard.aspx?isuse=0" class="topnavichar">δʹ��</a>��<a href="icard.aspx?isbuy=1" class="topnavichar">�ѹ���</a>��<a href="icard.aspx?isbuy=0" class="topnavichar">δ����</a>��<a href="icard.aspx?timeout=0" class="topnavichar">δ����</a>��<a href="icard.aspx?timeout=1" class="topnavichar">�ѹ���</a>��<a href="icard_add.aspx" class="topnavichar" >���ӵ㿨</a>��<a href="icard_adds.aspx" class="topnavichar" ><font color="red">�������ɵ㿨</font></a></td>
      </tr>
      </table>
     <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" class="table">
       
       
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">��������</div></td> 
          <td class="list_link"><asp:TextBox CssClass="form" ID="cNumber" runat="server" MaxLength="3"  Width="250">100</asp:TextBox>
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_icard_adds_0001',this)">����</span>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="cNumber" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����������Χ1-999</span>"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="cNumber"  Display="Static" ErrorMessage="(*)��ʽ����ȷ������д������" ValidationExpression="^[0-9]{0,3}"></asp:RegularExpressionValidator>
         </td></tr>   
             
         <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">����/���кų���</div></td> 
          <td class="list_link"><asp:TextBox CssClass="form" ID="cardlen" runat="server" MaxLength="2"  Width="250">15</asp:TextBox>
          �������ַ���� <asp:DropDownList ID="isChar_num" runat="server">
             <asp:ListItem Selected="True" Value="0">��</asp:ListItem>
             <asp:ListItem Value="1">��</asp:ListItem>
         </asp:DropDownList>
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_icard_adds_0001',this)">����</span>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="cardlen" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)���ų������Ϊ30</span>"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="cardlen"  Display="Static" ErrorMessage="(*)��ʽ����ȷ������д������" ValidationExpression="^[0-9]{0,2}"></asp:RegularExpressionValidator>
         </td></tr> 

          <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">����ǰ׺</div></td> 
          <td class="list_link"><asp:TextBox CssClass="form" ID="recard" runat="server" MaxLength="10" Text="FS"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_icard_adds_00012',this)">����</span>
         </td>
         </tr>          
          <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">���볤��</div></td> 
          <td class="list_link"><asp:TextBox CssClass="form" ID="passlen" runat="server" MaxLength="2"  Width="250">15</asp:TextBox>
          �������ַ���� <asp:DropDownList ID="pass_card_num" runat="server">
             <asp:ListItem Selected="True" Value="0">��</asp:ListItem>
             <asp:ListItem Value="1">��</asp:ListItem>
            </asp:DropDownList>
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_icard_adds_00013',this)">����</span>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="passlen" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)���볤�����Ϊ30</span>"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="passlen"  Display="Static" ErrorMessage="(*)��ʽ����ȷ������д������" ValidationExpression="^[0-9]{0,2}"></asp:RegularExpressionValidator>
         </td>
         </tr> 

        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">���</div></td> 
          <td class="list_link"><asp:TextBox CssClass="form" ID="Money" runat="server" MaxLength="5" Text="0"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_icard_adds_0003',this)">����</span>
          <asp:RequiredFieldValidator ID="RequiredFieldValidators" runat="server" ControlToValidate="Money" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)����Ϊ5</span>"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Money"  Display="Static" ErrorMessage="(*)��ʽ����ȷ������д������" ValidationExpression="^[0-9]{0,5}"></asp:RegularExpressionValidator>
          </td></tr>    
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">����</div></td> 
          <td class="list_link"><asp:TextBox CssClass="form" ID="Point" runat="server" MaxLength="8"  Text="100" Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_icard_adds_0004',this)">����</span>
          <asp:RequiredFieldValidator ID="RequiredFieldValidatordd" runat="server" ControlToValidate="Point" Display="Dynamic" ErrorMessage="<span class='reshow'>(*)��������Ϊ8</span>"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Point"  Display="Static" ErrorMessage="(*)��ʽ����ȷ������д������" ValidationExpression="^[0-9]{0,8}"></asp:RegularExpressionValidator>
          </td></tr>

       <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">��Ч����</div></td> 
          <td class="list_link"><asp:TextBox CssClass="form" ID="TimeOutDate" runat="server" MaxLength="10"  Width="250"></asp:TextBox>&nbsp;<img src="../../sysImages/folder/s.gif" alt="ѡ��㿨��������" border="0" style="cursor:pointer;" onclick="selectFile('date',document.form1.TimeOutDate,160,500);document.form1.TimeOutDate.focus();" /><span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_icard_adds_0006',this)">����</span>
              </td>
          </tr>
         
      <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              ����</div></td> 
          <td class="list_link">
          
         <asp:DropDownList ID="isLock" runat="server">
             <asp:ListItem Selected="True" Value="0">��</asp:ListItem>
             <asp:ListItem Value="1">��</asp:ListItem>
         </asp:DropDownList>
         
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_icard_add_0007',this)">����</span></td>
          </tr>   
                
 
       <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              ʹ��</div></td> 
          <td class="list_link">
          
         <asp:DropDownList ID="isUse" runat="server">
             <asp:ListItem Selected="True" Value="0">��</asp:ListItem>
             <asp:ListItem Value="1">��</asp:ListItem>
         </asp:DropDownList>
         
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_icard_add_0008',this)">����</span></td>
          </tr>   
 
 
       <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              ����</div></td> 
          <td class="list_link">
          
         <asp:DropDownList ID="isBuy" runat="server">
             <asp:ListItem Selected="True" Value="0">��</asp:ListItem>
             <asp:ListItem Value="1">��</asp:ListItem>
         </asp:DropDownList>
         
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_icard_add_0009',this)">����</span></td>
          </tr> 
          
                    
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 114px; height: 28px;">&nbsp;</td>
          <td class="list_link" style="height: 28px">&nbsp;
          <asp:Button ID="sumbitsave" runat="server" CssClass="form" Text=" ȷ �� " OnClick="sumbitsave_Click" />
            <input name="reset" type="reset" value=" �� �� "  class="form">        </td>
        </tr>
        </table>
    </form>
  <br />
    <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
       <tr>
         <td align="center"><label id="copyright" runat="server" /></td>
       </tr>
    </table>      
</body>
</html>
  <script type="text/javascript" language="javascript">
    function getchanelInfo(obj)
    {
       var SiteID=obj.value;
       window.location.href="icard.aspx?SiteID="+SiteID+"";
    }
 
   function getSearch(cardvalue,passvalue,typesvalue)
   {
       window.location.href="icard.aspx?cardNumber="+cardvalue+"&cardPassword="+passvalue+"&types="+typesvalue+"";
   }
 </script>