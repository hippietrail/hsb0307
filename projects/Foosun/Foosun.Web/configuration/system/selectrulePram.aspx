<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" Inherits="configuration_system_selectrulePram" Codebehind="selectrulePram.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>ѡ����� __by Foosun.net & Foosun Inc.</title>
<link href="../../sysImages/<% Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" name="form1">
    
    <div>      
          <input type="checkbox" id="DirData0" name="DirData0" value="{@year02}" onclick="jvascript:ay(this);" />��2λ
                <input type="checkbox" id="DirData1" name="DirData1" value="{@year04}" onclick="jvascript:ay(this);" />��4λ
                <input type="checkbox" id="DirData2" name="DirData2" value="{@month}" onclick="jvascript:ay(this);"/>��
                <input type="checkbox" id="DirData3" name="DirData3" value="{@day}" onclick="jvascript:ay(this);"/>��
                <%if (Request.QueryString["FileType"] == "rulePram")
                  {%>
                <input type="checkbox" id="DirData4" name="DirData4" value="{@hour}" onclick="jvascript:ay(this);"/>ʱ
                <input type="checkbox" id="Checkbox1" name="DirData4" value="{@minute}" onclick="jvascript:ay(this);"/>��
                <input type="checkbox" id="DirData5" name="DirData5" value="{@second}" onclick="jvascript:ay(this);"/>��
                <%if (Request.QueryString["FileType"] != "rulesmallPramo")
                  {%>
                <input type="checkbox" id="DirData6" name="DirData6" value="{@�Զ����ID}" onclick="jvascript:ay(this);"/>�Զ����
                <%}%>
                <input type="checkbox" id="DirData7" name="DirData7" value="{@EName}" onclick="jvascript:ay(this);"/>Ӣ������
	            <input type="checkbox" id="DirData8" name="DirData8" value="{@Ram4_0}" onclick="javascript:DispRand(this);"; /> ����� 
	        <span id="label1" style="display:none;">
	        <input name="IntRand" type="text" id="IntRand" size="5" maxlength="1" value="4" onkeyup="javascript:GetIsint(this);" />&nbsp;
                <select id="Select1" onchange="javascript:GetSort(this)">
                    <option  value="0">����</option>
                    <option value="1">��ĸ</option>
                    <option  value="2">���</option>
                </select>
	        </span>
	        <% }%>
	         <br />
	        <input runat="server" class="form" name="Expro" type="text" id="Expro" style="width: 70%" />&nbsp;<input type="button" name="Submit" value="ȷ��" onclick="ReturnValue(document.form1.Expro.value);" />
    </div>   
    </form>
</body>
</html>
<script type="text/javascript" language="javascript">
function ay(obj)
{
    var dv = obj.parentNode;
    for(var i=0;i<dv.childNodes.length;i++)
    {
        var oj = dv.childNodes[i];
        if(oj.type == "text")
        {
            oj.focus();
            if(obj.checked)
            {
                 if(document.selection==null)
                 {
                    var iStart = oj.selectionStart;
                    var iEnd = oj.selectionEnd;
                    oj.value = oj.value.substring(0, iEnd) + obj.value + oj.value.substring(iEnd, oj.value.length);
                 }
                 else{
                    document.selection.createRange().text += obj.value;
                 }
            }
            else
            {
                var ep=oj.value;
                oj.value = ep.replace(obj.value,"");
            }
            break;
        }
    }    
}

//��Ŀؼ�
function DispRand(obj)
{
//    var dv = obj.parentElement;
//    var oj = dv.children[10];
//    if(obj.checked)
//    {
//        document.getElementById(oj).style.display = "";
//        var dc=dv.children[11];
//        dc.focus();
//        document.selection.createRange().text=obj.value;
//    }else{
//        var dc = dv.children[9];
//        oj.style.display="none";
//    }
//    return;
    
    if(document.form1.DirData8.checked==true)
    {
       document.getElementById("label1").style.display="";
       ay(obj);
    }else{
        var str= document.getElementById("IntRand").value;
        var str1=document.getElementById("Select1").value;
        obj.value = "{@Ram"+str+"_"+str1+"}";
        ay(obj);
        document.getElementById("label1").style.display="none";
    }
}

//������������
function GetIsint(obj)
{    
    var str= document.getElementById("Select1").value;
    var OldExpro= document.getElementById("Expro").value;
    OldExpro=OldExpro.replace(/\{\@Ram.*?\}/g,"{@Ram"+obj.value+"_"+str+"}");
    document.getElementById("Expro").value=OldExpro;
}
//�����������
function GetSort(obj)
{
    var str= document.getElementById("IntRand").value;
    var OldExpro= document.getElementById("Expro").value;
    OldExpro=OldExpro.replace(/\{\@Ram.*?\}/g,"{@Ram"+str+"_"+obj.value+"}");
    document.getElementById("Expro").value=OldExpro;
}   
   
function ReturnValue(obj)
{
    var Str=obj;
    parent.ReturnFun(Str);
}
</script>
