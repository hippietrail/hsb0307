<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_label_createLabel_Ultimate" Codebehind="createLabel_Ultimate.aspx.cs" %>
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
            <td align="right" class="navi_link" style="width:105px;">�б�����</td>
            <td align="left" class="navi_link"><asp:DropDownList ID="ListType" runat="server" Width="200px" CssClass="form" onchange="//javascript:selectListType(this.value);">
                <asp:ListItem Value="News">����</asp:ListItem>
                <asp:ListItem Value="Special">ר��</asp:ListItem>
              </asp:DropDownList></td>
          </tr>

          <tr class="TR_BG_list">
            <td align="right" class="navi_link" style="width:105px;">������ʽ</td>
            <td align="left" class="navi_link"><asp:DropDownList ID="Root" runat="server" CssClass="form" Width="100px" onchange="javascript:selectRoot(this.value);">
                <asp:ListItem Value="true">�̶���ʽ</asp:ListItem>
                <asp:ListItem Value="false">�Զ�����ʽ</asp:ListItem>
              </asp:DropDownList>
               <label id="TrStyleID">
               ������ʽ
              <asp:TextBox ID="StyleID" runat="server" CssClass="form" Width="120px" ReadOnly="true"></asp:TextBox>
              <img src="../../sysImages/folder/s.gif" style="cursor:pointer" title="ѡ����ʽ" onclick="selectFile('style',document.getElementById('StyleID'),240,550);document.ListLabel.StyleID.focus();" /><span id="sapnStyleID"></span>
              </label>
              </td>
          </tr>
          
          <tr class="TR_BG_list" id="TrUserDefined" style="display:none;">
            <td align="right" class="navi_link" style="width:105px;">
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
            <td align="left" class="navi_link">
            <div>
                  <label id="style_base" runat="server" />
                  <label id="style_class" runat="server" />
                  <label id="style_special" runat="server" />                 
                  <asp:DropDownList ID="define" CssClass="form" runat="server" Width="150px" onchange="javascript:setValue(this.value);">
                  <asp:ListItem Value="">�Զ����ֶ�</asp:ListItem>
                  </asp:DropDownList>
              </div>
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
        </div>
        </td>
          </tr>
          
          <tr class="TR_BG_list">
            <td align="right" class="navi_link" style="width:105px;">��������</td>
            <td align="left" class="navi_link">
            <asp:DropDownList ID="isSub" runat="server" CssClass="form" Width="100px">
                <asp:ListItem Value="">�Ƿ����</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
                <asp:ListItem Value="false">��</asp:ListItem>
              </asp:DropDownList>
               ����������
               <asp:DropDownList ID="SubNews" runat="server" CssClass="form" Width="100px">
                <asp:ListItem Value="">�Ƿ����</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
                <asp:ListItem Value="false">��</asp:ListItem>
              </asp:DropDownList>
              ���з�ʽ
              <asp:DropDownList ID="DescType" runat="server" CssClass="form" Width="100px">
                <asp:ListItem Value="">����ʽ</asp:ListItem>
                <asp:ListItem Value="id">�Զ����</asp:ListItem>
                <asp:ListItem Value="date">�������</asp:ListItem>
                <asp:ListItem Value="click">�������</asp:ListItem>
                <asp:ListItem Value="pop">Ȩ��</asp:ListItem>
                <asp:ListItem Value="digg">digg(����)</asp:ListItem>
              </asp:DropDownList>
            </td>
          </tr>

          <tr class="TR_BG_list">
            <td align="right" class="navi_link" style="width:105px;">����˳��</td>
            <td align="left" class="navi_link"><asp:DropDownList ID="Desc" runat="server" CssClass="form" Width="100px">
                <asp:ListItem Value="">����˳��</asp:ListItem>
                <asp:ListItem Value="desc">desc(����)</asp:ListItem>
                <asp:ListItem Value="asc">asc(����)</asp:ListItem>
              </asp:DropDownList>
              ����ͼƬ
               <asp:DropDownList ID="isPic" runat="server" CssClass="form" Width="100px">
                <asp:ListItem Value="">�Ƿ����</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
                <asp:ListItem Value="false">��</asp:ListItem>
              </asp:DropDownList>  
               �����ʽ
               <asp:DropDownList ID="isDiv" runat="server" CssClass="form" Width="100px" ><%--onchange="javascript:selectisDiv(this.value);"--%>
                <asp:ListItem Value="">�����ʽ</asp:ListItem>
                <asp:ListItem Value="false">Table</asp:ListItem>
                <asp:ListItem Value="true">Div</asp:ListItem>
              </asp:DropDownList>
              </td>
          </tr>

         <tr class="TR_BG_list" id="TrulID" style="display:none;">
            <td align="right" class="navi_link" style="width:105px;">DIV��ul����ID</td>
            <td align="left" class="navi_link"> 
                <asp:TextBox ID="ulID" runat="server" CssClass="form" Width="120px"></asp:TextBox>
                DIV��ul����Class  <asp:TextBox ID="ulClass" runat="server" CssClass="form" Width="120px"></asp:TextBox>
                </td>
          </tr>
          <tr class="TR_BG_list">
            <td align="right" class="navi_link" style="width:105px;">��������</td>
            <td align="left" class="navi_link">
            <asp:TextBox ID="TitleNumer" runat="server" CssClass="form" Width="50px"></asp:TextBox><span id="spanTitleNumer"></span>
            ��������<asp:TextBox ID="ContentNumber" runat="server" CssClass="form" Width="50px"></asp:TextBox><span id="spanContentNumber"></span>
            ��������<asp:TextBox ID="NaviNumber" runat="server" CssClass="form" Width="50px"></asp:TextBox><span id="spanNaviNumber"></span>
            ÿ����ʾ��<asp:TextBox ID="Cols" runat="server" CssClass="form" Width="50px"></asp:TextBox><span id="spanCols"></span>
            </td>
          </tr>
  
          <tr class="TR_BG_list" style="display:;">
            <td align="right" class="navi_link" style="width:105px;">�ڱ���ǰ�ӵ���</td>
            <td align="left" class="navi_link"><asp:DropDownList ID="ShowNavi" runat="server" CssClass="form" Width="120px" onchange="javascript:selectShowNavi(this.value);">
                <asp:ListItem Value="">�Ƿ�ӵ���</asp:ListItem>
                <asp:ListItem Value="1">���ֵ���(1,2,3...)</asp:ListItem>
                <asp:ListItem Value="2">��ĸ����(A,B,C...)</asp:ListItem>
                <asp:ListItem Value="3">��ĸ����(a,b,c...)</asp:ListItem>
                <asp:ListItem Value="4">�Զ���ͼƬ</asp:ListItem>
              </asp:DropDownList>
              <label id="TrNaviCSS" style="display:none;">����CSS��<asp:TextBox ID="NaviCSS" Width="80" CssClass="form" runat="server"></asp:TextBox></label>
                <label id="TrNaviPic" style="display:none;">
                ����ͼƬ��ַ<asp:TextBox ID="NaviPic" runat="server" CssClass="form" Width="150px" ReadOnly="true"></asp:TextBox>
                <img src="../../sysImages/folder/s.gif" title="ѡ��ͼƬ" style="cursor:pointer;"  onclick="selectFile('pic',document.ListLabel.NaviPic,280,380);document.ListLabel.NaviPic.focus();" />
                </label>
              </td>
          </tr>

          <tr class="TR_BG_list">
            <td align="right" class="navi_link" style="width:105px;">�Ƿ��ҳ</td>
            <td align="left" class="navi_link"><asp:DropDownList ID="isPage" runat="server" CssClass="form" Width="200px" onchange="javascript:selectPage(this.value);">
                <asp:ListItem Value="true">��ѡ���Ƿ��ҳ</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
                <asp:ListItem Value="false">��</asp:ListItem>
              </asp:DropDownList></td>
          </tr>
          <tr class="TR_BG_list" id="TrPageID">
            <td align="right" class="navi_link" style="width:105px;"><span id="spanPageID"></span>��ҳ��ʽ</td>
            <td align="left" class="navi_link"><asp:TextBox ID="PageID" runat="server" CssClass="form" Width="120px"></asp:TextBox>
              &nbsp;
              <input class="form" type="button" value="ѡ���ҳ��ʽ"  onclick="javascript:show('PageID',document.getElementById('spanPageID'),'ѡ���ҳ��ʽ',410,200);" /></td>
          </tr>
          <tr class="TR_BG_list">
            <td align="right" class="navi_link" style="width:105px">�в�������</td>
            <td align="left" class="navi_link">
             �����б���CSS��<asp:TextBox ID="css1" Width="50" CssClass="form" runat="server"></asp:TextBox>&nbsp;ż���б���CSS��<asp:TextBox ID="css2" CssClass="form" Width="50" runat="server"></asp:TextBox>
            </td>
          </tr>
          
          <tr class="TR_BG_list">
            <td align="right" class="navi_link" style="width:105px">���в�������</td>
            <td align="left" class="navi_link">
                <asp:DropDownList ID="brTF" runat="server" CssClass="form" Width="200px" onchange="javascript:selectTF(this.value);">
                <asp:ListItem Value="false">��ʾ����Ч��</asp:ListItem>
                <asp:ListItem Value="true">��</asp:ListItem>
                <asp:ListItem Value="false">��</asp:ListItem>
              </asp:DropDownList>
             </td>
          </tr>
          
          <tr class="TR_BG_list" id="divbrtf" style="display:none;">
            <td align="right" class="navi_link" style="width:105px">������в���</td>
            <td align="left" class="navi_link">
                <asp:TextBox ID="bfstr" Width="80%" CssClass="form" Text="0|5|CSS" runat="server"></asp:TextBox> ÿ������һ��������<br />
                <span class="reshow">
                ��ʽ��0|5|css,��һ��������ʾʹ����ʽ,��2����ʾ������Ϣʹ�ô�����,��3��������ʾ�������<br />
                0��ʾʹ��CSS��ʽ���磺0|5|tableCSS <br />
                1��ʾʹ��ʹ��ͼƬ���磺1|5|/templet/br.gif <br />
                2��ʾʹ��ʹ�����֣��磺2|5|----------------
                </span>
             </td>
          </tr>          
           <tr class="TR_BG_list">
            <td align="right" class="navi_link" style="width:105px;"></td>
            <td align="left" class="navi_link">&nbsp;<input class="form" type="button" value=" ȷ �� "  onclick="javascript:ReturnDivValue();" />&nbsp;<input class="form" type="button" value=" �� �� "  onclick="javascript:CloseDiv();" /></td>
          </tr>
          
        </table>
    </form>
</body>
</html>
<script language="javascript" type="text/javascript">

function selectisDiv(type)
{
    if(type=="true")
        { document.getElementById("TrulID").style.display="";  }     
    else
        { document.getElementById("TrulID").style.display="none"; }   
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
function selectRoot(type)
{
    if(type=="false")
        { document.getElementById("TrStyleID").style.display="none";document.getElementById("TrUserDefined").style.display="";  }
    else
        { document.getElementById("TrStyleID").style.display="";document.getElementById("TrUserDefined").style.display="none";  }
}
function selectPage(type)
{
    if(type=="false")
        { document.getElementById("TrPageID").style.display="none";  }
    else
        { document.getElementById("TrPageID").style.display=""; }
}
function selectTF(type)
{
    if(type=="false")
        { document.getElementById("divbrtf").style.display="none";  }
    else
        { document.getElementById("divbrtf").style.display=""; }
}

function CloseDiv()
{
    parent.document.getElementById("LabelDivid").style.display="none";
}

function spanClear()
{
    document.getElementById("spanCols").innerHTML="";
    document.getElementById("spanTitleNumer").innerHTML="";
    document.getElementById("spanContentNumber").innerHTML="";
    document.getElementById("spanNaviNumber").innerHTML="";
    document.getElementById("sapnStyleID").innerHTML="";
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

function ReturnDivValue()
{
    spanClear();
    var CheckStr=true;

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
    
    var rvalue="[FS:Loop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=ClassList";
    if(document.ListLabel.Root.value=="true")
        { temproot = "[#FS:StyleID=" + document.ListLabel.StyleID.value+"]"; }
    else
        {
                    var oEditor = FCKeditorAPI.GetInstance("UserDefined");
                    temproot = oEditor.GetXHTML(true);
         }
    rvalue += ",FS:ListType=" + document.ListLabel.ListType.value;

    if(document.ListLabel.isSub.value!=""){ rvalue += ",FS:isSub=" + document.ListLabel.isSub.value; }
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
    
    if(document.ListLabel.brTF.value=="true")
    {
        rvalue += ",FS:bfStr=" + document.ListLabel.bfstr.value; 
    }
    if(document.ListLabel.isPic.value!=""){ rvalue += ",FS:isPic=" + document.ListLabel.isPic.value; }
    if(document.ListLabel.TitleNumer.value!=""){ rvalue += ",FS:TitleNumer=" + document.ListLabel.TitleNumer.value; }
    if(document.ListLabel.ContentNumber.value!=""){ rvalue += ",FS:ContentNumber=" + document.ListLabel.ContentNumber.value; }
    if(document.ListLabel.NaviNumber.value!=""){ rvalue += ",FS:NaviNumber=" + document.ListLabel.NaviNumber.value; }
    if(document.ListLabel.ShowNavi.value!=""){ rvalue += ",FS:ShowNavi=" + document.ListLabel.ShowNavi.value; }
    if(document.ListLabel.ShowNavi.value=="4")
    { if(document.ListLabel.NaviPic.value!=""){ rvalue += ",FS:NaviPic=" + document.ListLabel.NaviPic.value; } }
    if(document.ListLabel.ShowNavi.value!=""&&document.ListLabel.ShowNavi.value!="4"){ rvalue += ",FS:NaviCSS=" + document.ListLabel.NaviCSS.value; }
    if(document.ListLabel.css1.value!=""&&document.ListLabel.css2.value!=""){ rvalue += ",FS:ColbgCSS=" + document.ListLabel.css1.value+"|"+document.ListLabel.css2.value; }
    if(document.ListLabel.isPage.value=="true")
    { if(document.ListLabel.PageID.value!=""){ rvalue += "," + document.ListLabel.PageID.value; } }
    rvalue += "]";
    rvalue += temproot;
    rvalue += "[/FS:Loop]";
    
    if(CheckStr)
	    parent.getValue(rvalue);
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
</script>