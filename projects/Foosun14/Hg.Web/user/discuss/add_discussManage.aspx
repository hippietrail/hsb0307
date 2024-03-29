<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" AutoEventWireup="true" Inherits="user_add_discussManage" EnableEventValidation="false" Codebehind="add_discussManage.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
    <title></title>
    <link href="../../sysImages/<%Response.Write(Hg.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript">			
			function ChangeSort(obj)
			{
			    var val = obj.options[obj.selectedIndex].value;
			    if(val == '0')
			    {		  
			        document.getElementById('ClassIDList2').options.length = 0;
			        var sel = document.getElementById('ClassIDList2');
			        var opts = document.createElement('option');
                    opts.value = "0";
                    opts.innerText = "请选择";
                    sel.appendChild(opts);
			        return;
			    }
                var param = "provinces="+ val;
                 var options={
                 method:'post',
                    parameters:param,
                    onComplete:
                    function(transport)
	                {
		            var retv=transport.responseText;
		             onRcvMsg(retv);
		            } 
	            }
	            new  Ajax.Request('add_discussManage.aspx',options);  
			}
		    function onRcvMsg(retv)
			{
			  var sel = document.getElementById('ClassIDList2');
			  var inpt = retv.split(";");
			  sel.options.length = 0;
	          var opts = document.createElement('option');
              opts.value = "0";
              opts.innerText = "请选择";
              sel.appendChild(opts);
            for(var i=0;i<inpt.length;i++)
                 {
                    var opt = document.createElement('option');
                    var txt = inpt[i].split(",");
                    opt.value = txt[0];
                    opt.innerText = txt[1];
                      if(opt.innerText!="undefined")
                      {
                        sel.appendChild(opt);
                      }
                 }
			}
    </script>
</head>
<body>
    <form id="form1" name="form1" method="post" action="" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
            <tr>
                <td height="1" colspan="2">
                </td>
            </tr>
            <tr>
                <td width="57%" class="sysmain_navi" style="padding-left: 14px">
                    讨论组管理</td>
                <td width="43%" class="topnavichar" style="padding-left: 14px">
                    <div align="left">
                        位置导航：<a href="../main.aspx" target="sys_main" class="list_link">首页</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a
                            href="discussManage_list.aspx" class="menulist">讨论组管理</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />添加讨论组</div>
                </td>
            </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
            <tr>
                <td>
                    <span class="topnavichar" style="padding-left: 14px"><a href="discussManage_list.aspx"
                        class="menulist">讨论组列表</a> <a href="discussManagejoin_list.aspx" class="menulist">我加入的讨论组</a>&nbsp;&nbsp;
                        <a href="discussManageestablish_list.aspx" class="menulist">我建立的讨论组</a>&nbsp;&nbsp;
                        <a href="add_discussManage.aspx" class="menulist">添加讨论组</a></span></td>
            </tr>
        </table>
        <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF"
            class="table" id="addmanage">
            <tr class="TR_BG_list">
                <td class="list_link" width="25%">
                    讨论组名称</td>
                <td class="list_link" width="75%">
                    <asp:TextBox ID="CnameBox" runat="server" Width="314px" CssClass="form"></asp:TextBox>&nbsp;
                    <span class="helpstyle" style="cursor: help;" title="点击查看帮助" onclick="Help('H_discussManage_0001',this)">
                        帮助</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CnameBox"
                        ErrorMessage="请输入讨论组名称"></asp:RequiredFieldValidator></td>
            </tr>
            <tr class="TR_BG_list">
                <td class="list_link" width="25%">
                    讨论组系统分类</td>
                <td class="list_link" width="75%">
                    <asp:DropDownList ID="ClassIDList1" runat="server" onchange="ChangeSort(this)" Width="142px"
                        CssClass="form">
                    </asp:DropDownList>&nbsp; <span class="helpstyle" style="cursor: help;" title="点击查看帮助"
                        onclick="Help('H_discussManage_0002',this)">帮助</span></td>
            </tr>
            <tr class="TR_BG_list">
                <td class="list_link" width="25%">
                    讨论组子分类</td>
                <td class="list_link" width="75%">
                    <asp:DropDownList ID="ClassIDList2" runat="server" Width="142px" CssClass="form">
                    </asp:DropDownList>
                    <a href="discusssubclass_add.aspx" class="list_link">添加子分类</a>&nbsp; <span class="helpstyle"
                        style="cursor: help;" title="点击查看帮助" onclick="Help('H_discussManage_0003',this)">
                        帮助</span></td>
            </tr>
            <tr class="TR_BG_list">
                <td class="list_link" width="25%">
                    是否对外公开</td>
                <td class="list_link" width="75%">
                    <asp:RadioButtonList ID="AuthorityList1" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">是</asp:ListItem>
                        <asp:ListItem>否</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr class="TR_BG_list">
                <td class="list_link" width="25%">
                    是否允许组员发表主题</td>
                <td class="list_link" width="75%">
                    <asp:RadioButtonList ID="AuthorityList2" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">是</asp:ListItem>
                        <asp:ListItem>否</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr class="TR_BG_list">
                <td class="list_link" width="25%">
                    是否允许非组员发帖</td>
                <td class="list_link" width="75%">
                    <asp:RadioButtonList ID="AuthorityList4" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">是</asp:ListItem>
                        <asp:ListItem>否</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr class="TR_BG_list">
                <td class="list_link" width="25%">
                    组员加入设置</td>
                <td class="list_link" width="75%">
                    <input id="Radio1" type="radio" onclick="DispChanges()" runat="server" checked="true" />直接加入
                    <input id="Radio2" type="radio" onclick="DispChanges()" runat="server" />拒绝加入
                    <input id="Radio3" type="radio" onclick="DispChanges()" runat="server" />需要积分或金币加入
                    &nbsp; <span class="helpstyle" style="cursor: help;" title="点击查看帮助" onclick="Help('H_discussManage_0004',this)">
                        帮助</span></td>
            </tr>
            <tr class="TR_BG_list" style="display: none" id="numbers">
                <td class="list_link" width="25%" style="height: 70px">
                    需要积分或金币</td>
                <td class="list_link" width="75%" style="height: 70px">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="15%">金币</td>
                            <td width="35%">
                                <asp:TextBox ID="gPointBox" runat="server" CssClass="form">0</asp:TextBox>&nbsp;<span
                                    class="helpstyle" style="cursor: help;" title="点击查看帮助" onclick="Help('H_discussManage_0005',this)">帮助</span></td>
                            <td width="50%">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="gPointBox"
                                    ErrorMessage="您输入的格式不对" ValidationExpression="^[1-9]\d*|0$"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td colspan="3" height="2">
                            </td>
                        </tr>
                        <tr>
                            <td>积分</td>
                            <td>
                                <asp:TextBox ID="iPointBox" runat="server" CssClass="form">0</asp:TextBox>&nbsp;<span
                                    class="helpstyle" style="cursor: help;" title="点击查看帮助" onclick="Help('H_discussManage_0006',this)">帮助</span></td>
                            <td>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="iPointBox"
                                    ErrorMessage="您输入的格式不对" ValidationExpression="^[1-9]\d*|0$" Display="Dynamic"></asp:RegularExpressionValidator></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td class="list_link" width="25%">
                    内部公告</td>
                <td class="list_link" width="75%">
                    <asp:TextBox ID="D_annoBox" runat="server" TextMode="MultiLine" Height="50px" Width="314px" CssClass="form"></asp:TextBox>&nbsp;
                    <span class="helpstyle" style="cursor: help;" title="点击查看帮助" onclick="Help('H_discussManage_0007',this)">
                        帮助</span></td>
            </tr>
            <tr class="TR_BG_list">
                <td class="list_link">
                    讨论组对外说明</td>
                <td class="list_link">
                    <asp:TextBox ID="D_ContentBox" runat="server" Width="314px" Height="62px" TextMode="MultiLine"
                        CssClass="form"></asp:TextBox>&nbsp; <span class="helpstyle" style="cursor: help;"
                            title="点击查看帮助" onclick="Help('H_discussManage_0008',this)">帮助</span></td>
            </tr>
            <tr class="TR_BG_list">
                <td class="list_link">
                </td>
                <td class="list_link">
                    &nbsp; &nbsp; &nbsp;
                    <asp:Button ID="but1" runat="server" Text="提  交" OnClick="but1_Click" CssClass="form" />
                    &nbsp; &nbsp;&nbsp;
                    <input type="reset" name="Submit3" value="重  置" class="form"></td>
            </tr>
        </table>
        <br />
        <br />
        <table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
            <tr>
                <td>
                    <div align="center">
                        <%Response.Write(CopyRight); %>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

<script type="text/javascript" language="javascript">
function DispChanges()
{
    var obj = document.getElementById("Radio3").checked;
    var objs = document.getElementById("Radio2").checked;
    var objss = document.getElementById("Radio1").checked;
    if(obj)
    {
            document.getElementById("numbers").style.display="";
    }
    if(objs||objss)
    {
            document.getElementById("numbers").style.display="none";
    }
}
</script>

