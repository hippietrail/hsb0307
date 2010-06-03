using System;
using System.Collections.Generic;
using System.Data;
using System.Reflection;

namespace Hg.DALFactory
{
    public interface ISpecial
    {
        DataTable getChildList(string classid);
        void Lock(string id);
        void UnLock(string id);
        void PDel(string id);
        void PDels(string id);
        void PLock(string id);
        void PUnLock(string id);
        void RemoveNews(string specialID, string newsID);
        string getSpicaelNewsNum(string id);
        string Add(Hg.Model.Special sci);
        int Edit(Hg.Model.Special sci);
        DataTable getSpeacilInfo(string id);
        IDataReader ToTempletBind(string ParentID);
        void BindSPTemplet(string SpecialID, string Templet);
        void DelSpecialByNewsId(string id);
        DataTable getSpecialBySQL(string _SpecialCName);
    }
    public sealed partial class DataAccess
    {
        public static ISpecial CreateSpecial()
        {
            string className = path + ".Special";
            return (ISpecial)Assembly.Load(path).CreateInstance(className);
        }
    }
}
