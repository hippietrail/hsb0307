//---------index page javascript start---------
function setHomepage()
{
	if (document.all)
    {
       document.body.style.behavior='url(#default#homepage)';
       document.body.setHomePage('http://www.dbank.com');
    }
	else if (window.sidebar)
	{
		if(window.netscape)
		{
			try
			{ 
				netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); 
				var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components. interfaces.nsIPrefBranch);
				prefs.setCharPref('browser.startup.homepage','http://www.dbank.com');
			}
			catch (e) 
			{ 
				alert( "该操作被浏览器拒绝，如果想启用该功能，请在地址栏内输入 about:config,然后将项signed.applets.codebase_principal_support 值该为true" );
			}
		}
	}
}

function getRandomStr(){
	return parseInt(Math.random()*1000);
}

function submitLogin() {
	if(!hitEmail() || !hitPassword()){
		return false;
	}
	return true;
}

function hitEmail() {
	var emailFoucs = document.getElementById("email");
	var email = emailFoucs.value;
	document.getElementById('validateid').innerHTML = '';
    if(!email)  
    {
    	document.getElementById("emailTip").innerHTML="Email不能为空";
		return false;
    }else if (email=="请输入您的帐号") {
		document.getElementById("emailTip").innerHTML="Email不能为空";
		return false;
	}else if (email.length > 1) {
		if (!isEmail(email)) {
			document.getElementById("emailTip").innerHTML="邮箱格式不正确";
			return false;
		}
	}else {
		document.getElementById("emailTip").innerHTML="Email不能为空";
		return false;
	}
	return true;
}

function hitPassword() {
	var passwordFoucs = document.getElementById("password");
	var password = passwordFoucs.value;
    if(password.length < 6)  
    {
    	document.getElementById("passwordTip").innerHTML="密码长度6-32位";
		return false;
    }
	return true;
}

function isEmail(s) 
{
	if (s.length > 100||s.length==0)	return false;
	if (s.indexOf("'")!=-1 || s.indexOf("/")!=-1 || s.indexOf("\\")!=-1 || s.indexOf("<")!=-1 || s.indexOf(">")!=-1) 
    return false;
    if (s.indexOf(" ")>-1 || s.indexOf("　")>-1)
    {
        return false;
    }
	var regu="^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[_.0-9a-zA-Z]+))@{1}(([a-zA-Z0-9-]+[.]{1})([a-zA-Z0-9-]+))+$";
	var re = new RegExp(regu);
	s = s.replace("；", ";");   
    s = s.replace("<", "");
    s = s.replace(">", "");
    s = s.replace('(', '');
    s = s.replace(')', '');
    s = s.replace('（', '');
    s = s.replace('）', '');
	var mail_array = s.split(";");
    var part_num = 0;
    var isemail=true;
    while (part_num < mail_array.length)
	{
		if (mail_array[part_num].search(re) == -1)
		{	isemail=false;}
		 part_num += 1;
	}
	return isemail;
}

function emailFocus() {
    var dEmail = document.getElementById('email');
    if (dEmail) {dEmail.focus();}
}
// ---------index page javascript end---------

// ---------email_active page javascript start---------
// 判断当前邮箱是否qq邮箱
function isQQEmail()
{
	return jQuery("#email").val().indexOf("qq.com")>0?true:false;
}

// 更新qq验证码
function changeQQimage()
{
	jQuery("#active_qq_image").attr("src",jDbank.data.getGlobal("systemContextPath()")+"/images/gif.gif");
	jQuery("#active_qq_image").attr("src",jDbank.data.getGlobal("systemContextPath()")+"/CaptchaQQ.jpg?a="+getRandomStr());
}

// 快速激活
function loginForRegist()
{
	if(jQuery("#login_email_active").val()!=""&&jQuery("#login_password_active").val()!="")
	{
		if(jQuery("#login_email_active").val().indexOf("qq.com")>0)
		{
			if(jQuery("#login_verifycode_active").val()=="")
			{
				jQuery("#popMessage").html("请输入验证码！");
				return ; 
			}
		}
		//object.disabled ='disabled';
		var loadingHtml="<img src='"+jDbank.data.getGlobal("systemContextPath()")+"/images/loading.gif' alt='loading' name='loading'/> 验证中，请稍候...";
		jQuery("#popMessage").html(loadingHtml);
		var url = jDbank.data.getGlobal("systemContextPath()")+"/ajax_user/quickRegister.action?a="+Math.random();
		var data = "userModel.email="+jQuery("#login_email_active").val()+"&userModel.emailPassword="+jQuery("#login_password_active").val()+"&userModel.vercode="+jQuery("#login_verifycode_active").val();
		// 增加注册用户信息
		data+="&userModel.password="+jQuery("#password").val();
		data+="&userModel.username="+jQuery("#username").val();
		data+="&userModel.sex="+jQuery("#sex").val();
		data+="&userModel.lastip="+jQuery("#lastip").val();
		data+="&userModel.regip="+jQuery("#regip").val();
		data+="&userModel.inviter="+jQuery("#inviter").val();
		data+="&userModel.regfrom="+jQuery("#regfrom").val();

		jQuery.ajax(
   		{
   			type: "POST",
   		  	url: url,
   		 	cache:false,
   		 	async:true,
   		 	data:data,  
   		  	dataType: "json",
   		 	error:function (XMLHttpRequest, textStatus, errorThrown) {
   		 		//object.disabled ='';
   		 		jQuery("#popMessage").html("");
   		 		changeQQimage();
   			},
   			success:function(data)
   			{
   	   			// 1.发生程序异常（如保存用户，不符合逻辑等）
   	   			if(data.isError){
   	   				jQuery("#popMessage").html(data.errorMsg);
   	   				if(isQQEmail()){
    	   			  changeQQimage();
    	  	   		}
    	  	   		//object.disabled ='';
   	   				return ;
   	   	   		}
   	   	   		
   	   	   		// 2.登录失败
   	   			if(data.regResult == -1)
   	   			{
   	   	   			if(jQuery("#login_email_active").val().indexOf("qq.com")>0)
   	   	   			{
   	   	   				jQuery("#popMessage").html("邮箱密码或验证码错误！");
   	   	   			}else
   	   	   			{
   	   	   				jQuery("#popMessage").html("邮箱密码错误！");
   	   	   			}
	   	   	   		jQuery("#login_password_active").val("");
	   	   	 		jQuery("#login_verifycode_active").val(""); 
	   	   	 		if(isQQEmail()){
	  	   			  changeQQimage();
	  	  	   		}
   	   			}
   	   			// 3.激活成功
   	   			else if(data.regResult == 0){
   	   				jQuery("#popMessage").html("");
   	   				//jDbank.ui.showMsg("恭喜您成功注册DBank！系统正在转向主界面，请等待...",false,12);
  	   				closeFramelogin();
  	   			    window.location.href = jDbank.data.getGlobal("systemContextPath()")+"/user/registerSuccess.action";  
   	   			}
   	   			// 4.用户已经激活
   	   			else if(data.regResult == 1){
   	   				jQuery("#popMessage").html("");
  	   				closeFramelogin();
  	   			    window.location.href = jDbank.data.getGlobal("systemContextPath()")+"/user/registerSuccess.action";  
	   	   		}
   	   			//5.默认提示
   	   			else{
   	   	   			jDbank.ui.showMsg("帐号激活失败");
   	    	   	}
   	   			
   	   			//object.disabled ='';
  	   			//jQuery("#popMessage").html("");
   			}
   		}
        );        	
	}else
	{
		jQuery("#popMessage").html("请输入邮箱密码！");
    	return ;
	}
}

// 打开快速激活窗口
function openFramelogin()
{
	// 1. 假如是qq邮箱，先获取校验图片
	if(isQQEmail())
	{
		changeQQimage();
	}
	// 2.清除提示信息
	jQuery("#popMessage").html("");
	// 3.设置激活栏email
	jQuery("#login_email_active").val(jQuery('#email').val());
	
	jDbank.ui.disable();
    jQuery("#activepop").css("display","block");
    jQuery("#login_password_active").val("");
    var url = jDbank.data.getGlobal("systemContextPath()")+"/ajax_user/quickWindowOper.action";
    var data = "userModel.email="+jQuery('#email').val()+"&userModel.operation=open&a="+getRandomStr();
    $.ajax(
	{
		type: "POST",
	  	url: url,
	 	data:data,
	 	success: function(data){
			// jDbank.ui.release();
		}
	}
	);
}

// 关闭快速激活窗口
function closeFramelogin()
{
	jQuery('#activepop').attr('style','display:none');
	var url = jDbank.data.getGlobal("systemContextPath()")+"/ajax_user/quickWindowOper.action";
	var data = "userModel.email=" + jQuery('#email').val() + "&userModel.operation=close&a=" + getRandomStr();
		$.ajax( {
			type :"POST",
			url :url,
			data :data
		});
	jDbank.ui.release();
}

// 发送激活邮件
function sendRegisterEmail(){
	jDbank.ui.showMsg("正在向指定邮箱发送验证邮件，请稍候...",false,12);
	var userInfoForm=jQuery('#userInfoForm');
	userInfoForm.submit();
}

var bResend = 0,counter=0;
//重发激活邮件
function reSendRegisterEmail(email){
	if(counter>=3){jDbank.ui.showMsg("您的验证邮件发送次数已到最大次数：3次",true);return;}
	   counter ++;
	jDbank.ui.disable();
	var url = jDbank.data.getGlobal("systemContextPath()")+"/ReSendEmail.do?unactiveemail="+email+"&time="+getRandomStr();
	jDbank.ui.showMsg("请求发送中，请等待片刻...",false,12);
	jDbank.get(url, function(data) {
		if (data == 'success'){
    		jDbank.ui.showMsg("验证邮件重发成功");
        }else{
    		jDbank.ui.showMsg("验证邮件重发失败", true);
        }
		jDbank.ui.release();
	},'txt');
}

//上一步
function backBtnClick(){
	var userInfoForm=jQuery('#userInfoForm');
	userInfoForm.attr("action",jDbank.data.getGlobal("systemContextPath()") + '/user/rollback.action');
	userInfoForm.submit();
}
// ---------email_active page javascript end---------

//---------register page javascript start---------
//下一步
function nextBtnClick(){
	var userInfoForm=jQuery('#userInfoForm');
	userInfoForm.submit();
}
//---------register page javascript end---------

//---------send_email_success page javascript start---------
//---------send_email_success page javascript end---------

//---------register_success page javascript start---------
//---------register_success page javascript end---------
