/*
 * 内容:AJAX 轻框架,支持连接池
 * 作者:袁维
 */
// encodeURIComponent():数据编码
var PublicXMLHttp = {
    _objPool: [],
    _getInstance: function ()
    {
        for (var i = 0; i < this._objPool.length; i ++)
        {
            if (this._objPool[i].readyState == 0 || this._objPool[i].readyState == 4)
            {
                return this._objPool[i];
            }
        }
        // IE5中不支持push方法
        this._objPool[this._objPool.length] = this._createObj();
        return this._objPool[this._objPool.length - 1];
    },
    _createObj: function ()
    {
        if (window.XMLHttpRequest) //Mozilla 浏览器
        {
            var objXMLHttp = new XMLHttpRequest();
        }
        else
        {
			//以下行不是很稳定,并且PHP接收数据时要进行编码的转换(GET方式)
            //var MSXML = ['MSXML2.XMLHTTP.5.0', 'MSXML2.XMLHTTP.4.0', 'MSXML2.XMLHTTP.3.0', 'MSXML2.XMLHTTP', 'Microsoft.XMLHTTP'];
			//以下行比较稳定并且PHP接收数据时不要编码转换(GET方式)
            var MSXML = ['MSXML2.XMLHTTP', 'Microsoft.XMLHTTP'];
            for(var n = 0; n < MSXML.length; n ++)
            {
                try
                {
                    var objXMLHttp = new ActiveXObject(MSXML[n]);        
                    break;
                }
                catch(e)
                {
                }
            }
         }          
        // mozilla某些版本没有readyState属性
        if (objXMLHttp.readyState == null)
        {
            objXMLHttp.readyState = 0;
            objXMLHttp.addEventListener("load", function ()
                {
                    objXMLHttp.readyState = 4;
                    if (typeof objXMLHttp.onreadystatechange == "function")
                    {
                        objXMLHttp.onreadystatechange();
                    }
                },  false);
        }
        return objXMLHttp;
    },
    // 发送请求(方法[post,get], 地址, 数据, 回调函数)
    sendReq: function (method, url, data, function_name)
    {
        var objXMLHttp = this._getInstance();

        with(objXMLHttp)
        {
            try
            {
                // 加随机数防止缓存
                if (url.indexOf("?") > 0)
                {
                    url += "&randnum=" + Math.random();
                }
                else
                {
                    url += "?randnum=" + Math.random();
                }
                open(method, url, true);
                setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
                send(data);
                onreadystatechange = function ()
                {                   
                    if (objXMLHttp.readyState == 4 && (objXMLHttp.status == 200 || objXMLHttp.status == 304))
                    {
						if (function_name != null)
						{
							function_name(objXMLHttp.responseText); //ajax回调函数,不直接调用
						}
                    }
                }
            }
            catch(e)
            {
                alert('错误提示:' + e);
            }
        }
    }
};

/* 
   接口函数: AjAx GET方法请求
   Url:服务器端执行程序,如:  test.php?tag=2&name=yuanwei
   callBack:AjAx GET方法请求後所执行的回调函数,该函数接收Url所执行後返回的值
*/
function publicAjaxGET(url,callBack)
{
	PublicXMLHttp.sendReq('GET', url, '', callBack);
}
/*
    接口函数:AjAx POST方法发送
    Url:服务器端执行程序,如:  test.php?tag=2&name=yuanwei
    callBack:AjAx GET方法请求後所执行的函数,该函数接收Url所执行後返回的值
    poststr  = "username=" + user_info.user_name.value;
	poststr += "&userage=" + user_info.user_age.value;
	poststr += "&usersex=" + user_info.user_sex.value;
*/
function publicAjaxPOST(url,postStr,callBack)
{
	PublicXMLHttp.sendReq('POST', url, postStr, callBack);
}