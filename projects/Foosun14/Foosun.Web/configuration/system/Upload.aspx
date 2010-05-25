<%@ Page Language="C#" AutoEventWireup="true" Inherits="manage_Templet_Upload" ResponseEncoding="utf-8" Codebehind="Upload.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>�ļ��ϴ�__<%Response.Write(Foosun.Config.UIConfig.HeadTitle); %></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="../js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../js/Public.js"></script>
</head>
<body>
    <form id="f_Upload" runat="server" method="post" action="" enctype="multipart/form-data">
        <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" background="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/admin/reght_1_bg_1.gif">
            <tr>
                <td class="sysmain_navi"  style="PADDING-LEFT: 14px" height="30">�ļ��ϴ�</td>
            </tr>
        </table>
        <table width="98%" cellpadding="5" cellspacing="1" class="table" align="center">
            <tr class="TR_BG_list">
                <td class="list_link" style="text-align:left;">
                <input type="file" id="file" name="file" class="form" style="width:400px;" runat="server" onpropertychange="CheckSelectedFileType(this.value);" />
                <br />
                <asp:CheckBox ID="isWater" Text="��ˮӡ" runat="server" />
                    &nbsp;&nbsp;
                    <asp:CheckBox ID="isDelineation" runat="server" Text="����ͼ" /><span style="color:Red">(�ϴ���ͼƬ�ļ��벻Ҫ��ˮӡ������ͼ)</span>
                <br /><asp:CheckBox ID="CheckFileTF" runat="server" Enabled="false" Checked="true" Text="����ļ�������������(��ʽ:����ʱ5λ�����-ԭ�ļ�)." />
                <br /><asp:CheckBox ID="yearDirTF" runat="server" Text="�ϴ�����(��-��)Ŀ¼" />
                </td>
            </tr>
            <tr class="TR_BG_list">
            <td style="text-align:center;">
                <input type="button" id="tj" value=" �� �� " onclick="javascript:SubmitClick();"/>
                <input type="button" id="Button1" value=" �� �� " onclick="javascript:window.close();"/>
            </td>
            </tr>
        </table>
    </form>
</body>
<script language="javascript" type="text/javascript">
    function SubmitClick()
    {
        if (document.getElementById("file").value=="")
        {
            alert('��ѡ��Ҫ�ϴ����ļ�!');
        }
        else if (document.getElementById("file").value.length>300)
        {
            alert('�ļ�������!�����޸��ļ�������');
        }
        else
        {
          
            <% 
                string Path=Server.UrlEncode(Request.QueryString["Path"]);
                string ParentPath=Server.UrlEncode(Request.QueryString["ParentPath"]);
                string upfiletype=Request.QueryString["upfiletype"];
            %>
            document.f_Upload.action="Upload.aspx?Type=Upload&Path=<% Response.Write(Path); %>&upfiletype=<% Response.Write(upfiletype); %>&ParentPath=<% Response.Write(ParentPath); %>";
            document.f_Upload.submit();
        }
    }
    function killErrors() 
    { 
        return true; 
    } 
    window.onerror = killErrors; 
   function CheckSelectedFileType(filePath)
   {
        if(lastname(filePath))
        {
             document.getElementById("isWater").checked="checked";
             document.getElementById("isDelineation").checked="checked";
        }
        else
        {    
             document.getElementById("isWater").checked="";
             document.getElementById("isDelineation").checked="";
        }
       
   }
    function lastname(filepath){
        //Ϊ�˱���ת�巴б�ܳ����⣬���ｫ�������ת��
        var re = /(\\+)/g;  
        var filename=filepath.replace(re,"#"); 
        //��·���ַ������м��н�ȡ
        var one=filename.split("#"); 
        //��ȡ���������һ�������ļ���
        var two=one[one.length-1]; 
        //�ٶ��ļ������н�ȡ����ȡ�ú�׺��
        var three=two.split("."); 
         //��ȡ��ȡ�����һ���ַ�������Ϊ��׺��
        var last=three[three.length-1];
        //�����Ҫ�жϵĺ�׺������
        var tp ="jpg,gif,bmp,JPG,GIF,BMP"; 
        //���ط��������ĺ�׺�����ַ����е�λ��
        var rs=tp.indexOf(last); 
        //������صĽ�����ڻ����0��˵�����������ϴ����ļ�����
        if(rs>=0){
         return true;
         }
         else{
         
         return false;
        }
         
   }
 
</script>


</html>
