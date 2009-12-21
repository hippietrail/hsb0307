function showNew(n){
	for(var i=1;i<=19;i++){
		var curCon=document.getElementById("new_"+i);
		var curBtn=document.getElementById("newc_"+i);
		if(n==i){
			curBtn.style.display="block";
			curCon.className="one"
		}else{
			curBtn.style.display="none";
			curCon.className="";			
		}
	}
}
function showNew1(n){
	for(var i=1;i<=3;i++){
		var curCon=document.getElementById("new1_"+i);
		var curBtn=document.getElementById("newc1_"+i);
		if(n==i){
			curBtn.style.display="block";
			curCon.className="one";
			
		}else{
			curBtn.style.display="none";
			curCon.className="";			
		}
	}
}
function showNew2(n){
	for(var i=1;i<=2;i++){
		var curCon=document.getElementById("new2_"+i);
		var curBtn=document.getElementById("newc2_"+i);
		if(n==i){
			curBtn.style.display="block";
			curCon.className="";
			
		}else{
			curBtn.style.display="none";
			curCon.className="one";			
		}
	}
}
function showNew3(n){
	for(var i=1;i<=7;i++){
		var curCon=document.getElementById("new3_"+i);
		var curBtn=document.getElementById("newc3_"+i);
		if(n==i){
			curBtn.style.display="block";
			curCon.className="one";
			
		}else{
			curBtn.style.display="none";
			curCon.className="";			
		}
	}
}
function showNew4(n){
	for(var i=1;i<=8;i++){
		var curCon=document.getElementById("new4_"+i);
		var curBtn=document.getElementById("newc4_"+i);
		if(n==i){
			curBtn.style.display="block";
			curCon.className="one";
			
		}else{
			curBtn.style.display="none";
			curCon.className="";			
		}
	}
}
function showtools(n){
	for(var i=1;i<=6;i++){
		var curCon=document.getElementById("tools_"+i);
		var curBtn=document.getElementById("toolsc_"+i);
		if(n==i){
			curBtn.style.display="block";
			curCon.className="one";
			
		}else{
			curBtn.style.display="none";
			curCon.className="";			
		}
	}
}

