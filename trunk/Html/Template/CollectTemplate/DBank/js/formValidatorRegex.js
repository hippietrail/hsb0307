var regexEnum = 
{
	email:"^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$", //邮件
	//email:"^(\\w*[A-VX-Za-v-x-z0-9]+[\\.-])*\\w+\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$", //邮件	disable www.xxx@xx.com by Tan 2009.10.14
	chinese:"^[\\u4E00-\\u9FA5\\uF900-\\uFA2D]+$",					//仅中文
	notempty:"^\\S+$",						//非空
	username:"^\\w+$",						//用来用户注册。匹配由数字、26个英文字母或者下划线组成的字符串
	password:"^[A-Za-z0-9~!@#%\\^\\*\\(\\)\\-_\\.=\\+\\{\\}\\[\\]:;\"',/<>?\\|\\\\]+$",        //由英文字母a～z (区分大小写)，数字0～9，特殊字符组成,不包括&和$。
	engAndChinese:"^([\\u4E00-\\u9FA5]|[\\uF900-\\uFA2D]|[A-Za-z])+$",//英文和中文
	nickname:"^([\\u4E00-\\u9FA5]|[\\uF900-\\uFA2D]|[A-Za-z]|[0-9\.]|-|_)+$",
	captcha:"^[a-zA-Z0-9]+$"
}


