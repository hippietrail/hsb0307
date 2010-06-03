<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Foosun.Web.manage._default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title> _ Administrator Control center</title>
<link href="Images/css/style.css" rel="stylesheet" type="text/css" />
</head>
<frameset rows="46,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="top.aspx" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset cols="200,*" frameborder="no" border="0" framespacing="0"  name="bodyFrame" id="bodyFrame">
    <frame src="menu.aspx?type=000000000006" name="menu" scrolling="yes" frameborder="0" noresize="noresize" id="gmenu" title="leftFrame" />
    <frame src="main.aspx" name="sys_main" id="sys_main" title="mainFrame" />
  </frameset>
<noframes>
<body>
</body>
</noframes></html>