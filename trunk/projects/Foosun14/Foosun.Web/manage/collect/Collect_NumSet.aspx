<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_collect_Collect_NumSet" Codebehind="Collect_NumSet.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>ȷ�ϲɼ�����</title>
    <link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/css.css"
        rel="stylesheet" type="text/css" />
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
    <script language="JavaScript" type="text/javascript">
    <!--
    function OnOK()
    {
	    var _n = document.getElementById('TxtNum').value;
	    var reg = /^[0-9]+$/;
	    if(!reg.test(_n))
	    {
	        alert("�ɼ�����������������");
	        document.getElementById("TxtNum").focus();
	        return;
	    }
	    var n = parseInt(_n);
	    if(n < 1)
	    {
	        alert("�ɼ���������Ϊ������");
	        document.getElementById('TxtNum').focus();
	        return;
	    }
	    var norpt = 0;
	    if(document.getElementById('ChkNoRepeat').checked)
	        norpt = 1;
	    window.opener.location.href = 'Collect.aspx?num='+ n +'&norepeat='+ norpt +'&id=<%# nid%>';
	    self.close();
    }
    function OnCancel()
    {
	    window.returnValue = 0;
	    self.close();
    }
    
    function KeyDown()
    {
        if(event.keyCode == 13)
        {
            OnOK();
        }
    }
    //-->
</script>
</head>
<body>
    <form id="Form1" runat="server">
        <div>
        <table id="tabList" width="98%" border="0" align="center" cellpadding="3" cellspacing="1" class="table">
            <tr class="TR_BG_list">
                <td class="list_link" align="center" colspan="2">
                    <br/>��ӭʹ��Foosun Inc. Collect System V1.0 For .Net<br/>
	                ����漰����Ȩ�������Ĵ���Ѷ�Ƽ���չ���޹�˾�޹�<br/>
	                ��ͬ���Ҫʹ�������ͬ�⣬������ɼ�����!<br/>
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td class="list_link" width="35%" align="right">
                    �ظ����ã�
                </td>
                 <td class="list_link" width="65%" align="left">
                    <input type="checkbox" id="ChkNoRepeat" checked="checked" />������ͬ���ظ��ɼ�
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td class="list_link" align="right">
                    ���ñ��βɼ�������
                </td>
                <td class="list_link" align="left">
                    <input type="text" id='TxtNum' onkeydown="KeyDown();" class="form"/>
                    <script language="javascript" type="text/javascript">document.getElementById('TxtNum').focus();</script>
                </td>
            </tr>
            <tr class="TR_BG_list">
                <td class="list_link" align="center" colspan="2">
                    <input type="button" onclick="OnOK()" class="form" value=" ȷ �� "/>&nbsp;&nbsp;
                    <input type="button" onclick="OnCancel()" class="form" value=" ȡ �� "/>
                </td>
            </tr>
        </table>
        </div>
    </form>
</body>
</html>