function getDivsPicFromContent()
{
   var gtf=document.getElementById("sPicFromContent"); 
   var gid=document.getElementById("getContentNum"); 
   if(gtf.checked)
   {
       gid.style.display="";
   }
   else
   {
       gid.style.display="none";
   }
}

function checkNews()
{
    if(document.getElementById("ClassID").value=="")
    {
        alert("填写栏目."); 
        document.getElementById("baseinfo").style.display="";
        document.getElementById("ClassName").focus();
        return false;
    }
    if(document.getElementById("NewsTitle").value=="")
    {
        alert("请填写标题."); 
        document.getElementById("baseinfo").style.display="";
        document.getElementById("NewsTitle").focus();
        return false;
    }
    if(document.getElementById("sPicFromContent").checked)
    {
        if(oUtil.oEditor.document.body.innerHTML.toLowerCase().indexOf("<img")==-1&&oUtil.oEditor.document.body.innerHTML.toLowerCase().indexOf("src="))
        {
            alert("您设置了把内容中第一条图片设置为图片地址\n但内容中并没有图片");
            document.getElementById("baseinfo").style.display="";
            return false;
        }
    }
    
    if(!document.getElementById("at2RandButton").checked)
    {
    
    }
    else
    {
        if(document.getElementById("URLaddress").value=="")
        {
            alert("请填写外部连接地址."); 
            document.getElementById("baseinfo").style.display="";
            document.getElementById("URLaddress").focus();
            return false;
        }
    }
    if(document.getElementById("RemoteTF").checked)
    {
        alert('您选择了新闻内容中的图片下载到本地.\n在保存新闻需要较长时间。请耐心等待，不要刷新本页面。')
        return true;
    }
}

function titleFlag(obj)
{
    var t = document.getElementById("NewsTitle");
    if(t.value!="" && obj!="类型") {
        if (t.value.indexOf(obj) > -1) {
            return;
        }
        if(obj == "【荐】" || obj=="【HOT】")
        {
             t.value = t.value + obj;
             return;
        }
        t.value = obj + t.value;
    }
    else
    {
       //alert("您还没有填写标题呢。");
    }
}


function sdefine(obj,str)
{
   var objstrName = str;
   document.getElementById(objstrName).value=obj;
   return;
}

        
setCookie("subTitle_num",0);
function ShowAdanceTF(obj)
{
       if(obj.checked)
       {
            document.getElementById("captionadv").src = "../../sysImages/folder/hidead.gif";
            document.getElementById('div_Click').style.display = "";
            document.getElementById('div_metakey').style.display="";
            document.getElementById('div_metadesc').style.display="";
            document.getElementById('div_SavePath').style.display = "";
            document.getElementById('div_FileName').style.display = "";
            document.getElementById('div_FileEXName').style.display = "";
            document.getElementById('div_CheckStat').style.display = "";
            document.getElementById('div_UserPop1').style.display = "";
            document.getElementById('div_VoteTF').style.display = "";
            document.getElementById('div_VoteContent').style.display = "";
            document.getElementById('div_ContentPicTF').style.display = "";
            document.getElementById('div_ContentPicURL').style.display = "";
            document.getElementById('div_tHight').style.display = "";
            
        }
        else
        {
            document.getElementById("captionadv").src = "../../sysImages/folder/showad.gif";
            document.getElementById('div_Click').style.display = "none";
            document.getElementById('div_metakey').style.display="none";
            document.getElementById('div_metadesc').style.display="none";
            document.getElementById('div_SavePath').style.display = "none";
            document.getElementById('div_FileName').style.display = "none";
            document.getElementById('div_FileEXName').style.display = "none";
            document.getElementById('div_CheckStat').style.display = "none";
            document.getElementById('div_UserPop1').style.display = "none";
            document.getElementById('div_VoteTF').style.display = "none";
            document.getElementById('div_VoteContent').style.display = "none";
            document.getElementById('div_ContentPicTF').style.display = "none";
            document.getElementById('div_ContentPicURL').style.display = "none";
            document.getElementById('div_tHight').style.display = "none";
        }
}

function TTClick(obj)
{
       if(obj.checked)
       {
            document.getElementById('div_TT').style.display = "";
        }
        else
        {
            document.getElementById('div_TT').style.display = "none";
        }
} 
function TTClick1(obj)
{
       if(obj.checked)
       {
            document.getElementById('div_TTSE').style.display = "";
        }
        else
        {
            document.getElementById('div_TTSE').style.display = "none";
            document.getElementById('div_TT').style.display = "none";
        }
}

function showfiles(obj)
{
       if(obj.checked)
       {
            document.getElementById('isFiles_div1').style.display = "";
        }
        else
        {
            document.getElementById('isFiles_div1').style.display = "none";
        }
}

function NaviClick(obj)
{
       if(obj.checked)
       {
            document.getElementById('div_naviContent').style.display = "";
        }
        else
        {
            document.getElementById('div_naviContent').style.display = "none";
        }
}

function AddSubTF(obj)
{
       if(obj.checked)
       {
            document.getElementById('div_SubList').style.display = "";
            document.getElementById('div_UnnewsIframe').innerHTML = "<iframe id=\"Iframe1\" name=\"DisNews\" src=\"unnews_iframe.aspx\" width=\"100%\" frameborder=\"0\" height=\"400\">";
            //showDivs(obj);
        }
        else
        {
            document.getElementById('div_SubList').style.display = "none";
            document.getElementById('div_UnnewsIframe').innerHTML = "";
            //showDivs(obj);
        }
}



function showDivs(obj)
{
     var d1 = document.getElementById('shDivs');
     var d2 = document.getElementById('div_SubList');
     if(d2.style.display=="")
     {
        d2.style.display = "none";
        d1.innerHTML = "<font color=\"#FF0000\">(显示子类选择)</font>";
     }
     else
     {
        d2.style.display = "";
        d1.innerHTML = "<font color=\"#FF0000\">(隐藏子类选择)</font>";
     }
}


function IsVoteTF(obj)
{
       if(obj.checked)
       {
            document.getElementById('div_VoteContent').style.display = "";
        }
        else
        {
            document.getElementById('div_VoteContent').style.display = "none";
        }
} 

function showHw(obj)
{
       if(obj.checked)
       {
            document.getElementById('Div_hw').style.display = "";
        }
        else
        {
            document.getElementById('Div_hw').style.display = "none";
        }
}

function ContentPicURLTF(obj)
{
       if(obj.checked)
       {
            document.getElementById('div_ContentPicURL').style.display = "";
            document.getElementById('div_tHight').style.display = "";
        }
        else
        {
            document.getElementById('div_ContentPicURL').style.display = "none";
            document.getElementById('div_tHight').style.display = "none";
        }
}     


function ShowLink(NewsType)
{
    switch (NewsType)
    {
    case "word":
	    document.getElementById('div_showad').style.display='';
	    document.getElementById('div_URLaddress').style.display='none';
	    document.getElementById('div_PicURL').style.display='none';
	    document.getElementById('div_Content').style.display='';
	    document.getElementById('div_Templet').style.display='';
	    document.getElementById('div_Souce').style.display='';
	    document.getElementById('NewsProperty_CommTF').style.display='';
	    document.getElementById('NewsProperty_DiscussTF').style.display='';
	    document.getElementById('NewsProperty_FILTTF').style.display='none';
        document.getElementById('isFiles_div').style.display ="";
        document.getElementById('isFiles_div1').style.display ="";
        document.getElementById('div_vURL').style.display = "";
	    break;
    case "pic":
	    document.getElementById('div_showad').style.display='';
	    document.getElementById('div_URLaddress').style.display='none';
	    document.getElementById('div_PicURL').style.display='';
	    document.getElementById('div_Content').style.display='';
	    document.getElementById('div_Templet').style.display='';
	    document.getElementById('div_Souce').style.display='';
	    document.getElementById('NewsProperty_CommTF').style.display='';
	    document.getElementById('NewsProperty_DiscussTF').style.display='';
	    document.getElementById('NewsProperty_FILTTF').style.display='';
        document.getElementById('isFiles_div').style.display ="";
        document.getElementById('isFiles_div1').style.display ="";
        document.getElementById('div_vURL').style.display = "";
	    break;
    default :
	    document.getElementById('div_showad').style.display='none';
	    document.getElementById('div_URLaddress').style.display='';
	    document.getElementById('div_PicURL').style.display='';
	    document.getElementById('div_Content').style.display='none';
	    document.getElementById('div_Templet').style.display='none';
	    document.getElementById('div_Souce').style.display='';
	    document.getElementById('NewsProperty_CommTF').style.display='none';
	    document.getElementById('NewsProperty_DiscussTF').style.display='none';
	    document.getElementById('NewsProperty_FILTTF').style.display='';
	    document.getElementById('div_naviContent').style.display='none';
        document.getElementById('div_ContentPicURL').style.display = "none";
        document.getElementById('div_tHight').style.display = "none";
        document.getElementById('div_VoteContent').style.display = "none";
        document.getElementById('div_UserPop1').style.display = "none";
        document.getElementById('div_VoteTF').style.display = "none";
        document.getElementById('div_ContentPicTF').style.display = "none";
        document.getElementById('div_Click').style.display = "none";
        document.getElementById('div_metakey').style.display="none";
        document.getElementById('div_metadesc').style.display="none";
        document.getElementById('div_SavePath').style.display = "none";
        document.getElementById('div_FileName').style.display = "none";
        document.getElementById('div_FileEXName').style.display = "none";
        document.getElementById('isFiles_div').style.display ="none";
        document.getElementById('isFiles_div1').style.display ="none";
        document.getElementById('div_vURL').style.display = "none";
    }
}
    
    function ZoonEdit(obj)
    {
       document.getElementById('EditSizeID').style.height=obj+'px';
    }  
    
    function getReview()
    {
        if(document.getElementById("topFontInfo").value==""&&document.getElementById("NewsTitle").value=="")
        {
            alert('请填写生成头条的文字')
            return;
        }
        var fontColor = document.getElementById("fontColor").value;
        var fontsize = document.getElementById("PagefontSize").value;
        var widhts = document.getElementById("PagePicwidth").value;
        var Imagesbgcolor = document.getElementById("Imagesbgcolor").value;
        var PageFontFamily = document.getElementById("PageFontFamily").value;
        var PageFontStyle = document.getElementById("PageFontStyle").value;
        var topFontInfo = "";
        if(document.getElementById("topFontInfo").value!="")
        {
                topFontInfo = document.getElementById("topFontInfo").value;
        }
        else
        {
                topFontInfo = document.getElementById("NewsTitle").value;
        }

        PageFontFamily=encodeURI(PageFontFamily);
        topFontInfo=encodeURI(topFontInfo);
        if(document.getElementById("PicTTTF").checked==true)
        {
           var WWidth = (window.screen.width-500)/2;
           var Wheight = (window.screen.height-150)/2;
           window.open('news_addReviewTT.aspx?PageFontStyle='+PageFontStyle+'&fontcolor='+fontColor+'&fontsize='+fontsize+'&widhts='+widhts+'&Imagesbgcolor='+Imagesbgcolor+'&topFontInfo='+topFontInfo+'&PageFontFamily='+PageFontFamily+'','reviewTT','toolbar=0,location=0,maximize=1,directories=0,status=1,menubar=0,scrollbars=1,resizable=1,top=50,left=50,width=700,height=120 top='+Wheight+', left='+WWidth+', toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no','');
        }
    }
    function UpFile(path)
    {
        var WWidth = (window.screen.width-500)/2;
        var Wheight = (window.screen.height-150)/2;
        window.open("../../configuration/system/Upload.aspx?Path="+path+"&upfiletype=files", '文件上传', 'height=200, width=500, top='+Wheight+', left='+WWidth+', toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no'); 
    }
    
    function insertHTMLEdit(url)
    {
        var urls = url.replace('{@dirfile}',dirFile)
        var oEditor = FCKeditorAPI.GetInstance("FileContent");
        if (oEditor.EditMode==FCK_EDITMODE_WYSIWYG)
        {
           oEditor.InsertHtml('<img src=\"'+urls+'\" border=\"0\" />');
        }
        else
        {
            return false;
        }
        return;
    }
    
    function addSource(obj){document.getElementById("Souce").value= obj;}
    
    function addAuthor(obj){document.getElementById("Author").value= obj;}
    function addTags(obj)
    {
        var s = document.getElementById("Tags").value;
        if(s!="")
        {
            if(s.indexOf(obj)==-1)
            {
                document.getElementById("Tags").value= s + "|" +obj;
            }
        }
        else
        {
            document.getElementById("Tags").value= obj;
        }
    }
    function AddMetaTags(obj)
    {
        var s = document.getElementById("Metakeywords").value;
        if(s!="")
        {
            if(s.indexOf(obj)==-1)
            {
                document.getElementById("Metakeywords").value= s + "|" +obj;
            }
        }
        else
        {
            document.getElementById("Metakeywords").value= obj;
        }
    }
   
  //添加附件地址
    setCookie("URL_txt_num",1);
    function Url_add()
    {
        var num = 1;
        if(getCookie("URL_txt_num") != null || getCookie("URL_txt_num")!= "null")
        {
	        num = parseInt(getCookie("URL_txt_num"));
	        if(num>99)
	        {
	            return;
	        }
	        num = num +1;
	        setCookie("URL_txt_num",num);
	    }
        var chars = "1234567890";
        var randNum = makeRandChar(chars,20);
        var tempstr = "<div id='"+randNum+"'>名称：<input name='URLName' type='text' style='width:100px;' maxlength='50' value='' class='form' id='URLName' />&nbsp;地址：<input name='FileUrl' type='text' style='width:250px;' maxlength='220' value='' class='form' id='FileUrl"+randNum+"' />&nbsp;<img src=\"../../sysImages/folder/s.gif\" alt=\"选择附件\" border=\"0\" style=\"cursor:pointer;\" onclick=\"selectFile('file',document.Form1.FileUrl"+randNum+",280,500);document.Form1.FileUrl"+randNum+".focus();\" />&nbsp; 排序 <input name='FileOrderID' type='text' id='FileOrderID' value='0' style='width:50px;' maxlength='1' class='form' />&nbsp<a href='javascript:void(0);' onclick='URL_delete(this.parentNode)' class='list_link'>删除</a></div>"; 
        document.getElementById("temp").innerHTML+=tempstr;
    }
    function URL_delete(divobj)
    {
        divobj.parentNode.removeChild(divobj);  
        var num = parseInt(getCookie("URL_txt_num"));
        num = num - 1;
        var l=document.getElementsByName("fids").length;
        if(num<=0)
        {
            var obj=document.getElementById("isfiles")
            obj.checked=false;
           
        }
        else
        {
           var obj=document.getElementById("isfiles")
           obj.checked=true;
           showfiles(obj);
        }
	    setCookie("URL_txt_num",num);
    }

    function makeRandChar(chars,marklen)
    {//创建随机数
        var tmpstr = '';
        var chrlen = chars.length;
        var iRandom ;
        do{
            iRandom = Math.round(Math.random() * chrlen);
            tmpstr += chars.charAt(iRandom);
            if( tmpstr.length == marklen ) break;    
        }while (tmpstr.length < marklen)
        return tmpstr;
    }  
    function ivurl()
    {
        var gvURL=document.getElementById("vURL");
        var gvalur =gvURL.value;
        if(gvalur!="")
        {
            if(gvalur.indexOf(".")>-1)
            {
                gvalur=gvalur.toLowerCase().replace('{@dirfile}',dirFile)
                var fileExstarpostion = gvalur.lastIndexOf(".");
                var fileExName = gvalur.substring(fileExstarpostion,(gvalur.length))
                var content="";
	            switch(fileExName.toLowerCase())
	            {
	                case ".jpg":case ".gif":case ".bmp":case ".ico":case ".png":case ".jpeg":case ".tif":case ".rar": case ".doc":case ".zip":case ".txt":
                        alert("错误的视频文件");return false;
                        break;
	                case ".swf":
                        var content = "<object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0\" width=\"600\" height=\"400\">";
                        content+="<param name=\"movie\" value=\""+gvalur+"\" />"
                        content+="<param name=\"quality\" value=\"high\" />"
                        content+="<embed src=\""+gvalur+"\" quality=\"high\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" type=\"application/x-shockwave-flash\"></embed>"
                        content+="</object>"
//                   
                        break;
	                case ".flv":
                        var content ="<object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0\" width=\"660\" height=\"460\">"+
                        "<param name=\"movie\" value=\"/vcastr22.swf\">"+ //"+getSiteRoot+"
                        "<param name=\"quality\" value=\"high\">"+ 
                        "<param name=\"allowFullScreen\" value=\"true\" />"+
                        "<param name=\"FlashVars\" value=\"vcastr_file="+gvalur+"\" />"+
                        "<embed src=\""+getSiteRoot+"/vcastr22.swf\" FlashVars=\"vcastr_file="+gvalur+"\" allowFullScreen=\"true\" autostart=\"true\" quality=\"high\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" type=\"application/x-shockwave-flash\" width=\"660\" height=\"460\"></embed>"+
                        "</object>";
                        break;
                    case ".avi":
//                       
                            content = "<embed  src=\""+gvalur+"\" width=\"340\" height=\"240\"></embed>";
                        break;
                    case ".wmv":
                   
//                      
                         content="<EMBED height=360 pluginspage=http://www.macromedia.com/go/getflashplayer "+
                                 "src="+ gvalur + " type=application/x-shockwave-flash width=500 wmode=\"transparent\" quality=\"high\"></EMBED> "
                        break;
                    case ".mpg":
                         content="<object classid=\"clsid:05589FA1-C356-11CE-BF01-00AA0055595A\" id=\"ActiveMovie1\" width=\"500\"  >\r\n"+
                            "<param name=\"Appearance\" value=\"0\">\r\n"+
                            "<param name=\"AutoStart\" value=\"-1\">\r\n"+
                            "<param name=\"AllowChangeDisplayMode\" value=\"-1\">\r\n"+
                            "<param name=\"AllowHideDisplay\" value=\"0\">\r\n"+
                            "<param name=\"AllowHideControls\" value=\"-1\">\r\n"+
                            "<param name=\"AutoRewind\" value=\"-1\">\r\n"+
                            "<param name=\"Balance\" value=\"0\">\r\n"+
                            "<param name=\"CurrentPosition\" value=\"0\">\r\n"+
                            "<param name=\"DisplayBackColor\" value=\"0\">\r\n"+
                            "<param name=\"DisplayForeColor\" value=\"16777215\">\r\n"+
                            "<param name=\"DisplayMode\" value=\"0\">\r\n"+
                            "<param name=\"Enabled\" value=\"-1\">\r\n"+
                            "<param name=\"EnableContextMenu\" value=\"-1\">\r\n"+
                            "<param name=\"EnablePositionControls\" value=\"-1\">\r\n"+
                            "<param name=\"EnableSelectionControls\" value=\"0\">\r\n"+
                            "<param name=\"EnableTracker\" value=\"-1\">\r\n"+
                            "<param name=\"Filename\" value=\"" + gvalur + "\" valuetype=\"ref\">\r\n"+
                            "<param name=\"FullScreenMode\" value=\"0\">\r\n"+
                            "<param name=\"MovieWindowSize\" value=\"0\">\r\n"+
                            "<param name=\"PlayCount\" value=\"1\">\r\n"+
                            "<param name=\"Rate\" value=\"1\">\r\n"+
                            "<param name=\"SelectionStart\" value=\"-1\">\r\n"+
                            "<param name=\"SelectionEnd\" value=\"-1\">\r\n"+
                            "<param name=\"ShowControls\" value=\"-1\">\r\n"+
                            "<param name=\"ShowDisplay\" value=\"-1\">\r\n"+
                            "<param name=\"ShowPositionControls\" value=\"0\">\r\n"+
                            "<param name=\"ShowTracker\" value=\"-1\">\r\n"+
                            "<param name=\"Volume\" value=\"-480\">\r\n"+
                            "</object>\r\n";
                        break;
                    case ".rm": case ".rmvb":
                            content="<object id=\"vid\" classid=\"clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA\" width=\"500\" height=\"400\" >\r\n"+ 
                                "<param name=\"_ExtentX\" value=\"11298\">\r\n"+ 
                                "<param name=\"_ExtentY\" value=\"7938\">\r\n"+ 
                                "<param name=\"AUTOSTART\" value=\"true\">\r\n"+ 
                                "<param name=\"SHUFFLE\" value=\"0\">\r\n"+ 
                                "<param name=\"PREFETCH\" value=\"0\">\r\n"+ 
                                "<param name=\"NOLABELS\" value=\"-1\">\r\n"+ 
                                "<param name=\"SRC\" value=\""+gvalur+"\">\r\n"+ 
                                "<param name=\"CONTROLS\" value=\"Imagewindow\">\r\n"+ 
                                "<param name=\"CONSOLE\" value=\"clip1\">\r\n"+ 
                                "<param name=\"LOOP\" value=\"0\">\r\n"+ 
                                "<param name=\"NUMLOOP\" value=\"0\">\r\n"+ 
                                "<param name=\"CENTER\" value=\"0\">\r\n"+ 
                                "<param name=\"MAINTAINASPECT\" value=\"0\">\r\n"+ 
                                "<param name=\"BACKGROUNDCOLOR\" value=\"#000000\">\r\n"+ 
                                "</object>\r\n"+
                                "<BR>\r\n"+
                                "<object id=\"vid2\" classid=\"clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA\" width=\"500\" height=\"30\" >\r\n"+ 
                                "<param name=\"_ExtentX\" value=\"11298\">\r\n"+ 
                                "<param name=\"_ExtentY\" value=\"794\">\r\n"+ 
                                "<param name=\"AUTOSTART\" value=\"true\">\r\n"+
                                "<param name=\"SHUFFLE\" value=\"0\">\r\n"+
                                "<param name=\"PREFETCH\" value=\"0\">\r\n"+
                                "<param name=\"NOLABELS\" value=\"-1\">\r\n"+
                                "<param name=\"SRC\" value=\""+ gvalur + "\">\r\n"+
                                "<param name=\"CONTROLS\" value=\"ControlPanel\">\r\n"+
                                "<param name=\"CONSOLE\" value=\"clip1\">\r\n"+
                                "<param name=\"LOOP\" value=\"0\">\r\n"+
                                "<param name=\"NUMLOOP\" value=\"0\">\r\n"+
                                "<param name=\"CENTER\" value=\"0\">\r\n"+
                                "<param name=\"MAINTAINASPECT\" value=\"0\">\r\n"+
                                "<param name=\"BACKGROUNDCOLOR\" value=\"#000000\">\r\n"+ 
                                "</object>\r\n";

                          break;
                    default:
//                       
                              
                              content = "<object   id=\"WMPlay\"   style=\"WIDTH:300px;height:200px\"  "+
                                "classid=\"CLSID:6BF52A52-394A-11D3-B153-00C04F79FAA6\"   type=application/x-oleobject   standby=\"Loading   Windows   Media   Player   components...\""+
                                "codebase=\"downloads/mediaplayer9.0_cn.exe\"   VIEWASTEXT>\n"+
                                "<param   name=\"URL\"   value='" + gvalur + "'>\n"+
                                "<param   name=\"controls\"   value=\"ControlPanel,StatusBa\">"+
                                "<param   name=\"hidden\"   value=\"1\">"+
                                "<param   name=\"ShowControls\"   VALUE=\"0\">"+
                                "<param   name=\"rate\"   value=\"1\">\n"+
                                "<param   name=\"balance\"   value=\"0\">\n"+
                                "<param   name=\"currentPosition\"   value=\"0\">\n"+
                                "<param   name=\"defaultFrame\"   value=\"\">\n"+
                                "<param   name=\"playCount\"   value=\"100\">"+
                                "<param   name=\"autoStart\"   value=\"-1\">"+
                                "<param   name=\"currentMarker\"   value=\"0\">"+
                                "<param   name=\"invokeURLs\"   value=\"-1\">"+
                                "<param   name=\"baseURL\"   value=\"\">"+
                                "<param   name=\"volume\"   value=\"85\">"+
                                "<param   name=\"mute\"   value=\"0\">"+
                                "<param   name=\"uiMode\"   value=\"full\">"+
                                "<param   name=\"stretchToFit\"   value=\"0\">"+
                                "<param   name=\"windowlessVideo\"   value=\"0\">"+
                                "<param   name=\"enabled\"   value=\"-1\">"+
                                "<param   name=\"enableContextMenu\"   value=\"false\">"+
                                "<param   name=\"fullScreen\"   value=\"0\">"+
                                "<param   name=\"SAMIStyle\"   value=\"\">"+
                                "<param   name=\"SAMILang\"   value=\"\">"+
                                "<param   name=\"SAMIFilename\"   value=\"\">"+
                                "<param   name=\"captioningID\"   value=\"\">"+
                                "</object>"
                              
                        break;
                    }
                    var oEditor = FCKeditorAPI.GetInstance("FileContent");
                    if (oEditor.EditMode==FCK_EDITMODE_WYSIWYG)
                    {
                       oEditor.InsertHtml(content);
                    }
                    else
                    {
                        return false;
                    }
            }
            else
            {
                alert('错误的视频');
                return false;
            }
        }
        else
        {
            alert('没有视频文件');
            return false;
        }
    } 
    function insertPageStr()
    {
	   var str=document.getElementById("PageTitle");
	   if(str.value!="")
	   {
            var oEditor = FCKeditorAPI.GetInstance("FileContent");
            if (oEditor.EditMode==FCK_EDITMODE_WYSIWYG)
            {
               oEditor.InsertHtml('[FS:PAGE='+str.value+'$]');
            }
            else
            {
                return false;
            }
        }
        else
        {
            var oEditor = FCKeditorAPI.GetInstance("FileContent");
            if (oEditor.EditMode==FCK_EDITMODE_WYSIWYG)
            {
               oEditor.InsertHtml('[FS:PAGE]');
            }
            else
            {
                return false;
            }
        }
	}
function vote(value)
{
    if(value!="")
    {
        var oEditor = FCKeditorAPI.GetInstance("FileContent");
        if (oEditor.EditMode==FCK_EDITMODE_WYSIWYG)
        {
           oEditor.InsertHtml('[FS:unLoop,FS:SiteID=0,FS:LabelType=surveyJS,FS:JSID='+value+'][/FS:unLoop]');
        }
        else
        {
            return false;
        }
    }
}

function Button1_onclick() {
 DisplayUnNews();
}