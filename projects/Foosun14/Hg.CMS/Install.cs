using System;
using System.Collections.Generic;
using System.Data;
using Hg.Model;
using Hg.DALFactory;

namespace Hg.CMS
{
    public class Install
    {
        private IInstall dal;
        public Install()
        {
            dal = DataAccess.CreateInstall();
        }

        public int InserAdmin(string UserName, string Password)
        {
            return dal.InserAdmin(UserName, Password);
        }
    }
}
