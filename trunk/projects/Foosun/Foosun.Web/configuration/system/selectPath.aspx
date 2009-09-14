<%@ Page Language="C#" AutoEventWireup="true" Inherits="configuration_system_selectPath" Codebehind="selectPath.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title><%Response.Write(Foosun.Config.UIConfig.HeadTitle); %></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
</head>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<body>
<form id="Templetslist" action="" runat="server" method="post">
<div id="addfiledir" runat="server"></div>
<div id="File_List" runat="server"></div>
 <input type="hidden" name="Type" />
 <input type="hidden" name="Path"/>
 <input type="hidden" name="ParentPath" />
 <input type="hidden" name="OldFileName" />
 <input type="hidden" name="NewFileName" />
 <input type="hidden" name="filename" />
 <input type="hidden" name="Urlx" />
</form>

</body>
</html>

<script language="javascript" type="text/javascript">
function ListGo(Path,ParentPath)
{
    //self.location='?Path='+Path+'&ParentPath='+ParentPath;
	document.Templetslist.Path.value=Path;
	document.Templetslist.ParentPath.value=ParentPath;
	document.Templetslist.submit();
}
function EditFolder(path,filename)   
{
	var ReturnValue='';
	ReturnValue=prompt('�޸ĵ����ƣ�',filename.replace(/'|"/g,''));
	if ((ReturnValue!='') && (ReturnValue!=null))
	{
	    //self.location.href='?Type=EidtDirName&Path='+path+'&OldFileName='+filename+'&NewFileName='+ReturnValue;
	    document.Templetslist.Type.value="EidtDirName";
	    document.Templetslist.Path.value=path;
	    document.Templetslist.OldFileName.value=filename;
	    document.Templetslist.NewFileName.value=ReturnValue;
	    document.Templetslist.submit();
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
	    document.Templetslist.Type.value="DelDir";
	    document.Templetslist.Path.value=path;
	    document.Templetslist.submit();
    }
}

function AddDir(path)
{
	var ReturnValue='';
	var filename='';
	ReturnValue=prompt('Ҫ��ӵ��ļ�������',filename.replace(/'|"/g,''));
	if ((ReturnValue!='') && (ReturnValue!=null))
	{
	    //self.location.href='?Type=AddDir&Path='+path+'&OldFileName='+filename+'&NewFileName='+ReturnValue;
	    document.Templetslist.Type.value="AddDir";
	    document.Templetslist.Path.value=path;
	    document.Templetslist.filename.value=ReturnValue;
	    document.Templetslist.submit();
	}
	else
	{
	    if(ReturnValue!=null)
	    {
	        alert('����дҪ��ӵ��ļ�������');
	    }    
	}
}

function ReturnValue(obj)
{
    parent.ReturnFun(obj);
}
</script>