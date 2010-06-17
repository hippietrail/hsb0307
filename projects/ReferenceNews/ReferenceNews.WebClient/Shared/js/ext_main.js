try{
$(function(){
    var navs = $("#nav a");
    var cur_nav = $("#nav a.link").get(0);
    navs.mouseover(function(){
        var _self = this;
        navs.each(function(i){
            $(this).attr('class', this == _self ? 'link' : 'hover');
        });
    });
    navs.mouseout(function(){
        navs.each(function(i){
            $(this).attr('class', this == cur_nav ? 'link' : 'hover');
        });
    });
})
}catch(e){
}

try{
$(function()
{
    $(".select_js ul li").hover(
        function()
        {
            $(this).addClass('search_nonce');
        },
        function()
        {
            $(this).removeClass();
        }
    );

    $(".select_js").click(block_fn);

    $(".select_js ul li").click(function(){
        var text = $(this).text();
        $(".select_js p").text(text);

        var act  = $(this).attr("ectype");
        $(".select_js input").val(act);
    });

    $('body').click(mouseLocation);

});
}catch(e){

}


function block_fn()
{
    $(".select_js ul").toggle();
}

function mouseLocation(e)
{
    try{
		if (e.pageX < $('.select_js').position().left ||
			e.pageX > $('.select_js').position().left + $('.select_js').outerWidth() ||
			e.pageY < $('.select_js').position().top ||
			e.pageY > $('.select_js').position().top + $('.select_js').outerHeight())
		{
			$('.select_js ul').hide();
		}
	}catch(e){
		//
	}
}



/*===========  页框切换js   @ Chase          ===========*/
function change_tab(index_1){
	try{
		var tabs = $(this).find(".nav li");
		if(!tabs[0])	return ;

		var main_var = '';
		first_css = tabs[0].className;//first_css.split('_');  不能用分割哦。
		if(first_css.substring(0,2)=='on'){
			main_var = first_css.substring(3);
		}else{
			main_var = first_css.substring(4);
		}
		var mains = $(this).find(".main_"+main_var);
		if(!mains[0] ) 	return;

		if(index_1){ index = parseInt(index_1);  }
		else{		 index = 0; 	}

		if(index>=(tabs.length-1) ) index = tabs.length-1;

		var arr_class = new Array();

		tabs.css("cursor","pointer");
		//tabs.css("cursor","url(../dg_home/main/dg_2.cur),pointer,url(../dg_home/main/dg_2.cur),auto");
		for(var i = 0 ;i<tabs.length ; i++ ){
			tabs[i].val = i;
			//获得CSS
			var cls_name = tabs[i].className;
			if(cls_name.substring(0,2)=='on'){
				arr_class[i] = cls_name.substring(3);
			}else{
				arr_class[i] = cls_name.substring(4);
			}
			if(i==index){
				tabs[i].className = 'on_'+arr_class[i];
				mains[i].style.display = "block";
			}else{
				tabs[i].className = 'off_'+arr_class[i];
				mains[i].style.display = "none";
			}

			$(tabs[i]).mouseover( function() {
					this.style.color = "#59351E";
				  } );

			$(tabs[i]).mouseout( function() {
					 this.style.color = "#59351E";
			  } );
			$(tabs[i]).click(function() {
					for(var k=0;k<tabs.length;k++){//上框架
						tabs[k].className = 'off_'+arr_class[k];
					}
					this.className = 'on_'+arr_class[this.val];
					mains.hide();  //下框架
					mains[this.val].style.display = "block";
				} );
		}
	}catch(e){
		//
	}

}
//分页1   index_1 是切到那个页
function select_tab(index_1){
	var tabs_main = $(".ftoggle");
	for(var j = 0 ;j < tabs_main.length ;j++){
		change_tab.call(tabs_main[j],index_1);
	}
}


//鼠标移动 tab 里
var mouseover_li = false;

//页框 2
function select_tags(index){
	load_exec_js(); //user 里要用到
	popup_fiame();	// 弹出框
	
	// 切换框
	var tabs_main = $(".tagbox");
	for(var j = 0 ;j < tabs_main.length ;j++){
		change_tab2.call(tabs_main[j],index);
	}
}
/* 页框分页 2 */
function change_tab2(index_1){
	try{
		var tabs = $(this).find(".tags li");
		if(!tabs[0])	return ;

		var main_var = '';
		first_css = tabs[0].className;//first_css.split('_');  不能用分割哦。

		var mains = $(this).find(".main");
		if(!mains[0] ) 	return;

		if(index_1){ index = parseInt(index_1);  }
		else{		 index = 0; 	}

		if(index>=(tabs.length-1) ) index = tabs.length-1;

		var arr_class = new Array();

		tabs.css("cursor","pointer");

		for(var i = 0 ;i<tabs.length ; i++ ){
			if(tabs[i].lang=='true'){//默认页面
				index	= i;
			}
		}

		for(var i = 0 ;i<tabs.length ; i++ ){
			tabs[i].val = i;
			//获得CSS
			var cls_name = tabs[i].className;

			if(i==index){
				tabs[i].className = 'active';
				mains[i].style.display = "block";
			}else{
				tabs[i].className = 'normal';
				mains[i].style.display = "none";
			}
			$(tabs[i]).click(function() {
					for(var k=0;k<tabs.length;k++){//上框架
						tabs[k].className = 'normal';
					}
					this.className = 'active';
					mains.hide();  //下框架
					mains[this.val].style.display = "block";
				} );
			$(tabs[i]).mouseover(function() {
					for(var k=0;k<tabs.length;k++){//上框架
						tabs[k].className = 'normal';
					}

					// 记住 鼠标移进去 了
					if(this.lang=='remember'){
						mouseover_li = true;
					}

					this.className = 'active';
					mains.hide();  //下框架
					mains[this.val].style.display = "block";
				} );

			$(tabs[i]).mouseout(function() {//移出
					mouseover_li = false;
			} );
		}
	}catch(e){
		//
	}
}


/*===========  页框切换js   @ Chase          ===========*/
function change_tab3(index_1){
	try{

		var tabs = $("#switch_box").find(".clCell");
		
		if(!tabs[0])	return ;

		var main_var = tabs[0].lang;

		var mains = $(".main_"+main_var);
		if(!mains[0] ) 	return;

		if(index_1){ index = parseInt(index_1);  }
		else{		 index = 0; 	}

		if(index>=(tabs.length-1) ) index = tabs.length-1;

		var arr_class = new Array();

		tabs.css("cursor","pointer");
		$(this).find("#switch_box .clCell").find("label").css("cursor","pointer");
		$(this).find("#switch_box .clCell").find("input").css("cursor","pointer");
		mains.hide();
		for(var i = 0 ;i<tabs.length ; i++ ){
			tabs[i].val = i;
			//获得CSS
			var cls_name = tabs[i].className;
//			var tabs2 = $(this).find("#switch_box clCell").eq(i).find("label");
//			tabs2[0].val = i;
//			$(tabs2[0]).click(function() {
//					mains.hide();  //下框架
//
//					mains[this.val].style.display = "block";
//			} );
			if(i == index){
				mains[i].style.display = "block";
			}
			$(tabs[i]).click(function() {
					mains.hide();  //下框架
					mains[this.val].style.display = "block";
					document.getElementsByName("if_audit")[this.val].checked=true;
					//tt[0].checked = true;
				} );
		}
	}catch(e){
		//
	}

}
//分页1   index_1 是切到那个页
function select_tab3(index_1){
	var tabs_main = $(".ftoggle");
	for(var j = 0 ;j < tabs_main.length ;j++){

		change_tab3.call(tabs_main[j],index_1);
	}
}



/*===========   div_frame_box  显示框 ===========*/
function popup_fiame(){
	var popup = $(".div_frame_box");	
	for(var j = 0 ;j < popup.length ;j++){
		show_hide_popup_fiame.call(popup[j],j);
	}
}

function show_hide_popup_fiame(index){
	try{
		//$(this).css('position','relative');
		$(this).mousemove(function(){
				$(this).addClass('hover');
				$(this).find('.frame_box_change').css('visibility','visible');
		});
		$(this).mouseout(function(){
				$(this).removeClass('hover');
				$(this).find('.frame_box_change').css('visibility','hidden');
		});
		$(this).find('.cbut')[0].val	= index;
		$(this).find('.cbut').toggle(
			function (e) {
				var inn	= $(this)[0].val;
				
				dcss	= $('.div_frame_box:eq('+inn+')').find('.frame_box_change').css('display');	
				if(dcss.indexOf('none')>=0){
					$('.div_frame_box:eq('+inn+')').addClass('hover');
					$('.div_frame_box:eq('+inn+')').find('.frame_box_change').css('visibility','visible');
				}else{
					$('.div_frame_box:eq('+inn+')').removeClass('hover');
					$('.div_frame_box:eq('+inn+')').find('.frame_box_change').css('visibility','hidden');
				}
				if ( e && e.stopPropagation ) e.stopPropagation(); 
				else  window.event.cancelBubble = true;
			},
			function (e) {
			}
		);
	}catch(e){
		//
	}
}

/*===========   div_frame_box  显示框 ===========*/




function default_img(){
	//$("img").attr("onerror" , "this.src='data/system/default_goods_image.gif'");
	//$(".asdfasdfasdf").attr("onerror" , "this.src='data/system/default_goods_image.gif'");
}





/*========   排序   =========*/
function order_deac_asc(){
	var url_arr		= __url_split();

	var class_id	= $(".order_by");
	class_id.css("cursor","pointer");
	sort_v	= url_arr['sort'];
	order_v	= url_arr['order'];
	for(var i=0 ; i<class_id.length ; i++){
		var tags = '';
		var fildes	= class_id[i].lang;
		if( sort_v== fildes){
			if_select 	= true;
		}else{
			if_select 	= false;
		}

		if(if_select){
			var val 	= order_v;
			if(val == 'desc' || val == 'asc'  )		tags	= val;
			else									tags	= 'no';

		}else{
			tags		= 'no'
		}
		class_id[i].val	= tags;

		url_arr['sort']		= fildes;
		if(tags=='desc'){
			$(class_id[i]).css("background",'transparent url(templates/style/images/sort_desc.gif) no-repeat scroll right 2px');
		}else if(tags=='asc'){
			$(class_id[i]).css("background",'transparent url(templates/style/images/sort_asc.gif) no-repeat scroll right 2px');
		}
		$(class_id[i]).css("padding-right",'10px');

		if(tags == 'desc' || tags=='no'){
			url_arr['order']	= 'asc';
		}else{
			url_arr['order']	= 'desc';
		}

		class_id[i].url	=	 __url_com(url_arr);
		$(class_id[i]).click(function (){
				goto_url(this.url);
			});
	}
}

var rurl = "index.php";
/*
 * ajax 	数据
 * action  	动作
 * url_para url 转
 * data 	数据
 * divid	id
 * inittab	要不要数据在里面格试化  false 不格试化
 */
function do_action(action,url_para,data,divid,inittab,ext){
	try{
		if(url_para) 	url = rurl + '?' + url_para;
		else			url = rurl;

		data = encodeURI(data);

		var httpObject = window.ActiveXObject ? new ActiveXObject("Microsoft.XMLHTTP") : new XMLHttpRequest();
		if(httpObject){
			httpObject.onreadystatechange = function(){
				//alert(httpObject.readyState)
				if(httpObject.readyState == 4 && httpObject.status == 200){
					var rest 	= httpObject.responseText;

//return ;
					if( !(inittab =='false') ){
						
						var rest	= eval("(" + rest + ")");  // 'act'  'msg'
					}
					if(action=='approve_aend'){
						msg_time_error(divid,rest['msg']);

					}else if(action=='upload_book'){		//批量上传  书本信息
						bulk_upload_book_ret(rest);
					}else if(action == 'upload_roll'){ 		// 批量上传卷
						bulk_upload_roll_ret(rest);
					}else if(action == 'upload_article'){	// 批量上传章
						bulk_upload_article_ret(rest);


					}else if(action == 'book_list' ){		//书目录
						ret_rand_list(rest);
					}else if(action == 'i_intercept'){		//图片编辑
						i_intercept_show(divid,rest);

					}else if(action == 'show_comment_data_sing'){ 	// 最酷
						comment_data_sing3(divid,rest);
					}else if(action == 'get_article_right'){		// 阅读  获得下一章节数据
						ect_get_article_right_val(rest);
					}else if(action == 'get_article_left' ){		// 阅读  获得上一章节数据
						ect_get_article_left_val(rest);
					}else if(action == 'get_jump_article'){
						ect_get_jump_article(rest);
					}else if(action == 'flip_book_favorite' ){		// 阅读  添加收藏
						ect_flip_book_favorite(rest);
					}else if(action=='flip_bookmark'){				// 阅读  书签
						etc_flip_bookmark(rest);	
					}else if(action == "get_flip_publish_comment"){	// 阅读  添加 评论
						etc_flip_publish_comment(rest);
					}else if(action == "flip_comment_submit"){
						etc_flip_comment_submit(rest);
					}else if(action =='flip_book_cpage'){
						etc_flip_book_cpage(rest);
					}
					
					


					if(action =="get_drop"){
						etc_drop(rest);
					}

				}else{
					if(httpObject.readyState==4){

						if(action == 'book_list' ){
							ret_rand_list('');
						}else if(action=='upload_book'){
							bulk_upload_book_ret('');

						}else if(action == 'upload_roll'){
							bulk_upload_roll_ret('');

						}else if(action == 'upload_article'){
							bulk_upload_article_ret('');
						}


					}
				}
			}
		}
		httpObject.open("POST",url,true);
		httpObject.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		httpObject.send(data);   //发送数据
		return true;
	}catch(e){
		alert('错误');
		//alert(e);
		return false;
	}
}
/*  提交 完成 */
















var search_id_arr_val 	= new Array();  // 记录 arr 的数据
var search_id_mem_arr	= new Array();  // 服务器搜到的内容保存起来
/* 百度的那种搜索显示  */
function show_search_var(e,obj){


	var obj_val		= obj.value;
	obj_val			= __trim(obj_val);
	var id			= obj.id;
	var dod_id 		= 'sd_'+id;
	if(__trim(obj_val) =='') return false;
	if(typeof obj_val =="undefined") return false;

	if (typeof e == "undefined"){
		e = window.event;
	}

	//选择值
	var if_sel = search_key_change(dod_id,e.keyCode);
	if(if_sel){
		return true;
	}




		if($("#"+dod_id)){
			$("#"+dod_id).remove();
		}

		/*  在内存中查询有没有找到以前服务器返回过来的数据
		    有数据就直接取出来   alert(search_id_mem_arr[encodeURI('法神dd')])
		*/
 		if(search_id_mem_arr[encodeURI(obj_val)]){
			add_search_val(search_id_mem_arr[encodeURI(obj_val)],e,obj);
			return ;
		}
	if(search_id_arr_val[id] != obj_val){
		try{
			var url 	= "index.php?app=psearch&act=ws";
			var bid 	= id.substring(7);
			var sid		= 'ssearch_'+bid;
			var sid_obj	= $('.'+sid);
			var sid_name= sid_obj[0].name;
			for($i=0;$i<sid_obj.length;$i++){
				var checked123 = $('.'+sid+':eq('+$i+')').attr('checked');
				if( checked123 === true){
					var sid_val	= $('.'+sid+':eq('+$i+')').val();
				}
			}
			
			var id_name	= obj.name;
			var data 	= id_name+'='+obj_val+'&'+sid_name+'='+sid_val;
			data = encodeURI(data);
			var httpObject = window.ActiveXObject ? new ActiveXObject("Microsoft.XMLHTTP") : new XMLHttpRequest();
			if(httpObject){
				httpObject.onreadystatechange = function(){
					if(httpObject.readyState == 4 && httpObject.status == 200){
						var rest 	= httpObject.responseText;
						var rest	= eval("(" + rest + ")");
						if(rest['act']=='1'){//成功
							search_id_mem_arr[encodeURI(obj_val)] = rest['msg'];

							add_search_val(rest['msg'],e,obj);
						}else{//失败

						}



					}
				}
			}
			httpObject.open("POST",url,true);
			httpObject.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			httpObject.send(data);   //发送数据
		}catch(e){
			//
		}


		//添加金层
	}

	search_id_arr_val[id]	= obj.value;
	return false;

}

/* 添加显示 */
function add_search_val(show_arr,e,obj){
		var obj_val		= obj.value;
		var id			= obj.id;
		var dod_id 		= 'sd_'+id;
		if($("#"+dod_id)){
			$("#"+dod_id).remove();
		}
		var jobj 	= $("#"+id);
		var offset 	= jobj.offset();

		var sdwidth	= $("#"+id).width();
		var height	= $("#"+id).height();
		var sdleft	= offset.left;
		var sdtop	= offset.top+height + 5;
		html_cent  	= '';
		for (key in show_arr){
			html_cent += 	'<tr class="m1"><td>'+show_arr[key]['skey']+'</td></tr>';
		}

		bod_html	= '<div class="search_back_color" id="'+dod_id+'" style="display:block; width:'+sdwidth+'px; left:'+sdleft+'px; top: '+sdtop+'px;position:absolute;z-index:1002;"></div>';
		html 	= '<table class="tm0" cellspacing="0" width="100%" height="100%" cellpadding="2" id="st">'+html_cent+'</table><div  style="text-align: right;" ><a href="javascript:void(0)" onclick="del_this_search('+dod_id+')" style="font-size: 14px;">关闭</a></div>';


		$('body').append(bod_html);
		$('#sd_'+id).append(html);

		//加入移进去事件
		search_add_event(dod_id);
		//alert($1(dod_id).style.display);
}

/*
 * 选择 搜索的 key
 * id  显示 搜索的key 的 div id
 * keycode 键盘的 按健代码
 * index 默认显示在那里，，，可以不传   如果不传表示 安按键来算 +1
 */
function search_key_change(id,keycode,index){
	keycode 	= __parseInt(keycode);

	if(index){	index		= __parseInt(index);  }

	if( !(keycode==38 || keycode==40 || keycode==13) ){
		return false;
	}
	if($1(id).style.display !='block'){
		return false;
	}

	var search_boj 	= $('#'+id+' tr');
	var search_ct	= __parseInt(search_boj.length);


	if(index){
		$('#'+id+' tr').removeClass();
		$('#'+id+' tr').addClass('m1');
		try{
			search_boj[index-1].className = 'm0';
		}catch(e){
			//
		}
		return true;
	}

	var select_index = -1;
	var if_sval	= false;
	for(var i = 0 ;i<search_ct ; i++ ){
		if(search_boj[i].className=='m0'){
			select_index	= i;
			if_sval			= true;
		}
	}

	if(keycode == 38){ //上
		select_index = select_index - 1;
		if(select_index<0){  select_index = search_ct;}	//select_index = search_ct;

		if(! if_sval){//没有选中
			select_index = search_ct-1;
		}
	}else if(keycode== 40){ // 下
		select_index = select_index + 1;

		if(select_index> search_ct){ select_index = -1; }	//select_index = 0;

	}else if(keycode == 13){//回车
		search_selected(id);
		return true;
	}


	$('#'+id+' tr').removeClass();
	$('#'+id+' tr').addClass('m1');
	try{
		search_boj[select_index].className = 'm0';
	}catch(e){

	}
	return true;
}


//加入鼠标移动事件
function search_add_event(id){
	var searci_id	= get_search_id(id);  //搜索框 id
	var obj_all	= $('#'+id+' tr');
	for(var i=0; i<obj_all.length; i++){
		obj_all[i].valth = i;
	}
	$('#'+id+' tr').mouseover(
			function (){
					$('#'+id+' tr').removeClass();
					$('#'+id+' tr').addClass('m1');
					this.className = 'm0';
				}
		);
	$('#'+id+' tr').click(
			function (){
					var searci_id	= get_search_id(id);  //搜索框 id
					var value = $('#'+id+' tr:eq('+this.valth+')').text();
					search_selected_to_val(searci_id ,value );
					if($('#'+searci_id).val()!=''){
						$1('f'+searci_id).submit();
					}
				}
		);

}

/*
 * 选中到 搜索框中
 * id  显示 搜索的key 的 div id
 * index  直接选中的那个 +1
 * 返回  选中对象
 */
function search_selected(id,index){
	if(index){	index		= __parseInt(index);  }
	if(index){
		var obj = $('#'+id+' tr:eq('+i+')');
		search_selected_to_val(id,obj);//放入框中
		return true;
	}

	var search_boj 	= $('#'+id+' tr');
	var search_ct	= __parseInt(search_boj.length);
	for(var i = 0 ;i<search_ct ; i++ ){
		if(search_boj[i].className=='m0'){
			var select_val 	= $('#'+id+' tr:eq('+i+')').text();
			var searci_id	= get_search_id(id);  //搜索框 id
			//$1(searci_id).value	= select_val;
			search_selected_to_val(searci_id,select_val);
			return true;
		}
	}
	return false;
}


/*
 * 获得搜索框的id
 * id  显示 搜索的key 的 div id
 */
function get_search_id(id){
	//sh_search_00001
	searci_id = id.substring(3);
	return searci_id;
}
function search_selected_to_val(searci_id,select_val){//设置 id
	$1(searci_id).value	= select_val;
}

// 只接收 回车事件
function keydown_select(e,obj){
	var id=obj.id;
	var dod_id = 'sd_'+id;
	if (typeof e == "undefined"){
		e = window.event;
	}

	//选择值
	if(e.keyCode == 13){
		search_selected(dod_id);
	}else if(e.keyCode == 27){	// 按 Esc 键 删除显示
		del_show_search(obj);
	}

}
/* 失去焦点  删除显示 */
function del_show_search(obj){
	var id			= obj.id;
	var dod_id 		= 'sd_'+id;
	fn = "del_this_search('"+dod_id+"')";
	setTimeout(function(){ eval(fn);},250);//过一段执行这个过程  只执行一次   这里由于与鼠标事件有冲突
}


/* 删除本身的显示 */
function del_this_search(dod_id){
	$('#'+dod_id).remove();
}

function submit_val(id){
	var val = $('#'+id).val();
	val		= __trim(val);
	if(typeof val =="undefined"){
		return false;
	}
	return true;
}
/*   搜索  完 */





var ic; // 图片截取对象
var image_max_width		= 288; 	//左边框
var image_max_height	= 400;	//右边框


//图片编辑  书本
function image_intercept(){
	try{
		var img_id	= $("#select_images_id").val();
		img_id		= __parseInt(img_id);

		if(img_id<=0){
			return ; //**********
		}
		img_url = $('#big_goods_image').attr("src");
		if(img_url=='data/system/default_goods_image.gif'){
			return ;
		}

		if(img_url.indexOf('system/default_goods_image.gif')>0 ){
			return ;
		}

		image_max_width 	= 288;
		image_max_height	= 400;

		//窗口
		create_prompt();  //'app=img_intercept&act=intercept&image_id='+img_id
		create_image_intercept_show();
		img_cart_html('book');


		if(img_url){
			$1('dragDiv').style.left	= '50px';
			$1('dragDiv').style.top		= '50px';
			$1('dragDiv').style.width	= (image_max_width/4)+'px';
			$1('dragDiv').style.height	= (image_max_height/4)+'px';

			ic = new ImgCropper("bgDiv", "dragDiv", img_url , {
				Width: image_max_width, Height: image_max_height, Color: "",
				Resize: true,
				Right: "rRight", Left: "rLeft", Up:	"rUp", Down: "rDown",
				RightDown: "rRightDown", LeftDown: "rLeftDown", RightUp: "rRightUp", LeftUp: "rLeftUp",
				Preview: "viewDiv", viewWidth: image_max_width, viewHeight: image_max_height
			});

		}
	}catch(e){
		//alert(e);
	}
}


//图片编辑  用户头像
function user_image_intercept(){
	try{
//		var img_id	= $("#select_images_id").val();
//		img_id		= __parseInt(img_id);
//
//		if(img_id<=0){
//			return ; //**********
//		}
		img_url = $('#user_portrait_val').attr("src");
		if( (!img_url) && img_url=='data/system/default_goods_image.gif'){
			return ;
		}

		if(img_url.indexOf('system/default_goods_image.gif')>0 ){
			return ;
		}
		//alert(img_url);
		image_max_width 	= 125;
		image_max_height	= 125;

		//窗口
		create_prompt();  //'app=img_intercept&act=intercept&image_id='+img_id
		create_image_intercept_show();
		img_cart_html('user');


		if(img_url){
			$1('dragDiv').style.left	= '50px';
			$1('dragDiv').style.top		= '50px';
			$1('dragDiv').style.width	= (image_max_width/4)+'px';
			$1('dragDiv').style.height	= (image_max_height/4)+'px';

			ic = new ImgCropper("bgDiv", "dragDiv", img_url , {
				Width: image_max_width, Height: image_max_height, Color: "",
				Resize: true,
				Right: "rRight", Left: "rLeft", Up:	"rUp", Down: "rDown",
				RightDown: "rRightDown", LeftDown: "rLeftDown", RightUp: "rRightUp", LeftUp: "rLeftUp",
				Preview: "viewDiv", viewWidth: image_max_width, viewHeight: image_max_height
			});

		}
	}catch(e){
		//alert(e);
	}
}

function i_intercept_show(type , rest){
	if(rest['act']=='1'){
		//window.location.reload();
		try{
			if(type=='user'){
				//添加
				$('#user_portrait_val').attr("src", site_url+'/'+rest['msg'] );//  site_url 在 member.profile.html 中

				remove_drop('delete','0');

			}else if(type == 'book'){
				var img_info = new Object();
				for(key in rest['msg']){
					img_info[key]	= rest['msg'][key]
				}

				add_uploadedfile(img_info);

				remove_drop('delete','0');
			}else{
				var s="http://" + window.location.host + window.location.pathname + window.location.search;
				window.location.href = s;
			}
		}catch(e){

		}
	}else{
		alert(rest['msg']);
	}

}

function img_intercept_submit(type){
	//移动框
	var dleft	= __parseInt( $1('dragDiv').style.left );
	var dtop	= __parseInt( $1('dragDiv').style.top );
	var dwidth	= __parseInt( $1('dragDiv').style.width );
	var dheight	= __parseInt( $1('dragDiv').style.height );



	//缩到的大小
	var icw		= ic._layBase.width;
	var ich		= ic._layBase.height;



	if( dwidth && dheight && icw && ich){
		data 	= 'dleft=' + dleft + '&dtop=' + dtop + '&dwidth=' + dwidth + '&dheight=' + dheight + '&icw=' + icw + '&ich=' + ich ;

		if(type=='user'){//用户
			data += '&user=true';

		}else{//书
			var img_id	= __parseInt($("#select_images_id").val());
			data += '&img_id='+img_id;

		}

		try{
			if(rrurl){
				rurl = rrurl;
			}
		}catch(e){
			//
		}
		do_action('i_intercept', 'app=img_intercept&act=intercept', data , type );// , 'divid' , 'false'
		return ;
	}

	//删除 div
	remove_drop('delete','0');
}







function img_cart_html(val){
	try{
		var img_id	= $("#select_images_id").val();
		img_id		= __parseInt(img_id);
	}catch(e){
		img_id		= 0;
	}

	var html = '<div style="width:720px; padding:10px; background-color:#1D6391;"><table width="720" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFFFFF"  ><tr ><td width="300" style="padding:10px;" ><div id="bgDiv"><div id="dragDiv" ><div id="rRightDown"> </div><div id="rLeftDown"> </div><div id="rRightUp"> </div><div id="rLeftUp"> </div><div id="rRight"> </div><div id="rLeft"> </div><div id="rUp"> </div><div id="rDown" ></div></div></div></td><td align="center" style="padding:10px;" ><div id="viewDiv" style="width:'+image_max_width+'px; height:'+image_max_height+'px;"> </div></td><td style="height:20px;" valign="top" ></td></tr><tr><td colspan="2" align="center" style=" height:15px;"></td></tr><tr><td colspan="2"><input type="button" style="width:60px; height:30px;" onclick="img_intercept_submit(\''+val+'\')" name="button1" value="确 定" />&nbsp;&nbsp;<input type="button" style="width:60px; height:30px;" name="button1" onclick="remove_drop(\''+val+'\',\''+img_id+'\')" value="关 闭" /></td></tr></table></div>';
	$('#promptDialog').html(html);
}



/* 弹出框 */
//创建一个蒙板
function create_prompt(){//	url_para
	//	var url = rurl + '?' + url_para;

	var body = document.getElementsByTagName("body")[0];
	var pageDimensions = getPageDimensions();
	var viewportSize = getViewportSize();

	if (viewportSize[1] > pageDimensions[1]){
		pageDimensions[1] = viewportSize[1];

	}

	var dropSheet = document.createElement("div");

	dropSheet.setAttribute("id", "dropSheet");
	dropSheet.style.position = "absolute";
	dropSheet.style.left = "0";
	dropSheet.style.top = "0";
	dropSheet.style.zIndex = "2900";
	dropSheet.style.width = pageDimensions[0] + "px";
	dropSheet.style.height = pageDimensions[1] + "px";

	var dropIframe = document.createElement("iframe");
	dropIframe.setAttribute("id", "iframe_dropSheet");
	dropIframe.style.filter = "Alpha(opacity=80)";
	dropIframe.style.opacity = "0.8";
	dropIframe.style.width = "100%";
	dropIframe.style.height ="100%";
	dropIframe.style.border = "0px";
	dropSheet.appendChild(dropIframe);

	body.appendChild(dropSheet);

	//$1('iframe_dropSheet').src = url;
}

/* 弹出框中添加内容 */
function create_image_intercept_show(){

	try{
		var body = document.getElementsByTagName("body")[0];

		var dialog 				= document.createElement("div");
		dialog.id				= 'promptDialog';
		dialog.className 		= "customDialog";
		//dialog.style.visibility = "hidden";
		dialog.style.position 	= "absolute";
		dialog.style.zIndex		=  "3920";
//		dialog.style.width		=  "800px";






		body.appendChild(dialog);
//		dialog.style.left	= '200px';
//		dialog.style.top	= '300px';
//		dialog.style.width	= '400px';
//		dialog.style.height	= '300px';
//		return ;
//		var scrollingPosition = getScrollingPosition();
//
		var maincontent = get_maincontent();
		dialog.style.left = maincontent[0] - __parseInt(dialog.offsetWidth / 2) + "px";
		dialog.style.top = maincontent[1] - __parseInt(dialog.offsetHeight / 2) + "px";
//		//    dialog.style.left = scrollingPosition[0] + parseInt(viewportSize[0] / 2) - parseInt(dialog.offsetWidth / 2) + "px";
//		//    dialog.style.top = scrollingPosition[1] + parseInt(viewportSize[1] / 2) - parseInt(dialog.offsetHeight / 2) + "px";
//		dialog.style.visibility = "visible";


	}catch(error){
		remove_drop('delete','0');
		return true;
	}
		return false;
}

// 设置 样试
function set_promptDialog_style(){
	var maincontent = get_maincontent();
	var offset 		= $('#promptDialog').offset();
	var prompt_obj	= $1('promptDialog');
	prompt_obj.style.left		= ( maincontent[0] - __parseInt( $('#promptDialog').width()/ 2) ) + 'px';
	prompt_obj.style.top		= ( maincontent[1] - __parseInt( $('#promptDialog').height()/ 2)) + 'px';
	return true;
}


function remove_drop(type,id){
	ifdate	= true;
	if(type =='book'){
		try{
			id		= __parseInt(id);
			if(id>0){
				 ifdate	= drop_image2(id); //如果没有按确定 就删除
			}
		}catch(e){
			//
		}
	}else if(type =='delete_2'){
		//
	}else if(type =='delete'){
		//
	}else if(type =='user'){
				var s="http://" + window.location.host + window.location.pathname + window.location.search;
				window.location.href = s;
	}else{
				var s="http://" + window.location.host + window.location.pathname + window.location.search;
				window.location.href = s;
		return ;
	}
	if(ifdate){
		$("#dropSheet").remove();
		$("#promptDialog").remove();
	}
	$("#dropSheet").remove();
	$("#promptDialog").remove();
}

function remove_repeat_file_id(id){
	var goods_image = $("#goods_images>li");

	for(i=0; i<goods_image.length ; i++ ){
		if($("#goods_images>li").eq(i).attr("file_id") == id){
				$("#goods_images>li").eq(i).remove();
		}
	}
}

function get_maincontent(){
	//var mainContent = document.getElementById("mainContent");
	var arr =new Array();
	arr[0] = 	$(document).width() / 2; // 宽
	arr[1] = 	350;	//mainContent.offsetTop +  parseInt(mainContent.offsetHeight/2);
	return arr;
}
/* 弹出框  完   */




/*  信息提示   */
function msg_time_error(id,msg){
	try{
		var w 		= $("#"+id).offset();
		var h 		= $("#"+id).height();
		var htop 	= w.top-22;

		//$("#"+id)
		$('#'+id).after('<div  id="show_'+id+'" style="color:#FF0000;z-index:200;width:100px;left:'+ w.left  +'px; top:'+ htop +'px;position:absolute;">&nbsp;&nbsp;'+msg+'</div>');//
		setTimeout("delete_id('show_"+ id +"')",1500);
	}catch(e){
		//
	}
}
// 删除 id
function delete_id(id){
	try{
		$('#'+id).remove();
	}catch(e){
		//
	}
}


/*==========   数据提交检查   ============*/
//检查数据出错后的提示  id 控件 id   msg 显示的信息
function msg_form_error(id,msg){
	try{
		$("#"+id).parent().append('<div id="form_'+id+'" style="color:#FF0000;margin-left:85px">'+msg+'</div>');
		// $1(id).focus();
	}catch(e){
		//
	}
}
//  进入提示
function hint_msg(id ,msg){
	try{
		$("#"+id).parent().append('<div id="form_show_'+id+'" style="color:#FF0000;margin-left:85px">'+msg+'</div>');
	}catch(e){

	}
}
//  焦点提示
function hint_msg1(id ,msg){
	try{
		$("#"+id).parent().append('<div id="form_show_'+id+'" style="color:#FF0000;margin-left:10px">'+msg+'</div>');
	}catch(e){

	}
}

//清除所有的错误显示  arr 除出所有   key 是 form 里的 id
function clear_form_error_show(arr){
	for(key in arr){
		try{
			var skey = "#form_"+key;
			var skey2 = "#form_show_"+key;
			$(skey).remove();
			$(skey2).remove();
		}catch(e){
			//
		}
	}
}
//检查数据不能为空  number 为 true  表示 是数值行
function check_null(id,cmax, number){
	try{
		var value = __trim($('#'+id).val());
		if(!number && number==true){
			value	= 	Number(value);
		}
		if(!value){
			if(arr_lang[id]){
				msg_form_error(id, ('请填写'+arr_lang[id]) );
			}else{
				msg_form_error(id,'数据不能为空');
			}
			return false;
		}
		if(cmax>1){
			return check_max_length(id,cmax)
		}
		return true;
	}catch(e){
		//
	}
}

//检查 数据是否大于这个长度  leng 中文  算 两个
function check_max_length(id,leng){
	try{
		var value = __trim($('#'+id).val());
		if(! en_length(value , leng , id ) ){
			var val_count	= __parseInt(leng/2);
			msg_form_error(id,'字数过多！最多只能'+val_count+'字。');
			return false;
		}else{
			return true;
		}
	}catch(e){
		//
	}
}




/*  杂数据 */
function sign_vote(types,val2,position,ts,scoress)<!--投票-->
{
	scores = __parseInt(scoress);
	var down = "btn_down_"+ts+val2;
	var tops = "btn_top_"+ts+val2;
	var div1_id = "is_not_abled1_"+val2;
	var div2_id = "is_not_abled2_"+val2;
	var urls="index.php?app=space&act=sign_vote";
	$.post(urls,{action:types,sid:val2},function (data){
		if(data>0)
		{
		//	var path='themes/mall/default/styles/default/images/jia.gif';
//			var left= getX(position)-50;
//			var top = getY(position)-50;
//			__show_hide(left,top,path);
			$1(down).disabled="true";
			$1(tops).disabled="true";
		//	$1(down).className="signPlumpDownNo";
//			$1(tops).className="signPlumpUpNo";
			$1(div1_id).className="but disBut but24";
			$1(div2_id).className="but disBut but24";
			var scor = scores+1;
			if(types=='top'){
				$1(tops).value = "顶"+"("+scor+")";
			}else{
				$1(down).value = "踩"+"("+scor+")";
				}

		}
	});
}
/* 赞作品提案 */
function motion_vote(id,mid,number)
{
	number = __parseInt(number);
	var iagree_id = "btn_iagree_"+mid;
	var div_id = "is_not_abled_"+mid;
	var urls="index.php?app=space&act=iagree";
	$.post(urls,{id:id,mid:mid},function (data){
	 	if(data)
		{
			//var path='themes/mall/default/styles/default/images/jia.gif';
			//var left= getX(position)-50;
			//var top = getY(position)-50;
			//__show_hide(left,top,path);
			$1(iagree_id).disabled="true";
			$1(div_id).className="but disBut but24";
			var numbers = number+1;
			$1(iagree_id).value = "我赞同"+"("+numbers+")";
		}
	});
}

/*  收藏签名 */
function sign_favorite(sid){
		var urls ="index.php?app=onlinebook&act=add_sign_favorite";
		$.post(urls,{sid:sid},function(data){
		alert(data);
		});
	}
function approve_aend(id,val,appid){
	var data = 'book_id='+id+'&approve='+val;
	do_action('approve_aend', 'app=bookadmin&act=updte_approve', data , appid);

}

/*=====    online_reading_books js  完  ========*/

function vote(obj,score)<!--投票-->
{


	var scores= __parseInt(score)+1;
	var urls="index.php?app=book_list&act=add_book_vote&book_id="+oreading_books_book_id;
	$.post(urls,function (data){
	if(data>0)
	{
		//var path='themes/mall/default/styles/default/images/jia.gif';
//		var left= getX(obj)-50;
//		var top = getY(obj)-50;
//		__show_hide(left,top,path);
		obj.value="推荐"+"("+scores+")";
		document.getElementById("vote").disabled="true";
		document.getElementById("vote").style.cursor="default";
		obj.disabled="true";
		document.getElementById("but_vote_div").className="but_voted";

	}
	});

}


function favorites(book_id,score){  <!--收藏图书-->

	var urls="index.php?app=book_list&act=add_book_favorites&book_id="+book_id;
	$.post(urls,function (data){
		var scores = __parseInt(score)+1;
		$1('favorites').value ="收藏"+"("+scores+")";

		document.getElementById("favorites").disabled="true";
		document.getElementById("favorites").style.cursor="default";
		document.getElementById("favorites").disabled="true";
		document.getElementById("but_favorite_div").className="but_favorite_disable";

	});
}
function favorites2(bk_id){
		var urls="index.php?app=book_list&act=add_book_favorites&book_id="+bk_id;
		$.post(urls,function (data){
			alert(data);					  
		});
}


/*   投票动画效果   */
function __show_hide(x,y,path){
	add_html = '<div id="add_body_show" style="position:absolute;width:100px;height:100px;z-index:500;left:'+x+'px;top:'+y+'px"><table width="100" height="100" border="0" cellpadding="0" cellspacing="0"><tr><td align="center"><img lang="" id="add_show_image" style="display:none;" src="'+path+'" width="100" height="100"  /></td></tr></table></div>';
	$('body').append(add_html);
	$('#add_show_image').show(500,function(){}).hide(1000,function (){$('#add_body_show').remove()});
}
<!--__show_hide(500,100,'http://localhost/website/jia.gif');-->




function send(){<!---评论-->
	var obj;


	if($1("is_anonymity").checked){
			obj="anonymity";
		}else{
			obj="realname";
			}

	if($1("textarea").value==''){
		alert(message_reg_isnull);<!--评论不为空-->
	}
	else{

		 var urls="index.php?app=book_list&act=publish_goods_comment&book_id="+oreading_books_book_id;
		 var captchas=$1("captcha1").value;
		 var comment_txt=$1("textarea").value;
		 var score=$1("hiddenscore").value;
		 var captcha1 = $1("captcha1").value;

		 $.post(urls,{textarea:comment_txt,captchas:captchas,hiddenscore:score,action:obj,captcha1:captcha1},function(data){
				$("#comment_data_publish").html(data);
				$("#comment_g").val('评论'+"("+$("#comment_number").html()+")");
				aaaaaa();
		 });
	}
}



function goto(sid,uid,num){<!---评论签名-->
	//var div1 = "comment_data_" + sid;
	if($1("content").value==''){
		alert(message_reg_isnull);<!--评论不为空-->
	} else{
	     var num = num+1;
	     var id = 'sign_comment_send_'+sid;
	     var number = document.getElementById(id).innerHTML;
		 document.getElementById(id).innerHTML = "评论("+num+")" ;
		 var urls="?app=space&act=signcomment&sid="+sid+"&uid="+uid;
		 var comment_txt=$1("content").value;
		 var checkeds = $1("if_user").checked;
		 $.post(urls,{content:comment_txt,if_user:checkeds},function(data){
				$('#comment_data_' + sid).html(data);

		 });
	}
}

function commentgrade(obj)<!--点评-->
{

	var urls="index.php?app=book_list&act=publish_rating&book_id="+oreading_books_book_id;
	$.post(urls,{score:obj},function(data){
//		alert(data);
		var len=llength(data);
		if(len>50){

			$("#reading-rating").html(data);
		}
		else{
			alert("您今天已点评");
		}
//		alert(llength(data));
	});
}
function commentgrade1()<!--评分-->
{

	var score=$1("hiddenscore").value;
	var h_score= $1("hid_score").value;
	var h_count= $1("hid_count").value;
	$1("hid_score").value=__parseInt(score)+__parseInt(h_score);
	$1("hid_count").value=__parseInt(h_count)+1;
	var end_score="评分("+__parseInt(__parseInt(h_count)+1)+")";
	$1("rating_g").innerHTML=end_score;
	var gradediv 		= document.getElementById("gradediv");
	gradediv.onmousemove= null;
	gradediv.onclick= null;
	var urls="index.php?app=book_list&act=publish_rating&book_id="+oreading_books_book_id;
	$.post(urls,{score:score},function(data)
	{

	});
	out_rating();

}
//鼠标移开评分区
function out_rating(){
	var h_score= $1("hid_score").value;
	var h_count= $1("hid_count").value;
	var h_temp = 2*h_score/h_count;
	var h_percentage = 10*h_temp.toFixed(0)+"%";

	//var h_s = toFixed
	document.getElementById("gradespan").style.width=h_percentage;

}
function click_page(nowdata,url)<!--动态绑定图书评论数据-->
{
	var urls='?' + url + '&page='+nowdata; <!--"index.php?app=book_list&act=get_page";	-->
	  $.get(urls,function(data)
	  {
		$("#change_online_comment").html(data);
	  });
}

function del_bk_comment(bk_id,cm_id){//删除评论
	var urls='?app=book_list&act=del_bk_comment&book_id='+bk_id; <!--"index.php?app=book_list&act=get_page";	-->
	  $.get(urls,{cmid:cm_id},function(data)
	  {
		$("#change_online_comment").html(data);
	  });
}

function Recommend_page(nowdata)<!--动态绑定数据-->
{
	var urls='?app=member&act=recommend_page'+'&page='+nowdata; <!--"index.php?app=book_list&act=get_page";	-->
	 $.get(urls,function(data)
	  {
		$("#member_recommend_data").html(data);
	  });

}

function download_page(nowdata,url){//最新成交
	//var urls='?' + url + '&page='+nowdata;
	var urls='?app=onlinebook&act=download_book'+'&page='+nowdata;
	$.get(urls,function(data)
	  {
			$("#reading-download").html(data);
	  });
	}



function news_book(nowdata,url){//最新发布
	//var urls='?' + url + '&page='+nowdata;
	var urls='?app=onlinebook&act=get_news_book'+'&page='+nowdata;
	$.get(urls,function(data)
	  {
			$("#reading-news").html(data);
	  });
}



<!--跳至哪一页 -->
function gotoPage(url)
{
	 var pagesize = document.getElementsById('pagesize').value;
	 window.location = '?'+(url)+'&page=' + pagesize;
}


function getX(obj)
{
	var ParentObj=obj;
	var left=obj.offsetLeft;
	while(ParentObj=ParentObj.offsetParent){
	left+=ParentObj.offsetLeft;
	}
	return left;
}
function getY(obj)
{
	var ParentObj=obj;
	var top=obj.offsetTop;
	while(ParentObj=ParentObj.offsetParent){
	top+=ParentObj.offsetTop;
	}
	return top;
}
function grade(event)
{
	try{
		var top,left,oDiv;
		var commentscore=document.getElementById("hiddenscore");
		oDiv=document.getElementById("gradespan");
		left=getX(oDiv);
		left=event.clientX-left;
		if(left<120&&left>80)
		{
			oDiv.style.width="100%";
			commentscore.value=5;
		}else if(left>60&&left<80)
		{
			oDiv.style.width="80%";
			commentscore.value=4;
		}else if(left>40&&left<60)
		{
			oDiv.style.width="60%";
			commentscore.value=3;
		}else if(left>20&&left<40)
		{
			oDiv.style.width="40%";
			commentscore.value=2;
		}else if(left>0&&left<20)
		{
			oDiv.style.width="20%";
			commentscore.value=1;
		}
	}catch(e){
		//
	}
}

function captchas()
{
	var urls="index.php?app=captcha&act=check_captcha";
	var messagecomment="";
	var captcha2=document.getElementById("captcha1").value;
   $.get(urls,{captcha:captcha2},function(data)
	{
		if(data=="false")
		{
			messagecomment=message_reg_failure;
			document.getElementById("message2").style.color="red";

		}
		else
		{
			messagecomment=message_reg_success;
			document.getElementById("message2").style.color="green";

		}
		document.getElementById("message2").innerHTML=messagecomment;
	});
}

function change_txt(pass)
{
	captchas();
}

/*=====    online_reading_books js  完  ========*/


/*======
 * mark
 */

/*=====    online_reading_read js  begin  ========*/

	function mark(bk_id,aid){<!--加入书签-->
//		alert(obj);
		var urls="index.php?app=book_list&act=book_mark";
		$.post(urls,{book_id:bk_id,m_aid:aid},function(data)
		{
			alert(data);
		});
	}
/*=====    online_reading_read js  end  ========*/












var	isIE = /msie/i.test(navigator.userAgent);






//$(document).ready(function(){ AddmpLevel();init_quest();}); //当城市 加载加载完成 则触发
function $1(id){
	return document.getElementById(id);
}
function $2(name){
	return document.getElementsByName(name);
}
function $3(element){
	return document.getElementsByTagName(element);
}
// 清除内存
function __gb(){
	if(isIE){
		try{
			CollectGarbage();
		}catch(e){}
	}
}
//重新装入当前页面
function __reload(){
	window.location.reload();
}
/*  去掉前后空格 */
function __trim(str){
	if(!str)	return;
	return str.replace(/(^\s*)|(\s*$)/g, "");
}
function __parseInt(value){
	if(!value )	return 0;
	//if(!value || isNaN(value))	return 0;
	return parseInt(value,10);
}
/* 解析 json 成数组    返回数组 */
function __eval(rest){
	return eval("(" + rest + ")");
}

/* 获得字符串的字数  中文两个英文一个  如果 大于 count 的长度 返回 假  否测返回 真 */
function en_length(str,count ,id ){
	var char_12=0
	var totalCount=0;
	for(var i=0;i<str.length;i++){
		var c=str.charCodeAt(i);
		if((c>=0x0001&&c<=0x007e)||(0xff60<=c&&c<=0xff9f)){
			totalCount++;
		}else {
			totalCount+=2;
		}
		if(totalCount<=count){
			char_12++;
		}
	}
	if(totalCount>count){
		try{
			$("form > #"+id).value=str.substr(0,char_12);
		}catch(e){
			//
		}
		return false;
	}
	return true;

}
/* 返回字节数 */
function llength(str){
	var totalCount=0;
	for(var i=0;i<str.length;i++){
		var c=str.charCodeAt(i);
		if((c>=0x0001&&c<=0x007e)||(0xff60<=c&&c<=0xff9f)){
			totalCount++;
		}else {
			totalCount+=2;
		}
	}
	return totalCount;
}
/* 把 url 后的参数分割  返回 arr行 */
function __url_split(){
	//var url_arr=GetURLRequest(window.location.href).split('|');
	var url_arr		= new Array();
	var url			= window.location.href;
	var urls_a		= url.split('?');

	if(urls_a[1]){
		urls_a2 		= urls_a[1].split('&');
		for(key in urls_a2){
			urls_a3		= urls_a2[key].split('=');
			if(urls_a3[0] && urls_a3[1]){
				url_arr[urls_a3[0]] = urls_a3[1];
			}
		}
	}
	return url_arr;
}
function __url_com(url_arr){
	var url			= window.location.href;
	var urls_a		= url.split('?');
	var aurl		= urls_a[0];
	aurl 			= aurl + '?';
	var n 			= 0;
	for(key in url_arr){
		if(url_arr[key]){
			if(n>0)	aurl = aurl + '&';
			aurl	= aurl + key + '=' + url_arr[key];
		}
		n++;
	}
	return aurl;
}

//alert(en_length(str,20));
//alert(llength(str));

//程序所有的初使化 数据
try{
	$(document).ready(
		function () {
			select_tags(); 		//页框
			default_img();		//空图片赋值
		}
	);
}catch(e){
	//
}

























function getViewportSize(){
	var size = [0,0];

	if (typeof window.innerWidth != 'undefined'){
		size = [
			window.innerWidth,
			window.innerHeight
		];

	}else if (typeof document.documentElement != 'undefined'
	  && typeof document.documentElement.clientWidth != 'undefined'
	  && document.documentElement.clientWidth != 0){
		size = [
			document.documentElement.clientWidth,
			document.documentElement.clientHeight
		];

	}else{
		size = [
			document.getElementsByTagName('body')[0].clientWidth,
			document.getElementsByTagName('body')[0].clientHeight
		];

	}

	return size;
}


function getPageDimensions(){
	var body = document.getElementsByTagName("body")[0];
	var bodyOffsetWidth 	= 0;
	var bodyOffsetHeight 	= 0;
	var bodyScrollWidth 	= 0;
	var bodyScrollHeight 	= 0;
	var pageDimensions 		= [0, 0];

	if (typeof document.documentElement != "undefined" &&
	  typeof document.documentElement.scrollWidth != "undefined"){
	pageDimensions[0] 	= document.documentElement.scrollWidth;
	pageDimensions[1] 	= document.documentElement.scrollHeight;
	}

	bodyOffsetWidth 		= body.offsetWidth;
	bodyOffsetHeight 		= body.offsetHeight;
	bodyScrollWidth 		= body.scrollWidth;
	bodyScrollHeight 		= body.scrollHeight;

	if (bodyOffsetWidth 	> pageDimensions[0]){
	pageDimensions[0] 	= bodyOffsetWidth;

	}

	if (bodyOffsetHeight > pageDimensions[1]){
	pageDimensions[1] 	= bodyOffsetHeight;

	}

	if (bodyScrollWidth > pageDimensions[0]){
	pageDimensions[0] 	= bodyScrollWidth;

	}

	if (bodyScrollHeight > pageDimensions[1]){
	pageDimensions[1] 	= bodyScrollHeight;

	}

	return pageDimensions;

}

function getScrollingPosition(){
	var position = [0, 0];

	if (typeof window.pageYOffset != 'undefined'){
		position = [
			window.pageXOffset,
			window.pageYOffset
		];
	}

	if (typeof document.documentElement.scrollTop != 'undefined'
	  && document.documentElement.scrollTop > 0){
		position = [
			document.documentElement.scrollLeft,
			document.documentElement.scrollTop
		];

	}else if(typeof document.body.scrollTop != 'undefined'){
		position = [
			document.body.scrollLeft,
			document.body.scrollTop
		];
	}
	return position;
}



function tests(){
	change_captcha($('#captcha'));
	document.getElementById("captcha1").value="";
	document.getElementById("message2").innerHTML="";
}
<!--改变阅读字体大小 -->
 function chosefont(obj,id){
	try{
		document.getElementById("book_txt").style.cssText="font-size:"+obj;
		$('.read_font_size').css('color','#CCCCCC');
		$('#'+id).css('color','#0066FF');
	}catch(e){
		//
	}
 }



function show_comment_data_sing(sid){
	var val 	= $1('sign_comment_send_'+sid).lang;
	if(val =='false'){
		do_action('show_comment_data_sing',('app=space&act=signcomment&sid='+sid) ,'',('comment_data_'+sid),'false');
		$1('sign_comment_send_'+sid).lang = 'true';
	}else{
		$('#comment_data_'+sid).html('');
		$1('sign_comment_send_'+sid).lang = 'false';
	}
}
//接收
function comment_data_sing3(div_id,rest){
	$('#'+div_id).html(rest);
}


//输入提示事件
function textCounter(content, lay, submitBtn, maxlimit)
{
    var contentValue = document.getElementById(content).value;

	if(contentValue.length > maxlimit)
	{
        try{
			document.getElementById(content).style.backgroundColor = "pink";
        	//field.value = contentValue.substring(maxlimit).length
        	//alert(contentValue.substring(maxlimit));
			document.getElementById(lay).innerHTML = maxlimit - contentValue.length;
        	document.getElementById(submitBtn).disabled = true;
		}catch(e){
			
		}
	}
	else
	{
		try{
			document.getElementById(content).style.backgroundColor = "white";
			document.getElementById(lay).innerHTML = maxlimit - contentValue.length;
			document.getElementById(submitBtn).disabled = false;
		}catch(e){
			
		}
	}
}


//输入提示事件(内容字数累加)
function textCounts(content, lay, submitBtn, maxlimit)
{
    var contentValue = document.getElementById(content).value;
	if(contentValue.length > maxlimit)
	{
        document.getElementById(content).style.backgroundColor = "pink";
		document.getElementById(lay).value = contentValue.length;
        document.getElementById(submitBtn).disabled = true;
	}
	else
	{
		document.getElementById(content).style.backgroundColor = "white";
        document.getElementById(lay).value = contentValue.length;
        document.getElementById(submitBtn).disabled = false;
	}
}


/* 首页图片自动切换 */
function auto_toggle_tab_index6(divname){
	if(mouseover_li){ //鼠标在 tab 上面
		return ;
	}

	try{

		var tabs_main 	= $("#"+divname).find(".tags li");
		var tagsli_leng	= tabs_main.length;
		var tindex		= 0;
		var mains = $("#"+divname).find(".main");
		//alert(tabs_main[0].className);
		for(var i=0; i<tagsli_leng;i++){
			if(tabs_main[i].className == 'active'){
				tindex = i;
			}
			tabs_main[i].className = 'normal';
		}
		tindex ++;

		if( tindex >= tagsli_leng ){	// 回滚
			tindex = 0;
		}

		mains.hide();

		// 活动
		tabs_main[tindex].className = 'active';
		mains[tindex].style.display = "block";
	}catch(e){
		//
	}
}
//鼠标失去焦点事件
function lose_show(id, content){

	var item = document.getElementById(id);
	if(item.value == content)
	{
		item.value = "";
	}
}







/*======  提示框  ========*/
var pagex_val = 0;
var pagey_val = 0;
function create_show_box(txt){
//	if(!e)e=window.event;
//	if(!e.pageX)e.pageX=e.clientX;
//	if(!e.pageY)e.pageY=e.clientY;
	var e = new Object;
	e.pageX	= doc_x;
	e.pageY	= doc_y;


	pagex_val	= e.pageX;
	pagey_val	= e.pageY;

	// 主框高
	var mains	= $(".main-inner").offset();

	var left 	= e.pageX - mains.left -1 ;
	var top 	= e.pageY - mains.top -1;

	//删除 空的
	$("body").find('#ap_popover_sprited_1').remove();
	$('#ap_popover_sprited_1').remove();
	
	var create_html = '<div id="ap_popover_sprited_1" tabindex="0" class="ap_popover ap_popover_sprited" style="left: '+left+'px; top: '+top+'px; z-index: 500; position: absolute; width:260px;" ><div class="ap_header"><div class="ap_left"></div><div class="ap_middle"></div><div class="ap_right"></div></div><div class="ap_body"><div class="ap_left"></div><div class="ap_content" style="padding-left: 17px; padding-right: 17px; padding-bottom: 8px;"><div style="display: block;" id="contentDiv_reviewHistoPop_0393072231_754">'+ txt +'</div></div><div class="ap_right"></div></div><div class="ap_footer"><div class="ap_left"></div><div class="ap_middle"></div><div class="ap_right"></div></div></div>';

	$("body").append(create_html);

}


var doc_x 	= 0;
var doc_y	= 0;

try{
$(document).mousemove(
	function (a){
		try{
			if(!a)a=window.event;
			doc_x	= a.pageX;
			doc_y	= a.pageY;
			var mains	= $("#ap_popover_sprited_1").offset();
			var	width	= $("#ap_popover_sprited_1").width();
			var height	= $("#ap_popover_sprited_1").height();

			if(mains.left >0 && mains.top > 0){
				if(pagex_val && pagey_val){
					if(((pagex_val+20)>a.pageX && a.pageX>(pagex_val-10)) && ( (pagey_val + 10)>a.pageY &&  a.pageY < (pagey_val - 10)) ){
						return ;
					}
				}

				if( ( a.pageX > mains.left &&  a.pageX < (mains.left+width)) ){
					if( ( a.pageY > mains.top  && a.pageY < (mains.top+height) ) ){
						//
					}else{

						$("body").find('#ap_popover_sprited_1').remove();
						pagex_val = 0;
						pagey_val = 0;
					}
				}else{
					$("body").find('#ap_popover_sprited_1').remove();

					pagex_val = 0;
					pagey_val = 0;
				}
			}
		}catch(e){
			//throw;
		}
	}
);
}catch(e){
	//
}

var if_mouse_val	= false;
var book_id_index_page	 	= '';
var title_index_page		= '';
var pen_name_index_page		= '';
var title_pic_index_page	= '';
var ahist_index_page		= '';
function  show_image_ind(e , book_id , title, pen_name , title_pic ,ahist){
//			if(!e)e=window.event;
//			move_x_8	= e.pageX;
//			move_y_8	= e.pageY;

	book_id_index_page 	= book_id;
	title_index_page	= title;
	pen_name_index_page	= pen_name;
	title_pic_index_page= title_pic;
	ahist_index_page	= ahist;

	if_mouse_val 	= true;
	setTimeout('show_image_ind_start()',800);

}

function hide_image_ind(){
	if_mouse_val	= false;
}

function show_image_ind_start(){
	if(if_mouse_val){
//		var text = '<div class="bookCellRanking"><div class="bcImage"><a href="index.php?app=book_list&book_id='+ book_id_index_page +'" target="_blank"><img class="img_default" src="'+ title_pic_index_page +'" width="70" height="90"/></a></div><div class="bcContent"><div class="bcNo1"></div><div class="bcName"><a href="index.php?app=book_list&book_id='+ book_id_index_page +'"  target="_blank" ><h4>'+ title_index_page+'</h4></a></div><div>作者：'+pen_name_index_page+'</div><div>点击数：<span class="hightlight">'+ahist_index_page+'</span></div</div></div><em class="cr"></em> ';
		var text = '<div class="bookCellRanking"><div class="bcImage"><a href="index.php?app=book_list&book_id='+book_id_index_page+'" target="_blank"><img class="img_default" src="'+title_pic_index_page+'" width="70" height="90"/></a></div><div class="bcContent"><div class="bcName"><a href="index.php?app=book_list&book_id='+book_id_index_page+'"  target="_blank" ><h4>'+title_index_page+'</h4></a></div><div>作者：'+pen_name_index_page+'</div><div>点击数：<span class="hightlight">'+ahist_index_page+'</span></div><div style=" color:orange;font-size:14px;margin-top:8px;">免费</div></div><em class="cr"></em></div>';
		create_show_box(text);
	}
}
/*=====  提示框  ======*/


/*
		html 	= '<table class="tm0" cellspacing="0" width="100%" height="100%" cellpadding="2" id="st"><tr class="m1"><td>百度地图</td></tr><tr class="m1"><td>百度空间</td></tr><tr class="ml"><td>百度百科</td></tr><tr class="ml"><td>百度网址大全</td></tr><tr class="ml"><td>百度词典</td></tr><tr class="ml"><td>百度文库</td></tr><tr class="ml"><td>百度有啊</td></tr><tr class="ml"><td>百度娱乐沸点直播</td></tr><tr class="m0"><td>百度贴吧</td></tr><tr class="ml"><td>百度指数</td></tr><tr class="ml"><td style="text-align: right;"><a href="javascript:void(0)" style="font-size: 14px;">关闭</a></td></tr></table>';
*/

function goto_page(url ,id){
	val = $1(id).value
	if(url){
		url = '?'+url + "&page="+val;
	}else{
		url = "?page="+val;
	}
	 location.href = url;
}


/*  user 加载完后要执行的  */
function load_exec_js(){
	change_aleft_aright();
	try{
		load_tag_js();
	}catch(e){
		//
	}
}

//改变 左边的框架
function change_aleft_aright(){
	arheight	= $('.ucontent').height();

	if(! arheight){
		arheight	= $('.content').height();
	}
	if( arheight >500 ){//必能是500以上
		$('#aleft').height(arheight);
	}
}

/**
 * 页面跳转至只看全本
 */
function turnToOnlyFull(classId, foo)
{
    if(foo == 2)
    {
        location.href = 'category/' + classId + '/view=list&foo=2';
    }
    else
    {
        location.href = 'category/' + classId + '/view=list';
    }
}

/**
 * 页面跳转至只看全本
 */
function turnToOnlyFullt(classId, foo)
{
    if(foo == 2)
    {
        location.href = 'category/' + classId + '/view=chart&foo=2';
    }
    else
    {
        location.href = 'category/' + classId + '/view=chart';
    }
}

/**
 * 小说列表排行
 */
function booklistorder(cate_id, sort_order)
{
    if(sort_order)
    {
        location.href = 'category/' + cate_id + '/view=list&order=' + sort_order;
    }
}

/**
 * 小说图表排行
 */
function booklistordert(cate_id, sort_order)
{
    if(sort_order)
    {
        location.href = 'category/' + cate_id + '/view=chart&order=' + sort_order;
    }
}

function change_module(){
	//$('#left_right').show(500,function(){}).hide(1000,function (){$('#left_right').remove()});

	$("#left_right").slideToggle("slow");
}


function goto_url(url){
		document.location.href = url;
}


function open_flash(){
	document.location.href= document.location.href+"#app=9bc5&f37-selectedIndex=0";



/*
	create_prompt();  //'app=img_intercept&act=intercept&image_id='+img_id
	create_image_intercept_show();
	var html = '<div style="width:720px; padding:10px; background-color:#1D6391;"><table width="720" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFFFFF"><tr ><td  width="690" style="padding:10px;" ><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="660" height="460" id="MediaCreator" name="MediaCreator"><param name="allowScriptAccess" value="sameDomain" /><param name="movie" value="MediaCreator.swf" /><param name="quality" value="high" /><param name="bgcolor" value="#333333" /><embed src="MediaCreator.swf" quality="high" bgcolor="#333333" width="660" height="460" swLiveConnect=true id="MediaCreator" name="MediaCreator" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash"    pluginspage="http://www.macromedia.com/go/getflashplayer" /></object></td><td style="height:20px;" width="20" valign="top" >ss</td></tr><tr><td colspan="2" align="center" style=" height:15px;"></td></tr><tr><td colspan="2" align="center" ><input name="" value="关闭" onclick="remove_drop(\'delete_2\',\'0\')" type="button" /></td></tr></table></div>';
	$('#promptDialog').html(html);
	*/

	$("#dropSheet_4").show();
	$("#promptDialog_4").show();
		var so = new SWFObject("MediaCreator.swf", "amline", "640", "480", "4", "#FFFFFF");
            so.addParam("allowScriptAccess","sameDomain");
            so.addParam("quality","high");
            so.addVariable("width","640");
            so.addVariable("height","480");
			so.write("flashcontent");
	$("#flashcontent").height(480);
	$("#flashcontent").width(642);

	$("#dropSheet_4").height($(document).height());
	$("#dropSheet_4").width($(document).width());

	var maincontent = get_maincontent();
	var offset 		= $("#promptDialog_4").offset();

	$("#promptDialog_4").css("left", (maincontent[0] - __parseInt(642/2)) );
	$("#promptDialog_4").css("top", (maincontent[1] - __parseInt(480/2))  ) ;
	//offset.top = maincontent[1] - __parseInt(480/2);

}






function winClose(upData){
	return edit_flex_img;
}

function thisMovie(movieName) {
	 if (navigator.appName.indexOf("Microsoft") != -1) {
		 return window[movieName];
	 } else {
		 return document[movieName];
	 }
}
function sendToActionScript(value) {
	try{
 		thisMovie("MediaCreator").sendToActionScript(edit_flex_img);
	}catch(e) {
		//
	}

}


function get_imgpath(getdata){
	$("#dropSheet_4").hide();
	$("#promptDialog_4").hide();
	$arr 				= getdata.split(',');
	var file_data 		= new Object();
	file_data.file_path	= $arr[1];
	file_data.thumbnail	= $arr[1];
	file_data.file_id	= $arr[0];
	file_data.file_name	= '图书图片';
	file_data.instance 	= 'desc_image';
	add_uploadedfile(file_data);
}
//关闭 flase
function get_js_close(){
	remove_flex_hide(); //关闭
}

function remove_flex_hide(){
	$("#dropSheet_4").hide();
	$("#promptDialog_4").hide();
}
	//CharMode函数
//测试某个字符是属于哪一类
function CharMode(iN) {
   if (iN>=48 && iN <=57) //数字
    return 1;
   if (iN>=65 && iN <=90) //大写字母
    return 2;
   if (iN>=97 && iN <=122) //小写
    return 4;
   else
    return 8; //特殊字符
}

//bitTotal函数
//计算出当前密码当中一共有多少种模式
function bitTotal(num) {
   modes=0;
   for (i=0;i<4;i++) {
    if (num & 1) modes++;
     num>>>=1;
    }
   return modes;
}

//checkStrong函数
//返回密码的强度级别
function checkStrong(sPW) {
   if (sPW.length<6)
    return 0; //密码太短
    Modes=0;
    for (i=0;i<sPW.length;i++) {
     //测试每一个字符的类别并统计一共有多少种模式
     Modes|=CharMode(sPW.charCodeAt(i));
   }
   return bitTotal(Modes);
}

//pwStrength函数
//当用户放开键盘或密码输入框失去焦点时,根据不同的级别显示不同的颜色

function pwStrength(pwd) {
   O_color="#eeeeee";  //最开始的颜色 灰
   L_color="#FF0000";
   M_color="#FF9900";
   H_color="#33CC00";
   if (pwd==null||pwd==''){
    Lcolor=Mcolor=Hcolor=O_color;
   }
   else {
    S_level=checkStrong(pwd);
    switch(S_level) {
    case 0:
     Lcolor=Mcolor=Hcolor=O_color;
    case 1:
     Lcolor=L_color;
     Mcolor=Hcolor=O_color;
    break;
    case 2:
     Lcolor=Mcolor=M_color;
     Hcolor=O_color;
    break;
    default:
     Lcolor=Mcolor=Hcolor=H_color;
    }
   }
   document.getElementById("strength_L").style.background=Lcolor;
   document.getElementById("strength_M").style.background=Mcolor;
   document.getElementById("strength_H").style.background=Hcolor;
return;
}


// 获得 屏幕大小  并发送数据
function compute_reader(bid,rid,aid,font,model,position){
	var window_width	= $(window).width();
	var window_height	= $(window).height();
	
	var s	= SITE_URL+"/index.php?app=reader_flipbook&width="+window_width+"&height="+window_height+"&book_id="+bid+"&rid="+rid+"&aid="+aid+"&font_size="+font+"&single_mode="+model+'&page_data='+position;
	
//var tmp=window.open("about:blank","","fullscreen=1");
//tmp.moveTo(0,0);
//tmp.resizeTo(screen.width+20,screen.height);
//tmp.focus();
//tmp.location=s;
	window.location.href	= s;
}

// 在线阅读  跳转   book 书id   rid 卷id  aid 章节article_id   font 字体大小      model 模式    position 位置  加入书签用到
function compute_reader_book(book,rid,aid,font,model,position ){
	var s	= SITE_URL+"/?app=reader_flipbook&act=get_windows&book_id="+book+"&rid="+rid+"&aid="+aid+"&font_size="+font+"&single_mode="+model+'&page_data='+position;
	window.location.href	= s;
}

// 在线阅读  book 书id  aid 章节表aid     font 字体大小      model 模式   position 位置  加入书签用到
function compute_reader_aid(book,aid,font,model,position){
	var s	= SITE_URL+"/?app=reader_flipbook&act=get_windows&book_id="+book+"&online_article_aid="+aid+"&font_size="+font+"&single_mode="+model+'&page_data='+position;
	window.location.href	= s;
}

// 路到简版的阅读   书id     aid 章自增id 
function jump_simply_read(book_id , aid){
	if(aid && aid>0){
		var s	= SITE_URL+"/read/"+aid+"/";	
	}else{
		var s	= SITE_URL+"/?app=book_list&act=directory&book_id="+book_id;	
	}
	//alert(s);
	window.location.href	= s;
	return ;
}


function search_content_highlight($val){
	var search_chtml	= $("#book_content_search").find(".bookCellSearch");
	rez 	= new  RegExp($val,"gi");             // 创建正则表达式模式。
	rea		= '<span class="search_keyword_color">' + $val + '</span>';
	//search_chtml 		= search_chtml.replace(rez, rea);    // 用 "A" 替换 "The"。
	var cr	= search_chtml.length;

	for(i=0; i<cr;i++ ){
		obj		= $("#book_content_search").find(".bookCellSearch:eq("+i+") ");
		text 	= obj.find(".info").find(".name").text();
		stext	= text.replace(rez, rea);
		obj.find(".info").find(".name").html(stext);

		text	= obj.find(".writer").text();
		stext	= text.replace(rez, rea);
		obj.find(".writer").html(stext);

		text	= obj.find(".cent_synopsis").text();
		stext	= text.replace(rez, rea);
		obj.find(".cent_synopsis").html(stext);
	}
	//$("#book_content_search").html(search_chtml);
}


/*

var move_left_right_step = 5;
function move_left_right(){
	//var offset = $("#left_right").offset();
	var left = __parseInt($1('left_right').style.left);
	//alert(offset.left)
	if( left >500){
		move_left_right_step = -move_left_right_step;
	}else if( left <=0){
		move_left_right_step = -move_left_right_step;
	}
	left += move_left_right_step;
	$1('left_right').style.left = left+"px";
}

*/




/*   打开成为粉丝的层   */
function to_fans_show(position){
	$('#to_fans_div').show();
}
/* 取消加入粉丝  */
function fans_cancel(){
		$('#to_fans_div').hide();
}

/*  成为粉丝  */
function tobe_fans_fun(){
	var f_content=$1("tobe_content").value;
	var f_user_id = $1("f_user_id").value;
	var urls="index.php?app=space&act=become_fans";
	$.post(urls,{f_content:f_content,f_user_id:f_user_id},function(data){
		$("#myiximo-mod-fans").html(data);
		$('#reg_fans_span').html("已是粉丝");
	});
  	fans_cancel();
}

/*  成为粉丝  */
function tobe_fans_fun2(user_id){
	var urls="index.php?app=book_list&act=become_fans";

	$.post(urls,{f_user_id:user_id},function(data){
		$('#reader_tobe_fans').html("已是粉丝");
		$('#reade_tobe_fans_div').style.cursor="default";
		$('#reade_tobe_fans_div').disabled="true";
	});
	$1('tobe_fans_fun_a').onclick = NULL;
}



//全书下载
function bk_download(bk_id,user_id,price,aid,title,position){
	if(user_id == '0'){//没有登录

	var heights =document.body.clientHeight+document.body.scrollTop+"px";
	var tops    = document.documentElement.scrollTop+getY(position)-100+"px";
	if(price >0)
	{
		not_login = '<div id="light1" class="white_content"  style="top:'+tops+'"><div class="inner">';
		not_login += '<a class="mbutton pleaseLogin" href="login.php"><span>下载请登录</span></a>';
		not_login += '<a class="mbutton dcancel"      href="javascript:void(0);" onclick="message_close(\'light1\',\'fade1\');"><span>取消</span></a>';
		not_login += '</div></div><div id="fade1" class="black_overlay" style="height:'+heights+';"></div>';

	}
	else
	{
		href='read/'+aid+'/'+title+'/';
		not_login = '<div id="light1" class="white_content"  style="top:'+tops+'"><div class="inner">';
		not_login += '<a class="mbutton pleaseLogin"  href="login.php"><span>下载请登录</span></a>';
		not_login += '<a class="mbutton toReadNow"    href="'+href+'"><span>开始阅读</span></a>';
		not_login += '<a class="mbutton dcancel"       href="javascript:void(0);" onclick="message_close(\'light1\',\'fade1\');"><span>取消</span></a>';
		not_login += '</div></div><div id="fade1" class="black_overlay" style="height:'+heights+';"></div>';
	}

	$('body').append(not_login);
	message_show("light1","fade1");

	}else{
		if(confirm("下载将扣ixi币,是否继续？")){
			var urls ="index.php?app=book_list&act=bk_download";
			$.post(urls,{bk_id:bk_id},function(data){
				var returnUrl = SITE_URL+"/read" + "/" + aid + "/" + title + "/";
				window.location= returnUrl;
			});
			document.getElementById("bk_download").className="downloaded";
			document.getElementById("bk_download").onclick= null;
			$('#bk_download').html("已下载");

		}

	}
}
//章节下载
function bk_article_download(bk_id,user_id,aid,price,title,position){
	if(user_id == '0'){//没有登录
	var heights =document.body.clientHeight+document.body.scrollTop+"px";
	var tops    =+getY(position)-100+"px";
	var s= getY(position)+"px";
	if(price >0)
	{
		not_login = '<div id="light2" class="white_content" style="top:'+tops+';"><div class="inner">';
		not_login += '<a class="mbutton pleaseLogin" href="login.php" ><span>下载请登录</span></a>';
		not_login += '<a class="mbutton dcancel"      href="javascript:void(0);" onclick="message_close(\'light2\',\'fade2\')"><span>取消</span></a>';
		not_login += '</div></div><div id="fade2" class="black_overlay" style="height:'+heights+';"></div>';
	}
	else{
		href='read/'+aid+'/'+title+'/';
		not_login = '<div id="light2" class="white_content" style="top:'+tops+';"><div class="inner">';
		not_login += '<a  class="mbutton pleaseLogin" href="login.php" ><span>下载请登录</span></a>';
		not_login += '<a  class="mbutton toReadNow"   href="'+href+'"><span>开始阅读</span></a>';
		not_login += '<a  class="mbutton dcancel"      href="javascript:void(0);" onclick="message_close(\'light2\',\'fade2\')"><span>取消</span></a>';
		not_login += '</div></div><div id="fade2" class="black_overlay" style="height:'+heights+';"></div>';
	}

	$('body').append(not_login);
	message_show("light2","fade2");
	}else{
		if(confirm("下载将扣ixi币,是否继续？")){
			var urls ="index.php?app=book_list&act=bk_download";
			$.post(urls,{bk_id:bk_id},function(data){
				var returnUrl = SITE_URL+"/read" + "/" + aid + "/" + title + "/";
				window.location= returnUrl;
			});
			document.getElementById("bk_download").className="downloaded";
			document.getElementById("bk_download").onclick= null;
			$('#bk_download').html("已下载");

		}

	}
}
 function message_show(lights,fades){
	//var heights =document.body.clientHeight+document.body.scrollTop;
	//document.getElementById('fade').style.height=heights;
	document.getElementById(lights).style.display='block';
	document.getElementById(fades).style.display='block'


}
function message_close(lights,fades){
	document.body.removeChild(document.getElementById(lights));
	document.body.removeChild(document.getElementById(fades));
	//document.getElementById(lights).style.display='none';
//	document.getElementById(fades).style.display='none'

}



function hide_iforme_css(css_name){
	$('.'+css_name).hide();
}
function hide_iforme_id(id){
	$('#'+id).hide();
}

//
////章节下载
//function bk_article_download2(bk_id,user_id,rid,aid,position){
//
//	var urls ="?app=book_list&act=read&book_id="+bk_id+"&rid="+rid+"&aid="+aid;
//	$.post(urls,{bk_id:bk_id},function(data){
//		if(data==1){//必须下载
//			bk_article_download(bk_id,user_id,rid,aid,position);
//		}else if(data==0){
//			alert('收费已下载，可直接阅读');
//		}else if(data==2){
//			alert("可以不下载");
//			}else{
//			alert('不知道');
//		}
//
//	});
//	//location.href="?app=book_list&act=read&book_id="+bk_id+"&rid="+rid+"&aid="+aid;
//
//}


function windowOpener(strFile)//打开新窗口
{
//window.showModalDialog(strFile,"123","dialogWidth=300px,dialogHeight=620px,top=0,left=0,Center=yes,Location=yes,Toolbar=yes,Resizable=yes,scrollbars=yes");
   window.showModalDialog(strFile,window,"dialogWidth:" + 300 + "px;dialogHeight:" + 620 + "px;center:yes;status:no;scroll:no;help:no; top:0px;");
}
function add_to_bookroom(bk_id){
	var urls="index.php?app=book_list&act=add_to_bookroom";
	if(bk_id){
		$.post(urls,{book_id:bk_id},function(data){
			if(data.indexOf("login.php")>=0){
				if(confirm("放入书房随时随地看小说,请登录")){
					location.href=data;
				}	
			}else{
				alert(data);		
			}
			
			//$('#reader_tobe_fans').html("已是粉丝");
//			$('#reade_tobe_fans_div').style.cursor="default";
//			$('#reade_tobe_fans_div').disabled="true";
		});	
	}else{
		alert("请选择图书");	
	}
}
