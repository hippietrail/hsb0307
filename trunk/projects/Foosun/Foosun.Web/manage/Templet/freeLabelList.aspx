<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_Templet_freeLabelList" Codebehind="freeLabelList.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title></title>
    <link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
</head>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<body>
<form id="Label" action="" runat="server">
<%--    <span id="channelList" style="padding-left:10px;" runat="server" />
--%>    <div runat="server" id="LabelList">
    </div>
    </form>
</body>
</html>
<script language="javascript" type="text/javascript">
function selectLabel(rvalue,type)
{
    parent.ReturnLabelValueText(rvalue);
}
function getchanelInfo(obj)
{
   var SiteID=obj.value;
   window.location.href="freelabelList.aspx?SiteID="+SiteID+"";
}
</script>