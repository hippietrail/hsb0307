﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_publish_siteTask_edit" Codebehind="siteTask_edit.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../../sysImages/<%Response.Write(Hg.Config.UIConfig.CssPath());%>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>

<script language="javascript" type="text/javascript">
<!--
function loadStat()
{
      if(document.getElementById("NewsID").checked)
      {
        document.getElementById("newsidd").style.display = "";
      }
      if(document.getElementById("Data").checked)
      {
        document.getElementById("newsdata").style.display = "";
      }
      if(document.getElementById("LastNewsNum_checkbox").checked)
      {
        document.getElementById("lastnumm").style.display = "";
      }
}
//-->
</script>
</head>
<body onload="loadStat();">
    <form id="form1" runat="server">
   <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" class="toptable">
    <tr>
      <td height="1" colspan="2"></td>
    </tr>
    <tr>
      <td width="57%" class="sysmain_navi"  style="PADDING-LEFT: 14px" Height="30">编辑任务</td>
      <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px"><div align="left">位置导航:<a href="../main.aspx" target="sys_main" class="list_link">首页</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="siteTask.aspx" class="list_link">任务管理首页</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />޸编辑任务</div></td>
    </tr>
  </table>
 <table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" class="Navitable">
    <tr>
      <td height="18" style="width: 45%" colspan="2" style="PADDING-LEFT: 14px"><div align="left"> <a href="siteTask.aspx" class="topnavichar">任务管理</a>  <a href="siteTask_add.aspx?type=base" class="topnavichar">添加任务</a></div>
      </td>
    </tr>
  </table>
  <div id="NoContent" runat="server"></div>
  <table width="98%" border="0" cellpadding="5" align="center" cellspacing="1" class="table" id="base">
    <tr class="TR_BG" id="base_tr">
              <td align="left" colspan="2" class="list_link"><strong></strong></td>
    </tr>
    <tr class="TR_BG_list" id="base_name">
      <td  align="right" style="width: 178px; height: 24px;" class="list_link">任务名称:</td>
      <td align="Left" class="list_link" style="height: 24px" ><asp:TextBox ID="TaskName" MaxLength="50" runat="server" />
        (<font color=red size=2>*</font>)<asp:RequiredFieldValidator ID="TaskNamee" runat="server" ControlToValidate="TaskName" Display="Dynamic" ErrorMessage="<span class=reshow>(*)任务名称不能为空!</span>"></asp:RequiredFieldValidator><span class="helpstyle" onclick="Help('H_task_0001',this)" style="cursor: help;" title="点击查看帮助">帮助</span></td>
    </tr>
    <tr class="TR_BG_list" id="base_index">
      <td align="right"  class="list_link" style="width: 178px">生成首页</td>
      <td  align="left" class="list_link"><asp:CheckBox ID="isIndex" runat="server" Checked="true"/>
        <span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_task_0002',this)">帮助</span></td>
    </tr>
    <tr class="TR_BG_list" id="IsTimee">
      <td align="right"  class="list_link" style="width: 178px">定时发布</td>
      <td  align="left" class="list_link"><select name="TimeSet" class="form" id="TimeSet" runat="server" multiple="true" style="width: 100px; height: 100px">
      <option value="0">0</option>
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
      <option value="5">5</option>
      <option value="6">6</option>
      <option value="7">7</option>
      <option value="8">8</option>
      <option value="9">9</option>
      <option value="10">10</option>
      <option value="11">11</option>
      <option value="12">12</option>
      <option value="13">13</option>
      <option value="14">14</option>
      <option value="15">15</option>
      <option value="16">16</option>
      <option value="17">17</option>
      <option value="18">18</option>
      <option value="19">19</option>
      <option value="20">20</option>
      <option value="21">21</option>
      <option value="22">22</option>
      <option value="23">23</option>
      <option value="24">24</option></select><span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_task_0012',this)">帮助</span></td>
    </tr>
     <tr class="TR_BG_list" id="base_time" style="display:none;">
      <td align="right"  class="list_link" style="width: 178px">创建时间</td>
      <td  align="left" class="list_link"><asp:TextBox ID="CreatTime" runat="server" Width="124px" CssClass="form" Enabled="false"/>
        <span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_task_0003',this)">帮助</span></td>
    </tr>
     <tr class="TR_BG" id="class_tr">
              <td align="left" colspan="2" class="list_link"><strong>栏目</strong></td>
    </tr>
    <% string str_publicType = Hg.Config.verConfig.PublicType;
       if (str_publicType == "1")
       {
    %>
    <tr class="TR_BG_list" id="class_index1" >
      <td align="right"  class="list_link" style="width: 178px">生成索引页</td>
      <td  align="left" class="list_link"><asp:CheckBox ID="AllClass1" runat="server" />生成所有栏目的索引页
        <span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_task_0004',this)">帮助</span><br />
        <asp:CheckBox ID="EveryDayClass1" runat="server" />每天一页的方式生成栏目索引
        <span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_task_0005',this)">帮助</span><br />
        <asp:CheckBox ID="TodayClass1" runat="server" />只生成今天栏目的索引页
        <span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_task_0006',this)">帮助</span></td>
    </tr>
   <% 
        }
        else
        {
   %>
   <tr class="TR_BG_list" id="class_index2" >
      <td align="right"  class="list_link" style="width: 178px">生成索引页</td>
      <td  align="left" class="list_link"><asp:CheckBox ID="AllClass0" runat="server" />生成所有栏目的索引页
        <span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_task_0004',this)">帮助</span><br />
        <asp:CheckBox ID="TodayClass0" runat="server" />只生成今天栏目的索引页
        <span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_task_0006',this)">帮助</span></td>
    </tr>
   <%
        }
   %>
    <tr class="TR_BG_list" id="class_class">
      <td align="right"  class="list_link" style="width: 178px">选择栏目</td>
      <td  align="left" class="list_link"><div id="divClassNews" runat="server" style="padding-bottom:0;padding-left:0;padding-right:0;padding-top:0;" align="left"></div><div id="aaa" align="center" runat="server"><span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_task_0007',this)">帮助</span></div></td>
    </tr>
     <tr class="TR_BG" id="news_tr">
       <td align="left" colspan="2" class="list_link"><strong></strong></td>
    </tr>
    
    <tr class="TR_BG_list" id="Tr1" >
      <td align="right"  class="list_link" style="width: 178px">所有新闻</td>
      <td  align="left" class="list_link">
      <input type="radio" runat="server" id="AllNews"  onclick="DispChange(9)"/>&nbsp;
      <input type="radio" runat="server" id="NewsID" onclick="DispChange(0)"/>ID&nbsp;
      <input type="radio" runat="server" id="Data" onclick="DispChange(1)"/>&nbsp;
      <input type="radio" runat="server" id="LastNewsNum_checkbox" onclick="DispChange(2)"/>
      <asp:DropDownList ID="unHTML" runat="server">
      <asp:ListItem Value="0" Text="生成所有的"></asp:ListItem>
      <asp:ListItem Value="1" Text="没有生成的"></asp:ListItem>
      <asp:ListItem Value="2" Text="已经生成的"></asp:ListItem>
      </asp:DropDownList>
     </td>
    </tr>
    
    <tr class="TR_BG_list" id="newsidd"  style="display:none" align="right">
      <td align="right"  class="list_link" style="width: 178px">ID</td>
      <td  align="left" class="list_link"> <asp:TextBox ID="NewsID1" runat="server" Width="66px"/>  <asp:TextBox ID="NewsID2" runat="server" Width="66px"/><span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_task_0009',this)">帮助</span></td>
    </tr>
    
    <tr class="TR_BG_list" id="newsdata" style="display:none">
      <td align="right"  class="list_link" style="width: 178px">日期：</td>
      <td  align="left" class="list_link">
      <asp:TextBox ID="Data1" runat="server" Width="120px" />
      <img src="../../sysImages/folder/s.gif" alt="开始日期" border="0" style="cursor:pointer;" onclick="selectFile('date',document.form1.Data1,150,450);document.form1.Data1.focus();" /> 
       <asp:TextBox ID="Data2" runat="server" Width="120px" />
      <img src="../../sysImages/folder/s.gif" alt="结束日期" border="0" style="cursor:pointer;" onclick="selectFile('date',document.form1.Data2,150,450);document.form1.Data2.focus();" />
      <span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_task_0010',this)">帮助</span></td>
    </tr>
    
    <tr class="TR_BG_list" id="lastnumm" style="display:none" >
      <td align="right"  class="list_link" style="width: 178px"></td>
      <td  align="left" class="list_link">新闻数量:<asp:TextBox ID="LastNewsNum" runat="server" Width="66px" />&nbsp;<span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_task_0011',this)">帮助</span></td>
    </tr>
        
    <tr class="TR_BG_list" id="news_class" >
      <td align="right"  class="list_link" style="width: 178px">栏目</td>
      <td  align="left" class="list_link"><div id="divClassClass" runat="server" style="padding-bottom:0;padding-left:0;padding-right:0;padding-top:0;" align="left"></div><div id="Div2" align="center" runat="server"><span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_task_0007',this)">帮助</span></div></td>
    </tr>
     <tr class="TR_BG" id="special_tr">
              <td align="left" colspan="2" class="list_link"><strong><span style="color: #000033">专题</span></strong></td>
    </tr>
         <tr class="TR_BG_list" id="special_sp" >
      <td align="right"  class="list_link" style="width: 178px">专题</td>
      <td  align="left" class="list_link"><div id="DivSpecial" runat="server" style="padding-bottom:0;padding-left:0;padding-right:0;padding-top:0;" align="left"></div><div id="Special_span" align="center" runat="server"><span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_task_00013',this)">帮助</span></div></td>
    </tr>
    <tr class="TR_BG_list" id="save">
       <td align="center" colspan="2" class="list_link"><label>
         <input type="submit" name="Save" value="保存" class="form" id="Savetask" runat="server" onserverclick="Savetask_ServerClick" /></label>
                &nbsp;&nbsp;<label>
            <input type="reset" name="Clear" value="重置" class="form" id="Cleartask" runat="server"/></label>
        </td>
     </tr>
    </table>
    </form>
    <br />
<table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
  <tr>
    <td align="center"><label id="copyright" runat="server" /></td>
  </tr>
</table>
</body>
</html>

<script type="text/javascript" language="javascript">
<!--
function DispChange(value)
{
    switch(parseInt(value))
    {
        case 0:
            document.getElementById("newsidd").style.display="";
            document.getElementById("newsdata").style.display="none";
            document.getElementById("lastnumm").style.display="none";
            break;
        case 1:
            document.getElementById("newsidd").style.display="none";
            document.getElementById("newsdata").style.display="";
            document.getElementById("lastnumm").style.display="none";
            break;
        case 2:
            document.getElementById("newsidd").style.display="none";
            document.getElementById("newsdata").style.display="none";
            document.getElementById("lastnumm").style.display="";
            break;
        case 9:
            document.getElementById("newsidd").style.display="none";
            document.getElementById("newsdata").style.display="none";
            document.getElementById("lastnumm").style.display="none";
            break;
    }
}

function PageClass(arr_class)
{
    var Class = arr_class.split(",");
    for(var j=0;j<document.form1.divclassNews.options.length;j++)
    {
        for(var i=0;i<Class.length;i++)
        {
            if(document.form1.divclassNews.options[j].value==Class[i])
            {
                document.form1.divclassNews.options[j].selected=true;
            }
       }
    }
}
function PageNews(arr_news)
{
    var News = arr_news.split(",");
    for(var j=0;j<document.form1.divclassClass.options.length;j++)
    {
        for(var i=0;i<News.length;i++)
        {
            if(document.form1.divclassClass.options[j].value==News[i])
            {
                document.form1.divclassClass.options[j].selected=true;
            }
       }
    }
}
function PageSpecial(arr_special)
{
    var Special = arr_special.split(",");
    for(var j=0;j<document.form1.SpecialID.options.length;j++)
    {
        for(var i=0;i<Special.length;i++)
        {
            if(document.form1.SpecialID.options[j].value==Special[i])
            {
                document.form1.SpecialID.options[j].selected=true;
            }
       }
    }
}
function PageTimeSet(arr_timeset)
{
    var TimeSete = arr_timeset.split(",");
    for(var j=0;j<document.form1.TimeSet.options.length;j++)
    {
        for(var i=0;i<TimeSete.length;i++)
        {
            if(document.form1.TimeSet.options[j].value==TimeSete[i])
            {
                document.form1.TimeSet.options[j].selected=true;
            }
       }
    }
}
//-->
</script>
<% showjs(); %>
