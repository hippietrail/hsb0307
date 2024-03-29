﻿//===========================================================
//==     (c)2007 Hg Inc. by WebFastCMS 1.0              ==
//==             Forum:bbs.hg.net                      ==
//==            website:www.hg.net                     ==
//==     Address:NO.109 HuiMin ST.,Chengdu ,China          ==
//==         TEL:86-28-85098980/66026180                   ==
//==         qq:655071,MSN:ikoolls@gmail.com               ==
//==               Code By JiangDong                       ==
//===========================================================
using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Hg.Model;
using Hg.DALFactory;

namespace Hg.CMS
{
    public class FreeLabel
    {

        private IFreeLabel dal;
        public FreeLabel()
        {
            dal = DataAccess.CreateFreeLabel();
        }
        public IList<FreeLablelDBInfo> GetTables()
        {
            return dal.GetTables();
        }
        public IList<FreeLablelDBInfo> GetFields(string TableName)
        {
            return dal.GetFields(TableName);
        }
        public bool IsNameRepeat(int id, string Name)
        {
            return dal.IsNameRepeat(id, Name);
        }
        public bool Add(FreeLabelInfo info)
        {
            info.SiteID = Hg.Global.Current.SiteID;
            return dal.Add(info);
        }
        public bool Update(FreeLabelInfo info)
        {
            return dal.Update(info);
        }
        public FreeLabelInfo GetSingle(int id)
        {
            return dal.GetSingle(id);
        }
        public bool Delete(int id)
        {
            return dal.Delete(id);
        }
        public DataTable TestSQL(string Sql)
        {
            return dal.TestSQL(Sql);
        }
    }
}