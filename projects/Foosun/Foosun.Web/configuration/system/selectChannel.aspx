<%@ Page Language="C#" AutoEventWireup="true" Inherits="configuration_system_selectChannel" Codebehind="selectChannel.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>ѡ��Ƶ��__By Foosun.net & Foosun Inc.</title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
<style  type="text/css">
.LableSelectItem {
	background-color:highlight;
	cursor: hand;
	color: white;
	text-decoration: none;
}
.LableItem {
	cursor: hand;
}
.SubItems {
	margin-left: 12px;
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
    Ƶ����<input type="text" id="channelID" readonly name="styleID" style="width:50%" />&nbsp;<input type="button" class="form" name="Submit" value="ȷ��" onclick="ReturnValue(document.form1.channelID.value);" />
    <div id="channelList" runat="server" class="RootItem">
    Ƶ��������...
    </div>
    </form>
</body>
</html>
<script language="javascript" type="text/javascript">
var SelectClass="";
<!--

function ReturnValue(obj)
{
	var Str=obj;
	parent.ReturnFun(Str);
}

function sFiles(obj)
{
  document.form1.channelID.value=obj;
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

</script>
