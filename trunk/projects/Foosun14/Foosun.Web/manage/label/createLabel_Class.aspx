<%@ Page Language="C#" AutoEventWireup="true" Codebehind="createLabel_Class.aspx.cs"
    Inherits="Foosun.Web.manage.label.createLabel_Class" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../../sysImages/<% Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css"
        rel="stylesheet" type="text/css" />

    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>

    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>

    <script language="JavaScript" type="text/javascript" src="../../configuration/js/jsPublic.js"></script>

    <script type="text/javascript" src="../../editor/fckeditor.js"></script>

    <script type="text/javascript">
function getType()
{
    document.getElementById("ClassName").value="自适应";
    return;
}

    </script>

</head>
<body>
    <form id="ListLabel" runat="server">
        <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF"
            class="table">
            <tr class="TR_BG_list" id="TrClassId">
                <td align="right" class="navi_link" style="width: 105px" valign="top">
                    栏目ID</td>
                <td align="left" class="navi_link">
                    <asp:TextBox ReadOnly="true" ID="ClassName" runat="server" CssClass="form" Width="120px"></asp:TextBox><input
                        id="ClassId" type="hidden" />
                    <span class="reshow" id="getClassCname"></span>
                    <img src="../../sysImages/folder/s.gif" style="cursor: pointer;" title="选择栏目" onclick="selectFile('newsclass',new Array(document.ListLabel.ClassId,document.ListLabel.ClassName),300,380);document.ListLabel.ClassName.focus();" />
                    调用类型：<a href="javascript:void(0);" onclick="getType();" class="reshow">自适应</a><br />
                    <span style="color: Blue;">说明：如果填写为0或者为空，调用标签所在栏目的符合条件新闻(自适应)。</span>
                </td>
            </tr>
            <tr class="TR_BG_list" id="TrUserDefined">
                <td align="right" class="navi_link">
                    <div style="margin: 5px 0 5px 0;">
                        <a style="color: blue; cursor: pointer;" onclick="selectFile('picEdit',document.getElementById('UserDefined'),320,500);"
                            title="在上传的时候，请在编辑区鼠标点击，设置要上传图片的位置。">选择图片</a></div>
                    自定义样式
                    <div style="height: 3px; margin: 2px 0 4px 0;">
                    </div>
                    <div id="showOther" style="display: none;">
                        <div style="height: 3px; border-bottom: 1px dotted #999999; margin: 2px 0 4px 0;">
                        </div>
                        <asp:TextBox ID="StyleName" Width="94px" runat="server"></asp:TextBox>
                        <div style="height: 3px; border-bottom: 1px dotted #999999; margin: 2px 0 4px 0;">
                        </div>
                        <asp:DropDownList ID="StyleClassID" Width="600px" runat="server">
                        </asp:DropDownList>
                        <div style="height: 3px; border-bottom: 1px dotted #999999; margin: 2px 0 4px 0;">
                        </div>
                        <input name="saveStyle" id="saveStyle" value="保存" type="button" onclick="savePostStyle();" />
                        <div id="sResultHTML" class="reshow">
                        </div>
                    </div>
                </td>
                <td align="left" class="navi_link">
                    <div>
                        <label id="style_class" runat="server" />
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

                    <textarea rows="1" cols="1" name="UserDefined" style="display: none" id="UserDefined"></textarea>

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
                alert('请填写样式名称');
                sname.focus();
                return false;
            }
            if(StyleClassID.value=="")
            {
                alert('请选择分类，如果没有分类，请在样式中创建');
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
            <tr class="TR_BG_list">
                <td colspan="2" align="center" class="navi_link">
                    &nbsp;<input class="form" type="button" value=" 确 定 " onclick="javascript:ReturnDivValue();" />&nbsp;<input
                        class="form" type="button" value=" 关 闭 " onclick="javascript:CloseDiv();" /></td>
            </tr>
        </table>
    </form>
</body>
</html>

<script language="javascript" type="text/javascript">
function ReturnDivValue()
{
    var CheckStr=true;
    var rvalue="[FS:unLoop,FS:SiteID=<%Response.Write(APIID); %>,FS:LabelType=ReadClass";

    var oEditor = FCKeditorAPI.GetInstance("UserDefined");
    temproot = oEditor.GetXHTML(true);
    rvalue += "]";
    rvalue += temproot;
    rvalue += "[/FS:unLoop]";
    
    if(CheckStr)
	    parent.getValue(rvalue);
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

