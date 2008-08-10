using System;
using System.Collections.Specialized;
using System.Collections.Generic;
using System.Configuration;
using System.Configuration.Provider;
using System.Data;
using System.Data.Common;
using System.Text;

using Microsoft.Practices.EnterpriseLibrary.Data;

namespace Husb.Security
{
    public partial class GenericRoleProvider
    {
        #region StoredProcName
        private const string CreateRoleStoredProcName = "dbo.aspnet_Roles_CreateRole";
        private const string IsUserInRoleStoredProcName = "dbo.aspnet_UsersInRoles_IsUserInRole";
        private const string GetRolesForUserStoredProcName = "dbo.aspnet_UsersInRoles_GetRolesForUser";
        private const string DeleteRoleStoredProcName = "dbo.aspnet_Roles_DeleteRole";
        private const string RoleExistsStoredProcName = "dbo.aspnet_Roles_RoleExists";
        private const string AddUsersToRolesStoredProcName = "dbo.aspnet_UsersInRoles_AddUsersToRoles";
        private const string RemoveUsersFromRolesStoredProcName = "dbo.aspnet_UsersInRoles_RemoveUsersFromRoles";
        private const string GetUsersInRolesStoredProcName = "dbo.aspnet_UsersInRoles_GetUsersInRoles";
        private const string GetAllRolesStoredProcName = "dbo.aspnet_Roles_GetAllRoles";
        private const string FindUsersInRoleStoredProcName = "dbo.aspnet_UsersInRoles_FindUsersInRole";
        private const string ChangeRoleNameStoredProcName = "dbo.aspnet_Roles_ChangeRoleName";
        //private const string GetUserByEmailStoredProcName = "dbo.aspnet_Membership_GetUserByEmail";
        //private const string UnlockUserStoredProcName = "dbo.aspnet_Membership_UnlockUser";
        //private const string UpdateUserStoredProcName = "dbo.aspnet_Membership_UpdateUser";
        private const string GetAllRolesForUserStoredProcName = "dbo.aspnet_UsersInRoles_GetAllRolesForUser";
        #endregion

        #region Helper
        private void CheckSchemaVersion(Database db)
        {
            string[] features = { "Role Manager" };
            string version = "1";

            SecUtility.CheckSchemaVersion(this,
                                           db,
                                           features,
                                           version,
                                           ref _SchemaVersionCheck);
        }

        private static string GetConnectionString(string specifiedConnectionString, bool lookupConnectionString, bool appLevel)
        {
            if (specifiedConnectionString == null || specifiedConnectionString.Length < 1)
                return null;

            string connectionString = null;

            /////////////////////////////////////////
            // Step 1: Check <connectionStrings> config section for this connection string
            if (lookupConnectionString)
            {
                ConnectionStringSettings connObj = ConfigurationManager.ConnectionStrings[specifiedConnectionString];
                if (connObj != null)
                    connectionString = connObj.ConnectionString;

                if (connectionString == null)
                    return null;
            }
            else
            {
                connectionString = specifiedConnectionString;
            }

            return connectionString;
        }
        #endregion

        #region Delegate
        /// <summary>
        /// 根据domainObject对象为DbCommand添加参数
        /// </summary>
        /// <typeparam name="TDomainObject">实体对象的类型</typeparam>
        /// <param name="db">数据库对象</param>
        /// <param name="cmd">命令对象</param>
        /// <param name="domainObject">实体对象</param>
        private delegate void PopulateRoleParamters(Database db, DbCommand cmd, RoleParameterInfo role);

        /// <summary>
        /// 根据IDataReader对象产生一个实体类
        /// </summary>
        /// <typeparam name="TDomainObject">实体对象的类型</typeparam>
        /// <param name="domainObject">实体对象</param>
        /// <param name="dr">IDataReader对象</param>
        private delegate void PopulateRoleInfo(RoleInfo role, System.Data.IDataReader dr);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="returnValue"></param>
        /// <param name="roleName"></param>
        private delegate void HandleReturnValue(int returnValue, string roleName);
        #endregion

        #region Execute Command
        private bool ExecuteNonQuery(string spName, RoleParameterInfo role, PopulateRoleParamters populateRoleParamters, HandleReturnValue handleReturnValue)
        {
            int returnValue = 0;
            try
            {
                Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
                CheckSchemaVersion(db);

                DbCommand cmd = db.GetStoredProcCommand(spName);
                cmd.CommandTimeout = this._CommandTimeout;
                if (populateRoleParamters != null)
                {
                    populateRoleParamters(db, cmd, role);
                }

                db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);

                db.ExecuteNonQuery(cmd);

                returnValue = GetReturnValue(db, cmd);
                if (handleReturnValue != null)
                {
                    handleReturnValue(returnValue, role.RoleName);
                }
            }
            catch
            {
                throw;
            }

            return (returnValue == 0);
        }

        private List<RoleInfo> ExecuteReader(string spName, RoleParameterInfo p, PopulateRoleParamters populateRoleParamters, HandleReturnValue handleReturnValue)
        {
            List<RoleInfo> roles = new List<RoleInfo>();
            try
            {
                Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
                CheckSchemaVersion(db);

                DbCommand cmd = db.GetStoredProcCommand(spName);
                cmd.CommandTimeout = this._CommandTimeout;
                if (populateRoleParamters != null)
                {
                    populateRoleParamters(db, cmd, p);
                }
                db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);
                roles = new List<RoleInfo>();
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        RoleInfo role = new RoleInfo();
                        LoadHalfRoleInfo(role, dr);
                        roles.Add(role);
                    }
                }
                int returnValue = GetReturnValue(db, cmd);
                if (handleReturnValue != null)
                {
                    handleReturnValue(returnValue, p.RoleName);
                }
            }
            catch
            {
                throw;
            }
            return roles;
            //return roles.Count > 0 ? roles : null;
        }

        private string[] ExecuteReaderUsers(string spName, RoleParameterInfo p, PopulateRoleParamters populateRoleParamters, HandleReturnValue handleReturnValue)
        {
            StringCollection sc = new StringCollection();
            try
            {
                Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
                CheckSchemaVersion(db);

                DbCommand cmd = db.GetStoredProcCommand(spName);
                cmd.CommandTimeout = this._CommandTimeout;
                if (populateRoleParamters != null)
                {
                    populateRoleParamters(db, cmd, p);
                }
                db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);
                //roles = new List<RoleInfo>();
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        //RoleInfo role = new RoleInfo();
                        sc.Add(dr.GetString(0));
                    }
                }
                int returnValue = GetReturnValue(db, cmd);
                if (handleReturnValue != null)
                {
                    handleReturnValue(returnValue, p.RoleName);
                }
            }
            catch
            {
                throw;
            }

            String[] strReturn = new String[sc.Count];
            sc.CopyTo(strReturn, 0);
            return strReturn;

            //return roles.Count > 0 ? roles : null;
        }

        private bool ExecuteNonQuery(string spName, RoleParameterInfo role, PopulateRoleParamters populateRoleParamters)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
                CheckSchemaVersion(db);

                DbCommand cmd = db.GetStoredProcCommand(spName);
                cmd.CommandTimeout = this._CommandTimeout;
                if (populateRoleParamters != null)
                {
                    populateRoleParamters(db, cmd, role);
                }

                db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);

                db.ExecuteNonQuery(cmd);

                int status = GetReturnValue(db, cmd);
                switch (status)
                {
                    case 0:
                        return false;
                    case 1:
                        return true;
                    case 2:
                        return false;
                    // throw new ProviderException(SR.GetString(SR.Provider_user_not_found));
                    case 3:
                        return false; // throw new ProviderException(SR.GetString(SR.Provider_role_not_found, roleName));
                }
                throw new ProviderException(SR.GetString(SR.Provider_unknown_failure));
            }
            catch
            {
                throw;
            }

            //return (returnValue == 0);
        }

        private void AddUsersToRolesCore(Database db, string usernames, string roleNames)
        {
            DbCommand cmd = db.GetStoredProcCommand(AddUsersToRolesStoredProcName);
            cmd.CommandTimeout = this._CommandTimeout;
            db.AddInParameter(cmd, "ApplicationName", DbType.String, ApplicationName);
            db.AddInParameter(cmd, "UserNames", DbType.String, usernames);
            db.AddInParameter(cmd, "RoleNames", DbType.String, roleNames);
            db.AddInParameter(cmd, "CurrentTimeUtc", DbType.DateTime, DateTime.UtcNow);
            //db.AddInParameter(cmd, "OwnerId", DbType.Guid, ownerId);
            db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);

            string s1 = String.Empty, s2 = String.Empty;

            IDataReader reader = null;

            try
            {
                reader = db.ExecuteReader(cmd);
                if (reader.Read())
                {
                    if (reader.FieldCount > 0)
                        s1 = reader.GetString(0);
                    if (reader.FieldCount > 1)
                        s2 = reader.GetString(1);
                }
            }
            finally
            {
                if (reader != null)
                    reader.Close();
            }
            switch (GetReturnValue(db, cmd))
            {
                case 0:
                    return;
                case 1:
                    throw new ProviderException(SR.GetString(SR.Provider_this_user_not_found, s1));
                case 2:
                    throw new ProviderException(SR.GetString(SR.Provider_role_not_found, s1));
                case 3:
                    throw new ProviderException(SR.GetString(SR.Provider_this_user_already_in_role, s1, s2));
            }
            throw new ProviderException(SR.GetString(SR.Provider_unknown_failure));
        }

        private void RemoveUsersFromRolesCore(Database db, string usernames, string roleNames)
        {
            DbCommand cmd = db.GetStoredProcCommand(RemoveUsersFromRolesStoredProcName);
            cmd.CommandTimeout = this._CommandTimeout;
            db.AddInParameter(cmd, "ApplicationName", DbType.String, ApplicationName);
            db.AddInParameter(cmd, "UserNames", DbType.String, usernames);
            db.AddInParameter(cmd, "RoleNames", DbType.String, roleNames);
            //db.AddInParameter(cmd, "OwnerId", DbType.Guid, ownerId);
            db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);

            string s1 = String.Empty, s2 = String.Empty;
            IDataReader reader = null;
            try
            {
                reader = db.ExecuteReader(cmd);
                if (reader.Read())
                {
                    if (reader.FieldCount > 0)
                        s1 = reader.GetString(0);
                    if (reader.FieldCount > 1)
                        s2 = reader.GetString(1);
                }
            }
            finally
            {
                if (reader != null)
                    reader.Close();
            }
            switch (GetReturnValue(db, cmd))
            {
                case 0:
                    return;
                case 1:
                    throw new ProviderException(SR.GetString(SR.Provider_this_user_not_found, s1));
                case 2:
                    throw new ProviderException(SR.GetString(SR.Provider_role_not_found, s2));
                case 3:
                    throw new ProviderException(SR.GetString(SR.Provider_this_user_already_not_in_role, s1, s2));
            }
            throw new ProviderException(SR.GetString(SR.Provider_unknown_failure));
        }

        private List<UserRolesInfo> ExecuteReader(string spName, RoleParameterInfo p, PopulateRoleParamters populateRoleParamters)
        {
            List<UserRolesInfo> roles = null;
            try
            {
                Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
                CheckSchemaVersion(db);

                DbCommand cmd = db.GetStoredProcCommand(spName);
                cmd.CommandTimeout = this._CommandTimeout;
                if (populateRoleParamters != null)
                {
                    populateRoleParamters(db, cmd, p);
                }
                //db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);
                roles = new List<UserRolesInfo>();
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        UserRolesInfo role = new UserRolesInfo();
                        LoadUserRoleInfo(role, dr);
                        roles.Add(role);
                    }
                }
                //int returnValue = GetReturnValue(db, cmd);
                //if (handleReturnValue != null)
                //{
                //    handleReturnValue(returnValue, p.RoleName);
                //}
            }
            catch
            {
                throw;
            }

            return roles.Count > 0 ? roles : null;
        }
        #endregion

        #region PopulateParamter
        /// <summary>
        /// 根据实体类的属性，给数据库命令的参数赋值
        /// </summary>
        /// <param name="db">数据库对象</param>
        /// <param name="cmd">命令对象</param>
        /// <param name="role">角色对象</param>
        public static void PopulateCommonParamter(Database db, System.Data.Common.DbCommand cmd, RoleParameterInfo p)
        {
            db.AddInParameter(cmd, "ApplicationName", DbType.String, p.ApplicationName);
            db.AddInParameter(cmd, "RoleName", DbType.String, p.RoleName);
            //db.AddInParameter(cmd, "OwnerId", DbType.Guid, p.OwnerId);
            //if (p.OwnerId != null)
            //{
            //    db.AddInParameter(cmd, "OwnerId", DbType.String, p.OwnerId);
            //}
        }

        public static void PopulateGetRolesForUserParamter(Database db, System.Data.Common.DbCommand cmd, RoleParameterInfo p)
        {
            db.AddInParameter(cmd, "ApplicationName", DbType.String, p.ApplicationName);
            db.AddInParameter(cmd, "UserName", DbType.String, p.UserName);
            //db.AddInParameter(cmd, "OwnerId", DbType.Guid, p.OwnerId);
        }

        public static void PopulateGetAllRolesForUserParamter(Database db, System.Data.Common.DbCommand cmd, RoleParameterInfo p)
        {
            db.AddInParameter(cmd, "ApplicationName", DbType.String, p.ApplicationName);
            db.AddInParameter(cmd, "UserId", DbType.Guid, p.UserId);
            //db.AddInParameter(cmd, "OwnerId", DbType.Guid, p.OwnerId);
        }

        public static void PopulateGetAllParamter(Database db, System.Data.Common.DbCommand cmd, RoleParameterInfo p)
        {
            db.AddInParameter(cmd, "ApplicationName", DbType.String, p.ApplicationName);
            //db.AddInParameter(cmd, "RoleName", DbType.String, p.RoleName);
            //db.AddInParameter(cmd, "OwnerId", DbType.Guid, p.OwnerId);
        }

        public static void PopulateDeleteParamter(Database db, System.Data.Common.DbCommand cmd, RoleParameterInfo role)
        {
            PopulateCommonParamter(db, cmd, role);
            db.AddInParameter(cmd, "DeleteOnlyIfRoleIsEmpty", DbType.Boolean, role.ThrowOnPopulatedRole);
        }

        public static void PopulateFindUsersInRoleParamter(Database db, System.Data.Common.DbCommand cmd, RoleParameterInfo role)
        {
            PopulateCommonParamter(db, cmd, role);
            db.AddInParameter(cmd, "UserNameToMatch", DbType.String, role.UserNameToMatch);
        }

        public static void PopulateIsUserInRoleParamter(Database db, System.Data.Common.DbCommand cmd, RoleParameterInfo p)
        {
            db.AddInParameter(cmd, "ApplicationName", DbType.String, p.ApplicationName);
            db.AddInParameter(cmd, "UserName", DbType.String, p.UserName);
            db.AddInParameter(cmd, "RoleName", DbType.String, p.RoleName);
            //db.AddInParameter(cmd, "OwnerId", DbType.Guid, p.OwnerId);
        }

        public static void PopulateChangeRoleNameParamter(Database db, System.Data.Common.DbCommand cmd, RoleParameterInfo p)
        {
            db.AddInParameter(cmd, "ApplicationName", DbType.String, p.ApplicationName);
            db.AddInParameter(cmd, "RoleName", DbType.String, p.RoleName);
            db.AddInParameter(cmd, "NewRoleName", DbType.String, p.NewRoleName);
            //db.AddInParameter(cmd, "OwnerId", DbType.Guid, p.OwnerId);
        }
        #endregion

        #region Return Value
        private int GetReturnValue(Database db, System.Data.Common.DbCommand cmd)
        {
            object o = db.GetParameterValue(cmd, "ReturnValue");
            return ((o != null) ? ((int)o) : -1);

            //foreach (DbParameter param in cmd.Parameters)
            //{
            //    if (param.Direction == ParameterDirection.ReturnValue && param.Value != null && param.Value is int)
            //        return (int)param.Value;
            //}
            //return -1;
        }

        private static void HandleAddReturnValue(int returnValue, string roleName)
        {
            switch (returnValue)
            {
                case 0:
                    return;

                case 1:
                    throw new ProviderException(SR.GetString(SR.Provider_role_already_exists, roleName));

                default:
                    throw new ProviderException(SR.GetString(SR.Provider_unknown_failure));
            }
        }

        private static void HandleDeleteReturnValue(int returnValue, string roleName)
        {
            if (returnValue == 2)
            {
                throw new ProviderException(SR.GetString(SR.Role_is_not_empty));
            }
        }

        private static void HandleGetRolesReturnValue(int returnValue, string roleName)
        {
            switch (returnValue)
            {
                case 0:
                    break;
                case 1:
                    break;
                default:
                    throw new ProviderException(SR.GetString(SR.Provider_unknown_failure));
            }
        }

        private static void HandleGetUsersReturnValue(int returnValue, string roleName)
        {
            switch (returnValue)
            {
                case 0:
                    break;
                case 1:
                    throw new ProviderException(SR.GetString(SR.Provider_role_not_found, roleName));
            }
            throw new ProviderException(SR.GetString(SR.Provider_unknown_failure));
        }
        #endregion

        #region LoadHalfRoleInfo
        /// <summary>
        /// 根据执行不同的数据获取命令，得到一个不完整的RoleInfo<see cref="RoleInfo" />对象，也许只有部分属性有内容。
        /// </summary>
        /// <param name="role"></param>
        /// <param name="dr">IDataReader<see cref="IDataReader" /></param>
        public static void LoadHalfRoleInfo(RoleInfo role, System.Data.IDataReader dr)
        {
            for (int fieldCount = 0; fieldCount < dr.FieldCount; fieldCount++)
            {
                switch (dr.GetName(fieldCount))
                {
                    case "RoleName":
                        role.RoleName = (System.String)dr["RoleName"];
                        break;
                    case "ApplicationId":
                        role.ApplicationId = (System.Guid)dr["ApplicationId"];
                        break;
                    case "RoleId":
                        role.RoleId = (System.Guid)dr["RoleId"];
                        break;
                    case "DisplayName":
                        role.DisplayName = dr["DisplayName"] == DBNull.Value ? "" : (System.String)dr["DisplayName"];
                        break;
                    //case "OwnerId":
                    //    role.OwnerId = dr["OwnerId"] == DBNull.Value ? null : (System.Guid?)dr["OwnerId"];
                    //    break;
                    //case "Description":
                    //    role.Description = dr["Description"] == DBNull.Value ? "" : (System.String)dr["Description"];
                    //    break;
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="ur"></param>
        /// <param name="dr"></param>
        public static void LoadUserRoleInfo(UserRolesInfo ur, System.Data.IDataReader dr)
        {
            ur.UserId = (System.Guid)dr["UserId"];
            ur.UserName = (System.String)dr["UserName"];
            ur.RoleId = (System.Guid)dr["RoleId"];
            ur.RoleName = (System.String)dr["RoleName"];
            ur.EmployeeName = dr["EmployeeName"] == DBNull.Value ? "" : (System.String)dr["EmployeeName"];
            //ur.OwnerId = dr["OwnerId"] == DBNull.Value ? Guid.Empty : (System.Guid?)dr["OwnerId"];
        }

        #endregion
    }

    public class RoleParameterInfo
    {
        private string _applicationName;
        private string _roleName;
        private string _newRoleName;
        private Boolean _throwOnPopulatedRole;
        private string _userName;
        private string _roleNames;
        private string _userNames;
        private DateTime _currentTimeUtc;
        private string _userNameToMatch;
        //private Guid? _ownerId;
        private Guid _userId;

        public RoleParameterInfo()
        {

        }
        public RoleParameterInfo(string roleName, string applicationName)
        {
            _roleName = roleName;
            _applicationName = applicationName;
        }

        #region Properties
        /// <summary>
        /// ApplicationName
        /// </summary>
        public System.String ApplicationName
        {
            get { return _applicationName; }
            set { _applicationName = value; }
        }
        /// <summary>
        /// RoleName
        /// </summary>
        public System.String RoleName
        {
            get { return _roleName; }
            set { _roleName = value; }
        }
        /// <summary>
        /// RoleName
        /// </summary>
        public System.String NewRoleName
        {
            get { return _newRoleName; }
            set { _newRoleName = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.Boolean ThrowOnPopulatedRole
        {
            get { return _throwOnPopulatedRole; }
            set { _throwOnPopulatedRole = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String UserName
        {
            get { return _userName; }
            set { _userName = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String RoleNames
        {
            get { return _roleNames; }
            set { _roleNames = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String UserNames
        {
            get { return _userNames; }
            set { _userNames = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.DateTime CurrentTimeUtc
        {
            get { return _currentTimeUtc; }
            set { _currentTimeUtc = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String UserNameToMatch
        {
            get { return _userNameToMatch; }
            set { _userNameToMatch = value; }
        }

        /// <summary>
        /// OwnerId
        /// </summary>
        //public System.Guid? OwnerId
        //{
        //    get { return _ownerId; }
        //    set { _ownerId = value; }
        //}

        public System.Guid UserId
        {
            get { return _userId; }
            set { _userId = value; }
        }
        #endregion

    }
}
