/*
 * member 2010-5-4
 */
$(function(){$('.checkall').click(function(){var _self=this;$('.checkitem').each(function(){if(!this.disabled)
{$(this).attr('checked',_self.checked);}});$('.checkall').attr('checked',this.checked);});$('a[ectype="batchbutton"]').click(function(){if($('.checkitem:checked').length==0){return false;}
if($(this).attr('presubmit')){if(!eval($(this).attr('presubmit'))){return false;}}
var items='';$('.checkitem:checked').each(function(){items+=this.value+',';});items=items.substr(0,(items.length-1));var uri=$(this).attr('uri');window.location=uri+'&'+$(this).attr('name')+'='+items;return false;});$('.makesmall').each(function(){makesmall(this,$(this).attr('max_width'),$(this).attr('max_height'));});$('.su_btn').click(function(){if($(this).hasClass('close')){$(this).parent().next('.su_block').css('display','');$(this).removeClass('close');}
else{$(this).addClass('close');$(this).parent().next('.su_block').css('display','none');}});$('*[ectype="dialog"]').click(function(){var id=$(this).attr('dialog_id');var title=$(this).attr('dialog_title')?$(this).attr('dialog_title'):'';var url=$(this).attr('uri');var width=$(this).attr('dialog_width');ajax_form(id,title,url,width);return false;});$('*[ectype="gselector"]').focus(function(){var id=$(this).attr('gs_id');var name=$(this).attr('gs_name');var callback=$(this).attr('gs_callback');var type=$(this).attr('gs_type');var store_id=$(this).attr('gs_store_id');var title=$(this).attr('gs_title')?$(this).attr('title'):'';var width=$(this).attr('gs_width');ajax_form(id,title,SITE_URL+'/index.php?app=gselector&act='+type+'&dialog=1&title='+title+'&store_id='+store_id+'&id='+id+'&name='+name+'&callback='+callback,width);return false;});var url=window.location.search;var params=url.substr(1).split('&');var app='';var sort='';var order='';for(var j=0;j<params.length;j++)
{var param=params[j];var arr=param.split('=');if(arr[0]=='app')
{app=arr[1];}
if(arr[0]=='sort')
{sort=arr[1];}
if(arr[0]=='order')
{order=arr[1];}}
$('span[ectype="order_by"]').each(function(){if($(this).parent().attr('column')==sort)
{if(order=='asc')
{$(this).removeClass();$(this).addClass("sort_asc");}
else if(order=='desc')
{$(this).removeClass();$(this).addClass("sort_desc");}}});$('span[ectype="order_by"]').click(function(){var s_name=$(this).parent().attr('column');var found=false;for(var i=0;i<params.length;i++)
{var param=params[i];var arr=param.split('=');if('page'==arr[0])
{params[i]='page=1';}
else if('sort'==arr[0])
{params[i]='sort'+'='+s_name;found=true;}
else if('order'==arr[0])
{params[i]='order'+'='+(arr[1]=='asc'?'desc':'asc');}}
if(!found)
{params.push('sort'+'='+s_name);params.push('order=asc');}
if(location.pathname.indexOf('/admin/')>-1)
{location.assign(SITE_URL+'/admin/index.php?'+params.join('&'));return;}
location.assign(SITE_URL+'/index.php?'+params.join('&'));});trigger_uploader();});function set_zindex(parents,index){$.each(parents,function(i,n){if($(n).css('position')=='relative'){$(n).css('z-index',index);}});}
function js_success(dialog_id)
{DialogManager.close(dialog_id);var url=window.location.href;url=url.indexOf('#')>0?url.replace(/#/g,''):url;window.location.replace(url);}
function js_fail(str)
{$('#warning').html('<label class="error">'+str+'</label>');$('#warning').show();}
function check_number(v)
{if(isNaN(v))
{alert(lang.only_number);return false;}
if(v.indexOf('-')>-1)
{alert(lang.only_number);return false;}
return true;}
function check_required(v)
{if(v=='')
{alert(lang.not_empty);return false;}
return true;}
function check_pint(v)
{var regu=/^[0-9]{1,}$/;if(!regu.test(v))
{alert(lang.only_int);return false;}
return true;}
function check_max(v)
{var regu=/^[0-9]{1,}$/;if(!regu.test(v))
{alert(lang.only_int);return false;}
var max=255;if(parseInt(v)>parseInt(max))
{alert(lang.small+max);return false;}
return true;}
function order_action_result(action,order_id,rzt)
{if(rzt.done===false)
{alert(rzt.msg);return;}
else
{DialogManager.close(action);for(k in rzt.retval)
{switch(k)
{case'actions':$('#order'+order_id+'_action').children().hide();for(_j in rzt.retval[k])
{$('#order'+order_id+'_action_'+rzt.retval[k][_j]).show();}
break;default:var _tmp=$('#order'+order_id+'_'+k);_tmp.html(rzt.retval[k]);break;}}
$.get('index.php?app=sendmail');alert(rzt.msg);}}
function insert_editor(file_name,path)
{tinyMCE.execCommand('mceInsertContent',false,'<img src="'+SITE_URL+'/'+path+'" alt="'+file_name+'">');}
function trigger_uploader(){$('#open_uploader').unbind('click');$('#open_uploader').click(function(){if($('#uploader').css('display')=='none'){$('#uploader').show();$(this).find('.hide').attr('class','show');}else{$('#uploader').hide();$(this).find('.show').attr('class','hide');}});$('#open_editor_uploader').unbind('click');$('#open_editor_uploader').click(function(){if($('#editor_uploader').css('display')=='none'){$('#editor_uploader').show();}else{$('#editor_uploader').hide();}});$('#open_remote').unbind('click');$('#open_remote').click(function(){if($('#remote').css('display')=='none'){$('#remote').show();}else{$('#remote').hide();}});$('#open_editor_remote').unbind('click');$('#open_editor_remote').click(function(){if($('#editor_remote').css('display')=='none'){$('#editor_remote').show();}else{$('#editor_remote').hide();}});$('*[ecm_title]').hover(function(){$('*[ectype="explain_layer"]').remove();$(this).parent().parent().append('<div class="titles" ectype="explain_layer" style="display:none; z-index:999">'+$(this).attr('ecm_title')+'<div class="line"></div></div>');$('*[ectype="explain_layer"]').fadeIn();},function(){$('*[ectype="explain_layer"]').fadeOut();});var handle_pic,handler,drop,cover,insert;$('*[ectype="handle_pic"]').find('img:first').hover(function(){$('*[ectype="explain_layer"]').remove();handle_pic=$(this).parents('*[ectype="handle_pic"]');handler=handle_pic.find('*[ectype="handler"]');var parents=handler.parents();handler.show();handler.hover(function(){$(this).show();set_zindex(parents,"999");},function(){$(this).hide();set_zindex(parents,"0");});set_zindex(parents,'999');cover=handler.find('*[ectype="set_cover"]');cover.unbind('click');cover.click(function(){set_cover(handle_pic.attr("file_id"));});drop=handler.find('*[ectype="drop_image"]');drop.unbind('click');drop.click(function(){drop_image(handle_pic.attr("file_id"));});insert=handler.find('*[ectype="insert_editor"]');insert.unbind('click');insert.click(function(){insert_editor(handle_pic.attr("file_name"),handle_pic.attr("file_path"));return false;});},function(){handler.hide();var parents=handler.parents();set_zindex(parents,'0');});}
function del_favorite(obj){if(confirm("您确定要删除吗"))
{location.href="index.php?app=my_favorite&act=del_book_favorites&f_id="+obj;}}


/*
 * ecmall.js
 */
jQuery.extend({getCookie:function(sName){var aCookie=document.cookie.split("; ");for(var i=0;i<aCookie.length;i++){var aCrumb=aCookie[i].split("=");if(sName==aCrumb[0])return decodeURIComponent(aCrumb[1]);}
return'';},setCookie:function(sName,sValue,sExpires){var sCookie=sName+"="+encodeURIComponent(sValue);if(sExpires!=null)sCookie+="; expires="+sExpires;document.cookie=sCookie;},removeCookie:function(sName){document.cookie=sName+"=; expires=Fri, 31 Dec 1999 23:59:59 GMT;";}});function drop_confirm(msg,url){if(confirm(msg)){window.location=url;}}
function ajax_form(id,title,url,width)
{if(!width)
{width=400;}
var d=DialogManager.create(id);d.setTitle(title);d.setContents('ajax',url);d.setWidth(width);d.show('center');return d;}
function go(url){window.location=url;}
function change_captcha(jqObj) { jqObj.attr('src', 'CommonServices/CaptchaHandler.ashx?app=captcha&' + Math.round(Math.random() * 10000)); }
function price_format(price){if(typeof(PRICE_FORMAT)=='undefined'){PRICE_FORMAT='&yen;%s';}
price=number_format(price,2);return PRICE_FORMAT.replace('%s',price);}
function number_format(num,ext){if(ext<0){return num;}
num=Number(num);if(isNaN(num)){num=0;}
var _str=num.toString();var _arr=_str.split('.');var _int=_arr[0];var _flt=_arr[1];if(_str.indexOf('.')==-1){if(ext==0){return _str;}
var _tmp='';for(var i=0;i<ext;i++){_tmp+='0';}
_str=_str+'.'+_tmp;}else{if(_flt.length==ext){return _str;}
if(_flt.length>ext){_str=_str.substr(0,_str.length-(_flt.length-ext));if(ext==0){_str=_int;}}else{for(var i=0;i<ext-_flt.length;i++){_str+='0';}}}
return _str;}
function collect_goods(id)
{var url=SITE_URL+'/index.php?app=my_favorite&act=add&type=goods&ajax=1';$.getJSON(url,{'item_id':id},function(data){alert(data.msg);});}
function collect_store(id)
{var url=SITE_URL+'/index.php?app=my_favorite&act=add&type=store&jsoncallback=?&ajax=1';$.getJSON(url,{'item_id':id},function(data){alert(data.msg);});}
function getFullPath(obj)
{if(obj)
{if(window.navigator.userAgent.indexOf("MSIE")>=1)
{obj.select();return document.selection.createRange().text;}
else if(window.navigator.userAgent.indexOf("Firefox")>=1)
{if(obj.files)
{return obj.files.item(0).getAsDataURL();}
return obj.value;}
return obj.value;}}
function sendmail(req_url)
{$(function(){var _script=document.createElement('script');_script.type='text/javascript';_script.src=req_url;document.getElementsByTagName('head')[0].appendChild(_script);});}
 