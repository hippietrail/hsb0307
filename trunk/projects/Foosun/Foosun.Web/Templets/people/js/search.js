//code:GBK
var rmw_basenames = "RMWSITE";
		var gj_basenames = "RMWSITE";
		var zt_basenames = "SPECIAL";
		var en_basenames = "morelanguage";
		/*
		 *********************************************************************�õ���������
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
			//ѡ�л�����ȡ�����е�ѡ��
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
		//�õ��ͼ������Ĳ����б�
		function getParameter_DJ(channel)
		{
		//alert("in getParamter_DJ()");
			var basenames = gj_basenames;
			//1���õ��û�����Ĺؼ��ʣ�Ϊ���������ύ
			var keywordele = document.getElementById("names");
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("������ؼ��ʣ�Ȼ���ύ");
				return false;
			}
			keyword = keywordele.value;
			//alert("after keyword");
			//2���õ��û��������ֶ�,Ĭ��ΪTitle
			var searchfieldeles = document.getElementsByName("SearchField");
			var searchfieldele = false;
			var searchfield = "Content";
			for(var i=0;i<searchfieldeles.length;i++)
			{
				searchfieldele = searchfieldeles[i];
				if(searchfieldele.checked)
					searchfield = searchfieldele.value;
			}
			
			//3������XML�ַ���<RMW><BASENAMES></BASENAMES><KEYWORD></KEYWORD><SEARCHFIELD></SEARCHFIELD></RMW>
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
			//��ͬ��Ƶ���޸������      ����    Ϊ��ص�Ƶ������
			xmllist += createXMLNode("CHANNEL",channel);
			xmllist += createXMLNode("KEYWORD",keyword);
			xmllist += createXMLNode("SEARCHFIELD",searchfield);
			xmllist += "</RMW>";
			document.searchForm.XMLLIST.value = encodeURIComponent(xmllist);
			document.searchForm.submit();
			return false;
		}

		//�õ�����Ƶ���ڶ���������Ĳ����б�
		function getParameter_DJ_2(channel)
		{
			var basenames = gj_basenames;
			//1���õ��û�����Ĺؼ��ʣ�Ϊ���������ύ
			var keywordele = document.getElementById("names_2");
			//alert(keywordele);
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("������ؼ��ʣ�Ȼ���ύ");
				return false;
			}
			keyword = keywordele.value;
			//2������XML�ַ���<RMW><BASENAMES></BASENAMES><KEYWORD></KEYWORD><SEARCHFIELD></SEARCHFIELD></RMW>
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
			//��ͬ��Ƶ���޸������      ����    Ϊ��ص�Ƶ������
			xmllist += createXMLNode("CHANNEL",channel);
			xmllist += createXMLNode("KEYWORD",keyword);
			xmllist += createXMLNode("SEARCHFIELD","Content");
			xmllist += "</RMW>";
			//alert(xmllist);
			document.searchForm_2.XMLLIST.value = encodeURIComponent(xmllist);
			document.searchForm_2.submit();
			return false;
		}
		//�õ�����Ƶ��������������Ĳ����б�
		function getParameter_DJ_3(channel)
		{
			var basenames = gj_basenames;
			//1���õ��û�����Ĺؼ��ʣ�Ϊ���������ύ
			var keywordele = document.getElementById("names_3");
			//alert(keywordele);
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("������ؼ��ʣ�Ȼ���ύ");
				return false;
			}
			keyword = keywordele.value;
			//2������XML�ַ���<RMW><BASENAMES></BASENAMES><KEYWORD></KEYWORD><SEARCHFIELD></SEARCHFIELD></RMW>
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
			//��ͬ��Ƶ���޸������      ����    Ϊ��ص�Ƶ������
			xmllist += createXMLNode("CHANNEL",channel);
			xmllist += createXMLNode("KEYWORD",keyword);
			xmllist += createXMLNode("SEARCHFIELD","Content");
			xmllist += "</RMW>";
			//alert(xmllist);
			document.searchForm_3.XMLLIST.value = encodeURIComponent(xmllist);
			document.searchForm_3.submit();
			return false;
		}
		//�õ�����Ƶ�����߼����ı����ֵ
		function getParameter_DJ_AUTHOR(channel)
		{
			var basenames = gj_basenames;
			//1���õ��û�����Ĺؼ��ʣ�Ϊ���������ύ
			var keywordele = document.getElementById("names_author");
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("������ؼ��ʣ�Ȼ���ύ");
				return false;
			}
			keyword = keywordele.value;
			//2������XML�ַ���<RMW><BASENAMES></BASENAMES><KEYWORD></KEYWORD><SEARCHFIELD></SEARCHFIELD></RMW>
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
			//��ͬ��Ƶ���޸������      ����    Ϊ��ص�Ƶ������
			xmllist += createXMLNode("CHANNEL",channel);
			xmllist += createXMLNode("KEYWORD",keyword);
			xmllist += createXMLNode("SEARCHFIELD","AUTHOR");
			xmllist += "</RMW>";
			//alert(xmllist);
			document.searchForm_author.XMLLIST.value = encodeURIComponent(xmllist);
			document.searchForm_author.submit();
			return false;
		}

		/*���� OtherWhere ��Ƶ�����м���
		 * ������Ϣ��
		 * 1��channel ����Ƶ��
		 * 2��formEle ������Form��
		 */
		function searchByOtherWhere(channel,formEle)
		{
			var basenames = gj_basenames;
			//1���õ��û�����Ĺؼ��ʣ�Ϊ���������ύ
			var keywordele = formEle.names;
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("������ؼ��ʣ�Ȼ���ύ");
				return false;
			}
			keyword = keywordele.value;
			//2���õ�otherwhere��ֵ
			var otherwhereele = formEle.otherwhere;
			var otherwhere = otherwhereele.value;
			//3������XML�ַ���
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
		//�õ��ͼ������Ĳ����б�
		function allsearch(formele,channel)
		{
			var basenames = gj_basenames;
			//1���õ��û�����Ĺؼ��ʣ�Ϊ���������ύ
			var keywordele = formele.names;
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("������ؼ��ʣ�Ȼ���ύ");
				return false;
			}
			keyword = keywordele.value;
			//2������XML�ַ���<RMW><BASENAMES></BASENAMES><KEYWORD></KEYWORD><SEARCHFIELD></SEARCHFIELD></RMW>
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
			//��ͬ��Ƶ���޸������      ����    Ϊ��ص�Ƶ������
			xmllist += createXMLNode("CHANNEL",channel);
			xmllist += createXMLNode("KEYWORD",keyword);
			xmllist += createXMLNode("SEARCHFIELD","Content");
			xmllist += "</RMW>";
			//alert(xmllist);
			formele.XMLLIST.value = encodeURIComponent(xmllist);
			formele.submit();
			return false;
		}
		
		//�õ��α���̸�����Ĳ����б�
		function getParameter_DJ_JBFT(channel)
		{
			var basenames = gj_basenames;
			//1���õ��û�����Ĺؼ��ʣ�Ϊ���������ύ
			var keywordele = document.getElementById("names");
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("������ؼ��ʣ�Ȼ���ύ");
				return false;
			}
			keyword = keywordele.value;
			//2���õ��û��������ֶ�,Ĭ��ΪTitle
			var searchfieldeles = document.getElementsByName("SearchField");
			var searchfieldele = false;
			var searchfield = "Content";
			for(var i=0;i<searchfieldeles.length;i++)
			{
				searchfieldele = searchfieldeles[i];
				if(searchfieldele.checked)
					searchfield = searchfieldele.value;
			}
			
			//3������XML�ַ���<RMW><BASENAMES></BASENAMES><KEYWORD></KEYWORD><SEARCHFIELD></SEARCHFIELD></RMW>
			var xmllist = "";
			var otherwhere="class3=�α���̸";
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
			//��ͬ��Ƶ���޸������      ����    Ϊ��ص�Ƶ������
			xmllist += createXMLNode("OTHERWHERE",otherwhere);
			xmllist += createXMLNode("CHANNEL",channel);
			xmllist += createXMLNode("KEYWORD",keyword);
			xmllist += createXMLNode("SEARCHFIELD",searchfield);
			xmllist += "</RMW>";
			document.searchForm.XMLLIST.value = encodeURIComponent(xmllist);
			document.searchForm.submit();
			return false;
		}
		
		//�õ�������ר������Ĳ����б�
		function getParameter_DJ_ZG(channel)
		{
			var basenames = gj_basenames;
			if (channel=="ʱ��"){
				//alert("shizheng");
				var otherwhere="source=%������% and class2=(ʱ�� or ���� or ��� or �۵� or ���� or �ط� or �ط��쵼 or ���� or ̨�� or �۰� or ���� or ���Ȼ��� or �й����������� or �й��˴����� or �й���Э������ or �й��������� or �й��������� or �й��������� or ǿ������ or ǿ������)";
				}
			else if (channel=="����"){
				//alert("tiyu");
				var otherwhere="source=%������% and class2=(���� or ���� or ��Ʊ)";
				}
			else if (channel=="����"){
				var otherwhere="source=%������% and class2=����";
				}
			else if (channel=="����"){
				var otherwhere="source=%������% and class2=(���� or �˿�Ƶ�� or ����Ƶ��)";
				}
			else if (channel=="IT"){
				var otherwhere="source=%������% and class2=(IT or ����Ƶ�� or ��Ϸ or ����)";
				}
			else if (channel=="����"){
				var otherwhere="source=%������% and class2=����";
				}
			else if (channel=="����"){
				var otherwhere="source=%������% and class2=(���� or ��Դ or ���� or ���� or �����˾ or �ҵ� or ������ҵ������ or �ֻ�ý�� or ��ũ�� or ʳƷ or ���� or �黭 or ������ or ��ǿ�� or �����չ or ��ʿʱ�� or Ů�� or ���� or ����)";
				}
			else if (channel=="����"){
				var otherwhere="source=%������% and class2=����";
				}
			else if (channel=="�Ƽ�"){
				var otherwhere="source=%������% and class2=�Ƽ�";
				}
			else if (channel=="����"){
				var otherwhere="source=%������% and class2=����";
				}
			else if (channel=="ԭ��"){
				var otherwhere="((source=%Ƶ��% and source=%������%) or source=������ or source=%�����ձ�%)";
				}
			else if (channel=="english"){
				basenames=en_basenames;
				var otherwhere="(sitename=english and content= ((By People ) and ( Daily Online )))";
			}
				
			var limiting_date = addDate(-5);
			otherwhere = otherwhere + " and " + "publishtime>" + limiting_date;
			channel="ALL";
			//1���õ��û�����Ĺؼ��ʣ�Ϊ���������ύ
			var keywordele = document.getElementById("names");
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("������ؼ��ʣ�Ȼ���ύ");
				return false;
			}
			keyword = keywordele.value;
			//2���õ��û��������ֶ�,Ĭ��ΪTitle
			var searchfieldeles = document.getElementsByName("SearchField");
			var searchfieldele = false;
			var searchfield = "Content";
			for(var i=0;i<searchfieldeles.length;i++)
			{
				searchfieldele = searchfieldeles[i];
				if(searchfieldele.checked)
					searchfield = searchfieldele.value;
			}
			
			//3������XML�ַ���<RMW><BASENAMES></BASENAMES><KEYWORD></KEYWORD><SEARCHFIELD></SEARCHFIELD></RMW>
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
			//��ͬ��Ƶ���޸������      ����    Ϊ��ص�Ƶ������
			xmllist += createXMLNode("OTHERWHERE",otherwhere);
			xmllist += createXMLNode("CHANNEL",channel);
			xmllist += createXMLNode("KEYWORD",keyword);
			xmllist += createXMLNode("SEARCHFIELD",searchfield);
			xmllist += "</RMW>";
			document.searchForm.XMLLIST.value = encodeURIComponent(xmllist);
			document.searchForm.submit();
			return false;
		}
		//select �ύ
		function submitForm()
		{
			if(document.searchForm.channelname.value == "")
			{
				alert("��ѡ����ص�Ƶ��");
				return;
			}
			else
			{
				var channel = document.searchForm.channelname.options[document.searchForm.channelname.selectedIndex].value;
				getParameter_DJ_ZG(channel);
			}
		}
		
	   //��������	
	  function addDate(days){
		  //�������ڶ�������Ϊ����  
		  var   a=new   Date();  
		  //�õ�������գ�����ĵڼ��죩  
		  var   b=a.getDate();  
		  //��days�졣  
		  b=b+days;  
		  //�����������ڶ�����գ����õ��Ŀ��»��ǿ���֮��������ϵͳ���Լ������  
		  a.setDate(b);
		  var year=a.getFullYear();
		  var month=a.getMonth() + 1;//getMonth()�õ��·ݴ�0��ʼ������Ҫ��1  
		  var date=a.getDate();
		  var newdate=year + "." + month + "." + date;
		return   newdate;
	  }
		
	//ר��Ϊ������ҳʹ��
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
	 var channel = encode("����");
	 window.open("http://search.people.com.cn/rmw/GB/bxsearch/searchres.jsp?keyword="+where+"&channel="+channel);
	 
	}

	//��Ƶ����
	function getParameter_VIDEO()
		{
			var basenames = rmw_basenames;
			//1���õ��û�����Ĺؼ��ʣ�Ϊ���������ύ
			var keywordele = document.getElementById("names");
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("������ؼ��ʣ�Ȼ���ύ");
				return false;
			}
			keyword = keywordele.value;
			//2���õ��û��������ֶ�,Ĭ��ΪTitle
			var searchfieldeles = document.getElementsByName("SearchField");
			var searchfieldele = false;
			var searchfield = "Title";
			for(var i=0;i<searchfieldeles.length;i++)
			{
				searchfieldele = searchfieldeles[i];
				if(searchfieldele.checked)
					searchfield = searchfieldele.value;
			}
			//3������XML�ַ���<RMW><BASENAMES></BASENAMES><KEYWORD></KEYWORD><SEARCHFIELD></SEARCHFIELD></RMW>
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
				
	//��Ƶ������������
	function getParameter_VIDEO_XWLB(){
			var basenames = rmw_basenames;
			//1���õ��û�����Ĺؼ��ʣ�Ϊ���������ύ
			var keywordele = document.VIDEOSearch.PROGRAM.value;
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("������ؼ��ʣ�Ȼ���ύ");
				return false;
			}
			
			keyword = document.VIDEOSearch.PROGRAM.value;
			//2���õ��û��������ֶ�,Ĭ��ΪTitle
			var searchfieldeles = document.getElementsByName("SearchField");
			var searchfieldele = false;
			var searchfield = "Title";
			for(var i=0;i<searchfieldeles.length;i++)
			{
				searchfieldele = searchfieldeles[i];
				if(searchfieldele.checked)
					searchfield = searchfieldele.value;
			}
			//6���õ����ڷ�Χ
			var datefrom = document.VIDEOSearch.DATEFROM.value;
			var dateto = document.VIDEOSearch.DATETO.value;
			//3������XML�ַ���<RMW><BASENAMES></BASENAMES><KEYWORD></KEYWORD><SEARCHFIELD></SEARCHFIELD></RMW>
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
				//�õ������л������Ĳ����б�
		function getParameter_DJ_AWZH(channel)
		{
			var basenames = "awzh";
			//1���õ��û�����Ĺؼ��ʣ�Ϊ���������ύ
			var keywordele = document.getElementById("names");
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("������ؼ��ʣ�Ȼ���ύ");
				return false;
			}
			keyword = keywordele.value;
			//2���õ��û��������ֶ�,Ĭ��ΪTitle
			var searchfieldeles = document.getElementsByName("SearchField");
			var searchfieldele = false;
			var searchfield = "Title";
			for(var i=0;i<searchfieldeles.length;i++)
			{
				searchfieldele = searchfieldeles[i];
				if(searchfieldele.checked)
					searchfield = searchfieldele.value;
			}
			
			//3������XML�ַ���<RMW><BASENAMES></BASENAMES><KEYWORD></KEYWORD><SEARCHFIELD></SEARCHFIELD></RMW>
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

		//����Ƶ�����ڼ����԰����
		function getParameter_DJ_JRJLYB(channel)
		{
			var basenames = gj_basenames;
			//1���õ��û�����Ĺؼ��ʣ�Ϊ���������ύ
			var keywordele = document.getElementById("names");
			var keyword = "";
			if(keywordele.value == "")
			{
				alert("������ؼ��ʣ�Ȼ���ύ");
				return false;
			}
			keyword = keywordele.value;
			//2���õ��û��������ֶ�,Ĭ��ΪTitle
			var searchfieldeles = document.getElementsByName("SearchField");
			var searchfieldele = false;
			var searchfield = "Content";
			for(var i=0;i<searchfieldeles.length;i++)
			{
				searchfieldele = searchfieldeles[i];
				if(searchfieldele.checked)
					searchfield = searchfieldele.value;
			}
			
			//3������XML�ַ���<RMW><BASENAMES></BASENAMES><KEYWORD></KEYWORD><SEARCHFIELD></SEARCHFIELD></RMW>
			var xmllist = "";
			var otherwhere="docclass=%�й����ڼ����԰�%";
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
