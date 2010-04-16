<%@ Control Language="C#" AutoEventWireup="true" Inherits="controls_UserPop" Codebehind="UserPop.ascx.cs" %>
<asp:DropDownList ID="DdlAuthorityType" runat="server" onchange="GetSelect(this)">
    <asp:ListItem Value="0">δ����</asp:ListItem>
    <asp:ListItem Value="1">�۳����</asp:ListItem>
    <asp:ListItem Value="2">�۳�����</asp:ListItem>
    <asp:ListItem Value="3">�۳���Һͻ���</asp:ListItem>
    <asp:ListItem Value="4">�ﵽ���</asp:ListItem>
    <asp:ListItem Value="5">�ﵽ����</asp:ListItem>
    <asp:ListItem Value="6">�ﵽ��Һͻ���</asp:ListItem>
</asp:DropDownList>
<div id="Div_AuthorityGold" style="display:inline">
&nbsp;&nbsp;&nbsp;
��ң�
<asp:TextBox ID="TxtAuthorityGold" runat="server" Width="58px" CssClass="form">0</asp:TextBox>&nbsp;</div>
<div id="Div_AuthorityPoint" style="display:inline">
&nbsp;&nbsp;&nbsp;
����:
<asp:TextBox ID="TxtAuthorityPoint" runat="server" Width="58px" CssClass="form">0</asp:TextBox>
    </div>
<div id="Div_AuthorityGroup">
��ѡ���Ա��:<br />
<asp:ListBox ID="LstAuthorityGroup" runat="server" SelectionMode="Multiple" Height="160px" Width="154px" CssClass="form"></asp:ListBox>
    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TxtAuthorityGold"
        ErrorMessage="��ұ�������Ǹ�����" MaximumValue="2147483647" MinimumValue="0" Type="Integer"></asp:RangeValidator>
    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TxtAuthorityPoint"
        ErrorMessage="���ֱ�������Ǹ�����" MaximumValue="2147483647" MinimumValue="0" Type="Integer"></asp:RangeValidator></div>
<script type="text/javascript" language="javascript">
<!--
GetSelect(document.getElementById("UserPop1_DdlAuthorityType"));
function GetSelect(obj)
{
    var selval = parseInt(obj.options[obj.selectedIndex].value);
    var divgroup = document.getElementById("Div_AuthorityGroup");
    var divpoint = document.getElementById("Div_AuthorityPoint");
    var divgold = document.getElementById("Div_AuthorityGold");
    
    switch(selval)
    {
        case 0:
            divgroup.style.display = "none";
            divpoint.style.display = "none";
            divgold.style.display = "none";
            break;
        case 1:
        case 4:
            divgroup.style.display = "";
            divgold.style.display = "inline";
            divpoint.style.display = "none";
            document.getElementById("UserPop1_TxtAuthorityPoint").value = "0";
            break;
        case 2:
        case 5:
            divgroup.style.display = "";
            divpoint.style.display = "inline";
            divgold.style.display = "none";
            document.getElementById("UserPop1_TxtAuthorityGold").value = "0";
            break;
        case 3:
        case 6:
            divgroup.style.display = "";
            divpoint.style.display = "inline";
            divgold.style.display = "inline";
            break;
    }
}
//-->
</script>