﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="News_add.aspx.cs" Inherits="News_add" %>
<%@ Register Src="../../controls/UserPop.ascx" TagName="UserPop" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/css.css"
        rel="stylesheet" type="text/css" />
    <style type="text/css">
.sav {border: 1px dotted #FFCC66;background-color: #FFFFCC;clear: both;float: none;height: 60px;width: 60px;line-height: 18px;padding-left:3px;padding-top:3px;	padding-right:3px;	padding-bottom:3px;	}
.reshows{height:28px;background-color: #FFFFB5;TEXT-DECORATION: none;COLOR: #FF0000;}
</style>

    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>

    <script language="JavaScript" type="text/javascript" src="../../configuration/js/public.js"></script>
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/News_add.js"></script>
    <script type="text/javascript" src="../../editor/fckeditor.js"></script>

    <script language="javascript" type="text/javascript">
     
    <!-- 

//不规则新闻JS
Array.prototype.remove = function(start,deleteCount){
    if(isNaN(start)||start>this.length||deleteCount>(this.length-start)){return false;}
    this.splice(start,deleteCount);
}

UnNewArray = <%= UnNewsJsArray %>;
TopLineArray= <%= TopLineArray %>;
FontFamily = <%= FamilyArray %>;
FontStyle = <%= FontStyleArray %>;

function CheckNum(obj){
    if (isNaN(obj.value) || obj.value<=0){
	    alert("您输入的不是正确的行数,\n请输入一个正整数.");
	    obj.value="";
	    obj.focus();
	    }
}
function DisplayUnNews()
{
    var StrUnNewsList="";
    var ListLen=0;
    var Str_tem="";
    var TLPic="";
    var PicInfo="";
    try{
        ListLen=UnNewArray.length;
    }
    catch(e)
    {
        ListLen=0;
    }
    var StrUnNewsListSub="";
    for (var i=0;i<ListLen;i++){
        StrUnNewsList+="<div class=\"ContentDiv\" id=\"Arr"+i+"\"><input name=\"NewsIDs\" type=\"hidden\" id=\"NewsIDs_"+i+"\" value=\""+UnNewArray[i][0]+"\" /><a href=\"原新闻标题\" title=\"原新闻标题:"+UnNewArray[i][1]+"\" class=\"list_link \" onclick=\"return false;\">标题</a>：<input title=\"原新闻标题:"+UnNewArray[i][1]+"\" name=\"getNewsTitle"+UnNewArray[i][0]+"\" type=\"text\" id=\"getNewsTitle_"+i+"\" value=\""+UnNewArray[i][2]+"\" size=\"60\" onkeyup=\"UnNewModify()\" onmousedown=\"new Form.Element.Observer('getNewsTitle"+UnNewArray[i][0]+"',1,UnNewModify);\" style=\"height:18px;\" class=\"form SpecialFontFamily\" />&nbsp;CSS&nbsp;<input class=\"Contentform\" name=\"titleCSS"+UnNewArray[i][0]+"\" type=\"text\" id=\"titleCSS_"+i+"\" value=\""+UnNewArray[i][5]+"\" size=\"10\" maxlength=\"20\" />&nbsp;放在第<input class=\"Contentform\" name=\"Row"+UnNewArray[i][0]+"\" type=\"text\" id=\"Row_"+i+"\" value=\""+UnNewArray[i][3]+"\" size=\"2\" maxlength=\"2\" onkeyup=\"UnNewModify(this,'')\" onbeforepaste=\"clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''));\" onmousedown=\"new Form.Element.Observer('Row"+UnNewArray[i][0]+"',1,UnNewModify);\" />行&nbsp;<button class=\"Contentform\" onclick=\"UnNewDel("+i+");return false;\">移除</button><input type=\"hidden\"  name=\"NewsTable"+UnNewArray[i][0]+"\" id=\"Table"+i+"\" value=\""+UnNewArray[i][4]+"\" /></div>";
    }
    if (TopLineArray.length>0)
    {
        if (TopLineArray[6]==1)
        {
            Str_tem=" checked=\"checked\"";
            TLPic="";
        }
        else
        {
            Str_tem="";
            TLPic=" style=\"display:none\"";
        }
        PicInfo="";
        StrUnNewsList=""+StrUnNewsList;
    }
    document.getElementById("UnNewsList").innerHTML=StrUnNewsList;
}

function UnNewModify(){
    for (var i=0;i<UnNewArray.length;i++){
	    UnNewArray[i][2]=$("getNewsTitle_"+i).value;
	    $("Row_"+i).value=$("Row_"+i).value.replace(/[^\d]/g,'');
	    UnNewArray[i][3]=parseInt($("Row_"+i).value);
    }
    if (TopLineArray.length>0)
    {
        TopLineArray[2]=$("getNewsTitle_Top").value;
        TopLineArray[3]=0;
        TopLineArray[5]=$("TTNewsCSS").value;
        TopLineArray[6]=$("IsMakePic").value;
    }
    UnNewPreviewCh();
}

function UnNewDel(Row){
    if (confirm("确定移除吗？")){
        if(Row==-1)
        {
            TopLineArray.remove(0,7);
        }
        else
        {
	        UnNewArray.remove(Row,1);
	    }
	    DisplayUnNews();
	    UnNewPreviewCh();
	    window.frames["DisNews"].CheckUnNews();
    }
}
function UnNewTopLine(Rows)
{
    UnNewModify();
    if (Rows==-1)
    {
        var ArrLen=UnNewArray.length;
        UnNewArray[ArrLen]=new Array();
        UnNewArray[ArrLen][0]=TopLineArray[0];
        UnNewArray[ArrLen][1]=TopLineArray[1];
        UnNewArray[ArrLen][2]=TopLineArray[2];
        UnNewArray[ArrLen][3]=ArrLen+1;
        UnNewArray[ArrLen][4]=TopLineArray[4];
        TopLineArray.remove(0,7)
    }
    else
    {
        if (TopLineArray.length>0)
        {
            var Arr_temp=[UnNewArray[Rows][0],UnNewArray[Rows][1],UnNewArray[Rows][2],UnNewArray[Rows][3],UnNewArray[Rows][4]];
            UnNewArray[Rows][0]=TopLineArray[0];
            UnNewArray[Rows][1]=TopLineArray[1];
            UnNewArray[Rows][2]=TopLineArray[2];
            UnNewArray[Rows][3]=Arr_temp[3];
            UnNewArray[Rows][4]=TopLineArray[4];
            TopLineArray[0]=Arr_temp[0];
            TopLineArray[1]=Arr_temp[1];
            TopLineArray[2]=Arr_temp[2];
            TopLineArray[3]=0;
            TopLineArray[4]=Arr_temp[4];
        }
        else
        {
            TopLineArray[0]=UnNewArray[Rows][0];
            TopLineArray[1]=UnNewArray[Rows][1];
            TopLineArray[2]=UnNewArray[Rows][2];
            TopLineArray[3]=0;
            TopLineArray[4]=UnNewArray[Rows][4];
            TopLineArray[5]="";
            TopLineArray[6]=0;
            UnNewArray.remove(Rows,1);
        }
    }
    DisplayUnNews();
    UnNewPreviewCh();
    window.frames["DisNews"].CheckUnNews();
}
function DivCenter(M_div,M_width,M_zindex)
{
    var xposition=0,yposition=0;
    $(M_div).style.position='absolute';
    $(M_div).style.width=M_width.toString(10)+'px';
    $(M_div).style.zIndex=M_zindex.toString(10);
    if (parseInt(navigator.appVersion) >= 4 )
    {
        var dimensions = Element.getDimensions($(M_div));
	    xposition = (document.body.offsetWidth - dimensions.width) / 2;
	    yposition = (400 - dimensions.height) / 2;
	    $(M_div).style.left=xposition.toString(10)+"px";
	    $(M_div).style.top=(yposition).toString(10)+"px";
    }
}

function UnNewPreviewCh(){
    if ($("preview").style.display==""){
	    UnNewPreview();
    }
}
function UnNewPreview(){
    var ListLen=UnNewArray.length;
    var Maxrow=1;
    var PreviewStr="";
    var PreviewRowStr="";
    var For_string="";
    for (var i=0;i<ListLen;i++){
	    if (UnNewArray[i][3]>Maxrow){
		    Maxrow=UnNewArray[i][3];
	    }
    }
    PreviewStr="<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";
    for (i=1;i<=Maxrow;i++){
	    FindFlag="";
	    PreviewRowStr="";
	    for (var j=0;j<ListLen;j++){
		    if (UnNewArray[j][3]==i){
			    if (FindFlag==""){
				    FindFlag=j.toString(10);
			    }else{
				    FindFlag+=","+j;
			    }
		    }
	    }
		
	    PreviewStr+="<tr><td>";
	    if (FindFlag){
		    PreviewRowStr=FindFlag.split(",");
		    for (var j=0;j<PreviewRowStr.length;j++){
		        For_string="<a class=\"list_link SpecialFontFamily\" href=\""+UnNewArray[PreviewRowStr[j]][2]+"\" onclick=\"return false;\">"+UnNewArray[PreviewRowStr[j]][2]+"</a>";
			    if (j==0){
				    PreviewStr+=For_string;
			    }else{
				    PreviewStr+="&nbsp;"+For_string;
			    }
		    }
	    }else{
		    PreviewStr+="&nbsp;";
	    }
	    PreviewStr+="</td></tr>";
    }
    if (TopLineArray.length>0)
    {
        PreviewStr="<tr>\
				        <td><a class=\""+TopLineArray[5]+"\" href=\""+TopLineArray[2]+"\" onclick=\"return false;\">"+TopLineArray[2]+"</a></td>\
			        </tr>"+PreviewStr;
	}
    PreviewStr+="</table>";
	
    if ($("preview").style.display=="none"){
	    $("preview").style.display="";
	    DivCenter("preview",700,100);
    }
    
    $("PreviewContent").innerHTML=PreviewStr;
    if (ListLen<=0 && TopLineArray.length<=0)
    {
        $('preview').style.display='none';
    }
}
function UnNewcheck()
 {
    var ListLen=UnNewArray.length;
    var Maxrow=0;
    var ErrStr="";
    for (var i=0;i<ListLen;i++){
	    if (UnNewArray[i][3]==0){
		    ErrStr=" 第 "+(i+1)+"条 存放行数不能为 0";
	    }
	    if (isNaN(UnNewArray[i][3])){
		    ErrStr=" 第 "+(i+1)+"条 存放行数不能为空";
	    }
	    if (UnNewArray[i][2]==""){
		    ErrStr=" 第 "+(i+1)+"条 不规则标题不能为空";
	    }
	    if (UnNewArray[i][3]>Maxrow){
		    Maxrow=UnNewArray[i][3];
	    }
    }
    var FindFlag=false;
    for (i=1;i<=Maxrow;i++){
	    FindFlag=false;
	    for (var j=0;j<ListLen;j++){
		    if (UnNewArray[j][3]==i){
			    FindFlag=true;
			    break;
		    }
	    }
	    if (!FindFlag){
		    ErrStr+="\n 第 "+i+" 行中没有新闻";
	    }
    }
    if (Maxrow==0 && TopLineArray.length==0)
    {
        ErrStr+="\n 还没有加入新闻";
    }
    if (ErrStr){
	    alert("发生以下错误：\n"+ErrStr);
	    return false;
    }else{
	    return true;
    }
    
    
}

//不规则新闻JS结束




function loadStat()
{
alert("dd");
    if(document.getElementById("isFiles").checked){$("isFiles_div1").style.display = "";}
    if(document.getElementById("SubTF").checked){document.getElementById("div_SubList").style.display = "";}
    if(document.getElementById("NewsProperty_TTTF1").checked){document.getElementById("div_TTSE").style.display = "";}
    if(document.getElementById("PicTTTF").checked){document.getElementById("div_TT").style.display = "";}
    if(document.getElementById("style_hidden").checked)
    {
      if(document.getElementById("atRadioButton").checked)
      {
        document.getElementById("captionadv").src = "../../sysImages/folder/hidead.gif";
        document.getElementById("ShowAdance").checked=true;
        document.getElementById('div_Click').style.display = "";
        document.getElementById('div_vURL').style.display='';
        document.getElementById('isFiles_div').style.display='';
        document.getElementById('div_metakey').style.display="";
        document.getElementById('div_metadesc').style.display="";
        document.getElementById('div_SavePath').style.display = "";
        document.getElementById('div_FileName').style.display = "";
        document.getElementById('div_FileEXName').style.display = "";
        document.getElementById('div_CheckStat').style.display = "";
        document.getElementById('div_UserPop1').style.display = "";
        document.getElementById('div_VoteTF').style.display = "";
        document.getElementById('div_VoteContent').style.display = "";
        document.getElementById('div_ContentPicTF').style.display = "";
        document.getElementById('div_ContentPicURL').style.display = "";
        document.getElementById('div_tHight').style.display = "";
       }
      if(document.getElementById("at1RandButton").checked)
      {
        document.getElementById("captionadv").src = "../../sysImages/folder/hidead.gif";
        document.getElementById("ShowAdance").checked=true;
        document.getElementById('div_URLaddress').style.display='none';
        document.getElementById('div_vURL').style.display='';
        document.getElementById('isFiles_div').style.display='';
        document.getElementById('div_PicURL').style.display='';
        document.getElementById('div_Content').style.display='';
        document.getElementById('div_Templet').style.display='';
        document.getElementById('div_Souce').style.display='';
        document.getElementById('NewsProperty_CommTF').style.display='';
        document.getElementById('NewsProperty_DiscussTF').style.display='';
        document.getElementById('NewsProperty_FILTTF').style.display='';
        document.getElementById('div_Click').style.display = "";
        document.getElementById('div_metakey').style.display="";
        document.getElementById('div_metadesc').style.display="";
        document.getElementById('div_SavePath').style.display = "";
        document.getElementById('div_FileName').style.display = "";
        document.getElementById('div_FileEXName').style.display = "";
        document.getElementById('div_CheckStat').style.display = "";
        document.getElementById('div_UserPop1').style.display = "";
        document.getElementById('div_VoteTF').style.display = "";
        document.getElementById('div_VoteContent').style.display = "";
        document.getElementById('div_ContentPicTF').style.display = "";
        document.getElementById('div_ContentPicURL').style.display = "";
        document.getElementById('div_tHight').style.display = "";
        if(document.getElementById("SPicURLTF").checked)
        {
            document.getElementById('Div_hw').style.display = "";
        }
      }
      if(document.getElementById("at2RandButton").checked)
      {
        document.getElementById('div_showad').style.display='none';
        document.getElementById('div_URLaddress').style.display='';
        document.getElementById('div_vURL').style.display='none';
        document.getElementById('isFiles_div').style.display='none';
        document.getElementById('div_PicURL').style.display='';
        document.getElementById('div_Content').style.display='none';
        document.getElementById('div_Templet').style.display='none';
        document.getElementById('div_Souce').style.display='';
        document.getElementById('NewsProperty_CommTF').style.display='none';
        document.getElementById('NewsProperty_DiscussTF').style.display='none';
        document.getElementById('NewsProperty_FILTTF').style.display='';
        document.getElementById('div_naviContent').style.display='none';
        document.getElementById('div_ContentPicURL').style.display = "none";
        document.getElementById('div_tHight').style.display = "none";
        document.getElementById('div_VoteContent').style.display = "none";
        document.getElementById('div_UserPop1').style.display = "none";
        document.getElementById('div_VoteTF').style.display = "none";
        document.getElementById('div_ContentPicTF').style.display = "none";
        document.getElementById('div_Click').style.display = "none";
        document.getElementById('div_metakey').style.display="none";
        document.getElementById('div_metadesc').style.display="none";
        document.getElementById('div_SavePath').style.display = "none";
        document.getElementById('div_FileName').style.display = "none";
        document.getElementById('div_FileEXName').style.display = "none";
      }
    }
    
    
}
function closediv()
{
     document.getElementById("definefield").style.display="none";
}
function getNewsInfo(obj)
{
    if(obj=='baseinfo')
    {
        document.getElementById("baseinfo").style.display="";
        document.getElementById("adinfo").style.display="none";
        document.getElementById("A1").className="reshows";
        document.getElementById("A2").className="list_link";
        document.getElementById("A3").className="list_link";
        document.getElementById("definefield").style.display="none";
    }
    else if(obj=='adinfo')
    {
        document.getElementById("adinfo").style.display="";
        document.getElementById("baseinfo").style.display="none";
        document.getElementById("definefield").style.display="none";
        document.getElementById("A2").className="reshows";
        document.getElementById("A1").className="list_link";
        document.getElementById("A3").className="list_link";
    }
    else
    {
        document.getElementById("adinfo").style.display="none";
        document.getElementById("baseinfo").style.display="none";
        document.getElementById("definefield").style.display="";
        document.getElementById("A2").className="list_link";
        document.getElementById("A1").className="list_link";
        document.getElementById("A3").className="reshows";
    }
}
//-->
    </script>
    
    <script language="javascript" type="text/javascript">
    function ShowLink(NewsType)
{
    switch (NewsType)
    {
    case "word":
	    document.getElementById('div_showad').style.display='';
	    document.getElementById('div_URLaddress').style.display='none';
	    document.getElementById('div_PicURL').style.display='none';
	    document.getElementById('div_Content').style.display='';
	    document.getElementById('div_Templet').style.display='';
	    document.getElementById('div_Souce').style.display='';
	    document.getElementById('NewsProperty_CommTF').style.display='';
	    document.getElementById('NewsProperty_DiscussTF').style.display='';
	    document.getElementById('NewsProperty_FILTTF').style.display='none';
        document.getElementById('isFiles_div').style.display ="";
        document.getElementById('isFiles_div1').style.display ="";
        document.getElementById('div_vURL').style.display = "";
	    break;
    case "pic":
	    document.getElementById('div_showad').style.display='';
	    document.getElementById('div_URLaddress').style.display='none';
	    document.getElementById('div_PicURL').style.display='';
	    document.getElementById('div_Content').style.display='';
	    document.getElementById('div_Templet').style.display='';
	    document.getElementById('div_Souce').style.display='';
	    document.getElementById('NewsProperty_CommTF').style.display='';
	    document.getElementById('NewsProperty_DiscussTF').style.display='';
	    document.getElementById('NewsProperty_FILTTF').style.display='';
        document.getElementById('isFiles_div').style.display ="";
        document.getElementById('isFiles_div1').style.display ="";
        document.getElementById('div_vURL').style.display = "";
	    break;
    default :
	    document.getElementById('div_showad').style.display='none';
	    document.getElementById('div_URLaddress').style.display='';
	    document.getElementById('div_PicURL').style.display='';
	    document.getElementById('div_Content').style.display='none';
	    document.getElementById('div_Templet').style.display='none';
	    document.getElementById('div_Souce').style.display='';
	    document.getElementById('NewsProperty_CommTF').style.display='none';
	    document.getElementById('NewsProperty_DiscussTF').style.display='none';
	    document.getElementById('NewsProperty_FILTTF').style.display='';
	    document.getElementById('div_naviContent').style.display='none';
        document.getElementById('div_ContentPicURL').style.display = "none";
        document.getElementById('div_tHight').style.display = "none";
        document.getElementById('div_VoteContent').style.display = "none";
        document.getElementById('div_UserPop1').style.display = "none";
        document.getElementById('div_VoteTF').style.display = "none";
        document.getElementById('div_ContentPicTF').style.display = "none";
        document.getElementById('div_Click').style.display = "none";
        document.getElementById('div_metakey').style.display="none";
        document.getElementById('div_metadesc').style.display="none";
        document.getElementById('div_SavePath').style.display = "none";
        document.getElementById('div_FileName').style.display = "none";
        document.getElementById('div_FileEXName').style.display = "none";
        document.getElementById('isFiles_div').style.display ="none";
        document.getElementById('isFiles_div1').style.display ="none";
        document.getElementById('div_vURL').style.display = "none";
    }
}

function selectType()
{
    var chkTitle = document.getElementById('at2RandButton');
    window.setTimeout(function (){
            if(chkTitle)
            {
                //alert(chkTitle.checked);
                if(chkTitle.checked)
                {
                    ShowLink('url');
                }
            }
            var isHeadline = document.getElementById('NewsProperty_TTTF1');
            if(isHeadline && isHeadline.checked)
            {
                TTClick1(isHeadline);
            }
        }, 0);
}
    </script>
</head>
<body onload="loadStat();DisplayUnNews(); //<%Response.Write(loadTime); %>">
    <form id="Form1" runat="server">
        <asp:HiddenField ID="attachmentFile" runat="server" />
        <iframe width="260" height="165" id="colorPalette" src="../../configuration/system/selcolor.htm"
            style="visibility: hidden; position: absolute; border: 1px gray solid; left: 297px;
            top: -20px;" frameborder="0" scrolling="no"></iframe>
        <table id="top1" width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
            <tr>
                <td style="height: 1px;" colspan="2">
                </td>
            </tr>
            <tr>
                <td class="sysmain_navi" style="width: 30%; padding-left: 14px">
                    新闻管理</td>
                <td class="topnavichar" style="width: 70%; padding-left: 14px">
                    <div align="left">
                        <a href="../main.aspx" class="topnavichar" target="sys_main">首页</a><img alt="" src="../../sysImages/folder/navidot.gif"
                            border="0" /><a href="news_list.aspx" class="topnavichar" target="sys_main">新闻管理</a><span
                                id="naviClassName" runat="server" class="SpecialFontFamily"/><img alt="" src="../../sysImages/folder/navidot.gif"
                                    border="0" /><label id="m_NewsChar" runat="server" /></div>
                </td>
            </tr>
        </table>
        <table width="98%" align="center" border="0" cellpadding="3" cellspacing="0" class="table">
            <tr>
                <td style="width: 30%;" class="TR_BG_list">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td style="width: 70%; height: 22px;">
                                <span style="cursor: pointer;" id="A1" class="reshows" onclick="getNewsInfo('baseinfo');">
                                    基本信息</span>&nbsp;&nbsp;&nbsp;&nbsp; <span style="cursor: pointer;" id="A2" class="list_link"
                                        onclick="getNewsInfo('adinfo');//document.getElementById('definefield').style.display='block';">
                                        高级属性</span>&nbsp;&nbsp;&nbsp;&nbsp; <span style="cursor: pointer;" id="A3" class="list_link"
                                            onclick="getNewsInfo('definefield');//document.getElementById('definefield').style.display='block';">
                                            自定义内容</span>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <!-- 这里开始自定义字段-->
        <table width="98%" id="definefield" style="display: none;" align="center" border="0"
            cellpadding="5" cellspacing="1" class="table">
            <tr class="TR_BG_list">
                <td>
                    <label id="getdefined" runat="server" />
                </td>
            </tr>
        </table>
        <!-- 这里开始自定义结束-->
        <div id="baseinfo">
            <div id="style_Pro" runat="server" style="display: none;">
                <asp:CheckBox ID="style_hidden" runat="server" /></div>
            <table width="98%" align="center" border="0" cellpadding="5" cellspacing="1" class="table">
                <tr class="TR_BG_list">
                    <td style="width: 10%;">
                        类型</td>
                    <td style="width: 90%;">
                        <asp:RadioButton ID="atRadioButton" runat="server" Text="普通" GroupName="NewsType"
                            onclick="ShowLink('word')" Checked="True" /><asp:RadioButton ID="at1RandButton" runat="server"
                                Text="图片" GroupName="NewsType" onclick="ShowLink('pic')" /><span style="width: 100%;"
                                    id="SubNewsContentFlag" /><asp:RadioButton ID="at2RandButton" runat="server" Text="标题"
                                        GroupName="NewsType" onclick="ShowLink('url')" />
                        &nbsp;&nbsp;&nbsp;&nbsp;权重
                        <asp:TextBox ID="OrderIDText" runat="server" Text="0" Width="33px"></asp:TextBox>&nbsp;
                        <span class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_004',this)">
                            帮助<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="OrderIDText"
                                ErrorMessage="*"></asp:RequiredFieldValidator></span><asp:RangeValidator ID="RangeValidator1"
                                    runat="server" ControlToValidate="OrderIDText" ErrorMessage="请输入1-200的数字" MaximumValue="200"
                                    MinimumValue="0" Type="Integer"></asp:RangeValidator></td>
                </tr>
                <tr class="TR_BG_list">
                    <td style="width: 10%;">
                        标题<asp:RequiredFieldValidator ID="f_NewsTitle" runat="server" ControlToValidate="NewsTitle"
                            Display="Dynamic" ErrorMessage="<span class='reshow'>*</span>"></asp:RequiredFieldValidator></td>
                    <td style="width: 90%;">
                        <asp:TextBox ID="NewsTitle" runat="server" Width="50%" CssClass="titlerule" MaxLength="100" ></asp:TextBox>
                        &nbsp;&nbsp;<asp:CheckBox Checked="true" ID="isHTML" runat="server" Text="立刻发布" />
                        <asp:DropDownList ID="DropDownList1" CssClass="form" onchange="javascript:titleFlag(this.value);"
                            runat="server">
                            <asp:ListItem>类型</asp:ListItem>
                            <asp:ListItem Value="[图文]">[图文]</asp:ListItem>
                            <asp:ListItem Value="[原创]">[原创]</asp:ListItem>
                            <asp:ListItem Value="[转载]">[转载]</asp:ListItem>
                            <asp:ListItem Value="【荐】">【荐】</asp:ListItem>
                            <asp:ListItem Value="【HOT】">【HOT】</asp:ListItem>
                        </asp:DropDownList>
                        <asp:HiddenField ID="TitleColor" runat="server" />
                        <img src="../../sysImages/blue/admin/Rect.gif" alt="-" name="MarkFontColor_Show"
                            width="18" height="17" border="0" align="middle" id="MarkFontColor_Show" style="cursor: pointer;
                            background-color: #<%= TitleColor.Value%>;" title="标题颜色选取" onclick="GetColor(this,'TitleColor');" />
                        <asp:CheckBox ID="TitleBTF" runat="server" title="是否粗体" /><strong>B</strong>
                        <asp:CheckBox ID="TitleITF" runat="server" title="是否斜体" /><i>I</i>
                        <asp:CheckBox ID="CommLinkTF" runat="server" Text="评论连接" />
                    </td>
                </tr>
                <tr class="TR_BG_list"  style="visibility :visible;" >
                      <td style="width: 10%;">标题对照:</td>
                      <td style="width: 90%;">
                        <asp:TextBox ID="NewsTitleRefer" runat="server" Width="50%" CssClass="titlerule" MaxLength="100" ></asp:TextBox>
                      </td>
                </tr>
                <tr class="TR_BG_list">
                    <td style="width: 10%;">
                        副标题</td>
                    <td style="width: 90%;">
                        <asp:TextBox ID="sNewsTitle" runat="server" Width="50%" MaxLength="100" CssClass="titlerule"  /><span
                            class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_sNewsTitle',this)">帮助</span>
                        <asp:CheckBox ID="SubTF" onclick="AddSubTF(this);" runat="server" title="添加子新闻" Text="添加子新闻" />&nbsp;&nbsp;<span
                            id="shDivs" style="cursor: pointer;" onclick="javascript:showDivs(this);"><font color="#FF0000">(显示子类选择)</font></span><span
                                class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_008',this)">帮助</span>
                    </td>
                </tr>
                <tr class="TR_BG_list">
                    <td style="width: 10%;">
                        栏目</td>
                    <td style="width: 90%;">
                        <asp:TextBox ID="ClassName" runat="server" MaxLength="100" Width="98" CssClass="form"></asp:TextBox>&nbsp;<asp:HiddenField
                            runat="server" ID="ClassID" />
                        &nbsp;<label id="showClassTF" runat="server"><img src="../../sysImages/folder/s.gif"
                            alt="选择栏目" border="0" style="cursor: pointer;" onclick="selectFile('newsclass',new Array(document.Form1.ClassID,document.Form1.ClassName),250,500);document.Form1.ClassName.focus();" /></label><span
                                class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_006',this)">帮助</span>
                        &nbsp;&nbsp; 专题
                        <asp:TextBox ID="SpecialName" runat="server" Width="98" CssClass="form" />&nbsp;<asp:HiddenField
                            runat="server" ID="SpecialID" />
                        &nbsp;<img src="../../sysImages/folder/s.gif" alt="选择专题" border="0" style="cursor: pointer;"
                            onclick="selectFile('newsspecial',new Array(document.Form1.SpecialID,document.Form1.SpecialName),250,300);document.Form1.SpecialName.focus();" />
                        <span onclick="javascript:document.Form1.SpecialID.value='';document.Form1.SpecialName.value='';"
                            title="清除已选择的专题" style="cursor: pointer;">清除</span> <span class="helpstyle" style="cursor: help;"
                                title="点击显示帮助" onclick="Help('H_News_add_007',this)">帮助</span>
                        <input id="Button1" type="button" visible="false" value="查看子新闻标题" language="javascript" onclick="return Button1_onclick()" runat="server" /></td>
                </tr>
                <tr class="TR_BG_list" id="div_SubList" style="display: none;">
                    <td style="width: 100%;" valign="top" colspan="2">
                        <div id="preview" style="display: none; width: 600px;">
                            <table style="width: 700px;" border="0" align="center" cellpadding="4" cellspacing="1"
                                class="table">
                                <tr class="TR_BG" onmousedown="drag(event,$('preview'));">
                                    <td align="center" style="cursor: move; width: 680px;">
                                        <strong>预览不规则新闻(点此拖动)</strong></td>
                                    <td style="cursor: move; text-align: right; width: 40px;">
                                        <span onclick="$('preview').style.display='none';" style="cursor: pointer;">关闭</span></td>
                                </tr>
                                <tr class="TR_BG_list">
                                    <td colspan="2" style="width: 700px;">
                                        <div id="PreviewContent">
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
                            <tr class="TR_BG">
                                <td>
                                    <span onclick="if(UnNewcheck())UnNewPreview();" style="cursor: pointer;">预览效果</span>
                                    <input name="UnID" type="hidden" id="UnID" value="<%=unNewsid %>" />
                                </td>
                            </tr>
                            <tr class="TR_BG_list">
                                <td id="UnNewsList">
                                </td>
                            </tr>
                        </table>
                        <div id="div_UnnewsIframe">
                        </div>
                    </td>
                </tr>
                <tr class="TR_BG_list" id="div_URLaddress" style="display: none;">
                    <td style="width: 10%;">
                        外部地址</td>
                    <td style="width: 90%;">
                        <asp:TextBox ID="URLaddress" runat="server" MaxLength="200" Width="50%" CssClass="form"></asp:TextBox>
                        <span class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_URLaddress',this)">
                            帮助</span>
                    </td>
                </tr>
                <tr class="TR_BG_list" id="div_PicURL" runat="server" style="display: none;">
                    <td style="width: 10%;">
                        图片地址</td>
                    <td style="width: 90%;">
                        <asp:TextBox ID="PicURL" runat="server" Width="50%" MaxLength="200" CssClass="form"
                            onmouseover="javascript:ShowDivPic(this,document.Form1.PicURL.value.toLowerCase().replace('{@dirfile}','files').replace('{@userdirfile}','userfiles'),'.jpg',1);"
                            onmouseout="javascript:hiddDivPic();"></asp:TextBox>
                        <img src="../../sysImages/folder/s.gif" alt="选择已有图片" border="0" style="cursor: pointer;"
                            onclick="selectFile('pic',document.Form1.PicURL,480,600);document.Form1.PicURL.focus();" />
                        <span class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_PicURL',this)">
                            帮助</span>
                        <asp:CheckBox ID="SPicURLTF" runat="server" title="是否生成小图" onclick="showHw(this);"
                            Text="自动生成小图" />
                        <asp:HiddenField ID="SPicURL" runat="server" />
                        <span class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_SPicURLTF',this)">
                            如何生成小图?</span>
                        <br />
                        <label id="Div_hw" style="display: none;">
                            &nbsp;缩图高：<asp:TextBox CssClass="form" Width="40px" ID="stHeight" runat="server"></asp:TextBox>&nbsp;
                            <span class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_SPicURLHeight',this)">
                                高度?</span> &nbsp;缩图宽：<asp:TextBox CssClass="form" Width="40px" ID="stWidth" runat="server"></asp:TextBox>&nbsp;
                            <span class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_SPicURLWidth',this)">
                                宽度?</span>
                        </label>
                    </td>
                </tr>
                <tr class="TR_BG_list" id="div_naviContent" style="display: none;">
                    <td style="width: 10%;">
                        导读</td>
                    <td style="width: 90%;">
                        <asp:TextBox ID="naviContent" runat="server" Width="80%" MaxLength="500" CssClass="form SpecialFontFamily"
                            Height="50px" TextMode="MultiLine"></asp:TextBox>
                        <span class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_NaviContent',this)">
                            帮助</span>
                    </td>
                </tr>
                <tr class="TR_BG_list" id="div_Content">
                    <td style="width: 10%;" valign="top">
                        内容
                        <br />
                        <asp:CheckBox ID="naviContentTF" runat="server" title="为内容设置导读" onclick="NaviClick(this);"
                            Text="设置导读" /><span class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_naviContentTF',this)">帮助</span>
                        <br />
                        <br />
                        <div align="center">
                            缩放编辑区
                            <br />
                            <a href="javascript:ZoonEdit('300')" class="list_link" style="text-decoration: underline;">
                                原始</a>&nbsp;&nbsp;<a class="list_link" style="text-decoration: underline;" href="javascript:ZoonEdit('500')">中</a>&nbsp;&nbsp;<a
                                    class="list_link" style="text-decoration: underline;" href="javascript:ZoonEdit('700')">大</a></div>
                        <div style="padding-top: 2px; padding-bottom: 2px; position: relative; width: 100%;
                            height: 2px; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px;
                            border-left-width: 1px; border-top-style: dashed; border-right-style: none; border-bottom-style: none;
                            border-left-style: none; border-top-color: #CCCCCC;">
                        </div>
                        <div style="padding-bottom: 3px;">
                            <a style="cursor: pointer;" onclick="UpFile('<% Response.Write(UDir); %>');" title="在上传的时候，请在编辑区鼠标点击，设置要上传图片的位置。">
                                <font color="red">上传图片</font></a></div>
                        <div style="padding-top: 2px; padding-bottom: 2px; position: relative; width: 100%;
                            height: 2px; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px;
                            border-left-width: 1px; border-top-style: dashed; border-right-style: none; border-bottom-style: none;
                            border-left-style: none; border-top-color: #CCCCCC;">
                        </div>
                        <div>
                            <a style="cursor: pointer;" onclick="selectFile('picEdit',document.getElementById('picContentTF'),320,500);"
                                title="在上传的时候，请在编辑区鼠标点击，设置要上传图片的位置。"><font color="blue">选择图片</font></a></div>
                    </td>
                    <td style="width: 90%; height: 300px;" id="EditSizeID">
                        <div style="height: 30px;">
                            <asp:CheckBox ID="RemoteTF" runat="server" title="保存图片(文件)到本地" Text="远程存图" /><span
                                class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_downfiles',this)">帮助</span>
                            &nbsp;&nbsp;<asp:CheckBox ID="sPicFromContent" Text="提取图片地址" runat="server" onclick="getDivsPicFromContent();" />&nbsp;<span
                                id="getContentNum" style="display: none;"> 提取第
                                <asp:TextBox Width="25px" ID="btngetContentNum" runat="server" Text="1" MaxLength="2"></asp:TextBox>张</span>
                            <span class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_getContentPic',this)">
                                帮助</span>&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="sNaviContentFromContent" Text="获取导读"
                                    runat="server" /><span class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_getNaviContent',this)">帮助</span>
                        </div>
                            插入投票
                            <asp:DropDownList ID="surveyJSID" runat="server" Width="200px" CssClass="form" onchange="javascript:vote(this.value);">
                            </asp:DropDownList>
                            &nbsp; 插入分页符：<span style="cursor: pointer; color: red;">分页标题</span>
                            <asp:TextBox ID="PageTitle" Text="" runat="server" Width="200px"  CssClass="SpecialFontFamily"></asp:TextBox>
                            <a href="###" onclick="insertPageStr();">插入</a> <br />
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" Text="自动分页" />
                            每页字数：<asp:TextBox ID="TxtPageCount" runat="server" Height="11px"
                                Width="28px">20</asp:TextBox>
                                <br />
                        <label id="picContentTF">
                        </label>
                        <!--编辑器开始-->

                        <script type="text/javascript" language="JavaScript">
                            window.onload = function() {
                                var specialObject;
                                specialObject = document.getElementById('NewsTitle'); //.style.fontFamily = SpecialFontFamily();
                                SetSpecialFontStyle(specialObject);
                                specialObject = document.getElementById('sNewsTitle'); //.style.fontFamily = SpecialFontFamily();
                                SetSpecialFontStyle(specialObject);
                                specialObject = document.getElementById('ClassName'); //.style.fontFamily = SpecialFontFamily();
                                SetSpecialFontStyle(specialObject);
                                specialObject = document.getElementById('SpecialName'); //.style.fontFamily = SpecialFontFamily();
                                SetSpecialFontStyle(specialObject);
                                specialObject = document.getElementById('Souce'); //.style.fontFamily = SpecialFontFamily();
                                SetSpecialFontStyle(specialObject);
                                specialObject = document.getElementById('Author'); //.style.fontFamily = SpecialFontFamily();
                                SetSpecialFontStyle(specialObject);
                                var sBasePath = "../../editor/";
                                var oFCKeditor = new FCKeditor('FileContent');
                                oFCKeditor.BasePath = sBasePath;
                                oFCKeditor.Width = '100%';
                                oFCKeditor.Height = '100%';
                                oFCKeditor.ReplaceTextarea();
                                
                                selectType();
                            }
                        </script>

                        <textarea name="FileContent" rows="1" cols="1" style="display: none;" id="FileContent"  
                            runat="server"></textarea>
                    </td>
                </tr>
                <tr class="TR_BG_list" id="div_vURL">
                    <td style="width: 10%;">
                        视频地址</td>
                    <td style="width: 90%;">
                        <asp:TextBox ID="vURL" runat="server" Width="50%" MaxLength="200" CssClass="form"></asp:TextBox>&nbsp;<img
                            src="../../sysImages/folder/s.gif" alt="选择视频" border="0" style="cursor: pointer;"
                            onclick="selectFile('video',document.Form1.vURL,380,500);document.Form1.vURL.focus();" />&nbsp;<a
                                href="javascript:void(0);" onclick="ivurl();" style="color: Blue;">把视频添加入编辑器中</a>
                    </td>
                </tr>
                <tr class="TR_BG_list" id="isFiles_div">
                    <td style="width: 10%; height: 30px;">
                        是否有附件</td>
                    <td style="width: 90%; height: 30px;">
                        <asp:CheckBox ID="isFiles" onclick="showfiles(this);" runat="server" /></td>
                </tr>
                <tr class="TR_BG_list" id="isFiles_div1" style="display: none;">
                    <td style="width: 10%;">
                        附件列表</td>
                    <td style="width: 90%;">
                        <div id="dlFileURL" runat="server" />
                    </td>
                </tr>

                <script language="javascript" type="text/javascript">
            if(document.getElementById("isFiles").checked)
            {
                document.getElementById("isFiles_div1").style.display="block";
            }
                </script>

                <tr class="TR_BG_list">
                    <td style="width: 10%;">
                        属性</td>
                    <td style="width: 90%;">
                        <span id="NewsProperty_CommTF">
                            <asp:CheckBox ID="NewsProperty_CommTF1" Checked="true" runat="server" />允许评论</span>&nbsp;
                        <span id="NewsProperty_DiscussTF">
                            <asp:CheckBox ID="NewsProperty_DiscussTF1" Checked="true" runat="server" />允许创建讨论组</span>&nbsp;
                        <span id="NewsProperty_RECTF">
                            <asp:CheckBox ID="NewsProperty_RECTF1" runat="server" />推荐</span>&nbsp; <span id="NewsProperty_MARTF">
                                <asp:CheckBox ID="NewsProperty_MARTF1" runat="server" />滚动</span>&nbsp;
                        <span id="NewsProperty_HOTTF">
                            <asp:CheckBox ID="NewsProperty_HOTTF1" runat="server" />热点</span>&nbsp; <span id="NewsProperty_FILTTF">
                                <asp:CheckBox ID="NewsProperty_FILTTF1" runat="server" />幻灯</span>&nbsp;
                        <span id="NewsProperty_TTTF">
                            <asp:CheckBox ID="NewsProperty_TTTF1" onclick="TTClick1(this);" runat="server" />头条</span>&nbsp;
                        <span id="NewsProperty_ANNTF">
                            <asp:CheckBox ID="NewsProperty_ANNTF1" runat="server" />公告</span>&nbsp; <span id="NewsProperty_JCTF">
                                <asp:CheckBox ID="NewsProperty_JCTF1" runat="server" />精彩</span>&nbsp; <span id="NewsProperty_WAPTF">
                                    <asp:CheckBox ID="NewsProperty_WAPTF1" runat="server" />WAP</span>&nbsp;
                    </td>
                </tr>
                <tr class="TR_BG_list" id="div_TTSE" style="display: none;">
                    <td style="width: 10%; height: 30px;">
                        头条参数</td>
                    <td style="width: 90%; height: 30px;">
                        <asp:CheckBox ID="PicTTTF" runat="server" onclick="TTClick(this);" Text="图片头条" />
                        <span class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_TTTitle0',this)">
                            帮助</span>
                    </td>
                </tr>
                <tr class="TR_BG_list" id="div_TT" style="display: none;">
                    <td style="width: 10%;">
                        图片头条</td>
                    <td style="width: 90%;">
                        字体:
                        <asp:DropDownList ID="PageFontFamily" Width="120px" runat="server" CssClass="form">
                        </asp:DropDownList>&nbsp; 样式:
                        <asp:DropDownList ID="PageFontStyle" runat="server" CssClass="form">
                        </asp:DropDownList>
                        字体颜色:
                        <asp:HiddenField ID="fontColor" Value="000000" runat="server" />
                        <img src="../../sysImages/blue/admin/Rect.gif" alt="-" name="MarkFontColor_Show"
                            width="18" height="17" border="0" align="middle" id="Img1" style="cursor: pointer;
                            background-color: #<%= fontColor.Value%>;" title="选取字体颜色" onclick="GetColor(this,'fontColor');" />
                        <label style="display: none;">
                            字体间距:
                            <asp:TextBox ID="fontCellpadding" MaxLength="2" runat="server" Width="20px">20</asp:TextBox>px
                            &nbsp;</label>
                        字号:
                        <asp:TextBox ID="PagefontSize" runat="server" MaxLength="2" CssClass="form" Width="30px">20</asp:TextBox>px&nbsp;
                        图片宽度：<asp:TextBox ID="PagePicwidth" runat="server" MaxLength="3" Width="30px" CssClass="form">200</asp:TextBox>px
                        图片背景色:
                        <asp:HiddenField ID="Imagesbgcolor" Value="ffffff" runat="server" />
                        <img src="../../sysImages/blue/admin/Rect.gif" alt="-" name="MarkFontColor_Show"
                            width="18" height="17" border="0" align="middle" id="Img2" style="cursor: pointer;
                            background-color: #<%= Imagesbgcolor.Value%>;" title="选取图片前景色" onclick="GetColor(this,'Imagesbgcolor');" />
                        <br />
                        自定义标题:
                        <asp:TextBox ID="topFontInfo" runat="server" Width="40%" CssClass="form SpecialFontFamily"></asp:TextBox>
                        <span class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_TTTitle',this)">
                            帮助</span>
                        <asp:HiddenField ID="tl_SavePath" runat="server" />
                        &nbsp;<a href="javascript:getReview();"><font color="blue">预览图片效果</font></a>
                    </td>
                </tr>
                <tr class="TR_BG_list" id="div_Templet">
                    <td style="width: 10%;">
                        模板</td>
                    <td style="width: 90%;">
                        <asp:TextBox ID="Templet" runat="server" MaxLength="200" Width="40%" CssClass="form"></asp:TextBox><img
                            src="../../sysImages/folder/s.gif" alt="" border="0" style="cursor: pointer;"
                            onclick="selectFile('templet',document.Form1.Templet,250,500);document.Form1.Templet.focus();" />
                        <span class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_Templet',this)">
                            帮助</span>
                    </td>
                </tr>
                <tr class="TR_BG_list" id="div_Souce">
                    <td style="width: 10%;">
                        来源</td>
                    <td style="width: 90%;">
                        <asp:TextBox ID="Souce" runat="server" Width="16%" MaxLength="100" CssClass="form"></asp:TextBox><img
                            src="../../sysImages/folder/s.gif" alt="选择已有来源" border="0" style="cursor: pointer;"
                            onclick="selectFile('Souce',document.Form1.Souce,220,450);document.Form1.Souce.focus();" />
                        &nbsp;<a href="javascript:addSource('本站');" class="helpstyle">本站</a>&nbsp;&nbsp;<a
                            class="helpstyle" href="javascript:addSource('未知');">未知</a>&nbsp;&nbsp;<a class="helpstyle"
                                href="javascript:addSource('网络来源');">网络来源</a>
                        <asp:CheckBox ID="SouceTF" runat="server" title="记忆" Text="记忆" />
                        &nbsp;&nbsp;&nbsp;作者：
                        <asp:TextBox ID="Author" MaxLength="100" runat="server" Width="16%" CssClass="form"></asp:TextBox><img
                            src="../../sysImages/folder/s.gif" alt="选择已有作者" border="0" style="cursor: pointer;"
                            onclick="selectFile('Author',document.Form1.Author,220,420);document.Form1.Author.focus();" />
                        &nbsp;<a href="javascript:addAuthor('本站');" class="helpstyle">本站</a>&nbsp;&nbsp;<a
                            class="helpstyle" href="javascript:addAuthor('未知');">未知</a>&nbsp;&nbsp;<a class="helpstyle"
                                href="javascript:addAuthor('网络来源');">网络来源</a>
                        <asp:CheckBox ID="AuthorTF" runat="server" title="记忆" Text="记忆" />
                    </td>
                </tr>
                <tr class="TR_BG_list" id="div_Tags">
                    <td style="width: 10%;">
                        标签(Tag)</td>
                    <td style="width: 90%;">
                        <asp:TextBox ID="Tags" runat="server" MaxLength="100" Width="28%" CssClass="form SpecialFontFamily"
                            onblur="javascript:document.Form1.Metakeywords.value=document.Form1.Tags.value;"></asp:TextBox><img
                                src="../../sysImages/folder/s.gif" alt="选择已有标签" border="0" style="cursor: pointer;"
                                onclick="selectFile('Tag',document.Form1.Tags,220,480);document.Form1.Tags.focus();" />
                        <span class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_tags',this)">
                            什么是标签</span>
                        <asp:CheckBox ID="TagsTF" runat="server" title="记忆" Text="记忆" />
                        <div id="lastTags" runat="server">
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div id="adinfo" style="display: none;">
            <table width="98%" align="center" border="0" cellpadding="5" cellspacing="1" class="table">
                <tr class="TR_BG_list" id="div_showad">
                    <td style="width: 10%;" colspan="2">
                        <asp:CheckBox ID="ShowAdance" Checked="true" onclick="ShowAdanceTF(this)" runat="server" />
                        <img alt="" src="../../sysImages/folder/showad.gif" border="0" id="captionadv" /></td>
                </tr>
                <tr class="TR_BG_list" id="div_metakey" style="display: block">
                    <td style="width: 10%;">
                        Meta关键字</td>
                    <td style="width: 90%;">
                        <asp:TextBox ID="Metakeywords" runat="server" Height="50px" Width="60%" TextMode="MultiLine"
                            CssClass="form"></asp:TextBox>
                    </td>
                </tr>
                <tr class="TR_BG_list" id="div_Metadesc" style="display: block">
                    <td style="width: 10%;">
                        Meta描述</td>
                    <td style="width: 90%;">
                        <asp:TextBox ID="Metadesc" runat="server" Height="50px" Width="60%" TextMode="MultiLine"
                            CssClass="form"></asp:TextBox>
                    </td>
                </tr>
                <tr class="TR_BG_list" id="div_Click" style="display: block">
                    <td style="width: 10%;">
                        点击</td>
                    <td style="width: 90%;">
                        <asp:TextBox ID="Click" runat="server" MaxLength="8" Width="40%" CssClass="form">0</asp:TextBox>
                    </td>
                </tr>
                <tr class="TR_BG_list" id="div_SavePath" style="display: block">
                    <td style="width: 10%;">
                        保存路径</td>
                    <td style="width: 90%;">
                        <asp:TextBox ID="SavePath" Width="40%" runat="server" CssClass="form" onclick="selectFile('rulesmallPram',this,100,450);document.Form1.SavePath.focus();"></asp:TextBox>
                        <span class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_SavePath',this)">
                            帮助</span>
                    </td>
                </tr>
                <tr class="TR_BG_list" id="div_FileName" style="display: block">
                    <td style="width: 10%;">
                        文件名</td>
                    <td style="width: 90%;">
                        <asp:TextBox ID="FileName" Width="40%" MaxLength="100" runat="server" onclick="selectFile('rulePram',this,100,650);document.Form1.FileName.focus();"
                            CssClass="form"></asp:TextBox>
                        <span class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_FileName',this)">
                            帮助</span>
                    </td>
                </tr>
                <tr class="TR_BG_list" style="display: block">
                    <td style="width: 10%">
                        创建时间</td>
                    <td style="width: 90%">
                        <asp:TextBox ID="txtCreateTimes" runat="server" Width="40%"></asp:TextBox>
                        </td>
                </tr>
                <tr class="TR_BG_list" style="display: block" id="tr_editorTime" visible="false" runat="server">
                    <td style="width: 10%">
                        修改时间</td>
                    <td style="width: 90%">
                        <asp:TextBox ID="txtEditorTime" runat="server" Width="40%"></asp:TextBox>
                        <asp:HiddenField ID="HiddenField_editTime" runat="server" />
                    </td>
                </tr>
                <tr class="TR_BG_list" id="div_FileEXName" style="display: block">
                    <td style="width: 10%;">
                        扩展名</td>
                    <td style="width: 90%;">
                        <asp:DropDownList ID="FileEXName" runat="server" Height="21px" Width="92px" CssClass="form">
                            <asp:ListItem>.html</asp:ListItem>
                            <asp:ListItem>.htm</asp:ListItem>
                            <asp:ListItem>.shtml</asp:ListItem>
                            <asp:ListItem>.shtm</asp:ListItem>
                            <asp:ListItem>.aspx</asp:ListItem>
                        </asp:DropDownList>
                        <span class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_FileEXName_2',this)">
                            帮助</span>
                    </td>
                </tr>
                <tr class="TR_BG_list" id="div_CheckStat" style="display: block">
                    <td style="width: 10%;">
                        审核状态</td>
                    <td style="width: 90%;">
                        <asp:DropDownList ID="CheckStat" runat="server" Height="21px" Width="92px" CssClass="form">
                            <asp:ListItem Value="0">不审核</asp:ListItem>
                            <asp:ListItem Value="1">一级审核</asp:ListItem>
                            <asp:ListItem Value="2">二级审核</asp:ListItem>
                            <asp:ListItem Value="3">三级审核</asp:ListItem>
                        </asp:DropDownList>
                        <span class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_FileEXName',this)">
                            帮助</span>
                    </td>
                </tr>
                <tr class="TR_BG_list" id="div_UserPop1" style="display: block">
                    <td style="width: 10%;">
                        浏览权限</td>
                    <td style="width: 90%;">
                        <uc1:UserPop ID="UserPop1" runat="server" />
                    </td>
                </tr>
                <tr class="TR_BG_list" id="div_VoteTF" style="display: block">
                    <td style="width: 10%;">
                        允许投票</td>
                    <td style="width: 90%;">
                        <asp:CheckBox ID="VoteTF" runat="server" onclick="IsVoteTF(this);" />
                        <span class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_VoteTF',this)">
                            帮助</span>
                    </td>
                </tr>
                <tr class="TR_BG_list" id="div_VoteContent" style="display: none;">
                    <td style="width: 10%;">
                        投票参数</td>
                    <td style="width: 90%;">
                        <asp:CheckBox ID="ismTF" runat="server" Text="允许多选" /><asp:CheckBox ID="isMember"
                            runat="server" Text="会员才能投票" />
                        &nbsp;&nbsp;&nbsp;过期日期：<asp:TextBox ID="isTimeOutTime" MaxLength="20" Width="20%"
                            runat="server" CssClass="form"></asp:TextBox><img src="../../sysImages/folder/s.gif"
                                alt="选择日期" border="0" style="cursor: pointer;" onclick="selectFile('date',document.Form1.isTimeOutTime,180,400);document.Form1.isTimeOutTime.focus();" />
                        <br />
                        <asp:TextBox ID="VoteContent" runat="server" Width="60%" Height="100px" TextMode="MultiLine"></asp:TextBox>
                        <span class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_VoteContent',this)">
                            如何设置投票项?</span>
                    </td>
                </tr>
                <tr class="TR_BG_list" id="div_ContentPicTF" style="display: block">
                    <td style="width: 10%;">
                        画中画广告</td>
                    <td style="width: 90%;">
                        <asp:CheckBox ID="ContentPicTF" runat="server" onclick="ContentPicURLTF(this);" />
                        <span class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_ContentPicTF',this)">
                            帮助</span>
                    </td>
                </tr>
                <tr class="TR_BG_list" id="div_ContentPicURL" style="display: none;">
                    <td style="width: 10%;">
                        地址或代码</td>
                    <td style="width: 90%;">
                        <asp:TextBox ID="ContentPicURL" MaxLength="200" TextMode="MultiLine" Width="50%"
                            runat="server" CssClass="form"></asp:TextBox><img src="../../sysImages/folder/s.gif"
                                alt="选择图片地址" border="0" style="cursor: pointer;" onclick="selectFile('pic',document.Form1.ContentPicURL,280,500);document.Form1.ContentPicURL.focus();" />
                        <span class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_ContentPicURL',this)">
                            帮助</span>
                    </td>
                </tr>
                <tr class="TR_BG_list" id="div_tHight" style="display: none;">
                    <td style="width: 10%;">
                        参数</td>
                    <td style="width: 90%;">
                        <asp:TextBox ID="tHight" runat="server" MaxLength="3" Width="20%" CssClass="form">200</asp:TextBox>&nbsp;px(高)
                        &nbsp;&nbsp;┊&nbsp;&nbsp;
                        <asp:TextBox ID="tWidth" runat="server" Width="20%" MaxLength="3" CssClass="form">200</asp:TextBox>&nbsp;px(宽)
                        <span class="helpstyle" style="cursor: help;" title="点击显示帮助" onclick="Help('H_News_add_ContentPicSize',this)">
                            帮助</span>
                    </td>
                </tr>
                <tr class="TR_BG_list">
                    <td align="center" colspan="2">
                    </td>
                </tr>
            </table>
        </div>
        <table width="98%" align="center" border="0" cellpadding="3" cellspacing="0" class="table">
            <tr>
                <td style="width: 30%; padding-left: 14px; text-align: center;" class="TR_BG_list">
                    <asp:HiddenField ID="EditAction" runat="server" />
                    <asp:HiddenField ID="NewsID" runat="server" />
                    <asp:Button ID="Button2" runat="server" Text="保存新闻" OnClick="Buttonsave_Click" OnClientClick="DisplayUnNews()" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg"
            style="height: 76px">
            <tr>
                <td class="list_link" align="center">
                    <%Response.Write(CopyRight);%>
                </td>
            </tr>
        </table>
    </form>
    <script type="text/javascript" language="javascript">
    var chkTitle = document.getElementById('at2RandButton');
//    window.onload = function ()
//    {
//    loadStat();
//    DisplayUnNews();
//        window.setTimeout(function (){
//            if(chkTitle)
//            {
//                alert(chkTitle.checked);
//                if(chkTitle.checked)
//                {
//                    ShowLink('url');
//                }
//            }
//        }, 300);
//    }
    
    </script>
</body>
</html>

<script type="text/javascript" language="javascript">
var dirFile='<% Response.Write(Foosun.Config.UIConfig.dirFile); %>';
var getSiteRoot='<%Response.Write(getSiteRoot); %>';
if(document.Form1.SubTF.checked)
{
    document.getElementById('div_SubList').style.display = "";
    document.getElementById('div_UnnewsIframe').innerHTML = "<iframe id=\"Iframe1\" name=\"DisNews\" src=\"unnews_iframe.aspx\" width=\"100%\" frameborder=\"0\" height=\"400\">";
}
if(document.getElementById("NewsProperty_TTTF1").checked==true)
{
    document.getElementById("div_TTSE").style.display="";
}
if(document.getElementById("PicTTTF").checked==true)
{
    document.getElementById("div_TT").style.display="";
    document.write();
}
</script>

