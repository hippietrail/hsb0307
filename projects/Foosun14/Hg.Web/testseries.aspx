<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testseries.aspx.cs" Inherits="Hg.Web.testseries" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Button text="生成新序列号" id="newsn" runat="server" OnClick="newsn_Click" />
    <label id="dda" runat="server"></label><label id="dd" runat="server"></label><br />
    <input type="text" value="" style="width:200px" id="tt"  runat="server"/><asp:Button Text="加密" ID="ddd" runat="server" OnClick="ddd_Click"/>
    </div>
    </form>
</body>
</html>
