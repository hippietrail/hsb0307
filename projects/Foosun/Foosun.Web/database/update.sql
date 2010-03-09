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
	SELECT 209, '218843635946', '932462318447', '{FS_people_幻灯广告L}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=3,FS:NewsType=MarQuee,FS:ClassID=111622483303]imagePathL.push("{#Picture}"); linkPathL.push("{#URL}");[/FS:Loop]', '', '2010-02-26 16:36:36.280', 0, 0, 0, '0', NULL UNION
	SELECT 210, '163580242361', '932462318447', '{FS_people_幻灯广告R}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=3,FS:NewsType=Hot,FS:ClassID=111622483303]imagePath.push("{#Picture}"); linkPath.push("{#URL}");[/FS:Loop]', '', '2010-02-26 16:36:36.280', 0, 0, 0, '0', NULL UNION
	SELECT 211, '473620588169', '932462318447', '{FS_people_上部中间广告}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=1,FS:NewsType=Jnews,FS:ClassID=111622483303]<a target="_blank" href="{#URL}"><img alt="" src="{#Picture}"  style="height:60px; width:625px;" /></a>[/FS:Loop]', '', '2010-02-26 16:36:36.280', 0, 0, 0, '0', NULL UNION
	SELECT 212, '560800844319', '932462318447', '{FS_people_中间广告}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=1,FS:NewsType=ANN,FS:ClassID=111622483303]<a target="_blank" href="{#URL}"><img alt="" src="{#Picture}"  style="height:60px; width:980px;" /></a>[/FS:Loop]', '', '2010-02-26 16:36:36.280', 0, 0, 0, '0', NULL UNION
	SELECT 213, '894544304814', '932462318447', '{FS_people_下部广告}', '[FS:Loop,FS:SiteID=0,FS:LabelType=List,FS:Number=1,FS:NewsType=Tnews,FS:ClassID=111622483303]<a target="_blank" href="{#URL}"><img alt="" src="{#Picture}"  style="height:60px; width:980px;" /></a>[/FS:Loop]', '', '2010-02-26 16:36:36.280', 0, 0, 0, '0', NULL
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
