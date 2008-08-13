using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using Husb.DataUtil;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Caching;

namespace Husb.Data
{
    public delegate void PopulateParameters(Database db, DbCommand cmd);
    public abstract class DataAccessAdapter<S, T>
        where S : DataSet, new()
        where T : DataTable
    {

        #region Fields
        private Database db;

        private DbDataAdapter adapter;
        private string tableName;
        private string masterTableName;
        private string detailTableName;
        private DbCommand selectCommand;

        private DbCommand insertCommand = null;
        private DbCommand updateCommand = null;
        private DbCommand deleteCommand = null;

        public string GetByIdStoredProc;
        public string GetAllStoredProc;
        public string InsertStoredProc;
        public string UpdateStoredProc;
        public string DeleteStoredProc;
        #endregion

        #region constructor
        public DataAccessAdapter()
        {
            db = DatabaseFactory.CreateDatabase();
            adapter = db.GetDataAdapter();
        }
        #endregion

        #region Properties
        public string TableName
        {
            get { return this.tableName; }
            set { this.tableName = value; }
        }

        public string MasterTableName
        {
            get { return this.masterTableName; }
            set { this.masterTableName = value; }
        }

        public string DetailTableName
        {
            get { return this.detailTableName; }
            set { this.detailTableName = value; }
        }
        #endregion

        #region Reject
        public DbDataAdapter Adapter
        {
            get
            {
                if ((this.adapter == null))
                {
                    this.InitAdapter();
                }
                return this.adapter;
            }
        }

        private void InitAdapter()
        {
            if (this.adapter == null)
            {
                this.adapter = db.GetDataAdapter();

            }
            System.Data.Common.DataTableMapping tableMapping = new System.Data.Common.DataTableMapping();

            tableMapping.SourceTable = "Table";
            //tableMapping.DataSetTable = "Departments";

            //CreateDataTableMapping(tableMapping); 

            //tableMapping.ColumnMappings.Add("Id", "Id");
            //tableMapping.ColumnMappings.Add("Name", "Name");
            //tableMapping.ColumnMappings.Add("ParentId", "ParentId");
            //tableMapping.ColumnMappings.Add("Category", "Category");
            //tableMapping.ColumnMappings.Add("DepartmentNumber", "DepartmentNumber");
            //tableMapping.ColumnMappings.Add("QueryNumber", "QueryNumber");
            //tableMapping.ColumnMappings.Add("IsDeleted", "IsDeleted");
            //tableMapping.ColumnMappings.Add("IsActive", "IsActive");
            //tableMapping.ColumnMappings.Add("CreatedTime", "CreatedTime");
            //tableMapping.ColumnMappings.Add("CreatedBy", "CreatedBy");
            //tableMapping.ColumnMappings.Add("ModifiedTime", "ModifiedTime");
            //tableMapping.ColumnMappings.Add("LastModifiedBy", "LastModifiedBy");
            //tableMapping.ColumnMappings.Add("Version", "Version");
            //tableMapping.ColumnMappings.Add("Description", "Description");

            this.adapter.TableMappings.Add(tableMapping);


        }

        //protected abstract void CreateDataTableMapping(System.Data.Common.DataTableMapping tableMapping);

        #endregion

        #region PrepareCommand

        protected DbCommand PrepareCommand(string commandText, IEnumerable<DatabaseParameter> parameters, bool isStoredProc)
        {
            if (db == null) db = DatabaseFactory.CreateDatabase();
            if (selectCommand == null)
            {
                selectCommand = db.GetStoredProcCommand(commandText);
            }
            else
            {
                selectCommand.Parameters.Clear();
                selectCommand.CommandText = commandText;
            }
            if (!isStoredProc)
            {
                selectCommand.CommandType = CommandType.Text;
            }

            //DbCommand cmd = isStoredProc ? db.GetStoredProcCommand(commandText) : cmd = db.GetSqlStringCommand(commandText);

            if (parameters != null)
            {
                DataAccessUtil.PopulateParamters(parameters, db, selectCommand);
            }

            return selectCommand;
        }

        protected DbCommand PrepareCommand(string commandText, PopulateParameters populateParameters, bool isStoredProc)
        {
            if (db == null) db = DatabaseFactory.CreateDatabase();
            if (selectCommand == null)
            {
                selectCommand = db.GetStoredProcCommand(commandText);
            }
            else
            {
                selectCommand.Parameters.Clear();
                selectCommand.CommandText = commandText;
            }
            if (!isStoredProc)
            {
                selectCommand.CommandType = CommandType.Text;
            }

            //DbCommand cmd = isStoredProc ? db.GetStoredProcCommand(commandText) : cmd = db.GetSqlStringCommand(commandText);
            if (populateParameters != null)
            {
                populateParameters(db, selectCommand);
            }

            return selectCommand;
        }

        protected DbCommand PrepareCommand(DbCommand cmd, string commandText, IEnumerable<DatabaseParameter> parameters, bool isStoredProc)
        {
            if (db == null) db = DatabaseFactory.CreateDatabase();
            if (cmd == null)
            {
                cmd = db.GetStoredProcCommand(commandText);
            }
            else
            {
                cmd.Parameters.Clear();
                cmd.CommandText = commandText;
            }
            if (!isStoredProc)
            {
                cmd.CommandType = CommandType.Text;
            }

            //DbCommand cmd = isStoredProc ? db.GetStoredProcCommand(commandText) : cmd = db.GetSqlStringCommand(commandText);

            if (parameters != null)
            {
                DataAccessUtil.PopulateParamters(parameters, db, cmd);
            }

            return cmd;
        }

        protected DbCommand PrepareCommand(DbCommand cmd, string commandText, PopulateParameters populateParameters, bool isStoredProc)
        {
            if (db == null) db = DatabaseFactory.CreateDatabase();
            if (cmd == null)
            {
                cmd = db.GetStoredProcCommand(commandText);
            }
            else
            {
                cmd.Parameters.Clear();
                cmd.CommandText = commandText;
            }
            if (!isStoredProc)
            {
                cmd.CommandType = CommandType.Text;
            }
            if (populateParameters != null)
            {
                populateParameters(db, cmd);
            }

            return cmd;
        }

        #endregion

        #region GetDataSet & GetTable
        /// <summary>
        /// 
        /// </summary>
        /// <param name="commandText"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public virtual T GetTable(string commandText, IEnumerable<DatabaseParameter> parameters)
        {
            S dataSet = GetDataSet(commandText, parameters, true, true, null);
            //db.LoadDataSet(PrepareCommand(commandText, parameters, isStoredProc), dataSet, this.TableName);

            return (T)dataSet.Tables[0];
            //return dataSet;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="commandText"></param>
        /// <param name="parameters"></param>
        /// <param name="isStoredProc"></param>
        /// <returns></returns>
        public virtual T GetTable(string commandText, IEnumerable<DatabaseParameter> parameters, bool enableCache)
        {

            S dataSet = GetDataSet(commandText, parameters, true, enableCache, null);
            //db.LoadDataSet(PrepareCommand(commandText, parameters, isStoredProc), dataSet, this.TableName);

            return (T)dataSet.Tables[0];
            //return dataSet;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="commandText"></param>
        /// <param name="parameters"></param>
        /// <param name="isStoredProc"></param>
        /// <param name="enableCache"></param>
        /// <returns></returns>
        public virtual T GetTable(string commandText, IEnumerable<DatabaseParameter> parameters, bool isStoredProc, bool enableCache)
        {

            S dataSet = GetDataSet(commandText, parameters, isStoredProc, enableCache, null);
            //db.LoadDataSet(PrepareCommand(commandText, parameters, isStoredProc), dataSet, this.TableName);

            return (T)dataSet.Tables[0];
            //return dataSet;
        }

        public virtual T GetTable(string commandText, IEnumerable<DatabaseParameter> parameters, bool isStoredProc, bool enableCache, string cacheKey)
        {

            S dataSet = GetDataSet(commandText, parameters, isStoredProc, enableCache, cacheKey);
            //db.LoadDataSet(PrepareCommand(commandText, parameters, isStoredProc), dataSet, this.TableName);

            return (T)dataSet.Tables[0];
            //return dataSet;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="commandText"></param>
        /// <param name="parameters"></param>
        /// <param name="isStoredProc"></param>
        /// <param name="enableCache"></param>
        /// <param name="cacheKey"></param>
        /// <returns></returns>
        public virtual S GetDataSet(string commandText, IEnumerable<DatabaseParameter> parameters, bool isStoredProc, bool enableCache, string cacheKey)
        {
            #region Pull Cache
            S dataSet = null;
            ICacheManager cacheManager = null;
            string key = "";
            if (enableCache)
            {
                if (!string.IsNullOrEmpty(cacheKey))
                {
                    key = cacheKey;
                }
                else
                {
                    key = DataAccessUtil.GenerateCacheKey(commandText, parameters);
                }
                cacheManager = CacheFactory.GetCacheManager();
                dataSet = cacheManager.GetData(key) as S;
                if (dataSet != null)
                {
                    return dataSet;
                }
            }
            #endregion

            #region LoadDataSetFromDB
            dataSet = new S();
            //string[] tableNames = new string[dataSet.Tables.Count];
            //for (int i = 0; i < dataSet.Tables.Count; i++)
            //{
            //    tableNames[i] = dataSet.Tables[i].TableName;
            //}

            //db.LoadDataSet(PrepareCommand(commandText, parameters, isStoredProc), dataSet, tableNames);
            db.LoadDataSet(PrepareCommand(commandText, parameters, isStoredProc), dataSet, dataSet.Tables[0].TableName);
            #endregion

            #region Push Cache
            if (enableCache && cacheManager != null)
            {
                if (dataSet.Tables[0].Rows.Count > 0)
                {
                    DataAccessUtil.InsertCache(key, dataSet, cacheManager);
                }
            }
            #endregion

            return dataSet;
        }

        /// <summary>
        /// 可以指定是否缓存当前的DataSet，命令名为存储过程名， 缓存Key根据存储过程名自动生成
        /// </summary>
        /// <param name="commandText"></param>
        /// <param name="parameters"></param>
        /// <param name="enableCache"></param>
        /// <returns></returns>
        public virtual S GetDataSet(string commandText, IEnumerable<DatabaseParameter> parameters, bool enableCache)
        {
            return GetDataSet(commandText, parameters, true, enableCache, null);
        }

        #endregion

        #region Fill

        public void Fill(string commandText, IEnumerable<DatabaseParameter> parameters, bool isStoredProc, S dataSet, string tableName, bool enableCache, string cacheKey)
        {
            #region Cache
            ICacheManager cacheManager = null;
            string key = commandText;
            if (enableCache)
            {
                if (!string.IsNullOrEmpty(cacheKey))
                {
                    key = cacheKey;
                }
                else
                {
                    key = DataAccessUtil.GenerateCacheKey(commandText, parameters);
                }
                cacheManager = CacheFactory.GetCacheManager();
                S ds = cacheManager.GetData(key) as S;

                if (ds != null)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        dataSet.Tables[0].ImportRow(row);
                    }
                    //dataSet = ds.Copy() as S;
                    return;
                }
            }
            #endregion

            db.LoadDataSet(PrepareCommand(commandText, parameters, isStoredProc), dataSet, tableName);

            #region Cache
            if (enableCache && cacheManager != null)
            {
                DataAccessUtil.InsertCache(key, dataSet, cacheManager);
            }
            #endregion
        }

        public void Fill(string commandText, IEnumerable<DatabaseParameter> parameters, bool isStoredProc, S dataSet, bool enableCache, string cacheKey)
        {
            Fill(commandText, parameters, isStoredProc, dataSet, dataSet.Tables[0].TableName, enableCache, cacheKey);
        }

        public void Fill(string commandText, IEnumerable<DatabaseParameter> parameters, S dataSet, bool enableCache)
        {
            Fill(commandText, parameters, true, dataSet, dataSet.Tables[0].TableName, enableCache, null);
        }

        //public void Fill(string commandText, IEnumerable<DatabaseParameter> parameters, bool isStoredProc, S dataSet, string tableName)
        //{
        //    Fill(commandText, parameters, isStoredProc, dataSet, tableName, false, null);
        //}

        public void Fill(string commandText, IEnumerable<DatabaseParameter> parameters, bool isStoredProc, S dataSet, string[] tableNames, bool enableCache, string cacheKey)
        {
            #region Cache
            ICacheManager cacheManager = null;
            string key = commandText;
            if (enableCache)
            {
                if (!string.IsNullOrEmpty(cacheKey))
                {
                    key = cacheKey;
                }
                else
                {
                    key = DataAccessUtil.GenerateCacheKey(commandText, parameters);
                }
                cacheManager = CacheFactory.GetCacheManager();
                S ds = cacheManager.GetData(key) as S;

                if (ds != null)
                {
                    //dataSet = ds.Copy() as S;
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        dataSet.Tables[0].ImportRow(row);
                    }
                    //dataSet.Tables[0] = ds.Tables[0];
                    return;
                }
            }
            #endregion

            db.LoadDataSet(PrepareCommand(commandText, parameters, isStoredProc), dataSet, tableNames);

            #region Cache
            if (enableCache && cacheManager != null)
            {
                DataAccessUtil.InsertCache(key, dataSet, cacheManager);
            }
            #endregion
        }

        public void Fill(S ds, string tableName, bool enableCache)
        {
            if (ds.Tables.Count > 0)
            {
                Fill(GetAllStoredProc, null, true, ds, tableName, enableCache, null);
            }
        }

        public void Fill(S ds, string tableName)
        {
            if (ds.Tables.Count > 0)
            {
                Fill(GetAllStoredProc, null, true, ds, tableName, false, null);
            }
        }

        public void Fill(S ds, bool enableCache)
        {
            if (ds.Tables.Count > 0)
            {
                Fill(GetAllStoredProc, null, true, ds, ds.Tables[0].TableName, enableCache, null);
            }
        }

        public void Fill(S ds)
        {
            if (ds.Tables.Count > 0)
            {
                Fill(GetAllStoredProc, null, true, ds, ds.Tables[0].TableName, false, null);
            }
        }
        #endregion

        #region Get
        public virtual T GetAll()
        {
            return this.GetTable(GetAllStoredProc, null, true);
        }

        public virtual T GetAll(bool isStoredProc, bool enableCache, string cacheKey)
        {
            return this.GetTable(GetAllStoredProc, null, isStoredProc, enableCache, cacheKey);
        }

        //public R GetById(Guid id)
        //{
        //    List<DatabaseParameter> ps = new List<DatabaseParameter>();
        //    ps.Add(new DatabaseParameter("Id", DbType.Guid, id));

        //    T t = GetTable(GetByIdStoredProc, ps, true);
        //    return t.Rows.Count > 0 ? (R)t.Rows[0] : null;
        //}
        #endregion

        #region GetValue
        public virtual object GetValue(string commandText, IEnumerable<DatabaseParameter> parameters, bool isStoredProc)
        {
            return db.ExecuteScalar(PrepareCommand(commandText, parameters, isStoredProc));
        }

        public virtual object GetValue(string commandText)
        {
            return GetValue(commandText, new List<DatabaseParameter>(), true);
        }


        #endregion

        #region ExecuteNonQuery
        protected virtual int ExecuteNonQuery(string commandText, IEnumerable<DatabaseParameter> parameters, bool isStoredProc)
        {
            int cnt = -1;

            cnt = db.ExecuteNonQuery(PrepareCommand(commandText, parameters, isStoredProc));
            if (cnt > 0)
            {
                DataAccessUtil.UpdateCacheDependency(DataAccessUtil.GetCacheKey(commandText));
            }
            return cnt;
        }
        #endregion

        #region UpdateDataSet
        /// <summary>
        /// 这里仅仅更新dataSet的TableName表
        /// </summary>
        /// <param name="dataSet"></param>
        /// <returns></returns>
        public int Update(DataSet dataSet, bool isStoredProc, bool removeCache, string[] cacheItemKeys)
        {
            //PopulateParameters insertParameter = new PopulateParameters(PopulateInsertParamters);
            //PopulateParameters updateParameter = new PopulateParameters(PopulateUpdateParamters);
            //PopulateParameters deleteParameter = new PopulateParameters(PopulateDeleteParamters);

            int cnt = db.UpdateDataSet(dataSet, dataSet.Tables[0].TableName,
                PrepareCommand(insertCommand, InsertStoredProc, new PopulateParameters(PopulateInsertParamters), isStoredProc),
                PrepareCommand(updateCommand, UpdateStoredProc, new PopulateParameters(PopulateUpdateParamters), isStoredProc),
                PrepareCommand(deleteCommand, DeleteStoredProc, new PopulateParameters(PopulateDeleteParamters), isStoredProc),
                UpdateBehavior.Standard);

            if (removeCache && cacheItemKeys != null)
            {
                DataAccessUtil.UpdateCacheDependency(cacheItemKeys);
                //CacheFactory.GetCacheManager().Remove(cacheKey);// GetCacheKey(CreateStoredProc)
            }
            return cnt;
        }

        public int Update(DataSet dataSet)
        {
            return Update(dataSet, true, true, new string[] { DataAccessUtil.GetCacheKey(UpdateStoredProc) });//dataSet.Tables[0].TableName
        }
        #endregion

        #region abstract & virtual method
        protected abstract void PopulateInsertParamters(Database db, DbCommand cmd);
        protected abstract void PopulateUpdateParamters(Database db, DbCommand cmd);
        protected abstract void PopulateDeleteParamters(Database db, DbCommand cmd);

        #endregion
    }
}
