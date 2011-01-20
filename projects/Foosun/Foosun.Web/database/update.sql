SET IDENTITY_INSERT [dbo].[fs_sys_LabelClass] ON

INSERT INTO [dbo].[fs_sys_LabelClass] (
	[Id],
	[ClassID],
	[ClassName],
	[Content],
	[CreatTime],
	[isRecyle],
	[SiteID]
)
	SELECT 7, '932462318447', 'people', '', '12-31-2009 16:03:21.407', 0, '0'

SET IDENTITY_INSERT [dbo].[fs_sys_LabelClass] OFF

GO

SET IDENTITY_INSERT [dbo].[fs_sys_styleclass] ON

INSERT INTO [dbo].[fs_sys_styleclass] (
	[Id],
	[ClassID],
	[Sname],
	[CreatTime],
	[SiteID],
	[isRecyle]
)
	SELECT 5, '166750316836', 'people', '01-04-2010 13:47:47.857', '0', 0
SET IDENTITY_INSERT [dbo].[fs_sys_styleclass] OFF
GO

SET IDENTITY_INSERT [dbo].[fs_sys_LabelStyle] ON

INSERT INTO [dbo].[fs_sys_LabelStyle] (
	[Id],
	[styleID],
	[ClassID],
	[StyleName],
	[Content],
	[Description],
	[CreatTime],
	[isRecyle],
	[SiteID]
)
	SELECT 46, '434605587223', '166750316836', 'people_作者来源日期点击数', N'<ul> <li>ᦕᦴᧉ ᦵᦵᦎᧄᧉ ：{#Author} </li>   <li>ᦑᦲᧈ ᦀᦸᧅᧈ ：{#Source} </li> <li><span class="date">{#DateShort} </span></li><li>ᦵᦎᧅ ᦑᦸᧂᦰ {#Click} ᦗᦸᧅ </li></ul>', '', '03-16-2009 13:26:48.843', 0, '0' UNION
	SELECT 47, '688797013663', '166750316836', 'people_新闻内容', '{#PageTitle_select}{#Content}', '', '03-16-2009 13:30:45.250', 0, '0' UNION
	SELECT 48, '050012993312', '166750316836', 'people_滑动联盟新闻', '<span><a title="{#uTitle}" target="_blank" href="{#URL}">{#Title}</a></span>', '', '03-20-2009 13:13:21.780', 0, '0' UNION
	SELECT 49, '802049782202', '166750316836', 'people_新闻标题截断', '<li><a target="_blank" href="{#URL}">{#Title}</a> </li>', '', '04-08-2009 11:45:08.093', 0, '0' UNION
	SELECT 50, '009016332516', '166750316836', 'people_图文标题列表', '<li><a target="_blank" href="{#URL}"><img alt="" width="160" height="160" src="{#Picture}" /></a> <a target="_blank" href="{#URL}">{#Title}</a> </li>', '', '04-13-2009 10:03:34.453', 0, '0' UNION
	SELECT 51, '986563668614', '166750316836', 'people_版权声明', N'<a target="_blank" href="http://{FS_FREE__站点域名}/html/xxbn/dym/CopyrightNotice.html">ᦢᦸᧅᧈ ᦵᦵᦈᧂᧉ ᦁᧄ ᦓᦱᧆ ᦃᦸᧂ ᦙᦲ</a> - <a target="_blank" href="http://{FS_FREE__站点域名}/html/xxbn/dym/BaoSheSummary.html">ᦵᦂᧆ ᦎ ᦓᦱ ᦷᦣᧂ ᦐᧂ ᦉᦹ ᦘᦲᧄ</a> - <a target="_blank" href="http://{FS_FREE__站点域名}/html/xxbn/dym/SiteSummary.html">ᦵᦂᧆ ᦎ ᦓᦱ ᦞᦱᧂ ᦈᦱᧃᧈ</a> - <a target="_blank" href="http://{FS_FREE__站点域名}/html/xxbn/dym/contactus.html">ᦉᦹᧇ ᦠᦱ ᦕᦴᧉ ᦃᦱᧉ ᦎᦴ</a>', '', '09-18-2009 14:04:59.250', 0, '0' UNION
	SELECT 52, '439171734382', '166750316836', 'people_视频头条', '{#NewsvURL,260,320} <a style="FONT-SIZE: 20px" href="{#URL}">{#Title}</a>', '', '10-19-2009 20:16:26.413', 0, '0' UNION
	SELECT 53, '837883304080', '166750316836', 'people_引用标题新闻列表项', '<li><a target="_blank" href="{#URL}">{#FS:define=ReplaceTitle}</a></li>', '', '10-22-2009 11:09:11.730', 0, '0' UNION
	SELECT 54, '309420374665', '166750316836', 'people_栏目_图文', '<li><a target="_blank" href="{#URL}"><img alt="" width="290" height="220" src="{#Picture}" /></a> <span><a target="_blank" href="{#URL}">{#Title}</a></span> </li>', '', '01-04-2010 13:49:16.403', 0, '0' UNION
	SELECT 55, '328687792004', '166750316836', 'people_栏目_新闻列表', '<div class="xz2jlb_5">' + CHAR(13) + CHAR(10) + '<h4><a target="_blank" href="{#URL}">{#Title}</a></h4>' + CHAR(13) + CHAR(10) + '<span>&nbsp;&nbsp;&nbsp;&nbsp;{#Content}</span></div>', '', '01-04-2010 16:25:31.530', 0, '0' UNION
	SELECT 56, '101260336917', '166750316836', 'people_page_title', '{#uTitle}', '', '01-05-2010 10:19:37.673', 0, '0' UNION
	SELECT 57, '769696426159', '166750316836', 'people_page_pictures', '<li><a target="_blank" href="{#URL}"><img alt="" width="150" height="150" src="{#Picture}" /></a> <span><a target="_blank" href="{#URL}">{#Title}</a></span> </li>', '', '01-05-2010 11:35:31.173', 0, '0' UNION
	SELECT 58, '443148212794', '166750316836', 'people_video_PictureNews', '<li><a target="_blank" href="{#URL}"><img alt="" src="{#Picture}" /></a><br />' + CHAR(13) + CHAR(10) + '<a target="_blank" href="{#URL}">{#Title}</a> </li>', '', '01-11-2010 09:18:36.673', 0, '0' UNION
	SELECT 59, '523444493371', '166750316836', 'People_video_news', '<li><a target="_blank" href="{#URL}">{#Title}</a></li>', '', '01-11-2010 09:52:27.797', 0, '0'
SET IDENTITY_INSERT [dbo].[fs_sys_LabelStyle] OFF
GO



SET IDENTITY_INSERT [dbo].[fs_sys_Label] ON

INSERT INTO [dbo].[fs_sys_Label] (
	[Id],
	[LabelID],
	[ClassID],
	[Label_Name],
	[Label_Content],
	[Description],
	[CreatTime],
	[isBack],
	[isRecyle],
	[isSys],
	[SiteID],
	[isShare]
)
	
	SELECT 165, '998568924766', '932462318447', '{FS_people_首页_视频头条}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=1,FS:NewsType=Tnews,FS:ClassID=918316733085,FS:Cols=1,FS:IsAdver=1,FS:TitleNumer=20][#FS:StyleID=439171734382][/FS:Loop]', '', '12-23-2009 16:44:37.250', 0, 0, 0, '0', NULL UNION
	SELECT 166, '426742687479', '932462318447', '{FS_people_首页歌曲}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=7,FS:NewsType=Last,FS:ClassID=284097771334,FS:IsAdver=1,FS:TitleNumer=32][#FS:StyleID=802049782202][/FS:Loop]', '', '12-24-2009 09:44:03.327', 0, 0, 0, '0', NULL UNION
	SELECT 167, '539838267254', '932462318447', '{FS_people_栏目最新新闻列表_文化生活}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=9,FS:NewsType=Last,FS:ClassID=931312341270,FS:TitleNumer=36,FS:isSub=true][#FS:StyleID=802049782202][/FS:Loop]', '', '12-24-2009 14:07:58.767', 0, 0, 0, '0', NULL UNION
	SELECT 168, '135107721502', '932462318447', '{FS_people_栏目最新新闻列表_民族宗教}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=9,FS:NewsType=Last,FS:ClassID=074880008639,FS:TitleNumer=36,FS:isSub=true][#FS:StyleID=802049782202][/FS:Loop]', '', '12-24-2009 14:20:22.750', 0, 0, 0, '0', NULL UNION
	SELECT 169, '215190178978', '932462318447', '{FS_people_栏目最新新闻列表_东盟瞭望}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=9,FS:NewsType=Last,FS:ClassID=532001601801,FS:TitleNumer=40,FS:isSub=true][#FS:StyleID=802049782202][/FS:Loop]', '', '12-24-2009 14:26:20.720', 0, 0, 0, '0', NULL UNION
	SELECT 170, '844472900208', '932462318447', '{FS_people_栏目最新新闻列表_傣乡资讯}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=9,FS:NewsType=Last,FS:ClassID=715047079358,FS:TitleNumer=40,FS:isSub=true][#FS:StyleID=802049782202][/FS:Loop]', '', '12-24-2009 14:38:07.360', 0, 0, 0, '0', NULL UNION
	SELECT 171, '931025896141', '932462318447', '{FS_people_栏目幻灯}', '[FS:Loop,FS:SiteID=0,FS:LabelType=FlashFilt,FS:FlashType=default,FS:Number=5,FS:ClassID=-1,FS:Flashweight=300,FS:Flashheight=225,FS:FlashBG=FFFFFF,FS:ShowTitle=false][/FS:Loop]', '', '01-04-2010 13:08:19.590', 0, 0, 0, '0', NULL UNION
	SELECT 172, '466205934303', '932462318447', '{FS_people_栏目_图片新闻}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=4,FS:NewsType=Last,FS:ClassID=-1,FS:Cols=1,FS:Desc=desc,FS:DescType=date,FS:isPic=true,FS:TitleNumer=26][#FS:StyleID=309420374665][/FS:Loop]', '', '01-04-2010 13:46:48.607', 0, 0, 0, '0', NULL UNION
	SELECT 173, '454531792493', '932462318447', '{FS_people_栏目_点击排行}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=10,FS:NewsType=list,FS:ClassID=-1,FS:SubNews=false,FS:Desc=desc,FS:DescType=click,FS:TitleNumer=26,FS:isSub=false][#FS:StyleID=802049782202][/FS:Loop]', '', '01-04-2010 14:40:32.107', 0, 0, 0, '0', NULL UNION
	SELECT 174, '704377192356', '932462318447', '{FS_people_栏目_新闻列表}', '[FS:Loop,FS:SiteID=0,FS:LabelType=ClassList,FS:ListType=News,FS:isSub=false,FS:SubNews=false,FS:Desc=desc,FS:DescType=date,FS:TitleNumer=50,FS:ContentNumber=200,FS:isDiv=true,FS:PageStyle=2$$12$][#FS:StyleID=328687792004][/FS:Loop]', '', '01-04-2010 16:27:38.547', 0, 0, 0, '0', NULL UNION
	SELECT 175, '353567284416', '932462318447', '{FS_people_page_title}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=ReadNews][#FS:StyleID=101260336917][/FS:unLoop]', '', '01-05-2010 10:20:28.140', 0, 0, 0, '0', NULL UNION
	SELECT 176, '961667998229', '932462318447', '{FS_people_page_newscontent}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=ReadNews][#FS:StyleID=688797013663][/FS:unLoop]', '', '01-05-2010 10:37:24.563', 0, 0, 0, '0', NULL UNION
	SELECT 177, '830311161382', '932462318447', '{FS_people_page_pictures}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=4,FS:NewsType=Last,FS:ClassID=-1,FS:Cols=1,FS:Desc=desc,FS:DescType=date,FS:isPic=true,FS:TitleNumer=18][#FS:StyleID=769696426159][/FS:Loop]', '', '01-05-2010 11:22:10.517', 0, 0, 0, '0', NULL UNION
	SELECT 178, '287412288293', '932462318447', '{FS_people_video_pictureNews}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=6,FS:NewsType=Last,FS:TitleNumer=16,FS:ClassID=918316733085][#FS:StyleID=443148212794][/FS:Loop]', '', '01-11-2010 09:06:50.280', 0, 0, 0, '0', NULL UNION
	SELECT 179, '341936138046', '932462318447', '{FS_people_video_pSpecialNews}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=6,FS:NewsType=Last,FS:TitleNumer=16,FS:ClassID=628950861675][#FS:StyleID=443148212794][/FS:Loop]', '', '01-11-2010 09:08:49.610', 0, 0, 0, '0', NULL UNION
	SELECT 180, '904921787555', '932462318447', '{FS_people_video_news}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=10,FS:NewsType=Last,FS:ClassID=918316733085,FS:TitleNumer=40][#FS:StyleID=523444493371][/FS:Loop]', '', '01-11-2010 09:54:00.390', 0, 0, 0, '0', NULL UNION
	SELECT 181, '316816277434', '932462318447', '{FS_people_audio_flash}', '[FS:Loop,FS:SiteID=0,FS:LabelType=FlashFilt,FS:FlashType=default,FS:Number=5,FS:ClassID=-1,FS:Flashweight=476,FS:Flashheight=300,FS:FlashBG=FFFFFF,FS:ShowTitle=false][/FS:Loop]', '', '01-11-2010 13:07:01.860', 0, 0, 0, '0', NULL UNION
	SELECT 182, '274563689444', '932462318447', '{FS_people_audio_newslist}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=15,FS:NewsType=Last,FS:ClassID=780931872925,FS:TitleNumer=50][#FS:StyleID=802049782202][/FS:Loop]', '', '01-11-2010 13:33:49.937', 0, 0, 0, '0', NULL UNION
	SELECT 183, '953150910326', '932462318447', '{FS_people_audio_musicNewlist}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=15,FS:NewsType=Last,FS:ClassID=284097771334,FS:TitleNumer=48][#FS:StyleID=802049782202][/FS:Loop]', '', '01-11-2010 13:54:52.233', 0, 0, 0, '0', NULL UNION
	SELECT 184, '056725227062', '932462318447', '{FS_people_audio_点击排行}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=12,FS:NewsType=list,FS:ClassID=442378444275,FS:SubNews=false,FS:Desc=desc,FS:DescType=click,FS:TitleNumer=46,FS:isSub=true][#FS:StyleID=802049782202][/FS:Loop]', '', '01-11-2010 14:00:29.220', 0, 0, 0, '0', NULL UNION
	SELECT 185, '354361815089', '932462318447', '{FS_people_首页顶部横图}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=adJS,FS:JSID=400787548774755][/FS:unLoop]', '', '01-13-2010 08:59:17.563', 0, 0, 0, '0', NULL UNION
	
	SELECT 186, '291639681900', '932462318447', '{FS_people_作者来源日期点击数}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=ReadNews][#FS:StyleID=434605587223][/FS:unLoop]', '', '03-16-2009 13:28:21.843', 0, 0, 0, '0', NULL UNION
	SELECT 187, '952235343290', '932462318447', '{FS_people_现在位置}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=Position,FS:DynChar=&gt;][/FS:unLoop]', '', '03-17-2009 14:17:08.657', 0, 0, 0, '0', NULL UNION
	SELECT 188, '396674502113', '932462318447', '{FS_people_幻灯新闻}', '[FS:Loop,FS:SiteID=0,FS:LabelType=FlashFilt,FS:FlashType=default,FS:Number=5,FS:ClassID=-1,FS:Flashweight=401,FS:Flashheight=300,FS:FlashBG=FFFFFF,FS:ShowTitle=false][/FS:Loop]', '', '04-08-2009 14:06:57.280', 0, 0, 0, '0', NULL UNION
	SELECT 189, '026480228790', '932462318447', '{FS_people_文字头条}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=TodayWord,FS:ClassID=1,FS:isBIGT=true,FS:bigTitleNumber=30,FS:Cols=1,FS:TitleNumer=40,FS:WNum=1][/FS:unLoop]', '', '04-08-2009 14:49:16.297', 0, 0, 0, '0', NULL UNION
	SELECT 190, '881009283075', '932462318447', '{FS_people_首页点击排行}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=19,FS:NewsType=list,FS:ClassID=-1,FS:SubNews=false,FS:Desc=desc,FS:DescType=click,FS:TitleNumer=36,FS:isSub=false][#FS:StyleID=802049782202][/FS:Loop]', '', '04-13-2009 08:54:30.890', 0, 0, 0, '0', NULL UNION
	SELECT 191, '690687354925', '932462318447', '{FS_people_友情链接}', '[FS:Loop,FS:SiteID=0,FS:LabelType=Frindlink,FS:TypeClassID=5091039536,FS:Number=80,FS:Cols=7,FS:FType=1][/FS:Loop]', '', '04-13-2009 15:49:36.890', 0, 0, 0, '0', NULL UNION
	SELECT 192, '204158600212', '932462318447', '{FS_people_栏目导航}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=ClassNavi][/FS:unLoop]', '', '04-17-2009 09:44:03.407', 0, 0, 0, '0', NULL UNION
	SELECT 193, '731576407696', '932462318447', '{FS_people_滚动新闻}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=3,FS:NewsType=MarQuee,FS:ClassID=-1,FS:TitleNumer=200,FS:ContentNumber=0][#FS:StyleID=050012993312][/FS:Loop]', '', '07-22-2009 20:03:51.017', 0, 0, 0, '0', NULL UNION
	SELECT 194, '714325668616', '932462318447', '{FS_people_栏目最新新闻列表_要闻报道}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=12,FS:NewsType=Last,FS:ClassID=803851363923,FS:TitleNumer=40,FS:isSub=true][#FS:StyleID=802049782202][/FS:Loop]', '', '09-01-2009 10:17:02.093', 0, 0, 0, '0', NULL UNION
	SELECT 195, '146431048372', '932462318447', '{FS_people_栏目最新新闻列表_社会论坛}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=12,FS:NewsType=Last,FS:ClassID=154284819893,FS:TitleNumer=40,FS:isSub=true][#FS:StyleID=802049782202][/FS:Loop]', '', '09-01-2009 10:56:17.750', 0, 0, 0, '0', NULL UNION
	SELECT 196, '512788537385', '932462318447', '{FS_people_版权声明}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=ReadNews][#FS:StyleID=986563668614][/FS:unLoop]', '', '09-18-2009 14:05:40.657', 0, 0, 0, '0', NULL UNION
	SELECT 197, '743075137461', '932462318447', '{FS_people_带参考标题的新闻列表}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=10,FS:NewsType=Rec,FS:ClassID=-1,FS:SubNews=false,FS:Cols=1,FS:Desc=desc,FS:DescType=date,FS:TitleNumer=40,FS:HashNaviContent=false,FS:isSub=false][#FS:StyleID=837883304080][/FS:Loop]', '', '10-22-2009 11:13:28.747', 0, 0, 0, '0', NULL UNION
	SELECT 198, '928833445917', '932462318447', '{FS_people_民族宗教图文}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=2,FS:NewsType=Last,FS:ClassID=074880008639,FS:Cols=1,FS:Desc=desc,FS:DescType=date,FS:isPic=true,FS:TitleNumer=14][#FS:StyleID=009016332516][/FS:Loop]', '', '10-28-2009 16:30:50.127', 0, 0, 0, '0', NULL UNION
	SELECT 199, '002022461200', '932462318447', '{FS_people_旅游资讯图文}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=6,FS:NewsType=Last,FS:ClassID=398090726902,FS:Cols=1,FS:Desc=desc,FS:DescType=date,FS:isPic=true,FS:TitleNumer=20][#FS:StyleID=009016332516][/FS:Loop]', '', '10-28-2009 16:32:06.200', 0, 0, 0, '0', NULL UNION
	SELECT 200, '392865009256', '932462318447', '{FS_people_文化生活图文}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=2,FS:NewsType=Last,FS:ClassID=931312341270,FS:Cols=1,FS:Desc=desc,FS:DescType=date,FS:isPic=true,FS:TitleNumer=14][#FS:StyleID=009016332516][/FS:Loop]', '', '10-28-2009 16:32:36.757', 0, 0, 0, '0', NULL UNION
	SELECT 201, '324310793293', '932462318447', '{FS_people_贝叶文化图文}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=6,FS:NewsType=Last,FS:ClassID=939459291685,FS:Cols=1,FS:Desc=desc,FS:DescType=date,FS:isPic=true,FS:TitleNumer=20][#FS:StyleID=009016332516][/FS:Loop]', '', '10-29-2009 15:02:17.110', 0, 0, 0, '0', NULL UNION
	SELECT 202, '173539481079', '932462318447', '{FS_东盟瞭望栏目url}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=ClassNavi,FS:ClassID=532001601801,FS:ClassUrl=1][#FS:StyleID=794055574458][/FS:unLoop]', '', '2010-02-26 16:36:36.280', 0, 0, 0, '0', NULL UNION
	SELECT 203, '419943644641', '932462318447', '{FS_社会论坛栏目url}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=ClassNavi,FS:ClassID=154284819893,FS:ClassUrl=1][#FS:StyleID=794055574458][/FS:unLoop]', '', '2010-02-26 16:36:36.280', 0, 0, 0, '0', NULL UNION
	SELECT 204, '380125976475', '932462318447', '{FS_要闻报道栏目url}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=ClassNavi,FS:ClassID=803851363923,FS:ClassUrl=1][#FS:StyleID=794055574458][/FS:unLoop]', '', '2010-02-26 16:36:36.280', 0, 0, 0, '0', NULL UNION
	SELECT 205, '569572494405', '932462318447', '{FS_音频新闻url}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=ClassNavi,FS:ClassID=780931872925,FS:ClassUrl=1][#FS:StyleID=794055574458][/FS:unLoop]', '', '2010-02-26 16:36:36.280', 0, 0, 0, '0', NULL UNION
	SELECT 206, '025841987429', '932462318447', '{FS_视频新闻url}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=ClassNavi,FS:ClassID=918316733085,FS:ClassUrl=1][#FS:StyleID=794055574458][/FS:unLoop]', '', '2010-02-26 16:36:36.280', 0, 0, 0, '0', NULL UNION
	
	SELECT 207, '433545251898', '932462318447', '{FS_people_滚动图片}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=6,FS:NewsType=list,FS:ClassID=803851363923,154284819893,715047079358] <a target="_blank" href="{#URL}"><img alt="" src="{#Picture}" /></a>[/FS:Loop]', '', '2010-02-26 16:36:36.280', 0, 0, 0, '0', NULL UNION
	SELECT 208, '507811857505', '932462318447', '{FS_people_滚视频栏目动图片}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=6,FS:NewsType=list,FS:ClassID=169134870432,FS:isSub=true]<a target="_blank" href="{#URL}"><img alt="" src="{#Picture}" /></a>[/FS:Loop]', '', '2010-02-26 16:36:36.280', 0, 0, 0, '0', NULL UNION
	SELECT 209, '218843635946', '932462318447', '{FS_people_幻灯广告L}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=3,FS:NewsType=MarQuee,FS:IsAdver=1,FS:ClassID=111622483303]imagePathL.push("{#Picture}"); linkPathL.push("{#URL}");[/FS:Loop]', '', '2010-02-26 16:36:36.280', 0, 0, 0, '0', NULL UNION
	SELECT 210, '163580242361', '932462318447', '{FS_people_幻灯广告R}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=3,FS:NewsType=Hot,FS:IsAdver=1,FS:ClassID=111622483303]imagePath.push("{#Picture}"); linkPath.push("{#URL}");[/FS:Loop]', '', '2010-02-26 16:36:36.280', 0, 0, 0, '0', NULL UNION
	SELECT 211, '473620588169', '932462318447', '{FS_people_上部中间广告}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=1,FS:NewsType=Jnews,FS:IsAdver=1,FS:ClassID=111622483303]<a target="_blank" href="{#URL}"><img alt="" src="{#Picture}"  style="height:60px; width:625px;" /></a>[/FS:Loop]', '', '2010-02-26 16:36:36.280', 0, 0, 0, '0', NULL UNION
	SELECT 212, '560800844319', '932462318447', '{FS_people_中间广告}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=1,FS:NewsType=ANN,FS:IsAdver=1,FS:ClassID=111622483303]<a target="_blank" href="{#URL}"><img alt="" src="{#Picture}"  style="height:60px; width:980px;" /></a>[/FS:Loop]', '', '2010-02-26 16:36:36.280', 0, 0, 0, '0', NULL UNION
	SELECT 213, '894544304814', '932462318447', '{FS_people_下部广告}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=1,FS:NewsType=Tnews,FS:IsAdver=1,FS:ClassID=111622483303]<a target="_blank" href="{#URL}"><img alt="" src="{#Picture}"  style="height:60px; width:980px;" /></a>[/FS:Loop]', '', '2010-02-26 16:36:36.280', 0, 0, 0, '0', NULL
SET IDENTITY_INSERT [dbo].[fs_sys_Label] OFF
GO


UPDATE    fs_news_Class
SET               ClassTemplet = '/Templets/people_xxbn/list.htm', ReadNewsTemplet = '/Templets/people_xxbn/aticle.htm' 
WHERE     (isPage = 0) AND (NaviShowtf = 1)
GO

UPDATE    fs_news
SET  Templet = '/Templets/people_xxbn/aticle.htm'
WHERE  ClassID IN (
'803851363923',
'154284819893',
'715047079358',
'665030062151',
'878924867746',
'931312341270',
'922157719584',
'532001601801',
'398090726902',
'939459291685',
'074880008639',
'423565744168',
'442378444275',
'169134870432',
'918316733085',
'628950861675',
'780931872925',
'284097771334',
'780931872925',
'284097771334',
'918316733085',
'628950861675'
)

GO


UPDATE fs_sys_Label SET  LabelID = '325658182381' WHERE Id = 186
UPDATE fs_sys_Label SET  LabelID = '308725562781' WHERE Id = 187
UPDATE fs_sys_Label SET  LabelID = '660895525922' WHERE Id = 188
UPDATE fs_sys_Label SET  LabelID = '770160992176' WHERE Id = 189
UPDATE fs_sys_Label SET  LabelID = '864479590182' WHERE Id = 190
UPDATE fs_sys_Label SET  LabelID = '163362933251' WHERE Id = 191
UPDATE fs_sys_Label SET  LabelID = '477056766806' WHERE Id = 192
UPDATE fs_sys_Label SET  LabelID = '889685452715' WHERE Id = 193

UPDATE fs_sys_Label SET  LabelID = '470594143121' WHERE Id = 195
UPDATE fs_sys_Label SET  LabelID = '847211692270' WHERE Id = 196
UPDATE fs_sys_Label SET  LabelID = '248426919670' WHERE Id = 197
UPDATE fs_sys_Label SET  LabelID = '674829962647' WHERE Id = 198
UPDATE fs_sys_Label SET  LabelID = '377053484730' WHERE Id = 199
UPDATE fs_sys_Label SET  LabelID = '430624624878' WHERE Id = 200
UPDATE fs_sys_Label SET  LabelID = '797490446086' WHERE Id = 201
GO

UPDATE fs_sys_Label SET Label_Content = '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=9,FS:NewsType=list,FS:ClassID=-1,FS:SubNews=false,FS:Desc=desc,FS:DescType=click,FS:TitleNumer=36,FS:isSub=false][#FS:StyleID=802049782202][/FS:Loop]'
WHERE Id = 190
GO

SET IDENTITY_INSERT [dbo].[fs_sys_Label] ON

INSERT INTO [dbo].[fs_sys_Label] (
	[Id],
	[LabelID],
	[ClassID],
	[Label_Name],
	[Label_Content],
	[Description],
	[CreatTime],
	[isBack],
	[isRecyle],
	[isSys],
	[SiteID],
	[isShare]
)
	
	SELECT 214, '993197252155', '882324941476', '{FS_农业之窗栏目url}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=ClassNavi,FS:ClassID=665030062151,FS:ClassUrl=1][#FS:StyleID=794055574458][/FS:unLoop]', '', '2010-02-26 16:36:36.280', 0, 0, 0, '0', NULL UNION
	SELECT 215, '743438153926', '932462318447', '{FS_people_栏目最新新闻列表_农业之窗}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=8,FS:NewsType=Last,FS:ClassID=665030062151,FS:TitleNumer=40,FS:isSub=true][#FS:StyleID=802049782202][/FS:Loop]', '', '09-01-2009 10:17:02.093', 0, 0, 0, '0', NULL 
SET IDENTITY_INSERT [dbo].[fs_sys_Label] OFF
GO


UPDATE fs_api_navi SET
siteID = '0'
WHERE     (Am_position = '00000') AND (siteID <> '0')

UPDATE fs_api_navi SET
isActive = 1
WHERE     (isActive = 0)
GO








SET IDENTITY_INSERT [dbo].[fs_sys_LabelStyle] ON

INSERT INTO [dbo].[fs_sys_LabelStyle] (
	[Id],
	[styleID],
	[ClassID],
	[StyleName],
	[Content],
	[Description],
	[CreatTime],
	[isRecyle],
	[SiteID]
)
	SELECT 60, '709111686266', '793747591275', '音频栏目链接', N'<a target="_blank" href="{#class_Path}">ᦃ ᦊᦻ ᦵᦉᧂ ᦅᧄ ᦺᦑ</a>', '', '08-2-2010 13:26:48.843', 0, '0' UNION
	SELECT 61, '074208104373', '793747591275', '视频栏目链接', N'<a target="_blank" href="{#class_Path}">ᦃᦱᧁᧈ ᦉᦱᧃ ᦺᦖᧈ ᦅᧄ ᦺᦑ</a>', '', '08-11-2010 13:30:45.250', 0, '0'

SET IDENTITY_INSERT [dbo].[fs_sys_LabelStyle] OFF
GO


UPDATE fs_sys_Label SET Label_Content = '[FS:unLoop,FS:SiteID=0,FS:LabelType=ClassNavi,FS:ClassID=442378444275,FS:ClassUrl=1][#FS:StyleID=709111686266][/FS:unLoop]'
WHERE Id = 145
GO


UPDATE fs_sys_Label SET Label_Content = '[FS:unLoop,FS:SiteID=0,FS:LabelType=ClassNavi,FS:ClassID=169134870432,FS:ClassUrl=1][#FS:StyleID=074208104373][/FS:unLoop]'
WHERE Id = 142
GO









SET IDENTITY_INSERT [dbo].[fs_sys_LabelStyle] ON

INSERT INTO [dbo].[fs_sys_LabelStyle] (
	[Id],
	[styleID],
	[ClassID],
	[StyleName],
	[Content],
	[Description],
	[CreatTime],
	[isRecyle],
	[SiteID]
)
	
	SELECT 62, '052375420350', '793747591275', '文字新闻列表中的单条新闻li', '<li><a target="_blank" href="{#URL}">{#Title}</a></li>', '', '11-06-2010 17:22:14.750', 0, '0' UNION
	SELECT 63, '669377768571', '793747591275', '单条文字新闻', '<a target="_blank" href="{#URL}">{#Title}</a>', '', '11-06-2010 17:24:43.983', 0, '0' UNION
	SELECT 64, '939152689248', '793747591275', '单条图片新闻', '<li>' + CHAR(13) + CHAR(10) + '<div class="phototitle">{#class_Name}</div>' + CHAR(13) + CHAR(10) + '<div><a target="_blank" href="{#URL}"><img title="{#Title}" alt="{#Title}" src="{#Picture}" /></a></div>' + CHAR(13) + CHAR(10) + '<div class="photodesc"><a target="_blank" href="{#URL}">{#Title}</a></div>' + CHAR(13) + CHAR(10) + '</li>', '', '11-06-2010 21:18:04.627', 0, '0'

SET IDENTITY_INSERT [dbo].[fs_sys_LabelStyle] OFF





SET IDENTITY_INSERT [dbo].[fs_news_Class] ON

INSERT INTO [dbo].[fs_news_Class] (
	[Id],
	[ClassID],
	[ClassCName],
	[ClassEName],
	[ParentID],
	[IsURL],
	[OrderID],
	[URLaddress],
	[Domain],
	[ClassTemplet],
	[ReadNewsTemplet],
	[SavePath],
	[SaveClassframe],
	[Checkint],
	[ClassSaveRule],
	[ClassIndexRule],
	[NewsSavePath],
	[NewsFileRule],
	[PicDirPath],
	[ContentPicTF],
	[ContentPICurl],
	[ContentPicSize],
	[InHitoryDay],
	[DataLib],
	[SiteID],
	[NaviShowtf],
	[NaviPIC],
	[NaviContent],
	[MetaKeywords],
	[MetaDescript],
	[isDelPoint],
	[Gpoint],
	[iPoint],
	[GroupNumber],
	[FileName],
	[isLock],
	[isRecyle],
	[NaviPosition],
	[NewsPosition],
	[isComm],
	[Defineworkey],
	[CreatTime],
	[isPage],
	[PageContent],
	[ModelID],
	[isunHTML],
	[ClassCNameRefer]
)
	
	SELECT 78, '877371801667', N'图片新闻', 'photo', '0', 0, 10, '', '', '/Templets/xxbn/dw_list.htm', '/Templets/xxbn/dw_content.html', '/html/xxbn', '', 0, 'photo/index.html', '{@year04}{@month}{@day}', '{@year04}{@month}{@day}', '{@自动编号ID}', '/{@dirFile}', 0, '', '|', 180, 'fs_News', '0', 0, '', '', '', '', 0, 0, 0, '', '.html', 0, 0, '<a href="/">首页</a> >>  图片新闻 ', '<a href="/">首页</a> >>  <a href="/html/xxbn/photo/index.html">图片新闻</a> >> 正文', 0, '', '11-06-2010 20:56:06.203', 0, NULL, '0', 1, '图片新闻' UNION
	SELECT 79, '506685532107', N'ᦔᦳᧂᧈ ᦷᦣᧇ ᦵᦵᦕᧈ ᦃᦱᧁᧈ ᦉᦱᧃ', 'Newsphoto', '877371801667', 0, 10, '', '', '/Templets/xxbn/dw_list.htm', '/Templets/xxbn/dw_content.html', '/html/xxbn', '', 0, 'newsphoto/index.html', '{@year04}{@month}{@day}', '{@year04}{@month}{@day}', '{@自动编号ID}', '/{@dirFile}', 0, '', '|', 180, 'fs_News', '0', 0, '', '', '', '', 0, 0, 0, '', '.html', 0, 0, '<a href="/">ᦐᦱᧉ ᦷᦠ ᦒᦲ</a>  >>  ᦔᦳᧂᧈ ᦷᦣᧇ ᦵᦵᦕᧈ ᦃᦱᧁᧈ ᦉᦱᧃ ', '<a href="/">ᦐᦱᧉ ᦷᦠ ᦒᦲ</a>  >>  <a href="/html/xxbn/Newsphoto/index.html"> ᦔᦳᧂᧈ ᦷᦣᧇ ᦵᦵᦕᧈ ᦃᦱᧁᧈ ᦉᦱᧃ </a> >> ᦆᦱᧁᧈ ᦺᦓ', 0, '', '11-06-2010 20:57:42.860', 0, NULL, '0', 0, '图片报道' UNION
	SELECT 80, '313300675453', N'ᦃᦱᧁᧈ ᦉᦱᧃ ᦋᦸᧂᧈ ᦂᦱᧃ', 'specialreports', '877371801667', 0, 10, '', '', '/Templets/xxbn/dw_list.htm', '/Templets/xxbn/dw_content.html', '/html/xxbn', '', 0, 'specialreports/index.html', '{@year04}{@month}{@day}', '{@year04}{@month}{@day}', '{@自动编号ID}', '/{@dirFile}', 0, '', '|', 180, 'fs_News', '0', 0, '', '', '', '', 0, 0, 0, '', '.html', 0, 0, '<a href="/">ᦐᦱᧉ ᦷᦠ ᦒᦲ</a> >>  ᦃᦱᧁᧈ ᦉᦱᧃ ᦋᦸᧂᧈ ᦂᦱᧃ', '<a href="/">ᦐᦱᧉ ᦷᦠ ᦒᦲ</a> >>   <a href="/html/xxbn/specialreports/index.html"> ᦃᦱᧁᧈ ᦉᦱᧃ ᦋᦸᧂᧈ ᦂᦱᧃ</a> >> ᦆᦱᧁᧈ ᦺᦓ', 0, '', '11-06-2010 20:58:37.390', 0, NULL, '0', 0, '专题报道' UNION
	SELECT 81, '909471200613', N'ᦵᦵᦕᧈ ᦂᦱᧃ ᦌᦲᧈ ᦵᦵᦓᧉ', 'enterprise', '877371801667', 0, 10, '', '', '/Templets/xxbn/dw_list.htm', '/Templets/xxbn/dw_content.html', '/html/xxbn', '', 0, 'enterprise/index.html', '{@year04}{@month}{@day}', '{@year04}{@month}{@day}', '{@自动编号ID}', '/{@dirFile}', 0, '', '|', 180, 'fs_News', '0', 0, '', '', '', '', 0, 0, 0, '', '.html', 0, 0, '<a href="/">ᦐᦱᧉ ᦷᦠ ᦒᦲ</a>  >>  ᦵᦵᦕᧈ ᦂᦱᧃ ᦌᦲᧈ ᦵᦵᦓᧉ  ', '<a href="/">ᦐᦱᧉ ᦷᦠ ᦒᦲ</a> >>  <a href="/html/xxbn/enterprise/index.html"> ᦵᦵᦕᧈ ᦂᦱᧃ ᦌᦲᧈ ᦵᦵᦓᧉ </a> >> ᦆᦱᧁᧈ ᦺᦓ', 0, '', '11-06-2010 20:59:21.203', 0, NULL, '0', 0, '企业展示' UNION
	SELECT 82, '632235781915', N'ᦂᦱᧃ ᦷᦎᧇ ᦔᦳᧂᧈ ᦷᦣᧇ', 'photocircle', '877371801667', 0, 10, '', '', '/Templets/xxbn/dw_list.htm', '/Templets/xxbn/dw_content.html', '/html/xxbn', '', 0, 'photocircle/index.html', '{@year04}{@month}{@day}', '{@year04}{@month}{@day}', '{@自动编号ID}', '/{@dirFile}', 0, '', '|', 180, 'fs_News', '0', 0, '', '', '', '', 0, 0, 0, '', '.html', 0, 0, '<a href="/">ᦐᦱᧉ ᦷᦠ ᦒᦲ</a> >>  ᦂᦱᧃ ᦷᦎᧇ ᦔᦳᧂᧈ ᦷᦣᧇ ', '<a href="/">ᦐᦱᧉ ᦷᦠ ᦒᦲ</a> >>  <a href="/html/xxbn/photocircle/index.html"> ᦂᦱᧃ ᦷᦎᧇ ᦔᦳᧂᧈ ᦷᦣᧇ </a> >> ᦆᦱᧁᧈ ᦺᦓ', 0, '', '11-06-2010 21:01:22.530', 0, NULL, '0', 0, '摄影天地' UNION
	SELECT 83, '541449285473', N'ᦩᦱᧄ ᦣᦴᧉ ᦃᦸᧉ ᦊᦴᧈ ᦣᦱᧁ ᦂᦲᧃ', 'culture', '877371801667', 0, 10, '', '', '/Templets/xxbn/dw_list.htm', '/Templets/xxbn/dw_content.html', '/html/xxbn', '', 0, 'culture/index.html', '{@year04}{@month}{@day}', '{@year04}{@month}{@day}', '{@自动编号ID}', '/{@dirFile}', 0, '', '|', 180, 'fs_News', '0', 0, '', '', '', '', 0, 0, 0, '', '.html', 0, 0, '<a href="/">ᦐᦱᧉ ᦷᦠ ᦒᦲ</a> >>  ᦩᦱᧄ ᦣᦴᧉ ᦃᦸᧉ ᦊᦴᧈ ᦣᦱᧁ ᦂᦲᧃ', '<a href="/">ᦐᦱᧉ ᦷᦠ ᦒᦲ</a> >>  <a href="/html/xxbn/culture/index.html">   ᦩᦱᧄ ᦣᦴᧉ ᦃᦸᧉ ᦊᦴᧈ ᦣᦱᧁ ᦂᦲᧃ </a> >> ᦆᦱᧁᧈ ᦺᦓ', 0, '', '11-06-2010 21:02:07.030', 0, NULL, '0', 0, '文化生活'

SET IDENTITY_INSERT [dbo].[fs_news_Class] OFF








SET IDENTITY_INSERT [dbo].[fs_sys_Label] ON

INSERT INTO [dbo].[fs_sys_Label] (
	[Id],
	[LabelID],
	[ClassID],
	[Label_Name],
	[Label_Content],
	[Description],
	[CreatTime],
	[isBack],
	[isRecyle],
	[isSys],
	[SiteID],
	[isShare]
)
	
	SELECT 216, '370000793310', '882324941476', '{FS_要闻报道最新1条}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=1,FS:NewsType=Last,FS:ClassID=803851363923,FS:isDiv=true,FS:TitleNumer=60][#FS:StyleID=669377768571][/FS:Loop]', '', '11-06-2010 18:09:42.470', 0, 0, 0, '0', NULL UNION
	SELECT 217, '530995926653', '882324941476', '{FS_社会新闻最新1条}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=1,FS:NewsType=Last,FS:ClassID=922157719584,FS:isDiv=true,FS:TitleNumer=60][#FS:StyleID=669377768571][/FS:Loop]', '', '11-06-2010 18:10:16.517', 0, 0, 0, '0', NULL UNION
	SELECT 218, '410731892527', '882324941476', '{FS_东盟瞭望最新1条}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=1,FS:NewsType=Last,FS:ClassID=532001601801,FS:isDiv=true,FS:TitleNumer=60][#FS:StyleID=669377768571][/FS:Loop]', '', '11-06-2010 18:10:37.360', 0, 0, 0, '0', NULL UNION
	SELECT 219, '584790144899', '882324941476', '{FS_科技动态最新1条}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=1,FS:NewsType=Last,FS:ClassID=878924867746,FS:isDiv=true,FS:TitleNumer=60][#FS:StyleID=669377768571][/FS:Loop]', '', '11-06-2010 18:10:57.877', 0, 0, 0, '0', NULL UNION
	SELECT 220, '087247430740', '882324941476', '{FS_农业之窗最新1条}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=1,FS:NewsType=Last,FS:ClassID=665030062151,FS:isDiv=true,FS:TitleNumer=60][#FS:StyleID=669377768571][/FS:Loop]', '', '11-06-2010 18:11:20.377', 0, 0, 0, '0', NULL UNION
	SELECT 221, '199539218513', '882324941476', '{FS_要闻报道列表9条长标题}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=9,FS:NewsType=Last,FS:StartIndex=1,FS:ClassID=803851363923,FS:isDiv=true,FS:TitleNumer=63][#FS:StyleID=052375420350][/FS:Loop]', '', '11-06-2010 18:15:38.187', 0, 0, 0, '0', NULL UNION
	SELECT 222, '730526346212', '882324941476', '{FS_社会新闻列表9条长标题}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=9,FS:NewsType=Last,FS:StartIndex=1,FS:ClassID=922157719584,FS:isDiv=true,FS:TitleNumer=64][#FS:StyleID=052375420350][/FS:Loop]', '', '11-06-2010 18:16:00.627', 0, 0, 0, '0', NULL UNION
	SELECT 223, '182185405366', '882324941476', '{FS_东盟瞭望列表9条长标题}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=9,FS:NewsType=Last,FS:StartIndex=1,FS:ClassID=532001601801,FS:isDiv=true,FS:TitleNumer=60][#FS:StyleID=052375420350][/FS:Loop]', '', '11-06-2010 18:17:27.063', 0, 0, 0, '0', NULL UNION
	SELECT 224, '655901437567', '882324941476', '{FS_科技动态列表9条长标题}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=9,FS:NewsType=Last,FS:StartIndex=1,FS:ClassID=878924867746,FS:isDiv=true,FS:TitleNumer=60][#FS:StyleID=052375420350][/FS:Loop]', '', '11-06-2010 18:17:51.030', 0, 0, 0, '0', NULL UNION
	SELECT 225, '385825963195', '882324941476', '{FS_农业之窗列表9条长标题}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=9,FS:NewsType=Last,FS:StartIndex=1,FS:ClassID=665030062151,FS:isDiv=true,FS:TitleNumer=70][#FS:StyleID=052375420350][/FS:Loop]', '', '11-06-2010 18:18:12.843', 0, 0, 0, '0', NULL UNION
	SELECT 226, '243549783472', '882324941476', '{FS_固定图片报道最新1条}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=1,FS:NewsType=Last,FS:ClassID=506685532107,FS:IsAdver=1,FS:isDiv=true,FS:TitleNumer=30][#FS:StyleID=939152689248][/FS:Loop]', '', '11-06-2010 21:21:52.640', 0, 0, 0, '0', NULL UNION
	SELECT 227, '781428956434', '882324941476', '{FS_固定专题报道最新1条}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=1,FS:NewsType=Last,FS:ClassID=313300675453,FS:IsAdver=1,FS:isDiv=true,FS:TitleNumer=30][#FS:StyleID=939152689248][/FS:Loop]', '', '11-06-2010 21:22:12.640', 0, 0, 0, '0', NULL UNION
	SELECT 228, '973015180426', '882324941476', '{FS_固定企业展示最新1条}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=1,FS:NewsType=Last,FS:ClassID=909471200613,FS:IsAdver=1,FS:isDiv=true,FS:TitleNumer=30][#FS:StyleID=939152689248][/FS:Loop]', '', '11-06-2010 21:22:33.563', 0, 0, 0, '0', NULL UNION
	SELECT 229, '990222394137', '882324941476', '{FS_固定摄影天地最新1条}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=1,FS:NewsType=Last,FS:ClassID=632235781915,FS:IsAdver=1,FS:isDiv=true,FS:TitleNumer=30][#FS:StyleID=939152689248][/FS:Loop]', '', '11-06-2010 21:23:01.233', 0, 0, 0, '0', NULL UNION
	SELECT 230, '517309567825', '882324941476', '{FS_固定文化生活最新1条}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=1,FS:NewsType=Last,FS:ClassID=541449285473,FS:IsAdver=1,FS:isDiv=true,FS:TitleNumer=30][#FS:StyleID=939152689248][/FS:Loop]', '', '11-06-2010 21:23:20.077', 0, 0, 0, '0', NULL UNION
	SELECT 231, '144498391847', '882324941476', '{FS_音频栏目Url}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=ReadClass,FS:ClassID=442378444275]{#class_Path}[/FS:unLoop]', '', '11-07-2010 11:04:06.250', 0, 0, 0, '0', NULL UNION
	SELECT 232, '594322482355', '882324941476', '{FS_视频栏目Url}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=ReadClass,FS:ClassID=169134870432]{#class_Path}[/FS:unLoop]', '', '11-07-2010 11:04:27.000', 0, 0, 0, '0', NULL UNION
	SELECT 233, '124285567864', '882324941476', '{FS_视频列表2条}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=2,FS:NewsType=Last,FS:ClassID=169134870432,FS:IsAdver=1,FS:isSub=true,FS:isDiv=true,FS:TitleNumer=46][#FS:StyleID=052375420350][/FS:Loop]', '', '11-07-2010 11:07:43.703', 0, 0, 0, '0', NULL UNION
	SELECT 234, '277568996878', '882324941476', '{FS_贝叶文化列表9条长标题}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=9,FS:NewsType=Last,FS:StartIndex=1,FS:ClassID=939459291685,FS:isDiv=true,FS:TitleNumer=64][#FS:StyleID=052375420350][/FS:Loop]', '', '11-07-2010 18:45:45.953', 0, 0, 0, '0', NULL UNION
	SELECT 235, '915253910144', '882324941476', '{FS_旅游资讯列表9条长标题}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=9,FS:NewsType=Last,FS:StartIndex=1,FS:ClassID=398090726902,FS:isDiv=true,FS:TitleNumer=60][#FS:StyleID=052375420350][/FS:Loop]', '', '11-07-2010 18:46:44.270', 0, 0, 0, '0', NULL UNION
	SELECT 236, '364311286996', '882324941476', '{FS_贝叶文化最新1条}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=1,FS:NewsType=Last,FS:ClassID=939459291685,FS:isDiv=true,FS:TitleNumer=60][#FS:StyleID=669377768571][/FS:Loop]', '', '11-07-2010 18:47:15.547', 0, 0, 0, '0', NULL UNION
	SELECT 237, '921371147832', '882324941476', '{FS_旅游资讯最新1条}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=1,FS:NewsType=Last,FS:ClassID=398090726902,FS:isDiv=true,FS:TitleNumer=60][#FS:StyleID=669377768571][/FS:Loop]', '', '11-07-2010 18:47:43.170', 0, 0, 0, '0', NULL UNION
	SELECT 238, '888764639701', '882324941476', '{FS_社会新闻Url}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=ReadClass,FS:ClassID=922157719584]{#class_Path}[/FS:unLoop]', '', '11-07-2010 21:20:02.650', 0, 0, 0, '0', NULL UNION
	SELECT 239, '209976232633', '882324941476', '{FS_东盟瞭望Url}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=ReadClass,FS:ClassID=532001601801]{#class_Path}[/FS:unLoop]', '', '11-07-2010 21:20:25.530', 0, 0, 0, '0', NULL UNION
	SELECT 240, '395644007921', '882324941476', '{FS_贝叶文化Url}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=ReadClass,FS:ClassID=939459291685]{#class_Path}[/FS:unLoop]', '', '11-07-2010 21:20:53.513', 0, 0, 0, '0', NULL UNION
	SELECT 241, '380207689835', '882324941476', '{FS_旅游资讯Url}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=ReadClass,FS:ClassID=398090726902]{#class_Path}[/FS:unLoop]', '', '11-07-2010 21:21:15.063', 0, 0, 0, '0', NULL UNION
	SELECT 242, '443026726496', '882324941476', '{FS_科技动态Url}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=ReadClass,FS:ClassID=878924867746]{#class_Path}[/FS:unLoop]', '', '11-07-2010 21:21:37.863', 0, 0, 0, '0', NULL

SET IDENTITY_INSERT [dbo].[fs_sys_Label] OFF




-- 2010-11-22



SET IDENTITY_INSERT [dbo].[fs_sys_LabelStyle] ON

INSERT INTO [dbo].[fs_sys_LabelStyle] (
	[Id],
	[styleID],
	[ClassID],
	[StyleName],
	[Content],
	[Description],
	[CreatTime],
	[isRecyle],
	[SiteID]
)
	


	SELECT 66, '655936854624', '793747591275', '栏目新闻列表', '<div class="list">' + CHAR(13) + CHAR(10) + '<h4><a target="_blank" href="{#URL}">{#Title}</a></h4>' + CHAR(13) + CHAR(10) + '<span>{#Content}</span></div>', '', '11-17-2010 16:35:43.280', 0, '0' UNION
	SELECT 67, '706141415769', '793747591275', 'js幻灯之二', '{url:''{#Picture}'',link:''{#URL}'',time:6000,title:''{#Title}'',target:''_blank''},', '', '11-18-2010 18:25:25.843', 0, '0' UNION
	SELECT 68, '588909948029', '793747591275', '单条图片新闻li', '<li><a target="_blank" href="{#URL}"><img alt="" src="{#Picture}" /></a><br />' + CHAR(13) + CHAR(10) + '<a target="_blank" href="{#URL}">{#Title}</a> </li>', '', '11-22-2010 17:48:45.680', 0, '0'


SET IDENTITY_INSERT [dbo].[fs_sys_LabelStyle] OFF




SET IDENTITY_INSERT [dbo].[fs_sys_Label] ON

INSERT INTO [dbo].[fs_sys_Label] (
	[Id],
	[LabelID],
	[ClassID],
	[Label_Name],
	[Label_Content],
	[Description],
	[CreatTime],
	[isBack],
	[isRecyle],
	[isSys],
	[SiteID],
	[isShare]
)
	
		
	SELECT 243, '773799426185', '882324941476', '{FS_JS幻灯新闻}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=5,FS:NewsType=Slide,FS:ClassID=-1,FS:isDiv=true,FS:TitleNumer=30][#FS:StyleID=599860800470][/FS:Loop]', '', '11-09-2010 11:28:20.563', 0, 0, 0, '0', NULL UNION
	SELECT 244, '690656385929', '882324941476', '{FS_民族宗教图文8条}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=8,FS:NewsType=Last,FS:ClassID=074880008639,FS:Cols=1,FS:Desc=desc,FS:DescType=date,FS:isPic=true,FS:TitleNumer=14][#FS:StyleID=038265472400][/FS:Loop]', '', '11-16-2010 17:07:16.923', 0, 0, 0, '0', NULL UNION

	SELECT 245, '619250842704', '882324941476', '{FS_新闻标题}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=ReadNews]{#uTitle}[/FS:unLoop]', '', '11-17-2010 11:14:20.093', 0, 0, 0, '0', NULL UNION
	SELECT 246, '098220862832', '882324941476', N'{FS_新闻来源作者与日期}', N'[FS:unLoop,FS:SiteID=0,FS:LabelType=ReadNews]<span>ᦑᦲᧈ ᦀᦸᧅᧈ ：</span>{#Source} <span>ᦕᦴᧉ ᦵᦵᦎᧄᧉ ：</span>{#Author}<span> ᦔᦲ ᦵᦡᦲᧃ ᦞᧃ ᦍᦱᧄ：</span><span class="normalText">{#DateShort}</span> [/FS:unLoop]', '', '11-17-2010 11:15:48.110', 0, 0, 0, '0', NULL UNION
	SELECT 247, '944325190313', '882324941476', '{FS_本栏目最新的热点新闻10条}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=10,FS:NewsType=Hot,FS:ClassID=0,FS:isDiv=true,FS:TitleNumer=28][#FS:StyleID=052375420350][/FS:Loop]', '', '11-17-2010 11:30:48.877', 0, 0, 0, '0', NULL UNION
	SELECT 248, '885688613519', '882324941476', '{FS_本栏目最新的新闻10条}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=10,FS:NewsType=Last,FS:ClassID=0,FS:isDiv=true,FS:TitleNumer=33][#FS:StyleID=052375420350][/FS:Loop]', '', '11-17-2010 11:31:15.423', 0, 0, 0, '0', NULL UNION
	SELECT 249, '549067697025', '882324941476', '{FS_内容页图片列表}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=2,FS:NewsType=list,FS:ClassID=0,FS:isDiv=true,FS:isPic=true][#FS:StyleID=599860800470][/FS:Loop]', '', '11-17-2010 11:42:07.173', 0, 0, 0, '0', NULL UNION
	SELECT 251, '221727974043', '882324941476', '{FS_栏目导航dai}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=ClassNavi,FS:isDiv=true][/FS:unLoop]', '', '11-17-2010 15:38:32.500', 0, 0, 0, '0', NULL UNION
	SELECT 252, '320370630964', '882324941476', '{FS_栏目新闻导读列表}', '[FS:Loop,FS:SiteID=0,FS:LabelType=ClassList,FS:ListType=News,FS:isSub=false,FS:SubNews=false,FS:Desc=desc,FS:DescType=date,FS:TitleNumer=60,FS:ContentNumber=260,FS:isDiv=true,FS:PageStyle=3$$12$listpager][#FS:StyleID=655936854624][/FS:Loop]', '', '11-17-2010 16:45:08.343', 0, 0, 0, '0', NULL UNION
	SELECT 253, '485431312088', '882324941476', '{FS_JS幻灯新闻之二}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=5,FS:NewsType=Slide,FS:ClassID=-1,FS:isDiv=true,FS:TitleNumer=30][#FS:StyleID=706141415769][/FS:Loop]', '', '11-18-2010 18:26:50.673', 0, 0, 0, '0', NULL UNION
	SELECT 254, '524071111021', '882324941476', '{FS_视频列表1条}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=1,FS:NewsType=Last,FS:ClassID=169134870432,FS:IsAdver=1,FS:isSub=true,FS:isDiv=true,FS:TitleNumer=46][#FS:StyleID=052375420350][/FS:Loop]', '', '11-22-2010 10:02:46.297', 0, 0, 0, '0', NULL UNION
	SELECT 255, '984540175222', '882324941476', '{FS_新闻视频图文列表2}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=12,FS:IsAdver=1,FS:NewsType=Last,FS:TitleNumer=16,FS:ClassID=918316733085][#FS:StyleID=588909948029][/FS:Loop]', '', '11-22-2010 17:50:53.190', 0, 0, 0, '0', NULL UNION
	SELECT 256, '757111984559', '882324941476', '{FS_专题视频图文列表2}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=8,FS:NewsType=Last,FS:TitleNumer=16,FS:IsAdver=1,FS:ClassID=628950861675][#FS:StyleID=588909948029][/FS:Loop]', '', '11-22-2010 17:51:20.853', 0, 0, 0, '0', NULL UNION
	SELECT 257, '195076214566', '882324941476', '{FS_民族传习馆Url}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=ReadClass,FS:ClassID=205641735708]{#class_Path}[/FS:unLoop]', '', '11-23-2010 10:11:14.773', 0, 0, 0, '0', NULL UNION
	SELECT 258, '726847624846', '882324941476', '{FS_最新新闻列表10条}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=10,FS:NewsType=Last,FS:ClassID=-1,FS:Desc=desc,FS:isDiv=true,FS:TitleNumer=32][#FS:StyleID=052375420350][/FS:Loop]', '', '11-23-2010 10:21:59.853', 0, 0, 0, '0', NULL UNION
	SELECT 259, '809550637387', '882324941476', '{FS_民族传习馆最新文章}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=12,FS:NewsType=Last,FS:ClassID=205641735708,FS:Desc=desc,FS:isDiv=true,FS:TitleNumer=32][#FS:StyleID=052375420350][/FS:Loop]', '', '11-23-2010 10:24:46.430', 0, 0, 0, '0', NULL UNION
	SELECT 261, '310040227426', '882324941476', '{FS_民族传习馆图文12条}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=12,FS:IsAdver=1,FS:NewsType=Last,FS:TitleNumer=16,FS:ClassID=205641735708][#FS:StyleID=588909948029][/FS:Loop]', '', '11-23-2010 10:29:39.013', 0, 0, 0, '0', NULL UNION
	SELECT 262, '756284610380', '882324941476', '{FS_商业贸易Url}', '[FS:unLoop,FS:SiteID=0,FS:LabelType=ReadClass,FS:ClassID=263099963046]{#class_Path}[/FS:unLoop]', '', '11-23-2010 16:38:12.363', 0, 0, 0, '0', NULL UNION
	SELECT 263, '868431593562', '882324941476', '{FS_商业贸易最新1条}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=1,FS:NewsType=Last,FS:ClassID=263099963046,FS:isDiv=true,FS:TitleNumer=60][#FS:StyleID=669377768571][/FS:Loop]', '', '11-23-2010 16:38:45.493', 0, 0, 0, '0', NULL UNION
	SELECT 264, '062485766918', '882324941476', '{FS_商业贸易列表9条长标题}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=9,FS:NewsType=Last,FS:StartIndex=1,FS:ClassID=263099963046,FS:isDiv=true,FS:TitleNumer=60][#FS:StyleID=052375420350][/FS:Loop]', '', '11-23-2010 16:39:17.060', 0, 0, 0, '0', NULL




SET IDENTITY_INSERT [dbo].[fs_sys_Label] OFF




-- 2010-11-23


SET IDENTITY_INSERT [dbo].[fs_news_Class] ON

INSERT INTO [dbo].[fs_news_Class] (
	[Id],
	[ClassID],
	[ClassCName],
	[ClassEName],
	[ParentID],
	[IsURL],
	[OrderID],
	[URLaddress],
	[Domain],
	[ClassTemplet],
	[ReadNewsTemplet],
	[SavePath],
	[SaveClassframe],
	[Checkint],
	[ClassSaveRule],
	[ClassIndexRule],
	[NewsSavePath],
	[NewsFileRule],
	[PicDirPath],
	[ContentPicTF],
	[ContentPICurl],
	[ContentPicSize],
	[InHitoryDay],
	[DataLib],
	[SiteID],
	[NaviShowtf],
	[NaviPIC],
	[NaviContent],
	[MetaKeywords],
	[MetaDescript],
	[isDelPoint],
	[Gpoint],
	[iPoint],
	[GroupNumber],
	[FileName],
	[isLock],
	[isRecyle],
	[NaviPosition],
	[NewsPosition],
	[isComm],
	[Defineworkey],
	[CreatTime],
	[isPage],
	[PageContent],
	[ModelID],
	[isunHTML],
	[ClassCNameRefer]
)

	SELECT 85, '205641735708', N'ᦉᦹᧇ ᦉᦸᧃ ᦣᧄᧈ ᦵᦣᧃ  ᦷᦞ ᦠᦱᧃ ᦘᦱ ᦉᦱ', 'nationality', '0', 0, 10, '', '', '/Templets/20101115/T_nationality.htm', '/Templets/xxbn/dw_content.html', '/html/xxbn', '', 0, 'nationality/index.html', '{@year04}{@month}{@day}', '{@year04}{@month}{@day}', '{@自动编号ID}', '/{@dirFile}', 0, '', '|', 180, 'fs_News', '0', 0, '', '', '', '', 0, 0, 0, '', '.html', 0, 0, N'<a href="/">ᦐᦱᧉ ᦷᦠ ᦒᦲ</a> <span class="normalText">>></span>  ᦉᦹᧇ ᦉᦸᧃ ᦣᧄᧈ ᦵᦣᧃ  ᦷᦞ ᦠᦱᧃ ᦘᦱ ᦉᦱ ', '<a href="/">ᦐᦱᧉ ᦷᦠ ᦒᦲ</a> <span class="normalText">>></span>  <a href="/html/xxbn/nationality/index.html">ᦉᦹᧇ ᦉᦸᧃ ᦣᧄᧈ ᦵᦣᧃ  ᦷᦞ ᦠᦱᧃ ᦘᦱ ᦉᦱ</a> <span class="normalText">>></span> ᦆᦱᧁᧈ ᦺᦓ', 0, '', '11-23-2010 09:36:36.247', 0, NULL, '0', 1, '民族传习馆' UNION
	SELECT 86, '263099963046', '商业贸易', 'biz', '0', 0, 10, '', '', '/Templets/20101115/T_column.htm', '/Templets/20101115/T_Content.htm', '/html/xxbn', '', 0, 'biz/index.html', '{@year04}{@month}{@day}', '{@year04}{@month}{@day}', '{@自动编号ID}', '/{@dirFile}', 0, '', '|', 180, 'fs_News', '0', 1, '', '', '', '', 0, 0, 0, '', '.html', 0, 0, N'<a href="/">首页</a> >>  商业贸易 ', '<a href="/">首页</a> >>  <a href="/html/xxbn/biz/index.html">商业贸易</a> >> 正文', 0, '', '11-23-2010 16:25:26.237', 0, NULL, '0', 0, '商业贸易'

SET IDENTITY_INSERT [dbo].[fs_news_Class] OFF



UPDATE fs_news
SET Templet = '/Templets/20101115/T_Content.htm'
WHERE ID > 1900 AND Templet = '/Templets/xxbn/dw_content.html'




SELECT     Id, ClassID, ClassCName, ClassEName, ClassTemplet, ReadNewsTemplet, SavePath, SaveClassframe, ClassCNameRefer
FROM         fs_news_Class


SELECT     Id, NewsID, NewsType, OrderID, NewsTitle, ClassID, Templet, [Content], CreatTime, NewsTitleRefer
FROM         fs_news
WHERE ID > 1900

-- /Templets/people_xxbn/list.htm
-- /Templets/xxbn/dw_list.htm
-- /Templets/20101115/T_column.htm

UPDATE fs_news_Class
SET ClassTemplet = '/Templets/20101115/T_column.htm'
WHERE  ClassTemplet = '/Templets/xxbn/dw_list.htm'


UPDATE fs_news_Class
SET ReadNewsTemplet = '/Templets/20101115/T_Content.htm'
WHERE  ReadNewsTemplet = '/Templets/people_xxbn/aticle.htm'


UPDATE fs_news_Class
SET ReadNewsTemplet = '/Templets/20101115/T_Content.htm'
WHERE  ReadNewsTemplet = '/Templets/xxbn/dw_content.html'









SET IDENTITY_INSERT [dbo].[fs_sys_Label] ON

INSERT INTO [dbo].[fs_sys_Label] (
	[Id],
	[LabelID],
	[ClassID],
	[Label_Name],
	[Label_Content],
	[Description],
	[CreatTime],
	[isBack],
	[isRecyle],
	[isSys],
	[SiteID],
	[isShare]
)
	
	SELECT 267, '927729419597', '882324941476', '{FS_最新的热点新闻10条}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=10,FS:NewsType=Hot,FS:ClassID=-1,FS:isDiv=true,FS:TitleNumer=28][#FS:StyleID=052375420350][/FS:Loop]', '', '11-25-2010 09:52:05.197', 0, 0, 0, '0', NULL

SET IDENTITY_INSERT [dbo].[fs_sys_Label] OFF

