﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Reflection;

namespace Hg.DALFactory
{
    public interface ISearch
    {
        DataTable SearchGetPage(string DTable,int PageIndex, int PageSize, out int RecordCount, out int PageCount, Hg.Model.Search si);
        string getSaveClassframe(string ClassID);
    }
    public sealed partial class DataAccess
    {
        public static ISearch CreateSearch()
        {
            string className = path + ".Search";
            return (ISearch)Assembly.Load(path).CreateInstance(className);
        }
    }
}
