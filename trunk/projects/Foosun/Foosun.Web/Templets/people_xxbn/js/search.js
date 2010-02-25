//code:GBK
var rmw_basenames = "RMWSITE";
		var gj_basenames = "RMWSITE";
		var zt_basenames = "SPECIAL";
		var en_basenames = "morelanguage";
		/*
		 *********************************************************************得到检索参数
		 */
		function trim(str) 
		{
			if (!str || str=="") 
				return "";
			while ((str.charAt(0)==' ') || (str.charAt(0)=='\n') || (str.charAt(0,1)=='\r')) 
				str=str.substring(1,str.length);
			while ((str.charAt(str.length-1)==' ') || (str.charAt(str.length-1)=='\n') || (str.charAt(str.length-1)=='\r')) 
				str=str.substring(0,str.length-1);
			return str;
		}
		function allchange()
		{
			var allchangeele = document.RMWSearch.ALLCHANGE;
			//选中或者是取消所有的选择
			var ssfweles = document.getElementsByName("SSFW");
			var ssfwele = false;
			var ssfwlist = "(";
			for(var i=0;i<ssfweles.length;i++)
			{
				ssfwele = ssfweles[i];
				ssfwele.checked = allchangeele.checked;
			}
		}
		function createXMLNode(key,value)
		{
			var sResult = "";
			sResult += "<"+key+">";
			sResult += "<![CDATA["+encode(value)+"]]>";
			sResult += "</"+key+">";
			return sResult;
		}
		function encode(str,u) 
		{
			if (typeof(encodeURIComponent) == 'function')
			{
				if (u) 
					return encodeURI(str);
				else 
					return encodeURIComponent(str);
			}
			else 
			{
				return escape(str);
			}
		}
		//得到低级检索的参数列表
		function getParameter_DJ(channel)
		{
		//alert("in getParamter_DJ()");
			var basenames = gj_basenames;
			//1、得到用户输入的关键词，为空则不允许提交
			var keywordele = document.getElementById("names");
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("请输入关键词，然后提交");
				return false;
			}
			keyword = keywordele.value;
			//alert("after keyword");
			//2、得到用户检索的字段,默认为Title
			var searchfieldeles = document.getElementsByName("SearchField");
			var searchfieldele = false;
			var searchfield = "Content";
			for(var i=0;i<searchfieldeles.length;i++)
			{
				searchfieldele = searchfieldeles[i];
				if(searchfieldele.checked)
					searchfield = searchfieldele.value;
			}
			
			//3、构造XML字符串<RMW><BASENAMES></BASENAMES><KEYWORD></KEYWORD><SEARCHFIELD></SEARCHFIELD></RMW>
			var xmllist = "";
			
			xmllist += "<RMW>";
			xmllist += createXMLNode("BASENAMES",basenames);
			xmllist += createXMLNode("ALLKEYWORD","");
			xmllist += createXMLNode("ALLINPUT","");
			xmllist += createXMLNode("ANYKEYWORD","");
			xmllist += createXMLNode("NOALLKEYWORD","");
			xmllist += createXMLNode("DATEFROM","");
			xmllist += createXMLNode("DATETO","");
			xmllist += createXMLNode("DOCTYPE","0");
			xmllist += createXMLNode("SORTFIELD","-INPUTTIME");
			xmllist += createXMLNode("ZNKZ","0");
			//不同的频道修改下面的      国际    为相关的频道名称
			xmllist += createXMLNode("CHANNEL",channel);
			xmllist += createXMLNode("KEYWORD",keyword);
			xmllist += createXMLNode("SEARCHFIELD",searchfield);
			xmllist += "</RMW>";
			document.searchForm.XMLLIST.value = encodeURIComponent(xmllist);
			document.searchForm.submit();
			return false;
		}

		//得到教育频道第二个检索框的参数列表
		function getParameter_DJ_2(channel)
		{
			var basenames = gj_basenames;
			//1、得到用户输入的关键词，为空则不允许提交
			var keywordele = document.getElementById("names_2");
			//alert(keywordele);
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("请输入关键词，然后提交");
				return false;
			}
			keyword = keywordele.value;
			//2、构造XML字符串<RMW><BASENAMES></BASENAMES><KEYWORD></KEYWORD><SEARCHFIELD></SEARCHFIELD></RMW>
			var xmllist = "";
			
			xmllist += "<RMW>";
			xmllist += createXMLNode("BASENAMES",basenames);
			xmllist += createXMLNode("ALLKEYWORD","");
			xmllist += createXMLNode("ALLINPUT","");
			xmllist += createXMLNode("ANYKEYWORD","");
			xmllist += createXMLNode("NOALLKEYWORD","");
			xmllist += createXMLNode("DATEFROM","");
			xmllist += createXMLNode("DATETO","");
			xmllist += createXMLNode("DOCTYPE","0");
			xmllist += createXMLNode("SORTFIELD","-INPUTTIME");
			xmllist += createXMLNode("ZNKZ","0");
			//不同的频道修改下面的      国际    为相关的频道名称
			xmllist += createXMLNode("CHANNEL",channel);
			xmllist += createXMLNode("KEYWORD",keyword);
			xmllist += createXMLNode("SEARCHFIELD","Content");
			xmllist += "</RMW>";
			//alert(xmllist);
			document.searchForm_2.XMLLIST.value = encodeURIComponent(xmllist);
			document.searchForm_2.submit();
			return false;
		}
		//得到教育频道第三个检索框的参数列表
		function getParameter_DJ_3(channel)
		{
			var basenames = gj_basenames;
			//1、得到用户输入的关键词，为空则不允许提交
			var keywordele = document.getElementById("names_3");
			//alert(keywordele);
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("请输入关键词，然后提交");
				return false;
			}
			keyword = keywordele.value;
			//2、构造XML字符串<RMW><BASENAMES></BASENAMES><KEYWORD></KEYWORD><SEARCHFIELD></SEARCHFIELD></RMW>
			var xmllist = "";
			
			xmllist += "<RMW>";
			xmllist += createXMLNode("BASENAMES",basenames);
			xmllist += createXMLNode("ALLKEYWORD","");
			xmllist += createXMLNode("ALLINPUT","");
			xmllist += createXMLNode("ANYKEYWORD","");
			xmllist += createXMLNode("NOALLKEYWORD","");
			xmllist += createXMLNode("DATEFROM","");
			xmllist += createXMLNode("DATETO","");
			xmllist += createXMLNode("DOCTYPE","0");
			xmllist += createXMLNode("SORTFIELD","-INPUTTIME");
			xmllist += createXMLNode("ZNKZ","0");
			//不同的频道修改下面的      国际    为相关的频道名称
			xmllist += createXMLNode("CHANNEL",channel);
			xmllist += createXMLNode("KEYWORD",keyword);
			xmllist += createXMLNode("SEARCHFIELD","Content");
			xmllist += "</RMW>";
			//alert(xmllist);
			document.searchForm_3.XMLLIST.value = encodeURIComponent(xmllist);
			document.searchForm_3.submit();
			return false;
		}
		//得到教育频道作者检索文本框的值
		function getParameter_DJ_AUTHOR(channel)
		{
			var basenames = gj_basenames;
			//1、得到用户输入的关键词，为空则不允许提交
			var keywordele = document.getElementById("names_author");
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("请输入关键词，然后提交");
				return false;
			}
			keyword = keywordele.value;
			//2、构造XML字符串<RMW><BASENAMES></BASENAMES><KEYWORD></KEYWORD><SEARCHFIELD></SEARCHFIELD></RMW>
			var xmllist = "";
			
			xmllist += "<RMW>";
			xmllist += createXMLNode("BASENAMES",basenames);
			xmllist += createXMLNode("ALLKEYWORD","");
			xmllist += createXMLNode("ALLINPUT","");
			xmllist += createXMLNode("ANYKEYWORD","");
			xmllist += createXMLNode("NOALLKEYWORD","");
			xmllist += createXMLNode("DATEFROM","");
			xmllist += createXMLNode("DATETO","");
			xmllist += createXMLNode("DOCTYPE","0");
			xmllist += createXMLNode("SORTFIELD","-INPUTTIME");
			xmllist += createXMLNode("ZNKZ","0");
			//不同的频道修改下面的      国际    为相关的频道名称
			xmllist += createXMLNode("CHANNEL",channel);
			xmllist += createXMLNode("KEYWORD",keyword);
			xmllist += createXMLNode("SEARCHFIELD","AUTHOR");
			xmllist += "</RMW>";
			//alert(xmllist);
			document.searchForm_author.XMLLIST.value = encodeURIComponent(xmllist);
			document.searchForm_author.submit();
			return false;
		}

		/*对有 OtherWhere 的频道进行检索
		 * 参数信息：
		 * 1、channel 检索频道
		 * 2、formEle 检索的Form表单
		 */
		function searchByOtherWhere(channel,formEle)
		{
			var basenames = gj_basenames;
			//1、得到用户输入的关键词，为空则不允许提交
			var keywordele = formEle.names;
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("请输入关键词，然后提交");
				return false;
			}
			keyword = keywordele.value;
			//2、得到otherwhere的值
			var otherwhereele = formEle.otherwhere;
			var otherwhere = otherwhereele.value;
			//3、构造XML字符串
			var xmllist = "";
			xmllist += "<RMW>";
			xmllist += createXMLNode("BASENAMES",basenames);
			xmllist += createXMLNode("ALLKEYWORD","");
			xmllist += createXMLNode("ALLINPUT","");
			xmllist += createXMLNode("ANYKEYWORD","");
			xmllist += createXMLNode("NOALLKEYWORD","");
			xmllist += createXMLNode("DATEFROM","");
			xmllist += createXMLNode("DATETO","");
			xmllist += createXMLNode("DOCTYPE","0");
			xmllist += createXMLNode("SORTFIELD","-PUBLISHTIME");
			xmllist += createXMLNode("ZNKZ","0");
			xmllist += createXMLNode("OTHERWHERE",otherwhere);
			xmllist += createXMLNode("CHANNEL",channel);
			xmllist += createXMLNode("KEYWORD",keyword);
			xmllist += createXMLNode("SEARCHFIELD","Content");
			xmllist += "</RMW>";
			formEle.XMLLIST.value = xmllist;
			formEle.submit();
			return false;
		}
		//得到低级检索的参数列表
		function allsearch(formele,channel)
		{
			var basenames = gj_basenames;
			//1、得到用户输入的关键词，为空则不允许提交
			var keywordele = formele.names;
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("请输入关键词，然后提交");
				return false;
			}
			keyword = keywordele.value;
			//2、构造XML字符串<RMW><BASENAMES></BASENAMES><KEYWORD></KEYWORD><SEARCHFIELD></SEARCHFIELD></RMW>
			var xmllist = "";
			
			xmllist += "<RMW>";
			xmllist += createXMLNode("BASENAMES",basenames);
			xmllist += createXMLNode("ALLKEYWORD","");
			xmllist += createXMLNode("ALLINPUT","");
			xmllist += createXMLNode("ANYKEYWORD","");
			xmllist += createXMLNode("NOALLKEYWORD","");
			xmllist += createXMLNode("DATEFROM","");
			xmllist += createXMLNode("DATETO","");
			xmllist += createXMLNode("DOCTYPE","0");
			xmllist += createXMLNode("SORTFIELD","-INPUTTIME");
			xmllist += createXMLNode("ZNKZ","0");
			//不同的频道修改下面的      国际    为相关的频道名称
			xmllist += createXMLNode("CHANNEL",channel);
			xmllist += createXMLNode("KEYWORD",keyword);
			xmllist += createXMLNode("SEARCHFIELD","Content");
			xmllist += "</RMW>";
			//alert(xmllist);
			formele.XMLLIST.value = encodeURIComponent(xmllist);
			formele.submit();
			return false;
		}
		
		//得到嘉宾访谈检索的参数列表
		function getParameter_DJ_JBFT(channel)
		{
			var basenames = gj_basenames;
			//1、得到用户输入的关键词，为空则不允许提交
			var keywordele = document.getElementById("names");
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("请输入关键词，然后提交");
				return false;
			}
			keyword = keywordele.value;
			//2、得到用户检索的字段,默认为Title
			var searchfieldeles = document.getElementsByName("SearchField");
			var searchfieldele = false;
			var searchfield = "Content";
			for(var i=0;i<searchfieldeles.length;i++)
			{
				searchfieldele = searchfieldeles[i];
				if(searchfieldele.checked)
					searchfield = searchfieldele.value;
			}
			
			//3、构造XML字符串<RMW><BASENAMES></BASENAMES><KEYWORD></KEYWORD><SEARCHFIELD></SEARCHFIELD></RMW>
			var xmllist = "";
			var otherwhere="class3=嘉宾访谈";
			xmllist += "<RMW>";
			xmllist += createXMLNode("BASENAMES",basenames);
			xmllist += createXMLNode("ALLKEYWORD","");
			xmllist += createXMLNode("ALLINPUT","");
			xmllist += createXMLNode("ANYKEYWORD","");
			xmllist += createXMLNode("NOALLKEYWORD","");
			xmllist += createXMLNode("DATEFROM","");
			xmllist += createXMLNode("DATETO","");
			xmllist += createXMLNode("DOCTYPE","0");
			xmllist += createXMLNode("SORTFIELD","-INPUTTIME");
			xmllist += createXMLNode("ZNKZ","0");
			//不同的频道修改下面的      国际    为相关的频道名称
			xmllist += createXMLNode("OTHERWHERE",otherwhere);
			xmllist += createXMLNode("CHANNEL",channel);
			xmllist += createXMLNode("KEYWORD",keyword);
			xmllist += createXMLNode("SEARCHFIELD",searchfield);
			xmllist += "</RMW>";
			document.searchForm.XMLLIST.value = encodeURIComponent(xmllist);
			document.searchForm.submit();
			return false;
		}
		
		//得到人民网专稿检索的参数列表
		function getParameter_DJ_ZG(channel)
		{
			var basenames = gj_basenames;
			if (channel=="时政"){
				//alert("shizheng");
				var otherwhere="source=%人民网% and class2=(时政 or 国际 or 社会 or 观点 or 城市 or 地方 or 地方领导 or 军事 or 台湾 or 港澳 or 理论 or 华侨华人 or 中国共产党新闻 or 中国人大新闻 or 中国政协新闻网 or 中国政府新闻 or 中国工会新闻 or 中国妇联新闻 or 强国社区 or 强国博客)";
				}
			else if (channel=="体育"){
				//alert("tiyu");
				var otherwhere="source=%人民网% and class2=(体育 or 奥运 or 彩票)";
				}
			else if (channel=="娱乐"){
				var otherwhere="source=%人民网% and class2=娱乐";
				}
			else if (channel=="健康"){
				var otherwhere="source=%人民网% and class2=(健康 or 人口频道 or 卫生频道)";
				}
			else if (channel=="IT"){
				var otherwhere="source=%人民网% and class2=(IT or 无线频道 or 游戏 or 动漫)";
				}
			else if (channel=="旅游"){
				var otherwhere="source=%人民网% and class2=旅游";
				}
			else if (channel=="经济"){
				var otherwhere="source=%人民网% and class2=(经济 or 能源 or 环保 or 房产 or 跨国公司 or 家电 or 中央企业新闻网 or 手机媒体 or 新农村 or 食品 or 招商 or 书画 or 开发区 or 百强县 or 节庆会展 or 男士时尚 or 女性 or 瘦身 or 天气)";
				}
			else if (channel=="教育"){
				var otherwhere="source=%人民网% and class2=教育";
				}
			else if (channel=="科技"){
				var otherwhere="source=%人民网% and class2=科技";
				}
			else if (channel=="汽车"){
				var otherwhere="source=%人民网% and class2=汽车";
				}
			else if (channel=="原创"){
				var otherwhere="((source=%频道% and source=%人民网%) or source=人民网 or source=%人民日报%)";
				}
			else if (channel=="english"){
				basenames=en_basenames;
				var otherwhere="(sitename=english and content= ((By People ) and ( Daily Online )))";
			}
				
			var limiting_date = addDate(-5);
			otherwhere = otherwhere + " and " + "publishtime>" + limiting_date;
			channel="ALL";
			//1、得到用户输入的关键词，为空则不允许提交
			var keywordele = document.getElementById("names");
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("请输入关键词，然后提交");
				return false;
			}
			keyword = keywordele.value;
			//2、得到用户检索的字段,默认为Title
			var searchfieldeles = document.getElementsByName("SearchField");
			var searchfieldele = false;
			var searchfield = "Content";
			for(var i=0;i<searchfieldeles.length;i++)
			{
				searchfieldele = searchfieldeles[i];
				if(searchfieldele.checked)
					searchfield = searchfieldele.value;
			}
			
			//3、构造XML字符串<RMW><BASENAMES></BASENAMES><KEYWORD></KEYWORD><SEARCHFIELD></SEARCHFIELD></RMW>
			var xmllist = "";
			xmllist += "<RMW>";
			xmllist += createXMLNode("BASENAMES",basenames);
			xmllist += createXMLNode("ALLKEYWORD","");
			xmllist += createXMLNode("ALLINPUT","");
			xmllist += createXMLNode("ANYKEYWORD","");
			xmllist += createXMLNode("NOALLKEYWORD","");
			xmllist += createXMLNode("DATEFROM","");
			xmllist += createXMLNode("DATETO","");
			xmllist += createXMLNode("DOCTYPE","0");
			xmllist += createXMLNode("SORTFIELD","-INPUTTIME");
			xmllist += createXMLNode("ZNKZ","0");
			//不同的频道修改下面的      国际    为相关的频道名称
			xmllist += createXMLNode("OTHERWHERE",otherwhere);
			xmllist += createXMLNode("CHANNEL",channel);
			xmllist += createXMLNode("KEYWORD",keyword);
			xmllist += createXMLNode("SEARCHFIELD",searchfield);
			xmllist += "</RMW>";
			document.searchForm.XMLLIST.value = encodeURIComponent(xmllist);
			document.searchForm.submit();
			return false;
		}
		//select 提交
		function submitForm()
		{
			if(document.searchForm.channelname.value == "")
			{
				alert("请选择相关的频道");
				return;
			}
			else
			{
				var channel = document.searchForm.channelname.options[document.searchForm.channelname.selectedIndex].value;
				getParameter_DJ_ZG(channel);
			}
		}
		
	   //计算日期	
	  function addDate(days){
		  //创建日期对象，日期为今天  
		  var   a=new   Date();  
		  //得到今天的日（月里的第几天）  
		  var   b=a.getDate();  
		  //加days天。  
		  b=b+days;  
		  //重新设置日期对象的日，不用担心跨月或是跨年之类的情况，系统会自己处理的  
		  a.setDate(b);
		  var year=a.getFullYear();
		  var month=a.getMonth() + 1;//getMonth()得到月份从0开始，所以要加1  
		  var date=a.getDate();
		  var newdate=year + "." + month + "." + date;
		return   newdate;
	  }
		
	//专门为保险首页使用
	function searchForYh()
	{
	 var index = document.SearchForm.searchcompany.selectedIndex;
	 var searchcompany = document.SearchForm.searchcompany.options[index].value;
	 
	 index = document.SearchForm.searchtype.selectedIndex;
	 var searchtype = document.SearchForm.searchtype.options[index].value;
	  
	 var searchkeyword = document.SearchForm.searchkeyword.value;
	 
	 var where = "";
	 if(searchcompany != "")
	  where += searchcompany+" ";
	 if(searchtype != "")
	  where += searchtype+" ";
	 if(searchkeyword != "")
	  where += searchkeyword+" ";
	 where = encode(where);
	 var channel = encode("经济");
	 window.open("http://search.people.com.cn/rmw/GB/bxsearch/searchres.jsp?keyword="+where+"&channel="+channel);
	 
	}

	//视频检索
	function getParameter_VIDEO()
		{
			var basenames = rmw_basenames;
			//1、得到用户输入的关键词，为空则不允许提交
			var keywordele = document.getElementById("names");
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("请输入关键词，然后提交");
				return false;
			}
			keyword = keywordele.value;
			//2、得到用户检索的字段,默认为Title
			var searchfieldeles = document.getElementsByName("SearchField");
			var searchfieldele = false;
			var searchfield = "Title";
			for(var i=0;i<searchfieldeles.length;i++)
			{
				searchfieldele = searchfieldeles[i];
				if(searchfieldele.checked)
					searchfield = searchfieldele.value;
			}
			//3、构造XML字符串<RMW><BASENAMES></BASENAMES><KEYWORD></KEYWORD><SEARCHFIELD></SEARCHFIELD></RMW>
			var xmllist = "";
			xmllist += "<RMW>";
			xmllist += createXMLNode("BASENAMES",basenames);
			xmllist += createXMLNode("KEYWORD",keyword);
			xmllist += createXMLNode("ALLKEYWORD","");
			xmllist += createXMLNode("ALLINPUT","");
			xmllist += createXMLNode("ANYKEYWORD","");
			xmllist += createXMLNode("NOALLKEYWORD","");
			xmllist += createXMLNode("ZNKZ","1");
			xmllist += createXMLNode("DATEFROM","");
			xmllist += createXMLNode("DATETO","");
			xmllist += createXMLNode("SEARCHFIELD",searchfield);
			xmllist += "</RMW>";
			document.VIDEOSearch.XMLLIST.value = xmllist;	
			document.VIDEOSearch.submit();
			return false;
		}		
				
	//视频新闻联播检索
	function getParameter_VIDEO_XWLB(){
			var basenames = rmw_basenames;
			//1、得到用户输入的关键词，为空则不允许提交
			var keywordele = document.VIDEOSearch.PROGRAM.value;
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("请输入关键词，然后提交");
				return false;
			}
			
			keyword = document.VIDEOSearch.PROGRAM.value;
			//2、得到用户检索的字段,默认为Title
			var searchfieldeles = document.getElementsByName("SearchField");
			var searchfieldele = false;
			var searchfield = "Title";
			for(var i=0;i<searchfieldeles.length;i++)
			{
				searchfieldele = searchfieldeles[i];
				if(searchfieldele.checked)
					searchfield = searchfieldele.value;
			}
			//6、得到日期范围
			var datefrom = document.VIDEOSearch.DATEFROM.value;
			var dateto = document.VIDEOSearch.DATETO.value;
			//3、构造XML字符串<RMW><BASENAMES></BASENAMES><KEYWORD></KEYWORD><SEARCHFIELD></SEARCHFIELD></RMW>
			var xmllist = "";
			xmllist += "<RMW>";
			xmllist += createXMLNode("BASENAMES",basenames);
			xmllist += createXMLNode("KEYWORD",keyword);
			xmllist += createXMLNode("ALLKEYWORD","");
			xmllist += createXMLNode("ALLINPUT","");
			xmllist += createXMLNode("ANYKEYWORD","");
			xmllist += createXMLNode("NOALLKEYWORD","");
			xmllist += createXMLNode("ZNKZ","1");
			xmllist += createXMLNode("DATEFROM",datefrom);
			xmllist += createXMLNode("DATETO",dateto);
			xmllist += createXMLNode("SEARCHFIELD",searchfield);
			xmllist += "</RMW>";
			document.VIDEOSearch.XMLLIST.value = xmllist;	
			document.VIDEOSearch.submit();
			return false;
		}
				//得到爱我中华检索的参数列表
		function getParameter_DJ_AWZH(channel)
		{
			var basenames = "awzh";
			//1、得到用户输入的关键词，为空则不允许提交
			var keywordele = document.getElementById("names");
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("请输入关键词，然后提交");
				return false;
			}
			keyword = keywordele.value;
			//2、得到用户检索的字段,默认为Title
			var searchfieldeles = document.getElementsByName("SearchField");
			var searchfieldele = false;
			var searchfield = "Title";
			for(var i=0;i<searchfieldeles.length;i++)
			{
				searchfieldele = searchfieldeles[i];
				if(searchfieldele.checked)
					searchfield = searchfieldele.value;
			}
			
			//3、构造XML字符串<RMW><BASENAMES></BASENAMES><KEYWORD></KEYWORD><SEARCHFIELD></SEARCHFIELD></RMW>
			var xmllist = "";
			var otherwhere="specialflag=tangshuquan";
			xmllist += "<RMW>";
			xmllist += createXMLNode("BASENAMES",basenames);
			xmllist += createXMLNode("ALLKEYWORD","");
			xmllist += createXMLNode("ALLINPUT","");
			xmllist += createXMLNode("ANYKEYWORD","");
			xmllist += createXMLNode("NOALLKEYWORD","");
			xmllist += createXMLNode("DATEFROM","");
			xmllist += createXMLNode("DATETO","");
			xmllist += createXMLNode("DOCTYPE","0");
			xmllist += createXMLNode("SORTFIELD","-INPUTTIME");
			xmllist += createXMLNode("ZNKZ","1");
			xmllist += createXMLNode("OTHERWHERE",otherwhere);
//			xmllist += createXMLNode("CHANNEL",channel);
			xmllist += createXMLNode("KEYWORD",keyword);
			xmllist += createXMLNode("SEARCHFIELD",searchfield);
			xmllist += "</RMW>";
			document.searchForm.XMLLIST.value = encodeURIComponent(xmllist);
			document.searchForm.submit();
			return false;
		}

		//经济频道金融家留言板检索
		function getParameter_DJ_JRJLYB(channel)
		{
			var basenames = gj_basenames;
			//1、得到用户输入的关键词，为空则不允许提交
			var keywordele = document.getElementById("names");
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("请输入关键词，然后提交");
				return false;
			}
			keyword = keywordele.value;
			//2、得到用户检索的字段,默认为Title
			var searchfieldeles = document.getElementsByName("SearchField");
			var searchfieldele = false;
			var searchfield = "Content";
			for(var i=0;i<searchfieldeles.length;i++)
			{
				searchfieldele = searchfieldeles[i];
				if(searchfieldele.checked)
					searchfield = searchfieldele.value;
			}
			
			//3、构造XML字符串<RMW><BASENAMES></BASENAMES><KEYWORD></KEYWORD><SEARCHFIELD></SEARCHFIELD></RMW>
			var xmllist = "";
			var otherwhere="docclass=%中国金融家留言板%";
			xmllist += "<RMW>";
			xmllist += createXMLNode("BASENAMES",basenames);
			xmllist += createXMLNode("ALLKEYWORD","");
			xmllist += createXMLNode("ALLINPUT","");
			xmllist += createXMLNode("ANYKEYWORD","");
			xmllist += createXMLNode("NOALLKEYWORD","");
			xmllist += createXMLNode("DATEFROM","");
			xmllist += createXMLNode("DATETO","");
			xmllist += createXMLNode("DOCTYPE","0");
			xmllist += createXMLNode("SORTFIELD","-INPUTTIME");
			xmllist += createXMLNode("ZNKZ","0");
			xmllist += createXMLNode("OTHERWHERE",otherwhere);
			xmllist += createXMLNode("CHANNEL",channel);
			xmllist += createXMLNode("KEYWORD",keyword);
			xmllist += createXMLNode("SEARCHFIELD",searchfield);
			xmllist += "</RMW>";
			document.searchForm.XMLLIST.value = encodeURIComponent(xmllist);
			document.searchForm.submit();
			return false;
		}
