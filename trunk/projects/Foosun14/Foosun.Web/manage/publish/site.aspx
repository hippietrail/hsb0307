<%@ Page Language="C#" AutoEventWireup="true" Inherits="Foosun.Web.manage_publish_site" Codebehind="site.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath());%>/css/css.css" rel="stylesheet"
        type="text/css" />
    <style type="text/css">
    .divstyle {
    overflow:hidden;
    position:absolute;
    right:20px;
    top:5px;
    /*background:#FFFFE1 repeat-x left top;   */
    /*border:1px double #4F4F4F;*/ 
    width:150px;
    text-align:left;
    padding-left:2px;
    padding-top:2px;
    padding-bottom:2px;
    padding-right:2px;
    clip:rect(auto, auto, auto, auto);
    z-index:50;
    /*filter: progid:DXImageTransform.Microsoft.DropShadow(color=#B6B6B6,offX=2,offY=2,positives=true);  */
</style>
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
    <script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="pid" class="divstyle" style="text-align:center;display:block;">
            <asp:Button ID="Button2" runat="server" Text="���̷���" OnClick="Button1_Click" />
            <input id="Reset1" type="reset" value="����ѡ��" onclick="hidunHTMLclass();">
        </div>
        <asp:Panel ID="showweb" runat="server" Width="100%">
            <div id="showpublicdiv" class="divstyle" style="text-align: center; display: none;">
                ������ʾ��
            </div>
            <div id="News">
                <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="table">
                    <tr class="TR_BG">
                        <td align="left" colspan="3" style="height: 20px">
                            <strong><span id="news" onclick="OnMove(this,pubnews);" style="color:Blue;">[������ҳ/����]</span>&nbsp;
                            <span id="lanmu"  onclick="OnMove(this,publanmu);">[������Ŀ]</span>&nbsp;
                            <span id="special" onclick="OnMove(this,pubspec);">[����ר��]</span>
                            <span id="singles" onclick="OnMove(this,TableSingle);">[������ҳ]</span>
                            </strong>
                            </td>
                    </tr>
                    </table>
                    <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="table" id="pubnews" style="display:;">
                    <tr class="TR_BG">
                        <td colspan="2" align="left" style="height: 20px;">
                            <strong>������ҳ/����</strong></td>
                    </tr>
                    <tr class="TR_BG_list">
                        <td width="90" align="right" class="navi_link" style="width: 90px">
                            ������ҳ</td>
                        <td align="left" style="width: 365px">
                            <asp:CheckBox ID="indexTF" Checked="true" runat="server" />
                            &nbsp; &nbsp; <asp:CheckBox ID="baktf" Checked="true" Text="������ҳ�ļ�" runat="server" /> <span class="helpstyle" style="cursor:help;" title="����鿴����" onclick="Help('H_site_bak',this)">����</span>
                            </td>
                    </tr>
                    <tr class="TR_BG_list">
                        <td width="90" align="right" class="navi_link" style="width: 90px">
                            ������������</td>
                        <td align="left" style="width: 365px">
                            <asp:RadioButton ID="newsall" GroupName="News" runat="server" /></td>
                    </tr>
                    <tr class="TR_BG_list">
                        <td width="90" align="right" class="navi_link" style="width: 90px">
                            ����ID����</td>
                        <td align="left" style="width: 365px">
                            <asp:RadioButton ID="newsid" GroupName="News" runat="server" />��&nbsp;<asp:TextBox
                                ID="startID" runat="server" Width="50px" CssClass="form"></asp:TextBox>&nbsp;��&nbsp;<asp:TextBox
                                    ID="EndID" runat="server" Width="50px" CssClass="form"></asp:TextBox>                        </td>
                    </tr>
                    <tr class="TR_BG_list">
                        <td width="90" align="right" class="navi_link" style="width: 90px">
                            ��������</td>
                        <td align="left" style="width: 365px">
                            <asp:RadioButton ID="newslast" GroupName="News" runat="server" />
                            <asp:TextBox ID="NewNum" runat="server" Width="50px" CssClass="form">10</asp:TextBox>
                            ��                        </td>
                    </tr>
                    <tr class="TR_BG_list">
                        <td width="90" align="right" class="navi_link" style="width: 90px">
                            ֻ����δ����</td>
                        <td align="left" style="width: 365px">
                            <asp:RadioButton ID="newsunhtml" GroupName="News" runat="server" />
                            <asp:TextBox ID="unhtmlNum" runat="server" Width="50px" CssClass="form">100</asp:TextBox>
                            ��                        </td>
                    </tr>
                    <tr class="TR_BG_list">
                        <td width="90" align="right" class="navi_link" style="width: 90px; height: 24px;">
                            �������ڷ���</td>
                        <td align="left" style="height: 24px; width: 365px;">
                            <asp:RadioButton ID="newsdate" GroupName="News" runat="server" />
                            <asp:TextBox ID="startTime" runat="server" Width="100px" CssClass="form"></asp:TextBox>
                            <img src="../../sysImages/folder/s.gif" border="0" alt="ѡ������" style="cursor: pointer;"
                                onclick="selectFile('date',document.form1.startTime,160,500);document.form1.startTime.focus();" />
                            <asp:TextBox ID="endTime" runat="server" Width="100px" CssClass="form"></asp:TextBox>
                            <img src="../../sysImages/folder/s.gif" border="0" alt="ѡ������" style="cursor: pointer;"
                                onclick="selectFile('date',document.form1.endTime,160,500);document.form1.endTime.focus();" />                        </td>
                    </tr>
                    <tr class="TR_BG_list">
                        <td width="90" align="right" class="navi_link" style="width: 90px;">
                            ������Ŀ����</td>
                        <td align="left" valign="top" class="navi_link" style="width: 365px;">
                            <asp:RadioButton ID="newsclass" GroupName="News" onclick="shownewsclass();" runat="server" /><asp:CheckBox ID="unHTMLnews" runat="server" Text="ֻ����δ������" />
                            <asp:ListBox ID="divClassNews" Width="97%" runat="server" Rows="20" SelectionMode="Multiple" style="color: steelblue;border-right: white 1px solid; border-top: white 1px solid; border-left: white 1px solid; border-bottom: white 1px solid;">                            </asp:ListBox>
                            <label id="div_newsclass" style="display: none;">                            </label>                        </td>
                    </tr>
                    <tr class="TR_BG_list">
                        <td width="90" align="right" class="navi_link" style="width: 90px">
                            ��������</td>
                        <td align="left" valign="top" class="navi_link" style="width: 365px">
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem Value="0">�Զ����</asp:ListItem>
                                <asp:ListItem Value="1">���</asp:ListItem>
                                <asp:ListItem Value="2">Ȩ��</asp:ListItem>
                                <asp:ListItem Value="3">����</asp:ListItem>
                                <asp:ListItem Value="4">�Ƽ�</asp:ListItem>
                                <asp:ListItem Value="5">����</asp:ListItem>
                                <asp:ListItem Value="6">�ȵ�</asp:ListItem>
                                <asp:ListItem Value="7">�õ�</asp:ListItem>
                                <asp:ListItem Value="8">ͷ��</asp:ListItem>
                                <asp:ListItem Value="9">����</asp:ListItem>
                                <asp:ListItem Value="10">����</asp:ListItem>
                                <asp:ListItem Value="11">������</asp:ListItem>
                                <asp:ListItem Value="12">����Դ</asp:ListItem>
                                <asp:ListItem Value="13">��TAGS</asp:ListItem>
                                <asp:ListItem Value="14">��ͼƬ</asp:ListItem>
                                <asp:ListItem Value="15">�и���</asp:ListItem>
                                <asp:ListItem Value="16">����Ƶ</asp:ListItem>
                                <asp:ListItem Value="17">�л��л�</asp:ListItem>
                                <asp:ListItem Value="18">��ͶƱ</asp:ListItem>
                                <asp:ListItem Value="19">������</asp:ListItem>
                                <%--                            <asp:ListItem Value="20">��������</asp:ListItem>
--%>
                            </asp:DropDownList>
                            <asp:CheckBox ID="orderbyDesc" Checked="true" runat="server" Text="���򷢲�" /></td>
                    </tr>
                    <tr runat="server" id="indexPublic">
                        <td colspan="2"  class="navi_link" style="text-align: left;">
                            ���������� ��ʼ����
                            <asp:TextBox ID="indexstatDate" runat="server"></asp:TextBox>
                            <img src="../../sysImages/folder/s.gif" border="0" alt="ѡ������" style="cursor: pointer;"
                                onclick="selectFile('date',document.form1.indexstatDate,160,500);document.form1.indexstatDate.focus();" />
                            ��������
                            <asp:TextBox ID="indexendDate" runat="server"></asp:TextBox>
                            <img src="../../sysImages/folder/s.gif" border="0" alt="ѡ������" style="cursor: pointer;"
                                onclick="selectFile('date',document.form1.indexendDate,160,500);document.form1.indexendDate.focus();" /><label></label></td>
                    </tr>
                    </table>
                    <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="table" id="publanmu"  style="display:none;">
                    <tr runat="server">
                        <td class="navi_link" colspan="2" style="text-align: left">
                            <strong>������Ŀ</strong></td>
                    </tr>
                    <tr runat="server">
                        <td class="navi_link" colspan="2" style="text-align: left">
                            &nbsp;<asp:RadioButton ID="classall" runat="server" GroupName="class" onclick="showclass(this)"
                                Text="����������" />
                            &nbsp;<asp:RadioButton ID="classselect" runat="server" GroupName="class" onclick="showclass1(this)"
                                Text="ѡ����Ŀ" Visible="false" />
                            <label id="div_classs" style="display: none">
                                <asp:CheckBox ID="unHTMLclass" runat="server" EnableTheming="True" Text="ֻ����δ������" /></label>
                            <asp:CheckBox ID="pIndex" runat="server" Text="ͬʱ���������ļ�" />
                            <span class="helpstyle" onclick="Help('H_public_index',this)" style="cursor: help"
                                title="����鿴����">����</span>
                                <br />
                            <asp:ListBox ID="divClassClass" runat="server" Rows="30" SelectionMode="Multiple"
                                Width="50%" style="color: steelblue"></asp:ListBox></td>
                    </tr>
                    </table>
                    <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="table" id="pubspec" style="display:none;">
                    <tr runat="server">
                        <td class="navi_link" colspan="2" style="text-align: left">
                            <strong>����ר��</strong></td>
                    </tr>
                    <tr runat="server">
                        <td class="navi_link" colspan="2" style="text-align: left">
                            <asp:RadioButton ID="specialall" runat="server" GroupName="special" Text="��������ר��" />
                            <asp:RadioButton ID="specialselect" runat="server" GroupName="special" onclick="showSpecial1(this)"
                                Text="ѡ��ר��" Visible="false" />
                                <br />
                            <asp:ListBox ID="DivSpecial" runat="server" Rows="30" SelectionMode="Multiple" Width="50%" style="color: steelblue">
                            </asp:ListBox>
                            <label id="div_special" style="display: none">
                            </label>
                        </td>
                    </tr>
                </table>
                <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="table" id="TableSingle" style="display:none;">
                    <tr id="Tr1" runat="server">
                        <td class="navi_link" colspan="2" style="text-align: left">
                            <strong>������ҳ</strong></td>
                    </tr>
                    <tr id="Tr2" runat="server">
                        <td class="navi_link" colspan="2" style="text-align: left">
                            <asp:RadioButton ID="RadioButton1_singleness" runat="server" GroupName="singleness" Text="�������е�ҳ" />
                                <br />
                            <asp:ListBox ID="ListBox_singleness" runat="server" Rows="30" SelectionMode="Multiple" Width="50%" style="color: steelblue">
                            </asp:ListBox>
                            <label id="Label1" style="display: none">
                            </label>
                        </td>
                    </tr>
                </table>
                <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="table">
                    <tr>
                      <td colspan="2" class="TR_BG_list" style="text-align: right;padding-right:12px;">
                      <asp:Button ID="Button1" runat="server" Text="���̷���" OnClick="Button1_Click" />                      
                      <input name="reset" type="reset" id="buttons" onclick="hidunHTMLclass();" value="����ѡ��" />
                      </td>
                    </tr>
                </table>
            </div>
            <br />
            <br />
            <table width="100%" border="0" cellpadding="8" cellspacing="0" class="copyright_bg"
                style="height: 76px" align="center">
                <tr>
                    <td align="center">
                        <label id="copyright" runat="server" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>

<script language="javascript" type="text/javascript">
    function checkform()
    {
        var re = /^[0-9]*$$/;
        var newsid = document.getElementById("newsid");
        if(newsid.checked)
        {
            if(re.test(document.getElementById("startID").value)==false||re.test(document.getElementById("EndID").value)==false)
            {
               alert("����ȷ��д��ʼID�ͽ���ID");
               document.getElementById('startID').focus();
               return false;
            }
        }
        
        var newsal = document.getElementById("newsall");
        if(newsal.checked)
        {
            if(!confirm('��ȷ��Ҫˢ������������\nˢ���������Ž�ռ�ô�����������Դ\n���鰴������������\n����ڲ��������е�[����ˢ��]��������[��Ϣÿ��ˢ����],������Ҫ������\nȷ��Ҫ���ɣ����[ȷ��]'))
            {
                 return false;
            }
        }
        var Newss = document.getElementById("newslast");
        if(Newss.checked)
        {
            if(re.test(document.getElementById("NewNum").value)==false)
            {
               alert("����ȷ��д��������");
                document.getElementById('NewNum').focus();
               return false;
            }
        }
        var newsdate = document.getElementById("newsdate");
        if(newsdate.checked)
        {
            if(document.getElementById("startTime").value==""||document.getElementById("endTime").value=="")
            {
               alert("����д��ʼʱ��ͽ���ʱ��");
                document.getElementById('startTime').focus();
               return false;
            }
        }
        
        var newsclass = document.getElementById("newsclass");
        if(newsclass.checked)
        {
            if(document.getElementById("divClassNews").value=="")
            {
               alert("��ѡ����Ŀ����");
               return false;
            }
        }
        
//        var classselect = document.getElementById("classselect");
//        if(classselect.checked)
//        {
//            if(document.getElementById("divClassClass").value=="")
//            {
//               alert("��ѡ����Ŀ����");
//               return false;
//            }
//        }
//        
//        var specialselect = document.getElementById("specialselect");
//        if(specialselect.checked)
//        {
//            if(document.getElementById("DivSpecial").value=="")
//            {
//               alert("��ѡ��ר�ⷢ��");
//               return false;
//            }
//        }
    }

    function showSpecial(obj)
    {
          var divobj= document.getElementById('div_special');
          if(divobj.style.display=="")
          {
//            divobj.style.display="none";
          }
          else
          {
            divobj.style.display="";
          }
    }

    function showSpecial1(obj)
    {
          var divobj= document.getElementById('div_special');
          divobj.style.display="none";
    }
    
    function showclass(obj)
    {
          var divobj= document.getElementById('unHTMLclass');
          var div_classsobj=document.getElementById('div_classs');
          if(divobj.style.display=="")
          {
//            divobj.style.display="none";
          }
          else
          {
              divobj.style.display="";            
          }
          if(div_classsobj.style.display="")
          {          
          }
          else
          {
              div_classsobj.style.display="";
          }
    }

    function showclass1(obj)
    {
          var divobj= document.getElementById('div_classs');
          divobj.style.display="none";
    }
    
    function shownewsclass()
    {
          var divobj= document.getElementById('newsclass');
          var divobj1 = document.getElementById('div_newsclass');
          if(divobj.checked)
          {
            divobj1.style.display="";
          }
          else
          {
            divobj1.style.display="none";
          }
    } 
    
    function hidunHTMLclass()
    {          
          document.getElementById('unHTMLclass').style.display="none";
          document.getElementById('div_classs').style.display="none";          
    }
</script>
<script language="javascript" type="text/javascript">
    function OnMove(obj,objt)
    {    
        news.style.color = "Black";
        lanmu.style.color = "Black";
        special.style.color = "Black";
        singles.style.color = "Black";
        obj.style.cursor = "hand";
        obj.style.color = "Blue";
        pubnews.style.display = "none";
        publanmu.style.display = "none";
        pubspec.style.display = "none";
        TableSingle.style.display = "none";
        objt.style.display = "";
    }
    </script>
