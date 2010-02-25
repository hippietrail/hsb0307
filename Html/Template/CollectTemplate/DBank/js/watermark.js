//水印文本框效果
$(document).ready(function() {
	 //循环所有input focusEnable
	 $('input.focusEnable').each(function () {
		  $(this).addClass("idleField");

	      //1.注册焦点事件
		  $(this).focus(function() {
		       $(this).removeClass("idleField").addClass("focusField");
		       if ($(this).val() == $(this).attr("default_value")){ 
		       	$(this).val("");
		       }else{
		           this.select();
		       }
		     });
		  $(this).blur(function() {
		         if ($.trim($(this).val()) == ""){
		         	$(this).val(($(this).attr("default_value") ? $(this).attr("default_value") : ""));
		         	$(this).removeClass("focusField").addClass("idleField");
		         }else{
		        	$(this).addClass("focusField");
		         }
		     });

		  //2.设置初始值
		    if ($.trim($(this).val()) == ""){
		         $(this).val(($(this).attr("default_value") ? $(this).attr("default_value") : ""));
		    }else{
		    	$(this).removeClass("idleField").addClass("focusField");
		    }
      });
});