//热辣美图滚动图片 add by hejin 2009-03-17
var mar;
var mar1;
var mar2;
var speed = 50;//the speed of scrolling 
var step = 1;
var MyMar1;
var MyMar2;
var leftHit = 0;//left click or not
var rightHit = 0;//right click or not

function bodyload(){
	//热辣美图滚动图片 add by hejin 2009-03-17
	mar = document.getElementById('scrollbody');
	mar1 = document.getElementById('scroll1');
	mar2 = document.getElementById('scroll2');
	mar2.innerHTML = mar1.innerHTML;
	toLeft();
	//end
}


function toLeft(){
	clearLeft();
	clearRight();
	if(speed > 10){
		speed -= 10;
		step += 1;
		if (step >= 2) step = 2;
	}else{ 
		speed = 10;
	}
	if(leftHit != 0){
		if(MyMar1)
			MyMar1 = setInterval(MarqueeLeft,speed);
	}
	MarqueeLeft();
}

function toRight(){
	clearLeft();
	clearRight();
	if(speed > 10){
		speed -= 10;
		step += 1;
		if (step >= 2) step = 2;
	}else{ 
		speed = 10;
	}
	if(rightHit != 0){
		if(!MyMar2)
			MyMar2 = setInterval(MarqueeRight,speed);
	}
	MarqueeRight();
}

function MarqueeLeft(){
	if(mar2.offsetWidth-mar.scrollLeft <= 0){
		mar.scrollLeft -= mar1.offsetWidth;
	}else{
		mar.scrollLeft += step;
	}
	if(leftHit == 0){
		speed = 50;
		step = 1;
		if(!MyMar1)
			MyMar1 = setInterval(MarqueeLeft,speed);
		leftHit = 1;
		rightHit = 0;
	 }
	mar.onmouseover = function() {
		clearLeft();
		clearRight();
	}
	mar.onmouseout = function() {
		if(!MyMar1)
			MyMar1=setInterval(MarqueeLeft,speed);
	}
}

function MarqueeRight(){
	if(mar.scrollLeft <= 0){
		mar.scrollLeft = mar2.offsetWidth;
	}else{
		mar.scrollLeft -= step;
	}
	if(rightHit == 0){
		speed = 50;
		step = 1;
		if(!MyMar2)
			MyMar2=setInterval(MarqueeRight,speed);
		leftHit = 0;
		rightHit = 1;
	}
	mar.onmouseover = function() {
		clearLeft();
		clearRight();
	}
	mar.onmouseout = function() {
		if(!MyMar2)
			MyMar2 = setInterval(MarqueeRight,speed);
	}
}

function clearLeft(){
   clearInterval(MyMar1);
   MyMar1 = null;
}

function clearRight(){
   clearInterval(MyMar2);
   MyMar2 = null;
}
//end
