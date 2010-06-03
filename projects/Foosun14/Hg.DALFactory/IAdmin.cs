using System;
using System.Collections.Generic;
using System.Data;
using System.Reflection;

namespace Hg.DALFactory
{
    public interface IAdmin
    {
        void Lock(string id);
        void UnLock(string id);
        void Del(string id);
        DataTable GetAdminGroupList();
        DataTable GetSiteList();
        int Add(Hg.Model.AdminInfo aci);
        int Edit(Hg.Model.AdminInfo aci);
        DataTable GetAdminInfo(string id);
        string GetAdminPopList(string UserNum, int Id);
        void UpdatePOPlist(string UserNum, int Id, string PopLIST);
        DataTable getAdmininfoList();
    }
    public sealed partial class DataAccess
    {
        public static IAdmin CreateAdmin()
        {
            string className = path + ".Admin";
            return (IAdmin)Assembly.Load(path).CreateInstance(className);
        }
    }
}
