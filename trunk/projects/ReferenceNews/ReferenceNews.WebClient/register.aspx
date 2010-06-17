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
    <h1 class="page-title">会员注册</h1> 
    <div class="registerStep step1"> 
      <div class="step"><span class="active">填写注册信息</span></div> 
      <div class="step"><span>确认邮箱</span></div> 
      <div class="step"><span>注册成功</span></div> 
    </div> 
      <%--<form name="register_form" id="register_form" method="post" action="" class="memberForm"> --%>
      <form id="aspnetForm" class="memberForm" runat="server">
        <table align="left"> 
          <tr> 
            <td colspan="2">            </td> 
          </tr> 
          <tr> 
            <td width="80">电子邮箱:</td> 
            <td > 
              <input type="text" name="email" id="email" runat="server" /> 
              <div id="ctl00_mainContent_emailTip" style="width:237px;"></div> 
          </td> 
          </tr> 
          <tr> 
            <td>密&nbsp;&nbsp;&nbsp;码:</td> 
            <td> 
              <input type="password" id="password" name="password"  onKeyUp="pwStrength(this.value)" onBlur="pwStrength(this.value)" runat="server" /> 
               <div id="ctl00_mainContent_passwordTip" style="width:237px"></div> 
			  </td> 
          </tr> 
		  <tr> 
            <td>密码强度:</td> 
            <td> 
				<table id="password_css_deletepa" width="200px"  border="0" cellspacing="0" cellpadding="1" bordercolor="#cccccc" > 
					<tr align="center" bgcolor="#eeeeee"> 
					   <td width="33%" id="strength_L">弱</td> 
					   <td width="33%" id="strength_M">中</td> 
					   <td width="33%" id="strength_H">强</td> 
					</tr> 
				</table> 
			  </td> 
          </tr> 
          <tr> 
            <td>确认密码:</td> 
            <td> 
              <input type="password" name="password_confirm" id='password_confirm' runat="server"  /> 
			  <div id="ctl00_mainContent_password_confirmTip" style="width:237px"></div> 
			  </td> 
          </tr> 
                     <tr> 
            <td>验证码:</td> 
            <td><div> 
              <input class="captchaArea" type="text" name="captcha1" id="captcha1" runat="server" /> 
              <a href="javascript:change_captcha($('#captcha'));" class="renewedly" style="float:left;">&nbsp;<img id="captcha" src="CommonServices/CaptchaHandler.ashx" width="80px" height="24px" alt="" /></a></div> 
			  <em class="cr"></em> 
			  <div id="ctl00_mainContent_captcha1Tip" style="width:237px"></div> 
			  </td> 
          </tr> 
          
          <tr> 
            <td colspan="2">会员服务协议:</td> 
          </tr> 
          <tr> 
            <td colspan="2"><div class="registerAgreement"> 
<p> 
iximo！吸墨同意按照本协议的规定及将来可能发布的规则提供基于互联网以及移动网的相关服务（以下称“网络服务”）。为获得网络服务，使用人（以下称“用户”）承诺接受并遵守各项相关规定。用户在进行注册程序过程中点击“接受”按钮即表示完全接受本协议项下的全部规定。</p> 
<p>一、协议内容<br /> 
（一）用户注册成功后，本站将随机给予每个用户一个会员号绑定于您的邮箱地址；邮箱地址和密码由用户自行保管；用户使用邮箱地址登录本站，进行所有活动并负法律责任。<br /> 
（二）本站提供如网上交易（平台）、在线阅读、微博空间、发表作品、发表评论等服务。<br /> 
（三）本站提供的部分网络服务为收费的网络服务，会在用户使用之前给予明确的提示，只有用户确认愿意支付相关费用才能使用该等收费项目。<br /> 
（四）鉴于网络服务的特殊性，用户同意本站有权随时变更、中断或终止部分或全部的网络服务（包括收费网络服务）。如变更、中断或终止的服务属于收费网络项目，本站在变更、中断或终止之前事先通知用户，并向用户提供等值服务或者将账户余额退还给用户；非收费服务不予通知。<br /> 
</p> 
<p> 
二、注意事项<br /> 
（一）如发生下列任何一种情形，本站有权随时中断或终止向用户提供本协议项下的网络服务（包括收费网络服务）而无需对用户或任何第三方承担任何责任：<br /> 
1. 用户提供的个人资料不真实；<br /> 
2. 用户违反本协议中规定的使用规则；<br /> 
 
（二） 如用户注册的免费网络服务的帐号在任何连续180日内未实际使用，或者用户注册的收费网络服务的帐号在其订购的收费网络服务的服务期满之后连续180日内未实际使用，则本站有权删除该帐号并停止为该用户提供相关的网络服务。<br /> 
（三）用户不应将其邮箱帐号、密码转让或出借予他人使用。如用户发现其邮箱帐号遭他人非法使用，应立即提出申诉。因黑客行为或用户的保管疏忽导致邮箱帐号、密码遭他人非法使用，本站不承担任何责任。<br /> 
（四）本站有权将在本站发表的文章或图片自行使用或者与其他人合作使用于其他用途，使用时需为作者署名，以发表文章时注明的署名为准。文章有附带版权声明者除外。<br /> 
（三）用户在使用iximo！吸墨网服务的过程中，必须遵循以下原则：<br /> 
1. 遵守国家有关的法律和法规；<br /> 
2. 遵守所有与网络服务有关的网络协议、规定和程序；<br /> 
3. 不得利用本站提供的网络服务上传、展示或传播任何非法的信息资料；<br /> 
4. 不得侵犯其他任何第三方的专利权、著作权、商标权、名誉权或其他任何合法权益；<br /> 
5. 不得利用本站网络服务系统进行任何可能对互联网或移动网正常运转造成不利影响的行为；<br /> 
6. 不得利用网络服务系统进行任何不利于本站的行为，如发布非网站允许的商业广告。<br /> 
</p> 
<p> 
三、 隐私保护<br /> 
（一）本站保护用户隐私，保证不对外公开或向第三方提供单个用户的注册资料及用户在使用网络服务时存储在本站的非公开内容，但获得用户允许或者有法律要求的情况除外；<br /> 
（二）用户同意本站收集有关服务状况，如用户对服务使用的某些信息，本站有权从用户的机器自动上传或者下载这些信息，这些数据不会构成私人身份的确认。<br /> 
（三）在不透露单个用户隐私资料的前提下，本站有权对整个用户数据库进行分析并对用户数据库进行商业上的利用。<br /> 
</p> 
<p> 
四、协议更新<br /> 
本站有权根据需要不时地制定、修改本协议或各类规则，如本协议有任何变更，本站将在网站上以公示形式通知予用户。如果不同意本站对本协议相关条款所做的修改，用户有权停止使用网络服务。如果用户继续使用网络服务，则视为用户接受对本协议相关条款所做的修改。</p> 
<p> 
五、通知送达<br /> 
本协议项下本站对于用户所有的通知均可通过网页公告、电子邮件、站内短信或常规的信件传送等方式进行；通知于发送之日视为已送达收件人。<br /> 
</p> 
<p> 
六、法律管辖<br /> 
如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向本站所在地的法院提起诉讼。</p> 
			 </div></td> 
          </tr> 
          <tr> 
          <td colspan="2"> 
		    <input id="agree" type="checkbox" name="agree" value="1" class="checkbox" /> 
            <label class="field_notice" for="clause" style=" float:left; ">我已阅读并同意
		      <a href="index.php?app=article&amp;act=system&amp;code=eula" target="_blank" class="agreement">会员服务协议</a></label> 
			  <em class="cr"></em> 
		    <div id="agreeTip" style="width:237px"></div> 
          </td> 
          </tr> 
 
          <tr> 
            <td></td> 
            <td colspan="1"> 
			<div class="bigButton but-01" style="width:120px; "> 
			    <a href="javascript:;" > 
			    <span class="inc"><asp:Button ID="btnSubmit" runat="server" Text="注 册"  ToolTip="立即注册" onclick="btnSubmit_Click" /></span> 
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
          <h3 class="bd">已有会员帐号您可以：</h3> 
          <span class="lAng" ></span><span class="rAng" ></span> </div> 
        <div  class="modBody"> 
          <ul class="introduction"> 
            <li>享用收藏、书签功能，关注自己喜爱的小说</li> 
            <li>参与评论，表达自己的观点</li> 
            <li>保存个人资料，设置个人喜爱</li> 
            <li>发表个性签名，展现个人动态</li> 
            <li>更多数字阅读体验，一号通行</li> 
          </ul> 
          <em class="cr"></em> </div> 
        <div class="modFoot"><span class="lAng"></span><span class="rAng"></span></div> 
      </div> 
      <div class="mod modAng"> 
        <div class="modHead"> 
          <h3 class="bd">已有帐号</h3> 
          <span class="lAng" ></span><span class="rAng" ></span> </div> 
        <div  class="modBody"> 
          <div class="bigButton but-01"> <a href="login.aspx" > <span class="inc" >马上登录！</span> <span class="lAng" ></span><span class="rAng" ></span></a> </div> 
          <em class="cr"></em> </div> 
        <div class="modFoot"><span class="lAng"></span><span class="rAng"></span></div> 
      </div> 
      <div class="mod modAng"> 
        <div class="modHead"> 
          <h3 class="bd">注册作者</h3> 
          <span class="lAng" ></span><span class="rAng" ></span> </div> 
        <div  class="modBody"> 
          <div class="bigButton but-01"> <a href="register.aspx" > <span class="inc" >马上注册!</span> <span class="lAng" ></span><span class="rAng" ></span></a> </div> 
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
//注册读者表单验证
     $(document).ready(function() {
         $.formValidator.initConfig({ formid: "aspnetForm", onerror: function(msg) { alert(msg) } });
         $("#ctl00_mainContent_email").formValidator({ onshow: "请输入邮箱", onfocus: "邮箱至少6个字符", oncorrect: "该邮箱可以注册" })
		.inputValidator({ min: 6, onerror: "你输入的邮箱非法,请重试" })
		.regexValidator({ regexp: "^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$", onerror: "邮箱格式不正确" })
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
            error: function() { alert("服务器没有返回数据，可能服务器忙，请重试"); },
            onerror: "您提供的邮箱已存在",
            onwait: "正在对邮箱进行合法性校验，请稍候..."
        });

         //         $("#ctl00_mainContent_email").formValidator({ onshow: "请输入邮箱", onfocus: "邮箱6-100个字符,输入正确了才能离开焦点", oncorrect: "恭喜你,你输对了", defaultvalue: "@", forcevalid: false })
         //         .inputValidator({ min: 6, max: 100, onerror: "你输入的邮箱长度非法,请确认" })
         //         .regexValidator({ regexp: "^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$", onerror: "你输入的邮箱格式不正确" });



         $("#ctl00_mainContent_password").formValidator({ onshow: "请输入密码", onfocus: "密码不能为空", oncorrect: "密码合法" })
	.inputValidator({ min: 6, max: 16, empty: { leftempty: false, rightempty: false, emptyerror: "密码两边不能有空符号" }, onerror: "密码长度为6-16位,请重试" });

         $("#ctl00_mainContent_password_confirm").formValidator({ onshow: "请输入重复密码", onfocus: "两次密码必须一致", oncorrect: "密码一致" })
	.inputValidator({ min: 1, empty: { leftempty: false, rightempty: false, emptyerror: "重复密码两边不能有空符号" }, onerror: "重复密码不能为空,请重试" })
	.compareValidator({ desid: "ctl00_mainContent_password", operateor: "=", onerror: "两次密码不一致,请重试" });

         $("#agree").formValidator({ onshow: "请同意该协议", onfocus: "请同意该协议", oncorrect: "同意了该协议" })
    .inputValidator({ min: 1, onerror: "请同意该协议" });

         $("#ctl00_mainContent_captcha1").formValidator({ onshow: "请输入验证码", onfocus: "点击图片可更换", oncorrect: "验证码正确" })

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
            error: function() { alert("服务器没有返回数据，可能服务器忙，请重试"); },
            onerror: "你输入的验证码错误,请重试",
            onwait: "正在对验证码进行合法性校验，请稍候..."
        });
     });
</script> 


</asp:Content>
