<%@ Control Language="C#" AutoEventWireup="true" Inherits="manage_collect_CollectEditor" Codebehind="CollectEditor.ascx.cs" %>
<script language="javascript" type="text/javascript">
<!--
function shorten(obj)
{
    var divcon = obj.parentNode.parentNode;
    for(var i=0;i<divcon.childNodes.length;i++)
    {
        var ob = divcon.childNodes[i];
        if(ob.nodeName == "TEXTAREA")
        {
             if(ob.rows > 2)
                ob.rows -= 1;
             return;  
        }
    }
}
function heighten(obj)
{
    var divcon = obj.parentNode.parentNode;
    for(var i=0;i<divcon.childNodes.length;i++)
    {
        var ob = divcon.childNodes[i];
        if(ob.nodeName == "TEXTAREA")
        {
             ob.rows += 1;
             return;  
        }
    }
}
function addTag(obj,val)
{
    var divcon = obj.parentNode.parentNode;
    for(var i=0;i<divcon.childNodes.length;i++)
    {
        var oj = divcon.childNodes[i];
        if(oj.nodeName == "TEXTAREA")
        {
            if(val != '[����]' && oj.value.indexOf(val) >= 0)
            {
                alert('�����������Ѵ���'+ val +'���,�ñ�ǲ����ظ�!');
                return;
            }
            oj.focus();
            if(document.selection==null)
            {
                var iStart = oj.selectionStart;
                var iEnd = oj.selectionEnd;
                oj.value = oj.value.substring(0, iEnd) + val + oj.value.substring(iEnd, oj.value.length);
            }
            else{
                document.selection.createRange().text += val;
            } 
            return;  
        }
    }
}
function CheckLength(obj,len)
{
    var n = obj.value.length;
    if(n > len)
    {
        alert('�����ı��ĳ��Ȳ��ܴ���'+ len +'!');
        obj.value = obj.value.substr(0,len);
        obj.focus();
    }
}
//-->
</script>
<div>
<asp:Panel runat="server" ID="PnlMenu" Width="100%">�������� <span id="ll" onclick="shorten(this)" style="cursor:hand"><b>��С</b></span> <span onclick="heighten(this)" style="cursor:hand"><b>����</b></span>
&nbsp;&nbsp;<asp:Label runat="server" ID="LblTag" Text="���ñ�ǩ:" Visible="false"/></asp:Panel>
<asp:TextBox runat="server" ID="TxtEditor" TextMode="MultiLine" Width="98%" Rows="4"></asp:TextBox>
</div>