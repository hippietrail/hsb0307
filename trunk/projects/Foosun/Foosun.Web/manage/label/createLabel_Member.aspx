<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_label_createLabel_Member" ResponseEncoding="utf-8" Codebehind="createLabel_Member.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<link href="../../sysImages/<% Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/jsPublic.js"></script>
<script type="text/javascript" src="../../editor/fckeditor.js"></script>
</head>
<body>
    <form id="ListLabel" runat="server">
        <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
          <tr class="TR_BG_list">
            <td align="right" class="navi_link" style="width: 28%">��ѡ������</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="LabelType" runat="server" CssClass="form" Width="200px" onchange="javascript:selectLabelType(this.value);" >
                <asp:ListItem Value="">��ѡ���Ա��ǩ����</asp:ListItem>
                <asp:ListItem Value="UserLogin">�û���½</asp:ListItem>
                <asp:ListItem Value="TopUser">�û�����</asp:ListItem>
                <asp:ListItem Value="NewUser">����ע���û�</asp:ListItem>
                <asp:ListItem Value="ConstrNews">Ͷ���ǩ</asp:ListItem>
                <asp:ListItem Value="GroupMember">������</asp:ListItem>
                <asp:ListItem Value="LastComm">��������</asp:ListItem>
              </asp:DropDownList></td>
          </tr>
          <tr class="TR_BG_list" style="display:none;" id="TrLoginP">
            <td align="right" class="navi_link" style="width: 28%">��ʾ��ʽ</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="LoginP" runat="server" CssClass="form" Width="200px" onchange="selectDisWay(this.value)">
                <asp:ListItem Value="">��ѡ����ʾ��ʽ</asp:ListItem>
                <asp:ListItem Value="0">�Զ���</asp:ListItem>
                <asp:ListItem Value="true">����</asp:ListItem>
                <asp:ListItem Value="false">����</asp:ListItem>
              </asp:DropDownList><span id="spanLoginP"></span></td>
          </tr>
          
          <tr class="TR_BG_list" style="display:none;" id="TrFormCSS">
            <td align="right" class="navi_link" style="width: 28%">�ı�����ʽ(CSS)</td>
            <td width="79%" align="left" class="navi_link">
                <asp:TextBox ID="FormCSS" runat="server"></asp:TextBox>
           </td>
          </tr>
     <tr class="TR_BG_list" style="display:none;" id="aTrStyleID">
            <td align="right" class="navi_link" style="width: 28%">������ʽ</td>
            <td width="79%" align="left" class="navi_link">
                <asp:TextBox ID="aStyleID" runat="server"></asp:TextBox> <img src="../../sysImages/folder/s.gif" style="cursor:pointer;" alt="ѡ����ʽ" onclick="selectFile('style',document.ListLabel.aStyleID,300,380);document.ListLabel.aStyleID.focus();"  /> 
           </td>
          </tr>
          <tr class="TR_BG_list" style="display:none;" id="TrLoginCSS">
            <td align="right" class="navi_link" style="width: 28%">��½����ʽ</td>
            <td width="79%" align="left" class="navi_link">
                <asp:TextBox ID="LoginCSS" runat="server"></asp:TextBox> <img src="../../sysImages/folder/s.gif" style="cursor:pointer;" title="ѡ��ͼƬ"  onclick="selectFile('pic',document.ListLabel.LoginCSS,300,420);document.ListLabel.LoginCSS.focus();" /> ������дCSS��ͼƬ��ַ����дͼƬ��ֱַ�������ַ��
           </td>
          </tr>

          
          
          <tr class="TR_BG_list" style="display:none;" id="TrRegCSS">
            <td align="right" class="navi_link" style="width: 28%">ע����ʽ</td>
            <td width="79%" align="left" class="navi_link">
                <asp:TextBox ID="RegCSS" runat="server"></asp:TextBox> <img src="../../sysImages/folder/s.gif" style="cursor:pointer;" title="ѡ��ͼƬ"  onclick="selectFile('pic',document.ListLabel.RegCSS,300,420);document.ListLabel.RegCSS.focus();" /> ������дCSS��ͼƬ��ַ����дͼƬ��ֱַ�������ַ��
           </td>
          </tr>
                    
          <tr class="TR_BG_list" style="display:none;" id="TrPassCSS">
            <td align="right" class="navi_link" style="width: 28%">����������ʽ</td>
            <td width="79%" align="left" class="navi_link">
                <asp:TextBox ID="PassCSS" runat="server"></asp:TextBox> <img src="../../sysImages/folder/s.gif" style="cursor:pointer;" title="ѡ��ͼƬ"  onclick="selectFile('pic',document.ListLabel.PassCSS,300,420);document.ListLabel.PassCSS.focus();" /> ������дCSS��ͼƬ��ַ����дͼƬ��ֱַ�������ַ��
           </td>
          </tr>
                              
          <tr class="TR_BG_list" style="display:none;" id="TrPointParam">
            <td align="right" class="navi_link" style="width: 28%">��ʾ����</td>
            <td width="79%" align="left" class="navi_link">
            <asp:DropDownList ID="PointParam" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">��ѡ����ʾ��ʽ</asp:ListItem>
                <asp:ListItem Value="right">����/G��/���/����������,����</asp:ListItem>
                <asp:ListItem Value="left">����/G��/���/����������,���ڻ�Ա��</asp:ListItem>
              </asp:DropDownList></td>
          </tr>
          
          <tr class="TR_BG_list" style="display:none;" id="TrShowDate">
            <td align="right" class="navi_link" style="width: 28%">��ʾ����</td>
            <td width="79%" align="left" class="navi_link">
            <asp:DropDownList ID="ShowDate" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">�Ƿ���ʾ����</asp:ListItem>
                <asp:ListItem Value="right">����</asp:ListItem>
                <asp:ListItem Value="left">������Ϣ��</asp:ListItem>
              </asp:DropDownList></td>
          </tr>
          
          <tr class="TR_BG_list" style="display:none;" id="TrNumber">
            <td align="right" class="navi_link" style="width: 28%">ѭ������</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="Number" runat="server" CssClass="form" Width="190px" Text="10"></asp:TextBox><span id="spanNumber"></span></td>
          </tr>
          <tr class="TR_BG_list" style="display:none;" id="TrTopUserType">
            <td align="right" class="navi_link" style="width: 28%">��ʲô��ʽ����</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="TopUserType" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">��ѡ�����з�ʽ</asp:ListItem>
                <asp:ListItem Value="inter">��������</asp:ListItem>
                <asp:ListItem Value="gpoint">G������</asp:ListItem>
                <asp:ListItem Value="click">�������(����)</asp:ListItem>
                <asp:ListItem Value="info">��Ϣ����</asp:ListItem>
              </asp:DropDownList></td>
          </tr>
          <tr class="TR_BG_list" style="display:none;" id="TrShowNavi">
            <td align="right" class="navi_link" style="width: 28%">�ڱ���ǰ�ӵ���</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="ShowNavi" runat="server" CssClass="form" Width="200px" onchange="javascript:selectShowNavi(this.value);">
                <asp:ListItem Value="">��ѡ���Ƿ�ӵ���</asp:ListItem>
                <asp:ListItem Value="1">���ֵ���(1,2,3...)</asp:ListItem>
                <asp:ListItem Value="2">��ĸ����(A,B,C...)</asp:ListItem>
                <asp:ListItem Value="3">��ĸ����(a,b,c...)</asp:ListItem>
                <asp:ListItem Value="4">�Զ���ͼƬ</asp:ListItem>
              </asp:DropDownList></td>
          </tr>
          <tr class="TR_BG_list" id="TrNaviCSS" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">����CSS</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="NaviCSS" runat="server" CssClass="form" Width="120px"></asp:TextBox>
            </td>
          </tr>          
          <tr class="TR_BG_list" id="TrNaviPic" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">����ͼƬ��ַ</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="NaviPic" runat="server" CssClass="form" Width="120px" ReadOnly="true"></asp:TextBox>
              &nbsp;
              <input class="form" type="button" value="ѡ��ͼƬ"  onclick="selectFile('pic',document.ListLabel.NaviPic,280,380);document.ListLabel.NaviPic.focus();" /></td>
          </tr>          
          <tr class="TR_BG_list" id="TrClassId" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">������Ŀ</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="ClassId" runat="server" CssClass="form" Width="120px" ReadOnly="true"></asp:TextBox>
              &nbsp;
              <input class="form" type="button" value="ѡ����Ŀ"  onclick="selectFile('newsclass',document.ListLabel.ClassId,300,380);document.ListLabel.ClassId.focus();" /></td>
          </tr> 
          <tr class="TR_BG_list" id="TrRoot" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">������ʽ</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="Root" runat="server" CssClass="form" Width="200px" onchange="javascript:selectRoot(this.value);">
                <asp:ListItem Value="true">�̶���ʽ</asp:ListItem>
                <asp:ListItem Value="false">�Զ�����ʽ</asp:ListItem>
              </asp:DropDownList></td>
          </tr>
          <tr class="TR_BG_list" id="TrStyleID" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">ѡ����ʽ</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="StyleID" runat="server" CssClass="form" Width="120px" ReadOnly="true"></asp:TextBox>
              &nbsp;
              <input class="form" type="button" value="ѡ����ʽ"  onclick="selectFile('style',document.ListLabel.StyleID,300,470);document.ListLabel.StyleID.focus();" /><span id="sapnStyleID"></span></td>
          </tr>
          <tr class="TR_BG_list" id="TrUserDefined" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">
            �Զ�����ʽ
            <div style="height:3px;margin:2px 0 4px 0;"></div>
            <input name="saveStyled" value="������ʽ" type="button" onclick="ShowStyle();" />
            <div id="showOther" style="display:none;">
            <div style="height:3px;border-bottom:1px dotted #999999;margin:2px 0 4px 0;"></div>
            <asp:TextBox ID="StyleName" Width="94px" runat="server"></asp:TextBox>
            <div style="height:3px;border-bottom:1px dotted #999999;margin:2px 0 4px 0;"></div>
            <asp:DropDownList ID="StyleClassID"  Width="100px" runat="server">
            </asp:DropDownList>
            <div style="height:3px;border-bottom:1px dotted #999999;margin:2px 0 4px 0;"></div>
            <input name="saveStyle" id="saveStyle" value="����" type="button" onclick="savePostStyle();" />
            <div id="sResultHTML" class="reshow"></div>
            </div>
            </td>
            <td width="79%" align="left" class="navi_link"> <div>
            
              <label id="style_base" runat="server" />
              <label id="style_class" runat="server" />
              <label id="style_special" runat="server" />                    
           
                   
          <asp:DropDownList ID="define" runat="server" Width="150px" onchange="javascript:setValue(this.value);">
          <asp:ListItem Value="">�Զ����ֶ�</asp:ListItem>
          </asp:DropDownList></div>
            <script type="text/javascript" language="JavaScript">
            window.onload = function()
                {
                var sBasePath = "../../editor/"
                var oFCKeditor = new FCKeditor('UserDefined') ;
                oFCKeditor.BasePath	= sBasePath ;
                oFCKeditor.Width = '100%' ;
                oFCKeditor.ToolbarSet = 'Foosun_Basicstyle';
                oFCKeditor.Height = '150' ;	
                oFCKeditor.ReplaceTextarea() ;
                }
            </script>
        <textarea rows="1" cols="1" name="UserDefined" style="display:none" id="UserDefined" ></textarea>
        <script language="javascript" type="text/javascript">
        function ShowStyle()
        {
            if(document.getElementById("showOther").style.display=="none")
            {
               document.getElementById("showOther").style.display="";
            }
        }
        function savePostStyle()
        {
            var saveStyle= document.getElementById("saveStyle");
            var sname=document.getElementById("StyleName");
            var StyleClassID=document.getElementById("StyleClassID");
            if(sname.value=="")
            {
                alert('����д��ʽ����');
                sname.focus();
                return false;
            }
            if(StyleClassID.value=="")
            {
                alert('��ѡ����࣬���û�з��࣬������ʽ�д���');
                return false;
            }
            var olEditor = FCKeditorAPI.GetInstance("UserDefined");
            var gtemproot = olEditor.GetXHTML(true);
            
            var url="SaveStyle.aspx"
            var actionstr="StyleName="+escape(sname.value)+"&ClassID="+escape(StyleClassID.value)+"&Content="+escape(gtemproot)+"";
            var divID = "sResultHTML";
            pubPostajax(url,actionstr,divID)
        }
        </script> 
        </td>
          </tr>  
          <tr class="TR_BG_list" style="display:none;" id="TrCols">
            <td align="right" class="navi_link" style="width: 28%">ÿ����ʾ������</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="Cols" runat="server" CssClass="form" Width="190px"></asp:TextBox><span id="spanCols"></span></td>
          </tr>          
          <tr class="TR_BG_list" style="display:none;" id="TrDescType">
            <td align="right" class="navi_link" style="width: 28%">����ʲô����</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="DescType" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">��ѡ������ʽ</asp:ListItem>
                <asp:ListItem Value="id">�Զ����</asp:ListItem>
                <asp:ListItem Value="date">�������</asp:ListItem>
                <asp:ListItem Value="click">�������</asp:ListItem>
                <asp:ListItem Value="pop">Ȩ��</asp:ListItem>
              </asp:DropDownList></td>
          </tr>
          <tr class="TR_BG_list" style="display:none;" id="TrDesc">
            <td align="right" class="navi_link" style="width: 28%">����˳��</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="Desc" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">��ѡ������˳��</asp:ListItem>
                <asp:ListItem Value="desc">desc(����)</asp:ListItem>
                <asp:ListItem Value="asc">asc(����)</asp:ListItem>
              </asp:DropDownList></td>
          </tr>
          <tr class="TR_BG_list" style="display:none;" id="TrisDiv">
            <td align="right" class="navi_link" style="width: 28%">�����ʽ</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="isDiv" runat="server" CssClass="form" Width="200px" onchange="javascript:selectisDiv(this.value);">
                <asp:ListItem Value="">��ѡ�������ʽ</asp:ListItem>
                <asp:ListItem Value="false">Table</asp:ListItem>
                <asp:ListItem Value="true">Div</asp:ListItem>
              </asp:DropDownList></td>
          </tr>
         <tr class="TR_BG_list" id="TrulID" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">DIV��ul����ID</td>
            <td width="79%" align="left" class="navi_link"> 
                <asp:TextBox ID="ulID" runat="server" CssClass="form" Width="190px"></asp:TextBox></td>
          </tr>
          <tr class="TR_BG_list" id="TrulClass" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">DIV��ul����Class</td>
            <td width="79%" align="left" class="navi_link">
                <asp:TextBox ID="ulClass" runat="server" CssClass="form" Width="190px"></asp:TextBox></td>
          </tr>          
          <tr class="TR_BG_list" style="display:none;" id="TrisPic">
            <td align="right" class="navi_link" style="width: 28%">����ͼƬ</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="isPic" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">��ѡ���Ƿ����</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
                <asp:ListItem Value="false">��</asp:ListItem>
              </asp:DropDownList></td>
          </tr>          
          <tr class="TR_BG_list" style="display:none;" id="TrTitleNumer">
            <td align="right" class="navi_link" style="width: 28%">������ʾ����</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="TitleNumer" runat="server" CssClass="form" Width="190px"></asp:TextBox><span id="spanTitleNumer"></span></td>
          </tr>
          <tr class="TR_BG_list" style="display:none;" id="TrContentNumber">
            <td align="right" class="navi_link" style="width: 28%">���ݽ�ȡ����</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="ContentNumber" runat="server" CssClass="form" Width="190px"></asp:TextBox><span id="spanContentNumber"></span></td>
          </tr>
          <tr class="TR_BG_list" style="display:none;" id="TrNaviNumber">
            <td align="right" class="navi_link" style="width: 28%">������ȡ����</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="NaviNumber" runat="server" CssClass="form" Width="190px"></asp:TextBox><span id="spanNaviNumber"></span></td>
          </tr>          
         <tr class="TR_BG_list" style="display:none;" id="TrSubNews">
            <td align="right" class="navi_link" style="width: 28%">�Ƿ������(��)����</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="SubNews" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">��ѡ���Ƿ����</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
                <asp:ListItem Value="false">��</asp:ListItem>
              </asp:DropDownList></td>
          </tr>  
          
          <tr class="TR_BG_list" style="display:none;" id="TrCSS">
            <td align="right" class="navi_link" style="width: 28%">CSS��ʽ</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="CSS" runat="server" CssClass="form" Width="190px"></asp:TextBox><span id="span1"></span></td>
          </tr>          

          <tr class="TR_BG_list" style="display:none;" id="TrShowDateNumer">
            <td align="right" class="navi_link" style="width: 28%">��ʾ�������ڵ���Ϣ</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="ShowDateNumer" runat="server" CssClass="form" Width="190px"></asp:TextBox><span id="spanShowDateNumer"></span></td>
          </tr>          
         <tr class="TR_BG_list" style="display:none;" id="TrGroupClassID">
            <td align="right" class="navi_link" style="width: 28%">������</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="GroupClassID" runat="server" CssClass="form" Width="200px">
              </asp:DropDownList></td>
          </tr>            
         <tr class="TR_BG_list" style="display:none;" id="TrGroupType">
            <td align="right" class="navi_link" style="width: 28%">��ʾ����</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="GroupType" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">��ѡ����ʾ����</asp:ListItem>
                <asp:ListItem Value="hot">�ȵ�</asp:ListItem>
                <asp:ListItem Value="click">���</asp:ListItem>
                <asp:ListItem Value="Mmore">����</asp:ListItem>
                <asp:ListItem Value="Last">���½���</asp:ListItem>
              </asp:DropDownList></td>
          </tr>             
         <tr class="TR_BG_list" style="display:none;" id="TrShowM">
            <td align="right" class="navi_link" style="width: 28%">��ʾ����</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="ShowM" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">��ѡ���Ƿ���ʾ����</asp:ListItem>
                <asp:ListItem Value="true">��ʾ</asp:ListItem>
                <asp:ListItem Value="false">����ʾ</asp:ListItem>
              </asp:DropDownList></td>
          </tr> 
        
          <tr class="TR_BG_list">
            <td align="right" class="navi_link" style="width: 28%"></td>
            <td width="79%" align="left" class="navi_link">&nbsp;<input class="form" type="button" value=" ȷ �� "  onclick="javascript:ReturnDivValue();" />&nbsp;<input class="form" type="button" value=" �� �� "  onclick="javascript:CloseDiv();" /></td>
          </tr> 

        </table>
    </form>
</body>
</html>
<script language="javascript" type="text/javascript">
function selectLabelType(type)
{
    allhide();
    switch(type)
    {
        case "UserLogin":
            document.getElementById("TrLoginP").style.display="";
            document.getElementById("aTrStyleID").style.display="none";
            document.getElementById("TrCSS").style.display="none";
            document.getElementById("TrFormCSS").style.display="";
            document.getElementById("TrLoginCSS").style.display="";
            document.getElementById("TrRegCSS").style.display="";
            document.getElementById("TrPassCSS").style.display="";
            break;
        case "TopUser":
            document.getElementById("TrNumber").style.display="";
            document.getElementById("TrTopUserType").style.display="";
            document.getElementById("TrPointParam").style.display="";
            document.getElementById("TrShowNavi").style.display="";
            document.getElementById("TrCSS").style.display="";
            document.getElementById("aTrStyleID").style.display="none";
            document.getElementById("TrFormCSS").style.display="none";    
            document.getElementById("TrLoginCSS").style.display="none";
            document.getElementById("TrRegCSS").style.display="none";
            document.getElementById("TrPassCSS").style.display="none";
            break;
        case "LastComm":
            document.getElementById("TrNumber").style.display="";
            document.getElementById("TrTitleNumer").style.display="";
            document.getElementById("TrShowNavi").style.display="";
            document.getElementById("TrCSS").style.display="";
            document.getElementById("TrShowDate").style.display="";
            document.getElementById("aTrStyleID").style.display="none";
            document.getElementById("TrFormCSS").style.display="none";
            document.getElementById("TrLoginCSS").style.display="none";
            document.getElementById("TrRegCSS").style.display="none";
            document.getElementById("TrPassCSS").style.display="none";
            break;
        case "NewUser":
            document.getElementById("TrNumber").style.display="";
            document.getElementById("TrShowNavi").style.display="";
            document.getElementById("TrCSS").style.display="";
            document.getElementById("TrShowDate").style.display="";
            document.getElementById("aTrStyleID").style.display="none";
            document.getElementById("TrFormCSS").style.display="none";
            document.getElementById("TrLoginCSS").style.display="none";
            document.getElementById("TrRegCSS").style.display="none";
            document.getElementById("TrPassCSS").style.display="none";
            break;
        case "ConstrNews":
            document.getElementById("TrNumber").style.display="";
            document.getElementById("TrClassId").style.display="";
            document.getElementById("TrCols").style.display="";
            document.getElementById("TrDesc").style.display="";
            document.getElementById("TrDescType").style.display="";
            document.getElementById("TrisDiv").style.display="";
            document.getElementById("TrisPic").style.display="";
            document.getElementById("TrTitleNumer").style.display="";
            document.getElementById("TrContentNumber").style.display="";
            document.getElementById("TrNaviNumber").style.display="";
            document.getElementById("TrSubNews").style.display="";
            document.getElementById("TrShowDateNumer").style.display="";
            document.getElementById("TrShowNavi").style.display="none";
            document.getElementById("TrRoot").style.display="";
            document.getElementById("TrStyleID").style.display="";
            document.getElementById("aTrStyleID").style.display="none";
            document.getElementById("TrCSS").style.display="none";
            document.getElementById("TrFormCSS").style.display="none";
            document.getElementById("TrLoginCSS").style.display="none";
            document.getElementById("TrRegCSS").style.display="none";
            document.getElementById("TrPassCSS").style.display="none";
            break;
        case "GroupMember":
            document.getElementById("TrNumber").style.display="";
            document.getElementById("TrShowNavi").style.display="";
            document.getElementById("TrGroupClassID").style.display="";
            document.getElementById("TrCols").style.display="";
            document.getElementById("TrGroupType").style.display="";
            document.getElementById("TrisDiv").style.display="";
            document.getElementById("TrTitleNumer").style.display="";
            document.getElementById("TrShowM").style.display="";
            document.getElementById("TrCSS").style.display="";
            document.getElementById("aTrStyleID").style.display="none";
            document.getElementById("TrGroupClassID").style.display="none";
            document.getElementById("TrFormCSS").style.display="none";
            document.getElementById("TrLoginCSS").style.display="none";
            document.getElementById("TrRegCSS").style.display="none";
            document.getElementById("TrPassCSS").style.display="none";
            break;
        default:
            break;    
    }
}

function allhide()
{
    document.getElementById("aTrStyleID").style.display="none";
    document.getElementById("TrLoginP").style.display="none";
    document.getElementById("TrShowDate").style.display="none";
    document.getElementById("TrNumber").style.display="none";
    document.getElementById("TrTopUserType").style.display="none";
    document.getElementById("TrShowNavi").style.display="none";
    document.getElementById("TrPointParam").style.display="none";
    document.getElementById("TrNaviPic").style.display="none";
    document.getElementById("TrClassId").style.display="none";
    document.getElementById("TrCols").style.display="none";
    document.getElementById("TrDescType").style.display="none";
    document.getElementById("TrDesc").style.display="none";
    document.getElementById("TrisDiv").style.display="none";
    document.getElementById("TrulID").style.display="none";
    document.getElementById("TrulClass").style.display="none";
    document.getElementById("TrisPic").style.display="none";
    document.getElementById("TrTitleNumer").style.display="none";
    document.getElementById("TrContentNumber").style.display="none";
    document.getElementById("TrNaviNumber").style.display="none";
    document.getElementById("TrSubNews").style.display="none";
    document.getElementById("TrShowDateNumer").style.display="none";
    document.getElementById("TrGroupClassID").style.display="none";
    document.getElementById("TrGroupType").style.display="none";
    document.getElementById("TrShowM").style.display="none";
    document.getElementById("TrRoot").style.display="none";
    document.getElementById("TrStyleID").style.display="none";
    document.getElementById("TrUserDefined").style.display="none";
    document.getElementById("TrCSS").style.display="none";
    document.getElementById("TrNaviCSS").style.display="none";
    document.getElementById("TrFormCSS").style.display="none";
    document.getElementById("TrLoginCSS").style.display="none";
    document.getElementById("TrRegCSS").style.display="none";
}

function selectShowNavi(type)
{
    if(type=="4")
    { 
        document.getElementById("TrNaviPic").style.display=""; 
        document.getElementById("TrNaviCSS").style.display="none";
     }
    else
    { 
        if(type=="")
        {
            document.getElementById("TrNaviPic").style.display="none";
            document.getElementById("TrNaviCSS").style.display="none";
        }
        else
        {
            document.getElementById("TrNaviPic").style.display="none";
            document.getElementById("TrNaviCSS").style.display="";
        }
    }
}
function selectisDiv(type)
{
    if(type=="true")
        { document.getElementById("TrulID").style.display="";document.getElementById("TrulClass").style.display=""; }
    else
        { document.getElementById("TrulID").style.display="none";document.getElementById("TrulClass").style.display="none"; }    
}
function CloseDiv()
{
    parent.document.getElementById("LabelDivid").style.display="none";
}

function checkIsNull(obj,spanobj,error)
{
    if(obj.value=="")
    {
        spanobj.innerHTML="<span class=reshow>(*)"+error+"</spna>";
        return true;
    }
    return false;
}
function checkIsNumber(obj,spanobj,error)
{
    var re = /^[0-9]*$$/;
    if(re.test(obj.value)==false)
    {
        spanobj.innerHTML="<span class=reshow>(*)"+error+"</spna>";
        return true;
    }
    return false;
}
function selectRoot(type)
{
    if(type=="false")
        { document.getElementById("TrStyleID").style.display="none";document.getElementById("TrUserDefined").style.display="";  }
    else
        { document.getElementById("TrStyleID").style.display="";document.getElementById("TrUserDefined").style.display="none";  }
}
function ReturnDivValue()
{
    var CheckStr = true;
    var rvalue= "";
    var temproot = "";
    switch(document.ListLabel.LabelType.value)
    {
        case "UserLogin":
            //if(checkIsNull(document.ListLabel.LoginP,document.getElementById("spanLoginP"),"��ѡ����ʾ��ʽ"))
            //    CheckStr=false;
            if(document.ListLabel.LoginP.value==""&&document.ListLabel.aStyleID.value=="")
            {
                document.getElementById("spanLoginP").innerHTML="<span style='color:red'>��ʾ��ʽ��������ʽ����һ��</span>";
                CheckStr=false;
            }
            rvalue="[FS:unLoop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=UserLogin,FS:LoginP=" + document.ListLabel.LoginP.value;
            if(document.ListLabel.FormCSS.value!=""){ rvalue += ",FS:FormCSS=" + document.ListLabel.FormCSS.value; }
            if(document.ListLabel.LoginCSS.value!=""){ rvalue += ",FS:LoginCSS=" + document.ListLabel.LoginCSS.value; }
            if(document.ListLabel.RegCSS.value!=""){ rvalue += ",FS:RegCSS=" + document.ListLabel.RegCSS.value; }
            if(document.ListLabel.PassCSS.value!=""){ rvalue += ",FS:PassCSS=" + document.ListLabel.PassCSS.value; }
            if(document.ListLabel.aStyleID.value!=""){ rvalue += ",FS:StyleID=" + document.ListLabel.aStyleID.value; }
            rvalue += "][/FS:unLoop]";
            if(CheckStr)
	            parent.getValue(rvalue);
	            
            break;
        case "TopUser":
            if(checkIsNumber(document.ListLabel.Number,document.getElementById("spanNumber"),"ѭ����Ŀֻ��Ϊ������"))
                CheckStr=false;        
            rvalue = "[FS:Loop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=" + document.ListLabel.LabelType.value;
            
            if(document.ListLabel.Number.value!=""){ rvalue += ",FS:Number=" + document.ListLabel.Number.value; }
            if(document.ListLabel.TopUserType.value!=""){ rvalue += ",FS:TopUserType=" + document.ListLabel.TopUserType.value; }
            if(document.ListLabel.ShowNavi.value!=""){ rvalue += ",FS:ShowNavi=" + document.ListLabel.ShowNavi.value; }
            if(document.ListLabel.ShowNavi.value!=""&&document.ListLabel.ShowNavi.value!="4"){ rvalue += ",FS:NaviCSS=" + document.ListLabel.NaviCSS.value; }
            if(document.ListLabel.ShowNavi.value=="4")
                { if(document.ListLabel.NaviPic.value!=""){ rvalue += ",FS:NaviPic=" + document.ListLabel.NaviPic.value; } }
            if(document.ListLabel.CSS.value!=""){ rvalue += ",FS:CSS=" + document.ListLabel.CSS.value; }
            if(document.ListLabel.PointParam.value!=""){ rvalue += ",FS:PointParam=" + document.ListLabel.PointParam.value; } 
            rvalue += "][/FS:Loop]";
            if(CheckStr)
	            parent.getValue(rvalue);
	            
            break;
            
        case "LastComm":
            if(checkIsNumber(document.ListLabel.Number,document.getElementById("spanNumber"),"ѭ����Ŀֻ��Ϊ������"))
                CheckStr=false;        
            rvalue = "[FS:Loop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=" + document.ListLabel.LabelType.value;
            
            if(document.ListLabel.Number.value!=""){ rvalue += ",FS:Number=" + document.ListLabel.Number.value; }
            if(document.ListLabel.ShowNavi.value!=""){ rvalue += ",FS:ShowNavi=" + document.ListLabel.ShowNavi.value; }
            if(document.ListLabel.TitleNumer.value!=""){ rvalue += ",FS:TitleNumer=" + document.ListLabel.TitleNumer.value; }
            if(document.ListLabel.ShowNavi.value!=""&&document.ListLabel.ShowNavi.value!="4"){ rvalue += ",FS:NaviCSS=" + document.ListLabel.NaviCSS.value; }
            if(document.ListLabel.ShowNavi.value=="4")
                { if(document.ListLabel.NaviPic.value!=""){ rvalue += ",FS:NaviPic=" + document.ListLabel.NaviPic.value; } }
            if(document.ListLabel.CSS.value!=""){ rvalue += ",FS:CSS=" + document.ListLabel.CSS.value; }
            if(document.ListLabel.ShowDate.value!=""){ rvalue += ",FS:ShowDate=" + document.ListLabel.ShowDate.value; }
            rvalue += "][/FS:Loop]";
            
            if(CheckStr)
	            parent.getValue(rvalue);
	            
            break;
        case "NewUser":
            if(checkIsNumber(document.ListLabel.Number,document.getElementById("spanNumber"),"ѭ����Ŀֻ��Ϊ������"))
                CheckStr=false;        
            rvalue = "[FS:Loop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=" + document.ListLabel.LabelType.value;
            
            if(document.ListLabel.Number.value!=""){ rvalue += ",FS:Number=" + document.ListLabel.Number.value; }
            if(document.ListLabel.ShowDate.value!=""){ rvalue += ",FS:ShowDate=" + document.ListLabel.ShowDate.value; }
            if(document.ListLabel.ShowNavi.value!=""){ rvalue += ",FS:ShowNavi=" + document.ListLabel.ShowNavi.value; }
            if(document.ListLabel.ShowNavi.value!=""&&document.ListLabel.ShowNavi.value!="4"){ rvalue += ",FS:NaviCSS=" + document.ListLabel.NaviCSS.value; }
            if(document.ListLabel.ShowNavi.value=="4")
                { if(document.ListLabel.NaviPic.value!=""){ rvalue += ",FS:NaviPic=" + document.ListLabel.NaviPic.value; } }
            if(document.ListLabel.CSS.value!=""){ rvalue += ",FS:CSS=" + document.ListLabel.CSS.value; }
            rvalue += "][/FS:Loop]";
        
            if(CheckStr)
	            parent.getValue(rvalue);
	                    
            break;
        case "ConstrNews":
            if(checkIsNumber(document.ListLabel.Number,document.getElementById("spanNumber"),"ѭ����Ŀֻ��Ϊ������"))
                CheckStr=false;        
            if(checkIsNumber(document.ListLabel.Cols,document.getElementById("spanCols"),"ÿ����ʾ����ֻ��Ϊ������"))
                CheckStr=false;
            if(checkIsNumber(document.ListLabel.TitleNumer,document.getElementById("spanTitleNumer"),"������ʾ����ֻ��Ϊ������"))
                CheckStr=false;
            if(checkIsNumber(document.ListLabel.ContentNumber,document.getElementById("spanContentNumber"),"���ݽ�ȡ����ֻ��Ϊ������"))
                CheckStr=false;
            if(checkIsNumber(document.ListLabel.NaviNumber,document.getElementById("spanNaviNumber"),"������ȡ����ֻ��Ϊ������"))
                CheckStr=false;
            if(checkIsNumber(document.ListLabel.ShowDateNumer,document.getElementById("spanShowDateNumer"),"��ʾ����������ֻ��Ϊ������"))
                CheckStr=false;
            if(document.ListLabel.Root.value=="true")
            {
               if(checkIsNull(document.ListLabel.StyleID,document.getElementById("sapnStyleID"),"��ѡ����ʽ"))
                CheckStr=false;
            }   
                         
            rvalue = "[FS:Loop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=" + document.ListLabel.LabelType.value;
            if(document.ListLabel.Root.value=="true")
                { temproot = "[#FS:StyleID=" + document.ListLabel.StyleID.value+"]"; }
            else
                { 
                    var oEditor = FCKeditorAPI.GetInstance("UserDefined");
                    temproot = oEditor.GetXHTML(true);
                }  
                          
            if(document.ListLabel.Number.value!=""){ rvalue += ",FS:Number=" + document.ListLabel.Number.value; }
            if(document.ListLabel.ClassId.value!="") { rvalue += ",FS:ClassID=" + document.ListLabel.ClassId.value }        
            if(document.ListLabel.Cols.value!=""){ rvalue += ",FS:Cols=" + document.ListLabel.Cols.value; }
            if(document.ListLabel.Desc.value!=""){ rvalue += ",FS:Desc=" + document.ListLabel.Desc.value; }
            if(document.ListLabel.DescType.value!=""){ rvalue += ",FS:DescType=" + document.ListLabel.DescType.value; }
            if(document.ListLabel.isDiv.value!=""){ rvalue += ",FS:isDiv=" + document.ListLabel.isDiv.value; }
            if(document.ListLabel.isDiv.value=="true")
            {
                if(document.ListLabel.ulID.value!=""){ rvalue += ",FS:ulID=" + document.ListLabel.ulID.value; }
                if(document.ListLabel.ulClass.value!=""){ rvalue += ",FS:ulClass=" + document.ListLabel.ulClass.value; }
            }
            if(document.ListLabel.isPic.value!=""){ rvalue += ",FS:isPic=" + document.ListLabel.isPic.value; }
            if(document.ListLabel.TitleNumer.value!=""){ rvalue += ",FS:TitleNumer=" + document.ListLabel.TitleNumer.value; }
            if(document.ListLabel.ContentNumber.value!=""){ rvalue += ",FS:ContentNumber=" + document.ListLabel.ContentNumber.value; }
            if(document.ListLabel.NaviNumber.value!=""){ rvalue += ",FS:NaviNumber=" + document.ListLabel.NaviNumber.value; }
            if(document.ListLabel.SubNews.value!=""){ rvalue += ",FS:SubNews=" + document.ListLabel.SubNews.value; }
            if(document.ListLabel.ShowDateNumer.value!=""){ rvalue += ",FS:ShowDateNumer=" + document.ListLabel.ShowDateNumer.value; }
            if(document.ListLabel.ShowNavi.value!=""){ rvalue += ",FS:ShowNavi=" + document.ListLabel.ShowNavi.value; }
            if(document.ListLabel.ShowNavi.value!=""&&document.ListLabel.ShowNavi.value!="4"){ rvalue += ",FS:NaviCSS=" + document.ListLabel.NaviCSS.value; }
            if(document.ListLabel.ShowNavi.value=="4")
                { if(document.ListLabel.NaviPic.value!=""){ rvalue += ",FS:NaviPic=" + document.ListLabel.NaviPic.value; } }
                
            rvalue += "]" + temproot + "[/FS:Loop]";
        
            if(CheckStr)
	            parent.getValue(rvalue);                
            
            break;
        case "GroupMember":
            if(checkIsNumber(document.ListLabel.Number,document.getElementById("spanNumber"),"ѭ����Ŀֻ��Ϊ������"))
                CheckStr=false;        
            if(checkIsNumber(document.ListLabel.Cols,document.getElementById("spanCols"),"ÿ����ʾ����ֻ��Ϊ������"))
                CheckStr=false;
            if(checkIsNumber(document.ListLabel.TitleNumer,document.getElementById("spanTitleNumer"),"������ʾ����ֻ��Ϊ������"))
                CheckStr=false;
                
            rvalue = "[FS:Loop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=" + document.ListLabel.LabelType.value;
            if(document.ListLabel.Number.value!=""){ rvalue += ",FS:Number=" + document.ListLabel.Number.value; }
            if(document.ListLabel.ShowNavi.value!=""){ rvalue += ",FS:ShowNavi=" + document.ListLabel.ShowNavi.value; }
            if(document.ListLabel.ShowNavi.value!=""&&document.ListLabel.ShowNavi.value!="4"){ rvalue += ",FS:NaviCSS=" + document.ListLabel.NaviCSS.value; }
            if(document.ListLabel.ShowNavi.value=="4")
                { if(document.ListLabel.NaviPic.value!=""){ rvalue += ",FS:NaviPic=" + document.ListLabel.NaviPic.value; } }
            if(document.ListLabel.Cols.value!=""){ rvalue += ",FS:Cols=" + document.ListLabel.Cols.value; }
            if(document.ListLabel.GroupType.value!=""){ rvalue += ",FS:GroupType=" + document.ListLabel.GroupType.value; }
            if(document.ListLabel.isDiv.value!=""){ rvalue += ",FS:isDiv=" + document.ListLabel.isDiv.value; }
            if(document.ListLabel.CSS.value!=""){ rvalue += ",FS:CSS=" + document.ListLabel.CSS.value; }
            if(document.ListLabel.isDiv.value=="true")
            {
                if(document.ListLabel.ulID.value!=""){ rvalue += ",FS:ulID=" + document.ListLabel.ulID.value; }
                if(document.ListLabel.ulClass.value!=""){ rvalue += ",FS:ulClass=" + document.ListLabel.ulClass.value; }
            }
            if(document.ListLabel.TitleNumer.value!=""){ rvalue += ",FS:TitleNumer=" + document.ListLabel.TitleNumer.value; }
            if(document.ListLabel.ShowM.value!=""){ rvalue += ",FS:ShowM=" + document.ListLabel.ShowM.value; }
            
            rvalue += "][/FS:Loop]";
        
            if(CheckStr)
	            parent.getValue(rvalue);
	            
            break;
        default:
	        parent.getValue("");
            break;    
    }
}
function getValue(value)
{
    var oEditor = FCKeditorAPI.GetInstance("UserDefined");
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
    var oEditor = FCKeditorAPI.GetInstance("UserDefined");
    if (oEditor.EditMode==FCK_EDITMODE_WYSIWYG)
    {
       oEditor.InsertHtml('{#FS:define='+value+'} ');
    }
    else
    {
    return false;
    }
}
function selectDisWay(value)
{
    if(value=="0")
    {
        aTrStyleID.style.display="block";
    }
    else
    {
        aTrStyleID.style.display="none";
    }
}
</script>
