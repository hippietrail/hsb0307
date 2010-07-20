<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Manage_Login1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> <%Response.Write(Hg.Config.UIConfig.HeadTitle); %></title>
    <meta http-equiv="X-UA-Compatible" content="IE=7" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style type="text/css">
        * {
	FONT-SIZE: 12px; COLOR: #333333; FONT-FAMILY: Tahoma, Verdana, Arial, Helvetica, sans-serif
}
        BODY
        {
            padding-right: 0px;
            padding-left: 0px;
            padding-bottom: 0px;
            margin: 20px auto auto 6px;
            line-height: 22px;
            padding-top: 0px;
            text-align: center;
        }
        IMG
        {
            border-top-width: 0px;
            border-left-width: 0px;
            border-bottom-width: 0px;
            border-right-width: 0px;
        }
        A:link
        {
            font-weight: normal;
            font-size: 12px;
            line-height: 18px;
            text-decoration: none;
        }
        A:visited
        {
            font-weight: normal;
            font-size: 12px;
            line-height: 18px;
            text-decoration: none;
        }
        A:hover
        {
            font-weight: normal;
            font-size: 12px;
            line-height: 18px;
            text-decoration: underline;
        }
        A:active
        {
            font-weight: normal;
            font-size: 12px;
            line-height: 18px;
            text-decoration: underline;
        }
        .tip
        {
            padding-right: 0px;
            padding-left: 46px;
            padding-bottom: 6px;
            color: #999;
            padding-top: 4px;
        }
        #Logo
        {
            margin: auto;
            width: 760px;
            text-align: left;
        }
        #Logo .lg
        {
            position: absolute;
            top: 22px;
        }
        #Logo .nav
        {
   
            float: right;
            color: #1a82d2;
            margin-right: 5px;
        }
        #Main
        {
            margin: auto;
            width: 770px;
            text-align: center;
        }
        #Bot
        {
            clear: both;
            border-top: #dadada 1px solid;
            margin: 65px auto auto;
            width: 750px;
            line-height: 18px;
            padding-top: 13px;
            text-align: center;
            font-size:15px;
        }
        #Bot A
        {
            color: #494949;
        }
        #Banner
        {
            margin-top: 30px;
            float: left;
            width: 503px;
            height: 170px;
        }
        #Banner .conn_left
        {
            background: #208de1;
            float: left;
            width: 3px;
            height: 170px;
        }
        #Banner .conn_img
        {
            margin-top: 164px;
        }
        #Banner .index_banner
        {
            background: #208de1;
            float: left;
            width: 216px;
            height: 170px;
        }
        #Banner .index_bg
        {
            padding-right: 0px;
            padding-left: 4px;
            background: url(../sysImages/Login/index_login_bg.gif) repeat-y;
            float: left;
            padding-bottom: 0px;
            font: 12px/24px tahoma;
            width: 280px;
            color: #fff;
            padding-top: 25px;
            height: 145px !important;
            text-align: left;
        }
        #Banner .color
        {
            clear: both;
            border-top: #fff 2px solid;
            background: #d4ecff;
            width: 503px;
            height: 16px;
        }
        #Banner UL
        {
            margin: 12px 0px 0px 6px;
            list-style-type: none;
        }
        #Banner UL LI
        {
            height: 48px;
            text-align: left;
        }
        .txt
        {
            color: #1274ba;
        }
        .txt_
        {
            font-family: tahoma;
        }
        .txt1
        {
            color: #f86b2d;
        }
        .txt2
        {
            font-size: 11px !important;
            font-family: tahoma;
        }
        .left
        {
            float: left;
        }
        .right
        {
            float: right;
        }
        #Login
        {
            float: left;
            width: 255px;
            color: #494949;
            font-family: tahoma;
        }
        #Login .top
        {
            background: url(../sysImages/Login/login_top_bg.gif) repeat-x;
            height: 4px;
        }
        #Login .login_bg
        {
            border-right: #8a8a8a 1px solid;
            background: #f9f9f9;
            border-left: #8a8a8a 1px solid;
            height: 310px;
        }
        #Login .lg_title
        {
            padding-left: 4px;
            margin: 0px 11px;
            padding-top: 3px;
            border-bottom: #b5b5b5 1px solid;
            height: 23px;
            text-align: left;
        }
        #Login .lg_title1
        {
            padding-left: 4px;
            margin: 20px 11px;
            padding-top: 3px;
            border-bottom: #b5b5b5 1px solid;
            text-align: left;
        }
        #Login .lg_title2
        {
            padding-left: 4px;
            margin: 0px 11px;
            color: #ff0000;
            padding-top: 3px;
            text-align: left;
        }
        #Login .input_id
        {
            margin: 0px 0px 0px 26px;
            text-align: left;
        }
        #Login .input_pwd
        {
            margin: 6px 0px 0px 26px;
            text-align: left;
        }
        #Login .input_yzm
        {
            margin: 6px 0px 0px 20px;
            text-align: left;
        }
        #Login .input_vc
        {
            margin: 6px 0px 0px 14px;
            text-align: left;
        }
        #Login .input_post
        {
            margin: 8px 0px 0px 69px;
            text-align: left;
        }
        #Login .input_fpwd
        {
            margin: 5px 0px 0px 32px;
            text-align: left;
        }
        #Login .bottom
        {
            background: url(../sysImages/Login/login_bottom_bg.gif) repeat-x;
            height: 4px;
        }
        #Login .intro_txt
        {
            margin-left: 62px;
            color: #959595;
            text-align: left;
        }
        #Login .txt3
        {
            clear: both;
            margin: 15px 0px 0px 22px;
            text-align: left;
        }
        .input_n
        {
            padding-right: 0px;
            padding-left: 2px;
            padding-bottom: 0px;
            font: 12px tahoma;
            width: 110px;
            border-top-style: inset;
            padding-top: 2px;
            border-right-style: inset;
            border-left-style: inset;
            height: 15px !important;
            border-bottom-style: inset;
        }
        .input_s
        {
            font-weight: bold;
            width: 62px;
            border-top-style: outset;
            padding-top: 2px;
            border-right-style: outset;
            border-left-style: outset;
            height: 27px;
            border-bottom-style: outset;
        }
        #Right
        {
            margin-top: 30px;
            background: #a5d3f7;
            float: left;
            width: 12px;
            height: 170px;
        }
        #Right .color
        {
            border-top: #fff 2px solid;
            margin-top: 170px;
            background: #d4ecff;
            width: 12px;
            height: 16px;
        }
        .colorfocus
        {
            border-right: #86a1ba 1px double;
            border-top: #86a1ba 1px double;
            border-left: #86a1ba 1px double;
            border-bottom: #86a1ba 1px double;
            background-color: #fff8e6;
        }
        .colorblur
        {
            border-right: #86a1ba 1px double;
            border-top: #86a1ba 1px double;
            border-left: #86a1ba 1px double;
            border-bottom: #86a1ba 1px double;
            background-color: #ffffff;
        }
.button {
	BORDER-RIGHT: #93b9dc 1px solid; BORDER-TOP: #93b9dc 1px solid; BACKGROUND: url(button_bg.gif); BORDER-LEFT: #93b9dc 1px solid; BORDER-BOTTOM: #93b9dc 1px solid
}
    </style>
</head>
<body>
    <div id="Logo">
        <div style="float: left">
            <div class="lg">
                <a href="http://www.hgzp.cn/" target="_blank">
                    <img src="../sysImages/Login/Logo.gif" border="0"></a></div>
        </div>
        <div class="nav">
            <a href="http://www.hgzp.cn/" target="_blank">官方网站</a>&nbsp;|&nbsp;<a href="http://help.hgzp.cn/"
                target="_blank">在线帮助</a></div>
        <div style="clear: both">
        </div>
    </div>
    <div id="Main">
        <div id="Banner">
            <div class="conn_left">
                <img height="3" src="../sysImages/Login/index_conn_left.gif" width="3"><img class="conn_img"
                    height="3" src="../sysImages/Login/index_conn_left_bottom.gif" width="3"></div>
            <div class="index_banner">
                <img src="../sysImages/Login/login.gif"></div>
            <div class="index_bg">
                全静态发布及面向搜索引擎设计<br>
                可视化及拖拽式的模板制作<br>
                支持多站点，网站群管理<br>
                精确化建设、协作化管理、流程化控制<br>
                降低开发周期、降低总体成本、降低实施风险
            </div>
            <div style="margin-top: 6px; text-align: left">
                &nbsp;&nbsp;&nbsp;</div>
        </div>
        <div id="Login">
            <div class="top">
                <div class="left">
                    <img height="4" src="../sysImages/Login/login_conn_left.gif" width="4"></div>
                <div class="right">
                    <img height="4" src="../sysImages/Login/login_conn_right.gif" width="4"></div>
            </div>
            <div class="login_bg">
                <form id="form1" runat="server">
                <div class="lg_title">
                    <b class="txt">管理员登录</b></div>
                <div class="lg_title2">
                    <asp:Label Style="font-size: 12px" Width="100%" ID="MessageLabel" runat="server" /><br />
                </div>
                <div class="input_id">
                    帐 号：<asp:TextBox  Width="120px" class="colorblur" 
                        onfocus="this.className='colorfocus';" onblur="this.className='colorblur';"
                        ID="TxtName" runat="server" />
                    <asp:RequiredFieldValidator ID="f_UserNameX" ControlToValidate="TxtName"
                        ErrorMessage="*" Display="Dynamic" runat="server" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtName"
                        ValidationExpression="[^']+" ErrorMessage="*" Display="Dynamic" />&nbsp;<b class="txt1"></b></div>
                <div class="input_pwd">
                    密 码：<asp:TextBox Width="120px" class="colorblur" onfocus="this.className='colorfocus';" onblur="this.className='colorblur';"
                        ID="TxtPassword" TextMode="Password" runat="server" />
                    <asp:RequiredFieldValidator ControlToValidate="TxtPassword" ID="f_PasswordX"
                        ErrorMessage="*" Display="Dynamic" runat="server" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TxtPassword"
                        ValidationExpression="[^']+" ErrorMessage="*" Display="Dynamic" /></div>
                <asp:PlaceHolder ID="safeCodeVerify_1" runat="server">
                <div class="input_yzm">
                    安全码：<asp:TextBox Width="120px" class="colorblur" onfocus="this.className='colorfocus';" onblur="this.className='colorblur';"
                        ID="TxtSafeCode" TextMode="Password" runat="server" />
                    <asp:RequiredFieldValidator ControlToValidate="TxtSafeCode" ID="f_safeCodeVerify"
                        ErrorMessage="*" Display="Dynamic" runat="server" />
                    </div>
                 </asp:PlaceHolder>
             
                    <div class="input_yzm">
                        验证码：<asp:TextBox Width="70px" class="colorblur" onfocus="this.className='colorfocus';" onblur="this.className='colorblur';"
                            ID="TxtVerify" runat="server" />
                         <script type="text/javascript" language="JavaScript">
                   var numkey = Math.random();
                   numkey = Math.round(numkey*10000);
                   document.write("<span  style=\" vertical-align:middle; text-align:left ;\" ><img src=\"../comm/Image.aspx?k="+ numkey +"\" width=\"70\" onClick=\"this.src+=Math.random()\" alt=\"图片看不清？点击重新得到验证码\" style=\"cursor:pointer;line-height:23px; margin:0px;\" height=\"22\" hspace=\"4\" /></span>");
                </script>&nbsp;
                    </div>
               
                    <div class="input_post">
                     <asp:HiddenField ID="HidUrl" runat="server" />
                        <asp:Button class="button" ID="LoginSubmit" Text="登 录" runat="server" OnClick="login_Click"/>&nbsp;&nbsp;&nbsp;
                        <asp:Button class="button" runat="server" Text="关 闭" OnClientClick="javascript:window.close();" />
                    </div>
                    <div class="lg_title1">
                    </div>
                <div class="txt3">
                    当前版本：<asp:Literal ID="Version" runat="server">WebFastCMS v1.0.0 sp4</asp:Literal><br />
                    .NET 版本：<asp:Literal ID="NetVersion" runat="server">.NET 2.0</asp:Literal><br />
                    数据库：<asp:Literal ID="Database" runat="server">Microsoft SQL Server 2005</asp:Literal>
                </div>
                </form>
            </div>
            <div class="bottom">
			<div class="left"><img src="../sysImages/Login/login_conn_left_b.gif" width="4" height="4" /></div>
			<div class="right"><img src="../sysImages/Login/login_conn_right_b.gif" width="4" height="4" /></div>
		    </div>
		
        </div>
        <div style="clear:both"></div>
    </div>
    <div id="Bot">
<A HREF="" target="_blank" style="text-decoration:none"><span><%Response.Write(CopyRight); %></span></A></div>
</body>
</html>
