<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" Inherits="manage_news_News_list" Codebehind="News_list.aspx.cs" %>
<%@ Import NameSpace="System.Data"%>
<%@ Register Src="../../controls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.divstyle {
	overflow:hidden;
	position:absolute;
	left:80px;
	top:62px;
	background:#FFFFE1 repeat-x left top;
	border:1px double #4F4F4F;
	width:88%;
	text-align:left;
	padding-left:8px;
	padding-top:8px;
	padding-bottom:12px;
	padding-right:8px;
	clip:rect(auto, auto, auto, auto);
	z-index:50;
	filter: progid:DXImageTransform.Microsoft.DropShadow(color=#B6B6B6,offX=2,offY=2,positives=true);

</style>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<script language="javascript" type="text/javascript">
<!--
var trold = null;
var classStr = "Foosun<%Response.Write(Request.QueryString["ClassID"]); %>"
function GetAllChecked()
{
    var retstr = "";
    var tb = document.getElementById("tablist");
    var j = 0;
    for(var i=1;i<tb.rows.length;i++)
    {
        var objtr = tb.rows[i];
        if(objtr.cells.length < 6)
            continue;
        var objtd = objtr.cells[5];
        for(var k=0;k<objtd.childNodes.length;k++)
        {
            var objnd = objtd.childNodes[k];
            if(objnd.type == "checkbox")
            {
                if(objnd.checked)
                {
                    if(j>0)
                        retstr += ",";
                    retstr += objnd.value;
                    j++;
                }
                break;
            }
        }
    }
    return retstr;
}

//��ȡ��ǰ��Ŀ���������ŵ�id
function GetAllNews()
{
    var retstr = "";
    var tb = document.getElementById("tablist");
    var j = 0;
    for(var i=1;i<tb.rows.length;i++)
    {
        var objtr = tb.rows[i];
        if(objtr.cells.length < 6)
            continue;
        var objtd = objtr.cells[5];
        for(var k=0;k<objtd.childNodes.length;k++)
        {
            var objnd = objtd.childNodes[k];
            if(objnd.type == "checkbox")
            {
                  if(j>0)
                  retstr += ",";
                  retstr += objnd.value;
                  j++;
            }
        }
    }
    return retstr;
}

function SetTop(id)
{
    if(confirm('ȷ��Ҫ��ѡ�е����Ź̶���?'))
    {
        //var tb = objtb.options[objtb.selectedIndex].value;
        var param = "Option=SetTop&NewsID="+ id;
        var options={
        method:'post',
        parameters:param,
        onComplete:
        function(transport)
	    {
		   var retv=transport.responseText;
		   OnSetTop(retv);
		} 
	  }
	new  Ajax.Request('News_List.aspx',options);  
    }
}

function UnSetTop(id)
{
    if(confirm('ȷ��Ҫ��ѡ�е����Ž����?'))
    {
        //var tb = objtb.options[objtb.selectedIndex].value;
        var param = "Option=UnSetTop&NewsID="+ id;
        var options={
        method:'post',
        parameters:param,
        onComplete:
        function(transport)
	    {
		   var retv=transport.responseText;
		   OnSetTop(retv);
		} 
	  }
	new  Ajax.Request('News_List.aspx',options);  
    }
}

function setLock(id)
{
    var l = id;
    if(l == "")
    {
        alert("��û��ѡ��Ҫ����������!");
        return;
    }
    if(confirm('ȷ��Ҫ��������ѡ���������?'))
    {
        SendAjax("LockNews",l);
    }
}

function setUNLock(id)
{
    var l = id;
    if(l == "")
    {
        alert("��û��ѡ��Ҫȡ������������!");
        return;
    }
    if(confirm('ȷ��Ҫȡ����������ѡ���������?'))
    {
        SendAjax("UNLockNews",l);
    }
}


function CheckStat(id)
{
    var l;
    if(id < 0)
    {
        l = GetAllChecked();
        if(l == "")
        {
            alert("��û��ѡ��Ҫ��˵�����!");
            return;
        }
    }
    else
    {
        l = id;
    }
    if(confirm('ȷ��Ҫ�������ѡ���������'))
    {
        SendAjax("CheckStatNews",l);
    }
}


function OnSetTop(ret)
{
    alert(ret);
    __doPostBack('PageNavigator1$LnkBtnGoto','');
}

function Recycle(id)
{
    var l;
    if(id < 0)
    {
        l = GetAllChecked();
        if(l == "")
        {
            alert("��û��ѡ��Ҫɾ��������!");
            return;
        }
    }
    else
    {
        l = id;
    }
    if(confirm('ȷ��Ҫɾ������ѡ���������?�����Ž����������վ�С�'))
    {
        SendAjax("RecyleNews",l);
    }
}

function ToOld()
{
debugger;

   var cl = GetAllChecked();
   if(classStr=="Foosun")
   {
     if(cl == "")
     {
        alert("��û��ѡ��Ҫ�鵵������!");
        return;
     }
     else
     {
        if(confirm('ȷ�Ϲ鵵��\n���鵵��ѡ�������\n���棺�˲��������档\n�������Ҫ�˲������밴 [ȷ��]��ť'))
        {
            SendAjax("ToOldNews",cl);
        }
     }
   }
   else
   {
        if(confirm('ȷ�Ϲ鵵��\n���鵵��ѡ�������\n�����ûѡ�����ţ����鵵������Ŀ�������������š�\n���棺�˲��������档\n�������Ҫ�˲������밴 [ȷ��]��ť'))
        {
             if(cl == "")
             {
                 SendAjax("ToOldNewsClass","<%Response.Write(Request.QueryString["ClassID"]); %>");
             }
             else
             {
                 SendAjax("ToOldNews",cl);
             }
         }
   }
}

function Delete(id)
{
    var l;
    if(id < 0)
    {
        l = GetAllChecked();
        if(l == "")
        {
            alert("��û��ѡ��Ҫɾ��������!");
            return;
        }
    }
    else
    {
        l = id;
    }
    if(confirm('ȷ��Ҫ����ɾ������ѡ���������?�����Ž����ܱ��ָ�!'))
    {
        SendAjax("DeleteNews",l);
    }
}

function SendAjax(op,id)
{
    var HiddenSpecialID = document.getElementById("HiddenSpecialID").value;
    var param = "Option="+ op +"&NewsID="+ id + "&HiddenSpecialID=" + HiddenSpecialID;
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
	new  Ajax.Request('News_List.aspx',options);   
}

function Lock()
{
    var l = GetAllChecked();
    if(l == "")
    {
        alert("��û��ѡ��Ҫ����������!");
        return;
    }
    if(confirm('ȷ��Ҫ��������ѡ���������?'))
    {
        SendAjax("LockNews",l);
    }
}

function clearFiles()
{
    var l = GetAllChecked();
    if(l == "")
    {
        if(confirm('�˲���������������ѡ�����û�õ�����?\n��������ݼ������ļ��������!'))
        {
            SendAjax("clearFiles","foosun");
        }
    }
    else
    {
        if(confirm('��ȷ��Ҫ��������ѡ�����ŵ�����û�õĸ�����?\n��������ݼ������ļ��������!'))
        {
            SendAjax("clearFiles",l);
        }
    }
}


function ResetOrder()
{
    var l = GetAllChecked();
    if(l == "")
    {
        alert("��û��ѡ��Ҫ���õ�����!");
        return;
    }
    if(confirm('ȷ��Ҫ����ѡ����������?\n���ú�����Ȩ�ظ���Ϊ0(��ͼ�)'))
    {
        SendAjax("ResetOrder",l);
    }
}

function makeFilesHTML()
{
    var l = GetAllChecked();
    if(l == "")
    {
        alert("��û��ѡ��Ҫ���ɵ�����!");
        return;
    }
    SendAjax("makeFilesHTML",l);
}

function XMLRefresh(id)
{
     if(id == "")
    {
        alert("��ѡ����Ŀ����XML!");
        return;
    }
     SendAjax("XMLRefresh",id);
}

function makeClassIndex(id)
{
        alert("�Ż��桢��ý��ž߱��˹���!");
        return;
}

function ClassRefresh(classid)
{
    SendAjax("ClassRefresh",classid);
}

function UNLock()
{
    var l = GetAllChecked();
    if(l == "")
    {
        alert("��û��ѡ��Ҫȡ������������!");
        return;
    }
    if(confirm('ȷ��Ҫȡ����������ѡ���������?'))
    {
        SendAjax("UNLockNews",l);
    }
}

function CheckStat1()
{
    var l = GetAllChecked();
    if(l == "")
    {
        alert("ѡ������!");
        return;
    }
    if(confirm('ȷ����ѡ��������ȫ��ͨ���ռ������?'))
    {
        SendAjax("allCheck",l);
    }
}

function onRcvMsg(rtstr)
{
    if(rtstr.length > 200)
    {
        alert("��Ǹ������ʧ��");
    }
    else
    {
        var n = rtstr.indexOf("%");
        alert(rtstr.substr(n+1,rtstr.length-n-1));
        if(parseInt(rtstr.substr(0,n)) > 0)
        {
            __doPostBack('PageNavigator1$LnkBtnGoto','');
        }
    }
}

function ClickHandler(obj)
{
    var strn = GetAllChecked();
    //var seltb = document.getElementById("DdlNewsTable");
    //var val = seltb.options[seltb.selectedIndex].value;
    location.href = "News_Manage.aspx?Option="+ obj +"&ids="+ strn +"&dbtab=<%Response.Write(DPre); %>news";
}
function ShowDetail(obj)
{
    var trx = obj.parentNode.parentNode;
    var n = trx.rowIndex;
    n += 1;
    var tb = trx.parentNode;
    var trn = tb.rows[n];
    if(trold != null && trold != trn && trold.style.display == '')
        trold.style.display = 'none';
    if(trn.style.display == '')
        trn.style.display = 'none';
    else
        trn.style.display = '';
    trold = trn;
}
function ModPic(obj)
{
   var td1 = obj.parentNode.parentNode.lastChild;
   var chk = td1.lastChild;
   if(chk != null && chk.type == "checkbox")
   {
    var idx = chk.value;
    var objtb = document.getElementById("DdlNewsTable");
    var tbx = objtb.options[objtb.selectedIndex].value;
    window.open('News_PicSet.aspx?id='+ idx +'&tb='+ tbx,'','status=0,directories=0,resizable=0,toolbar=0,location=0,scrollbars=1,width=550,height=480');
   }
}

function delNum(ClassID)
{
    if(confirm('ȷ��Ҫ��ո���Ŀ�µ�����������?\n���棬�˲��������棡'))
    {
        //var tb = objtb.options[objtb.selectedIndex].value;
        var param = "Option=delNumber&NewsID="+ ClassID;
        var options={
        method:'post',
        parameters:param,
        onComplete:
        function(transport)
	    {
		   var retv=transport.responseText;
		   OnSetTop(retv);
		} 
	  }
	new  Ajax.Request('News_List.aspx',options);  
    }
}

//�������
function delSelectedNum()
{    
    var l;
    l = GetAllNews();
    if(l == "")
    {
        alert("��ǰ��Ŀû������!");
        return;
    }
    if(confirm('��ȷ��������е�������?��պ󽫲��ܱ��ָ�!'))
    {
         SendAjax("DeleteNews",l);
    }
}

function AddToJS(id)
{
    var l;
    if(id < 0)
    {
        l = GetAllChecked();
        if(l == "")
        {
            alert("��û��ѡ��Ҫ����JS������!");
            return;
        }
    }
    else
    {
        l = id;
    }
	if (l!="") 
	{
	
	    window.open('Frame.aspx?NewsID=' + l,'', 'width=350, height=250, top=300,left=250,toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
	}
	else alert('��ѡ������');
}

function AddToSpecial(id)
{
    var l;
    if(id < 0)
    {
        l = GetAllChecked();
        if(l == "")
        {
            alert("��û��ѡ��Ҫ����ר�������!");
            return;
        }
    }
    else
    {
        l = id;
    }
	if (l!="") 
	{
	
	    window.open('Frame.aspx?Special=1&NewsID=' + l,'', 'width=350, height=250, top=300,left=250,toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
	}
	else alert('��ѡ������');
}

function closediv()
{
     document.getElementById("opld").style.display="none";
}

//-->
</script>
</head>
<body>
<form id="form1" runat="server">
<div id="opld" class="divstyle" style="text-align:center;display:none;">
    <div style="text-align:right;cursor:pointer;"><img alt="�ر�" src="../../sysImages/folder/colosediv.gif" border="0" onclick="closediv();" /></div>
    <asp:LinkButton ID="LnkBtnHeadline" CssClass="topnavichar" runat="server" OnClick="LnkBtnHeadline_Click">ͷ��</asp:LinkButton>&nbsp;��&nbsp;
    <asp:LinkButton ID="LnkBtnSlide" CssClass="topnavichar" runat="server" OnClick="LnkBtnSlide_Click">�õ�Ƭ</asp:LinkButton>&nbsp;��&nbsp;<asp:LinkButton ID="LnkBtnmy" CssClass="topnavichar" runat="server" OnClick="LnkBtnmy_Click">�ҵ���Ϣ</asp:LinkButton>&nbsp;��&nbsp;
    <asp:LinkButton ID="LnkBtnisHtml" CssClass="topnavichar" runat="server" OnClick="LnkBtnisHtml_Click">������</asp:LinkButton>&nbsp;��&nbsp;<asp:LinkButton ID="LnkBtnunisHtml" CssClass="topnavichar" runat="server" OnClick="LnkBtnunisHtml_Click">δ����</asp:LinkButton>&nbsp;��&nbsp;<asp:LinkButton ID="LnkBtnundiscuzz" CssClass="topnavichar" runat="server" OnClick="LnkBtnundiscuzz_Click">����������</asp:LinkButton>&nbsp;��&nbsp;<asp:LinkButton ID="LnkBtnuncommat" CssClass="topnavichar" runat="server" OnClick="LnkBtnuncommat_Click">��������</asp:LinkButton>&nbsp;��&nbsp;<asp:LinkButton ID="LnkBtnunvoteTF" CssClass="topnavichar" runat="server" OnClick="LnkBtnunvoteTF_Click">����ͶƱ</asp:LinkButton>&nbsp;��&nbsp;<asp:LinkButton ID="LnkBtnuncontentPicTF" CssClass="topnavichar" runat="server" OnClick="LnkBtnuncontentPicTF_Click">���л�</asp:LinkButton>&nbsp;��&nbsp;<asp:LinkButton ID="LnkBtnunPOPTF" CssClass="topnavichar" runat="server" OnClick="LnkBtnunPOPTF_Click">���Ȩ��</asp:LinkButton>&nbsp;��&nbsp;<asp:LinkButton ID="LnkBtnunFilesURL" CssClass="topnavichar" runat="server" OnClick="LnkBtnunFilesURL_Click">�и�����</asp:LinkButton></div>
<div>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
        <tr>
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="30%" class="sysmain_navi"  style="PADDING-LEFT: 14px; height: 32px;" >���Ź���</td>
          <td width="70%" class="topnavichar"  style="PADDING-LEFT: 14px; height: 32px;" ><div align="left">������<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="News_List.aspx" target="sys_main" class="list_link">���Ź���</a><span id="naviClassName" runat="server" /></div></td>
        </tr>
        </table>
              <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
                <tr>
                  <td style="PADDING-LEFT: 14px;"><a href="News_list.aspx" class="topnavichar" title="���б��ڵ�������Ϣ">ȫ��</a>&nbsp;��&nbsp;<a href="news_add.aspx?ClassID=<%Response.Write(Request.QueryString["ClassID"]); %>&EditAction=Add" class="topnavichar"><font color="red">���</font></a>&nbsp;��&nbsp;<asp:LinkButton
                          ID="LnkBtnAuditing" CssClass="topnavichar" runat="server" OnClick="LnkBtnAuditing_Click">�����</asp:LinkButton>&nbsp;��&nbsp;<asp:LinkButton
                              ID="LnkBtnUnAuditing" CssClass="topnavichar" runat="server" OnClick="LnkBtnUnAuditing_Click">δ���</asp:LinkButton>&nbsp;��&nbsp;<asp:LinkButton
                                  ID="LnkBtnContribute" CssClass="topnavichar" runat="server" OnClick="LnkBtnContribute_Click">Ͷ��</asp:LinkButton>&nbsp;��&nbsp;<asp:LinkButton
                                    ID="LinkBtnLock" CssClass="topnavichar" runat="server" OnClick="LnkBtnLock_Click">����</asp:LinkButton>&nbsp;��&nbsp;<asp:LinkButton   
                                        ID="LinkBtnUnLock" CssClass="topnavichar" runat="server" OnClick="LnkBtnUnLock_Click">����</asp:LinkButton>&nbsp;��&nbsp;<asp:LinkButton 
                                            ID="LnkBtnCommend" CssClass="topnavichar" runat="server" OnClick="LnkBtnCommend_Click">�Ƽ�</asp:LinkButton>&nbsp;��&nbsp;<asp:LinkButton
                                              ID="LnkBtnTop" CssClass="topnavichar" runat="server" OnClick="LnkBtnTop_Click">�ö�</asp:LinkButton>&nbsp;��&nbsp;<asp:LinkButton
                                                  ID="LnkBtnHot" CssClass="topnavichar" runat="server" OnClick="LnkBtnHot_Click">�ȵ�</asp:LinkButton>&nbsp;��&nbsp;<asp:LinkButton
                                                      ID="LnkBtnPic" CssClass="topnavichar" runat="server" OnClick="LnkBtnPic_Click">ͼƬ</asp:LinkButton>&nbsp;��&nbsp;<asp:LinkButton
                                                          ID="LnkBtnSplendid" CssClass="topnavichar" runat="server" OnClick="LnkBtnSplendid_Click">����</asp:LinkButton>&nbsp;��&nbsp;<span  onclick="document.getElementById('opld').style.display='block';" style="cursor:pointer;">����</span>&nbsp;��&nbsp;<asp:DropDownList ID="DdlSite"  Width="88px" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DdlSite_SelectedIndexChanged"></asp:DropDownList>
                                                            </td>
                </tr>
        </table>

    <div align="left"  style="PADDING-LEFT: 14px;"><a href="javascript:Recycle(-1)" class="topnavichar">ɾ��</a>��<a href="javascript:Delete(-1)" class="topnavichar">����ɾ��</a>��<a href="javascript:CheckStat1()" class="topnavichar" title="���ѡ��������">���</a><%--&nbsp;��&nbsp;<a href="javascript:Recycle(-1)" class="topnavichar">ȡ�����</a>--%>��<a href="javascript:Lock()" class="topnavichar">����</a>��<a href="javascript:UNLock()" class="topnavichar">����</a>��<a href="javascript:ResetOrder()" class="topnavichar">����Ȩ��</a>��<a href="javascript:ClickHandler('BnMove')" class="topnavichar">�ƶ�</a>��<a href="javascript:ClickHandler('BnCopy')" class="topnavichar">����</a>��<a href="javascript:ToOld()" class="topnavichar">�鵵</a>��<a href="javascript:AddToJS(-1)" class="topnavichar" title="��ѡ�������ż�������JS">JS</a>��<a href="javascript:AddToSpecial(-1)" class="topnavichar" title="��ѡ�������ż���ר��">ר��</a>��<span id="deltable" runat="server"></span>��<a href="javascript:ClickHandler('BnProperty')" class="topnavichar" title="������������">����</a><span id="isMakeHTML" runat="server">��<a href="javascript:makeFilesHTML()" class="topnavichar" title="����ѡ�������ŵľ�̬ҳ��">���ɾ�̬�ļ�</a></span>��<label id="XMLFile" runat="server" />��<label id="ClassNewsIndex" runat="server" />��<label id="ClassRefresh" runat="server" /><span style="display:none;">��<a href="javascript:clearFiles()" class="topnavichar">������</a></span></div>
  
      <asp:Repeater ID="DataList1" runat="server"  OnItemDataBound="DataList1_ItemDataBound">
    <HeaderTemplate>
         <table id="tablist" width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="table">
      <tr class="TR_BG">
        <td align="center" class="sysmain_navi" style="width:25px;"></td>
        <td align="center" class="sysmain_navi">����</td>
        <td align="left" class="sysmain_navi" style="width:60px;">�༭</td>
       <td align="center" class="sysmain_navi" style="width:130px;">��˲���</td>
        <td align="center" class="sysmain_navi" style="width:35px;">״̬</td>
        <td align="center" class="sysmain_navi" style="width:200px;">����<input name="Checkboxc" type="checkbox" onclick="javascript:selectAll(this.form,this.checked);" /></td>
      </tr>
    </HeaderTemplate>
    <ItemTemplate>
      <tr class="TR_BG_list"  onmouseover="overColor(this)" onmouseout="outColor(this)">
          <td class="list_link" align="center"><asp:Image runat="server" onclick="ShowDetail(this)" ID="ImgOrder" Width="18" BorderWidth="0" AlternateText='<%#((DataRowView)Container.DataItem)["OrderID"]%>' style="CURSOR: hand"/></td>
          <td class="list_link"><asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" NavigateUrl='<%#((DataRowView)Container.DataItem)["URLaddress"]%>'><asp:Image runat="server" ID="ImgNewType" AlternateText='<%#((DataRowView)Container.DataItem)["NewsType"]%>' onclick="ModPic(this.parentNode)"/></asp:HyperLink><asp:Image ID="ImgPic" runat="server" AlternateText='<%#((DataRowView)Container.DataItem)["NewsType"]%>' onclick="ModPic(this)"/><a class="list_link" title="<%#((DataRowView)Container.DataItem)["NewsTitle"]%>" href="News_add.aspx?ClassID=<%#((DataRowView)Container.DataItem)["ClassID"]%>&NewsID=<%#((DataRowView)Container.DataItem)["NewsID"]%>&EditAction=Edit"><%#((DataRowView)Container.DataItem)["NewsTitles"]%></a><%#((DataRowView)Container.DataItem)["CommNum"]%><%#((DataRowView)Container.DataItem)["isConstrs"]%></td> 
          <td align="left"><a href="News_list.aspx?ClassID=<%#((DataRowView)Container.DataItem)["ClassID"]%>&Editor=<%#((DataRowView)Container.DataItem)["Editor"]%>" title="�鿴�˱༭/��Ա������" class="list_link"><%#((DataRowView)Container.DataItem)["Editor"]%></a><a href="../../<%Response.Write(Foosun.Config.UIConfig.dirUser); %>/showuser-<%#((DataRowView)Container.DataItem)["Editor"]%>.aspx" target="_blank"><img src="../../sysImages/folder/addnew.gif" alt="" title="�鿴��Ա����" border="0" /></a></td>
          <td class="list_link" align="center"><%#((DataRowView)Container.DataItem)["CheckStats"]%></td>
          <td align="center"><%#((DataRowView)Container.DataItem)["htmllock"]%></td>
          <td align="center"><%#((DataRowView)Container.DataItem)["op"]%></td>
      </tr>  
       <tr class="TR_BG_list" style="display:none">
        <td class="list_link" colspan="7" style="height:30px;">������Ŀ:<%#((DataRowView)Container.DataItem)["ClassCName"]%> &nbsp;�� &nbsp;����:<%#((DataRowView)Container.DataItem)["Author"]%>&nbsp;��  &nbsp;��������:<asp:Label runat="server" ID="LblProperty" Text='<%#((DataRowView)Container.DataItem)["NewsProperty"]%>' /> &nbsp;�� &nbsp;�����<%#((DataRowView)Container.DataItem)["Click"]%></td>
       </tr>
     </ItemTemplate>
     <FooterTemplate>
    </table>
     </FooterTemplate>
    </asp:Repeater>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="2" style="height: 20px">
<tr><td align="left">    ��������:
        &nbsp;&nbsp;
        ��Ŀ:
        <asp:TextBox ID="keyWorks" runat="server" CssClass="form" onclick="selectFile('newsclass',document.form1.keyWorks,300,500);document.form1.keyWorks.focus();" Width="141px"></asp:TextBox>
        &nbsp;
�ؼ���:
        <asp:TextBox runat="server" ID="TxtKeywords" size="15" />
        &nbsp;
        <asp:DropDownList ID="DdlKwdType" runat="server">
            <asp:ListItem Value="title" Text="����" />
            <asp:ListItem Value="content" Text="����" />
            <asp:ListItem Value="author" Text="����" />
            <asp:ListItem Value="editor" Text="�༭" />
            <asp:ListItem Value="souce" Text="��Դ" />
        </asp:DropDownList>
         &nbsp;&nbsp;
         <asp:Button runat="server" ID="BtnSearch" Text=" ���� " CssClass="form" OnClick="BtnSearch_Click"/></td><td align="right">
         </td></tr>
 <tr><td align="right" colspan="2">   <uc1:PageNavigator ID="PageNavigator1" runat="server" />
</td></tr>
</table>     
    </div>
    </form>
<br />
<br />
 <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px">
  <tr>
    <td align="center"><div id="SiteCopyRight" runat="server" /></td>
  </tr>
</table>
    <asp:Label ID="LblChoose" runat="server" Visible="False" Width="49px"></asp:Label>
    <input id="HiddenSpecialID" runat="server" type="hidden" />
</body>
</html>
