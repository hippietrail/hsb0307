using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Common;

using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.Practices.EnterpriseLibrary.Caching.Expirations;
using Microsoft.Practices.EnterpriseLibrary.Caching;
using Husb.Util;

namespace Husb.DataUtil
{
    public static class DataAccessUtil
    {
        public static DbType GetDbType(string type)
        {
            DbType dbType = DbType.String;
            type = type.ToLower();
            switch (type)
            {
                case "int":
                    dbType = DbType.Int32;
                    break;
                case "string":
                    dbType = DbType.String;
                    break;
                case "guid":
                    dbType = DbType.Guid;
                    break;
                case "datetime":
                    dbType = DbType.DateTime;
                    break;
                case "decimal":
                    dbType = DbType.Decimal;
                    break;
                case "numberic":
                    dbType = DbType.Decimal;
                    break;
                case "boolean":
                    dbType = DbType.Boolean;
                    break;
                case "byte[]":
                    dbType = DbType.Binary;
                    break;
            }

            return dbType;
        }

        #region GetPartWhereCondition

        public static string GetPartWhereCondition(string propertyName, string propertyValue, bool isFull)
        {
            //string s = "";
            if (String.IsNullOrEmpty(propertyValue) || string.IsNullOrEmpty(CommonUtil.InputText(propertyValue))) return "";
            if (isFull)
            {
                return " AND " + propertyName + " = '" + CommonUtil.InputText(propertyValue) + "'";
            }
            else
            {
                return " AND " + propertyName + " LIKE '%" + CommonUtil.InputText(propertyValue) + "%'";
            }
        }

        public static string GetPartWhereCondition(string propertyName, string propertyValue)
        {
            return GetPartWhereCondition(propertyName, propertyValue, false);
        }

        public static string GetPartWhereCondition(string propertyName, System.Int32 propertyValue)
        {
            return propertyValue == System.Int32.MinValue ? "" : " AND " + propertyName + " = " + propertyValue.ToString();
        }

        public static string GetPartWhereCondition(string propertyName, int? propertyValue)
        {
            if (propertyValue == null) return "";
            return propertyValue == System.Int32.MinValue ? "" : " AND " + propertyName + " = " + propertyValue.ToString();
        }

        public static string GetPartWhereCondition(string propertyName, DateTime? propertyValueStart, DateTime? propertyValueEnd)
        {
            if (propertyValueStart == null && propertyValueEnd == null) return "";

            //return propertyValueStart == DateTime.MinValue ? "" : " AND " + propertyName + " BETWEEN '" + propertyValueStart.ToString("yyyy-MM-dd") + "' AND '" + propertyValueTo.ToString("yyyy-MM-dd") + "'";
            if (propertyValueStart == DateTime.MinValue && propertyValueEnd == DateTime.MinValue)
            {
                return "";
            }
            if (propertyValueStart == null && propertyValueEnd != null)
            {
                return " AND " + propertyName + " < '" + propertyValueEnd.Value.AddDays(1).ToString("yyyy-MM-dd") + "'";
            }
            if (propertyValueStart != null && propertyValueEnd == null)
            {
                return " AND " + propertyName + " >=  '" + propertyValueStart.Value.ToString("yyyy-MM-dd") + "'";
            }
            // 以上if语句不能颠倒
            return " AND " + propertyName + " >=  '" + propertyValueStart.Value.ToString("yyyy-MM-dd") + "' AND  " + propertyName + " < '" + propertyValueEnd.Value.AddDays(1).ToString("yyyy-MM-dd") + "'";
        }

        public static string GetPartWhereCondition(string propertyName, Guid propertyValue, bool isSection)
        {
            if (isSection)
            {
                return propertyValue == Guid.Empty ? "" : " AND " + propertyName + " = '" + propertyValue.ToString() + "'";
            }
            else
            {
                return propertyValue == Guid.Empty ? "" : propertyName + " = '" + propertyValue.ToString() + "'";
            }
        }

        public static string GetPartWhereCondition(string propertyName, Guid propertyValue)
        {
            return GetPartWhereCondition(propertyName, propertyValue, true);
        }

        public static string GetPartWhereCondition(string propertyName, Guid? propertyValue, bool isSection)
        {
            if (isSection)
            {
                return propertyValue == null ? "" : (propertyValue == Guid.Empty ? "" : " AND " + propertyName + " = '" + propertyValue.ToString() + "'");
            }
            else
            {
                return propertyValue == null ? "" : (propertyValue == Guid.Empty ? "" : propertyName + " = '" + propertyValue.ToString() + "'");
            }
        }

        public static string GetPartWhereCondition(string propertyName, Guid? propertyValue)
        {
            return GetPartWhereCondition(propertyName, propertyValue, true);
        }

        #endregion

        #region PopulateParamters
        public static void PopulateParamters(Database db, DbCommand cmd, string[] parameterNames, string[] types, object[] values)
        {
            //int  = parameterNames.Length;
            if (values != null && values.Length > 0)
            {
                for (int i = 0; i < values.Length; i++)
                {
                    db.AddInParameter(cmd, parameterNames[i], GetDbType(types[i]), (values[i] == null) ? DBNull.Value : values[i]);
                }
            }
        }

        public static void PopulateParamters(IEnumerable<DatabaseParameter> parameters, Database db, DbCommand cmd)
        {
            foreach (DatabaseParameter p in parameters)
            {
                db.AddInParameter(cmd, p.Name, p.Type, p.Value);
            }
        }

        public static void PopulateIdParamters(Microsoft.Practices.EnterpriseLibrary.Data.Database db, DbCommand cmd)
        {
            db.AddInParameter(cmd, "Id", DbType.Guid, "Id", DataRowVersion.Current);
        }

        public static void PopulateIdParamters(Microsoft.Practices.EnterpriseLibrary.Data.Database db, DbCommand cmd, bool isString)
        {
            if (isString)
            {
                db.AddInParameter(cmd, "Id", DbType.String, "Id", DataRowVersion.Current);
            }
            else
            {
                db.AddInParameter(cmd, "Id", DbType.Guid, "Id", DataRowVersion.Current);
            }
        }

        public static void PopulateIntParamters(Microsoft.Practices.EnterpriseLibrary.Data.Database db, DbCommand cmd, string fieldName)
        {
            db.AddInParameter(cmd, fieldName, DbType.Int32, fieldName, DataRowVersion.Current);
        }

        #endregion

        #region Cache
        /// <summary>
        /// 
        /// </summary>
        /// <param name="paramters"></param>
        /// <returns></returns>
        public static string GenerateCacheKey(string spName, IEnumerable<DatabaseParameter> paramters)
        {
            if (String.IsNullOrEmpty(spName))
            {
                throw new Exception("spName 不能为空！");
            }
            return spName + GetKeyStringByParamters(paramters);
        }

        /// <summary>
        /// 根据命令参数的集合得到一个缓存的key
        /// </summary>
        /// <param name="paramters"></param>
        public static string GetKeyStringByParamters(IEnumerable<DatabaseParameter> paramters)
        {
            if (paramters == null) return "";
            string s = "";
            foreach (DatabaseParameter p in paramters)
            {
                if (p.Value == null)
                {
                    s += p.Name + "NULL";
                }
                else
                {
                    s += p.Name + p.Value.ToString();
                }
            }
            return s;
        }

        /// <summary>
        /// 标识当前表中数据变化的缓存项的key，一般是表名称
        /// </summary>
        /// <param name="spName">存储过程名</param>
        /// <returns>标识当前表中数据变化的缓存项的key</returns>
        /// <remarks>存储过程名中要有表名。存储过程的命名方式要求为:TableName_SPName</remarks>
        public static string GetCacheKey(string spName)
        {
            // 原则上要保证spName中含有'_'字符，所以这里没有作判断。
            if (spName.IndexOf('_') > 0)
            {
                return spName.Substring(0, spName.IndexOf('_'));
            }
            // 这里是为了此方法的返回值不能与spName相同
            return spName + "Table";
            //return spName;
        }

        /// <summary>
        /// 放到缓存中
        /// </summary>
        /// <param name="key"></param>
        /// <param name="value"></param>
        /// <param name="cacheManager"></param>
        public static void InsertCache(string key, object value, CacheManager cacheManager)
        {
            //CacheItemDependency cacheItemDependencyExpiry = new CacheItemDependency(GetCacheKey(key));
            //AbsoluteTime absoluteTimeExpiry = new AbsoluteTime(new TimeSpan(0, 0, minutes, seconds, 0));
            //cacheManager.Add(key, value, CacheItemPriority.Normal, null, new ICacheItemExpiration[] { expiry });

            InsertCache(key, value, false, 0, 0, 0, cacheManager);
        }

        /// <summary>
        /// 放到缓存中
        /// </summary>
        /// <param name="key"></param>
        /// <param name="value"></param>
        /// <param name="enableTimeExpiry"></param>
        /// <param name="hours"></param>
        /// <param name="minutes"></param>
        /// <param name="seconds"></param>
        /// <param name="cacheManager"></param>
        public static void InsertCache(string key, object value, bool enableTimeExpiry, int hours, int minutes, int seconds, CacheManager cacheManager)
        {
            // 这里取key中"_"之前的部分作为CacheItem的key，实际使用时，key中"_"之前的部分一般为表名
            // 这里一定要保证GetCacheKey(key)的返回值与key不能相同。
            string cacheItemKey = GetCacheKey(key);
            if (cacheItemKey == key) throw new Exception("CacheItem的key与缓存对象的key应该不同！");
            CacheItemDependency cacheItemDependencyExpiry = new CacheItemDependency(cacheItemKey);
            //AbsoluteTime expiry = new AbsoluteTime(new TimeSpan(0, 20, 0));
            if (enableTimeExpiry)
            {
                AbsoluteTime absoluteTimeExpiry = new AbsoluteTime(new TimeSpan(0, hours, minutes, seconds, 0));
                cacheManager.Add(key, value, CacheItemPriority.Normal, null, new ICacheItemExpiration[] { cacheItemDependencyExpiry, absoluteTimeExpiry });
            }
            else
            {
                cacheManager.Add(key, value, CacheItemPriority.Normal, null, new ICacheItemExpiration[] { cacheItemDependencyExpiry });
            }
        }

        /// <summary>
        /// 更新以cacheKey为key的缓存项
        /// </summary>
        /// <param name="cacheKey">缓存项的key</param>
        public static void UpdateCacheDependency(string cacheKey)
        {
            string[] cacheKeys = new string[] { cacheKey };
            UpdateCacheDependency(cacheKeys);
        }

        /// <summary>
        /// 更新所有以cacheKeys中元素为key的缓存项
        /// </summary>
        /// <param name="cacheKeys">缓存项的key的数组</param>
        public static void UpdateCacheDependency(string[] cacheKeys)
        {
            ICacheManager cacheManager = CacheFactory.GetCacheManager();
            foreach (string cacheKey in cacheKeys)
            {
                string cacheItemCache = GetCacheKey(cacheKey);
                if (cacheManager != null && cacheManager.Contains(cacheItemCache))
                {
                    int lastCount = (int)cacheManager.GetData(cacheItemCache);
                    if (lastCount < Int32.MaxValue)
                    {
                        lastCount++;
                    }
                    else
                    {
                        lastCount = Int32.MinValue;
                    }
                    // 这一句的作用在于更新以cacheKey为key的缓存项,从而使依赖于此缓存项的缓存项失效.
                    // 当以cacheKey为Key的缓存项中的数据（这里是lastCount）变化时，是的依赖于此缓存项的缓存失效
                    cacheManager.Add(cacheKey, lastCount);
                }
            }
        }
        #endregion

        #region Execute
        /// <summary>
        /// 根据指定的参数，执行存储过程
        /// </summary>
        /// <param name="spName">存储过程名</param>
        /// <param name="paramters">命令的参数集合</param>
        /// <param name="handleReturnValue">处理返回值的方法指针</param>
        /// <param name="removeCache">是否将与之相关的缓存删除掉</param>
        /// <param name="cacheKey">缓存的键</param>
        /// <returns>持久化成功与否</returns>
        public static int ExecuteNonQuery(string spName, IEnumerable<DatabaseParameter> paramters)
        {
            int returnValue = -1;
            try
            {
                Database db = DatabaseFactory.CreateDatabase();
                DbCommand cmd = db.GetStoredProcCommand(spName);
                //cmd.CommandTimeout = this._CommandTimeout;

                if (paramters != null)
                {
                    PopulateParamters(paramters, db, cmd);
                }
                //if (handleReturnValue != null)
                //{
                //    db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);
                //}
                returnValue = db.ExecuteNonQuery(cmd);
                //returnValue = 0;

                //if (handleReturnValue != null)
                //{
                //    returnValue = DataAccessHelper.GetReturnValue(db, cmd);
                //    handleReturnValue(returnValue, "");
                //}
            }
            catch
            {
                throw;
            }

            //// 此处用委托更为恰当，可以Remove多个缓存项
            //if (removeCache && cacheKey != null)
            //{
            //    UpdateCacheDependency(cacheKey);
            //    //CacheFactory.GetCacheManager().Remove( cacheKey );
            //}

            return returnValue;
        }

        ///// <summary>
        ///// 根据指定的参数，执行存储过程
        ///// </summary>
        ///// <param name="spName">存储过程名</param>
        ///// <param name="paramters">命令的参数集合</param>
        ///// <param name="handleReturnValue">处理返回值的方法指针</param>
        ///// <param name="removeCache">是否将与之相关的缓存删除掉</param>
        ///// <param name="cacheKey">缓存的键</param>
        ///// <returns>持久化成功与否</returns>
        //public static bool ExecuteNonQuery(string spName, IEnumerable<IEnumerable<DatabaseParameter>> paramters, HandleReturnValue handleReturnValue, bool removeCache, string cacheKey)
        //{
        //    int returnValue = -1;
        //    try
        //    {
        //        Database db = DatabaseFactory.CreateDatabase();
        //        DbCommand cmd = db.GetStoredProcCommand(spName);
        //        //cmd.CommandTimeout = this._CommandTimeout;

        //        foreach (ParameterCollection ps in paramters)
        //        {
        //            if (ps != null)
        //            {
        //                DataAccessHelper.PopulateParamters(ps, db, cmd);
        //            }
        //            if (handleReturnValue != null)
        //            {
        //                db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);
        //            }
        //            db.ExecuteNonQuery(cmd);
        //            cmd.Parameters.Clear();
        //        }
        //        returnValue = 0;

        //        if (handleReturnValue != null)
        //        {
        //            returnValue = DataAccessHelper.GetReturnValue(db, cmd);
        //            handleReturnValue(returnValue, "");
        //        }
        //    }
        //    catch
        //    {
        //        throw;
        //    }

        //    // 此处用委托更为恰当，可以Remove多个缓存项
        //    if (removeCache && cacheKey != null)
        //    {
        //        UpdateCacheDependency(cacheKey);
        //        //CacheFactory.GetCacheManager().Remove( cacheKey );
        //    }

        //    return (returnValue == 0);
        //}

        //public static bool ExecuteNonQuery(string spName, IEnumerable<DatabaseParameter> paramters)
        //{
        //    return ExecuteNonQuery(spName, paramters);//, null, true, GetCacheKey(spName)
        //}

        //public static bool ExecuteNonQuery(string spName, List<ParameterCollection> paramters)
        //{
        //    return ExecuteNonQuery(spName, paramters, null, true, GetCacheKey(spName));
        //}


        #endregion
    }
}
