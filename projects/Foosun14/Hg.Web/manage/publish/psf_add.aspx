<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_publish_psf_add" Codebehind="psf_add.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../../sysImages/<%Response.Write(Hg.Config.UIConfig.CssPath());%>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
   <form id="form1" runat="server">
   <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" class="toptable">
    <tr>
      <td height="1" colspan="2"></td>
    </tr>
    <tr>
      <td width="57%" class="sysmain_navi"  style="PADDING-LEFT: 14px" Height="30">新建PSF节点</td>
      <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">位置导航：<a href="../main.aspx" class="list_link" target="sys_main">首页</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="psf.aspx" class="list_link">PSF节点管理</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />新建psf节点</div></td>
    </tr>
  </table>
  <table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" class="Navitable">
    <tr>
      <td height="18" style="width: 45%" colspan="2" style="PADDING-LEFT: 14px"><div align="left"><a href="psf.aspx" class="topnavichar">节点管理</a>&nbsp;┊&nbsp;<a href="psf_add.aspx" class="topnavichar">新建节点</a></div>
      </td>
    </tr>
  </table>
  <div id="NoContent" runat="server"></div>
  <table width="98%" border="0" cellpadding="5" align="center" cellspacing="1" class="table" id="OM_AddNew">
    <tr class="TR_BG_list">
      <td colspan="2" class="list_link"><strong>PSF节点</strong></td>
    </tr>
    <tr class="TR_BG_list">
      <td  align="right" style="width: 178px; height: 24px;" class="list_link">节点名称:</td>
      <td align="Left" class="list_link" style="height: 24px" ><asp:TextBox ID="psfName" MaxLength="50" runat="server" CssClass="form"/>
        (<font color=red size=2>*</font>)<asp:RequiredFieldValidator ID="psfNamere" runat="server" ControlToValidate="psfName" Display="Dynamic" ErrorMessage="<span class=reshow>(*)节点名称必填!</span>"></asp:RequiredFieldValidator><span class="helpstyle" onclick="Help('H_psf_0001',this)" style="cursor:help;" title="">帮助</span></td>
    </tr>
    
    <tr class="TR_BG_list">
      <td align="right" class="list_link" style="width: 178px; height: 34px;">目录对应:</td>
      <td align="left" style="height: 34px"><div id="default" style="margin-bottom:1px;">本地目录<input name="LocalDir" type="text" style="width:130px;" maxlength="200" value="" class="form" id="LocalDir"/>远程目录<input name="RemoteDir" type="text" id="RemoteDir" value="" style="width:130px;" maxlength="100" class="form" />(<font color="red">*</font>)<span class="helpstyle" onclick="Help('H_psf_0006',this)" style="cursor: help;" title="">帮助</span>&nbsp;<font color="red">(<a href="javascript:psf_add()" class="list_link"><font color="red"><strong>继续添加</strong></font></a>)</font></div><div id="temp"></div></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="right"  class="list_link" style="width: 178px">上传最新:</td>
      <td  align="left" class="list_link"><asp:CheckBox ID="isAll" runat="server" />
        <span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_psf_0007',this)">帮助</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="right"  class="list_link" style="width: 178px">上传子目录:</td>
      <td  align="left" class="list_link"><asp:CheckBox ID="isSub" runat="server" />
        <span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_psf_0003',this)">帮助</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="right"  class="list_link" style="width: 178px">创建时间</td>
      <td  align="left" class="list_link"><asp:TextBox ID="CreatTime" runat="server" Width="124px" CssClass="form" Enabled="false"/>
        <span class="helpstyle" style="cursor:help;" title="点击查看帮助" onClick="Help('H_psf_0005',this)">帮助</span></td>
    </tr>
    <tr class="TR_BG_list">
       <td align="center" colspan="2" class="list_link"><label>
         <input type="submit" name="Save" value="保存" class="form" id="SavePsf" runat="server" onserverclick="SavePsf_ServerClick"/></label>
                &nbsp;&nbsp;<label>
            <input type="reset" name="Clear" value="重置" class="form" id="ClearPsf" runat="server"/></label>
        </td>
     </tr>
    </table>
  </form>
    <br />
<table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
  <tr>
    <td align="center"><label id="copyright" runat=server /></td>
  </tr>
</table>
</body>
<script language="javascript">
setCookie("psf_txt_num",0);
function psf_add()
{
    var num = 0;
    if(getCookie("psf_txt_num") != null || getCookie("psf_txt_num")!= "null")
    {
	    num = parseInt(getCookie("psf_txt_num"));
	    if(num>99)
	    {
	        return;
	    }
	    num = num +1;
	    setCookie("psf_txt_num",num);
	}
    var chars = "1234567890";
    var randNum = makeRandChar(chars,20);
    var tempstr = "<div id='"+randNum+"'>本地目录<input name='LocalDir' type='text' style='width:130px;' maxlength='200' value='' class='form' id='LocalDir' />远程目录<input name='RemoteDir' type='text' id='RemoteDir' value='' style='width:130px;' maxlength='100' class='form' /><a href='#' onclick='psf_delete(this.parentNode)' class='list_link'>删除</a>(<font color='red'>*</font>)</div>"; 
    document.getElementById("temp").innerHTML+=tempstr;
}
function psf_delete(divobj)
{
    divobj.parentNode.removeChild(divobj);  
    var num = parseInt(getCookie("psf_txt_num"));
    num = num - 1;
	setCookie("psf_txt_num",num);
}

function makeRandChar(chars,marklen)
{//
    var tmpstr = '';
    var chrlen = chars.length;
    var iRandom ;
    do{
        iRandom = Math.round(Math.random() * chrlen);
        tmpstr += chars.charAt(iRandom);
        if( tmpstr.length == marklen ) break;    
    }while (tmpstr.length < marklen)
    return tmpstr;
}
</script>
</html>