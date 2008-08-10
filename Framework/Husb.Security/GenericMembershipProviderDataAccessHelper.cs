using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Web.Security;
using System.Data;

namespace Husb.Security
{
    public partial class GenericMembershipProvider// : MembershipProvider
    {
        #region Fields
        private const string CreateUserStoredProcName = "dbo.aspnet_Membership_CreateUser";
        private const string UpdateUserInfoStoredProcName = "dbo.aspnet_Membership_UpdateUserInfo";
        private const string GetPasswordWithFormatStoredProcName = "dbo.aspnet_Membership_GetPasswordWithFormat";
        private const string GetPasswordStoredProcName = "dbo.aspnet_Membership_GetPassword";

        #endregion

        private void CheckSchemaVersion(Database db)
        {
            string[] features = { "Common", "Membership" };
            string version = "1";

            SecUtility.CheckSchemaVersion(this,
                                           db,
                                           features,
                                           version,
                                           ref _SchemaVersionCheck);
        }
        private void PopulateCreateUserParamters(Database db, DbCommand cmd, UserParamters paramters)
        {
            db.AddInParameter(cmd, "ApplicationName", DbType.String, paramters.ApplicationName);
            db.AddInParameter(cmd, "UserName", DbType.String, paramters.UserName);
            db.AddInParameter(cmd, "Password", DbType.String, (object)paramters.Password ?? DBNull.Value);// (object)paramters.LocalId ?? DBNull.Value
            db.AddInParameter(cmd, "PasswordSalt", DbType.String, (object)paramters.PasswordSalt ?? DBNull.Value);
            db.AddInParameter(cmd, "Email", DbType.String, (object)paramters.Email ?? DBNull.Value);
            db.AddInParameter(cmd, "PasswordQuestion", DbType.String, (object)paramters.PasswordQuestion ?? DBNull.Value);
            db.AddInParameter(cmd, "PasswordAnswer", DbType.String, (object)paramters.PasswordAnswer ?? DBNull.Value);
            db.AddInParameter(cmd, "IsApproved", DbType.Boolean, (object)paramters.IsApproved ?? DBNull.Value);
            db.AddInParameter(cmd, "CurrentTimeUtc", DbType.DateTime, (object)paramters.CurrentTimeUtc ?? DBNull.Value);
            db.AddInParameter(cmd, "CreateDate", DbType.DateTime, DateTime.Now);
            db.AddInParameter(cmd, "UniqueEmail", DbType.Int32, (object)paramters.UniqueEmail ?? DBNull.Value);
            db.AddInParameter(cmd, "PasswordFormat", DbType.Int32, (object)paramters.PasswordFormat ?? DBNull.Value);
            db.AddInParameter(cmd, "EmployeeId", DbType.Guid, paramters.EmpId);
            //db.AddOutParameter(cmd, "UserId", System.Data.DbType.AnsiString, 50);
            db.AddParameter(cmd, "UserId", DbType.Guid, ParameterDirection.InputOutput, String.Empty, DataRowVersion.Default, null);
            db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);
        }

        private void PopulateCreateUserParamters(Database db, DbCommand cmd, string username, Guid? empid, string password, string passwordSalt, string email, string passwordQuestion, string passwordAnswer, bool isApproved)
        {
            db.AddInParameter(cmd, "ApplicationName", DbType.String, this.ApplicationName);
            db.AddInParameter(cmd, "UserName", DbType.String, username);
            db.AddInParameter(cmd, "Password", DbType.String, password);// (object)paramters.LocalId ?? DBNull.Value
            db.AddInParameter(cmd, "PasswordSalt", DbType.String, passwordSalt);
            db.AddInParameter(cmd, "Email", DbType.String, email);
            db.AddInParameter(cmd, "PasswordQuestion", DbType.String, passwordQuestion);
            db.AddInParameter(cmd, "PasswordAnswer", DbType.String, passwordAnswer);
            db.AddInParameter(cmd, "IsApproved", DbType.Boolean, isApproved);
            db.AddInParameter(cmd, "CurrentTimeUtc", DbType.DateTime, RoundToSeconds(DateTime.UtcNow));
            db.AddInParameter(cmd, "CreateDate", DbType.DateTime, DateTime.Now);
            db.AddInParameter(cmd, "UniqueEmail", DbType.Int32, this.RequiresUniqueEmail ? 1 : 0);
            db.AddInParameter(cmd, "PasswordFormat", DbType.Int32, (int)(this.PasswordFormat));
            db.AddInParameter(cmd, "EmployeeId", DbType.Guid, empid);
            //db.AddInParameter(cmd, "OwnerId", DbType.Guid, ownerId);
            //db.AddOutParameter(cmd, "UserId", System.Data.DbType.AnsiString, 50);
            db.AddParameter(cmd, "UserId", DbType.Guid, ParameterDirection.InputOutput, String.Empty, DataRowVersion.Default, null);
            db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);

        }


        private MembershipUserEx InsertUser(string username, Guid? empid, string password, string passwordSalt, string email, string passwordQuestion, string passwordAnswer, bool isApproved, object providerUserKey, out MembershipCreateStatus status)
        {
            MembershipUserEx user = null;
            Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);

            CheckSchemaVersion(db);

            DbCommand cmd = db.GetStoredProcCommand(CreateUserStoredProcName);//InsertStoredProcedureName

            cmd.CommandTimeout = this._CommandTimeout;
            PopulateCreateUserParamters(db, cmd, username, empid, password, passwordSalt, email, passwordQuestion, passwordAnswer, isApproved);

            try
            {
                db.ExecuteNonQuery(cmd);

                object o = db.GetParameterValue(cmd, "ReturnValue");
                int iStatus = ((o != null) ? ((int)o) : -1);

                if ((iStatus < 0) || (iStatus > (int)MembershipCreateStatus.ProviderError))//11
                {
                    //iStatus = 11;
                    iStatus = (int)MembershipCreateStatus.ProviderError;
                }
                status = (MembershipCreateStatus)iStatus;
                if (iStatus != 0)
                {
                    return null;
                }

                Guid userId = new Guid(cmd.Parameters["@UserId"].Value.ToString());
                DateTime dt = RoundToSeconds(DateTime.UtcNow).ToLocalTime();
                user = new MembershipUserEx(this.Name,
                                           username,
                                           userId,
                                           email,
                                           passwordQuestion,
                                           null,
                                           isApproved,
                                           false,
                                           dt,
                                           dt,
                                           dt,
                                           dt,
                                           new DateTime(1754, 1, 1));
                if (empid != null)
                {
                    user.EmployeeId = empid.Value;
                }
                

            }
            catch
            {
                throw;
            }
            finally
            {
                //
            }
            return user;
        }

        private void PopulateUpdateUserInfoParamters(Database db, DbCommand cmd, UserParamters paramters)
        {
            db.AddInParameter(cmd, "ApplicationName", DbType.String, paramters.ApplicationName);
            db.AddInParameter(cmd, "UserName", DbType.String, paramters.UserName);
            db.AddInParameter(cmd, "IsPasswordCorrect", DbType.Boolean, (object)paramters.IsPasswordCorrect ?? DBNull.Value);// (object)paramters.LocalId ?? DBNull.Value
            db.AddInParameter(cmd, "UpdateLastLoginActivityDate", DbType.Boolean, (object)paramters.UpdateLastLoginActivityDate ?? DBNull.Value);
            db.AddInParameter(cmd, "MaxInvalidPasswordAttempts", DbType.Int32, (object)paramters.MaxInvalidPasswordAttempts ?? DBNull.Value);
            db.AddInParameter(cmd, "PasswordAttemptWindow", DbType.Int32, (object)paramters.PasswordAttemptWindow ?? DBNull.Value);
            db.AddInParameter(cmd, "CurrentTimeUtc", DbType.DateTime, (object)paramters.CurrentTimeUtc ?? DBNull.Value);
            db.AddInParameter(cmd, "LastLoginDate", DbType.DateTime, (object)paramters.LastLoginDate ?? DBNull.Value);
            db.AddInParameter(cmd, "LastActivityDate", DbType.DateTime, (object)paramters.LastActivityDate ?? DBNull.Value);
            //db.AddInParameter(cmd, "OwnerId", DbType.Guid, ownerId);

            db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);
        }

        private void UpdateUser(UserParamters paramters, out int status)
        {
            status = 0;
            Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
            CheckSchemaVersion(db);

            DbCommand cmd = db.GetStoredProcCommand(UpdateUserInfoStoredProcName);//

            cmd.CommandTimeout = this._CommandTimeout;
            PopulateUpdateUserInfoParamters(db, cmd, paramters);

            try
            {
                db.ExecuteNonQuery(cmd);

                object o = db.GetParameterValue(cmd, "ReturnValue");
                status = ((o != null) ? ((int)o) : -1);
            }
            catch
            {
                throw;
            }
        }

        private void PopulateUpdateUserInfoParamters(Database db, DbCommand cmd, string username, bool isPasswordCorrect, bool updateLastLoginActivityDate, DateTime lastLoginDate, DateTime lastActivityDate)
        {
            db.AddInParameter(cmd, "ApplicationName", DbType.String, ApplicationName);
            db.AddInParameter(cmd, "UserName", DbType.String, username);
            db.AddInParameter(cmd, "IsPasswordCorrect", DbType.Boolean, isPasswordCorrect);
            db.AddInParameter(cmd, "UpdateLastLoginActivityDate", DbType.Boolean, updateLastLoginActivityDate);
            db.AddInParameter(cmd, "MaxInvalidPasswordAttempts", DbType.Int32, MaxInvalidPasswordAttempts);
            db.AddInParameter(cmd, "PasswordAttemptWindow", DbType.Int32, PasswordAttemptWindow);
            db.AddInParameter(cmd, "CurrentTimeUtc", DbType.DateTime, DateTime.UtcNow);
            db.AddInParameter(cmd, "LastLoginDate", DbType.DateTime, isPasswordCorrect ? DateTime.UtcNow : lastLoginDate);
            db.AddInParameter(cmd, "LastActivityDate", DbType.DateTime, isPasswordCorrect ? DateTime.UtcNow : lastActivityDate);
            //db.AddInParameter(cmd, "OwnerId", DbType.Guid, ownerId);

            db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);
        }

        private void UpdateUser(string username, bool isPasswordCorrect, bool updateLastLoginActivityDate, DateTime lastLoginDate, DateTime lastActivityDate, out int status)
        {
            status = 0;
            Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
            CheckSchemaVersion(db);

            DbCommand cmd = db.GetStoredProcCommand(UpdateUserInfoStoredProcName);//

            cmd.CommandTimeout = this._CommandTimeout;
            //PopulateUpdateUserInfoParamters(db, cmd, paramters);
            PopulateUpdateUserInfoParamters(db, cmd, username, isPasswordCorrect, updateLastLoginActivityDate, lastLoginDate, lastActivityDate);
            try
            {
                db.ExecuteNonQuery(cmd);

                object o = db.GetParameterValue(cmd, "ReturnValue");
                status = ((o != null) ? ((int)o) : -1);
            }
            catch
            {
                throw;
            }
        }

        private void PopulateGetPasswordWithFormatParamters(Database db, DbCommand cmd, UserParamters paramters)
        {
            db.AddInParameter(cmd, "ApplicationName", DbType.String, paramters.ApplicationName);
            db.AddInParameter(cmd, "UserName", DbType.String, paramters.UserName);
            db.AddInParameter(cmd, "UpdateLastLoginActivityDate", DbType.Boolean, (object)paramters.UpdateLastLoginActivityDate ?? DBNull.Value);
            db.AddInParameter(cmd, "CurrentTimeUtc", DbType.DateTime, (object)paramters.CurrentTimeUtc ?? DBNull.Value);

            db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);
        }

        private void GetPasswordWithFormat(string username,
                                            bool updateLastLoginActivityDate,
                                            out int status,
                                            out string password,
                                            out int passwordFormat,
                                            out string passwordSalt,
                                            out int failedPasswordAttemptCount,
                                            out int failedPasswordAnswerAttemptCount,
                                            out bool isApproved,
                                            out DateTime lastLoginDate,
                                            out DateTime lastActivityDate
                                            )
        {
            Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
            CheckSchemaVersion(db);

            DbCommand cmd = db.GetStoredProcCommand(GetPasswordWithFormatStoredProcName);

            cmd.CommandTimeout = this._CommandTimeout;

            db.AddInParameter(cmd, "ApplicationName", DbType.String, ApplicationName);
            db.AddInParameter(cmd, "UserName", DbType.String, username);
            db.AddInParameter(cmd, "UpdateLastLoginActivityDate", DbType.Boolean, updateLastLoginActivityDate);
            db.AddInParameter(cmd, "CurrentTimeUtc", DbType.DateTime, DateTime.UtcNow);
            //db.AddInParameter(cmd, "OwnerId", DbType.Guid, ownerId);

            db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);

            IDataReader reader = null;
            try
            {
                try
                {
                    status = -1;
                    reader = db.ExecuteReader(cmd);

                    if (reader.Read())
                    {
                        password = reader.GetString(0);
                        passwordFormat = reader.GetInt32(1);
                        passwordSalt = reader.GetString(2);
                        failedPasswordAttemptCount = reader.GetInt32(3);
                        failedPasswordAnswerAttemptCount = reader.GetInt32(4);
                        isApproved = reader.GetBoolean(5);
                        lastLoginDate = reader.GetDateTime(6);
                        lastActivityDate = reader.GetDateTime(7);
                    }
                    else
                    {
                        password = null;
                        passwordFormat = 0;
                        passwordSalt = null;
                        failedPasswordAttemptCount = 0;
                        failedPasswordAnswerAttemptCount = 0;
                        isApproved = false;
                        lastLoginDate = DateTime.UtcNow;
                        lastActivityDate = DateTime.UtcNow;
                    }
                }
                finally
                {
                    if (reader != null)
                    {
                        reader.Close();
                        reader = null;

                        object o = db.GetParameterValue(cmd, "ReturnValue");
                        //status = ((o != null && o != System.DBNull.Value) ? ((int)o) : -1);
                        status = ((o != null) ? ((int)o) : -1);
                    }
                }
            }
            catch
            {
                throw;
            }
        }


        private void PopulateGetPasswordParamters(Database db, DbCommand cmd, UserParamters paramters, bool requiresQuestionAndAnswer)
        {
            db.AddInParameter(cmd, "ApplicationName", DbType.String, paramters.ApplicationName);
            db.AddInParameter(cmd, "UserName", DbType.String, paramters.UserName);
            db.AddInParameter(cmd, "MaxInvalidPasswordAttempts", DbType.Int32, (object)paramters.MaxInvalidPasswordAttempts ?? DBNull.Value);
            db.AddInParameter(cmd, "PasswordAttemptWindow", DbType.Int32, (object)paramters.PasswordAttemptWindow ?? DBNull.Value);
            db.AddInParameter(cmd, "CurrentTimeUtc", DbType.DateTime, (object)paramters.CurrentTimeUtc ?? DBNull.Value);
            if (requiresQuestionAndAnswer)
            {
                db.AddInParameter(cmd, "PasswordAnswer", DbType.String, (object)paramters.PasswordAnswer ?? DBNull.Value);
            }
            db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);
        }

        private string GetPasswordFromDB(string username,
                                          string passwordAnswer,
                                          bool requiresQuestionAndAnswer,
                                          out int passwordFormat,
                                          out int status)
        {
            Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
            CheckSchemaVersion(db);

            DbCommand cmd = db.GetStoredProcCommand(GetPasswordWithFormatStoredProcName);

            cmd.CommandTimeout = this._CommandTimeout;

            UserParamters p = new UserParamters();
            p.ApplicationName = ApplicationName;
            p.UserName = username;
            p.MaxInvalidPasswordAttempts = MaxInvalidPasswordAttempts;
            p.PasswordAttemptWindow = PasswordAttemptWindow;
            p.CurrentTimeUtc = DateTime.UtcNow;
            p.PasswordAnswer = passwordAnswer;

            PopulateGetPasswordParamters(db, cmd, p, requiresQuestionAndAnswer);

            string password = null;

            IDataReader reader = null;
            try
            {
                try
                {
                    status = -1;
                    reader = db.ExecuteReader(cmd);

                    if (reader.Read())
                    {
                        password = reader.GetString(0);
                        passwordFormat = reader.GetInt32(1);
                    }
                    else
                    {
                        password = null;
                        passwordFormat = 0;
                    }
                }
                finally
                {
                    if (reader != null)
                    {
                        reader.Close();
                        reader = null;

                        object o = db.GetParameterValue(cmd, "ReturnValue");
                        //status = ((o != null && o != System.DBNull.Value) ? ((int)o) : -1);
                        status = ((o != null) ? ((int)o) : -1);
                    }
                }
            }
            catch
            {
                throw;
            }


            return password;
        }
    }


    #region UserParamters
    internal class UserParamters
    {
        private string applicationName;
        private string userName;
        private string password;
        private string passwordSalt;
        private string email;
        private string passwordQuestion;
        private string encodedPasswordAnswer;
        private bool isApproved;
        private int uniqueEmail;
        private int passwordFormat;
        private DateTime currentTimeUtc;
        private Guid providerUserKey;
        private int returnValue;

        private bool isPasswordCorrect;
        private bool updateLastLoginActivityDate;
        private int maxInvalidPasswordAttempts;
        private int passwordAttemptWindow;
        private DateTime lastLoginDate;
        private DateTime lastActivityDate;

        private Guid? empId;
        //private string g;
        //private string h;
        //private string i;
        //private string j;
        //private string k;

        public UserParamters()
        {
            empId = null;
        }

        #region Properties
        /// <summary>
        /// ApplicationName
        /// </summary>
        public System.String ApplicationName
        {
            get { return applicationName; }
            set { applicationName = value; }
        }
        /// <summary>
        /// UserName
        /// </summary>
        public System.String UserName
        {
            get { return userName; }
            set { userName = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String Password
        {
            get { return password; }
            set { password = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String PasswordSalt
        {
            get { return passwordSalt; }
            set { passwordSalt = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String Email
        {
            get { return email; }
            set { email = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String PasswordQuestion
        {
            get { return passwordQuestion; }
            set { passwordQuestion = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String PasswordAnswer
        {
            get { return encodedPasswordAnswer; }
            set { encodedPasswordAnswer = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.Boolean IsApproved
        {
            get { return isApproved; }
            set { isApproved = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.Int32 UniqueEmail
        {
            get { return uniqueEmail; }
            set { uniqueEmail = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.Int32 PasswordFormat
        {
            get { return passwordFormat; }
            set { passwordFormat = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.DateTime CurrentTimeUtc
        {
            get { return currentTimeUtc; }
            set { currentTimeUtc = value; }
        }

        /// <summary>
        /// 
        /// </summary>
        public System.Guid UserId
        {
            get { return providerUserKey; }
            set { providerUserKey = value; }
        }

        /// <summary>
        /// 
        /// </summary>
        public System.Int32 ReturnValue
        {
            get { return returnValue; }
            set { returnValue = value; }
        }


        /// <summary>
        /// 
        /// </summary>
        public System.Boolean IsPasswordCorrect
        {
            get { return isPasswordCorrect; }
            set { isPasswordCorrect = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.Boolean UpdateLastLoginActivityDate
        {
            get { return updateLastLoginActivityDate; }
            set { updateLastLoginActivityDate = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.Int32 MaxInvalidPasswordAttempts
        {
            get { return maxInvalidPasswordAttempts; }
            set { maxInvalidPasswordAttempts = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.Int32 PasswordAttemptWindow
        {
            get { return passwordAttemptWindow; }
            set { passwordAttemptWindow = value; }
        }

        /// <summary>
        /// 
        /// </summary>
        public System.DateTime LastLoginDate
        {
            get { return lastLoginDate; }
            set { lastLoginDate = value; }
        }

        /// <summary>
        /// 
        /// </summary>
        public System.DateTime LastActivityDate
        {
            get { return lastActivityDate; }
            set { lastActivityDate = value; }
        }

        /// <summary>
        /// 
        /// </summary>
        public System.Guid? EmpId
        {
            get { return empId; }
            set { empId = value; }
        }
        #endregion

    }
    #endregion
}
