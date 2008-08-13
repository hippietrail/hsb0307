using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Security.Configuration;
using System.Data.Common;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace Microsoft.Practices.EnterpriseLibrary.Security.Database
{
    /// <summary>
    /// Rule 保存与访问数据库的帮助类
    /// </summary>
    public class AuthorizationProviderDatabaseProvider
    {
        #region StoredProcName
        private const string InsertStoredProcName = "dbo.aspnet_AuthorizationRules_InsertUpdate";//aspnet_AuthorizationRules_Insert
        private const string SelectAllStoredProcName = "dbo.aspnet_AuthorizationRules_SelectAll";
        private const string UpdateStoredProcName = "dbo.aspnet_AuthorizationRules_Update";
        private const string DeleteStoredProcName = "dbo.aspnet_AuthorizationRules_Delete";
        private const string SelectByIdStoredProcName = "dbo.aspnet_AuthorizationRules_Select";
        private const string SelectByNameStoredProcName = "dbo.aspnet_AuthorizationRules_SelectByName";
        #endregion

        /// <summary>
        /// 数据库对象
        /// </summary>
        private Microsoft.Practices.EnterpriseLibrary.Data.Database dbRules = null;


		/// <summary>
		/// Creates a Database Rules Manager instance
		/// </summary>
		/// <param name="databaseService">The Database Instance to use to query the data</param>
        public AuthorizationProviderDatabaseProvider(string databaseService)
		{
			//DatabaseProviderFactory factory = new DatabaseProviderFactory(config);
            if(String.IsNullOrEmpty(databaseService))
            {
                dbRules = DatabaseFactory.CreateDatabase();
            }
            else
            {
			    dbRules = DatabaseFactory.CreateDatabase(databaseService);
            }

		}

        /// <summary>
        /// 根据默认的数据库建立权限规则的数据访问类
        /// </summary>
        public AuthorizationProviderDatabaseProvider()
            : this(null)
        {

        }

        /// <summary>
        /// Retrieves a rule from the database
        /// </summary>
        /// <param name="name">The name of the rule</param>
        /// <param name="ownerId">The ownerId of the rule</param>
        /// <returns>An AuthorizationRuleDbData object</returns>
        public AuthorizationRuleDbData GetRule(string name)
        {
            AuthorizationRuleDbData rule = null;

            DbCommand cmd = dbRules.GetStoredProcCommand(SelectByNameStoredProcName);
            PopulateNameParamters(dbRules, cmd, name);

            using (IDataReader reader = dbRules.ExecuteReader(cmd))
            {
                if (reader.Read())
                {
                    rule = GetRuleFromReader(reader);
                }
            }
            return rule;
        }
        /// <summary>
        /// Retrieves a rule from the database
        /// </summary>
        /// <param name="id">Rule Id</param>
        /// <returns>An AuthorizationRuleDbData object</returns>
        public AuthorizationRuleDbData GetRule(Guid id)
        {
            AuthorizationRuleDbData rule = null;
            DbCommand cmd = dbRules.GetStoredProcCommand(SelectByIdStoredProcName);
            PopulateIdParamters(dbRules, cmd, id);

            using (IDataReader reader = dbRules.ExecuteReader(cmd))
            {
                if (reader.Read())
                {
                    rule = GetRuleFromReader(reader);
                }
            }
            return rule;
        }
		
		/// <summary>
		/// Retrieves all rules in the database as a DataSet
		/// </summary>
		/// <returns>A DataSet containing all of the rules</returns>
		public DataSet GetAllRules()
		{
            DbCommand cmd = dbRules.GetStoredProcCommand("dbo.AuthorizationRules_SelectAuthorizationRulesAll");
			using(DataSet ds = dbRules.ExecuteDataSet(cmd))
			{
				return ds;
			}
		}

        /// <summary>
        /// Retrieves all rules in the database as a Collection
        /// </summary>
        /// <param name="ownerId"></param>
        /// <returns>An AuthorizationRuleDataCollection containing all of the rules</returns>
        public List<AuthorizationRuleDbData> GetAllRulesAsCollection()
        {
            List<AuthorizationRuleDbData> rules = new List<AuthorizationRuleDbData>();
            DbCommand cmd = dbRules.GetStoredProcCommand(SelectAllStoredProcName);

            using (IDataReader reader = dbRules.ExecuteReader(cmd))
            {
                while (reader.Read())
                {
                    AuthorizationRuleDbData rule = GetRuleFromReader(reader);
                    rules.Add(rule);
                }
            }
            return rules;
        }

		/// <summary>
        /// Inserts a rule into the database
		/// </summary>
        /// <param name="id">RuleId</param>
        /// <param name="name">The name of the rule</param>
        /// <param name="expression">The expression defining the rule</param>
		public void InsertRule(System.Guid id, string name, string expression)
		{
            InsertRule(id, name, name, 0, expression);
		}

        /// <summary>
        /// Inserts a rule into the database
        /// </summary>
        /// <param name="id">RuleId</param>
        /// <param name="name">The name of the rule</param>
        /// <param name="expression">The expression defining the rule</param>
        /// <param name="ownerId">The ownerId defining the rule</param>
        public void InsertRule(System.Guid id, string name, string displayName, int ruleCategory, string expression)
        {
            DbCommand cmd = dbRules.GetStoredProcCommand(InsertStoredProcName);
            PopulateParamters(dbRules, cmd, id, name, displayName, ruleCategory, expression);

            dbRules.ExecuteNonQuery(cmd);
        }

		/// <summary>
		/// Saves the rule to the database
		/// </summary>
		/// <param name="ruleId">The Rule Id</param>
		/// <param name="name">The name of the rule</param>
		/// <param name="expression">The expression</param>
        public void UpdateRuleById(System.Guid ruleId, string name, string expression)
		{
            UpdateRuleById(ruleId, name, name, 0, expression);
		}

        /// <summary>
        /// Saves the rule to the database
        /// </summary>
        /// <param name="id">The Rule Id</param>
        /// <param name="name">The name of the rule</param>
        /// <param name="displayName">The displayName of the rule</param>
        /// <param name="ruleCategory">The ruleCategory of the rule</param>
        /// <param name="expression">The expression</param>
        /// <param name="ownerId">The ownerId of the rule</param>
        public void UpdateRuleById(System.Guid id, string name, string displayName, int ruleCategory, string expression)
        {
            DbCommand cmd = dbRules.GetStoredProcCommand(UpdateStoredProcName);
            PopulateParamters(dbRules, cmd, id, name, displayName, ruleCategory, expression);
            dbRules.ExecuteNonQuery(cmd);
        }

		/// <summary>
		/// Removes a rule from the database
		/// </summary>
		/// <param name="ruleId">The ruleid to remove</param>
        public void DeleteRuleById(System.Guid ruleId)
		{
            DbCommand cmd = dbRules.GetStoredProcCommand(DeleteStoredProcName);
            PopulateIdParamters(dbRules, cmd, ruleId);
			dbRules.ExecuteNonQuery(cmd);
        }

        #region Helper

        /// <summary>
        /// 利用IDataReader根据数据库中的一行记录创建一个AuthorizationRuleDbData对象
        /// </summary>
        /// <param name="reader">IDataReader<see cref="IDataReader" /></param>
        /// <returns>AuthorizationRuleDbData<see cref="AuthorizationRuleDbData" /></returns>
        private AuthorizationRuleDbData GetRuleFromReader(IDataReader reader)
        {
            AuthorizationRuleDbData rule = new AuthorizationRuleDbData();
            rule.Id = reader.GetGuid(reader.GetOrdinal("Id"));
            rule.Name = reader.GetString(reader.GetOrdinal("Name"));
            rule.DisplayName = reader.GetString(reader.GetOrdinal("DisplayName"));
            rule.Expression = reader.GetString(reader.GetOrdinal("Expression"));
            rule.Category = reader.GetInt32(reader.GetOrdinal("Category"));
            //rule.OwnerId = reader["OwnerId"] == DBNull.Value ? null : (System.Guid?)reader["OwnerId"];

            return rule;
        }

        /// <summary>
        ///  以AuthorizationRuleDbData的属性值，为cmd对象赋值，用于添加或更新AuthorizationRuleDbData对象
        /// </summary>
        /// <param name="db">数据库对象</param>
        /// <param name="cmd">命令对象</param>
        /// <param name="id">ruleId</param>
        /// <param name="name">Rule Name</param>
        /// <param name="expression">Rule expression</param>
        /// <param name="ownerId">Rule OwnerId</param>
        private void PopulateParamters(Microsoft.Practices.EnterpriseLibrary.Data.Database db, DbCommand cmd, System.Guid id, string name, string displayName, int ruleCategory, string expression)
        {
            db.AddInParameter(cmd, "Id", DbType.Guid, id);
            db.AddInParameter(cmd, "Name", DbType.String, name);//DbType.AnsiString
            db.AddInParameter(cmd, "DisplayName", DbType.String, displayName);
            db.AddInParameter(cmd, "Category", DbType.Int32, ruleCategory);
            db.AddInParameter(cmd, "Expression", DbType.AnsiString, expression);
            db.AddInParameter(cmd, "RequiredRoles", DbType.String, "");
            //db.AddInParameter(cmd, "OwnerId", DbType.Guid, ownerId);
        }

        private void PopulateIdParamters(Microsoft.Practices.EnterpriseLibrary.Data.Database db, DbCommand cmd, System.Guid id)
        {
            db.AddInParameter(cmd, "Id", DbType.Guid, id);
        }

        private void PopulateNameParamters(Microsoft.Practices.EnterpriseLibrary.Data.Database db, DbCommand cmd, string name)
        {
            db.AddInParameter(cmd, "Name", DbType.String, name);//DbType.AnsiString
        }
        #endregion
    }
}
