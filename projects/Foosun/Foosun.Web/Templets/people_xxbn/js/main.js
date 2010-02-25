
function go() {
 
        var today = new Date();
        var bday = new Date(2006,04, 27);
 
        tf=document.dateform;
        vd=tf.sday.options[tf.sday.selectedIndex].value;
        vm=tf.smonth.options[tf.smonth.selectedIndex].value;
vy=tf.syear.options[tf.syear.selectedIndex].value;
        var aday = new Date(vy ,vm-1, vd);
		if((vy>2004)){ document.location="http://news.people.com.cn/GB/28053/review/"+vy+vm+vd+".html";}
 else if ((vd<27)&&(vm<04)&&(vy=2004))
 { window.alert("回顾请从2004年04月27日开始");}
 else    {
        document.location="http://news.people.com.cn/GB/28053/review/"+vy+vm+vd+".html";}
}
function resetselect () {
	var mydate = new Date();
    var myyear = mydate.getFullYear();
    var mymonth = mydate.getMonth()+1;
	var mytoday = mydate.getDate();
	if(new String(mymonth).length==1)mymonth="0"+new String(mymonth);
	if(new String(mytoday).length==1)mytoday="0"+new String(mytoday);
	document.dateform.syear.value=myyear;
    document.dateform.smonth.value=mymonth;
    document.dateform.sday.value=mytoday;
}
//Cookie日期修正函数 function FixCookieDate(date)
function FixCookieDate(date){
	var base = new Date(0);
	var skew = base.getTime();
	if (skew > 0)date.setTime(date.getTime() - skew);
}
 
//设置Cookie函数 function SetCookie(name,value,expires,path,domain,secure)
function SetCookie(name,value,expires,path,domain,secure){
	document.cookie = name + "=" + escape(value) + ((expires)? "; expires=" + expires.toGMTString() : "") + ((path) ? "; path=" + path : "") + ((domain) ? "; domain=" + domain : "") + ((secure) ? "; secure" : "");
}
	//设置Cookie相应名值对中值的函数 function getCookieVal(offset)
	function getCookieVal(offset) {
		var endstr = document.cookie.indexOf(";",offset);
		if (endstr == -1) endstr = document.cookie.length;
		return unescape(document.cookie.substring(offset,endstr));
	}
 
	//设置Cookie函数 function GetCookie(name)
	function GetCookie(name){
		var arg = name + '=';
		var alen = arg.length;
		var clen = document.cookie.length;
		var i = 0;
		var flag = ''
		while (i<clen) {
			var j = i + alen;
			if (document.cookie.substring(i,j) == arg) flag = getCookieVal(j);
			i = document.cookie.indexOf(" ",i) + 1;
			if (i == 0) break;
		}
		return flag;
	}
function myCustomize(city)
{
	if(city == "#")
	{
		alert("请选择城市");
		return false;
	}
 
	var expdate = new Date();
		FixCookieDate(expdate);//修正MAC机器的BUG
		expdate.setTime(expdate.getTime() + (1000*60*60*24*365));//设置Cookie的有效期为1年
//	SetCookie('PEOPLE_CUSTOMIZE_city',city,expdate,'/');
    SetCookie('PEOPLE_CUSTOMIZE_city',city,expdate,'/','people.com.cn');
 
	document.getElementById("weathercustomize").src="http://weather.people.com.cn/customize/jump2009.html";
 
	//location.reload();
	}
    function isArabicNumerals(el) {
        if (el.style.backgroundPosition == '0px 15px') {
            el.style.backgroundPosition = '0px 30px';
            IME.arabicNumerals = false;
        }
        else {
            el.style.backgroundPosition = '0px 15px';
            IME.arabicNumerals = true;
        }
    }

    function isNewDai(el) {
        if (el.style.backgroundPosition == '0px 45px') {
            el.style.backgroundPosition = '0px 60px';
            CodeList = CodeListNew;
            CodeList = CodeList.split(',');
        }
        else {
            el.style.backgroundPosition = '0px 45px';
            CodeList = CodeListOld;
            CodeList = CodeList.split(',');
        }
    }

    jQuery(document).ready(function() {
        jQuery(document).click(function() { 
            jQuery("#ime").css("display", "none"); 
            jQuery("#imeFrame").css("display", "none"); 
        });
        jQuery.each(jQuery("input[type=text]", jQuery("#searchRegion")), function() {
            jQuery(this).css("font-family", "HGTAIWH");
            jQuery(this).css("font-size", "12pt");
            jQuery(this).keydown(function() {
                var e = window.event || e;
                var srcElement = e.srcElement || e.target;
                e.element = srcElement;

                if (e.keyCode == 8) {
                    this.focus();
                }
                var obj = ImeKeyDown(e);

                jQuery("#inputChar").html(IME.Comp.value);
                jQuery("#candicated").html(IME.Cand.value);

                if (IME.Cand.value.length == 0 && IME.Comp.value.length == 0) {
                    jQuery("#ime").css("display", "none");
                    jQuery("#imeFrame").css("display", "none");
                    IME.arabicNumerals = true;
                }
                this.value = IME.InputArea.value; //IME.InputArea.value;

                return obj;
            }).keypress(function() {
                var obj = ImeKeyPress(event);

                jQuery("#inputChar").html(IME.Comp.value);
                jQuery("#candicated").html(IME.Cand.value);

                if (IME.Cand.value.length > 0) {
                    jQuery("#ime").css("display", "block");
                    jQuery("#ime").css("top", (jQuery(this).offset().top + 20) + "px");
                    jQuery("#ime").css("left", jQuery(this).offset().left);
                    
                    var imePosition = jQuery("#ime").position();
                    jQuery("#imeFrame").css("top", imePosition.top);
                    jQuery("#imeFrame").css("left", imePosition.left);
                    jQuery("#imeFrame").css("height", jQuery("#ime").height());
                    jQuery("#imeFrame").css("width", jQuery("#ime").width());

                    appendTrace(IME.Cand.value.length);
                    appendTrace(jQuery("#candicated").height() + " w:" + jQuery("#candicated").width());

                    if (IME.Cand.value.length > 55) {
                        jQuery("#draggable").css("height", "96px");
                    }
                    else {
                        jQuery("#draggable").css("height", "70px");
                    }
                    IME.arabicNumerals = false;
                }
                else {
                    if (IME.Cand.value.length == 0 && IME.Comp.value.length == 0) {
                        jQuery("#ime").css("display", "none");
                        
                        jQuery("#imeFrame").css("display", "none");
                        
                        IME.arabicNumerals = true;
                    }
                }

                return obj;
            }).keyup(function() {
                var obj = ImeKeyUp(event);
                return obj;
            }).blur(function() {
                IME.InputArea.value = "";
                IME.Comp.value = "";
                IME.Cand.value = "";

                jQuery("#inputChar").html("");
                jQuery("#candicated").html("");
            }).focus(function() {
                IME.InputArea.value = this.value;
            });
        });
    });
	
	