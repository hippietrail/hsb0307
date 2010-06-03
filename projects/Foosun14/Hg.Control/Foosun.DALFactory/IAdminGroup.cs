using System;
using System.Collections.Generic;
using System.Data;
using System.Reflection;

namespace Hg.DALFactory
{
    public interface IAdminGroup
    {
        int add(Hg.Model.AdminGroupInfo agci);
        int Edit(Hg.Model.AdminGroupInfo agci);
        void Del(string id);
        DataTable getInfo(string id);
        DataTable getClassList(string col, string TbName, string sqlselect);
        DataTable getColCname(string colname, string TbName, string classid, string id);
    }
    public sealed partial class DataAccess
    {
        public static IAdminGroup CreateAdminGroup()
        {
            string className = path + ".AdminGroup";
            return (IAdminGroup)Assembly.Load(path).CreateInstance(className);
        }
    }
}
