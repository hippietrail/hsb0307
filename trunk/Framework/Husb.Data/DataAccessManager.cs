using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Husb.DataUtil;
using System.Data;

namespace Husb.Data
{
    public class DataAccessManager<S, T, TDataAccessAdapter> : IDataAccessManager<S, T>
        where S : DataSet, new()
        where T : DataTable
        where TDataAccessAdapter : DataAccessAdapter<S, T>, new()
    {
        private static TDataAccessAdapter adapter = null;
        public static TDataAccessAdapter Adapter
        {
            get
            {
                if (adapter == null)
                {
                    adapter = new TDataAccessAdapter();
                }
                return adapter;
            }
        }

        #region IDataAccessManager<S,T> Members
        public static T GetAll()
        {
            //throw new Exception("The method or operation is not implemented.");
            //TDataAccessAdapter adapter = new TDataAccessAdapter();
            return GetAll(true, true, null);
            //return Adapter.GetAll();
        }

        public static T GetAll(bool isStoredProc, bool enableCache, string cacheKey)
        {
            //throw new Exception("The method or operation is not implemented.");
            //TDataAccessAdapter adapter = new TDataAccessAdapter();
            return Adapter.GetAll(isStoredProc, enableCache, cacheKey);
        }

        public static T GetTable(string commandText, List<DatabaseParameter> parameters, bool isStoredProc)
        {
            //throw new Exception("The method or operation is not implemented.");
            //TDataAccessAdapter adapter = new TDataAccessAdapter();
            return Adapter.GetTable(commandText, parameters, isStoredProc);
        }

        public static S GetDataSet(string commandText, IEnumerable<DatabaseParameter> parameters, bool isStoredProc, bool enableCache, string cacheKey)
        {
            return Adapter.GetDataSet(commandText, parameters, isStoredProc, enableCache, cacheKey);
        }

        public static S GetDataSet(string commandText, IEnumerable<DatabaseParameter> parameters, bool enableCache)
        {
            return Adapter.GetDataSet(commandText, parameters, true, enableCache, null);
        }

        public static void Fill(string commandText, IEnumerable<DatabaseParameter> parameters, bool isStoredProc, S dataSet, string tableName, bool enableCache, string cacheKey)
        {
            //throw new Exception("The method or operation is not implemented.");
            //TDataAccessAdapter adapter = new TDataAccessAdapter();
            Adapter.Fill(commandText, parameters, isStoredProc, dataSet, tableName, enableCache, cacheKey);
        }

        public static void Fill(string commandText, IEnumerable<DatabaseParameter> parameters, bool isStoredProc, S dataSet, bool enableCache, string cacheKey)
        {
            Adapter.Fill(commandText, parameters, isStoredProc, dataSet, dataSet.Tables[0].TableName, enableCache, cacheKey);
        }

        public static void Fill(string commandText, IEnumerable<DatabaseParameter> parameters, S dataSet, bool enableCache)
        {
            Adapter.Fill(commandText, parameters, true, dataSet, dataSet.Tables[0].TableName, enableCache, null);
        }

        public static void Fill(string commandText, List<DatabaseParameter> parameters, S dataSet, string[] tableNames, bool enableCache)
        {
            //throw new Exception("The method or operation is not implemented.");
            //TDataAccessAdapter adapter = new TDataAccessAdapter();
            Adapter.Fill(commandText, parameters, true, dataSet, tableNames, enableCache, null);
        }

        public static void Fill(S ds, string tableName)
        {
            Adapter.Fill(ds, tableName);
        }

        public static void Fill(S ds, bool enableCache)
        {
            Adapter.Fill(ds, enableCache);
        }

        public static void Fill(S ds)
        {
            //TDataAccessAdapter adapter = new TDataAccessAdapter();
            Adapter.Fill(ds);
            //throw new Exception("The method or operation is not implemented.");
        }

        public static int Update(DataSet dataSet)
        {
            //throw new Exception("The method or operation is not implemented.");
            //TDataAccessAdapter adapter = new TDataAccessAdapter();
            return Adapter.Update(dataSet);
        }

        public static int Update(DataSet dataSet, bool isStoredProc, bool removeCache, string[] cacheItemKeys)
        {
            //throw new Exception("The method or operation is not implemented.");
            //TDataAccessAdapter adapter = new TDataAccessAdapter();
            return Adapter.Update(dataSet, isStoredProc, removeCache, cacheItemKeys);
        }

        public static int Update(DataSet dataSet, bool removeCache, string[] cacheItemKeys)
        {
            //throw new Exception("The method or operation is not implemented.");
            //TDataAccessAdapter adapter = new TDataAccessAdapter();
            return Adapter.Update(dataSet, true, removeCache, cacheItemKeys);
        }



        #endregion

        #region IDataAccessManager<S,T> Members

        T IDataAccessManager<S, T>.GetTable(string commandText, IEnumerable<DatabaseParameter> parameters, bool isStoredProc)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        void IDataAccessManager<S, T>.Fill(string commandText, IEnumerable<DatabaseParameter> parameters, bool isStoredProc, S dataSet, string tableName)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        void IDataAccessManager<S, T>.Fill(S ds)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        int IDataAccessManager<S, T>.Update(S dataSet)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        T IDataAccessManager<S, T>.GetAll()
        {
            throw new Exception("The method or operation is not implemented.");
        }

        #endregion

        #region IDataAccessManager<S,T> Members


        //public void Fill(string commandText, List<DatabaseParameter> parameters, bool isStoredProc, S dataSet, string[] tableNames)
        //{
        //    throw new Exception("The method or operation is not implemented.");
        //}

        #endregion



        #region IDataAccessManager<S,T> Members


        void IDataAccessManager<S, T>.Fill(string commandText, IEnumerable<DatabaseParameter> parameters, bool isStoredProc, S dataSet, string[] tableNames)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        #endregion
    }
}
