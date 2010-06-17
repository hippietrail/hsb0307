<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="ReferenceNews.WebClient.Include.Header" %>

<div id="main-header"> 
<div id="top-menu"> 
		<div class="fr"> 
        	<ul> 
			            <li> 
                  <form method="get" id="fsearch_00001" onsubmit="return submit_val('search_00001')" action="http://www.iximo.cc/" target="_blank" class="search-form"> 
                      <input name="app" type="hidden" value="psearch"/> 
                      <div class="sfSelect"><span> 
                      <select name="search_type" > 
                          <option class="ssearch_00001" name="search_type" type="radio" value="all" selected="selected" />综合</option> 
                          <option class="ssearch_00001" name="search_type" type="radio" value="title"  />书名</option> 
                          <option class="ssearch_00001" name="search_type" type="radio" value="pen_name"  />作者</option> 
                          <option class="ssearch_00001" name="search_type" type="radio" value="tagname"  />标签</option> 
                      </select> 
                      </span></div> 
                      <div class="sfinputarea"> 
                      <div class="sfInput"><span> 
                      <input name="search_val" type="text" class="type eText" id="search_00001" value="" maxlength="25" autocomplete="off" 
                          onkeyup="show_search_var(event,this)" 
                          onkeydown="keydown_select(event,this)" 
                          onblur="del_show_search(this)" 
                          onfocus="show_search_var(event,this)"
                      /> 
                      
                      </span></div> 
                      <div class="sfButton obj"><span class="bd"><input type="submit" value="" class="button"/></span></div> 
                      </div> 
                  </form> 
            </li> 
            <li class="div_frame_box"> 
            <a class="sitemap-links btm" href="#"><span class="cbut" >网站导航</span></a> 
            	<div class="frame_box_change websitemap" style=" visibility:hidden"> 
                    <dl> 
                        <dt>网站导航</dt> 
                        <dd><a href="http://www.iximo.cc/about.html"><span>什么是吸墨</span></a></dd> 
                        <dd><a href="http://www.iximo.cc/reader/"><span>我是读者</span></a></dd> 
                        <dd><a href="http://www.iximo.cc/writer/"><span>我是作者</span></a></dd> 
                        <dd><a href="http://www.iximo.cc/mobileapp/"><span>吸墨阅读器</span></a></dd> 
                        <dd><a href="http://www.iximo.cc/channels/"><span>阅读频道</span></a></dd> 
                      
                    </dl> 
                    <dl> 
                        <dt>我的吸墨网</dt> 
                        <dd><a href="http://www.iximo.cc/contact.html"><span>联系我们</span></a></dd> 
                        <dd><a href="http://www.iximo.cc/copyright.html"><span>版权声明</span></a></dd> 
                        <dd><a href="http://www.iximo.cc/sitemap.html"><span>网站地图</span></a></dd> 
                        <dd><a href="http://www.iximo.cc/feedback.html"><span>用户反馈</span></a></dd> 
						<dd><a href="http://www.iximo.cc/gettingstart.html"><span>新手帮助</span></a></dd> 
                    </dl> 
                    <dl> 
                        <dt>关注吸墨在</dt> 
                          <dd><a href="http://t.sina.com.cn/iximo" class="sina-blog" target="_blank" title="吸墨网新浪微博">新浪微博</a></dd> 
                          <dd><a href="http://hi.baidu.com/iximo" class="baidu-blog" target="_blank" title="吸墨网百度空间">百度空间</a></dd> 
                          <dd><a href="http://iximo.blog.sohu.com/" class="souhu-blog" target="_blank" title="吸墨网搜狐博客">搜狐博客</a></dd> 
                          <dd><a href="http://m.iximo.cc/" class="iximo3g-blog" target="_blank" title="体验3G版">体验3G版</a></dd> 
                    </dl> 
                </div> 
            </li> 
            <li><a href="http://www.iximo.cc/about.html" ><strong class="c-red">什么是吸墨？</strong></a></li> 
            </ul> 
        </div> 
		<div class="userbar fl"> 
			<ul class="userbar-inner">
                <asp:Literal ID="lblAuthenticated" runat="server"></asp:Literal>
            </ul> 
		</div> 
        <em class="cr"></em> 
</div> 
<em class="cr"></em> 
<h1 id="logo" onclick="location.href='http://www.iximo.cc/';"></h1> 
<div id="ads-header"> 
	<a href="http://www.iximo.cc/?app=activity"><img src="Shared/data/files/ads/baner-345321231-1.jpg"/></a> 
</div> 
<em class="cr"></em> 
<div id="navigation"> 
<ul class="navs"> 
		<li class='active' id="nav_01"><a href="default.aspx"><span>首页</span></a></li> 
		<li  id="nav_02"><a href="ranking.aspx"><span>排行榜</span></a></li> 
<!--		<li  id="nav_03"><a href="index.php?app=onlinebook&act=signature"><span>最酷签名</span></a></li>
		<li  id="nav_04"><a href="?app=m3g"><span>手机3G版</span></a></li>
		<li  id="nav_05"><a href="?app=wap"><span>手机WAP版</span></a></li>
		<li  id="nav_09"><a href="mweb/"><span>手机Web版</span></a></li>
		<li  id="nav_06"><a href="iphone/"><span>iPhone版</span></a></li>
		<li  id="nav_07"><a href="#"><span>如何三赢</span></a></li>
		<li  id="nav_08"><a href="android/"><span>android版</span></a></li>
		<li  id="nav_10"><a href="community/"><span>社群</span></a></li>--> 
        <li  ><a href="channels.aspx"><span>阅读频道</span></a></li> 
        <li  ><a href="mobileapp.aspx"><span>吸墨阅读器</span></a></li> 
        <li class="btm-activity"><a href="http://www.iximo.cc/?app=activity" target="_blank"></a></li> 
</ul> 
	<div class="navLinks"> 
    <!--<a href="http://www.iximo.cc?app=activity" class="activity-button">封面人物竞选</a>--> 
    <div class="hotsearch">热门搜索：<a target="_blank" href="search/all/%E6%9D%9C%E6%8B%89%E6%8B%89%E5%8D%87%E8%81%8C%E8%AE%B0/">杜拉拉升职记</a>|<a target="_blank" href="search/all/%E6%AD%A5%E6%AD%A5%E7%94%9F%E8%8E%B2/">步步生莲</a>|<a target="_blank" href="search/all/%E9%95%BF%E7%94%9F%E7%95%8C/">长生界</a>|<a target="_blank" href="search/all/%E6%96%97%E7%A0%B4%E8%8B%8D%E7%A9%B9/">斗破苍穹</a>|<a target="_blank" href="search/all/%E4%BB%95%E9%80%94%E9%A3%8E%E6%B5%81/">仕途风流</a></div> 
    </div> 
<span class="lAng"></span><span class="rAng"></span> 
</div> 
</div>