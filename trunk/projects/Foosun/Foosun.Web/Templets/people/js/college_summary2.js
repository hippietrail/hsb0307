var arrSel_college2 = ['college_provid2','collegeid2'];

menu_college2 = ['选择试题类型',[
   '选择试题科目',''
  ],
  '高考',[
  '语文','http://edu.people.com.cn/GB/8216/31559/index.html',
  '数学','http://edu.people.com.cn/GB/8216/31559/index.html',
  '英语','http://edu.people.com.cn/GB/8216/31559/index.html',
  '历史','http://edu.people.com.cn/GB/8216/31559/index.html',
  '地理','http://edu.people.com.cn/GB/8216/31559/index.html',
  '政治','http://edu.people.com.cn/GB/8216/31559/index.html',
  '物理','http://edu.people.com.cn/GB/8216/31559/index.html',
  '化学','http://edu.people.com.cn/GB/8216/31559/index.html',
  '生物','http://edu.people.com.cn/GB/8216/31559/index.html',
  '文综','http://edu.people.com.cn/GB/8216/31559/index.html',
  '理综','http://edu.people.com.cn/GB/8216/31559/index.html'
  ],
     '考研',[
     '政治','http://edu.people.com.cn/GB/kaoyan/',
     '外语','http://edu.people.com.cn/GB/kaoyan/',
     '专业课','http://edu.people.com.cn/GB/kaoyan/',
     '法硕','http://edu.people.com.cn/GB/kaoyan/',
     '公共管理硕士','http://edu.people.com.cn/GB/kaoyan/',
     '在职读硕','http://edu.people.com.cn/GB/kaoyan/',
     '同等学力','http://edu.people.com.cn/GB/kaoyan/'
     ],
     '公务员',[
     '申论','http://edu.people.com.cn/GB/gongwuyuan/',
     '行测','http://edu.people.com.cn/GB/gongwuyuan/',
     '面试','http://edu.people.com.cn/GB/gongwuyuan/'
     ],
     '四级',[
     '四级','http://edu.people.com.cn/GB/cet/index.html'
     ],
     '六级',[
     '六级','http://edu.people.com.cn/GB/cet/index.html'
     ],
     '托福',[
     '托福','http://edu.people.com.cn/GB/112634/113655/index.html'
     ],
     '雅思',[
     '雅思','http://edu.people.com.cn/GB/112634/113656/index.html'
     ],
     'GRE',[
     'GRE','http://edu.people.com.cn/GB/112634/112667/index.html'
     ],
     'PETS',[
     'PETS','http://edu.people.com.cn/GB/112634/112660/index.html'
     ]
]


function multiLevelMenu_college11(level){
        obj=document.getElementById(arrSel_college2[level]);
		if(obj)
		{
			subMenu_Name = "menu_college2";
			for(i=0;i<level;i++)
			{
				subMenu_Name += "[" + (document.getElementById(arrSel_college2[i]).selectedIndex*2 + 1) + "]";
			}
			
			subMenu = eval(subMenu_Name);
			//alert (subMenu_Name);
			//if(!subMenu) return false;
			
			
			sel_len = obj.length;
			for(i=0;i<sel_len;i++)
			{
				obj.options.remove(0);
			}

			new_sel_len = Math.floor(subMenu.length/2);

			for(i=0;i<new_sel_len;i++)
			{
				obj.options.add(new Option(subMenu[i*2],subMenu[i*2+1]));
			}
			
			obj.onchange = Function("multiLevelMenu_college11(" + (level+1) + ")");

			multiLevelMenu_college11(level+1);
		}
		else
		{

			return false;
		}	
     }
     
     function multiLevelMenu_college2(){
        var i;
	    switch(document.all.college_provid2.options[document.all.college_provid2.selectedIndex].text){
	       case menu_college2[document.all.college_provid2.selectedIndex*2]:
	          { switch(document.all.collegeid2.options[document.all.collegeid2.selectedIndex].text){
	                case menu_college2[document.all.college_provid2.selectedIndex*2 + 1][document.all.collegeid2.selectedIndex*2]:
	                   if(menu_college2[document.all.college_provid2.selectedIndex*2 + 1][document.all.collegeid2.selectedIndex*2 + 1]){
	                      window.open(menu_college2[document.all.college_provid2.selectedIndex*2 + 1][document.all.collegeid2.selectedIndex*2 + 1]);
	                   }
	                   else alert('请做出您的选择!');
	            } 
	          }
	    }
     }
     
     multiLevelMenu_college11(0);