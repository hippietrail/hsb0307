<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_label_createLabel_simpleList" Codebehind="createLabel_simpleList.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title></title>
    <link href="../../sysImages/<% Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
    <form id="ListLabel" runat="server">
        <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
          <tr class="TR_BG_list">
            <td align="right" class="navi_link" style="width: 28%">�б�����</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="Type" runat="server" Width="200px" CssClass="form" onchange="javascript:selectType(this.value);" >
                <asp:ListItem Value="ClassList">�ռ������ǩ(����)</asp:ListItem>
                <asp:ListItem Value="SpecialList">�ռ������ǩ(ר��)</asp:ListItem>
                <asp:ListItem Value="ChannelList">�ռ������ǩ(Ƶ��)</asp:ListItem>
                <asp:ListItem Value="ClassRSS">��ĿRSS</asp:ListItem>
                <asp:ListItem Value="ClassCode">��Ŀ����</asp:ListItem>
                <asp:ListItem Value="ClassW">��Ŀ�б�(����)</asp:ListItem>
                <asp:ListItem Value="ClassP">��Ŀ�б�(ͼƬ)</asp:ListItem>
                <asp:ListItem Value="SpecialCode">ר�⵼��</asp:ListItem>
                <asp:ListItem Value="NewsSpecialW">ר���б�(����)</asp:ListItem>
                <asp:ListItem Value="NewsSpecialP">ר���б�(ͼƬ)</asp:ListItem>
                <asp:ListItem Value="ChannelCode">Ƶ������</asp:ListItem>
                <asp:ListItem Value="ChannelListW">Ƶ���б�(����)</asp:ListItem>
                <asp:ListItem Value="ChannelListP">Ƶ���б�(ͼƬ)</asp:ListItem>
              </asp:DropDownList></td>
          </tr>
          <tr class="TR_BG_list" id="TrClassId" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">��ĿID</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="ClassId" runat="server" CssClass="form" Width="120px" ReadOnly="true"></asp:TextBox>
              &nbsp;
              <input class="form" type="button" value="ѡ����Ŀ"  onclick="selectFile('newsclass',document.ListLabel.ClassId,300,380);document.ListLabel.ClassId.focus();" /><span id="spanClassId"></span></td>
          </tr>
          <tr class="TR_BG_list" id="TrSpecialID" style="display:none;">
            <td align="right" class="navi_link" style="width: 28%">ר����Ŀ</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="SpecialID" runat="server" CssClass="form" Width="120px" ReadOnly="true"></asp:TextBox>
              &nbsp;
              <input class="form" type="button" value="ѡ��ר��"  onclick="selectFile('special',document.ListLabel.SpecialID,300,380);document.ListLabel.SpecialID.focus();" /><span id="spanSpecialID"></span></td>
          </tr>
          <tr class="TR_BG_list" style="display:none;" id="TrChannelID">
            <td align="right" class="navi_link" style="width: 28%">Ƶ��ID</td>
            <td width="79%" align="left" class="navi_link"><asp:TextBox ID="ChannelID" runat="server" CssClass="form" Width="120px" ReadOnly="true"></asp:TextBox>
              &nbsp;
              <input class="form" type="button" value="ѡ��Ƶ��" onclick="selectFile('Channel',document.ListLabel.ChannelID,300,380);document.ListLabel.ChannelID.focus();" /><span id="spanChannelID"></span></td>
          </tr>
          <tr class="TR_BG_list" style="display:none;" id="TrListType">
            <td align="right" class="navi_link" style="width: 28%">�б�����</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="ListType" runat="server" Width="200px" CssClass="form" >
                <asp:ListItem Value="last">����</asp:ListItem>
                <asp:ListItem Value="rec">�Ƽ�</asp:ListItem>
                <asp:ListItem Value="hot">�ȵ�</asp:ListItem>
                <asp:ListItem Value="marquee">����</asp:ListItem>
              </asp:DropDownList></td>
          </tr>          
          <tr class="TR_BG_list" style="display:none;" id="TrisSub">
            <td align="right" class="navi_link" style="width: 28%">�Ƿ��������</td>
            <td width="79%" align="left" class="navi_link"><asp:DropDownList ID="isSub" runat="server" Width="200px" CssClass="form" >
                <asp:ListItem Value="child">��</asp:ListItem>
                <asp:ListItem Value="unchild">��</asp:ListItem>
              </asp:DropDownList></td>
          </tr>
          <tr class="TR_BG_list">
            <td align="right" class="navi_link" style="width: 28%"></td>
            <td width="79%" align="left" class="navi_link">&nbsp;<input class="form" type="button" value=" ȷ �� "  onclick="javascript:ReturnDivValue();" />&nbsp;<input class="form" type="button" value=" �� �� "  onclick="javascript:CloseDiv();" /></td>
          </tr>
        </table>
    </form>
</body>
</html>
<script language="javascript" type="text/javascript">

function selectType(type)
{
    var list = "TrClassId,TrSpecialID,TrChannelID,TrListType,TrisSub";
    showorhide(list,false)
    switch (type)
    {
        case "ClassList":
            list = "TrisSub";
            showorhide(list,true)
            break;
        case "SpecialList":
            list = "TrisSub";
            showorhide(list,true)
            break;
        case "ChannelList":
            list = "";
            showorhide(list,true)
            break;
        case "ClassRSS":
            list = "TrClassId";
            showorhide(list,true)
            break;
        case "ClassCode":
            list = "TrClassId";
            showorhide(list,true)
            break;
        case "ClassW":
            list = "TrClassId,TrListType";
            showorhide(list,true)
            break;
        case "ClassP":
            list = "TrClassId,TrListType";
            showorhide(list,true)
            break;
        case "SpecialCode":
            list = "TrSpecialID";
            showorhide(list,true)
            break;
        case "NewsSpecialW":
            list = "TrSpecialID,TrListType";
            showorhide(list,true)
            break;
        case "NewsSpecialP":
            list = "TrSpecialID,TrListType";
            showorhide(list,true)
           break;
        case "ChannelCode":
            list = "TrChannelID";
            showorhide(list,true)
            break;
        case "ChannelListW":
            list = "TrChannelID,TrListType";
            showorhide(list,true)
            break;
        case "ChannelListP":
            list = "TrChannelID,TrListType";
            showorhide(list,true)
            break;
    }
} 
selectType("ClassList");
function ReturnDivValue()
{
    spanClear();
    var CheckStr=true;
    var rvalue= "";
    switch (document.ListLabel.Type.value)
    {
        case "ClassList":
            rvalue = "{FS_m_ClassList_" + document.ListLabel.isSub.value + "}";
            break;
        case "SpecialList":
            rvalue = "{FS_m_SpecialList_" + document.ListLabel.isSub.value + "}";
            break;
        case "ChannelList":
            rvalue = "{FS_m_ChannelList_unchild}";
            break;
        case "ClassRSS":
            if(checkIsNull(document.ListLabel.ClassId,document.getElementById("spanClassId"),"��ѡ��������Ŀ"))
                CheckStr=false;
            rvalue = "{FS_m_RSS_" + document.ListLabel.ClassId.value + "}";
            break;
        case "ClassCode":
            if(checkIsNull(document.ListLabel.ClassId,document.getElementById("spanClassId"),"��ѡ��������Ŀ"))
                CheckStr=false;
            rvalue = "{FS_m_ClassCode_" + document.ListLabel.ClassId.value + "}";
            break;
        case "ClassW":
            if(checkIsNull(document.ListLabel.ClassId,document.getElementById("spanClassId"),"��ѡ��������Ŀ"))
                CheckStr=false;
            switch(document.ListLabel.ListType.value)
            {   
                case "last":
                    rvalue = "{FS_m_NewsClassw_" + document.ListLabel.ClassId.value + "}";
                    break;
                case "rec":
                    rvalue = "{FS_m_NewsClassw_" + document.ListLabel.ClassId.value + "_rec}";
                    break;
                case "hot":
                    rvalue = "{FS_m_NewsClassw_" + document.ListLabel.ClassId.value + "_hot}";
                    break;
                case "marquee":
                    rvalue = "{FS_m_NewsClassw_" + document.ListLabel.ClassId.value + "_marquee}";
                    break;
            }
            break;
        case "ClassP":
            if(checkIsNull(document.ListLabel.ClassId,document.getElementById("spanClassId"),"��ѡ��������Ŀ"))
                CheckStr=false;
            switch(document.ListLabel.ListType.value)
            {   
                case "last":
                    rvalue = "{FS_m_NewsClassp_" + document.ListLabel.ClassId.value + "}";
                    break;
                case "rec":
                    rvalue = "{FS_m_NewsClassp_" + document.ListLabel.ClassId.value + "_rec}";
                    break;
                case "hot":
                    rvalue = "{FS_m_NewsClassp_" + document.ListLabel.ClassId.value + "_hot}";
                    break;
                case "marquee":
                    rvalue = "{FS_m_NewsClassp_" + document.ListLabel.ClassId.value + "_marquee}";
                    break;
            }
            break;
        case "SpecialCode":
            if(checkIsNull(document.ListLabel.SpecialID,document.getElementById("spanSpecialID"),"��ѡ��ר��"))
                CheckStr=false;
            rvalue = "{FS_m_SpecialCode_" + document.ListLabel.SpecialID.value + "}";
            break;
        case "NewsSpecialW":
            if(checkIsNull(document.ListLabel.SpecialID,document.getElementById("spanSpecialID"),"��ѡ��ר��"))
                CheckStr=false;
            switch(document.ListLabel.ListType.value)
            {   
                case "last":
                    rvalue = "{FS_m_NewsSpecialw_" + document.ListLabel.SpecialID.value + "}";
                    break;
                case "rec":
                    rvalue = "{FS_m_NewsSpecialw_" + document.ListLabel.SpecialID.value + "_rec}";
                    break;
                case "hot":
                    rvalue = "{FS_m_NewsSpecialw_" + document.ListLabel.SpecialID.value + "_hot}";
                    break;
                case "marquee":
                    rvalue = "{FS_m_NewsSpecialw_" + document.ListLabel.SpecialID.value + "_marquee}";
                    break;
            }                
            break;
        case "NewsSpecialP":
            if(checkIsNull(document.ListLabel.SpecialID,document.getElementById("spanSpecialID"),"��ѡ��ר��"))
                CheckStr=false;
            switch(document.ListLabel.ListType.value)
            {   
                case "last":
                    rvalue = "{FS_m_NewsSpecialp_" + document.ListLabel.SpecialID.value + "}";
                    break;
                case "rec":
                    rvalue = "{FS_m_NewsSpecialp_" + document.ListLabel.SpecialID.value + "_rec}";
                    break;
                case "hot":
                    rvalue = "{FS_m_NewsSpecialp_" + document.ListLabel.SpecialID.value + "_hot}";
                    break;
                case "marquee":
                    rvalue = "{FS_m_NewsSpecialp_" + document.ListLabel.SpecialID.value + "_marquee}";
                    break;
            }             
           break;
        case "ChannelCode":
            if(checkIsNull(document.ListLabel.ChannelID,document.getElementById("spanChannelID"),"��ѡ��Ƶ��"))
                CheckStr=false;
            rvalue = "{FS_ m_ChannelCode_" + document.ListLabel.SpecialID.value + "}";
            break;
        case "ChannelListW":
            if(checkIsNull(document.ListLabel.ChannelID,document.getElementById("spanChannelID"),"��ѡ��Ƶ��"))
                CheckStr=false;
            switch(document.ListLabel.ListType.value)
            {   
                case "last":
                    rvalue = "{FS_m_ChannelListw_" + document.ListLabel.ChannelID.value + "}";
                    break;
                case "rec":
                    rvalue = "{FS_m_ChannelListw_" + document.ListLabel.ChannelID.value + "_rec}";
                    break;
                case "hot":
                    rvalue = "{FS_m_ChannelListw_" + document.ListLabel.ChannelID.value + "_hot}";
                    break;
                case "marquee":
                    rvalue = "{FS_m_ChannelListw_" + document.ListLabel.ChannelID.value + "_marquee}";
                    break;
            }                                
            break;
        case "ChannelListP":
            if(checkIsNull(document.ListLabel.ChannelID,document.getElementById("spanChannelID"),"��ѡ��Ƶ��"))
                CheckStr=false;
            switch(document.ListLabel.ListType.value)
            {   
                case "last":
                    rvalue = "{FS_m_ChannelListp_" + document.ListLabel.ChannelID.value + "}";
                    break;
                case "rec":
                    rvalue = "{FS_m_ChannelListp_" + document.ListLabel.ChannelID.value + "_rec}";
                    break;
                case "hot":
                    rvalue = "{FS_m_ChannelListp_" + document.ListLabel.ChannelID.value + "_hot}";
                    break;
                case "marquee":
                    rvalue = "{FS_m_ChannelListp_" + document.ListLabel.ChannelID.value + "_marquee}";
                    break;
            }                 
            break;
        }
        if(CheckStr)
        parent.ReturnLabelValue(rvalue);
}
function spanClear()
{
    document.getElementById("spanSpecialID").innerHTML="";
    document.getElementById("spanClassId").innerHTML="";
    document.getElementById("spanChannelID").innerHTML="";
}

function showorhide(list,tf)
{
    if (list==""){ return; }
    var arrlist = list.split(',');
    if(tf==true)
    {
        for(var i=0;i<arrlist.length;i++)
        {
            document.getElementById(arrlist[i]).style.display="";
        }
    }
    else
    {
        for(var i=0;i<arrlist.length;i++)
        {
            document.getElementById(arrlist[i]).style.display="none";
        }
    }
}

function checkIsNull(obj,spanobj,error)
{
    if(obj.value=="")
    {
        spanobj.innerHTML="<span class=reshow>(*)"+error+"</spna>";
        return true;
    }
    return false;
}

function CloseDiv()
{
    parent.document.getElementById("LabelDivid").style.display="none";
}
</script>
