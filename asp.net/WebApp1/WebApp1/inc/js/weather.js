var $ = function(id) {return document.getElementById(id);};
var p = new Array("选择省", "直辖市", "特别行政区", "黑龙江", "吉林", "辽宁", "内蒙古", "河北", "河南", "山东", "山西", "江苏", "安徽", "陕西", "宁夏", "甘肃", "青海", "湖北", "湖南", "浙江", "江西", "福建", "贵州", "四川", "广东", "广西", "云南", "海南", "新疆", "西藏", "台湾");
var chinaprovinces=p.length /////该省份在数组中的索引
var c=new Array(chinaprovinces); /////////////实例化长度是chinaprovinces的数组
var n=new Array(chinaprovinces);
for (i=0; i<chinaprovinces; i++)  c[i]=new Array();
c[0] = new Array("选择城市");
c[1] = new Array("选择城市","北京","上海","天津","重庆");
c[2] = new Array("选择城市","香港","澳门");
c[3] = new Array("选择城市","哈尔滨","齐齐哈尔","牡丹江","大庆","伊春","双鸭山","鹤岗","鸡西","佳木斯","七台河","黑河","绥化","大兴安岭");
c[4] = new Array("选择城市","长春","吉林","白山","白城","四平","松原","辽源","大安","通化");
c[5] = new Array("选择城市","沈阳","大连","葫芦岛","旅顺","本溪","抚顺","铁岭","辽阳","营口","阜新","朝阳","锦州","丹东","鞍山");
c[6] = new Array("选择城市","呼和浩特","锡林浩特","包头","赤峰","海拉尔","乌海","鄂尔多斯","锡林浩特","通辽");
c[7] = new Array("选择城市","石家庄","唐山","张家口","廊坊","邢台","邯郸","沧州","衡水","承德","保定","秦皇岛");
c[8] = new Array("选择城市","郑州","开封","洛阳","平顶山","焦作","鹤壁","新乡","安阳","濮阳","许昌","漯河","三门峡","南阳","商丘","信阳","周口","驻马店");
c[9] = new Array("选择城市","济南","青岛","淄博","威海","曲阜","临沂","烟台","枣庄","聊城","济宁","菏泽","泰安","日照","东营","德州","滨州","莱芜","潍坊");
c[10] = new Array("选择城市","太原","阳泉","晋城","晋中","临汾","运城","长治","朔州","忻州","大同");
c[11] = new Array("选择城市","南京","苏州","昆山","南通","太仓","吴县","徐州","宜兴","镇江","淮安","常熟","盐城","泰州","无锡","连云港","扬州","常州","宿迁");
c[12] = new Array("选择城市","合肥","巢湖","蚌埠","安庆","六安","滁州","马鞍山","阜阳","宣城","铜陵","淮北","芜湖","宿州","淮南","池州");
c[13] = new Array("选择城市","西安","韩城","安康","汉中","宝鸡","咸阳","榆林","渭南","商洛","铜川","延安");
c[14] = new Array("选择城市","银川","固原","中卫","石嘴山","吴忠");
c[15] = new Array("选择城市","兰州","白银","庆阳","酒泉","天水","武威","张掖","甘南","临夏","平凉","定西","金昌");
c[16] = new Array("选择城市","西宁","海北","海西","黄南","果洛","玉树","海东","海南");
c[17] = new Array("选择城市","武汉","宜昌","黄冈","恩施","荆州","神农架","十堰","咸宁","襄樊","孝感","随州","黄石","荆门","鄂州");
c[18] = new Array("选择城市","长沙","邵阳","常德","郴州","吉首","株洲","娄底","湘潭","永州","岳阳","衡阳","怀化","韶山","张家界");
c[19] = new Array("选择城市","杭州","湖州","金华","宁波","丽水","绍兴","衢州","嘉兴","台州","舟山","温州");
c[20] = new Array("选择城市","南昌","萍乡","九江","上饶","抚州","吉安","鹰潭","宜春","新余","景德镇","赣州");
c[21] = new Array("选择城市","福州","厦门","龙岩","南平","宁德","莆田","泉州","三明","漳州");
c[22] = new Array("选择城市","贵阳","安顺","赤水","遵义","铜仁","六盘水","毕节","凯里","都匀","兴义");
c[23] = new Array("选择城市","成都","泸州","内江","凉山","阿坝","巴中","广元","乐山","绵阳","德阳","攀枝花","雅安","宜宾","自贡","甘孜州","达州","资阳","广安","遂宁","眉山","南充");
c[24] = new Array("选择城市","广州","深圳","潮州","韶关","湛江","惠州","清远","东莞","江门","茂名","肇庆","汕尾","河源","揭阳","梅州","中山","德庆","阳江","云浮","珠海","汕头","佛山");
c[25] = new Array("选择城市","南宁","桂林","阳朔","柳州","梧州","玉林","桂平","贺州","钦州","贵港","防城港","百色","北海","河池","来宾","崇左");
c[26] = new Array("选择城市","昆明","保山","楚雄","德宏","红河","临沧","怒江","曲靖","思茅","文山","玉溪","昭通","丽江","大理");
c[27] = new Array("选择城市","海口","三亚","儋州","琼山","通什","文昌");
c[28] = new Array("选择城市","乌鲁木齐","阿勒泰","阿克苏","昌吉","哈密","和田","喀什","克拉玛依","石河子","塔城","库尔勒","吐鲁番","伊宁");
c[29] = new Array("选择城市","拉萨","阿里","昌都","那曲","日喀则","山南","林芝");
c[30] = new Array("选择城市","台北","高雄");

for (i=0; i<chinaprovinces; i++)  n[i]=new Array();
n[0] = new Array("0");
n[1] = new Array("0","54511","58367","54517","57516");
n[2] = new Array("0","45005","45011");
n[3] = new Array("0","50953","50745","54094","50842","50774","50884","50775","50978","50873","50971","50468","50853","50442");
n[4] = new Array("0","54161","54172","54371","50936","54157","50946","54260","50945","54363");
n[5] = new Array("0","54342","54662","54453","54660","54346","54353","54249","54347","54471","54237","54324","54337","54497","54339");
n[6] = new Array("0","53463","54102","53446","54218","50527","53512","53543","54102","54135");
n[7] = new Array("0","53698","54534","54401","54515","53798","53892","54616","54702","54423","54602","54449");
n[8] = new Array("0","57083","57091","57073","57171","53982","53990","53986","53898","54900","57089","57186","57051","57178","58005","57297","57195","57290");
n[9] = new Array("0","54823","54857","54830","54774","54918","54938","54765","58024","54806","54915","54906","54827","54945","54736","54714","54734","54828","54843");
n[10] = new Array("0","53772","53782","53976","53778","53868","53959","53882","53578","53674","53487");
n[11] = new Array("0","58238","58357","58356","58259","58377","58349","58027","58346","58248","58145","58352","58151","58246","58354","58044","58245","58343","58131");
n[12] = new Array("0","58321","58326","58221","58424","58311","58236","58336","58203","58433","58429","58116","58334","58122","58224","58427");
n[13] = new Array("0","57036","53955","57245","57127","57016","57048","53646","57045","57143","53947","53845");
n[14] = new Array("0","53614","53817","53704","53518","53612");
n[15] = new Array("0","52889","52896","53829","52533","57006","52679","52652","50741","52984","53915","52995","52675");
n[16] = new Array("0","52866","52754","52737","56065","56043","56029","52875","52856");
n[17] = new Array("0","57494","57461","57498","57447","57476","57362","57256","57590","57278","57482","57381","58407","57377","57496");
n[18] = new Array("0","57687","57766","57662","57972","57649","57780","57763","57773","57866","57584","57872","57749","57771","57558");
n[19] = new Array("0","58457","58450","58549","58563","58646","58453","58633","58452","58660","58477","58659");
n[20] = new Array("0","58606","57786","58502","58637","58617","57799","58627","57793","57796","58527","57993");
n[21] = new Array("0","58847","59134","58927","58834","58846","58946","59137","58828","59126");
n[22] = new Array("0","57816","57806","57609","57713","57741","56693","57707","57825","57827","57826");
n[23] = new Array("0","56294","57602","57504","56571","56171","57313","57206","56386","56196","56198","56666","56287","56492","56396","56146","57328","56298","57415","57405","56391","57411");
n[24] = new Array("0","59287","59493","59312","59082","59658","59298","59280","59289","59473","59659","59278","59501","59293","59315","59117","59485","59269","59663","59471","59488","59316","59279");
n[25] = new Array("0","59432","57957","59051","59046","59265","59453","59254","59065","59632","59249","59635","59211","59644","59023","59242","59425");
n[26] = new Array("0","56778","56748","56768","56844","56975","56951","56533","56783","56964","56994","56875","56586","56651","56751");
n[27] = new Array("0","59758","59948","59845","59757","59941","59856");
n[28] = new Array("0","51463","51076","51628","51368","52203","51828","51709","51243","51356","51133","51656","51573","51431");
n[29] = new Array("0","55591","55437","56137","55299","55578","55598","56312");
n[30] = new Array("0","58968","59554");

///////////////
function Province_onchange(x,y)
{
	$("province").options.selectedIndex=x;
	for (m=$("chinacity").options.length-1;m>0;m--) ///////////清空列表
		$("chinacity").options[m]=null
   var j=0;
	for (i=0;i<c[x].length;i++)////////////给列表重新赋值
	{
		if(n[x][i]=="99999")
		   continue;
		$("chinacity").options[j]=new Option(c[x][i],n[x][i])
		j++;
	}
	if(!y) y=0;
	$("chinacity").options[y].selected=true; //////默认第一个显示
}
function init_province()
{
   for (m=$("province").options.length-1;m>0;m--) ///////////清空列表
      $("province").options[m]=null
   for (i=0;i<p.length;i++)
      $("province").options[i]=new Option(p[i],p[i])
}

function SetCity(city)
{
   if(!city)
      city="54511";
   if(city.length!=5)
      return;

   var beFound=false;
   for(var i=0; i<n.length; i++)
   {
      for(var j=0; j<n[i].length; j++)
      {
         if(n[i][j]==city)
         {
            Province_onchange(i,j);
            beFound=true;
            break;
         }
      }
      if(beFound)
         break;
   }
}