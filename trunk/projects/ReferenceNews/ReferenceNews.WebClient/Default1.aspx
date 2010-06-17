<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default1.aspx.cs" Inherits="ReferenceNews.WebClient._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <script type="text/javascript" src="js/ajax.js"></script>
</head>
<body>

<script type="text/javascript">
    //<![CDATA[
    var data = "username=" + encodeURIComponent("aaa") + "&password=" + encodeURIComponent("bbb");
    ajax(callBack, "/CommonServices/LogoinHandler.ashx", data, "post");
    function callBack(response) {
        alert(response);
    }
    //]]> 
</script>

    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
