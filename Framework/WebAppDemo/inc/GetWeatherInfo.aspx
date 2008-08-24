<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetWeatherInfo.aspx.cs" Inherits="WebAppDemo.inc.GetWeatherInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <script type="text/javascript">
        var date = new Date();
        
        document.writeln("<br />getFullYear "); document.write(date.getFullYear());
        document.writeln("<br />getMonth "); document.write(date.getMonth());
        document.writeln("<br />getDay "); document.write(date.getDay());
        document.writeln("<br />getHours "); document.write(date.getHours());
        document.writeln("<br />getMinutes "); document.write(date.getMinutes());
        document.writeln("<br />getSeconds "); document.write(date.getSeconds());
        document.writeln("<br />getMilliseconds "); document.write(date.getMilliseconds());

        document.writeln("<br />getDate "); document.write(date.getDate());
        document.writeln("<br />getTime "); document.write(date.getTime());

        document.writeln("<br />getUTCFullYear "); document.write(date.getUTCFullYear());
        document.writeln("<br />getUTCMonth "); document.write(date.getUTCMonth());
        document.writeln("<br />getUTCDay "); document.write(date.getUTCDay());
        document.writeln("<br />getUTCHours "); document.write(date.getUTCHours());
        document.writeln("<br />getUTCMinutes "); document.write(date.getUTCMinutes());
        document.writeln("<br />getUTCSeconds "); document.write(date.getUTCSeconds());
        document.writeln("<br />getUTCMilliseconds "); document.write(date.getUTCMilliseconds());

        document.writeln("<br />toDateString "); document.write(date.toDateString());
        document.writeln("<br />toLocaleDateString "); document.write(date.toLocaleDateString());
        document.writeln("<br />toLocaleString "); document.write(date.toLocaleString());
        document.writeln("<br />toString "); document.write(date.toString());
        document.writeln("<br />toUTCString "); document.write(date.toUTCString());
        
        
    </script>
    </div>
    </form>
</body>
</html>
