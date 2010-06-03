//===========================================================
//==     (c)2007 Hg Inc. by dotNETCMS 1.0              ==
//==             Forum:bbs.hg.net                      ==
//==            website:www.hg.net                     ==
//==     Address:NO.109 HuiMin ST.,Chengdu ,China          ==
//==         TEL:86-28-85098980/66026180                   ==
//==         qq:655071,MSN:ikoolls@gmail.com               ==
//==               Code By ZhenJiang.Wang                  ==
//===========================================================
using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Hg.DALFactory;
using Hg.Model;

namespace Hg.CMS
{
    public class Rss
    {
        private IRss dal;
        public Rss()
        {
            dal = Hg.DALFactory.DataAccess.CreateRss();
        }
        public int sel(string ClassID)
        {
            return dal.sel(ClassID);
        }

        public DataTable getxmllist(string ClassID)
        {
            DataTable dt = dal.getxmllist(ClassID);
            return dt;
        }

    }
}
