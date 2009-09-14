
Bcastr v2.0

主要功能:
1.可以读取xml设置播放列表
2,可以不使用xml将图片地址直接写网页中直接
3,可以读取swf的动画格式
4,自动适应图片大小
5,循环播放，自定义自动播放时间
6,不限制图片数量

使用方法:

以下是嵌入网页中的2种方法

方法一，xml地址

<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id=scriptmain name=scriptmain codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="640" height="106">
	<param name="movie" value="bcastr.swf?bcastr_xml_url=bcastr1.xml">
	<param name="quality" value="high">
	<param name=scale value=noscale>
	<param name="LOOP" value="false">
	<param name="menu" value="false">
	<param name="wmode" value="transparent">
	<embed src="bcastr.swf?bcastr_xml_url=bcastr1.xml" width="640" height="106" loop="false" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" salign="T" name="scriptmain" menu="false" wmode="transparent"></embed>
</object>

修改上方2个bcastr_xml_url=bcastr1.xml地址即可

xml内容

item_url="pic/Maradona.jpg"                     图片地址
link="http://www.google.com"                    图片点击后 不填写就不可点击连接
itemtitle="马拉多纳受邀解说世界杯" 		图片题目

方法二

<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id=scriptmain name=scriptmain codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="640" height="106">
	<param name="movie" value="bcastr.swf?bcastr_flie=aaa.jpg|bbb.jpg|ccc.swf&bcastr_link=http://www.baidu.com|http://www.nba.com|http://www.ruochi.com&bcastr_title=百度|NBA|Ruochi.com">
	<param name="quality" value="high">
	<param name=scale value=noscale>
	<param name="LOOP" value="false">
	<param name="menu" value="false">
	<param name="wmode" value="transparent">
	<embed src="bcastr.swf?bcastr.swf?bcastr_flie=aaa.jpg|bbb.jpg|ccc.swf&bcastr_link=http://www.baidu.com|http://www.nba.com|http://www.ruochi.com&bcastr_title=百度|NBA|Ruochi.com" width="640" height="106" loop="false" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" salign="T" name="scriptmain" menu="false" wmode="transparent"></embed>
</object>
其中
bcastr_flie=aaa.jpg|bbb.jpg|ccc.swf						是图片地址，用"|"符号分开
bcastr_link=http://www.baidu.com|http://www.nba.com|http://www.ruochi.com	是图片对应连接地址，用"|"符号分开
bcastr_title=百度|NBA|Ruochi.com						是图片对应标题，用"|"符号分开

注意其中的&连接符

使用条款:
本软件完全免费,甚至可用作商业用途。
但不可对本软件进行反编译,修改和再次分发。
提供付费的个性化修改服务


有任何建议,可以发到:
http://www.ruochi.com/guest_book/
或者 ruochi_com@163.com


Created By Ruochi.com
http://www.Ruochi.com
2006-7-6
