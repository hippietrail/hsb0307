﻿//===========================================================
//==     (c)2007 Hg Inc. by WebFastCMS 1.0                 ==
//==             Forum:bbs.hg.net                          ==
//==            website:www.hg.net                         ==
//==     Address:NO.109 HuiMin ST.,Chengdu ,China          ==
//==         TEL:86-28-85098980/66026180                   ==
//==         qq:655071,MSN:ikoolls@gmail.com               ==
//==               Code By Jiang.Dong                      ==
//===========================================================
using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Hg.Model;
using Hg.DALFactory;

namespace Hg.CMS
{
    public class Pagination
    {
        public static DataTable GetPage(string PageName, int PageIndex, int PageSize, out int RecordCount, out int PageCount, params SQLConditionInfo[] SqlCondition)
        {
            IPagination dal = DataAccess.CreatePagination();
            return dal.GetPage(PageName, PageIndex, PageSize, out RecordCount, out PageCount, SqlCondition);
        }
    }
}
