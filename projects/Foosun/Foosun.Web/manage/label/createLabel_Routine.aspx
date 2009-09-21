<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_label_createLabel_Routine" Codebehind="createLabel_Routine.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<link href="../../sysImages/<% Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.showCSSdiv {left:18px;top:8px;background:#FFFFE1 repeat-x left top;border:1px double #4F4F4F;text-align:left;padding-left:8px;padding-top:8px;padding-bottom:12px;padding-right:8px;clip:rect(auto, auto, auto, auto);}	
</style>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/jsPublic.js"></script>
<script type="text/javascript" src="../../editor/fckeditor.js"></script>
<script language="javascript" type="text/javascript">
    function getColorOptions()
    {
        var color= new Array("00","33","66","99","CC","FF");
        for (var i=0;i<color.length ;i++ )
        {
	        for (var j=0;j<color.length ;j++ )
	        {
		        for (var k=0;k<color.length ;k++ )
		        {
			        if(k==0&&j==0&&i==0)
			        document.write('<option style="background:#'+color[j]+color[k]+color[i]+'" value="'+color[j]+color[k]+color[i]+'" selected>����</option>');
			        else
			        document.write('<option style="background:#'+color[j]+color[k]+color[i]+'" value="'+color[j]+color[k]+color[i]+'"></option>');
		        }
	        }
        }
    }
</script>
</head>
<body>
    <form id="ListLabel" runat="server">
	<table width="98%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="2"></td>
  </tr>
</table>
      <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="showCSSdiv" id="showCSSdivtable" style="display:none;">
        <tr>
          <td align="center"><span id="showCSSdiv"><img src="../../sysImages/Label/preview/ClassInfo.gif" border="0"></span></td>
        </tr>
      </table>
      <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
          <tr class="TR_BG_list">
            <td align="right" class="navi_link" style="width: 28%">��ǩ����</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="LabelType" runat="server" Width="200px" CssClass="form" onchange="javascript:selectLabelType(this.value);">
                <asp:ListItem Value="">��ѡ���ǩ����</asp:ListItem>
                <asp:ListItem Value="unRule">����������</asp:ListItem>
                <asp:ListItem Value="Position">λ�õ���</asp:ListItem>
                <asp:ListItem Value="PageTitle">ҳ�����</asp:ListItem>
                <asp:ListItem Value="Search">����</asp:ListItem>
                <%--<asp:ListItem Value="Stat">����ͳ��</asp:ListItem>--%>
                <asp:ListItem Value="FlashFilt">Flash�õ�Ƭ</asp:ListItem>
                <asp:ListItem Value="NorFilt">�ֻ��õ�Ƭ</asp:ListItem>
                <asp:ListItem Value="Sitemap">վ���ͼ</asp:ListItem>
                <asp:ListItem Value="TodayPic">ͼƬͷ��</asp:ListItem>
                <asp:ListItem Value="TodayWord">����ͷ��</asp:ListItem>
                <asp:ListItem Value="CorrNews">�������</asp:ListItem>
                <asp:ListItem Value="Metakey">Meta�ؼ���</asp:ListItem>
                <asp:ListItem Value="MetaDesc">Meta����</asp:ListItem>
                <asp:ListItem Value="CopyRight">��Ȩ��Ϣ</asp:ListItem>
                <asp:ListItem Value="History">�鵵��ѯ</asp:ListItem>
                <asp:ListItem Value="SiteNavi">��վ����</asp:ListItem>
                <asp:ListItem Value="ClassNavi">��Ŀ����</asp:ListItem>
                <asp:ListItem Value="ClassNaviRead">��Ŀ����</asp:ListItem>
                <asp:ListItem Value="SpecialNavi">ר�⵼��</asp:ListItem>
                <asp:ListItem Value="SpeicalNaviRead">ר�⵼��</asp:ListItem>
                <asp:ListItem Value="RSS">RSS</asp:ListItem>
               <%--  <asp:ListItem Value="HTML">�Զ���ҳ��</asp:ListItem>--%>
                <asp:ListItem Value="TopNews">��������</asp:ListItem>
                <asp:ListItem Value="">=====��չ��ǩ======</asp:ListItem>
			<%-- <asp:ListItem Value="unRuleBlock">���������</asp:ListItem>--%>
                 <asp:ListItem Value="HistoryIndex">��ʷ��ҳ��ѯ</asp:ListItem>
                <%-- <asp:ListItem Value="HotTag">���ű�ǩ</asp:ListItem>--%>
				</asp:DropDownList>
				</td>
          </tr>
          <tr class="TR_BG_list" style="display:none;" id="TrRoot">
            <td align="right" class="navi_link" style="width: 28%">������ʽ</td>
            <td width="79%" align="left" class="navi_link">
            <asp:DropDownList ID="Root" runat="server" CssClass="form" Width="200px" onchange="javascript:selectRoot(this.value);">
                <asp:ListItem Value="true">�̶���ʽ</asp:ListItem>
                <asp:ListItem Value="false">�Զ�����ʽ</asp:ListItem>
              </asp:DropDownList></td>
          </tr>
          <tr class="TR_BG_list" style="display:none;" id="TrStyleID">
            <td align="right" class="navi_link" style="width: 28%">������ʽ</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="StyleID" runat="server" CssClass="form" Width="120px" ReadOnly="true"></asp:TextBox>
              &nbsp;<input class="form" type="button" value="ѡ����ʽ"  onclick="selectFile('style',document.ListLabel.StyleID,300,470);document.ListLabel.StyleID.focus();" /><span id="sapnStyleID"></span></td>
          </tr>
          <tr class="TR_BG_list" id="TrUserDefined" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">
            <div style="margin:5px 0 5px 0;"><a style="color:blue;cursor:pointer;" onclick="selectFile('picEdit',document.getElementById('UserDefined'),320,500);" title="���ϴ���ʱ�����ڱ༭�������������Ҫ�ϴ�ͼƬ��λ�á�">ѡ��ͼƬ</a></div>
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
            <td width="79%" align="left" class="navi_link"><div>
              <label id="style_base" runat="server" />
              <label id="style_class" runat="server" />
              <label id="style_special" runat="server" />                    
              <asp:DropDownList ID="define" runat="server" CssClass="form" Width="150px" onchange="javascript:setValue(this.value);">
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
        function insertHTMLEdit(url)
            {
                var urls = url.replace('{@dirfile}','<% Response.Write(Foosun.Config.UIConfig.dirFile); %>')
                var oEditor = FCKeditorAPI.GetInstance("UserDefined");
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
          <tr class="TR_BG_list" style="display:none;" id="TrNumber">
            <td align="right" class="navi_link" style="width: 28%">ѭ������</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="Number" runat="server" CssClass="form" Width="190px" Text="3"></asp:TextBox>
                <span id="spanNumber"></span></td>
          </tr>    
         <tr class="TR_BG_list" style="display:none;" id="TrFlashType">
            <td align="right" class="navi_link" style="width: 28%">��ʾ��ʽ</td>
            <td width="79%" align="left" class="navi_link">
            <asp:DropDownList ID="FlashType" runat="server" CssClass="form" Width="200px" onchange="javascript:flashType(this.value);">
                <asp:ListItem Value="default">Ĭ����ʽ</asp:ListItem>
<%--                <asp:ListItem Value="sina">������ʽ</asp:ListItem>
                <asp:ListItem Value="paipai">������ʽһ</asp:ListItem>
                <asp:ListItem Value="msn">������ʽ��</asp:ListItem>
                <asp:ListItem Value="163">163������ʽ(�̶��߿��ͼƬ����)</asp:ListItem>
--%>              </asp:DropDownList>
           </td>
        </tr>          
         <tr class="TR_BG_list" style="display:none;" id="TrClassShow">
            <td align="right" class="navi_link" style="width: 28%">�Ƿ���ʾ��Ŀ����</td>
            <td width="79%" align="left" class="navi_link">
            <asp:CheckBox ID="ClassShow" runat="server" />
            </td>
        </tr> 
         <tr class="TR_BG_list" style="display:none;" id="TRMetaContent">
            <td align="right" class="navi_link" style="width: 28%">Meta��������</td>
            <td width="79%" align="left" class="navi_link">
            <asp:TextBox ID="MetaContent" Width="200px" MaxLength="100" runat="server"></asp:TextBox>
            </td>
        </tr> 
        
         <tr class="TR_BG_list" style="display:none;" id="TrClassCSS">
            <td align="right" class="navi_link" style="width: 28%">��ĿCSS</td>
            <td width="79%" align="left" class="navi_link">
            <asp:TextBox ID="ClassCSS" runat="server"></asp:TextBox>
            </td>
        </tr> 
         <tr class="TR_BG_list" style="display:none;" id="TrMainNewsShow">
            <td align="right" class="navi_link" style="width: 28%">�Ƿ���ʾ������</td>
            <td width="79%" align="left" class="navi_link">
            <asp:CheckBox ID="MainNewsShow" runat="server" />
            </td>
        </tr> 
         <tr class="TR_BG_list" style="display:none;" id="TrunRuleType">
            <td align="right" class="navi_link" style="width: 28%">��ʾ����</td>
            <td width="79%" align="left" class="navi_link">
            <asp:DropDownList ID="unRuleType" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="normal">��ͨ����</asp:ListItem>
                <asp:ListItem Value="rec">�Ƽ�����</asp:ListItem>
                <asp:ListItem Value="tt">ͷ������</asp:ListItem>
                <asp:ListItem Value="files">�и���</asp:ListItem>
                <asp:ListItem Value="vote">��ͶƱ</asp:ListItem>
                <asp:ListItem Value="picin">�л��л�</asp:ListItem>
                <asp:ListItem Value="pop">Ȩ������</asp:ListItem>
                <asp:ListItem Value="filt">�õ�</asp:ListItem>
                <asp:ListItem Value="pic">ͼƬ����</asp:ListItem>
                <asp:ListItem Value="hit">������</asp:ListItem>
                <asp:ListItem Value="comm">�������</asp:ListItem>
                <asp:ListItem Value="marquee">��������</asp:ListItem>
                <asp:ListItem Value="announce">��������</asp:ListItem>
                <asp:ListItem Value="jc">��������</asp:ListItem>
                <asp:ListItem Value="constr">Ͷ������</asp:ListItem>
              </asp:DropDownList>
            </td>
        </tr> 
                   
         <tr class="TR_BG_list" style="display:none;" id="TrSubNews">
            <td align="right" class="navi_link" style="width: 28%">������(��)����</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="SubNews" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">�Ƿ����</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
                <asp:ListItem Value="false">��</asp:ListItem>
              </asp:DropDownList></td>
        </tr>          
          <tr class="TR_BG_list" id="TrClassId" style="display:none;">
            <td align="right" class="navi_link" style="width:28%">��ĿID</td>
            <td align="left" class="navi_link"><asp:TextBox ReadOnly="true" ID="ClassName" runat="server" CssClass="form" Width="120px"></asp:TextBox>
              &nbsp;<input id="ClassId" type="hidden" />
              <img src="../../sysImages/folder/s.gif" style="cursor:pointer;" title="ѡ����Ŀ"  onclick="selectFile('newsclass',new Array(document.ListLabel.ClassId,document.ListLabel.ClassName),300,380);document.ListLabel.ClassName.focus();" />
              �������ͣ�<a href="javascript:void(0);" onclick="getType(-1);" class="reshow">����</a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="getType(0);" class="reshow">����Ӧ</a><br /><span style="color:Blue;">˵���������дΪ0����Ϊ�գ����ñ�ǩ������Ŀ�ķ�����������,���������Ŀ����������С����Ϊ-1����������еķ����������š�</span>
              </td>
          </tr>
          <tr class="TR_BG_list" id="TrSpecialID" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">ר����Ŀ</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="SpecialName" runat="server" CssClass="form" Width="120px" ReadOnly="true"></asp:TextBox><input id="SpecialID" type="hidden" />
              &nbsp;
              <%--<input class="form" type="button" value="ѡ��ר��"  onclick="selectFile('special',new Array(document.ListLabel.SpecialID,document.ListLabel.SpecialName),300,380);document.ListLabel.SpecialName.focus();" />--%>
          
          <img alt="" src="../../sysImages/folder/s.gif" style="cursor:pointer;" title="ѡ��ר��"  onclick="selectFile('special',new Array(document.ListLabel.SpecialID,document.ListLabel.SpecialName),300,380);document.ListLabel.SpecialName.focus();" />
           �������ͣ�<a href="javascript:void(0);" onclick="getTypeS(-1);" class="reshow">����</a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="getTypeS(0);" class="reshow">����Ӧ</a><br /><span style="color:Blue;">˵���������дΪ0����Ϊ�գ����ñ�ǩ����ר��ķ�����������,�������ר�⣬��������С����Ϊ-1����������еķ����������š�</span>
          </td>
          
          
          </tr>
          
          <tr class="TR_BG_list" style="display:none;" id="TrBigT">
            <td align="right" class="navi_link" style="width: 28%">��һ�����ô����</td>
            <td width="79%" align="left" class="navi_link"><asp:CheckBox ID="isBIGT" runat="server" onclick="getBigTitle();" />
                <span id="showBigS" style="display:none;">�������ʾ���� <asp:TextBox ID="bigTitleNumber" Text="20" runat="server"></asp:TextBox></span>
               <script type="text/javascript">
               function getBigTitle()
               {
                    if(document.getElementById("isBIGT").checked)
                   {
                        document.getElementById("showBigS").style.display="";
                   } 
                   else
                   {
                        document.getElementById("showBigS").style.display="none";
                   }
               }
               </script> 
            </td>
          </tr>  
                  
          <tr class="TR_BG_list" style="display:none;" id="TrBigCSS">
            <td align="right" class="navi_link" style="width: 28%">�����CSS</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="BIGCSS" runat="server" CssClass="form" Width="190px"></asp:TextBox></td>
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
                 
          <tr class="TR_BG_list" id="div_daohang" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">CSS</td>
            <td width="79%" align="left" class="navi_link">
             <asp:TextBox ID="daohangCSS" runat="server" CssClass="form" Width="190px"></asp:TextBox></td>
          </tr> 
          
          <tr class="TR_BG_list" id="div_daohangfg" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">�ָ��</td>
            <td width="79%" align="left" class="navi_link">
             <asp:TextBox ID="daohangfg" runat="server" CssClass="form" Width="190px"></asp:TextBox></td>
          </tr> 
          
          <tr class="TR_BG_list" style="display:none;" id="TrisPic">
            <td align="right" class="navi_link" style="width: 28%">����ͼƬ</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="isPic" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">��ѡ���Ƿ����</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
                <asp:ListItem Value="false">��</asp:ListItem>
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
          <tr class="TR_BG_list" id="TrShowNaviPic" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">����ͼƬ��ַ</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="NaviPic" runat="server" CssClass="form" Width="120px" ReadOnly="true"></asp:TextBox>
              &nbsp;
              <input class="form" type="button" value="ѡ��ͼƬ"  onclick="selectFile('pic',document.ListLabel.NaviPic,280,380);document.ListLabel.NaviPic.focus();" /></td>
          </tr> 
          <tr class="TR_BG_list" id="TrShowTitle" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">�Ƿ���ʾ����</td>
            <td width="79%" align="left" class="navi_link">
                <asp:DropDownList ID="ShowTitle" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">��ѡ���Ƿ���ʾ</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
                <asp:ListItem Value="false">��</asp:ListItem>
              </asp:DropDownList></td>
          </tr>   
          <tr class="TR_BG_list" style="display:none;" id="TrTitleNumer">
            <td align="right" class="navi_link" style="width: 28%">������ʾ����</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="TitleNumer" runat="server" CssClass="form" Width="190px"></asp:TextBox><span id="spanTitleNumer"></span></td>
          </tr>
          
          <tr class="TR_BG_list" style="display:none;" id="TrFlashSize">
            <td align="right" class="navi_link" style="width: 28%">ͼƬ�߿�</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="FlashSize" runat="server" CssClass="form" Width="190px"></asp:TextBox>��ʽ����|��</td>
          </tr>
          
          <tr class="TR_BG_list" style="display:none;" id="TrTarget">
            <td align="right" class="navi_link" style="width: 28%">�򿪷�ʽ</td>
            <td width="79%" align="left" class="navi_link">
            <asp:DropDownList ID="Target" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">��ѡ���Ƿ����</asp:ListItem>
                <asp:ListItem Value="_blank">�¿�</asp:ListItem>
                <asp:ListItem Value="_self">��ҳ</asp:ListItem>
              </asp:DropDownList></td>
          </tr>
          
          <tr class="TR_BG_list" style="display:none;" id="TrWNum">
            <td align="right" class="navi_link" style="width: 28%">��������</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="WNum" runat="server" CssClass="form" Width="190px"></asp:TextBox><span id="span1"></span></td>
          </tr>
          <tr class="TR_BG_list" style="display:none;" id="TrWCSS">
            <td align="right" class="navi_link" style="width: 28%">CSS</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="WCSS" runat="server" CssClass="form" Width="190px"></asp:TextBox><span id="span2"></span></td>
          </tr>
          <tr class="TR_BG_list" style="display:none;" id="TrContentNumber">
            <td align="right" class="navi_link" style="width: 28%">���ݽ�ȡ����</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="ContentNumber" runat="server" CssClass="form" Width="190px"></asp:TextBox><span id="spanContentNumber"></span></td>
          </tr>
          <tr class="TR_BG_list" style="display:none;" id="TrNaviNumber">
            <td align="right" class="navi_link" style="width: 28%">������ȡ����</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="NaviNumber" runat="server" CssClass="form" Width="190px"></asp:TextBox><span id="spanNaviNumber"></span></td>
          </tr>          
          <tr class="TR_BG_list" style="display:none;" id="TrShowDateNumer">
            <td align="right" class="navi_link" style="width: 28%">��ʾ�������ڵ���Ϣ</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="ShowDateNumer" runat="server" CssClass="form" Width="190px"></asp:TextBox><span id="spanShowDateNumer"></span></td>
          </tr>          
          <tr class="TR_BG_list" style="display:none;" id="TrisSub">
            <td align="right" class="navi_link" style="width: 28%">�Ƿ��������</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="isSub" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">��ѡ���Ƿ����</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
                <asp:ListItem Value="false">��</asp:ListItem>
              </asp:DropDownList></td>
          </tr>
          
          <tr class="TR_BG_list" style="display:none;" id="TrSTitle">
            <td align="right" class="navi_link" style="width: 28%">��ʾ���������ű���</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="STitle" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">��ʾ���������ű���</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
                <asp:ListItem Value="false">��</asp:ListItem>
              </asp:DropDownList></td>
          </tr> 
          <tr class="TR_BG_list" id="TrunNavi" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">�������ֻ�ͼƬ</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="unNavi" runat="server" CssClass="form" Width="200px" Text=""></asp:TextBox>
            <img src="../../sysImages/folder/s.gif" style="cursor:pointer;" title="ѡ��ͼƬ"  onclick="selectFile('pic',document.ListLabel.unNavi,380,400);document.ListLabel.unNavi.focus();" />
            <br />
                ���ΪͼƬ����ֱ������ͼƬ��ַ��
            </td>
          </tr> 
          <tr class="TR_BG_list" style="display:none;" id="TrRuleID">
            <td align="right" class="navi_link" style="width: 28%">����������ID</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="RuleID" runat="server" CssClass="form" Width="200px">
              </asp:DropDownList><span id="SpanRuleID"></span></td>
          </tr>          
          <tr class="TR_BG_list" id="TrPositionValue" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">λ�õ���</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="PositionValue" runat="server" CssClass="form" Width="200px" Text="[FS:unLoop,FS:SiteID=0,FS:LabelType=Position][/FS:unLoop]" ReadOnly="true"></asp:TextBox></td>
          </tr>            
          <tr class="TR_BG_list"  id="TrSearchType" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">��������</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="SearchType" runat="server" CssClass="form" Width="200px" onchange="javascript:showdateclass(this.value);">
                <asp:ListItem Value="">��ѡ����������</asp:ListItem>
                <asp:ListItem Value="true">�߼�����</asp:ListItem>
                <asp:ListItem Value="false">һ������</asp:ListItem>
              </asp:DropDownList><span id="sapnSearchType"></span></td>
          </tr>          
          <tr class="TR_BG_list" id="TrShowDate" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">��������</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="ShowDate" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">��ѡ���Ƿ���ʾ</asp:ListItem>
                <asp:ListItem Value="true">��ʾ</asp:ListItem>
                <asp:ListItem Value="false">����ʾ</asp:ListItem>
              </asp:DropDownList></td>
          </tr>              
          <tr class="TR_BG_list" id="TrShowClass" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">��ʾ��Ŀ</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="ShowClass" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">��ѡ���Ƿ���ʾ</asp:ListItem>
                <asp:ListItem Value="true">��ʾ</asp:ListItem>
                <asp:ListItem Value="false">����ʾ</asp:ListItem>
              </asp:DropDownList></td>
          </tr>          
          <tr class="TR_BG_list" id="TrShowUser" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">�Ƿ�ͳ���û���Ϣ</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="ShowUser" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">��ѡ���Ƿ�ͳ��</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
                <asp:ListItem Value="false">��</asp:ListItem>
              </asp:DropDownList></td>
          </tr>               
          <tr class="TR_BG_list" id="TrShowNews" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">�Ƿ�ͳ����������</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="ShowNews" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">��ѡ���Ƿ�ͳ��</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
                <asp:ListItem Value="false">��</asp:ListItem>
              </asp:DropDownList></td>
          </tr>           
          <tr class="TR_BG_list"  id="TrStatShowClass" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">�Ƿ�ͳ����Ŀ����</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="StatShowClass" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">��ѡ���Ƿ�ͳ��</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
                <asp:ListItem Value="false">��</asp:ListItem>
              </asp:DropDownList></td>
          </tr>          
          <tr class="TR_BG_list" id="TrShowAPI" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">�Ƿ���ʾAPIͳ����Ϣ</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="ShowAPI" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">��ѡ���Ƿ���ʾ</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
                <asp:ListItem Value="false">��</asp:ListItem>
              </asp:DropDownList></td>
          </tr>           
          <tr class="TR_BG_list" id="TrFlashweight" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">Flash���</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="Flashweight" runat="server" CssClass="form" Width="200px"></asp:TextBox><span id="spanFlashweight"></span></td>
          </tr>           
          <tr class="TR_BG_list" id="TrFlashheight" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">Flash�߶�</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="Flashheight" runat="server" CssClass="form" Width="200px"></asp:TextBox><span id="spanFlashheight"></span></td>
          </tr>           
          <tr class="TR_BG_list" id="TrFlashBG" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">FLASH������ɫ</td>
            <td width="79%" align="left" class="navi_link"><select name="FlashBG" id="FlashBG" style="width:200px;" class="form"><script language="javascript" type="text/javascript">getColorOptions();</script></select></td>
          </tr>            
        
          <tr class="TR_BG_list" id="TrTXTheight" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">�ı��߶�</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="TXTheight" runat="server" CssClass="form" Width="200px"></asp:TextBox><span id="spanTXTheight"></span></td>
          </tr>            
          <tr class="TR_BG_list" id="TrisSubCols" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">����ÿ����ʾ����</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="isSubCols" runat="server" CssClass="form" Width="200px"></asp:TextBox><span id="spanisSubCols"></span></td>
          </tr>            
          <tr class="TR_BG_list"  id="TrMapTitleCSS" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">����CSS</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="MapTitleCSS" runat="server" CssClass="form" Width="200px"></asp:TextBox></td>
          </tr>            
          <tr class="TR_BG_list" id="TrSubCSS" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">����CSS</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="SubCSS" runat="server" CssClass="form" Width="200px"></asp:TextBox></td>
          </tr>           
          <tr class="TR_BG_list" id="TrMapp" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">��ʾ��ʽ</td>
            <td width="79%"  align="left" class="navi_link"><asp:DropDownList ID="Mapp" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">��ѡ����ʾ��ʽ</asp:ListItem>
                <asp:ListItem Value="true" Selected="true">����</asp:ListItem>
                <asp:ListItem Value="false">����</asp:ListItem>
              </asp:DropDownList>��Ŀ��������������ã�����ǰ̨ģ��CSS�п���li�����Կ��ƺ���������</td>
          </tr>            
          <tr class="TR_BG_list" id="TrMapNavi" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">���⵼��</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="MapNavi" runat="server" CssClass="form" Width="200px" onchange="javascript:selectMapNavi(this.value);">
                <asp:ListItem Value="">��ѡ����⵼��</asp:ListItem>
                <asp:ListItem Value="true">����</asp:ListItem>
                <asp:ListItem Value="false">ͼƬ</asp:ListItem>
              </asp:DropDownList></td>
          </tr>
          <tr class="TR_BG_list" id="TrMapNaviText" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">�����ı�</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="MapNaviText" runat="server" CssClass="form" Width="200px"></asp:TextBox></td>
          </tr> 
          <tr class="TR_BG_list" id="TrNaviPic" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">����ͼƬ��ַ</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="MapNaviPic" runat="server" CssClass="form" Width="120px" ReadOnly="true"></asp:TextBox>
              &nbsp;
              <input class="form" type="button" value="ѡ��ͼƬ"  onclick="selectFile('pic',document.ListLabel.MapNaviPic,280,380);document.ListLabel.MapNaviPic.focus();" /></td>
          </tr> 
         <tr class="TR_BG_list" id="TrMapsubNavi" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">���ർ��</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="MapsubNavi" runat="server" CssClass="form" Width="200px" onchange="javascript:selectMapsubNavi(this.value);">
                <asp:ListItem Value="">��ѡ�����ർ��</asp:ListItem>
                <asp:ListItem Value="true">����</asp:ListItem>
                <asp:ListItem Value="false">ͼƬ</asp:ListItem>
              </asp:DropDownList></td>
        </tr>  
          <tr class="TR_BG_list" id="TrMapsubNaviText" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">�����ı�</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="MapsubNaviText" runat="server" CssClass="form" Width="200px"></asp:TextBox></td>
          </tr> 
          <tr class="TR_BG_list" id="TrMapsubNaviPic" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">����ͼƬ��ַ</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="MapsubNaviPic" runat="server" CssClass="form" Width="120px" ReadOnly="true"></asp:TextBox>
              &nbsp;
              <input class="form" type="button" value="ѡ��ͼƬ"  onclick="selectFile('pic',document.ListLabel.MapsubNaviPic,280,380);document.ListLabel.MapsubNaviPic.focus();" /></td>
          </tr>           
         <tr class="TR_BG_list"  id="TrIsDate" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">�Ƿ�����������ѯ</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="IsDate" runat="server" CssClass="form" Width="200px" onchange="javascript:IndexOrDate(this.value);">
                <asp:ListItem Value="true">��</asp:ListItem>
                <asp:ListItem Value="false">��</asp:ListItem>
              </asp:DropDownList></td>
        </tr>            
         <tr class="TR_BG_list" id="TrHistoryShowDate" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">�Ƿ���ʾ����</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="HistoryShowDate" runat="server" CssClass="form" Width="200px" onchange="javascript:IndexOrDate1(this.value);">
                <asp:ListItem Value="true">��</asp:ListItem>
                <asp:ListItem Value="false" Selected="True">��</asp:ListItem>
              </asp:DropDownList>
              ����������ѯΪ"��"���������Ч
           </td>
        </tr> 
          <tr class="TR_BG_list" id="TrClassTitleNumber" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">��Ŀ������ʾ����</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="ClassTitleNumber" runat="server" CssClass="form" Width="200px"></asp:TextBox><span id="spanClassTitleNumber"></span></td>
          </tr>           
          <tr class="TR_BG_list" id="TrClassNaviTitleNumber" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">��Ŀ��������</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="ClassNaviTitleNumber" runat="server" CssClass="form" Width="200px"></asp:TextBox><span id="spanClassNaviTitleNumber"></span></td>
          </tr>            
          <tr class="TR_BG_list" id="TrSpecialTitleNumber" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">ר��������ʾ����</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="SpecialTitleNumber" runat="server" CssClass="form" Width="200px"></asp:TextBox><span id="spanSpecialTitleNumber"></span></td>
          </tr>           
          <tr class="TR_BG_list" id="TrSpecialNaviTitleNumber" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">ר�⵼������</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="SpecialNaviTitleNumber" runat="server" CssClass="form" Width="200px"></asp:TextBox><span id="spanSpecialNaviTitleNumber"></span></td>
          </tr>            
         <tr class="TR_BG_list" id="TrTopNewsTyper" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">��������</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="TopNewsType" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">��ѡ����������</asp:ListItem>
                <asp:ListItem Value="Hour">24Сʱ����</asp:ListItem>
                <asp:ListItem Value="YesDay">��������</asp:ListItem>
                <asp:ListItem Value="Week">������</asp:ListItem>
                <asp:ListItem Value="Month">������</asp:ListItem>
                <asp:ListItem Value="Comm">��������</asp:ListItem>
                <asp:ListItem Value="disc">������</asp:ListItem>
             </asp:DropDownList></td>
        </tr> 
        <tr class="TR_BG_list" id="TrTopCommType" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">��������</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="TopCommType" runat="server" CssClass="form" Width="200px">
                <asp:ListItem Value="">��ѡ����������</asp:ListItem>
                <asp:ListItem Value="Hour">24Сʱ����</asp:ListItem>
                <asp:ListItem Value="YesDay">��������</asp:ListItem>
                <asp:ListItem Value="Week">������</asp:ListItem>
                <asp:ListItem Value="Month">������</asp:ListItem>
                <asp:ListItem Value="Comm">��������</asp:ListItem>
                <asp:ListItem Value="disc">������</asp:ListItem>
             </asp:DropDownList></td>
        </tr> 
        <tr class="TR_BG_list" id="TrTodayPicID" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">ѡ��ͼƬͷ��</td>
            <td width="79%" align="left" class="navi_link">
            <asp:DropDownList ID="TodayPicID" runat="server" CssClass="form" Width="200px">
             </asp:DropDownList><span id="spanTodayPicID"></span>
             <br />
             <asp:CheckBox ID="TCHECK" Text="ѡ��ͼƬͷ���ĸ�����(������ͷ�����Ƽ�����)" runat="server" />
             <div id="todayIDdiv">
             ��������<asp:TextBox ID="TNUM" runat="server" CssClass="form" Width="50px"></asp:TextBox> <br />
             
             </div>
          </td>
        </tr>
          
          <tr class="TR_BG_list" id="TrChar" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">ÿ�����ŵĿ�ʼ�ַ�</td>
            <td width="79%" align="left" class="navi_link">
                <asp:TextBox ID="TSCHAR" runat="server" CssClass="form" Width="50px"></asp:TextBox>�����ַ���<asp:TextBox ID="TECHAR" runat="server" CssClass="form" Width="50px"></asp:TextBox>
            </td>
          </tr>            

          <tr class="TR_BG_list" id="Trprefix" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">ѡ��ǰ��׺����</td>
            <td width="79%" align="left" class="navi_link">
                <asp:DropDownList ID="prefix" runat="server">
                <asp:ListItem Value="0">ǰ׺</asp:ListItem>
                <asp:ListItem Value="1">��׺</asp:ListItem>
                </asp:DropDownList>
                ǰ��׺�ַ�<asp:TextBox ID="prefixchar" runat="server" CssClass="form" Width="100px"></asp:TextBox>
            </td>
          </tr>    
                  
          <tr class="TR_BG_list" id="TrDynChar" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">��̬���÷ָ��</td>
            <td width="79%" align="left" class="navi_link">
            <asp:TextBox ID="DynChar" runat="server" CssClass="form" Width="100px" Text=""></asp:TextBox> ����Ǿ�̬���ã����������
            </td>
          </tr>   
          
          <tr class="TR_BG_list">
            <td align="right" class="navi_link" style="width: 28%"></td>
            <td width="79%" align="left" class="navi_link">&nbsp;<input class="form" type="button" value=" ȷ �� "  onclick="javascript:ReturnDivValue();" id="Button1" />&nbsp;<input class="form" type="button" value=" �� �� "  onclick="javascript:CloseDiv();" /></td>
          </tr>
      </table>
        <div id="showType"></div>
    </form>
</body>
</html>
<script language="javascript" type="text/javascript">
function CloseDiv()
{
    parent.document.getElementById("LabelDivid").style.display="none";
}
function selectisDiv(type)
{
    if(type=="true")
    {
        document.getElementById("TrulID").style.display="none";
        document.getElementById("TrulClass").style.display="none";
    }
    else
    {
        document.getElementById("TrulID").style.display="none";
        document.getElementById("TrulClass").style.display="none";
    }
}
function selectShowNavi(type)
{
    if(type=="4")
    {
        document.getElementById("TrShowNaviPic").style.display="";
    }
    else
    {
        document.getElementById("TrShowNaviPic").style.display="none";
    }
}
function selectRoot(type)
{
    if(type=="true")
    {
        document.getElementById("TrStyleID").style.display="";
        document.getElementById("TrUserDefined").style.display="none";
    }
    else
    {
        document.getElementById("TrStyleID").style.display="none";
        document.getElementById("TrUserDefined").style.display="";
    }
}
function selectShowTitle(type)
{
    if(type=="true")
    {
        document.getElementById("TrTXTheight").style.display="";
    }
    else
    {
        document.getElementById("TrTXTheight").style.display="none";
    }
}
function selectMapsubNavi(type)
{
    document.getElementById("TrMapsubNaviText").style.display="none";
    document.getElementById("TrMapsubNaviPic").style.display="none";
    switch (type)
    {
        case "true":
            document.getElementById("TrMapsubNaviText").style.display="";
            break;
        case "false":
            document.getElementById("TrMapsubNaviPic").style.display="";
            break;
        case "":
            break;
    }
}
function selectMapNavi(type)
{
    document.getElementById("TrMapNaviText").style.display="none";
    document.getElementById("TrNaviPic").style.display="none";
    switch (type)
    {
        case "true":
            document.getElementById("TrMapNaviText").style.display="";
            break;
        case "false":
            document.getElementById("TrNaviPic").style.display="";
            break;
        case "":
            break;
    }
}
function showdateclass(type)
{
    switch(type)
    {
        case "true":
            document.getElementById("TrShowDate").style.display="";
            document.getElementById("TrShowClass").style.display="";
            break;
        case "false":
            document.getElementById("TrShowDate").style.display="none";
            document.getElementById("TrShowClass").style.display="none";
            break;
        case "":
            document.getElementById("TrShowDate").style.display="none";
            document.getElementById("TrShowClass").style.display="none";
            break;
    }
}
function IndexOrDate(type)
{
    if(type=="true")
        document.ListLabel.HistoryShowDate.value="false";
    else
        document.ListLabel.HistoryShowDate.value="true";
}
function IndexOrDate1(type)
{
    if(type=="true")
        document.ListLabel.IsDate.value="false";
    else
        document.ListLabel.IsDate.value="true";
}

function ReturnDivValue()
{
    spanClear();
    var CheckStr=true;
    var temproot = "";
    var rvalue="";
    switch (document.ListLabel.LabelType.value)
    {
        case "unRule":
            if(checkIsNull(document.ListLabel.RuleID,document.getElementById("spanRuleID"),"��ѡ�񲻹�������"))
                CheckStr=false;
            rvalue = "[FS:unLoop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=unRule" ;
            rvalue += ",FS:RuleID="+document.ListLabel.RuleID.value;
            if(document.ListLabel.STitle.value!=""){ rvalue += ",FS:STitle=" + document.ListLabel.STitle.value; }
            if(document.ListLabel.unNavi.value!=""){ rvalue += ",FS:unNavi=" + document.ListLabel.unNavi.value; }
            rvalue += "][/FS:unLoop]" ;
            if(CheckStr)
	            parent.getValue(rvalue);
            break;
        case "Position":
            if(document.ListLabel.DynChar.value!="")
            { 
                rvalue += "[FS:unLoop,FS:SiteID=0,FS:LabelType=Position,FS:DynChar="+document.ListLabel.DynChar.value+"][/FS:unLoop]";
            }
            else
            {
                rvalue = document.ListLabel.PositionValue.value ;
            }
	        parent.getValue(rvalue);
            break;
        case "PageTitle":
            rvalue = "[FS:unLoop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=PageTitle" ;
            rvalue += ",FS:prefix="+document.ListLabel.prefix.value+"$"+document.ListLabel.prefixchar.value;
            rvalue += "][/FS:unLoop]" ;
	        parent.getValue(rvalue);
            break;
        case "Search":
            if(checkIsNull(document.ListLabel.SearchType,document.getElementById("sapnSearchType"),"��ѡ����������"))
                CheckStr=false;
            rvalue = "[FS:unLoop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=Search";   
            if(document.ListLabel.SearchType.value!=""){ rvalue += ",FS:SearchType=" + document.ListLabel.SearchType.value; }
            if(document.ListLabel.ShowDate.value!=""){ rvalue += ",FS:ShowDate=" + document.ListLabel.ShowDate.value; }
            if(document.ListLabel.ShowClass.value!=""){ rvalue += ",FS:ShowClass=" + document.ListLabel.ShowClass.value; }
            rvalue += "][/FS:unLoop]";
            if(CheckStr)
	            parent.getValue(rvalue);
            break;
        case "Stat":
            rvalue = "[FS:unLoop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=Stat";   
            if(document.ListLabel.ShowUser.value!=""){ rvalue += ",FS:ShowUser=" + document.ListLabel.ShowUser.value; }
            if(document.ListLabel.ShowNews.value!=""){ rvalue += ",FS:ShowNews=" + document.ListLabel.ShowNews.value; }
            if(document.ListLabel.StatShowClass.value!=""){ rvalue += ",FS:ShowClass=" + document.ListLabel.StatShowClass.value; }
            if(document.ListLabel.ShowAPI.value!=""){ rvalue += ",FS:ShowAPI=" + document.ListLabel.ShowAPI.value; }
            rvalue += "][/FS:unLoop]";
	        parent.getValue(rvalue);
            break;
        case "FlashFilt":
            if(parseInt(document.ListLabel.Number.value) > 6 || parseInt(document.ListLabel.Number.value) < 1)
            {
                document.getElementById("spanNumber").innerText = "������1-6������";
                CheckStr=false;
            }
            if(checkIsNull(document.ListLabel.Number,document.getElementById("spanNumber"),"ѭ����Ŀ����Ϊ��"))
                CheckStr=false;
            if(checkIsNumber(document.ListLabel.Number,document.getElementById("spanNumber"),"ѭ����Ŀֻ��Ϊ������"))
                CheckStr=false;
            if(checkIsNumber(document.ListLabel.Flashweight,document.getElementById("spanFlashweight"),"���ֻ��Ϊ������"))
                CheckStr=false;
            if(checkIsNumber(document.ListLabel.Flashheight,document.getElementById("spanFlashheight"),"�߶�ֻ��Ϊ������"))
                CheckStr=false;
            if(document.ListLabel.ShowTitle.value=="true")
            {
                if(checkIsNumber(document.ListLabel.TXTheight,document.getElementById("spanTXTheight"),"�ı��߶�ֻ��Ϊ������"))
                    CheckStr=false;
            }
            rvalue = "[FS:Loop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=FlashFilt";  
            rvalue += ",FS:FlashType=" + document.ListLabel.FlashType.value;;  
            if(document.ListLabel.Number.value!=""){ rvalue += ",FS:Number=" + document.ListLabel.Number.value; }
            if(document.ListLabel.ClassId.value!="") { rvalue += ",FS:ClassID=" + document.ListLabel.ClassId.value }                
            if(document.ListLabel.Flashweight.value!=""){ rvalue += ",FS:Flashweight=" + document.ListLabel.Flashweight.value; }
            if(document.ListLabel.Flashheight.value!=""){ rvalue += ",FS:Flashheight=" + document.ListLabel.Flashheight.value; }
            if(document.ListLabel.FlashBG.value!=""){ rvalue += ",FS:FlashBG=" + document.ListLabel.FlashBG.value; }
            if(document.ListLabel.ShowTitle.value!=""){ rvalue += ",FS:ShowTitle=" + document.ListLabel.ShowTitle.value; }
            if(document.ListLabel.isSub.value!=""){ rvalue += ",FS:isSub=" + document.ListLabel.isSub.value; }
            if(document.ListLabel.Target.value!=""){ rvalue += ",FS:Target=" + document.ListLabel.Target.value; }            
            if(document.ListLabel.ShowTitle.value=="true")
                { if(document.ListLabel.TXTheight.value!=""){ rvalue += ",FS:TXTheight=" + document.ListLabel.TXTheight.value; } }
            rvalue += "][/FS:Loop]";
            
            if(CheckStr)
	            parent.getValue(rvalue);
            break;
        case "NorFilt":
            rvalue = "[FS:Loop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=NorFilt";   
            if(document.ListLabel.WNum.value!=""){ rvalue += ",FS:Number=" + document.ListLabel.WNum.value; }
            if(document.ListLabel.ClassId.value!="") { rvalue += ",FS:ClassID=" + document.ListLabel.ClassId.value }                
            if(document.ListLabel.isSub.value!=""){ rvalue += ",FS:isSub=" + document.ListLabel.isSub.value; }
            if(document.ListLabel.Cols.value!=""){ rvalue += ",FS:Cols=" + document.ListLabel.Cols.value; }
            if(document.ListLabel.TitleNumer.value!=""){ rvalue += ",FS:TitleNumer=" + document.ListLabel.TitleNumer.value; }
            if(document.ListLabel.ContentNumber.value!=""){ rvalue += ",FS:ContentNumber=" + document.ListLabel.ContentNumber.value; }
            if(document.ListLabel.WCSS.value!=""){ rvalue += ",FS:WCSS=" + document.ListLabel.WCSS.value; }
            if(document.ListLabel.ShowTitle.value!=""){ rvalue += ",FS:ShowTitle=" + document.ListLabel.ShowTitle.value; }
            if(document.ListLabel.FlashSize.value!=""){ rvalue += ",FS:FlashSize=" + document.ListLabel.FlashSize.value; }            
            if(document.ListLabel.Target.value!=""){ rvalue += ",FS:Target=" + document.ListLabel.Target.value; }            
            rvalue += "][/FS:Loop]";
	        parent.getValue(rvalue);
            break;
        case "Sitemap":
            if(checkIsNumber(document.ListLabel.isSubCols,document.getElementById("spanisSubCols"),"��ʾ����ֻ��Ϊ������"))
                CheckStr=false;
            rvalue = "[FS:unLoop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=Sitemap";   
            if(document.ListLabel.isSubCols.value!=""){ rvalue += ",FS:isSubCols=" + document.ListLabel.isSubCols.value; }
            if(document.ListLabel.MapTitleCSS.value!=""){ rvalue += ",FS:MapTitleCSS=" + document.ListLabel.MapTitleCSS.value; }
            if(document.ListLabel.SubCSS.value!=""){ rvalue += ",FS:SubCSS=" + document.ListLabel.SubCSS.value; }
            if(document.ListLabel.Mapp.value!=""){ rvalue += ",FS:Mapp=" + document.ListLabel.Mapp.value; }
            if(document.ListLabel.MapNavi.value!=""){ rvalue += ",FS:MapNavi=" + document.ListLabel.MapNavi.value; }
            if(document.ListLabel.MapNavi.value=="true")
                { if(document.ListLabel.MapNaviText.value!=""){ rvalue += ",FS:MapNaviText=" + document.ListLabel.MapNaviText.value; } }
            else
                { if(document.ListLabel.MapNaviPic.value!=""){ rvalue += ",FS:MapNaviPic=" + document.ListLabel.MapNaviPic.value; } }
            if(document.ListLabel.MapsubNavi.value!=""){ rvalue += ",FS:MapsubNavi=" + document.ListLabel.MapsubNavi.value; }
            if(document.ListLabel.MapsubNavi.value=="true")
                { if(document.ListLabel.MapsubNaviText.value!=""){ rvalue += ",FS:MapsubNaviText=" + document.ListLabel.MapsubNaviText.value; } }
            else
                { if(document.ListLabel.MapsubNaviPic.value!=""){ rvalue += ",FS:MapsubNaviPic=" + document.ListLabel.MapsubNaviPic.value; } }
            rvalue += "][/FS:unLoop]";
            
            if(CheckStr)
	            parent.getValue(rvalue);
            break;
        case "TodayPic":
            rvalue = "[FS:unLoop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=TodayPic";   
            if(document.ListLabel.TodayPicID.value!=""){ rvalue += ",FS:TodayPicID=" + document.ListLabel.TodayPicID.value; }
            if(document.getElementById("TCHECK").checked)
            { 
                rvalue += ",FS:TodayPicID=" + document.ListLabel.TodayPicID.value; 
                
                if(document.ListLabel.TCHECK.checked==true)
                { 
                    rvalue += ",FS:TCHECK=true";
                    if(document.ListLabel.TNUM.value!=""){ rvalue += ",FS:TNUM=" + document.ListLabel.TNUM.value; }
                    if(document.ListLabel.TSCHAR.value!=""){ rvalue += ",FS:TSCHAR=" + document.ListLabel.TSCHAR.value; }
                    if(document.ListLabel.TECHAR.value!=""){ rvalue += ",FS:TECHAR=" + document.ListLabel.TECHAR.value; }
                }
            }
            rvalue += "][/FS:unLoop]";
	        parent.getValue(rvalue);
            break;
        case "TodayWord":
            rvalue = "[FS:unLoop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=TodayWord";   
            if(document.ListLabel.ClassId.value!="") { rvalue += ",FS:ClassID=" + document.ListLabel.ClassId.value }                
            if(document.getElementById("isBIGT").checked)
            {
                rvalue += ",FS:isBIGT=true"; 
                rvalue += ",FS:BigCSS=" + document.ListLabel.BIGCSS.value; 
                rvalue += ",FS:bigTitleNumber=" + document.ListLabel.bigTitleNumber.value; 
            }
            else
            {
                rvalue += ",FS:isBIGT=false"; 
            }
            var  vTSCHAR=document.ListLabel.TSCHAR.value;
            var  vTECHAR=document.ListLabel.TECHAR.value;
            if(document.ListLabel.TSCHAR.value!=""){ rvalue += ",FS:TSCHAR=" + vTSCHAR.replace("[","$#").replace("]","#$"); }
            if(document.ListLabel.TECHAR.value!=""){ rvalue += ",FS:TECHAR=" + vTECHAR.replace("[","$#").replace("]","#$"); }
            if(document.ListLabel.isSub.value!=""){ rvalue += ",FS:isSub=" + document.ListLabel.isSub.value; }
            if(document.ListLabel.Cols.value!=""){ rvalue += ",FS:Cols=" + document.ListLabel.Cols.value; }
            if(document.ListLabel.TitleNumer.value!=""){ rvalue += ",FS:TitleNumer=" + document.ListLabel.TitleNumer.value; }
            //if(document.ListLabel.ContentNumber.value!=""){ rvalue += ",FS:ContentNumber=" + document.ListLabel.ContentNumber.value; }
            if(document.ListLabel.WNum.value!=""){ rvalue += ",FS:WNum=" + document.ListLabel.WNum.value; }
            if(document.ListLabel.WCSS.value!=""){ rvalue += ",FS:WCSS=" + document.ListLabel.WCSS.value; }
            rvalue += "][/FS:unLoop]";
	        parent.getValue(rvalue);
            break;
        case "CorrNews":
            if(checkIsNull(document.ListLabel.Number,document.getElementById("spanNumber"),"ѭ����Ŀ����Ϊ��"))
                CheckStr=false;
            if(checkIsNumber(document.ListLabel.Number,document.getElementById("spanNumber"),"ѭ����Ŀֻ��Ϊ������"))
                CheckStr=false;
            if(checkIsNumber(document.ListLabel.Cols,document.getElementById("spanCols"),"ÿ����ʾ����ֻ��Ϊ������"))
                CheckStr=false;
            if(checkIsNumber(document.ListLabel.ShowDateNumer,document.getElementById("spanShowDateNumer"),"��ʾ����������ֻ��Ϊ������"))
                CheckStr=false;
            if(checkIsNumber(document.ListLabel.TitleNumer,document.getElementById("spanTitleNumer"),"������ʾ����ֻ��Ϊ������"))
                CheckStr=false;
            if(checkIsNumber(document.ListLabel.ContentNumber,document.getElementById("spanContentNumber"),"���ݽ�ȡ����ֻ��Ϊ������"))
                CheckStr=false;
            if(checkIsNumber(document.ListLabel.NaviNumber,document.getElementById("spanNaviNumber"),"������ȡ����ֻ��Ϊ������"))
                CheckStr=false;
            if(document.ListLabel.Root.value=="true")
            {
               if(checkIsNull(document.ListLabel.StyleID,document.getElementById("sapnStyleID"),"��ѡ����ʽ"))
                CheckStr=false;
            }
            rvalue = "[FS:Loop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=CorrNews";   
            if(document.ListLabel.Number.value!=""){ rvalue += ",FS:Number=" + document.ListLabel.Number.value; }
            if(document.ListLabel.Root.value=="true")
                { temproot = "[#FS:StyleID=" + document.ListLabel.StyleID.value+"]"; }
            else
                { 
                    var oEditor = FCKeditorAPI.GetInstance("UserDefined");
                    temproot = oEditor.GetXHTML(true);
                 }  
            if(document.ListLabel.SubNews.value!=""){ rvalue += ",FS:SubNews=" + document.ListLabel.SubNews.value; }
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
            if(document.ListLabel.isSub.value!=""){ rvalue += ",FS:isSub=" + document.ListLabel.isSub.value; }
            if(document.ListLabel.ShowDateNumer.value!=""){ rvalue += ",FS:ShowDateNumer=" + document.ListLabel.ShowDateNumer.value; }
//            if(document.ListLabel.ShowNavi.value!=""){ rvalue += ",FS:ShowNavi=" + document.ListLabel.ShowNavi.value; }
//            if(document.ListLabel.ShowNavi.value=="4")
//            { if(document.ListLabel.NaviPic.value!=""){ rvalue += ",FS:NaviPic=" + document.ListLabel.NaviPic.value; } }

            rvalue += "]";
            rvalue += temproot;
            rvalue += "[/FS:Loop]";
            
            if(CheckStr)
	            parent.getValue(rvalue);                        
            break;
        case "History":
            rvalue = "[FS:unLoop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=History";   
            if(document.ListLabel.IsDate.value!=""){ rvalue += ",FS:IsDate=" + document.ListLabel.IsDate.value; }
            if(document.ListLabel.HistoryShowDate.value!=""){ rvalue += ",FS:ShowDate=" + document.ListLabel.HistoryShowDate.value; }
            rvalue += "][/FS:unLoop]";
	        parent.getValue(rvalue);
           break;
        case "Metakey":
            rvalue = "[FS:unLoop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=Metakey,FS:MetaContent="+document.ListLabel.MetaContent.value+"][/FS:unLoop]";
	        parent.getValue(rvalue);
           break;
        case "MetaDesc":
            rvalue = "[FS:unLoop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=MetaDesc,FS:MetaContent="+document.ListLabel.MetaContent.value+"][/FS:unLoop]";
	        parent.getValue(rvalue);
           break;
        case "SpecialInfo":
            rvalue = "[FS:unLoop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=SpecialInfo]" + IDUserDefined.getXHTMLBody() + "[/FS:unLoop]";
	        parent.getValue(rvalue);
           break;
        case "SiteNavi":
            rvalue = "[FS:unLoop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=SiteNavi"; 
            if(document.ListLabel.daohangCSS.value!="") { rvalue += ",FS:NaviCSS=" + document.ListLabel.daohangCSS.value }                
            if(document.ListLabel.daohangfg.value!="") { rvalue += ",FS:NaviChar=" + document.ListLabel.daohangfg.value }  
            if(document.ListLabel.isDiv.value!=""){ rvalue += ",FS:isDiv=" + document.ListLabel.isDiv.value }  
            rvalue += "][/FS:unLoop]"
	        parent.getValue(rvalue);
            break;
        case "ClassNavi":
            rvalue = "[FS:unLoop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=ClassNavi";   
            if(document.ListLabel.ClassId.value!="") { rvalue += ",FS:ClassID=" + document.ListLabel.ClassId.value }                
            if(document.ListLabel.daohangCSS.value!="") { rvalue += ",FS:NaviCSS=" + document.ListLabel.daohangCSS.value } 
            //if(document.ListLabel.Mapp.value!="") { rvalue += ",FS:Mapp=" + document.ListLabel.Mapp.value } 
            if(document.ListLabel.daohangfg.value!="") { rvalue += ",FS:NaviChar=" + document.ListLabel.daohangfg.value }                
            rvalue += "][/FS:unLoop]"
	        parent.getValue(rvalue);
            break;
        case "ClassNaviRead":
            if(checkIsNumber(document.ListLabel.ClassTitleNumber,document.getElementById("spanClassTitleNumber"),"����ֻ��Ϊ������"))
                CheckStr=false;
            if(checkIsNumber(document.ListLabel.ClassNaviTitleNumber,document.getElementById("spanClassNaviTitleNumber"),"����ֻ��Ϊ������"))
                CheckStr=false;
            rvalue = "[FS:unLoop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=ClassNaviRead";
            if(document.ListLabel.ClassId.value!="") { rvalue += ",FS:ClassID=" + document.ListLabel.ClassId.value }                
            if(document.ListLabel.ClassTitleNumber.value!=""){ rvalue += ",FS:ClassTitleNumber=" + document.ListLabel.ClassTitleNumber.value; }
            if(document.ListLabel.ClassNaviTitleNumber.value!=""){ rvalue += ",FS:ClassNaviTitleNumber=" + document.ListLabel.ClassNaviTitleNumber.value; }
            rvalue += "][/FS:unLoop]"
            if(CheckStr)
	            parent.getValue(rvalue);
            break;
        case "SpecialNavi":
            rvalue = "[FS:unLoop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=SpecialNavi";   
            if(document.ListLabel.SpecialID.value!="") { rvalue += ",FS:SpecialID=" + document.ListLabel.SpecialID.value }                
            if(document.ListLabel.daohangCSS.value!="") { rvalue += ",FS:NaviCSS=" + document.ListLabel.daohangCSS.value }                
            if(document.ListLabel.daohangfg.value!="") { rvalue += ",FS:NaviChar=" + document.ListLabel.daohangfg.value } 
//            if(document.ListLabel.Mapp.value!="") { rvalue += ",FS:Mapp=" + document.ListLabel.Mapp.value } 
            rvalue += "][/FS:unLoop]"
	        parent.getValue(rvalue);
            break;
        case "SpeicalNaviRead":
            if(checkIsNumber(document.ListLabel.SpecialTitleNumber,document.getElementById("spanSpecialTitleNumber"),"����ֻ��Ϊ������"))
                CheckStr=false;
            if(checkIsNumber(document.ListLabel.SpecialNaviTitleNumber,document.getElementById("spanSpecialNaviTitleNumber"),"����ֻ��Ϊ������"))
                CheckStr=false;
            rvalue = "[FS:unLoop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=SpeicalNaviRead";
            if(document.ListLabel.SpecialID.value!="") { rvalue += ",FS:SpecialID=" + document.ListLabel.SpecialID.value }                
            if(document.ListLabel.SpecialTitleNumber.value!=""){ rvalue += ",FS:SpecialTitleNumber=" + document.ListLabel.SpecialTitleNumber.value; }
            if(document.ListLabel.SpecialNaviTitleNumber.value!=""){ rvalue += ",FS:SpecialNaviTitleNumber=" + document.ListLabel.SpecialNaviTitleNumber.value; }
            rvalue += "][/FS:unLoop]"
            if(CheckStr)
	            parent.getValue(rvalue);        
            break;
        case "RSS":
//            if(checkIsNull(document.ListLabel.Number,document.getElementById("spanNumber"),"ѭ����Ŀ����Ϊ��"))
//                CheckStr=false;
//            if(checkIsNumber(document.ListLabel.Number,document.getElementById("spanNumber"),"ѭ����Ŀֻ��Ϊ������"))
//                CheckStr=false;
//            if(checkIsNumber(document.ListLabel.TitleNumer,document.getElementById("spanTitleNumer"),"������ʾ����ֻ��Ϊ������"))
//                CheckStr=false;
            if(document.ListLabel.SpecialID.value!=""&&document.ListLabel.ClassId.value!="")
            {
                alert("ר�����Ŀֻ��ѡ��һ��");
                return false;
            }
            rvalue = "[FS:unLoop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=RSS";
//          if(document.ListLabel.Number.value!=""){ rvalue += ",FS:Number=" + document.ListLabel.Number.value; }
//          if(document.ListLabel.SpecialID.value!="") { rvalue += ",FS:SpecialID=" + document.ListLabel.SpecialID.value }                
            if(document.ListLabel.ClassId.value!="") { rvalue += ",FS:ClassID=" + document.ListLabel.ClassId.value }                
//          if(document.ListLabel.TitleNumer.value!=""){ rvalue += ",FS:TitleNumer=" + document.ListLabel.TitleNumer.value; }

            rvalue += "][/FS:unLoop]"
            if(CheckStr)
	            parent.getValue(rvalue);        
            break;
        case "HTML":
            rvalue = "[FS:unLoop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=HTML]" + IDUserDefined.getXHTMLBody() + "[/FS:unLoop]"
            parent.getValue(rvalue);        
            break;
		case "HistoryIndex":
            rvalue = "[FS:unLoop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=HistoryIndex][/FS:unLoop]"
            parent.getValue(rvalue);        
            break;
		case "HotTag":
            rvalue = "[FS:unLoop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=HotTag][/FS:unLoop]"
            parent.getValue(rvalue);        
            break;
        case "TopNews":
            if(checkIsNull(document.ListLabel.Number,document.getElementById("spanNumber"),"ѭ����Ŀ����Ϊ��"))
                CheckStr=false;
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
            if(document.ListLabel.Root.value=="true")
            {
               if(checkIsNull(document.ListLabel.StyleID,document.getElementById("sapnStyleID"),"��ѡ����ʽ"))
                CheckStr=false;
            } 
                   
            rvalue = "[FS:Loop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=TopNews";   
            if(document.ListLabel.Number.value!=""){ rvalue += ",FS:Number=" + document.ListLabel.Number.value; }
            if(document.ListLabel.Root.value=="true")
                { temproot = "[#FS:StyleID=" + document.ListLabel.StyleID.value+"#]"; }
            else
                { 
                    var oEditor = FCKeditorAPI.GetInstance("UserDefined");
                    temproot = oEditor.GetXHTML(true);
                 }  
            if(document.ListLabel.ClassId.value!="") { rvalue += ",FS:ClassID=" + document.ListLabel.ClassId.value }                
            if(document.ListLabel.TopNewsType.value!=""){ rvalue += ",FS:TopNewsType=" + document.ListLabel.TopNewsType.value; }
            if(document.ListLabel.SubNews.value!=""){ rvalue += ",FS:SubNews=" + document.ListLabel.SubNews.value; }
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
            if(document.ListLabel.isSub.value!=""){ rvalue += ",FS:isSub=" + document.ListLabel.isSub.value; }
//            if(document.ListLabel.ShowNavi.value!=""){ rvalue += ",FS:ShowNavi=" + document.ListLabel.ShowNavi.value; }
//            if(document.ListLabel.ShowNavi.value=="4")
//            { if(document.ListLabel.NaviPic.value!=""){ rvalue += ",FS:NaviPic=" + document.ListLabel.NaviPic.value; } }

            rvalue += "]";
            rvalue += temproot;
            rvalue += "[/FS:Loop]";
            
            if(CheckStr)
	            parent.getValue(rvalue);                                
            break;
        case "TopComm":
            if(checkIsNull(document.ListLabel.Number,document.getElementById("spanNumber"),"ѭ����Ŀ����Ϊ��"))
                CheckStr=false;
            if(checkIsNumber(document.ListLabel.Number,document.getElementById("spanNumber"),"ѭ����Ŀֻ��Ϊ������"))
                CheckStr=false;
            if(checkIsNumber(document.ListLabel.TitleNumer,document.getElementById("spanTitleNumer"),"������ʾ����ֻ��Ϊ������"))
                CheckStr=false;
            if(checkIsNumber(document.ListLabel.ContentNumber,document.getElementById("spanContentNumber"),"���ݽ�ȡ����ֻ��Ϊ������"))
                CheckStr=false;
            if(document.ListLabel.Root.value=="true")
            {
               if(checkIsNull(document.ListLabel.StyleID,document.getElementById("sapnStyleID"),"��ѡ����ʽ"))
                CheckStr=false;
            } 
                   
            rvalue = "[FS:Loop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=TopComm";   
            if(document.ListLabel.Number.value!=""){ rvalue += ",FS:Number=" + document.ListLabel.Number.value; }
            if(document.ListLabel.Root.value=="true")
                { temproot = "[#FS:StyleID=" + document.ListLabel.StyleID.value+"#]"; }
            else
                { 
                    var oEditor = FCKeditorAPI.GetInstance("UserDefined");
                    temproot = oEditor.GetXHTML(true);
                }  
            if(document.ListLabel.ClassId.value!="") { rvalue += ",FS:ClassID=" + document.ListLabel.ClassId.value }                
            if(document.ListLabel.TopCommType.value!=""){ rvalue += ",FS:TopCommType=" + document.ListLabel.TopCommType.value; }
            if(document.ListLabel.isDiv.value!=""){ rvalue += ",FS:isDiv=" + document.ListLabel.isDiv.value; }
            if(document.ListLabel.isDiv.value=="true")
            {
                if(document.ListLabel.ulID.value!=""){ rvalue += ",FS:ulID=" + document.ListLabel.ulID.value; }
                if(document.ListLabel.ulClass.value!=""){ rvalue += ",FS:ulClass=" + document.ListLabel.ulClass.value; }
            }
            if(document.ListLabel.TitleNumer.value!=""){ rvalue += ",FS:TitleNumer=" + document.ListLabel.TitleNumer.value; }
            if(document.ListLabel.ContentNumber.value!=""){ rvalue += ",FS:ContentNumber=" + document.ListLabel.ContentNumber.value; }
            if(document.ListLabel.isSub.value!=""){ rvalue += ",FS:isSub=" + document.ListLabel.isSub.value; }
//            if(document.ListLabel.ShowNavi.value!=""){ rvalue += ",FS:ShowNavi=" + document.ListLabel.ShowNavi.value; }
//            if(document.ListLabel.ShowNavi.value=="4")
//            { if(document.ListLabel.NaviPic.value!=""){ rvalue += ",FS:NaviPic=" + document.ListLabel.NaviPic.value; } }

            rvalue += "]";
            rvalue += temproot;
            rvalue += "[/FS:Loop]";
            
            if(CheckStr)
	            parent.getValue(rvalue);                                
            break;   
        case "unRuleBlock":
            rvalue = "[FS:Loop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=unRuleBlock";   
            if(document.ListLabel.Number.value!=""){ rvalue += ",FS:Number=" + document.ListLabel.Number.value; }
            if(document.ListLabel.ClassId.value!="") { rvalue += ",FS:ClassID=" + document.ListLabel.ClassId.value; }                
            if(document.getElementById("ClassShow").checked)
            { 
                rvalue += ",FS:ClassShow=true"; 
                if(document.ListLabel.ClassCSS.value!=""){rvalue += ",FS:ClassCSS=" + document.ListLabel.ClassCSS.value; }                
            }
            else
            {
                rvalue += ",FS:ClassShow=false"; 
            }
            rvalue += ",FS:unRuleType=" + document.ListLabel.unRuleType.value; 
            if(document.getElementById("MainNewsShow").checked)
            { 
                rvalue += ",FS:MainNewsShow=true"; 
            }
            else
            {
            rvalue += ",FS:MainNewsShow=false";
            }
            rvalue += "]";
            rvalue += "[/FS:Loop]";
	        parent.getValue(rvalue);                                
            break;   
            case "CopyRight":
            rvalue = "[FS:unLoop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=CopyRight][/FS:unLoop]";
            parent.getValue(rvalue);        
            break;
    }
}
function spanClear()
{
    var spanlist = "spanNumber,spanCols,spanTitleNumer,spanContentNumber,spanNaviNumber,spanShowDateNumer,sapnStyleID,SpanRuleID,spanFlashweight,spanFlashheight,spanTXTheight,spanisSubCols,spanClassTitleNumber,spanClassNaviTitleNumber,spanSpecialTitleNumber,spanSpecialNaviTitleNumber,spanTodayPicID,sapnSearchType";
    var arrlist = spanlist.split(',');
    for(var i=0;i<arrlist.length;i++)
    {
        document.getElementById(arrlist[i]).innerHTML="";
    }
}
function getdivstyle(obj)
{
	if(obj=="")
	{
		showCSSdiv.innerHTML="<img src=\"../../sysImages/Label/preview/ClassInfo.gif\" border=\"0\">";
		document.getElementById("showCSSdivtable").style.display="none";
	}
	else
	{
		showCSSdiv.innerHTML="<img src=\"../../sysImages/Label/preview/"+obj+".gif\" border=\"0\">";
		document.getElementById("showCSSdivtable").style.display="";
	}
}
function selectLabelType(type)
{
    var spanlist = "";
    spanlist = "TrNumber,TrSubNews,TrClassId,TrSpecialID,TrCols,TrDescType,TrDesc,TrisDiv,TrulID,TrulClass,TrisPic,TrTitleNumer,TrContentNumber,TrNaviNumber,TrShowDateNumer,TrisSub,TrRoot,TrStyleID,TrUserDefined,TrRuleID,TrPositionValue,TrSearchType,TrShowDate,TrShowClass,TrShowUser,TrShowNews,TrStatShowClass,TrShowAPI,TrFlashweight,TrFlashheight,TrFlashBG,TrShowTitle,TrTXTheight,TrisSubCols,TrMapTitleCSS,TrSubCSS,TrMapp,TrMapNavi,TrMapNaviText,TrNaviPic,TrMapsubNavi,TrMapsubNaviText,TrMapsubNaviPic,TrIsDate,TrHistoryShowDate,TrClassTitleNumber,TrClassNaviTitleNumber,TrSpecialTitleNumber,TrSpecialNaviTitleNumber,TrTopNewsTyper,TrTopCommType,TrTodayPicID,div_daohang,div_daohangfg,TrWNum,TrWCSS,TrBigT,TrBigCSS,TrChar,TrFlashType,TrClassShow,TrunRuleType,TrMainNewsShow,TrClassCSS,TrFlashSize,TrTarget,Trprefix,TRMetaContent,TrSTitle,TrunNavi,TrDynChar";
    showorhide(spanlist,false);
	getdivstyle(type);
    switch(type)
    {
        case "subList":
            spanlist="TrNumber,TrSubNews,TrClassId,TrCols,TrDescType,TrDesc,TrisDiv,TrisPic,TrTitleNumer,TrContentNumber,TrNaviNumber,TrShowDateNumer,TrRoot,TrStyleID";
            showorhide(spanlist,true);
            break;
        case "unRule":
            spanlist="TrRuleID,TrSTitle,TrunNavi";
            showorhide(spanlist,true);
            break;
        case "Metakey":
            spanlist="TRMetaContent";
            showorhide(spanlist,true);
            break;
        case "MetaDesc":
            spanlist="TRMetaContent";
            showorhide(spanlist,true);
            break;
        case "SpecialInfo":
            spanlist="TrStyleID,TrRoot";
            showorhide(spanlist,true);
            break;
        case "Position":
            spanlist="TrPositionValue,TrDynChar";
            showorhide(spanlist,true);
            break;
        case "PageTitle":
            spanlist="Trprefix";
            showorhide(spanlist,true);
            break;
        case "Search":
            spanlist="TrSearchType,TrShowDate,TrShowClass";
            showorhide(spanlist,true);
            break;
        case "Stat":
            spanlist="TrShowUser,TrShowNews,TrStatShowClass,TrShowAPI";
            showorhide(spanlist,true);
            break;
        case "FlashFilt":
            spanlist="TrNumber,TrClassId,TrFlashweight,TrFlashheight,TrFlashBG,TrShowTitle,TrisSub,TrFlashType";
            showorhide(spanlist,true);
            break;
        case "NorFilt":
            spanlist="TrClassId,TrWNum,TrWCSS,TrTitleNumer,TrisSub,TrShowTitle,TrFlashSize,TrTarget";
            showorhide(spanlist,true);
            break;
        case "Sitemap":
            spanlist="TrisSubCols,TrMapTitleCSS,TrSubCSS,TrMapp,TrMapNavi,TrMapsubNavi";
            showorhide(spanlist,true);
            break;
        case "TodayPic":
            spanlist="TrTodayPicID,TrChar";
            showorhide(spanlist,true);
            break;
        case "TodayWord":
            spanlist="TrClassId,TrChar,TrWNum,TrWCSS,TrCols,TrTitleNumer,TrisSub,TrBigT,TrBigCSS";
            showorhide(spanlist,true);
            break;
        case "CorrNews":
            spanlist="TrNumber,TrSubNews,TrCols,TrDescType,TrDesc,TrisDiv,TrisPic,TrTitleNumer,TrContentNumber,TrNaviNumber,TrisSub,TrShowDateNumer,TrRoot,TrStyleID";
            showorhide(spanlist,true);
            break;
        case "History":
            spanlist="TrIsDate,TrHistoryShowDate";
            showorhide(spanlist,true);
           break;
        case "SiteNavi":
            spanlist="div_daohang,div_daohangfg,TrisDiv";
            showorhide(spanlist,true);
            break;
        case "ClassNavi":
            spanlist="div_daohang,div_daohangfg,TrClassId";
            showorhide(spanlist,true);
            break;
        case "ClassNaviRead":
            spanlist="TrClassId,TrClassTitleNumber,TrClassNaviTitleNumber";
            showorhide(spanlist,true);
            break;
        case "SpecialNavi":
            spanlist="TrSpecialID,div_daohang,div_daohangfg";
            showorhide(spanlist,true);
            break;
        case "SpeicalNaviRead":
            spanlist="TrSpecialID,TrSpecialTitleNumber,TrSpecialNaviTitleNumber";
            showorhide(spanlist,true);
            break;
        case "RSS":
            //spanlist="TrNumber,TrClassId,TrSpecialID,TrTitleNumer";
            spanlist="TrClassId";
            showorhide(spanlist,true);
            break;
        case "HTML":
            spanlist="TrUserDefined";
            showorhide(spanlist,true);
            break;
        case "TopNews":
            spanlist="TrRoot,TrClassId,TrNumber,TrSubNews,TrCols,TrisDiv,TrisPic,TrTitleNumer,TrContentNumber,TrNaviNumber,TrisSub,TrTopNewsTyper,TrStyleID";
            showorhide(spanlist,true);
            break;
        case "TopComm":
            spanlist="TrRoot,TrTopCommType,TrClassId,TrNumber,TrisDiv,TrTitleNumer,TrContentNumber,TrisSub,TrStyleID";
            showorhide(spanlist,true);
            break;
        case "unRuleBlock":
            spanlist="TrNumber,TrClassId,TrClassShow,TrunRuleType,TrMainNewsShow,TrClassCSS";
            showorhide(spanlist,true);
            break;
        case "CopyRight":
            spanlist="";
            showorhide(spanlist,true);
            break;
    }
}
function showorhide(list,tf)
{
    var arrlist = list.split(',');
    if(tf==true)
    {
        for(var i=0;i<arrlist.length;i++)
        {
            document.getElementById(arrlist[i]).style.display="";
        }
    }
    else
    {
        for(var i=0;i<arrlist.length;i++)
        {
            document.getElementById(arrlist[i]).style.display="none";
        }
    }
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
       oEditor.InsertHtml('{#FS:define='+value+'}');
    }
    else
    {
    return false;
    }
}
function getType(value)
{
    document.getElementById("ClassId").value=value;
    if(value=="-1")
        document.getElementById("ClassName").value="��������";
    else
        document.getElementById("ClassName").value="����Ӧ";

}

function getTypeS(value)
{
    document.getElementById("SpecialID").value=value;
    if(value=="-1")
        document.getElementById("SpecialName").value="��������";
    else
        document.getElementById("SpecialName").value="����Ӧ";
}

</script>
