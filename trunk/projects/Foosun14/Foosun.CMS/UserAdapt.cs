using System;
using System.Collections.Generic;
using System.Text;
using Hg.DALFactory;
using Hg.Model;

namespace Hg.CMS
{
    public class UserAdapt
    {
        Hg.DALFactory.IUserAdapt dal;
        public UserAdapt()
        {
            dal = DataAccess.CreateUserAdapt();
        }

        public bool isExist(string username)
        {
            return dal.isExist(username);
        }

        public string getUserNumByUserName(string username)
        {
            return dal.getUserNumByUserName(username);
        }
    }
}
