<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="WebAppDemo.ipanel.Menu" %>


<html>
<head runat="server">
    <title>主菜单</title>
    <link rel="stylesheet" type="text/css" href="/theme/2/style.css">
    <link rel="stylesheet" type="text/css" href="/theme/2/menu.css">
</head>
<body class="panel">

    <div id="body">
    <!-- OA树开始-->
<a id="expand_link" href="javascript:menu_expand();"><u><span id="expand_text">展开</span></u></a>
    <ul id="menu">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1" onitemdatabound="Repeater1_ItemDataBound">
        <ItemTemplate>
            <li class="L1"><a href='javascript:c(<%# Eval("MenuCode") %>);' id='<%# Eval("MenuCode") %>'><span><img src="/images/menu/mytable.gif" align="absMiddle"/> <%# Eval("Name") %></span></a></li>
            <ul id='<%# Eval("MenuCode") %>d' style="display:none;" class="U1">
            <asp:Repeater ID="Repeater2" runat="server" onitemdatabound="Repeater2_ItemDataBound">
                <ItemTemplate><asp:Literal ID="Literal1" runat="server"></asp:Literal><%--<li class="L22"><a href="javascript:a('<%# Eval("RelativeURL") %>','<%# Eval("MenuCode") %>');" id='f<%# Eval("MenuCode") %>'><span><img src="/images/menu/notify.gif" align="absMiddle"/><%# Eval("Name") %></span></a></li>--%>
                    <ul id='f<%# Eval("MenuCode") %>d' style="display:none;">
                        <asp:Repeater ID="Repeater3" runat="server">
                        <ItemTemplate>
                            <li class="L3"><a href="javascript:a('<%# Eval("RelativeURL") %>','<%# Eval("MenuCode") %>');" id="f<%# Eval("MenuCode") %>"><span><img src="/images/menu/email.gif" align="absMiddle"/><%# Eval("Name") %></span></a></li>
                        </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </ItemTemplate>
                <FooterTemplate></ul></FooterTemplate>
            </asp:Repeater>
        </ItemTemplate>
        </asp:Repeater>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="GetMainMenu" TypeName="Admin.BusinessActions.Menu">
        </asp:ObjectDataSource>
    </ul>
    </div>
    <div id="bottom"></div>
    
    <script language="JavaScript">
    var cur_id = "";
    var flag = 0, sflag = 0;

    //-------- 菜单点击事件 -------
    function c(srcelement) {
        var targetid, srcelement, targetelement;
        var strbuf;

        //-------- 如果点击了展开或收缩按钮---------
        targetid = srcelement.id + "d";
        targetelement = document.getElementById(targetid);

        if (targetelement.style.display == "none") {
            srcelement.className = "active";
            targetelement.style.display = '';

            menu_flag = 0;
            expand_text.innerHTML = "收缩";
        }
        else {
            srcelement.className = "";
            targetelement.style.display = "none";

            menu_flag = 1;
            expand_text.innerHTML = "展开";
            var links = document.getElementsByTagName("A");
            for (i = 0; i < links.length; i++) {
                srcelement = links[i];
                if (srcelement.parentNode.className.toUpperCase() == "L1" && srcelement.className == "active" && srcelement.id.substr(0, 1) == "m") {
                    menu_flag = 0;
                    expand_text.innerHTML = "收缩";
                    break;
                }
            }
        }
    }
    function set_current(id) {
        cur_link = document.getElementById("f" + cur_id)
        if (cur_link)
            cur_link.className = "";
        cur_link = document.getElementById("f" + id);
        if (cur_link)
            cur_link.className = "active";
        cur_id = id;
    }
    //-------- 打开网址 -------
    function a(URL, id) {
        set_current(id);
        //if (URL.substr(0, 7) != "http://" && URL.substr(0, 6) != "ftp://")
        //    URL = "/general/" + URL;
        parent.openURL(URL, 0);
    }
    function b(URL, id) {
        set_current(id);
        URL = "/app/" + URL;
        parent.openURL(URL, 0);
    }
    //add by YZQ 2008-03-05 begin
    function bindFunc() {
        var args = [];
        for (var i = 0, cnt = arguments.length; i < cnt; i++) {
            args[i] = arguments[i];
        }
        var __method = args.shift();
        var object = args.shift();
        return (
    function() {
        var argsInner = [];
        for (var i = 0, cnt = arguments.length; i < cnt; i++) {
            argsInner[i] = arguments[i];
        }
        return __method.apply(object, args.concat(argsInner));
    });
    }
    var timerId = null;
    var firstTime = true;
    //add by YZQ 2008-03-05 end
    function d(URL, id) {
        //add by YZQ 2008-03-05 begin
        var winMgr = parent.parent.table_index.main.winManager;
        if (!winMgr) {
            if (firstTime) {
                parent.openURL("/fis/common/frame.jsp", 0);
                firstTime = false;
            }
            timerId = setTimeout(bindFunc(d, window, URL, id), 100);
            return;
        }
        firstTime = true;
        if (timerId) {
            clearTimeout(timerId);
        }
        if (winMgr) {
            winMgr.openActionPort("/fis/" + URL, document.getElementById("f" + id).innerText);
            return;
        }
        //add by YZQ 2008-03-05 end

        set_current(id);
        URL = "/fis/" + URL;
        parent.openURL(URL, 0);
    }
    //-------- 菜单全部展开/收缩 -------
    var menu_flag = 1;
    function menu_expand() {
        if (menu_flag == 1)
            expand_text.innerHTML = "收缩";
        else
            expand_text.innerHTML = "展开";

        menu_flag = 1 - menu_flag;

        var links = document.getElementsByTagName("A");
        for (i = 0; i < links.length; i++) {
            srcelement = links[i];
            if (srcelement.parentNode.className.toUpperCase() == "L1" || srcelement.parentNode.className.toUpperCase() == "L21") {
                targetelement = document.getElementById(srcelement.id + "d");
                if (menu_flag == 0) {
                    targetelement.style.display = '';
                    srcelement.className = "active";
                }
                else {
                    targetelement.style.display = "none";
                    srcelement.className = "";
                }
            }
        }
    }

    //-------- 打开windows程序 -------
    function winexe(NAME, PROG) {
        URL = "/general/winexe?PROG=" + PROG + "&NAME=" + NAME;
        window.open(URL, "winexe", "height=100,width=350,status=0,toolbar=no,menubar=no,location=no,scrollbars=yes,top=0,left=0,resizable=no");
    }
</script>


</body>
</html>
