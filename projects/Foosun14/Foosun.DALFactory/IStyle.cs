using System;
using System.Collections.Generic;
using System.Data;
using System.Reflection;

namespace Hg.DALFactory
{
    public interface IStyle
    {
        int sytleClassAdd(Hg.Model.StyleClassInfo sc);
        int styleClassEdit(Hg.Model.StyleClassInfo sc);
        void styleClassDel(string id);
        void styleClassRDel(string id);
        int styleAdd(Hg.Model.StyleInfo sc);
        int styleEdit(Hg.Model.StyleInfo sc);
        void styleDel(string id);
        void styleRdel(string id);
        DataTable getstyleClassInfo(string id);
        DataTable getstyleInfo(string id);
        DataTable styledefine();
        DataTable styleClassList();
        int styleNametf(string CName);
    }
    public sealed partial class DataAccess
    {
        public static IStyle CreateStyle()
        {
            string className = path + ".Style";
            return (IStyle)Assembly.Load(path).CreateInstance(className);
        }
    }
}
