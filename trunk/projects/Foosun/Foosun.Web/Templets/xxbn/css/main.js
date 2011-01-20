
function $(id) {
    return document.getElementById(id);
}
function showMenu (baseID, divID) {
    baseID = $(baseID);
    divID  = $(divID);
    //var l = GetOffsetLeft(baseID);
    //var t = GetOffsetTop(baseID);
    //divID.style.left = l + 'px';
//    divID.style.top = t + baseID.offsetHeight + 'px';
    if (showMenu.timer) clearTimeout(showMenu.timer);
	hideCur();
    divID.style.display = 'block';
	showMenu.cur = divID;
    if (! divID.isCreate) {
        divID.isCreate = true;
        //divID.timer = 0;
        divID.onmouseover = function () {
            if (showMenu.timer) clearTimeout(showMenu.timer);
			hideCur();
            divID.style.display = 'block';
        };
        function hide () {
            showMenu.timer = setTimeout(function () {divID.style.display = 'none';}, 1000);
        }
        divID.onmouseout = hide;
        baseID.onmouseout = hide;
    }
	function hideCur () {
		showMenu.cur && (showMenu.cur.style.display = 'none');
	}
}

function scrollDoor(){
}
scrollDoor.prototype = {
sd : function(menus,divs,openClass,closeClass){
	var _this = this;
	if(menus.length != divs.length)
	{
		//alert("");
		return false;
	}				
	for(var i = 0 ; i < menus.length ; i++)
	{	
		_this.$(menus[i]).value = i;				
		_this.$(menus[i]).onmouseover = function(){
					
			for(var j = 0 ; j < menus.length ; j++)
			{						
				_this.$(menus[j]).className = closeClass;
				_this.$(divs[j]).style.display = "none";
			}
			_this.$(menus[this.value]).className = openClass;	
			_this.$(divs[this.value]).style.display = "block";				
		}
	}
 },
$ : function(oid){
	if(typeof(oid) == "string")
	return document.getElementById(oid);
	return oid;
}
}