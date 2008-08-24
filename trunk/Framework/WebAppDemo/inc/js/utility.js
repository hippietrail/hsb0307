var $ = function(id) {return document.getElementById(id);};
var userAgent = navigator.userAgent.toLowerCase();
var isSafari = userAgent.indexOf("Safari")>=0;
var is_opera = userAgent.indexOf('opera') != -1 && opera.version();
var is_moz = (navigator.product == 'Gecko') && userAgent.substr(userAgent.indexOf('firefox') + 8, 3);
var is_ie = (userAgent.indexOf('msie') != -1 && !is_opera) && userAgent.substr(userAgent.indexOf('msie') + 5, 3);

function getOpenner()
{
   if(is_moz)
      return parent.opener;
   else
      return parent.dialogArguments;
}

function isUndefined(variable) {
	return typeof variable == 'undefined' ? true : false;
}

function URLSpecialChars(str)
{
   str=str.replace("%","%25");
   str=str.replace("+","%20");
   str=str.replace("/","%2F");
   str=str.replace("?","%3F");
   str=str.replace("#","%23");
   str=str.replace("&","%26");
   return str;
}
function fetchOffset(obj) {
	var left_offset = obj.offsetLeft;
	var top_offset = obj.offsetTop;
	while((obj = obj.offsetParent) != null) {
		left_offset += obj.offsetLeft;
		top_offset += obj.offsetTop;
	}
	return { 'left' : left_offset, 'top' : top_offset };
}

function new_dom()
{
   var DomType = new Array("microsoft.xmldom","msxml.domdocument","msxml2.domdocument","msxml2.domdocument.3.0","msxml2.domdocument.4.0","msxml2.domdocument.5.0");
   for(var i=0;i<DomType.length;i++)
   {
      try{
         var a = new ActiveXObject(DomType[i]);
         if(!a) continue;
         return a;
      }
      catch(ex){}
   }
   return null;
}

function new_req() {
	if (window.XMLHttpRequest) return new XMLHttpRequest;
	else if (window.ActiveXObject) {
		var req;
		try { req = new ActiveXObject("Msxml2.XMLHTTP"); }
		catch (e) { try { req = new ActiveXObject("Microsoft.XMLHTTP"); }
		catch (e) { return null; }}
		return req;
	} else return null;
}

function _get(url, args, fn, sync)
{
	sync=isUndefined(sync)?true:sync;
	var req = new_req();
	if (args != "") args = "?" + args;
	req.open("GET", url + args, sync);
	req.onreadystatechange = function() { if (req.readyState == 4) fn(req);};
	req.send('');
}

function _post(url, args, fn, sync)
{
   sync=isUndefined(sync)?true:sync;
   var req = new_req();
	req.open('POST', url,sync);
	req.setRequestHeader("Method", "POST " + url + " HTTP/1.1");
	req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	req.onreadystatechange = function() {
			if (req.readyState == 4){
				var s;
				try {s = req.status;}catch (ex) {
						alert(ex.description);
				}
				if (s == 200)fn(req);
			}
	}
	req.send(args);
}