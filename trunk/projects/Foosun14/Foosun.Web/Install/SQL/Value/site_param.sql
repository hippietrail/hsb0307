﻿insert into [fs_news_site] ([ChannelID],[ParentID],[CName],[EName],[ChannCName],[IsURL],[Urladdress],[DataLib],[IndexTemplet],[ClassTemplet],[ReadNewsTemplet],[SpecialTemplet],[isLock],[Domain],[isDelPoint],[Gpoint],[iPoint],[GroupNumber],[isCheck],[Keywords],[Descript],[ContrTF],[ShowNaviTF],[UpfileType],[UpfileSize],[NaviContent],[NaviPicURL],[SaveType],[PicSavePath],[SaveFileType],[SaveDirPath],[SaveDirRule],[SaveFileRule],[NaviPosition],[IndexEXName],[ClassEXName],[NewsEXName],[SpecialEXName],[classRefeshNum],[infoRefeshNum],[DelNum],[SpecialNum],[CreatTime],[SiteID],[isRecyle]) values ('0','0','资讯中心','news','新闻',0,null,'FS_News','/{@dirTemplet}/Content/index.html','/{@dirTemplet}/Content/class.html','/{@dirTemplet}/Content/news.html','/{@dirTemplet}/Content/special.html',0,'',0,0,0,null,0,'','',0,0,'jpg,gif,jpeg,bmp,swf,rar,zip,txt,png',10240,'','',0,null,0,'/html','{@year04}{@month}','{@day}{@hour}{@minute}-{@Ram4_2}','<a href="/" target="_blank">首页</a> >> {@ParentClassStr} >> 资讯中心','html','html','html','html',800,100,200,500,'2007-3-23 15:59:52','0',0);
insert into [fs_sys_param] ([SiteName],[SiteDomain],[IndexTemplet],[IndexFileName],[ReadNewsTemplet],[ClassListTemplet],[SpecialTemplet],[FileEXName],[ReadType],[LoginTimeOut],[Email],[LinkType],[CopyRight],[CheckInt],[UnLinkTF],[LenSearch],[CheckNewsTitle],[CollectTF],[SaveClassFilePath],[SaveIndexPage],[SaveNewsFilePath],[SaveNewsDirPath],[ConstrTF],[PicServerTF],[PicServerDomain],[PicUpLoad],[UpfilesType],[UpFilesSize],[RemoteSavePath],[ReMoteDomainTF],[RemoteDomain],[HotNewsJs],[LastNewsJs],[RecNewsJS],[HotCommJS],[TNewsJS],[ClassListNum],[NewsNum],[BatDelNum],[SpecialNum],[Pram_Index],[InsertPicPosition],[HistoryNum]) values ('dotNETCMS','www.hg.net','/{@dirTemplet}/Content/index.html','index.html','/{@dirTemplet}/Content/news.html','/{@dirTemplet}/Content/class.html','/{@dirTemplet}/Content/special.html','html,shtml,shtm',0,1000,'koolls@163.com',1,'@ 2007 foosun inc.dotnetcms v1.0.0',0,1,'2|10',0,1,'/html','{@year04}-{@month}/{@day}','{@自动编号ID}','{@year04}-{@month}',1,0,'127.0.0.1','picture','gif,html,htm,bmp,jpge,jpg,rar,zip,flv,swf,rm',50000,'Pictures',0,'127.0.0.1','10|8|0','10|8|0','10|8|0','10|8|0','10|8|0',0,0,0,0,10,'200|left',30);

insert into [fs_sys_parmConstr] ([PCId],[ConstrPayName],[gPoint],[iPoint],[money],[Gunit],[SiteID]) values ('000000000001','A级',0,0,0,'人民币','0');

insert into [fs_sys_parmPrint] ([PrintTF],[PrintPicTF],[PrintWord],[Printfontsize],[Printfontfamily],[Printfontcolor],[PrintBTF],[PintPicURL],[PrintPicsize],[PintPictrans],[PrintPosition],[PrintSmallTF],[PrintSmallSize],[PrintSmallinv],[PrintSmallSizeStyle]) values (0,8,'Foosun Inc.',10,'1','FFFFFF',1,'/{@dirfile}/2.gif','0.8|0.8','0.8',0,10,'100|10','0.5',12);

insert into [fs_sys_Pramother] ([FtpTF],[FTPIP],[Ftpport],[FtpUserName],[FTPPASSword],[RssNum],[RssContentNum],[RssTitle],[RssPicURL],[WapTF],[WapPath],[WapDomain],[WapLastNum]) values (1,'192.168.1.50','21','FoosunCms','222222',100,1000,'四川风讯','1.gif',1,'/XML/WAP','http://wap.hg.net',10);

insert into [fs_sys_PramUser] ([RegGroupNumber],[ConstrTF],[RegTF],[UserLoginCodeTF],[CommCodeTF],[CommCheck],[SendMessageTF],[UnRegCommTF],[CommHTMLLoad],[Commfiltrchar],[IPLimt],[GpointName],[LoginLock],[LevelID],[RegContent],[setPoint],[regItem],[returnemail],[returnmobile],[onpayType],[o_userName],[o_key],[o_sendurl],[o_returnurl],[o_md5],[o_other1],[o_other2],[o_other3],[GhClass],[cPointParam],[aPointparam],[SiteID]) values ('00000000001',1,1,1,1,0,1,1,1,'我日,法轮功,邪教,fuck you,妈妈的,麻仁,草,操','127.0.1.*|127.2.0.*','风讯币','3|30','204146011535','注册前请先阅读【风讯】协议 <p>欢迎您加入【风讯】参加交流和讨论，【风讯】为公共，为维护网上公共秩序和社会稳定，请您自觉遵守以下条款：<br />一、不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益，不得利用本站制作、复制和传播下列信息：<br /><br />（一）煽动抗拒、破坏宪法和法律、行政法规实施的；<br />（二）煽动颠覆国家政权，推翻社会主义制度的；<br />（三）煽动分裂国家、破坏国家统一的；<br />（四）煽动民族仇恨、民族歧视，破坏民族团结的；<br />（五）捏造或者歪曲事实，散布谣言，扰乱社会秩序的；<br />（六）宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；<br />（七）公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；<br />（八）损害国家机关信誉的；<br />（九）其他违反宪法和法律行政法规的；<br />（十）进行商业广告行为的。 <br /><br />二、互相尊重，对自己的言论和行为负责。<br />','10|10','UserName,UserPassword,email',0,0,1,'koolls@163.com','1111','https://pay3.chinabank.com.cn/PayGate','http://localhost/user/info/Receive.aspx','4d34s53dfd34u3dsd3d2df','a','b','c',0,'2|2','2|2','0');