using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Data;
using System.Data.Common;
using System.Globalization;
using System.Configuration;
using System.Configuration.Provider;

using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Collections.Specialized;

namespace Husb.Security
{
    public partial class GenericRoleProvider : RoleProvider
    {
        #region Fields
        private string _AppName;
        private int _SchemaVersionCheck;
        private string _sqlConnectionString;
        private int _CommandTimeout;
        private string _databaseInstanceName;
        #endregion

        #region Public properties
        private int CommandTimeout
        {
            get { return _CommandTimeout; }
        }
        public override string ApplicationName
        {
            get { return _AppName; }
            set
            {
                if (String.IsNullOrEmpty(value))
                    throw new ArgumentNullException("value");

                _AppName = value;

                if (_AppName.Length > 256)
                {
                    throw new ProviderException(SR.GetString(SR.Provider_application_name_too_long));
                }
            }
        }
        #endregion

        #region Initialize
        public override void Initialize(string name, NameValueCollection config)
        {
            // Remove CAS from sample: HttpRuntime.CheckAspNetHostingPermission (AspNetHostingPermissionLevel.Low, SR.Feature_not_supported_at_this_level);
            if (config == null)
                throw new ArgumentNullException("config");

            if (String.IsNullOrEmpty(name))
                name = "SqlRoleProvider";
            if (string.IsNullOrEmpty(config["description"]))
            {
                config.Remove("description");
                config.Add("description", SR.GetString(SR.RoleSqlProvider_description));
            }
            base.Initialize(name, config);

            _SchemaVersionCheck = 0;

            _CommandTimeout = SecUtility.GetIntValue(config, "commandTimeout", 30, true, 0);

            //string temp = config["connectionStringName"];
            //if (temp == null || temp.Length < 1)
            //    throw new ProviderException(SR.GetString(SR.Connection_name_not_specified));
            //_sqlConnectionString = SqlConnectionHelper.GetConnectionString(temp, true, true);
            //if (_sqlConnectionString == null || _sqlConnectionString.Length < 1)
            //{
            //    throw new ProviderException(SR.GetString(SR.Connection_string_not_found, temp));
            //}
            string temp = config["connectionStringName"];
            if (temp == null || temp.Length < 1)
                throw new ProviderException(SR.GetString(SR.Connection_name_not_specified));
            _databaseInstanceName = temp;
            _sqlConnectionString = GetConnectionString(temp, true, true);
            if (_sqlConnectionString == null || _sqlConnectionString.Length < 1)
            {
                throw new ProviderException(SR.GetString(SR.Connection_string_not_found, temp));
            }

            _AppName = config["applicationName"];
            if (string.IsNullOrEmpty(_AppName))
                _AppName = SecUtility.GetDefaultAppName();

            if (_AppName.Length > 256)
            {
                throw new ProviderException(SR.GetString(SR.Provider_application_name_too_long));
            }

            config.Remove("connectionStringName");
            config.Remove("applicationName");
            config.Remove("commandTimeout");
            if (config.Count > 0)
            {
                string attribUnrecognized = config.GetKey(0);
                if (!String.IsNullOrEmpty(attribUnrecognized))
                    throw new ProviderException(SR.GetString(SR.Provider_unrecognized_attribute, attribUnrecognized));
            }
        }
        #endregion

        #region Key override method
        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            SecUtility.CheckArrayParameter(ref roleNames, true, true, true, 256, "roleNames");
            SecUtility.CheckArrayParameter(ref usernames, true, true, true, 256, "usernames");

            bool beginTranCalled = false;
            try
            {
                Database db = null;
                try
                {
                    db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
                    CheckSchemaVersion(db);

                    //DbCommand cmd = db.GetStoredProcCommand(spName);
                    //cmd.CommandTimeout = this._CommandTimeout;

                    int numUsersRemaing = usernames.Length;
                    while (numUsersRemaing > 0)
                    {
                        int iter;
                        string allUsers = usernames[usernames.Length - numUsersRemaing];
                        numUsersRemaing--;
                        for (iter = usernames.Length - numUsersRemaing; iter < usernames.Length; iter++)
                        {
                            if (allUsers.Length + usernames[iter].Length + 1 >= 4000)
                                break;
                            allUsers += "," + usernames[iter];
                            numUsersRemaing--;
                        }

                        int numRolesRemaining = roleNames.Length;
                        while (numRolesRemaining > 0)
                        {
                            string allRoles = roleNames[roleNames.Length - numRolesRemaining];
                            numRolesRemaining--;
                            for (iter = roleNames.Length - numRolesRemaining; iter < roleNames.Length; iter++)
                            {
                                if (allRoles.Length + roleNames[iter].Length + 1 >= 4000)
                                    break;
                                allRoles += "," + roleNames[iter];
                                numRolesRemaining--;
                            }
                            //
                            // Note:  ADO.NET 2.0 introduced the TransactionScope class - in your own code you should use TransactionScope
                            //            rather than explicitly managing transactions with the TSQL BEGIN/COMMIT/ROLLBACK statements.
                            //
                            if (!beginTranCalled && (numUsersRemaing > 0 || numRolesRemaining > 0))
                            {
                                db.GetSqlStringCommand("BEGIN TRANSACTION").ExecuteNonQuery();
                                //(new SqlCommand("BEGIN TRANSACTION", holder.Connection)).ExecuteNonQuery();
                                beginTranCalled = true;
                            }
                            AddUsersToRolesCore(db, allUsers, allRoles);
                        }
                    }
                    if (beginTranCalled)
                    {
                        db.GetSqlStringCommand("COMMIT TRANSACTION").ExecuteNonQuery();
                        //(new SqlCommand("COMMIT TRANSACTION", holder.Connection)).ExecuteNonQuery();
                        beginTranCalled = false;
                    }
                }
                catch
                {
                    if (beginTranCalled)
                    {
                        try
                        {
                            db.GetSqlStringCommand("ROLLBACK TRANSACTION").ExecuteNonQuery();
                            //(new SqlCommand("ROLLBACK TRANSACTION", holder.Connection)).ExecuteNonQuery();
                        }
                        catch
                        {
                        }
                        beginTranCalled = false;
                    }
                    throw;
                }
            }
            catch
            {
                throw;
            }
        }

        public override void CreateRole(string roleName)
        {
            SecUtility.CheckParameter(ref roleName, true, true, true, 256, "roleName");
            RoleParameterInfo p = new RoleParameterInfo(roleName, ApplicationName);
            //p.OwnerId = ownerId;
            ExecuteNonQuery(CreateRoleStoredProcName, p, PopulateCommonParamter, HandleAddReturnValue);
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            SecUtility.CheckParameter(ref roleName, true, true, true, 256, "roleName");

            RoleParameterInfo role = new RoleParameterInfo(roleName, ApplicationName);
            role.ThrowOnPopulatedRole = throwOnPopulatedRole;
            //role.OwnerId = ownerId;
            return ExecuteNonQuery(DeleteRoleStoredProcName, role, PopulateDeleteParamter, HandleDeleteReturnValue);
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            SecUtility.CheckParameter(ref roleName, true, true, true, 256, "roleName");
            SecUtility.CheckParameter(ref usernameToMatch, true, true, false, 256, "usernameToMatch");

            RoleParameterInfo p = new RoleParameterInfo(roleName, ApplicationName);
            //p.OwnerId = ownerId;
            p.UserNameToMatch = usernameToMatch;
            return ExecuteReaderUsers(FindUsersInRoleStoredProcName, p, PopulateFindUsersInRoleParamter, HandleGetUsersReturnValue);
        }

        public override string[] GetAllRoles()
        {
            List<RoleInfo> roles = GetAllRoleList();
            //if (roles == null) return null;// 原来为返回null
            if (roles == null) return new string[0];
            if (roles.Count > 0)
            {
                String[] strReturn = new String[roles.Count];
                for (int i = 0; i < roles.Count; i++)
                {
                    strReturn[i] = roles[i].RoleName;
                }
                return strReturn;
            }
            return new string[0];
        }

        public override string[] GetRolesForUser(string username)
        {
            //SecUtility.CheckParameter(ref username, true, false, true, 256, "username");
            //if (username.Length < 1) return new string[0];

            List<RoleInfo> roles = GetRoleListForUser(username);
            // if (roles == null) return null; // 原来为返回null
            if (roles == null) return new string[0];

            if (roles.Count > 0)
            {
                String[] strReturn = new String[roles.Count];
                for (int i = 0; i < roles.Count; i++)
                {
                    strReturn[i] = roles[i].RoleName;
                }
                return strReturn;
            }
            return new string[0];
        }

        public override string[] GetUsersInRole(string roleName)
        {
            SecUtility.CheckParameter(ref roleName, true, true, true, 256, "roleName");
            RoleParameterInfo p = new RoleParameterInfo(roleName, ApplicationName);
            //p.OwnerId = ownerId;
            return ExecuteReaderUsers(GetUsersInRolesStoredProcName, p, PopulateCommonParamter, HandleGetUsersReturnValue);
        }

        public override bool IsUserInRole(string username, string roleName)
        {
            SecUtility.CheckParameter(ref roleName, true, true, true, 256, "roleName");
            SecUtility.CheckParameter(ref username, true, false, true, 256, "username");
            if (username.Length < 1)
                return false;
            RoleParameterInfo p = new RoleParameterInfo(roleName, ApplicationName);
            p.UserName = username;
            //p.OwnerId = ownerId;
            return ExecuteNonQuery(IsUserInRoleStoredProcName, p, PopulateIsUserInRoleParamter);
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            SecUtility.CheckArrayParameter(ref roleNames, true, true, true, 256, "roleNames");
            SecUtility.CheckArrayParameter(ref usernames, true, true, true, 256, "usernames");

            bool beginTranCalled = false;
            try
            {
                Database db = null;// DatabaseFactory.CreateDatabase(this._databaseInstanceName); //null;
                try
                {
                    db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
                    CheckSchemaVersion(db);
                    int numUsersRemaing = usernames.Length;
                    while (numUsersRemaing > 0)
                    {
                        int iter;
                        string allUsers = usernames[usernames.Length - numUsersRemaing];
                        numUsersRemaing--;
                        for (iter = usernames.Length - numUsersRemaing; iter < usernames.Length; iter++)
                        {
                            if (allUsers.Length + usernames[iter].Length + 1 >= 4000)
                                break;
                            allUsers += "," + usernames[iter];
                            numUsersRemaing--;
                        }

                        int numRolesRemaining = roleNames.Length;
                        while (numRolesRemaining > 0)
                        {
                            string allRoles = roleNames[roleNames.Length - numRolesRemaining];
                            numRolesRemaining--;
                            for (iter = roleNames.Length - numRolesRemaining; iter < roleNames.Length; iter++)
                            {
                                if (allRoles.Length + roleNames[iter].Length + 1 >= 4000)
                                    break;
                                allRoles += "," + roleNames[iter];
                                numRolesRemaining--;
                            }
                            //
                            // Note:  ADO.NET 2.0 introduced the TransactionScope class - in your own code you should use TransactionScope
                            //            rather than explicitly managing transactions with the TSQL BEGIN/COMMIT/ROLLBACK statements.
                            //
                            if (!beginTranCalled && (numUsersRemaing > 0 || numRolesRemaining > 0))
                            {
                                db.GetSqlStringCommand("BEGIN TRANSACTION").ExecuteNonQuery();
                                //(new SqlCommand("BEGIN TRANSACTION", holder.Connection)).ExecuteNonQuery();
                                beginTranCalled = true;
                            }
                            RemoveUsersFromRolesCore(db, allUsers, allRoles);
                        }
                    }
                    if (beginTranCalled)
                    {
                        db.GetSqlStringCommand("COMMIT TRANSACTION").ExecuteNonQuery();
                        //(new SqlCommand("COMMIT TRANSACTION", holder.Connection)).ExecuteNonQuery();
                        beginTranCalled = false;
                    }
                }
                catch
                {
                    if (beginTranCalled)
                    {
                        db.GetSqlStringCommand("ROLLBACK TRANSACTION").ExecuteNonQuery();
                        //(new SqlCommand("ROLLBACK TRANSACTION", holder.Connection)).ExecuteNonQuery();
                        beginTranCalled = false;
                    }
                    throw;
                }
            }
            catch
            {
                throw;
            }
        }

        public override bool RoleExists(string roleName)
        {
            SecUtility.CheckParameter(ref roleName, true, true, true, 256, "roleName");

            RoleParameterInfo p = new RoleParameterInfo(roleName, ApplicationName);
            //p.OwnerId = ownerId;
            return ExecuteNonQuery(RoleExistsStoredProcName, p, PopulateCommonParamter);
        }
        #endregion

        #region Virtual Method
        public virtual List<RoleInfo> GetRoleListForUser(string username)
        {
            SecUtility.CheckParameter(ref username, true, false, true, 256, "username");
            if (username.Length < 1) return new List<RoleInfo>();
            RoleParameterInfo p = new RoleParameterInfo(null, ApplicationName);
            //p.OwnerId = ownerId;
            p.UserName = username;
            return ExecuteReader(GetRolesForUserStoredProcName, p, PopulateGetRolesForUserParamter, HandleGetRolesReturnValue);
        }

        public virtual List<RoleInfo> GetAllRoleList()
        {
            RoleParameterInfo p = new RoleParameterInfo(null, ApplicationName);
            //p.OwnerId = ownerId;
            return ExecuteReader(GetAllRolesStoredProcName, p, PopulateGetAllParamter, HandleGetRolesReturnValue);
        }

        public virtual bool ChangeRoleName(string rolename, string newRolename)
        {
            SecUtility.CheckParameter(ref rolename, true, true, true, 256, "newRolename");

            RoleParameterInfo p = new RoleParameterInfo(rolename, ApplicationName);
            p.NewRoleName = newRolename;
            //p.OwnerId = ownerId;
            return ExecuteNonQuery(ChangeRoleNameStoredProcName, p, PopulateChangeRoleNameParamter);
            //return false;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public virtual List<UserRolesInfo> GetAllRolesForUser(Guid userId)//, Guid? ownerId
        {
            RoleParameterInfo p = new RoleParameterInfo(null, ApplicationName);
            p.UserId = userId;
            //p.OwnerId = ownerId;
            return ExecuteReader(GetAllRolesForUserStoredProcName, p, PopulateGetAllRolesForUserParamter);
        }
        #endregion
    }
}
