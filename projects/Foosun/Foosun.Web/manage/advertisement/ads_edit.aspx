<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_advertisement_ads_edit" ResponseEncoding="utf-8" Codebehind="ads_edit.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>�޸Ĺ����Ϣ</title>
    <link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
    <form id="AdsForm" runat="server" method="post" action="">
      <table width="100%" border="0" cellpadding="0" cellspacing="0"  class="toptable">
        <tr>
          <td width="57%" class="sysmain_navi"  style="PADDING-LEFT: 14px" Height="30">�޸Ĺ����Ϣ</td>
          <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="list.aspx" target="sys_main" class="list_link">���ϵͳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�޸Ĺ����Ϣ</div></td>
        </tr>
      </table>
  <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
    <tr class="TR_BG_list">
      <td width="13%" align="center" class="navi_link" style="width: 15%">�������</td>
      <td colspan="2" align="left"><asp:TextBox ID="adName" runat="server" Width="200px" MaxLength="50" CssClass="form"></asp:TextBox>
        <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_AdsAdd_001',this)">����</span><span id="spanadName"></span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="center" class="navi_link">��������</td>
      <td colspan="2" align="left"><asp:DropDownList ID="ClassID" runat="server" CssClass="form" Width="205px"></asp:DropDownList>
        <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_AdsAdd_002',this)">����</span><span id="spanClassID"></span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 15%">�������</td>
      <td colspan="2" align="left"><asp:DropDownList ID="adType" runat="server" CssClass="form" Width="205px" onchange="javascript:checkadType(this.value);">
     </asp:DropDownList>
        <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_AdsAdd_003',this)">����</span></td>
    </tr>
    <tr class="TR_BG_list" id="TrleftPic">
      <td align="center" class="navi_link" style="width: 15%">(��ͼƬ/����)��ַ</td>
      <td colspan="2" align="left"><asp:TextBox ID="leftPic" runat="server" Width="200px" MaxLength="200" CssClass="form"></asp:TextBox> <img src="../../sysImages/folder/s.gif" style="cursor:pointer;" title="ѡ��ͼƬ"  onclick="selectFile('pic',document.AdsForm.leftPic,280,500);document.AdsForm.leftPic.focus();" />
        <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_AdsAdd_004',this)">����</span> <span id="spanleftPic"></span></td>
    </tr>
    <tr class="TR_BG_list" id="TrleftSize">
      <td align="center" class="navi_link" style="width: 15%">(��ͼƬ/����)���</td>
      <td colspan="2" align="left"><asp:TextBox ID="leftSize" runat="server" Width="200px" MaxLength="12" CssClass="form"></asp:TextBox>
        <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_AdsAdd_005',this)">����</span><span id="spanleftSize"></span><span id="spanleftSize1"></td>
    </tr>
    <tr class="TR_BG_list" style="display:none;" id="TrrightPic">
      <td align="center" class="navi_link" style="width: 15%">(��ͼƬ/����)��ַ</td>
      <td colspan="2" align="left"><asp:TextBox ID="rightPic" runat="server" Width="200px" MaxLength="200" CssClass="form"></asp:TextBox> <img src="../../sysImages/folder/s.gif" style="cursor:pointer;" title="ѡ��ͼƬ"  onclick="selectFile('pic',document.AdsForm.rightPic,280,500);document.AdsForm.rightPic.focus();" />
        <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_AdsAdd_006',this)">����</span><span id="spanRightPic"></span></td>
    </tr>
    <tr class="TR_BG_list" style="display:none;" id="TrrightSize">
      <td align="center" class="navi_link" style="width: 15%">(��ͼƬ/����)���</td>
      <td colspan="2" align="left"><asp:TextBox ID="rightSize" runat="server" Width="200px" MaxLength="12" CssClass="form"></asp:TextBox>
        <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_AdsAdd_007',this)">����</span><span id="spanrightSize"></span><span id="spanrightSize1"></span></td>
    </tr>
    <tr class="TR_BG_list" id="TrLinkURL">
      <td align="center" class="navi_link" style="width: 15%">���ӵ�ַ</td>
      <td colspan="2" align="left"><asp:TextBox ID="LinkURL" runat="server" Width="200px" MaxLength="200" CssClass="form"></asp:TextBox>
        <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_AdsAdd_008',this)">����</span><span id="spanLinkURL"></span><span id="spanLinkURL1"></span></td>
    </tr>
    <tr class="TR_BG_list" id="TrCycID" style="display:none;">
      <td align="center" class="navi_link" style="width: 15%">ѭ�����λ</td>
      <td colspan="2" align="left">
      <asp:DropDownList ID="CycID" runat="server" CssClass="form" Width="205px"> 
     </asp:DropDownList><input type="hidden" id="CycTF" runat="server" name="CycTF" />
        <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_AdsAdd_009',this)">����</span><span id="spanCycID"></span></td>
    </tr>
    <tr class="TR_BG_list" id="TrCycSpeed" style="display:none;">
      <td align="center" class="navi_link" style="width: 15%">ѭ���ٶ�</td>
      <td colspan="2" align="left"><asp:TextBox ID="CycSpeed" runat="server" Width="200px" MaxLength="4" CssClass="form" Text="0"></asp:TextBox>
        <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_AdsAdd_010',this)">����</span><span id="spanCycSpeed"></span><span id="spanCycSpeed1"></span></td>
    </tr>
    <tr class="TR_BG_list" id="TrCycDic" style="display:none;">
      <td align="center" class="navi_link" style="width: 15%">ѭ������</td>
      <td align="left"><asp:RadioButtonList ID="CycDic" runat="server" RepeatDirection="Horizontal">
          <asp:ListItem Value="0" Selected="true">��</asp:ListItem>
          <asp:ListItem Value="1" >��</asp:ListItem>
          <asp:ListItem Value="2" >��</asp:ListItem>
          <asp:ListItem Value="3" >��</asp:ListItem>
        </asp:RadioButtonList></td>
      <td align="left" Width="65%"><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_AdsAdd_011',this)">����</span></td>
    </tr>
    <tr class="TR_BG_list" style="display:none;" id="TrAdTxt">
      <td align="center" class="navi_link" style="width: 15%" valign="top">�������<br />(<a href="javascript:f_add()" class="list_link">���</a>)</td>
      <td colspan="2" align="left"><div id="DivadTxt" runat="server"></div></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 15%">��ʾ����</td>
      <td align="left"><asp:RadioButtonList ID="CondiTF" runat="server" RepeatDirection="Horizontal" Width="196px">
          <asp:ListItem Value="1" onclick="javascript:checkCondiTF(this.value);">��</asp:ListItem>
          <asp:ListItem Value="0" Selected="true" onclick="javascript:checkCondiTF(this.value);">��</asp:ListItem>
        </asp:RadioButtonList></td>
      <td align="left" Width="65%"><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_AdsAdd_012',this)">����</span></td>
    </tr>
    <tr class="TR_BG_list" style="display:none;" id="TrmaxShowClick">
      <td align="center" class="navi_link" style="width: 15%">�����ʾ��</td>
      <td colspan="2" align="left"><asp:TextBox ID="maxShowClick" runat="server" Width="200px" MaxLength="4" CssClass="form"></asp:TextBox>
        <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_AdsAdd_014',this)">����</span><span id="spanmaxShowClick"></span></td>
    </tr>
    <tr class="TR_BG_list" style="display:none;" id="TrTimeOutDay">
      <td align="center" class="navi_link" style="width: 15%">����ʱ��</td>
      <td colspan="2" align="left"><asp:TextBox ID="TimeOutDay" runat="server" Width="200px" CssClass="form" ReadOnly="true"></asp:TextBox>  <input class="form" type="button" value="ѡ������"  onclick="selectFile('date',document.AdsForm.TimeOutDay,160,400);document.AdsForm.TimeOutDay.focus();" />
        <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_AdsAdd_015',this)">����</span></td>
    </tr>
    <tr class="TR_BG_list"  style="display:none;" id="TrmaxClick">
      <td align="center" class="navi_link" style="width: 15%">�������</td>
      <td colspan="2" align="left"><asp:TextBox ID="maxClick" runat="server" Width="200px" MaxLength="4" CssClass="form"></asp:TextBox>
        <span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_AdsAdd_016',this)">����</span><span id="spanmaxClick">
          </span></td>
    </tr>
    <tr class="TR_BG_list">
      <td align="center" class="navi_link" style="width: 15%">�Ƿ�����</td>
      <td align="left"><asp:RadioButtonList ID="isLock" runat="server" RepeatDirection="Horizontal" Width="196px">
          <asp:ListItem Value="1">��</asp:ListItem>
          <asp:ListItem Value="0" Selected="True">��</asp:ListItem>
        </asp:RadioButtonList></td>
      <td align="left" Width="65%"><span class="helpstyle" style="cursor:help;" title="�����ʾ����" onclick="Help('H_AdsAdd_017',this)">����</span></td>
    </tr>
    <tr class="TR_BG_list">
      <td class="navi_link" colspan="3"><label>
        <input type="button" name="Sub_mit" value=" ȷ �� " class="form" onclick="javascript:checkData(document.AdsForm.adType.value);" id="Button1" />
        </label>
        <label>
        <input type="reset" name="UnDo" value=" �� �� " class="form" />
            <asp:HiddenField ID="H_AdsID" runat="server" /><asp:HiddenField ID="OldClass" runat="server" />
        </label></td>
    </tr>
  </table>      <br />
      <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px" align="center">
        <tr>
          <td align="center"><label id="copyright" runat="server" /></td>
        </tr>
      </table>
    </form>
</body>
</html>
<script language="javascript" type="text/javascript">
setCookie("ads_txt_num",<% =txtnum-1 %>);
function checkData(value)
{
    spanclear();
    var re = /^[0-9]{0,4}\|[0-9]{0,4}$/;
    var re1 = /^http:\/\/([\w-]+\.)+[\w-]+(\/[\w-.\/?%&=]*)?$/;    
    var re2 = /^[0-9]*$$/;
    if(document.AdsForm.adName.value=="")
    {
        document.getElementById("spanadName").innerHTML="<span class=reshow>(*)������������</spna>";
        return false;
    }
    if(document.AdsForm.ClassID.value=="")
    {
        document.getElementById("spanClassID").innerHTML="<span class=reshow>(*)��ѡ������Ŀ</spna>";
        return false;
    }
    if(value=="11")
    {
        var _arr=document.AdsForm.AdTxtContent
        if (typeof(_arr.length)=="undefined")
        {
	        if (_arr.value=="")
	        {
                document.getElementById("spanAdTxtContent").innerHTML="<span class=reshow>(*)������������ʾ����</spna>";
		        _arr.focus();
		        return false;
	        }
        }
        if (document.AdsForm.AdTxtColNum.value=="")
        {
            document.getElementById("spanAdTxtNum").innerHTML="<span class=reshow>(*)����������</spna>";
	        return false;
        }
        else
        {
	        for (var j=0;j<_arr.length;j++)
	        {	
		        if (_arr[j].value=="")
		        {
                    document.getElementById("spanAdTxtContent").innerHTML="<span class=reshow>(*)������������ʾ����</spna>";
			        _arr[j].focus();
			        return false;
		        }
	        }
        }
    }
    else
    {
        if(document.AdsForm.leftPic.value=="")
        {
            document.getElementById("spanleftPic").innerHTML="<span class=reshow>(*)������ͼƬ/������ַ</spna>";
            return false;
        }
        if(document.AdsForm.leftSize.value=="")
        {
            document.getElementById("spanleftSize").innerHTML="<span class=reshow>(*)������ͼƬ/������С</spna>";
            return false;
        }
        var leftsizevalue = document.AdsForm.leftSize.value;  
        if(re.test(leftsizevalue)==false)
        {
            document.getElementById("spanleftSize1").innerHTML="<span class=reshow>(*)��ʽ����ȷ,��ʽΪ(200|300),�߻��߿��ܳ�����λ��</spna>";
            return false;
        }
        if(value=="9")
        {
            if(document.AdsForm.rightPic.value=="")
            {
                document.getElementById("spanRightPic").innerHTML="<span class=reshow>(*)������ͼƬ/������ַ</spna>";
                return false;
            }    
            if(document.AdsForm.rightSize.value=="")
            {
                document.getElementById("spanrightSize").innerHTML="<span class=reshow>(*)������ͼƬ/������С</spna>";
                return false;
            }
            var rightSizevalue = document.AdsForm.rightSize.value;  
            if(re.test(rightSizevalue)==false)
            {
                document.getElementById("spanrightSize1").innerHTML="<span class=reshow>(*)��ʽ����ȷ,��ʽΪ(200|300),�߻��߿��ܳ�����λ��</spna>";
                return false;
            }
        }
        if(document.AdsForm.LinkURL.value=="")
        {
            document.getElementById("spanLinkURL").innerHTML="<span class=reshow>(*)���������ӵ�ַ</spna>";
            return false;
        }
        var LinkURLvalue = document.AdsForm.LinkURL.value;
        if(re1.test(LinkURLvalue)==false)
        {
            document.getElementById("spanLinkURL1").innerHTML="<span class=reshow>(*)���ӵ�ַ��ʽ����ȷ</spna>";
            return false;
        }
        if(value=="10")
        {
            if(document.AdsForm.CycID.value=="")
            {
                document.getElementById("spanCycID").innerHTML="<span class=reshow>(*)�����Ҫѭ���Ĺ���ٽ���ѡ��</spna>";
                return false;
            }
            if(document.AdsForm.CycSpeed.value=="")
            {
                document.getElementById("spanCycSpeed").innerHTML="<span class=reshow>(*)������ѭ���ٶ�</spna>";
                return false;
            }
            var CycSpeedvalue = document.AdsForm.CycSpeed.value;
            if(re2.test(CycSpeedvalue)==false)
            {
                document.getElementById("spanCycSpeed1").innerHTML="<span class=reshow>(*)ѭ���ٶ�ֻ��Ϊ������</spna>";
                return false;
            }
        }
    }
    if(document.AdsForm.CycTF.value== "1")
    {
        var maxShowClickvalue = document.AdsForm.maxShowClick.value;
        if(re2.test(maxShowClickvalue)==false)
        {
            document.getElementById("spanmaxShowClick").innerHTML="<span class=reshow>(*)�������ֻ��Ϊ������</spna>";
            return false;
        }
        var maxClickvalue = document.AdsForm.maxClick.value;
        if(re2.test(maxClickvalue)==false)
        {
            document.getElementById("spanmaxClick").innerHTML="<span class=reshow>(*)��ʾ����ֻ��Ϊ������</spna>";
            return false;
        }
    }
    document.AdsForm.action="ads_edit.aspx?Type=Update&CycTF="+document.AdsForm.CycTF.value;
    document.AdsForm.submit();
}
function spanclear()
{
    document.getElementById("spanmaxClick").innerHTML="";
    document.getElementById("spanmaxShowClick").innerHTML="";
    document.getElementById("spanCycSpeed1").innerHTML="";
    document.getElementById("spanCycSpeed").innerHTML="";
    document.getElementById("spanCycID").innerHTML="";
    document.getElementById("spanLinkURL1").innerHTML="";
    document.getElementById("spanLinkURL").innerHTML="";
    document.getElementById("spanRightPic").innerHTML="";
    document.getElementById("spanrightSize").innerHTML="";
    document.getElementById("spanrightSize1").innerHTML="";
    document.getElementById("spanleftSize").innerHTML="";
    document.getElementById("spanleftSize1").innerHTML="";
    document.getElementById("spanadName").innerHTML="";
    document.getElementById("spanrightSize1").innerHTML="";
    document.getElementById("spanAdTxtContent").innerHTML="";
    document.getElementById("spanleftPic").innerHTML="";
}
function checkCondiTF(value)
{
    if(value=="1")
    {
        document.getElementById("TrmaxShowClick").style.display="";
        document.getElementById("TrTimeOutDay").style.display="";
        document.getElementById("TrmaxClick").style.display="";
    }
    else
    {
        document.getElementById("TrmaxShowClick").style.display="none";
        document.getElementById("TrTimeOutDay").style.display="none";
        document.getElementById("TrmaxClick").style.display="none";
    }
}
function checkadType(value)
{
    hide();
    switch(value)
    {
        case "9":
            document.getElementById("TrrightPic").style.display="";
            document.getElementById("TrrightSize").style.display="";
            break;
        case "10":
            document.AdsForm.CycTF.value="1";
            document.getElementById("TrCycID").style.display="";
            document.getElementById("TrCycSpeed").style.display="";
            document.getElementById("TrCycDic").style.display="";
            break;
        case "11":
            document.getElementById("TrleftPic").style.display="none";
            document.getElementById("TrleftSize").style.display="none";
            document.getElementById("TrLinkURL").style.display="none";
            document.getElementById("TrAdTxt").style.display="";
            break;
        case "12":
            document.getElementById("TrrightPic").style.display="";
            document.getElementById("TrrightSize").style.display="";
            break;
        default:
            hide();
            break;
    }
}
function hide()
{
    document.getElementById("TrleftPic").style.display="";
    document.getElementById("TrleftSize").style.display="";
    document.getElementById("TrLinkURL").style.display="";
    document.getElementById("TrAdTxt").style.display="none";
    document.getElementById("TrrightPic").style.display="none";
    document.getElementById("TrrightSize").style.display="none";
    document.AdsForm.CycTF.value="0";
    document.getElementById("TrCycID").style.display="none";
    document.getElementById("TrCycSpeed").style.display="none";
    document.getElementById("TrCycDic").style.display="none";
}

function f_add()
{
    var num = 0;
    if(getCookie("ads_txt_num") != null || getCookie("ads_txt_num")!= "null")
    {
	    num = parseInt(getCookie("ads_txt_num"));
	    if(num>8)
	    {
	        return;
	    }
	    num = num +1;
	    setCookie("ads_txt_num",num);
	}
    var chars = "1234567890";
    var randNum = makeRandChar(chars,20);
    var tempstr = "<div id='"+randNum+"'>�ı����� <input name='AdTxtContent' type='text' style='width:130px;' maxlength='200' value='' class='form' /> ��ʽ <input name='AdTxtCss' type='text' style='width:30px;' maxlength='20' value='' class='form' /> ���ӵ�ַ <input name='AdTxtLink' type='text' id='AdTxtLink' value='' style='width:130px;' maxlength='100' class='form' /> <a href='#'onclick='f_delete(this.parentNode)' class='list_link'>ɾ��</a></div>"; 
    document.getElementById("temp").innerHTML+=tempstr;
}
function f_delete(divobj)
{
    divobj.parentNode.removeChild(divobj);  
    var num = parseInt(getCookie("ads_txt_num"));
    num = num - 1;
	setCookie("ads_txt_num",num);
}

function makeRandChar(chars,marklen)
{//���������
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
<% show(); %>