<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" Inherits="user_info_reviewGroup" Codebehind="reviewGroup.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
function fTable()
{
    Form.disable(form1);
}
</script>
</head>
<body onload="fTable();">
<form id="form1" runat = "Server">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="57%" height="32" class="sysmain_navi"  style="PADDING-LEFT: 14px" >�鿴��ԱȨ��</td>
          <td width="43%" height="32" class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="userinfo.aspx" class="list_link">�ҵ�����</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�鿴����Ȩ��</div></td>
        </tr>
</table>
     <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" class="table">
       
       
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">��Ա����</div></td> 
          <td class="list_link"><asp:TextBox CssClass="form" ID="GroupName" runat="server"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_usergroup_add_0001',this)">����</span></td>
          </tr>
          
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">��Ҫ����</div></td> 
          <td class="list_link"><asp:TextBox CssClass="form" ID="iPoint" runat="server" Text="0" MaxLength="4" Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_usergroup_add_0002',this)">����</span></td>
          </tr>          
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">��ҪG��</div></td> 
          <td class="list_link"><asp:TextBox CssClass="form" ID="gPoint" runat="server" Text="0" MaxLength="4" Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_usergroup_add_0003',this)">����</span></td>
          </tr>
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">�ۿ���</div></td> 
          <td class="list_link"><asp:TextBox CssClass="form" ID="Discount" runat="server" Text="0" MaxLength="4" Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_usergroup_add_Discount',this)">����</span></td>
          </tr>
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">��Ч��</div></td> 
          <td class="list_link"><asp:TextBox CssClass="form" ID="Rtime" runat="server" Text="0"  Width="250"  MaxLength="20"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_usergroup_add_0004',this)">����</span></td>
          </tr>
          
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">����������������</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="LenCommContent" runat="server" Text="500" MaxLength="4" Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_0005',this)">����</span></td>
        </tr>
        
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              ������Ҫ���</div></td>
          <td class="list_link">
              <asp:RadioButtonList ID="CommCheckTF" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_0006',this)">����</span></td>
        </tr> 
        
        
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">�������ۼ��ʱ��(��)</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="PostCommTime" runat="server" Text="60"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_0007',this)">����</span></td>
        </tr>        
        
        
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px; height: 28px;"><div align="right">�����ϴ���ʽ</div></td>
          <td class="list_link" style="height: 28px"><asp:TextBox CssClass="form" ID="upfileType" runat="server" Text="jpg,gif,bmp,png,swf,zip,rar"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_0008',this)">����</span></td>
        </tr> 
                
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">�ϴ��ļ�����(��)</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="upfileNum" runat="server" Text="10" Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_0009',this)">����</span></td>
        </tr> 
                
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">�����ļ���С(kb)</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="upfileSize" runat="server"  Text="10" Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00010',this)">����</span></td>
        </tr> 
        
         <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">ÿ������ϴ���(��)</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="DayUpfilenum" runat="server" Text="3"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00011',this)">����</span></td>
        </tr>
        
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">�������Ͷ����(ƪ)</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="ContrNum" runat="server" Text="50" Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00012',this)">����</span></td>
        </tr> 
                
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              ������������</div></td>
          <td class="list_link">
                <asp:RadioButtonList ID="DicussTF" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00013',this)">����</span></td>
        </tr> 
                
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              ����������</div></td>
          <td class="list_link">
                <asp:RadioButtonList ID="PostTitle" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>          
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00014',this)">����</span></td>
        </tr> 
                
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              �鿴������Ա����</div></td>
          <td class="list_link">
                <asp:RadioButtonList ID="ReadUser" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>             
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00015',this)">����</span></td>
        </tr> 
                
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              ����Ͷ���Ϣ��(��)</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="MessageNum" runat="server" Text="100" Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00016',this)">����</span></td>
        </tr> 
                
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              ֧��Ⱥ����Ϣ</div></td>
          <td class="list_link">
           <asp:TextBox ID="MessageGroupNum"  CssClass="form" runat="server"></asp:TextBox>
           
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00017',this)">����</span></td>
        </tr> 
                 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              ע����Ҫʵ����֤</div></td>
          <td class="list_link">
                <asp:RadioButtonList ID="IsCert" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>   
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00018',this)">����</span></td>
        </tr> 
                 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              ����ǩ��</div></td>
          <td class="list_link">
                <asp:RadioButtonList ID="CharTF" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>  
              <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00019',this)">����</span></td>
        </tr> 
                 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              ǩ��ʹ��html�﷨</div></td>
          <td class="list_link">
                <asp:RadioButtonList ID="CharHTML" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>            
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00020',this)">����</span></td>
        </tr> 
                 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">ǩ����󳤶�(�ַ�)</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="CharLenContent" MaxLength="3" runat="server" Text="500"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00021',this)">����</span></td>
        </tr> 
                 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">ע����ٷ��Ӻ�������</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="RegMinute" MaxLength="3" runat="server" Text="10"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00022',this)">����</span></td>
        </tr> 
                 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              ��������HTML�༭��</div></td>
          <td class="list_link">
              <asp:RadioButtonList ID="PostTitleHTML" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>          
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00023',this)">����</span></td>
        </tr> 
                 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              ɾ���Լ�������</div></td>
          <td class="list_link">
              <asp:RadioButtonList ID="DelSelfTitle" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>           
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00024',this)">����</span></td>
        </tr> 
                 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">ɾ�������˵�����</div></td>
          <td class="list_link">
              <asp:RadioButtonList ID="DelOTitle" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>            
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00025',this)">����</span></td>
        </tr> 
                 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              �༭�Լ��ķ���</div></td>
          <td class="list_link">
              <asp:RadioButtonList ID="EditSelfTitle" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>             
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00026',this)">����</span></td>
        </tr> 
                 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              �༭��������</div></td>
          <td class="list_link">
          
              <asp:RadioButtonList ID="EditOtitle" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>           
              <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00027',this)">����</span></td>
        </tr> 
                 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">�����������</div></td>
          <td class="list_link">
              <asp:RadioButtonList ID="ReadTitle" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>               
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00028',this)">����</span></td>
        </tr> 
                 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              �ƶ��Լ�������</div></td>
          <td class="list_link">
              <asp:RadioButtonList ID="MoveSelfTitle" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>             
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00029',this)">����</span></td>
        </tr> 
                 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              �ƶ���������</div></td>
          <td class="list_link">
          
              <asp:RadioButtonList ID="MoveOTitle" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>             
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00030',this)">����</span></td>
        </tr> 
                 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              ���/�̶�����</div></td>
          <td class="list_link">
          
              <asp:RadioButtonList ID="TopTitle" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>              
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00031',this)">����</span></td>
        </tr> 
                 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">�������Ӳ���</div></td>
          <td class="list_link">
          
              <asp:RadioButtonList ID="GoodTitle" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>            
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00032',this)">����</span></td>
        </tr> 
                 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              �����û�</div></td>
          <td class="list_link">
          
              <asp:RadioButtonList ID="LockUser" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>            
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00033',this)">����</span></td>
        </tr> 
                 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">�û���ʶ</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="UserFlag" runat="server" Text="FS_" Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00034',this)">����</span></td>
        </tr> 
                 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              �������</div></td>
          <td class="list_link">
          
          
              <asp:RadioButtonList ID="CheckTtile" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>   
             <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00035',this)">����</span></td>
        </tr> 
                 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              ����IP����</div></td>
          <td class="list_link">
              <asp:RadioButtonList ID="IPTF" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>             
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00036',this)">����</span></td>
        </tr> 
                 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              �Զ����û����н���/�ͷ�</div></td>
          <td class="list_link">
          
              <asp:RadioButtonList ID="EncUser" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>                    
              <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00037',this)">����</span></td>
        </tr> 
        
                  
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
              ��/�ر�����������</div></td>
          <td class="list_link">
              <asp:RadioButtonList ID="OCTF" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>                    
          
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00038',this)">����</span></td>
        </tr> 
        
                  
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">�����û�ѡ����</div></td>
          <td class="list_link">
          
              <asp:RadioButtonList ID="StyleTF" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>     
              <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00039',this)">����</span></td>
        </tr> 
        
                  
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">��Ա�ϴ�ͷ���������(kb)</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="UpfaceSize" MaxLength="3" runat="server" Text="20"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00040',this)">����</span></td>
        </tr> 
        
                  
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">
             ���ֶһ����/��Ҷһ�����</div></td>
          <td class="list_link">
            <asp:TextBox CssClass="form" ID="GIChange" MaxLength="3" runat="server" Text="0|1"  Width="250"></asp:TextBox>
                      
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00041',this)">����</span></td>
        </tr> 
        
                  
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">�һ�����</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="GTChageRate" MaxLength="30" Text="1000|1/10000" runat="server"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00042',this)">����</span></td>
        </tr> 
        
                  
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">��½ʱ���õĻ���|G��</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="LoginPoint" runat="server" MaxLength="10" Text="5|0"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00043',this)">����</span></td>
        </tr> 
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">ע��ʱ���õĻ���|G��</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="RegPoint" runat="server" MaxLength="10" Text="2|0"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00048',this)">����</span></td>
        </tr>                   
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">�Ƿ���������Ⱥ</div></td>
          <td class="list_link">
          
              <asp:RadioButtonList ID="GroupTF" runat="server" Width="73px" RepeatDirection="Horizontal" RepeatLayout="Flow">
                  <asp:ListItem Value="1">��</asp:ListItem>
                  <asp:ListItem Value="0">��</asp:ListItem>
              </asp:RadioButtonList>   
                      
          
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00044',this)">����</span></td>
        </tr> 
        
                  
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">��Ⱥ�ռ��С(kb)</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="GroupSize" runat="server" Text="2000"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00045',this)">����</span></td>
        </tr> 
        
                  
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">��Ⱥ�����������</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="GroupPerNum" Text="100" MaxLength="3" runat="server"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00046',this)">����</span></td>
        </tr> 
        
                  
        <tr class="TR_BG_list">
          <td class="list_link" style="width: 149px"><div align="right">�������������</div></td>
          <td class="list_link"><asp:TextBox CssClass="form" ID="GroupCreatNum" Text="3" MaxLength="2" runat="server"  Width="250"></asp:TextBox>
          <span class="helpstyle" style="cursor:help;"  title="����鿴����" onclick="Help('H_usergroup_add_00047',this)">����</span></td>
        </tr> 

</table>
 <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
   <tr>
     <td align="center"><label id="copyright" runat="server" /></td>
   </tr>
 </table>   
    </form>
</body>
</html>
