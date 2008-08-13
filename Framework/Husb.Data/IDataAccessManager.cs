using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Husb.DataUtil;
using System.Data;

namespace Husb.Data
{
    public interface IDataAccessManager<S, T>
        where S : DataSet, new()
        where T : DataTable
    {
        T GetAll();
        T GetTable(string commandText, IEnumerable<DatabaseParameter> parameters, bool isStoredProc);
        void Fill(string commandText, IEnumerable<DatabaseParameter> parameters, bool isStoredProc, S dataSet, string tableName);
        void Fill(string commandText, IEnumerable<DatabaseParameter> parameters, bool isStoredProc, S dataSet, string[] tableNames);
        void Fill(S ds);
        int Update(S dataSet);
    }
}
