<%@ Page Language="C#" AutoEventWireup="true" Inherits="configuration_system_selectNewsspecial" Codebehind="selectNewsspecial.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>ѡ��ר��__By Foosun.net & Foosun Inc.</title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
<style  type="text/css">
.LableSelectItem {
	background-color:highlight;
	cursor: pointer;
	color: white;
	text-decoration: none;
}
.LableItem {
	cursor: pointer;
}
.SubItem {
	margin-left:15px;
}
.RootItem {
	margin-left:15px;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
</style>
</head>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>

<body ondragstart="return false;" onselectstart="return false;">
    <form name="form1">
    ��ַ��<input type="text" id="SpcName" readonly="readonly" name="SpcName" style="width:50%" />&nbsp;<input type="button" class="form" name="Submit" value="ȷ��" onclick="ReturnValue();" />
    <input type="hidden" name="SpcID" id="SpcID" />
    <div id="Parent0" class="RootItem">
    ר�������...
    </div>
    </form>
</body>
</html>
<script language="javascript" type="text/javascript">
<!--
var SelectClass="";
function SwitchImg(ImgObj,ParentId){
	var ImgSrc="",SubImgSrc;
	ImgSrc=ImgObj.src;
	SubImgSrc=ImgSrc.substr(ImgSrc.length-5,12);
	if (SubImgSrc=="b.gif"){
		ImgObj.src=ImgObj.src.replace(SubImgSrc,"s.gif");
		ImgObj.alt="���������ר��";
		SwitchSub(ParentId,true);
	}else{
		if (SubImgSrc=="s.gif"){
			ImgObj.src=ImgObj.src.replace(SubImgSrc,"b.gif");
			ImgObj.alt="���չ����ר��";
			SwitchSub(ParentId,false);
		}else{
			return false;
		}
	}
}
function SwitchSub(ParentId,ShowFlag){
//	if ($("Parent"+ParentId).HasSub=="True"){
		if (ShowFlag){
			$("Parent"+ParentId).style.display="";
			if ($("Parent"+ParentId).innerHTML=="" || $("Parent"+ParentId).innerHTML=="ר�������..."){
				$("Parent"+ParentId).innerHTML="ר�������...";
				GetSubClass(ParentId);
			}
		}else{
			$("Parent"+ParentId).style.display="none";
		}
//	}
}
function SelectLable(Obj)
{
	var SelectedInfo="";
	if (SelectClass!=""){
		SelectedInfo=SelectClass.split("***");
		$(SelectedInfo[0]).className='LableItem';
	}
	Obj.className='LableSelectItem';
	SelectClass=Obj.id+"***"+Obj.innerText;
}
function GetRootClass(){
	GetSubClass("0");
}


function GetSubClass(ParentId){
	var url="SelectNewsspecial_ajax.aspx";
	var Action="ParentId="+ParentId;
	var myAjax = new Ajax.Request(
		url,
		{method:'get',
		parameters:Action,
		onComplete:GetSubClassOk
		}
		);
}
function GetSubClassOk(OriginalRequest){
	var ClassInfo;
	if (OriginalRequest.responseText!="" && OriginalRequest.responseText.indexOf("|||")>-1){
		ClassInfo=OriginalRequest.responseText.split("|||");
		
		if (ClassInfo[0]=="<div id=\"spList\">Succee"){
			$("Parent"+ClassInfo[1]).innerHTML=ClassInfo[2];
		}else{
			$("Parent"+ClassInfo[1]).innerHTML="<a href=\"�������\" onclick=\"$('Parent"+ClassInfo[1]+"').innerHTML='ר�������...';GetSubClass('"+ClassInfo[1]+"');return false;\">�������</a>";
		}
	}else{
		alert("��ȡר�����.\n����ϵ����Ա.");
		return false;
	}
}



window.onload=GetRootClass;
//window.onunload=SetReturnValue;



function ListGo(Path,ParentPath)
{
	document.Templetslist.Path.value=Path;
	document.Templetslist.ParentPath.value=ParentPath;
	document.Templetslist.submit();
}
function sFiles(sid,sname)
{
    document.getElementById('SpcID').value = sid;
    document.getElementById('SpcName').value = sname;
}

function ReturnValue()
{
	var sid = document.getElementById('SpcID').value;
	var snm = document.getElementById('SpcName').value;
	var arryret = new Array(sid,snm);
	parent.ReturnFun(arryret);
}
</script>