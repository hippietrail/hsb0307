<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_news_Class_add" EnableEventValidation="false" Codebehind="Class_add.aspx.cs" %>
<%@ Register Src="../../controls/UserPop.ascx" TagName="UserPop" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" charset="gb2312" type="text/javascript" src="../../configuration/js/Public.js">
</script>
<script language="javascript">
    window.onload = function() {

    var specialObject = document.getElementById('TCname'); //.style.fontFamily = SpecialFontFamily();
    SetSpecialFontStyle(specialObject);
        //document.getElementById('TEname').style.fontFamily=SpecialFontFamily();
        getClassCName();
    }
</script>
</head>
<body >
   <form id="form1" runat="server" method="post">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="toptable">
            <tr>
              <td style="height:1px;" colspan="2"></td>
            </tr>
            <tr>
              <td class="sysmain_navi"  style="PADDING-LEFT: 14px; height: 32px;" >
                 ��Ŀ���/�޸�</td>
              <td class="topnavichar"  style="PADDING-LEFT: 14px; height: 32px;" ><div align="left">λ�õ�����<a href="../main.aspx" target="sys_main" class="topnavichar">��ҳ</a><img alt="" src="../../sysImages/folder/navidot.gif" border="0" /><a href="class_list.aspx" class="topnavichar">��Ŀ����</a> <img alt="" src="../../sysImages/folder/navidot.gif" border="0" />�����Ŀ</div></td>
            </tr>
    </table>
    
     <table style="width:98%" border="0" align="center" cellpadding="4" cellspacing="1" class="table">
          <tr class="TR_BG">
            <td colspan="2">
            <span style="cursor:pointer;padding-left:10px;height:20px;font-size:14px;" id="csize" onclick="changeDdivs('tableSetting','tableSetting1')" class="reshow">��������</span> &nbsp; &nbsp;<span style="cursor:pointer;font-size:14px;" id="csize1" class="list_link" onclick="changeDdivs('tableSetting1','tableSetting')">�߼�����</span>
            </td>
          </tr>
      </table>
      
        <table style="width:98%" border="0" align="center" cellpadding="4" cellspacing="1"  class="table" id="tableSetting">
         <tr class="TR_BG_list" id="ClssStyle_1">
            <td align="right">
                ��Ŀ���ƣ�</td>
            <td style="width:80%">&nbsp;<asp:TextBox ID="TCname" Width="40%" runat="server" onChange="javascript:GetPY1(this);" MaxLength="50" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_01',this)">����</span><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TCname" Display="Dynamic" ErrorMessage="<span class=reshow>(*)��Ŀ�������ֲ���Ϊ��!</span>"></asp:RequiredFieldValidator> 
            </td>
          </tr>
          <tr class="TR_BG_list" id="Tr2">
            <td align="right">��Ŀ���ƶ��գ�</td>
            <td style="width:80%">&nbsp;<asp:TextBox ID="TCnameRefer" Width="40%" runat="server"  MaxLength="50" CssClass="form"></asp:TextBox><span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_refer',this)">����</span>
            </td>
          </tr>
          <tr class="TR_BG_list" id="ClssStyle_2">
            <td align="right">��ĿӢ�����ƣ�</td>
            <td>&nbsp;<asp:TextBox ID="TEname" runat="server" MaxLength="50" CssClass="form"></asp:TextBox>
                     <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_02',this)">����</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TEname" Display="Dynamic" ErrorMessage="<span class=reshow>(*)��ĿӢ�����ֲ���Ϊ��!</span>"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="ֻ�ܰ�������,��ĸ,�»���,���л��ߡ���һ���ַ�Ϊ��ĸ." ControlToValidate="TEname" Display="Dynamic" ValidationExpression="^[a-zA-Z][a-zA-Z0-9._-]{1,50}$"></asp:RegularExpressionValidator><label id="modifynote" runat="server" />
            </td>
          </tr>
     
          <tr class="TR_BG_list" runat="server" id="Tr1">
            <td align="right">Ƶ����</td>
            <td>
              <label id="sitelabel" runat="server" />
            </td>
          </tr>
                
          <tr class="TR_BG_list" id="ClssStyle_3">
            <td align="right">����Ŀ��</td>
            <td><span style="display:none;"><asp:TextBox ID="TParentId" Width="20%" runat="server" CssClass="form"></asp:TextBox></span> <span class="reshow SpecialFontFamily" id="ClassCnamev"></span> <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_03',this)">����</span>
                <asp:HiddenField ID="ClassIDNum" runat="server" />
            </td>
         </tr>
        
        <tr class="TR_BG_list">
            <td align="right" style="height: 28px">�Ƿ��ⲿ��Ŀ��</td>
            <td style="height: 28px">&nbsp;<asp:CheckBox ID="CProject" runat="server" onclick="javascript:CheckedCode();" /> <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_04',this)">����</span></td> 
         </tr>     
         <tr class="TR_BG_list" id="ClssStyle_4">
            <td align="right">
                ����Ȩ�أ�</td>
            <td  style="height: 32px">&nbsp;<asp:TextBox ID="TOrder" runat="server" Width="40%" CssClass="form" OnTextChanged="TOrder_TextChanged"></asp:TextBox> <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_05',this)">����</span></td>
          </tr>
          
          <tr class="TR_BG_list" id="ClssStyle_5" style="display:none;">
            <td align="right">�ⲿ��ַ��</td>
            <td>&nbsp;<asp:TextBox ID="TAddress" runat="server" Width="40%" CssClass="form"></asp:TextBox> <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_06',this)">����</span></td>
          </tr>
          
          <tr class="TR_BG_list" id="ClssStyle_6">
            <td align="right">����������</td>
            <td>&nbsp;<asp:TextBox ID="THoustAddress" runat="server" Width="40%" CssClass="form"></asp:TextBox> <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_08',this)">����</span></td>
          </tr>
          <tr id="ClssStyle_7" class="TR_BG_list">
            <td align="right">��Ŀģ�壺</td>
            <td style="height: 33px">&nbsp;<asp:TextBox ID="FProjTemplets" Width="40%" runat="server" CssClass="form"/><img src="../../sysImages/folder/s.gif" alt="ѡ����Ŀģ��" border="0" style="cursor:pointer;" onclick="selectFile('templet',document.form1.FProjTemplets,280,500);document.form1.FProjTemplets.focus();" /><span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_09',this)">����</span></td>
          </tr>
          <tr id="ClssStyle_8" class="TR_BG_list">
            <td align="right">
                ��Ŀ����ҳģ�壺</td>
            <td style="height: 25px">&nbsp;<asp:TextBox ID="FListTemplets" Width="40%" runat="server" CssClass="form" /><img src="../../sysImages/folder/s.gif" alt="ѡ������ģ��" border="0" style="cursor:pointer;" onclick="selectFile('templet',document.form1.FListTemplets,280,500);document.form1.FListTemplets.focus();" /><span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_10',this)">����</span></td>
          </tr>
          <tr id="ClssStyle_9" class="TR_BG_list">
            <td align="right">
                ��Ŀ����·����</td>
            <td>&nbsp;<asp:TextBox ID="TPath" runat="server" Width="40%" CssClass="form"></asp:TextBox><img src="../../sysImages/folder/s.gif" alt="ѡ��·��" border="0" style="cursor:pointer;" onclick="selectFile('path|<% Response.Write(getClassSavePath()); %>',document.form1.TPath,280,500);document.form1.TPath.focus();" /><span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_11',this)">����</span></td>
          </tr>
          
          <tr id="ClssStyle_12" class="TR_BG_list">
            <td align="right">���ű������</td>
            <td>&nbsp;<asp:TextBox ID="NewsSave" runat="server" Width="40%" CssClass="form"> </asp:TextBox><img src="../../sysImages/folder/s.gif" alt="ѡ�����" border="0" style="cursor:pointer;" onclick="selectFile('rulesmallPram',document.form1.NewsSave,100,500);document.form1.NewsSave.focus();" /><span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_14',this)">����</span></td>
          </tr>
          
           <tr id="ClssStyle_10" class="TR_BG_list">
            <td align="right">�ڵ�������ʾ��</td>
            <td>&nbsp;<asp:CheckBox ID="NaviShowtf" runat="server" Checked="True" /> <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_12',this)">����</span>
                </td>
          </tr>
                
          <tr id="ClssStyle_11" class="TR_BG_list">
            <td align="right">��˻��ƣ�</td>
            <td>&nbsp;<asp:DropDownList ID="Auditing" runat="server">
                    <asp:ListItem Value="0">�����</asp:ListItem>
                    <asp:ListItem Value="1">һ�����</asp:ListItem>
                    <asp:ListItem Value="2">�������</asp:ListItem>
                    <asp:ListItem Value="3">�������</asp:ListItem>
                </asp:DropDownList> <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_13',this)">����</span></td>
          </tr>
        <tr class="TR_BG_list" id="ClssStyle_32">
            <td align="right" style="height: 41px">
                ��Ŀҳ�浼����</td>
            <td style="height: 41px">
                &nbsp;<asp:TextBox ID="HtmlPhrasing" runat="server" Height="50px" TextMode="MultiLine"  Width="60%" CssClass="form SpecialFontFamily"></asp:TextBox>
                <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_32_02',this)">����</span></td>
        </tr>
       <tr class="TR_BG_list" id="ClssStyle_35">
           <td align="right" style="height:41px">
               ����ҳ�浼����
           </td>
           <td style="height:41px">&nbsp;<asp:TextBox ID="NewsHtmlPhrasing" runat="server" CssClass="form SpecialFontFamily" Height="50px" TextMode="MultiLine" Width="60%"></asp:TextBox> <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_33',this)">����</span></td>
       </tr>
       </table>
       
       <table style="width:98%;display:none;" border="0" align="center" cellpadding="4" cellspacing="1"  class="table" id="tableSetting1">
          <tr id="ClssStyle_23" class="TR_BG_list">
            <td align="right">�������鵵��</td>
            <td style="width:80%">&nbsp;<asp:TextBox ID="Pigeonhole" runat="server" Width="40%" CssClass="form" Text="0"></asp:TextBox> <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_16',this)">����</span></td>
          </tr>
      
        <tr class="TR_BG_list" id="ClssStyle_34">
            <td align="right">
                �Զ����ԶΣ�</td>
            <td>
                <a href="javascript:clearDefine();"><font color="blue">������д</font></a><br />
                <asp:ListBox ID="DefineColumns" runat="server" Height="129px" Width="131px" SelectionMode="Multiple" onchange="getDefinedData(this);" CssClass="form"></asp:ListBox>
                <label id="DefineRows_div" runat="server" /> <span id="displayLoad"></span> 
                 <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_18',this)">����</span>
                
                <asp:HiddenField ID="HiddenDefine" runat="server" />
            </td>
        </tr>         
          <tr id="ClssStyle_13" class="TR_BG_list">
            <td align="right">������Ŀ����Ŀ¼�ṹ��</td>
            <td>
                <asp:TextBox ID="DirData1" runat="server"  Width="40%" CssClass="form"></asp:TextBox>
                <img src="../../sysImages/folder/s.gif" alt="��������" border="0" style="cursor:pointer;" onclick="selectFile('rulePram',document.form1.DirData1,100,400);document.form1.DirData1.focus();" />
                <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_19',this)">����</span>
                
                </td>
          </tr>
          <tr id="ClssStyle_14" class="TR_BG_list">
            <td align="right">�ļ���������</td>
            <td>
                <asp:TextBox ID="DirData2" runat="server"  Width="40%" CssClass="form"></asp:TextBox>
                <img src="../../sysImages/folder/s.gif" alt="�ļ���������" border="0" style="cursor:pointer;" onclick="selectFile('rulePram',document.form1.DirData2,100,400);document.form1.DirData2.focus();" />
                <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_20',this)">����</span></td>
          </tr>
          
          <tr class="TR_BG_list">
            <td align="right">����ҳ����</td>
            <td>
                <asp:TextBox ID="DirData3" runat="server"  Width="40%" CssClass="form"></asp:TextBox>
                <img src="../../sysImages/folder/s.gif" alt="����ҳ����" border="0" style="cursor:pointer;" onclick="selectFile('rulePram',document.form1.DirData3,100,400);document.form1.DirData3.focus();" />
                <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_21',this)">����</span></td>
          </tr>

           <tr id="ClssStyle_16" class="TR_BG_list">
            <td align="right">��������ļ���������</td>
            <td><asp:TextBox ID="NewsDisplay" runat="server"  Width="40%" CssClass="form"></asp:TextBox>
                <img src="../../sysImages/folder/s.gif" alt="��������" border="0" style="cursor:pointer;" onclick="selectFile('rulePram',document.form1.NewsDisplay,100,400);document.form1.NewsDisplay.focus();" />
                <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_22',this)">����</span>
            </td>
          </tr>
                
          <tr class="TR_BG_list" style="display:none;">
            <td align="right">ͼƬ�ϴ�Ŀ¼��</td>
            <td><asp:TextBox ID="ImageUpload" runat="server" Width="40%" CssClass="form"></asp:TextBox> <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_23',this)">����</span></td>
          </tr>
          <tr id="ClssStyle_18" class="TR_BG_list">
            <td align="right">
                ���Ȩ�ޣ�</td>
            <td><uc2:UserPop ID="UserPop1" runat="server"/> <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_24',this)">����</span>
            </td>
          </tr>
           <tr id="ClssStyle_19" class="TR_BG_list">
            <td align="right" id="exDropDownList">�����ļ�����չ����</td>
            <td><asp:DropDownList ID="ExDropDownList" runat="server">
                    <asp:ListItem>.html</asp:ListItem>
                    <asp:ListItem>.htm</asp:ListItem>
                    <asp:ListItem>.shtml</asp:ListItem>
                    <asp:ListItem>.shtm</asp:ListItem>
                    <asp:ListItem>.aspx</asp:ListItem>
                </asp:DropDownList> <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_25',this)">����</span></td>
          </tr>
          
          <tr class="TR_BG_list" id="ClssStyle_20">
            <td align="right">�����л���</td>
            <td><input type="checkbox" id="draw" onclick="javascript:IsCode();" runat="server" /> <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_26',this)">����</span></td>
          </tr>
          <tr id="ClssStyle_21" class="TR_BG_list" style="display:none;">
            <td align="right">ͼƬ���ߴ��룺</td>
            <td>
            <asp:TextBox ID="drawUrl" runat="server" Width="50%" TextMode="MultiLine" CssClass="form"></asp:TextBox>
            <img src="../../sysImages/folder/s.gif" alt="ѡȡ���л���ַ" border="0" style="cursor:pointer;" onclick="selectFile('pic',document.form1.drawUrl,280,500);document.form1.drawUrl.focus();" />
            </td>
          </tr>
          <tr id="ClssStyle_22" class="TR_BG_list" style="display:none;">
            <td align="right">���л��������ã�</td>
            <td>
                ��&nbsp;<asp:TextBox ID="drawWith" runat="server" CssClass="form"></asp:TextBox>px,&nbsp; ��&nbsp;<asp:TextBox ID="drawHeight" runat="server" CssClass="form"></asp:TextBox>px</td>
          </tr>
          <tr id="ClssStyle_26" class="TR_BG_list">
            <td align="right" >��Ŀ����˵����</td>
            <td>
                &nbsp;<asp:TextBox ID="fontText" runat="server" Height="50px" TextMode="MultiLine"  Width="40%" CssClass="form"></asp:TextBox> <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_27',this)">����</span>
                </td>
          </tr>
          <tr id="ClssStyle_27" class="TR_BG_list">
            <td align="right">��Ŀ����ͼƬ��</td>
            <td>
                &nbsp;<asp:TextBox ID="fileLoad" runat="server" Width="40%" CssClass="form"></asp:TextBox> <img src="../../sysImages/folder/s.gif" alt="ѡ������ͼƬ" border="0" style="cursor:pointer;" onclick="selectFile('pic',document.form1.fileLoad,480,600);document.form1.fileLoad.focus();" /> <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_28',this)">����</span></td>
          </tr>
          
         <tr id="ClssStyle_29" class="TR_BG_list">
            <td align="right">Meta�ؼ��֣�</td>
            <td>&nbsp;<asp:TextBox ID="KeyMeata" runat="server" Height="50px" Width="40%" TextMode="MultiLine" CssClass="form"></asp:TextBox> <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_30',this)">����</span></td>
          </tr>
          <tr id="ClssStyle_30" class="TR_BG_list">
            <td align="right">Meta������</td>
            <td style="height: 46px">&nbsp;<asp:TextBox ID="BeWrite" runat="server" Width="40%" Height="50px" TextMode="MultiLine" CssClass="form"></asp:TextBox> <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_31',this)">����</span></td>
          </tr>
          <tr id="ClssStyle_31" class="TR_BG_list">
            <td align="right">�û����Է������ۣ�</td>
            <td>
            <asp:CheckBox ID="Saying" runat="server" CssClass="form" /> <span class="helpstyle" style="cursor:hand;" title="����鿴����" onclick="Help('Class_Aspx_32',this)">����</span></td>
          </tr>      

       </table>
       
        <table style="width:98%" align="center" cellpadding="4" cellspacing="1" class="table" id="table2">
         <tr class="TR_BG_list">
             <td colspan="2" style="text-align:center;">
                 <asp:HiddenField ID="Hidden" runat="server" Value="0" />
                 <asp:HiddenField ID="ClassID" runat="server"/>
                 <asp:HiddenField ID="csHiden" runat="server" />
                 <asp:Button ID="btnClick" runat="server" Text="�ύ����" OnClick="btnClick_Click" CssClass="form" />
                 <input type="reset" class="form" value="������д" />
             </td>
         </tr>
        </table>
	    <br />
	    <br />
     <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg" style="height:76px">
       <tr>
         <td align="center"><div runat="server" id="SiteCopyRight" /></td>
       </tr>
     </table>
 </form>
</body>
</html>

<script type="text/javascript" language="javascript">
function changeDdivs(divid,divid1)
{
    document.getElementById(divid).style.display="";
    document.getElementById(divid1).style.display="none";
//    document.getElementById(divid).className="reshows";
//    document.getElementById(divid1).className="list_link";
    if(divid=="tableSetting")
    {
        document.getElementById("csize").className="reshow";
        document.getElementById("csize1").className="";
    }
    else
    {
        document.getElementById("csize1").className="reshow";
        document.getElementById("csize").className="";
    }
}
var aa = document.getElementById("csHiden").value;
if(aa==1)
    CheckedCode();

//�Ƿ��ⲿ��Ŀ
function CheckedCode()
{
    if(document.getElementById("CProject").checked)
    {
        document.getElementById("csize1").style.display="none";
        document.getElementById("ClssStyle_5").style.display="";
        
        document.getElementById("ClssStyle_6").style.display="none";
        document.getElementById("ClssStyle_7").style.display="none";
        document.getElementById("ClssStyle_8").style.display="none";
        document.getElementById("ClssStyle_9").style.display="none";
        document.getElementById("ClssStyle_12").style.display="none";
        document.getElementById("ClssStyle_11").style.display="none";
        document.getElementById("ClssStyle_32").style.display="none";
        document.getElementById("ClssStyle_35").style.display="none";
        
    }
    else
    {
        document.getElementById("csize1").style.display="";
        document.getElementById("ClssStyle_5").style.display="none";
        
        document.getElementById("ClssStyle_6").style.display="";
        document.getElementById("ClssStyle_7").style.display="";
        document.getElementById("ClssStyle_8").style.display="";
        document.getElementById("ClssStyle_9").style.display="";
        document.getElementById("ClssStyle_12").style.display="";
        document.getElementById("ClssStyle_11").style.display="";
        document.getElementById("ClssStyle_32").style.display="";
        document.getElementById("ClssStyle_35").style.display="";
    }
}

//�Ƿ�������ʾ���л�
function IsCode()
{
    var flag = document.getElementById("draw").checked;
    if(flag)
    {
        document.getElementById("ClssStyle_21").style.display="";
        document.getElementById("ClssStyle_22").style.display="";
    }
    else
    {
        document.getElementById("ClssStyle_21").style.display="none";
        document.getElementById("ClssStyle_22").style.display="none";        
    }
}
//�߼�ѡ��
function DispChange()
{
    var obj = document.getElementById("chkAdvance").checked;
    var cap = document.getElementById("captionadv");
    var tb = document.getElementById("tableSetting");
    if(obj)
    {
        cap.src = "../../sysImages/folder/hidead.gif";
        for(var i=15;i<tb.rows.length;i++)
        {
            var obj = tb.rows[i];
            if(obj.id!=null&&obj.id!="")
            document.getElementById(obj.id).style.display="";
        }
    }
    else
    {
        cap.src = "../../sysImages/folder/showad.gif";
        for(var i=15;i<tb.rows.length;i++)
        {
            var obj = tb.rows[i];
            if(obj.id!=null&&obj.id!="")
            document.getElementById(obj.id).style.display="none";
        }
    }
     document.getElementById("ClssStyle_33").style.display="";
}

function getDefinedData(obj)
{
    var c=0;
    var define = document.getElementById("DefineRows");
    var hiddenDef=document.getElementById("HiddenDefine")
    var j=0;
    for(var i=0;i<obj.length;i++)
    {
        if(obj.options[i].selected)
        {
            if(!IsDisValue(obj.options[i].value))
            {
                define.options[define.options.length] = new Option(obj.options[i].text,obj.options[i].value); 
                if(j>0||define.length>1)
                {
                    hiddenDef.value+=",";
                }
                hiddenDef.value+=obj.options[i].value;
                j++;
            }
            else
            {
                displayLoad.innerHTML="<font color=red>["+obj.options[i].text+"]��Ŀ��ѡ�񣬲����ظ�ѡ��</font>"
            }
            break;
        }
    }
}

function clearDefine()
{
     var define = document.getElementById("DefineRows");
     var hiddenDef=document.getElementById("HiddenDefine")
     hiddenDef.value="";
     clearall(define);
}

function clearall(obj)
{
    var testnum=obj.length;
    for(var j=testnum-1;j>=0;j--)
    {
        
        obj.options[j]=null;
    }
}

function IsDisValue(p)
{
    var flg=false;
    var define = document.getElementById("DefineRows");
    if(define.value!=null||define.value!="")
    {
        for(var i=0;i<define.length;i++)
        {
            if(define.options[i].value==p)
            {
                flg=true;
                break;
            }
        }
    }
    return flg;   
}

//function GetPositionHtml(str,str1)
//{
//      document.form1.HtmlPhrasing.value = "<a href=\"<%Response.Write(dirm); %>/\">��ҳ</a> >> {@ParentClassStr} >> "+str1+"";
//      document.form1.NewsHtmlPhrasing.value = "<a href=\"<%Response.Write(dirm); %>/\">��ҳ</a> >> {@ParentClassStr} >> <a href=\"{@ClassURL}\">"+str1+"</a> >> ����";
//}

function GetPY1(obj)
{
    if(document.getElementById('ClassID').value=="")
    {
        var s = obj.value.trim();
        if(s != '')
        {
            document.getElementById('TEname').value = GetPY(s);
        }
    }
}

new Form.Element.Observer($('TEname'),1,TEname_1);
	function TEname_1()
		{
			if ($('TEname').value=='')
			{
				$('HtmlPhrasing').value=''
				$('NewsHtmlPhrasing').value=''
			}
			else
			{
				$('HtmlPhrasing').value='<a href=\"<%Response.Write(dirm); %>/\">��ҳ</a> >> {@ParentClassStr} '+document.getElementById("TCname").value+' '
				$('NewsHtmlPhrasing').value='<a href=\"<%Response.Write(dirm); %>/\">��ҳ</a> >> {@ParentClassStr} <a href=\"{@ClassURL}\">'+document.getElementById("TCname").value+'</a> >> ����'
			}
		} 
		
    function getClassCName()
    {
        var strC=document.getElementById("TParentId").value;
	    var  options={  
				       method:'get',  
				       parameters:"Type=Class&add=1&ClassID="+strC,  
				       onComplete:function(transport)
					    {  
						    var returnvalue=transport.responseText;
						    if (returnvalue.indexOf("??")>-1)
                               $('ClassCnamev').innerHTML="error!";
						    else
                               $('ClassCnamev').innerHTML=returnvalue;
					    }  
				       }; 
	    new  Ajax.Request('../../configuration/system/getClassCname.aspx?no-cache='+Math.random(),options);
    } 
</script>
