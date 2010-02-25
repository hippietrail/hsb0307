/**
 * 用户验证
 * 
 * @author shankangjie
 * @version 1.0
 * 
 */

function reloadcaptcha(src)
{
    var imgcode = jQuery("#captchaimg")[0];
    //加载qq验证码时间很慢，可先显示一个加载图标
    imgcode.src= jDbank.data.getGlobal("systemContextPath()")+"/images/gif.gif";;
    imgcode.src = src + "?a=" + Math.random();
    
} 

function checkForm()
{
	jQuery('#regsubmit').attr("disabled",true);
	
	if (/www\./ig.test(document.getElementById('regemail').value)) {
		var dTip = document.getElementById('regemailTip');
		dTip.innerHTML = '邮箱格式不正确';
		dTip.style.display = '';
		return false;
	}
	
    if(!jQuery.formValidator.PageIsValid('1')){
    	jQuery('#regsubmit').attr("disabled",false);
        return false;
    }
	if(jQuery("#s1").attr("checked")!=true){
		jQuery('#regsubmit').attr("disabled",false);
	    alert("请选择是否同意服务条款");
        return false;
    	
    }
	
	/*if(jQuery("#emailDiv").html()!=""){
		alert(jQuery("#emailDiv").html());
		return false;
	}*/
			
	return true;
}

validate = {};
validate.init = function(config){
	jQuery.formValidator.initConfig( {
		validatorGroup:config.groupid,
        onError : function(msg,obj)
        {
            //alert(obj[0].id+msg);
        },
        errorCallback:config.errorcallback,
        okCallback:config.okcallback
        
    });
}



validate.nickname = function(config){
	var targetname = config.target;
	var ajaxurl = config.ajaxurl;
	var submitbtn = config.button;
	jQuery("#"+targetname).formValidator( {
		validatorGroup:config.groupid,
        onshow :"",
        onfocus :"",
        oncorrect :""
    }).InputValidator( {
        min :1,
        max :32,
        onerror :"用户昵称1-32位"
        //onerrormax :"昵称不可大于32位"
    }).RegexValidator( {
        regexp :regexEnum.nickname,
        onerror :"只允许中英文数字._-"
    });
}


jQuery(document).ready( function()
{
	validate.init({
		groupid:"1",
		errorcallback:function(input){
        	/*if(input!="captcha"){
        		jQuery("#"+input).attr("class","inputext redline");
        	}else{
        		jQuery("#"+input).attr("class","inputextmin redline");
        	}*/
        	
        	jQuery("#validateid").hide();
        	jQuery("#delever").hide();
        },
        okcallback:function(input){
        	/*if(input!="captcha"){
        		jQuery("#"+input).attr("class","inputext");
        	}else{
        		jQuery("#"+input).attr("class","inputextmin");
        	}*/
        	jQuery("#validateid").hide();
        	jQuery("#delever").hide();
        }
	});
	
	validate.init({
		groupid:"3",
		errorcallback:function(input){},
        okcallback:function(input){}
	});
	
    validate.init({
		groupid:"2",
		errorcallback:function(input){
        	//jQuery("#"+input).attr("class","inputext redline");
        },
        okcallback:function(input){
        	//jQuery("#"+input).attr("class","inputext");
        }
	});
    


	jQuery("#email").formValidator( {
        onshow :"",
        onfocus :"",
        oncorrect :""
    }).InputValidator( {
        min :1,
        max :256,
        onerror :"Email不能为空"
    }).RegexValidator( {
        regexp :regexEnum.email,
        onerror :"邮箱格式不正确"
    });
    
    jQuery("#regemail").formValidator( {
        onshow :"",
        onfocus :"",
        oncorrect :""
    }).InputValidator( {
        min :1,
        max :256,
        onerror :"Email不能为空"
    }).RegexValidator( {
        regexp :regexEnum.email,
        onerror :"邮箱格式不正确"
    }).AjaxValidator({
    	url:jQuery("#ajaxurl").html(),
    	success:function(data){
    		return !data;
    	},
    	onerror:"Email已注册",
    	onwait:"loading...",
    	buttons:jQuery("#regsubmit")//提交按钮,ajax请求完成前提交按钮不可用
    });

    
    validate.nickname({
    	groupid:"1",
		target:"nickname",
		ajaxurl:jQuery("#ajaxurl").html(),
		button:jQuery("#regsubmit")
	});
    
    jQuery("#oldpassword").formValidator( {
        onshow :"",
        onfocus :"",
        oncorrect :""
    }).InputValidator( {
        min :6,
        max:32,
        onerror :"密码长度6-32位"
    }).RegexValidator( {
        regexp :regexEnum.password,
        onerror :"密码不符合验证规则"
    });
    
    jQuery("#password").formValidator( {
        onshow :"",
        onfocus :"",
        oncorrect :""
    }).InputValidator( {
        min :6,
        max:32,
        onerror :"密码长度6-32位"
    }).RegexValidator( {
        regexp :regexEnum.password,
        onerror :"密码不符合验证规则"
    });
    
    

    jQuery("#password2").formValidator( {
        onshow :"",
        onfocus :"",
        oncorrect :""
    }).InputValidator( {
        min :6,
        max:32,
        onerror :"密码长度6-32位"
    }).CompareValidator( {
        desID :"password",
        operateor :"=",
        onerror :"新密码不一致"
    });

    jQuery("#captcha").formValidator( {
        onshow :"",
        onfocus :"",
        oncorrect :""
    }).InputValidator( {
        min :4,
        max:4,
        onerror :"长度为4位"
    }).RegexValidator({
    	regexp :regexEnum.captcha,
        onerror :"字母和数字"
    });
});

function initSettingUserValidateJs(){
	  validate.nickname({
	    	groupid:"2",
			target:"confignickname",
			ajaxurl:jQuery("#ajaxurl").html(),
			button:jQuery("#configsubmit")
		});
	    
	    jQuery("#settingoldpassword").formValidator( {
	    	validatorGroup:"3",
	        onshow :"",
	        onfocus :"",
	        oncorrect :""
	    }).InputValidator( {
	        min :6,
	        max:32,
	        onerror :"密码长度6-32位"
	    }).RegexValidator( {
	        regexp :regexEnum.password,
	        onerror :"密码不符合验证规则"
	    });
	    
	    jQuery("#settingpassword").formValidator( {
	    	validatorGroup:"3",
	        onshow :"",
	        onfocus :"",
	        oncorrect :""
	    }).InputValidator( {
	        min :6,
	        max:32,
	        onerror :"密码长度6-32位"
	    }).RegexValidator( {
	        regexp :regexEnum.password,
	        onerror :"密码不符合验证规则"
	    });
	    
	    

	    jQuery("#settingpassword2").formValidator( {
	    	validatorGroup:"3",
	        onshow :"",
	        onfocus :"",
	        oncorrect :""
	    }).InputValidator( {
	        min :6,
	        max:32,
	        onerror :"密码长度6-32位"
	    }).CompareValidator( {
	        desID :"settingpassword",
	        operateor :"=",
	        onerror :"新密码不一致"
	    });
}

