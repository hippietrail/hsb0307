<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_news_Recyle" ResponseEncoding="utf-8" Codebehind="Recyle.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
<form id="RecList" runat="server" method="post">
  <table width="100%" border="0" cellpadding="0" cellspacing="0"  class="toptable">
    <tr>
      <td width="57%" class="sysmain_navi"  style="PADDING-LEFT: 14px" Height="30">����վ</td>
      <td width="43%"  class="topnavichar"  style="PADDING-LEFT: 14px" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />����վ</div></td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr class="TR_BG_list">
      <td align="left">
      <table style="width:100%;" border="0" cellpadding="0" cellspacing="0" class="topnavitable">
          <tr>
            <td style="height:30px;width:7%;cursor:pointer;" align="center" onclick="javascript:ChangeDiv('NCList')"  id="TdNCList">������Ŀ</td>
            <td style="height:30px;width:7%;cursor:pointer;" align="center" onclick="javascript:ChangeDiv('NList')" id="TdNList">����</td>
            <td style="height:30px;width:7%;cursor:pointer;" align="center" onclick="javascript:ChangeDiv('CList')" id="TdCList">Ƶ��</td>
            <td style="height:30px;width:7%;cursor:pointer;" align="center" onclick="javascript:ChangeDiv('SList')" id="TdSList">ר��</td>
            <td style="height:30px;width:7%;cursor:pointer;" align="center" onclick="javascript:ChangeDiv('LCList')" id="TdLCList">��ǩ��Ŀ</td>
            <td style="height:30px;width:7%;cursor:pointer;" align="center" onclick="javascript:ChangeDiv('LList')" id="TdLList">��ǩ</td>
            <td style="height:30px;width:7%;cursor:pointer;" align="center" onclick="javascript:ChangeDiv('StCList')" id="TdStCList">��ʽ��Ŀ</td>
            <td style="height:30px;width:7%;cursor:pointer;" align="center" onclick="javascript:ChangeDiv('StList')"  id="TdStList">��ʽ</td>
            <td style="height:30px;width:7%;cursor:pointer;" align="center" onclick="javascript:ChangeDiv('PSFList')" id="TdPSFList">PSF</td>
            <td style="height:30px;width:7%;cursor:pointer;"  align="center" onclick="javascript:ChangeDiv('APIList');" id="TdAPIList">API</td>
            <td></td>
          </tr>
        </table></td>
    </tr>
    <tr class="TR_BG_list">
    <td align="left" colspan="9" style="background-color:White;">
    <div id="List">
    </div>
    </td></tr>
  </table>
<br />
<br />
<table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px" align="center">
  <tr>
    <td align="center"><label id="copyright" runat="server" /></td>
  </tr>
</table>
</form>
</body>
</html>
<script language="javascript" type="text/javascript">
function ChangeDiv(ID)
{
	Selete(ID);
	setCookie("type",ID);
    setCookie("page",0);
	GetList(ID,0);
}

function Selete(ID)
{
	document.getElementById("TdNCList").className='';
	document.getElementById("TdNList").className='';
	document.getElementById("TdCList").className='';
	document.getElementById("TdSList").className='';
	document.getElementById("TdLList").className='';
	document.getElementById("TdLCList").className='';
	document.getElementById("TdStCList").className='';
	document.getElementById("TdStList").className='';
	document.getElementById("TdPSFList").className='';
	document.getElementById("TdAPIList").className='';
	document.getElementById("Td"+""+ID+"").className='reshow';
}

function RAll(Type)//ȫ���ָ�
{
    switch (Type)
    {
        case "NCList":
            if(confirm('��ȷ�ϻָ�ȫ����������Ŀ��?')){getresult(Type,"RAll","");}
            break;
        case "NList":
            if(confirm('��ȷ�ϻָ�ȫ����������?')){getresult(Type,"RAll","");}
            break;
        case "CList":
            if(confirm('��ȷ�ϻָ�ȫ����Ƶ����?')){getresult(Type,"RAll","");}
            break;
        case "SList":
            if(confirm('��ȷ�ϻָ�ȫ����ר����?')){getresult(Type,"RAll","");}
            break;
        case "LList":
            if(confirm('��ȷ�ϻָ�ȫ���ı�ǩ��?')){getresult(Type,"RAll","");}
            break;
        case "LCList":
            if(confirm('��ȷ�ϻָ�ȫ���ı�ǩ��Ŀ��?')){getresult(Type,"RAll","");}
            break;
        case "StCList":
            if(confirm('��ȷ�ϻָ�ȫ������ʽ��Ŀ��?')){getresult(Type,"RAll","");}
            break;
        case "StList":
            if(confirm('��ȷ�ϻָ�ȫ������ʽ��?')){getresult(Type,"RAll","");}
            break;
        case "PSFList":
            if(confirm('��ȷ�ϻָ�ȫ����PSF(���)��?')){getresult(Type,"RAll","");}
            break;    
    }
}
function DAll(Type)//ȫ��ɾ��
{
    switch (Type)
    {
        case "NCList":
            if(confirm('��ȷ��ɾ������վ�е�������Ŀ��?\r�˲���������ɾ������վ�����е���Ŀ�Լ�����Щ��Ŀ�йص������Լ�����!')){getresult(Type,"DAll","");}
            break;
        case "NList":
            if(confirm('��ȷ��ɾ������վ�е�������?\r�˲���������ɾ������վ�����е������Լ�����Щ������ص�����!')){getresult(Type,"DAll","");}
            break;
        case "CList":
            if(confirm('��ȷ��ɾ������վ�е�Ƶ����?\r�˲���������ɾ������վ�����е�������Ŀ,ר��,�����Լ�����Щ������ص�����!')){getresult(Type,"DAll","");}
            break;
        case "SList":
            if(confirm('��ȷ��ɾ������վ�е�ר����?\r�˲���������ɾ������վ�����е�ר��!')){getresult(Type,"DAll","");}
            break;
        case "LList":
            if(confirm('��ȷ��ɾ������վ�еı�ǩ��?\r�˲���������ɾ������վ�����еı�ǩ!')){getresult(Type,"DAll","");}
            break;
        case "LCList":
            if(confirm('��ȷ��ɾ������վ�еı�ǩ��Ŀ��?\r�˲���������ɾ������վ�����еı�ǩ��Ŀ�Լ���Щ��Ŀ�����йصı�ǩ!')){getresult(Type,"DAll","");}
            break;
        case "StCList":
            if(confirm('��ȷ��ɾ������վ�е���ʽ��Ŀ��?\r�˲���������ɾ������վ�����е���ʽ��Ŀ�Լ���Щ��Ŀ�����йص���ʽ!')){getresult(Type,"DAll","");}
            break;
        case "StList":
            if(confirm('��ȷ��ɾ������վ�е���ʽ��?\r�˲���������ɾ������վ�����е���ʽ!')){getresult(Type,"DAll","");}
            break;
        case "PSFList":
            if(confirm('��ȷ��ɾ������վ�е�PSF(���)��?\r�˲���������ɾ������վ�����е�PSF(���)!')){getresult(Type,"DAll","");}
            break; 
    }   
}
function PR(Type)//�����ָ�
{
    var tempID="";
    for(i=0;i<document.RecList.length;i++)
    {
	    if(document.RecList.elements[i].type=="checkbox" && document.RecList.elements[i].checked==true)
	    {
		    tempID = tempID + document.RecList.elements[i].value + ",";
	    }
    }
    switch (Type)
    {
        case "NCList":
            if(confirm('��ȷ�������ָ�ѡ�е�������Ŀ��?')){getresult(Type,"PR",tempID);}
            break;
        case "NList":
            if(confirm('��ȷ�������ָ�ѡ�е�������?')){getresult(Type,"PR",tempID);}
            break;
        case "CList":
            if(confirm('��ȷ�������ָ�ѡ�е�Ƶ����?')){getresult(Type,"PR",tempID);}
            break;
        case "SList":
            if(confirm('��ȷ�������ָ�ѡ�е�ר����?')){getresult(Type,"PR",tempID);}
            break;
        case "LList":
            if(confirm('��ȷ�������ָ�ѡ�еı�ǩ��?')){getresult(Type,"PR",tempID);}
            break;
        case "LCList":
            if(confirm('��ȷ�������ָ�ѡ�еı�ǩ��Ŀ��?')){getresult(Type,"PR",tempID);}
            break;
        case "StCList":
            if(confirm('��ȷ�������ָ�ѡ�е���Ŀ��ʽ��?')){getresult(Type,"PR",tempID);}
            break;
        case "StList":
            if(confirm('��ȷ�������ָ�ѡ�е���ʽ��?')){getresult(Type,"PR",tempID);}
            break;
        case "PSFList":
            if(confirm('��ȷ�������ָ�ѡ�е�PSF(���)��?')){getresult(Type,"PR",tempID);}
            break;    
    }    
}
function PD(Type)//����ɾ��
{
    var tempID="";
    for(i=0;i<document.RecList.length;i++)
    {
	    if(document.RecList.elements[i].type=="checkbox" && document.RecList.elements[i].checked==true)
	    {
		    tempID = tempID + document.RecList.elements[i].value + ",";
	    }
    }
    switch (Type)
    {
        case "NCList":
            if(confirm('��ȷ������ɾ��ѡ�е�������Ŀ��?\r�˲���������ɾ��ѡ�е���Ŀ�Լ���ѡ����Ŀ�йص�����,�Լ�����!')){getresult(Type,"PD",tempID);}
            break;
        case "NList":
            if(confirm('��ȷ������ɾ��ѡ�е�������?')){getresult(Type,"PD",tempID);}
            break;
        case "CList":
            if(confirm('��ȷ������ɾ��ѡ�е�Ƶ����?')){getresult(Type,"PD",tempID);}
            break;
        case "SList":
            if(confirm('��ȷ������ɾ��ѡ�е�ר����?')){getresult(Type,"PD",tempID);}
            break;
        case "LList":
            if(confirm('��ȷ������ɾ��ѡ�еı�ǩ��?')){getresult(Type,"PD",tempID);}
            break;
        case "LCList":
            if(confirm('��ȷ������ɾ��ѡ�еı�ǩ��Ŀ��?\r�˲���������ɾ��ѡ����Ŀ�Լ���ѡ����Ŀ�йصı�ǩ!')){getresult(Type,"PD",tempID);}
            break;
        case "StCList":
            if(confirm('��ȷ������ɾ��ѡ�е���ʽ��Ŀ��?\r�˲���������ɾ��ѡ����Ŀ�Լ���ѡ����Ŀ�йص���ʽ!')){getresult(Type,"PD",tempID);}
            break;
        case "StList":
            if(confirm('��ȷ������ɾ��ѡ�е���ʽ��?')){getresult(Type,"PD",tempID);}
            break;
        case "PSFList":
            if(confirm('��ȷ������ɾ��ѡ�е�PSF(���)��?')){getresult(Type,"PD",tempID);}
            break;    
    }        
}

function getresult(Type,Op,idlist)
{
    switch(Type)
    {
        case "NList":
            document.RecList.action="Recyle.aspx?className="+escape(document.RecList.className.value)+"&Type="+Type+"&Op="+Op+"&idlist="+idlist;
            break;
        case "StList":
            document.RecList.action="Recyle.aspx?className="+escape(document.RecList.className.value)+"&Type="+Type+"&Op="+Op+"&idlist="+idlist;
            break;
        case "LList":
            document.RecList.action="Recyle.aspx?className="+escape(document.RecList.className.value)+"&Type="+Type+"&Op="+Op+"&idlist="+idlist;
            break;
        default:
            document.RecList.action="Recyle.aspx?Type="+Type+"&Op="+Op+"&idlist="+idlist;
            break;
    }
    document.RecList.submit();
}
function GetList(Type,page)
{
	setCookie("type",Type);
    setCookie("page",page);
    Selete(Type);
	var  options={  
					   method:'get',  
					   parameters:"Type="+Type+"&page="+page,  
					   onComplete:function(transport)
						{  
							var returnvalue=transport.responseText;
							if (returnvalue.indexOf("??")>-1)
							    document.getElementById("List").innerHTML="Error";
							else
								document.getElementById("List").innerHTML=returnvalue;
						}  
				   }; 
	new  Ajax.Request('Recyle.aspx?no-cache='+Math.random(),options);
}
if(getCookie("type")!=null && getCookie("type")!="null" && getCookie("type")!="")
{
    GetList(getCookie("type"),getCookie("page"));
}
else
{
    GetList('NCList',0);
}
</script>