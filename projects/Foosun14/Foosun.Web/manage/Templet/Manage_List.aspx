<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_Templet_Manage_List" ContentType="text/html" CodeBehind="Manage_List.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
	<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
	<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
		<tr>
			<td width="57%" class="sysmain_navi" style="padding-left: 14px" height="30">
				ģ�����
			</td>
			<td width="43%" class="topnavichar" style="padding-left: 14px">
				<div align="left">
					λ�õ�����<a href="../main.aspx" target="sys_main" class="list_link">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" />ģ�����</div>
			</td>
		</tr>
	</table>
	<div id="addfiledir" runat="server">
	</div>
	<table width="98%" align="center" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<div id="File_List" runat="server">
				</div>
			</td>
		</tr>
	</table>
	<br />
	<table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height: 76px" align="center">
		<tr>
			<td align="center">
				<label id="copyright" runat="server" />
			</td>
		</tr>
	</table>
	<form id="Templetslist" action="" runat="server" method="post">
	<input type="hidden" name="Type" />
	<input type="hidden" name="Path" />
	<input type="hidden" name="ParentPath" />
	<input type="hidden" name="OldFileName" />
	<input type="hidden" name="NewFileName" />
	<input type="hidden" name="filename" />
	<input type="hidden" name="Urlx" />
	</form>
</body>
<script language="javascript" type="text/javascript">
function ListGo(Path,ParentPath)
{
    Path = escape(Path);
    var dir = location.href;
    var arr_dir  = dir.split("/");
    var url = "";
    var dirDumm = "<% Response.Write(Foosun.Config.UIConfig.dirDumm); %>";
    for (var i=0;i<arr_dir.length;i++)
    {
	    if(i<3)
		    url+=arr_dir[i]+"/";
    }
    //�õ�����Ŀ¼
    var  options={  
	       method:'get',  
	       onComplete:function(transport)
	       {  		       
		           if(dirDumm!="")
                        url += dirDumm+"/"+transport.responseText+"/Templet/Manage_List.aspx";
                    else
                        url += transport.responseText + "/Templet/Manage_List.aspx";
                    tempurl = url+'?Path='+Path+'&ch=<%Response.Write(Request.QueryString["ch"]); %>&ParentPath='+ParentPath;
                    self.location=tempurl;
	       }
       }; 
    new  Ajax.Request('../../configuration/system/getManageForder.aspx?no-cache='+Math.random(),options);
}

function EditFolder(path,filename)   
{
	var ReturnValue='';
	ReturnValue=prompt('�޸ĵ����ƣ�',filename.replace(/'|"/g,''));
	if ((ReturnValue!='') && (ReturnValue!=null))
	{
	    self.location.href='?Type=EidtDirName&ch=<%Response.Write(Request.QueryString["ch"]); %>&Path='+path+'&OldFileName='+filename+'&NewFileName='+ReturnValue;
	    //document.Templetslist.Type.value="EidtDirName";
	    //document.Templetslist.Path.value=path;
	    //document.Templetslist.OldFileName.value=filename;
	    //document.Templetslist.NewFileName.value=ReturnValue;
	    //document.Templetslist.submit();
	}
	else
	{
	    if(ReturnValue!=null)
	    {
	        alert('����дҪ����������');
	    }    
	}
}
function EditFile(path,filename)   
{
	var ReturnValue='';
	ReturnValue=prompt('�޸ĵ����ƣ�',filename.replace(/'|"/g,''));
	if ((ReturnValue!='') && (ReturnValue!=null))
	{
	    self.location.href='?Type=EidtFileName&ch=<%Response.Write(Request.QueryString["ch"]); %>&Path='+path+'&OldFileName='+filename+'&NewFileName='+ReturnValue;
	    //document.Templetslist.Type.value="EidtFileName";
	    //document.Templetslist.Path.value=path;
	    //document.Templetslist.OldFileName.value=filename;
	    //document.Templetslist.NewFileName.value=ReturnValue;
	    //document.Templetslist.submit();
	}
	else
	{
	    if(ReturnValue!=null)
	    {
	        alert('����дҪ����������');
	    }    
	}
}
function DelDir(path)
{
    if(confirm('ȷ��ɾ�����ļ����Լ����ļ����������ļ���?'))
    {
	    self.location.href='?Type=DelDir&Path='+path;
	    //document.Templetslist.Type.value="DelDir";
	    //document.Templetslist.Path.value=path;
	    //document.Templetslist.submit();
    }
}
function DelFile(path,filename)
{
    if(confirm('ȷ��ɾ�����ļ���?'))
    {
	    self.location.href='?Type=DelFile&ch=<%Response.Write(Request.QueryString["ch"]); %>&Path='+path+'&filename='+filename;
	    //document.Templetslist.Type.value="DelFile";
	    //document.Templetslist.Path.value=path;
	    //document.Templetslist.filename.value=filename;
	    //document.Templetslist.submit();
    }
}
function AddDir(path)
{
	var ReturnValue='';
	var filename='';
	ReturnValue=prompt('Ҫ��ӵ��ļ�������',filename.replace(/'|"/g,''));
	if ((ReturnValue!='') && (ReturnValue!=null))
	{
	    self.location.href='?Type=AddDir&ch=<%Response.Write(Request.QueryString["ch"]); %>&Path='+path+'&filename='+ReturnValue;
	    //document.Templetslist.Type.value="AddDir";
	    //document.Templetslist.Path.value=path;
	    //document.Templetslist.filename.value=ReturnValue;
	    //document.Templetslist.submit();
	}
	else
	{
	    if(ReturnValue!=null)
	    {
	        alert('����дҪ��ӵ��ļ�������');
	    }    
	}
}
function UpFile(path,type)
{
    var WWidth = (window.screen.width-500)/2;
    var Wheight = (window.screen.height-150)/2;
    window.open ('../../configuration/system/Upload.aspx?Path='+path+'&ch=<%Response.Write(Request.QueryString["ch"]); %>&upfiletype='+type, '�ļ��ϴ�', 'height=150, width=500, top='+Wheight+', left='+WWidth+', toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no'); 
}
</script>
</html>
