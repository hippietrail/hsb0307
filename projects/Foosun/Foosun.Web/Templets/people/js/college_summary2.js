var arrSel_college2 = ['college_provid2','collegeid2'];

menu_college2 = ['ѡ����������',[
   'ѡ�������Ŀ',''
  ],
  '�߿�',[
  '����','http://edu.people.com.cn/GB/8216/31559/index.html',
  '��ѧ','http://edu.people.com.cn/GB/8216/31559/index.html',
  'Ӣ��','http://edu.people.com.cn/GB/8216/31559/index.html',
  '��ʷ','http://edu.people.com.cn/GB/8216/31559/index.html',
  '����','http://edu.people.com.cn/GB/8216/31559/index.html',
  '����','http://edu.people.com.cn/GB/8216/31559/index.html',
  '����','http://edu.people.com.cn/GB/8216/31559/index.html',
  '��ѧ','http://edu.people.com.cn/GB/8216/31559/index.html',
  '����','http://edu.people.com.cn/GB/8216/31559/index.html',
  '����','http://edu.people.com.cn/GB/8216/31559/index.html',
  '����','http://edu.people.com.cn/GB/8216/31559/index.html'
  ],
     '����',[
     '����','http://edu.people.com.cn/GB/kaoyan/',
     '����','http://edu.people.com.cn/GB/kaoyan/',
     'רҵ��','http://edu.people.com.cn/GB/kaoyan/',
     '��˶','http://edu.people.com.cn/GB/kaoyan/',
     '��������˶ʿ','http://edu.people.com.cn/GB/kaoyan/',
     '��ְ��˶','http://edu.people.com.cn/GB/kaoyan/',
     'ͬ��ѧ��','http://edu.people.com.cn/GB/kaoyan/'
     ],
     '����Ա',[
     '����','http://edu.people.com.cn/GB/gongwuyuan/',
     '�в�','http://edu.people.com.cn/GB/gongwuyuan/',
     '����','http://edu.people.com.cn/GB/gongwuyuan/'
     ],
     '�ļ�',[
     '�ļ�','http://edu.people.com.cn/GB/cet/index.html'
     ],
     '����',[
     '����','http://edu.people.com.cn/GB/cet/index.html'
     ],
     '�и�',[
     '�и�','http://edu.people.com.cn/GB/112634/113655/index.html'
     ],
     '��˼',[
     '��˼','http://edu.people.com.cn/GB/112634/113656/index.html'
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
	                   else alert('����������ѡ��!');
	            } 
	          }
	    }
     }
     
     multiLevelMenu_college11(0);