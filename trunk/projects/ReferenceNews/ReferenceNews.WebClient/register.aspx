<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/Site.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="ReferenceNews.WebClient.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">



<div class="page page-register">

<div class="page-head"> 
  <h6 class="bd"></h6> 
</div> 
<div class="page-layer "> 
  <div class="pl-left"> 
    <h1 class="page-title">��Աע��</h1> 
    <div class="registerStep step1"> 
      <div class="step"><span class="active">��дע����Ϣ</span></div> 
      <div class="step"><span>ȷ������</span></div> 
      <div class="step"><span>ע��ɹ�</span></div> 
    </div> 
      <%--<form name="register_form" id="register_form" method="post" action="" class="memberForm"> --%>
      <form id="aspnetForm" class="memberForm" runat="server">
        <table align="left"> 
          <tr> 
            <td colspan="2">            </td> 
          </tr> 
          <tr> 
            <td width="80">��������:</td> 
            <td > 
              <input type="text" name="email" id="email" runat="server" /> 
              <div id="ctl00_mainContent_emailTip" style="width:237px;"></div> 
          </td> 
          </tr> 
          <tr> 
            <td>��&nbsp;&nbsp;&nbsp;��:</td> 
            <td> 
              <input type="password" id="password" name="password"  onKeyUp="pwStrength(this.value)" onBlur="pwStrength(this.value)" runat="server" /> 
               <div id="ctl00_mainContent_passwordTip" style="width:237px"></div> 
			  </td> 
          </tr> 
		  <tr> 
            <td>����ǿ��:</td> 
            <td> 
				<table id="password_css_deletepa" width="200px"  border="0" cellspacing="0" cellpadding="1" bordercolor="#cccccc" > 
					<tr align="center" bgcolor="#eeeeee"> 
					   <td width="33%" id="strength_L">��</td> 
					   <td width="33%" id="strength_M">��</td> 
					   <td width="33%" id="strength_H">ǿ</td> 
					</tr> 
				</table> 
			  </td> 
          </tr> 
          <tr> 
            <td>ȷ������:</td> 
            <td> 
              <input type="password" name="password_confirm" id='password_confirm' runat="server"  /> 
			  <div id="ctl00_mainContent_password_confirmTip" style="width:237px"></div> 
			  </td> 
          </tr> 
                     <tr> 
            <td>��֤��:</td> 
            <td><div> 
              <input class="captchaArea" type="text" name="captcha1" id="captcha1" runat="server" /> 
              <a href="javascript:change_captcha($('#captcha'));" class="renewedly" style="float:left;">&nbsp;<img id="captcha" src="CommonServices/CaptchaHandler.ashx" width="80px" height="24px" alt="" /></a></div> 
			  <em class="cr"></em> 
			  <div id="ctl00_mainContent_captcha1Tip" style="width:237px"></div> 
			  </td> 
          </tr> 
          
          <tr> 
            <td colspan="2">��Ա����Э��:</td> 
          </tr> 
          <tr> 
            <td colspan="2"><div class="registerAgreement"> 
<p> 
iximo����īͬ�ⰴ�ձ�Э��Ĺ涨���������ܷ����Ĺ����ṩ���ڻ������Լ��ƶ�������ط������³ơ�������񡱣���Ϊ����������ʹ���ˣ����³ơ��û�������ŵ���ܲ����ظ�����ع涨���û��ڽ���ע���������е�������ܡ���ť����ʾ��ȫ���ܱ�Э�����µ�ȫ���涨��</p> 
<p>һ��Э������<br /> 
��һ���û�ע��ɹ��󣬱�վ���������ÿ���û�һ����Ա�Ű������������ַ�������ַ���������û����б��ܣ��û�ʹ�������ַ��¼��վ���������л�����������Ρ�<br /> 
��������վ�ṩ�����Ͻ��ף�ƽ̨���������Ķ���΢���ռ䡢������Ʒ���������۵ȷ���<br /> 
��������վ�ṩ�Ĳ����������Ϊ�շѵ�������񣬻����û�ʹ��֮ǰ������ȷ����ʾ��ֻ���û�ȷ��Ը��֧����ط��ò���ʹ�øõ��շ���Ŀ��<br /> 
���ģ������������������ԣ��û�ͬ�Ȿվ��Ȩ��ʱ������жϻ���ֹ���ֻ�ȫ����������񣨰����շ�������񣩡��������жϻ���ֹ�ķ��������շ�������Ŀ����վ�ڱ�����жϻ���ֹ֮ǰ����֪ͨ�û��������û��ṩ��ֵ������߽��˻�����˻����û������շѷ�����֪ͨ��<br /> 
</p> 
<p> 
����ע������<br /> 
��һ���緢�������κ�һ�����Σ���վ��Ȩ��ʱ�жϻ���ֹ���û��ṩ��Э�����µ�������񣨰����շ�������񣩶�������û����κε������е��κ����Σ�<br /> 
1. �û��ṩ�ĸ������ϲ���ʵ��<br /> 
2. �û�Υ����Э���й涨��ʹ�ù���<br /> 
 
������ ���û�ע���������������ʺ����κ�����180����δʵ��ʹ�ã������û�ע����շ����������ʺ����䶩�����շ��������ķ�������֮������180����δʵ��ʹ�ã���վ��Ȩɾ�����ʺŲ�ֹͣΪ���û��ṩ��ص��������<br /> 
�������û���Ӧ���������ʺš�����ת�û����������ʹ�á����û������������ʺ������˷Ƿ�ʹ�ã�Ӧ����������ߡ���ڿ���Ϊ���û��ı���������������ʺš����������˷Ƿ�ʹ�ã���վ���е��κ����Ρ�<br /> 
���ģ���վ��Ȩ���ڱ�վ��������»�ͼƬ����ʹ�û����������˺���ʹ����������;��ʹ��ʱ��Ϊ�����������Է�������ʱע��������Ϊ׼�������и�����Ȩ�����߳��⡣<br /> 
�������û���ʹ��iximo����ī������Ĺ����У�������ѭ����ԭ��<br /> 
1. ���ع����йصķ��ɺͷ��棻<br /> 
2. ������������������йص�����Э�顢�涨�ͳ���<br /> 
3. �������ñ�վ�ṩ����������ϴ���չʾ�򴫲��κηǷ�����Ϣ���ϣ�<br /> 
4. �����ַ������κε�������ר��Ȩ������Ȩ���̱�Ȩ������Ȩ�������κκϷ�Ȩ�棻<br /> 
5. �������ñ�վ�������ϵͳ�����κο��ܶԻ��������ƶ���������ת��ɲ���Ӱ�����Ϊ��<br /> 
6. ���������������ϵͳ�����κβ����ڱ�վ����Ϊ���緢������վ�������ҵ��档<br /> 
</p> 
<p> 
���� ��˽����<br /> 
��һ����վ�����û���˽����֤�����⹫������������ṩ�����û���ע�����ϼ��û���ʹ���������ʱ�洢�ڱ�վ�ķǹ������ݣ�������û���������з���Ҫ���������⣻<br /> 
�������û�ͬ�Ȿվ�ռ��йط���״�������û��Է���ʹ�õ�ĳЩ��Ϣ����վ��Ȩ���û��Ļ����Զ��ϴ�����������Щ��Ϣ����Щ���ݲ��ṹ��˽����ݵ�ȷ�ϡ�<br /> 
�������ڲ�͸¶�����û���˽���ϵ�ǰ���£���վ��Ȩ�������û����ݿ���з��������û����ݿ������ҵ�ϵ����á�<br /> 
</p> 
<p> 
�ġ�Э�����<br /> 
��վ��Ȩ������Ҫ��ʱ���ƶ����޸ı�Э����������籾Э�����κα������վ������վ���Թ�ʾ��ʽ֪ͨ���û��������ͬ�Ȿվ�Ա�Э����������������޸ģ��û���Ȩֹͣʹ�������������û�����ʹ�������������Ϊ�û����ܶԱ�Э����������������޸ġ�</p> 
<p> 
�塢֪ͨ�ʹ�<br /> 
��Э�����±�վ�����û����е�֪ͨ����ͨ����ҳ���桢�����ʼ���վ�ڶ��Ż򳣹���ż����͵ȷ�ʽ���У�֪ͨ�ڷ���֮����Ϊ���ʹ��ռ��ˡ�<br /> 
</p> 
<p> 
�������ɹ�Ͻ<br /> 
��˫���ͱ�Э�����ݻ���ִ�з����κ����飬˫��Ӧ�����Ѻ�Э�̽����Э�̲���ʱ���κ�һ��������վ���ڵصķ�Ժ�������ϡ�</p> 
			 </div></td> 
          </tr> 
          <tr> 
          <td colspan="2"> 
		    <input id="agree" type="checkbox" name="agree" value="1" class="checkbox" /> 
            <label class="field_notice" for="clause" style=" float:left; ">�����Ķ���ͬ��
		      <a href="index.php?app=article&amp;act=system&amp;code=eula" target="_blank" class="agreement">��Ա����Э��</a></label> 
			  <em class="cr"></em> 
		    <div id="agreeTip" style="width:237px"></div> 
          </td> 
          </tr> 
 
          <tr> 
            <td></td> 
            <td colspan="1"> 
			<div class="bigButton but-01" style="width:120px; "> 
			    <a href="javascript:;" > 
			    <span class="inc"><asp:Button ID="btnSubmit" runat="server" Text="ע ��"  ToolTip="����ע��" onclick="btnSubmit_Click" /></span> 
				<span class="lAng" ></span><span class="rAng" ></span></a> 
		    </div> 
			</td> 
            <input type="hidden" name="ret_url" value="" /> 
          </tr> 
        </table> 
      </form> 
  </div> 
  <div class="pl-right"> 
    <div class="plr-inner"> 
      <div class="registerHeading"></div> 
      <div class="mod modAng"> 
        <div class="modHead"> 
          <h3 class="bd">���л�Ա�ʺ������ԣ�</h3> 
          <span class="lAng" ></span><span class="rAng" ></span> </div> 
        <div  class="modBody"> 
          <ul class="introduction"> 
            <li>�����ղء���ǩ���ܣ���ע�Լ�ϲ����С˵</li> 
            <li>�������ۣ�����Լ��Ĺ۵�</li> 
            <li>����������ϣ����ø���ϲ��</li> 
            <li>�������ǩ����չ�ָ��˶�̬</li> 
            <li>���������Ķ����飬һ��ͨ��</li> 
          </ul> 
          <em class="cr"></em> </div> 
        <div class="modFoot"><span class="lAng"></span><span class="rAng"></span></div> 
      </div> 
      <div class="mod modAng"> 
        <div class="modHead"> 
          <h3 class="bd">�����ʺ�</h3> 
          <span class="lAng" ></span><span class="rAng" ></span> </div> 
        <div  class="modBody"> 
          <div class="bigButton but-01"> <a href="login.aspx" > <span class="inc" >���ϵ�¼��</span> <span class="lAng" ></span><span class="rAng" ></span></a> </div> 
          <em class="cr"></em> </div> 
        <div class="modFoot"><span class="lAng"></span><span class="rAng"></span></div> 
      </div> 
      <div class="mod modAng"> 
        <div class="modHead"> 
          <h3 class="bd">ע������</h3> 
          <span class="lAng" ></span><span class="rAng" ></span> </div> 
        <div  class="modBody"> 
          <div class="bigButton but-01"> <a href="register.aspx" > <span class="inc" >����ע��!</span> <span class="lAng" ></span><span class="rAng" ></span></a> </div> 
          <em class="cr"></em> </div> 
        <div class="modFoot"><span class="lAng"></span><span class="rAng"></span></div> 
      </div> 
    </div> 
    <em class="cr"></em> </div> 
  <div class="page-foot"> 
    <h6 class="bd"></h6> 
  </div> 
</div> 

</div>

 <script type="text/javascript"> 
//ע����߱���֤
     $(document).ready(function() {
         $.formValidator.initConfig({ formid: "aspnetForm", onerror: function(msg) { alert(msg) } });
         $("#ctl00_mainContent_email").formValidator({ onshow: "����������", onfocus: "��������6���ַ�", oncorrect: "���������ע��" })
		.inputValidator({ min: 6, onerror: "�����������Ƿ�,������" })
		.regexValidator({ regexp: "^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$", onerror: "�����ʽ����ȷ" })
        .ajaxValidator({
            type: "get",
            url: "CommonServices/MembershipHandler.ashx?action=check",
            datatype: "text",
            success: function(data) {
                if (data == "1") {
                    return true;
                }
                else {
                    return false;
                }
            },
            buttons: $("#button"),
            error: function() { alert("������û�з������ݣ����ܷ�����æ��������"); },
            onerror: "���ṩ�������Ѵ���",
            onwait: "���ڶ�������кϷ���У�飬���Ժ�..."
        });

         //         $("#ctl00_mainContent_email").formValidator({ onshow: "����������", onfocus: "����6-100���ַ�,������ȷ�˲����뿪����", oncorrect: "��ϲ��,�������", defaultvalue: "@", forcevalid: false })
         //         .inputValidator({ min: 6, max: 100, onerror: "����������䳤�ȷǷ�,��ȷ��" })
         //         .regexValidator({ regexp: "^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$", onerror: "������������ʽ����ȷ" });



         $("#ctl00_mainContent_password").formValidator({ onshow: "����������", onfocus: "���벻��Ϊ��", oncorrect: "����Ϸ�" })
	.inputValidator({ min: 6, max: 16, empty: { leftempty: false, rightempty: false, emptyerror: "�������߲����пշ���" }, onerror: "���볤��Ϊ6-16λ,������" });

         $("#ctl00_mainContent_password_confirm").formValidator({ onshow: "�������ظ�����", onfocus: "�����������һ��", oncorrect: "����һ��" })
	.inputValidator({ min: 1, empty: { leftempty: false, rightempty: false, emptyerror: "�ظ��������߲����пշ���" }, onerror: "�ظ����벻��Ϊ��,������" })
	.compareValidator({ desid: "ctl00_mainContent_password", operateor: "=", onerror: "�������벻һ��,������" });

         $("#agree").formValidator({ onshow: "��ͬ���Э��", onfocus: "��ͬ���Э��", oncorrect: "ͬ���˸�Э��" })
    .inputValidator({ min: 1, onerror: "��ͬ���Э��" });

         $("#ctl00_mainContent_captcha1").formValidator({ onshow: "��������֤��", onfocus: "���ͼƬ�ɸ���", oncorrect: "��֤����ȷ" })

        .ajaxValidator({
            type: "get",
            url: "CommonServices/MembershipHandler.ashx?action=check_captcha",
            datatype: "json",
            success: function(data) {
                //alert(data);
                if (data == "1") {
                    return true;
                }
                else {
                    return false;
                }
            },
            error: function() { alert("������û�з������ݣ����ܷ�����æ��������"); },
            onerror: "���������֤�����,������",
            onwait: "���ڶ���֤����кϷ���У�飬���Ժ�..."
        });
     });
</script> 


</asp:Content>
