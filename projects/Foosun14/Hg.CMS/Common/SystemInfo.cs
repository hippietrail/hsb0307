﻿//===========================================================
//==     (c)2007 Hg Inc. by WebFastCMS 1.0              ==
//==             Forum:bbs.hg.net                      ==
//==            website:www.hg.net                     ==
//==     Address:NO.109 HuiMin ST.,Chengdu ,China          ==
//==         TEL:86-28-85098980/66026180                   ==
//==         qq:655071,MSN:ikoolls@gmail.com               ==
//==               Code By Y.xiaoBin                       ==
//===========================================================
using System;
using System.Collections.Generic;
using System.Text;
using System.Web;

namespace Hg.CMS.Common
{
    public class SystemInfo
    {
        public static string GetRootURI()
        {
            string AppPath = "";
            string UrlAuthority = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority);
            if (HttpContext.Current.Request.ApplicationPath == "/")
                //直接安装在   Web   站点   
                AppPath = UrlAuthority;
            else
                //安装在虚拟子目录下   
                AppPath = UrlAuthority + HttpContext.Current.Request.ApplicationPath;
            return AppPath;
        }
    }
}
