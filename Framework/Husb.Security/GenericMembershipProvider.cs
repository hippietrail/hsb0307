using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;
using System.Configuration.Provider;
using System.Web;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Text.RegularExpressions;
using System.Data.Common;
using System.Globalization;
using System.Configuration;
using System.Security.Cryptography;

namespace Husb.Security
{
    public partial class GenericMembershipProvider : MembershipProvider
    {
        #region Fields
        private string _AppName;
        private int _CommandTimeout;
        private bool _EnablePasswordReset;
        private bool _EnablePasswordRetrieval;
        private int _MaxInvalidPasswordAttempts;
        private int _MinRequiredNonalphanumericCharacters;
        private int _MinRequiredPasswordLength;
        private int _PasswordAttemptWindow;
        private MembershipPasswordFormat _PasswordFormat;
        private string _PasswordStrengthRegularExpression;
        private bool _RequiresQuestionAndAnswer;
        private bool _RequiresUniqueEmail;
        private int _SchemaVersionCheck;
        private string _sqlConnectionString;
        private string _databaseInstanceName;
        private const int PASSWORD_SIZE = 14;
        #endregion

        #region StoredProcName
        private const string GetUserByIdStoredProcName = "dbo.aspnet_Membership_GetUserByUserId";
        private const string GetUserbyNameStoredProcName = "dbo.aspnet_Membership_GetUserByName";
        private const string GetAllUsersStoredProcName = "dbo.aspnet_Membership_GetAllUsers";
        private const string GetNumberOfUsersOnlineStoredProcName = "dbo.aspnet_Membership_GetNumberOfUsersOnline";
        private const string GetUserByEmailStoredProcName = "dbo.aspnet_Membership_GetUserByEmail";
        private const string GetAllUsersWithEmpStoredProcName = "dbo.aspnet_Membership_GetAllUsersWithEmp";
        private const string GetUsersWithEmpDynamicStoredProcName = "dbo.aspnet_Membership_GetUsersDynamic";

        private const string FindUsersByEmailStoredProcName = "dbo.aspnet_Membership_FindUsersByEmail";
        private const string FindUsersByNameStoredProcName = "dbo.aspnet_Membership_FindUsersByName";

        private const string SetPasswordStoredProcName = "dbo.aspnet_Membership_SetPassword";
        private const string ResetPasswordStoredProcName = "dbo.aspnet_Membership_ResetPassword";
        private const string ChangePasswordQuestionAndAnswerStoredProcName = "dbo.aspnet_Membership_ChangePasswordQuestionAndAnswer";

        private const string DeleteUserStoredProcName = "dbo.aspnet_Users_DeleteUser";

        private const string UnlockUserStoredProcName = "dbo.aspnet_Membership_UnlockUser";
        private const string UpdateUserStoredProcName = "dbo.aspnet_Membership_UpdateUser";

        private const string ChangeUserNameStoredProcName = "dbo.aspnet_Users_ChangeUserName";


        #endregion

        #region Public properties
        public override bool EnablePasswordRetrieval { get { return _EnablePasswordRetrieval; } }

        public override bool EnablePasswordReset { get { return _EnablePasswordReset; } }

        public override bool RequiresQuestionAndAnswer { get { return _RequiresQuestionAndAnswer; } }

        public override bool RequiresUniqueEmail { get { return _RequiresUniqueEmail; } }

        public override MembershipPasswordFormat PasswordFormat { get { return _PasswordFormat; } }

        public override int MaxInvalidPasswordAttempts { get { return _MaxInvalidPasswordAttempts; } }

        public override int PasswordAttemptWindow { get { return _PasswordAttemptWindow; } }

        public override int MinRequiredPasswordLength
        {
            get { return _MinRequiredPasswordLength; }
        }

        public override int MinRequiredNonAlphanumericCharacters
        {
            get { return _MinRequiredNonalphanumericCharacters; }
        }

        public override string PasswordStrengthRegularExpression
        {
            get { return _PasswordStrengthRegularExpression; }
        }

        public override string ApplicationName
        {
            get { return _AppName; }
            set
            {
                if (String.IsNullOrEmpty(value))
                    throw new ArgumentNullException("value");

                if (value.Length > 256)
                    throw new ProviderException(SR.GetString(SR.Provider_application_name_too_long));
                _AppName = value;
            }
        }

        private int CommandTimeout
        {
            get { return _CommandTimeout; }
        }
        #endregion

        #region Key override method
        /// <summary>
        /// 
        /// </summary>
        /// <param name="name"></param>
        /// <param name="config"></param>
        public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
        {
            // Remove CAS from sample: HttpRuntime.CheckAspNetHostingPermission (AspNetHostingPermissionLevel.Low, SR.Feature_not_supported_at_this_level);
            if (config == null)
                throw new ArgumentNullException("config");
            if (String.IsNullOrEmpty(name))
                name = "SqlMembershipProvider";
            if (string.IsNullOrEmpty(config["description"]))
            {
                config.Remove("description");
                config.Add("description", SR.GetString(SR.MembershipSqlProvider_description));
            }

            base.Initialize(name, config);

            _SchemaVersionCheck = 0;

            _EnablePasswordRetrieval = SecUtility.GetBooleanValue(config, "enablePasswordRetrieval", false);
            _EnablePasswordReset = SecUtility.GetBooleanValue(config, "enablePasswordReset", true);
            _RequiresQuestionAndAnswer = SecUtility.GetBooleanValue(config, "requiresQuestionAndAnswer", true);
            _RequiresUniqueEmail = SecUtility.GetBooleanValue(config, "requiresUniqueEmail", true);
            _MaxInvalidPasswordAttempts = SecUtility.GetIntValue(config, "maxInvalidPasswordAttempts", 5, false, 0);
            _PasswordAttemptWindow = SecUtility.GetIntValue(config, "passwordAttemptWindow", 10, false, 0);
            _MinRequiredPasswordLength = SecUtility.GetIntValue(config, "minRequiredPasswordLength", 7, false, 128);
            _MinRequiredNonalphanumericCharacters = SecUtility.GetIntValue(config, "minRequiredNonalphanumericCharacters", 1, true, 128);

            _PasswordStrengthRegularExpression = config["passwordStrengthRegularExpression"];
            if (_PasswordStrengthRegularExpression != null)
            {
                _PasswordStrengthRegularExpression = _PasswordStrengthRegularExpression.Trim();
                if (_PasswordStrengthRegularExpression.Length != 0)
                {
                    try
                    {
                        Regex regex = new Regex(_PasswordStrengthRegularExpression);
                    }
                    catch (ArgumentException e)
                    {
                        throw new ProviderException(e.Message, e);
                    }
                }
            }
            else
            {
                _PasswordStrengthRegularExpression = string.Empty;
            }
            if (_MinRequiredNonalphanumericCharacters > _MinRequiredPasswordLength)
                throw new HttpException(SR.GetString(SR.MinRequiredNonalphanumericCharacters_can_not_be_more_than_MinRequiredPasswordLength));

            _CommandTimeout = SecUtility.GetIntValue(config, "commandTimeout", 30, true, 0);
            _AppName = config["applicationName"];
            if (string.IsNullOrEmpty(_AppName))
                _AppName = SecUtility.GetDefaultAppName();

            if (_AppName.Length > 256)
            {
                throw new ProviderException(SR.GetString(SR.Provider_application_name_too_long));
            }

            string strTemp = config["passwordFormat"];
            if (strTemp == null)
                strTemp = "Hashed";

            switch (strTemp)
            {
                case "Clear":
                    _PasswordFormat = MembershipPasswordFormat.Clear;
                    break;
                case "Encrypted":
                    _PasswordFormat = MembershipPasswordFormat.Encrypted;
                    break;
                case "Hashed":
                    _PasswordFormat = MembershipPasswordFormat.Hashed;
                    break;
                default:
                    throw new ProviderException(SR.GetString(SR.Provider_bad_password_format));
            }

            if (PasswordFormat == MembershipPasswordFormat.Hashed && EnablePasswordRetrieval)
                throw new ProviderException(SR.GetString(SR.Provider_can_not_retrieve_hashed_password));
            //if (_PasswordFormat == MembershipPasswordFormat.Encrypted && MachineKeySection.IsDecryptionKeyAutogenerated)
            //    throw new ProviderException(SR.GetString(SR.Can_not_use_encrypted_passwords_with_autogen_keys));

            string temp = config["connectionStringName"];
            if (temp == null || temp.Length < 1)
                throw new ProviderException(SR.GetString(SR.Connection_name_not_specified));
            _databaseInstanceName = temp;
            _sqlConnectionString = GetConnectionString(temp, true, true);
            if (_sqlConnectionString == null || _sqlConnectionString.Length < 1)
            {
                throw new ProviderException(SR.GetString(SR.Connection_string_not_found, temp));
            }

            config.Remove("connectionStringName");
            config.Remove("enablePasswordRetrieval");
            config.Remove("enablePasswordReset");
            config.Remove("requiresQuestionAndAnswer");
            config.Remove("applicationName");
            config.Remove("requiresUniqueEmail");
            config.Remove("maxInvalidPasswordAttempts");
            config.Remove("passwordAttemptWindow");
            config.Remove("commandTimeout");
            config.Remove("passwordFormat");
            config.Remove("name");
            config.Remove("minRequiredPasswordLength");
            config.Remove("minRequiredNonalphanumericCharacters");
            config.Remove("passwordStrengthRegularExpression");
            if (config.Count > 0)
            {
                string attribUnrecognized = config.GetKey(0);
                if (!String.IsNullOrEmpty(attribUnrecognized))
                    throw new ProviderException(SR.GetString(SR.Provider_unrecognized_attribute, attribUnrecognized));
            }

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <param name="email"></param>
        /// <param name="passwordQuestion"></param>
        /// <param name="passwordAnswer"></param>
        /// <param name="isApproved"></param>
        /// <param name="providerUserKey"></param>
        /// <param name="status"></param>
        /// <returns></returns>
        public override MembershipUser CreateUser(string username, string password, string email, string passwordQuestion, string passwordAnswer, bool isApproved, object providerUserKey, out MembershipCreateStatus status)
        {
            return CreateUser(username, null, password, email, passwordQuestion, passwordAnswer, isApproved, providerUserKey, out  status);
        }

        public override bool ValidateUser(string username, string password)
        {
            if (SecUtility.ValidateParameter(ref username, true, true, true, 256) &&
                    SecUtility.ValidateParameter(ref password, true, true, false, 128) &&
                    CheckPassword(username, password, true, true))
            {
                // Comment out perf counters in sample: PerfCounters.IncrementCounter(AppPerfCounter.MEMBER_SUCCESS);
                // Comment out events in sample: WebBaseEvent.RaiseSystemEvent(null, WebEventCodes.AuditMembershipAuthenticationSuccess, username);
                return true;
            }
            else
            {
                // Comment out perf counters in sample: PerfCounters.IncrementCounter(AppPerfCounter.MEMBER_FAIL);
                // Comment out events in sample: WebBaseEvent.RaiseSystemEvent(null, WebEventCodes.AuditMembershipAuthenticationFailure, username);
                return false;
            }
        }

        /// <summary>
        /// 根据用户名获取用户信息，如部门、地址等
        /// </summary>
        /// <param name="username"></param>
        /// <param name="userIsOnline"></param>
        /// <returns></returns>
        public override MembershipUser GetUser(string username, bool userIsOnline)
        {
            SecUtility.CheckParameter(ref username, true, false, true, 256, "username");

            Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
            CheckSchemaVersion(db);

            DbCommand cmd = db.GetStoredProcCommand(GetUserbyNameStoredProcName);

            cmd.CommandTimeout = this._CommandTimeout;

            db.AddInParameter(cmd, "ApplicationName", DbType.String, ApplicationName);
            db.AddInParameter(cmd, "UserName", DbType.String, username);
            db.AddInParameter(cmd, "UpdateLastActivity", DbType.Boolean, userIsOnline);
            db.AddInParameter(cmd, "CurrentTimeUtc", DbType.DateTime, DateTime.UtcNow);
            //db.AddInParameter(cmd, "OwnerId", DbType.Guid, ownerId);

            db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);

            MembershipUserEx user = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(cmd))
                {
                    if (reader.Read())
                    {
                        string email = GetNullableString(reader, 0);
                        string passwordQuestion = GetNullableString(reader, 1);
                        string comment = GetNullableString(reader, 2);
                        bool isApproved = reader.GetBoolean(3);
                        DateTime dtCreate = reader.GetDateTime(4).ToLocalTime();
                        DateTime dtLastLogin = reader.GetDateTime(5).ToLocalTime();
                        DateTime dtLastActivity = reader.GetDateTime(6).ToLocalTime();
                        DateTime dtLastPassChange = reader.GetDateTime(7).ToLocalTime();
                        Guid userId = reader.GetGuid(8);
                        bool isLockedOut = reader.GetBoolean(9);
                        DateTime dtLastLockoutDate = reader.GetDateTime(10).ToLocalTime();
                        //Guid? _ownerId = (!reader.IsDBNull(11)) ? (Guid?)reader.GetGuid(11) : null;

                        ////////////////////////////////////////////////////////////
                        // Step 4 : Return the result
                        user = new MembershipUserEx(this.Name,
                                                   username,
                                                   userId,
                                                   email,
                                                   passwordQuestion,
                                                   comment,
                                                   isApproved,
                                                   isLockedOut,
                                                   dtCreate,
                                                   dtLastLogin,
                                                   dtLastActivity,
                                                   dtLastPassChange,
                                                   dtLastLockoutDate);
                        //user.OwnerId = _ownerId;
                        if (reader.NextResult())
                        {
                            if (((DbDataReader)reader).HasRows)
                            {
                                if (reader.Read())
                                {
                                    PopulateEmployeeInfo(reader, user);
                                    //user.IsEmployee = true;
                                }
                            }
                        }
                    }
                    //reader.Close();
                }
            }
            catch
            {
                throw;
            }
            return user;
        }

        /// <summary>
        /// 根据用户Id获取用户信息，如部门、地址等
        /// </summary>
        /// <param name="providerUserKey"></param>
        /// <param name="userIsOnline"></param>
        /// <returns></returns>
        public override MembershipUser GetUser(object providerUserKey, bool userIsOnline)
        {
            if (providerUserKey == null)
            {
                throw new ArgumentNullException("providerUserKey");
            }

            if (!(providerUserKey is Guid))
            {
                throw new ArgumentException(SR.GetString(SR.Membership_InvalidProviderUserKey), "providerUserKey");
            }

            Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
            CheckSchemaVersion(db);

            DbCommand cmd = db.GetStoredProcCommand(GetUserByIdStoredProcName);

            cmd.CommandTimeout = this._CommandTimeout;

            db.AddInParameter(cmd, "UserId", DbType.Guid, providerUserKey);
            db.AddInParameter(cmd, "UpdateLastActivity", DbType.Boolean, userIsOnline);
            db.AddInParameter(cmd, "CurrentTimeUtc", DbType.DateTime, DateTime.UtcNow);

            db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);

            MembershipUserEx user = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(cmd))
                {
                    if (reader.Read())
                    {
                        string email = GetNullableString(reader, 0);
                        string passwordQuestion = GetNullableString(reader, 1);
                        string comment = GetNullableString(reader, 2);
                        bool isApproved = reader.GetBoolean(3);
                        DateTime dtCreate = reader.GetDateTime(4).ToLocalTime();
                        DateTime dtLastLogin = reader.GetDateTime(5).ToLocalTime();
                        DateTime dtLastActivity = reader.GetDateTime(6).ToLocalTime();
                        DateTime dtLastPassChange = reader.GetDateTime(7).ToLocalTime();
                        string userName = GetNullableString(reader, 8);
                        bool isLockedOut = reader.GetBoolean(9);
                        DateTime dtLastLockoutDate = reader.GetDateTime(10).ToLocalTime();
                        //Guid? ownerId = (!reader.IsDBNull(11)) ? (Guid?)reader.GetGuid(11) : null;

                        ////////////////////////////////////////////////////////////
                        // Step 4 : Return the result
                        user = new MembershipUserEx(this.Name,
                                                   userName,
                                                   providerUserKey,
                                                   email,
                                                   passwordQuestion,
                                                   comment,
                                                   isApproved,
                                                   isLockedOut,
                                                   dtCreate,
                                                   dtLastLogin,
                                                   dtLastActivity,
                                                   dtLastPassChange,
                                                   dtLastLockoutDate);
                        //user.IsEmployee = false;
                        //user.OwnerId = ownerId;
                        user.LoginName = userName;
                        if (reader.NextResult())
                        {
                            if (((DbDataReader)reader).HasRows)
                            {
                                if (reader.Read())
                                {
                                    PopulateEmployeeInfo(reader, user);
                                    //user.IsEmployee = true;
                                }
                            }
                        }
                    }
                    reader.Close();
                }
            }
            catch
            {
                throw;
            }
            return user;

        }
        #endregion

        #region frequently operation
        public override bool ChangePassword(string username, string oldPassword, string newPassword)
        {
            #region ValidateParameter
            SecUtility.CheckParameter(ref username, true, true, true, 256, "username");
            SecUtility.CheckParameter(ref oldPassword, true, true, false, 128, "oldPassword");
            SecUtility.CheckParameter(ref newPassword, true, true, false, 128, "newPassword");

            string salt = null;
            int passwordFormat;
            int status;

            if (!CheckPassword(username, oldPassword, false, false, out salt, out passwordFormat))
            {
                return false;
            }

            if (newPassword.Length < MinRequiredPasswordLength)
            {
                throw new ArgumentException(SR.GetString(
                              SR.Password_too_short,
                              "newPassword",
                              MinRequiredPasswordLength.ToString(CultureInfo.InvariantCulture)));
            }

            int count = 0;

            for (int i = 0; i < newPassword.Length; i++)
            {
                if (!char.IsLetterOrDigit(newPassword, i))
                {
                    count++;
                }
            }

            if (count < MinRequiredNonAlphanumericCharacters)
            {
                throw new ArgumentException(SR.GetString(
                              SR.Password_need_more_non_alpha_numeric_chars,
                              "newPassword",
                              MinRequiredNonAlphanumericCharacters.ToString(CultureInfo.InvariantCulture)));
            }

            if (PasswordStrengthRegularExpression.Length > 0)
            {
                if (!Regex.IsMatch(newPassword, PasswordStrengthRegularExpression))
                {
                    throw new ArgumentException(SR.GetString(SR.Password_does_not_match_regular_expression,
                                                             "newPassword"));
                }
            }

            string pass = EncodePassword(newPassword, (int)passwordFormat, salt);
            if (pass.Length > 128)
            {
                throw new ArgumentException(SR.GetString(SR.Membership_password_too_long), "newPassword");
            }
            #endregion

            #region Fire OnValidatingPassword Event
            ValidatePasswordEventArgs e = new ValidatePasswordEventArgs(username, newPassword, false);
            OnValidatingPassword(e);

            if (e.Cancel)
            {
                if (e.FailureInformation != null)
                {
                    throw e.FailureInformation;
                }
                else
                {
                    throw new ArgumentException(SR.GetString(SR.Membership_Custom_Password_Validation_Failure), "newPassword");
                }
            }
            #endregion

            Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
            CheckSchemaVersion(db);

            DbCommand cmd = db.GetStoredProcCommand(SetPasswordStoredProcName);
            cmd.CommandTimeout = this._CommandTimeout;
            db.AddInParameter(cmd, "ApplicationName", DbType.String, ApplicationName);
            db.AddInParameter(cmd, "UserName", DbType.String, username);
            db.AddInParameter(cmd, "NewPassword", DbType.String, pass);
            db.AddInParameter(cmd, "PasswordSalt", DbType.String, salt);
            db.AddInParameter(cmd, "PasswordFormat", DbType.Int32, passwordFormat);
            db.AddInParameter(cmd, "CurrentTimeUtc", DbType.DateTime, DateTime.UtcNow);

            db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);

            try
            {
                db.ExecuteNonQuery(cmd);

                object o = db.GetParameterValue(cmd, "ReturnValue");
                status = ((o != null) ? ((int)o) : -1);

                if (status != 0)
                {
                    string errText = GetExceptionText(status);

                    if (IsStatusDueToBadPassword(status))
                    {
                        throw new MembershipPasswordException(errText);
                    }
                    else
                    {
                        throw new ProviderException(errText);
                    }
                }
            }
            catch
            {
                throw;
            }
            db = null;

            return true;
        }

        public override string ResetPassword(string username, string passwordAnswer)
        {
            if (!EnablePasswordReset)
            {
                throw new NotSupportedException(SR.GetString(SR.Not_configured_to_support_password_resets));
            }

            SecUtility.CheckParameter(ref username, true, true, true, 256, "username");

            string salt;
            int passwordFormat;
            string passwdFromDB;
            int status;
            int failedPasswordAttemptCount;
            int failedPasswordAnswerAttemptCount;
            bool isApproved;
            DateTime lastLoginDate, lastActivityDate;

            GetPasswordWithFormat(username, false, out status, out passwdFromDB, out passwordFormat, out salt, out failedPasswordAttemptCount,
                                  out failedPasswordAnswerAttemptCount, out isApproved, out lastLoginDate, out lastActivityDate);
            if (status != 0)
            {
                if (IsStatusDueToBadPassword(status))
                {
                    throw new MembershipPasswordException(GetExceptionText(status));
                }
                else
                {
                    throw new ProviderException(GetExceptionText(status));
                }
            }

            string encodedPasswordAnswer;
            if (passwordAnswer != null)
            {
                passwordAnswer = passwordAnswer.Trim();
            }
            if (!string.IsNullOrEmpty(passwordAnswer))
                encodedPasswordAnswer = EncodePassword(passwordAnswer.ToLower(CultureInfo.InvariantCulture), passwordFormat, salt);
            else
                encodedPasswordAnswer = passwordAnswer;
            SecUtility.CheckParameter(ref encodedPasswordAnswer, RequiresQuestionAndAnswer, RequiresQuestionAndAnswer, false, 128, "passwordAnswer");
            string newPassword = GeneratePassword();

            ValidatePasswordEventArgs e = new ValidatePasswordEventArgs(username, newPassword, false);
            OnValidatingPassword(e);

            if (e.Cancel)
            {
                if (e.FailureInformation != null)
                {
                    throw e.FailureInformation;
                }
                else
                {
                    throw new ProviderException(SR.GetString(SR.Membership_Custom_Password_Validation_Failure));
                }
            }

            Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
            CheckSchemaVersion(db);

            DbCommand cmd = db.GetStoredProcCommand(ResetPasswordStoredProcName);
            cmd.CommandTimeout = this._CommandTimeout;
            db.AddInParameter(cmd, "ApplicationName", DbType.String, ApplicationName);
            db.AddInParameter(cmd, "UserName", DbType.String, username);
            db.AddInParameter(cmd, "NewPassword", DbType.String, EncodePassword(newPassword, (int)passwordFormat, salt));
            db.AddInParameter(cmd, "MaxInvalidPasswordAttempts", DbType.Int32, MaxInvalidPasswordAttempts);
            db.AddInParameter(cmd, "PasswordAttemptWindow", DbType.Int32, PasswordAttemptWindow);
            db.AddInParameter(cmd, "PasswordSalt", DbType.String, salt);
            db.AddInParameter(cmd, "PasswordFormat", DbType.Int32, (int)passwordFormat);
            db.AddInParameter(cmd, "CurrentTimeUtc", DbType.DateTime, DateTime.UtcNow);

            if (RequiresQuestionAndAnswer)
            {
                db.AddInParameter(cmd, "PasswordAnswer", DbType.String, encodedPasswordAnswer);
            }

            db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);

            try
            {
                db.ExecuteNonQuery(cmd);

                object o = db.GetParameterValue(cmd, "ReturnValue");
                status = ((o != null) ? ((int)o) : -1);

                if (status != 0)
                {
                    string errText = GetExceptionText(status);

                    if (IsStatusDueToBadPassword(status))
                    {
                        throw new MembershipPasswordException(errText);
                    }
                    else
                    {
                        throw new ProviderException(errText);
                    }
                }
            }
            catch
            {
                throw;
            }
            cmd = null;
            db = null;

            return newPassword;
        }

        public override string GetPassword(string username, string answer)
        {
            if (!EnablePasswordRetrieval)
            {
                throw new NotSupportedException(SR.GetString(SR.Membership_PasswordRetrieval_not_supported));
            }

            SecUtility.CheckParameter(ref username, true, true, true, 256, "username");

            string encodedPasswordAnswer = GetEncodedPasswordAnswer(username, answer);
            SecUtility.CheckParameter(ref encodedPasswordAnswer, RequiresQuestionAndAnswer, RequiresQuestionAndAnswer, false, 128, "passwordAnswer");

            string errText;
            int passwordFormat = 0;
            int status = 0;

            string pass = GetPasswordFromDB(username, encodedPasswordAnswer, RequiresQuestionAndAnswer, out passwordFormat, out status);

            if (pass == null)
            {
                errText = GetExceptionText(status);
                if (IsStatusDueToBadPassword(status))
                {
                    throw new MembershipPasswordException(errText);
                }
                else
                {
                    throw new ProviderException(errText);
                }
            }

            return UnEncodePassword(pass, passwordFormat);
        }

        public override bool ChangePasswordQuestionAndAnswer(string username, string password, string newPasswordQuestion, string newPasswordAnswer)
        {
            SecUtility.CheckParameter(ref username, true, true, true, 256, "username");
            SecUtility.CheckParameter(ref password, true, true, false, 128, "password");

            string salt;
            int passwordFormat;
            if (!CheckPassword(username, password, false, false, out salt, out passwordFormat))
                return false;
            SecUtility.CheckParameter(ref newPasswordQuestion, RequiresQuestionAndAnswer, RequiresQuestionAndAnswer, false, 256, "newPasswordQuestion");
            string encodedPasswordAnswer;
            if (newPasswordAnswer != null)
            {
                newPasswordAnswer = newPasswordAnswer.Trim();
            }

            SecUtility.CheckParameter(ref newPasswordAnswer, RequiresQuestionAndAnswer, RequiresQuestionAndAnswer, false, 128, "newPasswordAnswer");
            if (!string.IsNullOrEmpty(newPasswordAnswer))
            {
                encodedPasswordAnswer = EncodePassword(newPasswordAnswer.ToLower(CultureInfo.InvariantCulture), (int)passwordFormat, salt);
            }
            else
                encodedPasswordAnswer = newPasswordAnswer;
            SecUtility.CheckParameter(ref encodedPasswordAnswer, RequiresQuestionAndAnswer, RequiresQuestionAndAnswer, false, 128, "newPasswordAnswer");


            Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
            CheckSchemaVersion(db);

            DbCommand cmd = db.GetStoredProcCommand(ChangePasswordQuestionAndAnswerStoredProcName);
            cmd.CommandTimeout = this._CommandTimeout;
            db.AddInParameter(cmd, "ApplicationName", DbType.String, ApplicationName);
            db.AddInParameter(cmd, "UserName", DbType.String, username);
            db.AddInParameter(cmd, "NewPasswordQuestion", DbType.String, newPasswordQuestion);
            db.AddInParameter(cmd, "NewPasswordAnswer", DbType.Int32, encodedPasswordAnswer);

            db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);
            int status = 0;
            try
            {
                db.ExecuteNonQuery(cmd);

                object o = db.GetParameterValue(cmd, "ReturnValue");
                status = ((o != null) ? ((int)o) : -1);

                if (status != 0)
                {
                    throw new ProviderException(GetExceptionText(status));
                }
            }
            catch
            {
                throw;
            }
            //cmd = null;
            //db = null;
            return (status == 0);
        }

        public override bool DeleteUser(string username, bool deleteAllRelatedData)
        {
            SecUtility.CheckParameter(ref username, true, true, true, 256, "username");

            Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
            CheckSchemaVersion(db);

            DbCommand cmd = db.GetStoredProcCommand(DeleteUserStoredProcName);
            cmd.CommandTimeout = this._CommandTimeout;
            db.AddInParameter(cmd, "ApplicationName", DbType.String, ApplicationName);
            //db.AddInParameter(cmd, "OwnerId", DbType.Guid, ownerId);
            db.AddInParameter(cmd, "UserName", DbType.String, username);

            if (deleteAllRelatedData)
            {
                db.AddInParameter(cmd, "TablesToDeleteFrom", DbType.Int32, 0xF);
            }
            else
            {
                db.AddInParameter(cmd, "TablesToDeleteFrom", DbType.Int32, 1);
            }
            db.AddOutParameter(cmd, "NumTablesDeletedFrom", DbType.Int32, 4);

            int status = -1;
            try
            {
                db.ExecuteNonQuery(cmd);

                object o = db.GetParameterValue(cmd, "NumTablesDeletedFrom");
                status = ((o != null) ? ((int)o) : -1);
            }
            catch
            {
                throw;
            }

            return status > 0;
        }

        public override MembershipUserCollection FindUsersByEmail(string emailToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            SecUtility.CheckParameter(ref emailToMatch, false, false, false, 256, "emailToMatch");

            if (pageIndex < 0)
                throw new ArgumentException(SR.GetString(SR.PageIndex_bad), "pageIndex");
            if (pageSize < 1)
                throw new ArgumentException(SR.GetString(SR.PageSize_bad), "pageSize");

            long upperBound = (long)pageIndex * pageSize + pageSize - 1;
            if (upperBound > Int32.MaxValue)
                throw new ArgumentException(SR.GetString(SR.PageIndex_PageSize_bad), "pageIndex and pageSize");

            Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
            CheckSchemaVersion(db);

            DbCommand cmd = db.GetStoredProcCommand(FindUsersByEmailStoredProcName);
            cmd.CommandTimeout = this._CommandTimeout;
            db.AddInParameter(cmd, "ApplicationName", DbType.String, ApplicationName);
            db.AddInParameter(cmd, "EmailToMatch", DbType.String, emailToMatch);
            db.AddInParameter(cmd, "PageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(cmd, "PageSize", DbType.Int32, pageSize);

            db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);

            totalRecords = 0;
            MembershipUserCollection users = new MembershipUserCollection();
            try
            {
                using (IDataReader reader = db.ExecuteReader(cmd))
                {

                    while (reader.Read())
                    {
                        string username, email, passwordQuestion, comment;
                        bool isApproved;
                        DateTime dtCreate, dtLastLogin, dtLastActivity, dtLastPassChange;
                        Guid userId;
                        bool isLockedOut;
                        DateTime dtLastLockoutDate;

                        username = GetNullableString(reader, 0);
                        email = GetNullableString(reader, 1);
                        passwordQuestion = GetNullableString(reader, 2);
                        comment = GetNullableString(reader, 3);
                        isApproved = reader.GetBoolean(4);
                        dtCreate = reader.GetDateTime(5).ToLocalTime();
                        dtLastLogin = reader.GetDateTime(6).ToLocalTime();
                        dtLastActivity = reader.GetDateTime(7).ToLocalTime();
                        dtLastPassChange = reader.GetDateTime(8).ToLocalTime();
                        userId = reader.GetGuid(9);
                        isLockedOut = reader.GetBoolean(10);
                        dtLastLockoutDate = reader.GetDateTime(11).ToLocalTime();

                        users.Add(new MembershipUserEx(this.Name,
                                                       username,
                                                       userId,
                                                       email,
                                                       passwordQuestion,
                                                       comment,
                                                       isApproved,
                                                       isLockedOut,
                                                       dtCreate,
                                                       dtLastLogin,
                                                       dtLastActivity,
                                                       dtLastPassChange,
                                                       dtLastLockoutDate));
                    }
                    if (reader != null)
                    {
                        reader.Close();
                    }
                    object o = db.GetParameterValue(cmd, "ReturnValue");
                    if (o != null && o is int)
                    {
                        totalRecords = (int)o;
                    }
                }
            }
            catch
            {
                throw;
            }

            return users;
        }

        public override MembershipUserCollection FindUsersByName(string usernameToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            SecUtility.CheckParameter(ref usernameToMatch, true, true, false, 256, "usernameToMatch");

            if (pageIndex < 0)
                throw new ArgumentException(SR.GetString(SR.PageIndex_bad), "pageIndex");
            if (pageSize < 1)
                throw new ArgumentException(SR.GetString(SR.PageSize_bad), "pageSize");

            long upperBound = (long)pageIndex * pageSize + pageSize - 1;
            if (upperBound > Int32.MaxValue)
                throw new ArgumentException(SR.GetString(SR.PageIndex_PageSize_bad), "pageIndex and pageSize");

            Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
            CheckSchemaVersion(db);

            DbCommand cmd = db.GetStoredProcCommand(FindUsersByNameStoredProcName);
            cmd.CommandTimeout = this._CommandTimeout;
            db.AddInParameter(cmd, "ApplicationName", DbType.String, ApplicationName);
            db.AddInParameter(cmd, "UserNameToMatch", DbType.String, usernameToMatch);
            db.AddInParameter(cmd, "PageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(cmd, "PageSize", DbType.Int32, pageSize);

            db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);


            totalRecords = 0;
            MembershipUserCollection users = new MembershipUserCollection();
            try
            {
                using (IDataReader reader = db.ExecuteReader(cmd))
                {

                    while (reader.Read())
                    {
                        string username, email, passwordQuestion, comment;
                        bool isApproved;
                        DateTime dtCreate, dtLastLogin, dtLastActivity, dtLastPassChange;
                        Guid userId;
                        bool isLockedOut;
                        DateTime dtLastLockoutDate;

                        username = GetNullableString(reader, 0);
                        email = GetNullableString(reader, 1);
                        passwordQuestion = GetNullableString(reader, 2);
                        comment = GetNullableString(reader, 3);
                        isApproved = reader.GetBoolean(4);
                        dtCreate = reader.GetDateTime(5).ToLocalTime();
                        dtLastLogin = reader.GetDateTime(6).ToLocalTime();
                        dtLastActivity = reader.GetDateTime(7).ToLocalTime();
                        dtLastPassChange = reader.GetDateTime(8).ToLocalTime();
                        userId = reader.GetGuid(9);
                        isLockedOut = reader.GetBoolean(10);
                        dtLastLockoutDate = reader.GetDateTime(11).ToLocalTime();
                        MembershipUserEx user = new MembershipUserEx(this.Name,
                                                       username,
                                                       userId,
                                                       email,
                                                       passwordQuestion,
                                                       comment,
                                                       isApproved,
                                                       isLockedOut,
                                                       dtCreate,
                                                       dtLastLogin,
                                                       dtLastActivity,
                                                       dtLastPassChange,
                                                       dtLastLockoutDate);
                        users.Add(user);
                        if (reader.NextResult())
                        {
                            if (((DbDataReader)reader).HasRows)
                            {
                                if (reader.Read())
                                {
                                    PopulateEmployeeInfo(reader, user);
                                    //user.IsEmployee = true;
                                }
                            }
                        }
                    }
                    if (reader != null)
                    {
                        reader.Close();
                    }
                    object o = db.GetParameterValue(cmd, "ReturnValue");
                    if (o != null && o is int)
                    {
                        totalRecords = (int)o;
                    }
                }
            }
            catch
            {
                throw;
            }
            return users;
        }

        public override MembershipUserCollection GetAllUsers(int pageIndex, int pageSize, out int totalRecords)
        {
            if (pageIndex < 0)
                throw new ArgumentException(SR.GetString(SR.PageIndex_bad), "pageIndex");
            if (pageSize < 1)
                throw new ArgumentException(SR.GetString(SR.PageSize_bad), "pageSize");

            long upperBound = (long)pageIndex * pageSize + pageSize - 1;
            if (upperBound > Int32.MaxValue)
                throw new ArgumentException(SR.GetString(SR.PageIndex_PageSize_bad), "pageIndex and pageSize");

            Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
            CheckSchemaVersion(db);

            DbCommand cmd = db.GetStoredProcCommand(GetAllUsersStoredProcName);
            cmd.CommandTimeout = this._CommandTimeout;
            db.AddInParameter(cmd, "ApplicationName", DbType.String, ApplicationName);
            //db.AddInParameter(cmd, "OwnerId", DbType.Guid, ownerId);
            db.AddInParameter(cmd, "PageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(cmd, "PageSize", DbType.Int32, pageSize);

            db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);


            MembershipUserCollection users = new MembershipUserCollection();
            totalRecords = 0;

            try
            {
                using (IDataReader reader = db.ExecuteReader(cmd))
                {

                    while (reader.Read())
                    {
                        string username, email, passwordQuestion, comment;
                        bool isApproved;
                        DateTime dtCreate, dtLastLogin, dtLastActivity, dtLastPassChange;
                        Guid userId;
                        bool isLockedOut;
                        DateTime dtLastLockoutDate;

                        username = GetNullableString(reader, 0);
                        email = GetNullableString(reader, 1);
                        passwordQuestion = GetNullableString(reader, 2);
                        comment = GetNullableString(reader, 3);
                        isApproved = reader.GetBoolean(4);
                        dtCreate = reader.GetDateTime(5).ToLocalTime();
                        dtLastLogin = reader.GetDateTime(6).ToLocalTime();
                        dtLastActivity = reader.GetDateTime(7).ToLocalTime();
                        dtLastPassChange = reader.GetDateTime(8).ToLocalTime();
                        userId = reader.GetGuid(9);
                        isLockedOut = reader.GetBoolean(10);
                        dtLastLockoutDate = reader.GetDateTime(11).ToLocalTime();

                        users.Add(new MembershipUserEx(this.Name,
                                                       username,
                                                       userId,
                                                       email,
                                                       passwordQuestion,
                                                       comment,
                                                       isApproved,
                                                       isLockedOut,
                                                       dtCreate,
                                                       dtLastLogin,
                                                       dtLastActivity,
                                                       dtLastPassChange,
                                                       dtLastLockoutDate));
                    }
                    if (reader != null)
                    {
                        reader.Close();
                    }
                    object o = db.GetParameterValue(cmd, "ReturnValue");
                    if (o != null && o is int)
                    {
                        totalRecords = (int)o;
                    }
                }
            }
            catch
            {
                throw;
            }
            return users;
        }

        public override int GetNumberOfUsersOnline()
        {
            Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
            CheckSchemaVersion(db);

            DbCommand cmd = db.GetStoredProcCommand(GetNumberOfUsersOnlineStoredProcName);
            cmd.CommandTimeout = this._CommandTimeout;
            db.AddInParameter(cmd, "ApplicationName", DbType.String, ApplicationName);
            db.AddInParameter(cmd, "MinutesSinceLastInActive", DbType.Int32, Membership.UserIsOnlineTimeWindow);
            db.AddInParameter(cmd, "CurrentTimeUtc", DbType.DateTime, DateTime.UtcNow);

            db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);

            int totalRecords = -1;
            try
            {
                db.ExecuteNonQuery(cmd);

                object o = db.GetParameterValue(cmd, "ReturnValue");
                totalRecords = ((o != null) ? ((int)o) : -1);
            }
            catch
            {
                throw;
            }

            return totalRecords;
        }

        public override string GetUserNameByEmail(string email)
        {
            SecUtility.CheckParameter(ref email, false, false, false, 256, "email");

            Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
            CheckSchemaVersion(db);

            DbCommand cmd = db.GetStoredProcCommand(GetUserByEmailStoredProcName);
            cmd.CommandTimeout = this._CommandTimeout;
            db.AddInParameter(cmd, "ApplicationName", DbType.String, ApplicationName);
            db.AddInParameter(cmd, "Email", DbType.Int32, Membership.UserIsOnlineTimeWindow);
            //db.AddInParameter(cmd, "CurrentTimeUtc", DbType.DateTime, DateTime.UtcNow);

            db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);

            string userName = null;
            try
            {
                using (IDataReader reader = db.ExecuteReader(cmd))
                {
                    if (reader.Read())
                    {
                        userName = GetNullableString(reader, 0);
                        if (RequiresUniqueEmail && reader.Read())
                        {
                            throw new ProviderException(SR.GetString(SR.Membership_more_than_one_user_with_email));
                        }
                    }
                }

            }
            catch
            {
                throw;
            }

            return userName;
        }

        public override bool UnlockUser(string userName)
        {
            SecUtility.CheckParameter(ref userName, true, true, true, 256, "username");

            Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
            CheckSchemaVersion(db);

            DbCommand cmd = db.GetStoredProcCommand(UnlockUserStoredProcName);
            cmd.CommandTimeout = this._CommandTimeout;
            db.AddInParameter(cmd, "ApplicationName", DbType.String, ApplicationName);
            db.AddInParameter(cmd, "UserName", DbType.String, userName);

            db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);


            int status = -1;
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

            //if (status == 0)
            //{
            //    return true;
            //}

            //return false;

            return (status == 0);
        }

        public override void UpdateUser(MembershipUser user)
        {
            if (user == null)
            {
                throw new ArgumentNullException("user");
            }

            string temp = user.UserName;
            SecUtility.CheckParameter(ref temp, true, true, true, 256, "UserName");
            temp = user.Email;
            SecUtility.CheckParameter(ref temp, RequiresUniqueEmail, RequiresUniqueEmail, false, 256, "Email");
            user.Email = temp;

            Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
            CheckSchemaVersion(db);

            DbCommand cmd = db.GetStoredProcCommand(UpdateUserStoredProcName);
            cmd.CommandTimeout = this._CommandTimeout;
            db.AddInParameter(cmd, "ApplicationName", DbType.String, ApplicationName);
            db.AddInParameter(cmd, "UserName", DbType.String, user.UserName);
            db.AddInParameter(cmd, "Email", DbType.String, user.Email);
            db.AddInParameter(cmd, "Comment", DbType.String, user.Comment);
            db.AddInParameter(cmd, "IsApproved", DbType.Boolean, user.IsApproved ? 1 : 0);
            db.AddInParameter(cmd, "LastLoginDate", DbType.DateTime, user.LastLoginDate.ToUniversalTime());
            db.AddInParameter(cmd, "LastActivityDate", DbType.DateTime, user.LastActivityDate.ToUniversalTime());
            db.AddInParameter(cmd, "UniqueEmail", DbType.Int32, RequiresUniqueEmail ? 1 : 0);
            db.AddInParameter(cmd, "CurrentTimeUtc", DbType.DateTime, DateTime.UtcNow);

            db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);


            int status = -1;
            try
            {
                db.ExecuteNonQuery(cmd);

                object o = db.GetParameterValue(cmd, "ReturnValue");
                status = ((o != null) ? ((int)o) : -1);

                if (status != 0)
                {
                    throw new ProviderException(this.GetExceptionText(status));
                }
            }
            catch
            {
                throw;
            }
        }
        #endregion

        #region Helper
        private bool IsStatusDueToBadPassword(int status)
        {
            return (status >= 2 && status <= 6 || status == 99);
        }

        private DateTime RoundToSeconds(DateTime dt)
        {
            return new DateTime(dt.Year, dt.Month, dt.Day, dt.Hour, dt.Minute, dt.Second);
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

        internal string GenerateSalt()
        {
            byte[] buf = new byte[16];
            (new RNGCryptoServiceProvider()).GetBytes(buf);
            return Convert.ToBase64String(buf);
        }

        internal string EncodePassword(string pass, int passwordFormat, string salt)
        {
            if (passwordFormat == 0) // MembershipPasswordFormat.Clear
                return pass;

            byte[] bIn = Encoding.Unicode.GetBytes(pass);
            byte[] bSalt = Convert.FromBase64String(salt);
            byte[] bAll = new byte[bSalt.Length + bIn.Length];
            byte[] bRet = null;

            Buffer.BlockCopy(bSalt, 0, bAll, 0, bSalt.Length);
            Buffer.BlockCopy(bIn, 0, bAll, bSalt.Length, bIn.Length);
            if (passwordFormat == 1)
            { // MembershipPasswordFormat.Hashed
                HashAlgorithm s = HashAlgorithm.Create(Membership.HashAlgorithmType);
                bRet = s.ComputeHash(bAll);
            }
            else
            {
                bRet = EncryptPassword(bAll);
            }

            return Convert.ToBase64String(bRet);
        }

        internal string UnEncodePassword(string pass, int passwordFormat)
        {
            switch (passwordFormat)
            {
                case 0: // MembershipPasswordFormat.Clear:
                    return pass;
                case 1: // MembershipPasswordFormat.Hashed:
                    throw new ProviderException(SR.GetString(SR.Provider_can_not_decode_hashed_password));
                default:
                    byte[] bIn = Convert.FromBase64String(pass);
                    byte[] bRet = DecryptPassword(bIn);
                    if (bRet == null)
                        return null;
                    return Encoding.Unicode.GetString(bRet, 16, bRet.Length - 16);
            }
        }

        private bool CheckPassword(string username, string password, bool updateLastLoginActivityDate, bool failIfNotApproved)
        {
            string salt;
            int passwordFormat;
            return CheckPassword(username, password, updateLastLoginActivityDate, failIfNotApproved, out salt, out passwordFormat);
        }
        private bool CheckPassword(string username, string password, bool updateLastLoginActivityDate, bool failIfNotApproved, out string salt, out int passwordFormat)
        {
            string passwdFromDB;
            int status;
            int failedPasswordAttemptCount;
            int failedPasswordAnswerAttemptCount;
            bool isPasswordCorrect;
            bool isApproved;
            DateTime lastLoginDate, lastActivityDate;

            // 先根据用户名从数据库中读出相关信息,
            GetPasswordWithFormat(username, updateLastLoginActivityDate, out status, out passwdFromDB, out passwordFormat, out salt, out failedPasswordAttemptCount,
                                  out failedPasswordAnswerAttemptCount, out isApproved, out lastLoginDate, out lastActivityDate);
            if (status != 0)
                return false;
            if (!isApproved && failIfNotApproved)
                return false;

            string encodedPasswd = EncodePassword(password, passwordFormat, salt);

            isPasswordCorrect = passwdFromDB.Equals(encodedPasswd);

            if (isPasswordCorrect && failedPasswordAttemptCount == 0 && failedPasswordAnswerAttemptCount == 0)
                return true;

            UpdateUser(username, isPasswordCorrect, updateLastLoginActivityDate, lastLoginDate, lastActivityDate, out status);
            
            return isPasswordCorrect;
        }

        private string GetEncodedPasswordAnswer(string username, string passwordAnswer)
        {
            if (passwordAnswer != null)
            {
                passwordAnswer = passwordAnswer.Trim();
            }
            if (string.IsNullOrEmpty(passwordAnswer))
                return passwordAnswer;
            int status, passwordFormat, failedPasswordAttemptCount, failedPasswordAnswerAttemptCount;
            string password, passwordSalt;
            bool isApproved;
            DateTime lastLoginDate, lastActivityDate;
            GetPasswordWithFormat(username, false, out status, out password, out passwordFormat, out passwordSalt,
                                  out failedPasswordAttemptCount, out failedPasswordAnswerAttemptCount, out isApproved, out lastLoginDate, out lastActivityDate);
            if (status == 0)
                return EncodePassword(passwordAnswer.ToLower(CultureInfo.InvariantCulture), passwordFormat, passwordSalt);
            else
                throw new ProviderException(GetExceptionText(status));
        }

        public virtual string GeneratePassword()
        {
            return Membership.GeneratePassword(
                      MinRequiredPasswordLength < PASSWORD_SIZE ? PASSWORD_SIZE : MinRequiredPasswordLength,
                      MinRequiredNonAlphanumericCharacters);
        }

        private string GetExceptionText(int status)
        {
            string key;
            switch (status)
            {
                case 0:
                    return String.Empty;
                case 1:
                    key = SR.Membership_UserNotFound;
                    break;
                case 2:
                    key = SR.Membership_WrongPassword;
                    break;
                case 3:
                    key = SR.Membership_WrongAnswer;
                    break;
                case 4:
                    key = SR.Membership_InvalidPassword;
                    break;
                case 5:
                    key = SR.Membership_InvalidQuestion;
                    break;
                case 6:
                    key = SR.Membership_InvalidAnswer;
                    break;
                case 7:
                    key = SR.Membership_InvalidEmail;
                    break;
                case 99:
                    key = SR.Membership_AccountLockOut;
                    break;
                default:
                    key = SR.Provider_Error;
                    break;
            }
            return SR.GetString(key);
        }

        private string GetNullableString(IDataReader reader, int col)
        {
            //if (!reader.IsDBNull(col))
            //{
            //    return reader.GetString(col);
            //}
            //return null;

            return (!reader.IsDBNull(col)) ? reader.GetString(col) : null;
        }
        #endregion

        #region virtual

        public List<MembershipUserEx> GetAllUsersWithEmp(int pageIndex, int pageSize, out int totalRecords)
        {
            if (pageIndex < 0)
                throw new ArgumentException(SR.GetString(SR.PageIndex_bad), "pageIndex");
            if (pageSize < 1)
                throw new ArgumentException(SR.GetString(SR.PageSize_bad), "pageSize");

            long upperBound = (long)pageIndex * pageSize + pageSize - 1;
            if (upperBound > Int32.MaxValue)
                throw new ArgumentException(SR.GetString(SR.PageIndex_PageSize_bad), "pageIndex and pageSize");

            Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
            CheckSchemaVersion(db);

            DbCommand cmd = db.GetStoredProcCommand(GetAllUsersWithEmpStoredProcName);
            cmd.CommandTimeout = this._CommandTimeout;
            db.AddInParameter(cmd, "ApplicationName", DbType.String, ApplicationName);
            //db.AddInParameter(cmd, "OwnerId", DbType.Guid, ownerId);
            db.AddInParameter(cmd, "PageIndex", DbType.Int32, pageIndex);
            db.AddInParameter(cmd, "PageSize", DbType.Int32, pageSize);

            db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);

            List<MembershipUserEx> users = new List<MembershipUserEx>();
            //MembershipUserCollection users = new MembershipUserCollection();
            totalRecords = 0;

            try
            {
                using (IDataReader reader = db.ExecuteReader(cmd))
                {

                    while (reader.Read())
                    {
                        MembershipUserEx user = new MembershipUserEx(this.Name,
                                                       (System.String)reader["UserName"],
                                                       (System.Guid)reader["UserId"],//userId,
                                                       reader["Email"] == DBNull.Value ? null : (System.String)reader["Email"],//email,
                                                       reader["PasswordQuestion"] == DBNull.Value ? "" : (System.String)reader["PasswordQuestion"],//passwordQuestion,
                                                       reader["Comment"] == DBNull.Value ? "" : (System.String)reader["Comment"],//comment,
                                                       (System.Boolean)reader["IsApproved"],//isApproved,
                                                       (System.Boolean)reader["IsLockedOut"],//isLockedOut,
                                                       (System.DateTime)reader["CreateDate"],//dtCreate,
                                                       (System.DateTime)reader["LastLoginDate"],//dtLastLogin,
                                                       (System.DateTime)reader["LastActivityDate"],//dtLastActivity,
                                                       (System.DateTime)reader["LastPasswordChangedDate"],//dtLastPassChange,
                                                       (System.DateTime)reader["LastLockoutDate"]//dtLastLockoutDate
                                                       );
                        user.LoginName = (System.String)reader["UserName"];
                        //user.OwnerId = ownerId;
                        PopulateEmployeeInfo(reader, user);
                        //LoadUserInfo(user, reader);
                        users.Add(user);
                    }
                    if (reader != null)
                    {
                        reader.Close();
                    }
                    object o = db.GetParameterValue(cmd, "ReturnValue");
                    if (o != null && o is int)
                    {
                        totalRecords = (int)o;
                    }
                }
            }
            catch
            {
                throw;
            }
            return users;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="ownerId"></param>
        /// <param name="where"></param>
        /// <param name="totalRecords"></param>
        /// <returns></returns>
        public List<MembershipUserEx> GetUsersWithEmpDynamic(string where)
        {
            Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
            CheckSchemaVersion(db);

            DbCommand cmd = db.GetStoredProcCommand(GetUsersWithEmpDynamicStoredProcName);
            cmd.CommandTimeout = this._CommandTimeout;
            db.AddInParameter(cmd, "ApplicationName", DbType.String, ApplicationName);
            //db.AddInParameter(cmd, "OwnerId", DbType.Guid, ownerId);
            db.AddInParameter(cmd, "WhereCondition", DbType.String, where);

            //db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);

            List<MembershipUserEx> users = new List<MembershipUserEx>();
            //MembershipUserCollection users = new MembershipUserCollection();
            //totalRecords = 0;

            try
            {
                using (IDataReader reader = db.ExecuteReader(cmd))
                {

                    while (reader.Read())
                    {
                        MembershipUserEx user = new MembershipUserEx(this.Name,
                                                       (System.String)reader["UserName"],
                                                       (System.Guid)reader["UserId"],//userId,
                                                       reader["Email"] == DBNull.Value ? null : (System.String)reader["Email"],//email,
                                                       reader["PasswordQuestion"] == DBNull.Value ? "" : (System.String)reader["PasswordQuestion"],//passwordQuestion,
                                                       reader["Comment"] == DBNull.Value ? "" : (System.String)reader["Comment"],//comment,
                                                       (System.Boolean)reader["IsApproved"],//isApproved,
                                                       (System.Boolean)reader["IsLockedOut"],//isLockedOut,
                                                       (System.DateTime)reader["CreateDate"],//dtCreate,
                                                       (System.DateTime)reader["LastLoginDate"],//dtLastLogin,
                                                       (System.DateTime)reader["LastActivityDate"],//dtLastActivity,
                                                       (System.DateTime)reader["LastPasswordChangedDate"],//dtLastPassChange,
                                                       (System.DateTime)reader["LastLockoutDate"]//dtLastLockoutDate
                                                       );
                        user.LoginName = (System.String)reader["UserName"];
                        //user.OwnerId = ownerId;
                        //LoadUserInfo(user, reader);
                        PopulateEmployeeInfo(reader, user);


                        users.Add(user);
                    }
                    if (reader != null)
                    {
                        reader.Close();
                    }
                    //object o = db.GetParameterValue(cmd, "ReturnValue");
                    //if (o != null && o is int)
                    //{
                    //    totalRecords = (int)o;
                    //}
                }
            }
            catch
            {
                throw;
            }
            return users;
        }


        public List<MembershipUserEx> GetAllUsersWithEmp()
        {
            int totalRecords = 0;
            return GetAllUsersWithEmp(0, 0x7fffffff, out totalRecords);
        }

        /// <summary>
        /// 修改用户名
        /// </summary>
        /// <param name="username">原来的用户名</param>
        /// <param name="newUsername">新的用户名</param>
        /// <param name="ownerId">用户的拥有者</param>
        /// <returns>修改成功与否</returns>
        public virtual bool ChangeUserName(string username, string newUsername)
        {
            SecUtility.CheckParameter(ref username, true, true, true, 256, "username");
            SecUtility.CheckParameter(ref newUsername, true, true, true, 256, "username");

            Database db = DatabaseFactory.CreateDatabase(this._databaseInstanceName);
            CheckSchemaVersion(db);

            DbCommand cmd = db.GetStoredProcCommand(ChangeUserNameStoredProcName);
            cmd.CommandTimeout = this._CommandTimeout;
            db.AddInParameter(cmd, "ApplicationName", DbType.String, ApplicationName);
            db.AddInParameter(cmd, "UserName", DbType.String, username);
            db.AddInParameter(cmd, "NewUsername", DbType.String, newUsername);
            //db.AddInParameter(cmd, "OwnerId", DbType.Guid, ownerId);

            db.AddParameter(cmd, "ReturnValue", DbType.Int32, ParameterDirection.ReturnValue, String.Empty, DataRowVersion.Default, null);
            int status;
            try
            {
                db.ExecuteNonQuery(cmd);

                object o = db.GetParameterValue(cmd, "ReturnValue");
                status = ((o != null) ? ((int)o) : -1);

                if (status != 0)
                {
                    string errText = GetExceptionText(status);

                    if (status == 6)
                    {
                        //throw new  MembershipPasswordException(errText);ProviderException
                        throw new ProviderException("用户名已存在！");
                    }
                    else
                    {
                        throw new ProviderException(errText);
                    }
                }
            }
            catch
            {
                throw;
            }
            db = null;

            return true;
        }

        #endregion

        #region new
        /// <summary>
        /// 
        /// </summary>
        /// <param name="username"></param>
        /// <param name="empid"></param>
        /// <param name="ownerId"></param>
        /// <param name="password"></param>
        /// <param name="email"></param>
        /// <param name="passwordQuestion"></param>
        /// <param name="passwordAnswer"></param>
        /// <param name="isApproved"></param>
        /// <param name="providerUserKey"></param>
        /// <param name="status"></param>
        /// <returns></returns>
        public virtual MembershipUserEx CreateUser(string username, Guid? empid, string password, string email, string passwordQuestion, string passwordAnswer, bool isApproved, object providerUserKey, out MembershipCreateStatus status)
        {
            #region ValidateParameter
            if (!SecUtility.ValidateParameter(ref password, true, true, false, 128))
            {
                status = MembershipCreateStatus.InvalidPassword;
                return null;
            }

            string salt = GenerateSalt();
            string pass = EncodePassword(password, (int)_PasswordFormat, salt);
            if (pass.Length > 128)
            {
                status = MembershipCreateStatus.InvalidPassword;
                return null;
            }

            string encodedPasswordAnswer;
            if (passwordAnswer != null)
            {
                passwordAnswer = passwordAnswer.Trim();
            }

            if (!string.IsNullOrEmpty(passwordAnswer))
            {
                if (passwordAnswer.Length > 128)
                {
                    status = MembershipCreateStatus.InvalidAnswer;
                    return null;
                }
                encodedPasswordAnswer = EncodePassword(passwordAnswer.ToLower(CultureInfo.InvariantCulture), (int)_PasswordFormat, salt);
            }
            else
                encodedPasswordAnswer = passwordAnswer;
            if (!SecUtility.ValidateParameter(ref encodedPasswordAnswer, RequiresQuestionAndAnswer, true, false, 128))
            {
                status = MembershipCreateStatus.InvalidAnswer;
                return null;
            }

            if (!SecUtility.ValidateParameter(ref username, true, true, true, 256))
            {
                status = MembershipCreateStatus.InvalidUserName;
                return null;
            }

            if (!SecUtility.ValidateParameter(ref email,
                                               RequiresUniqueEmail,
                                               RequiresUniqueEmail,
                                               false,
                                               256))
            {
                status = MembershipCreateStatus.InvalidEmail;
                return null;
            }

            if (!SecUtility.ValidateParameter(ref passwordQuestion, RequiresQuestionAndAnswer, true, false, 256))
            {
                status = MembershipCreateStatus.InvalidQuestion;
                return null;
            }

            if (providerUserKey != null)
            {
                if (!(providerUserKey is Guid))
                {
                    status = MembershipCreateStatus.InvalidProviderUserKey;
                    return null;
                }
            }

            if (password.Length < MinRequiredPasswordLength)
            {
                status = MembershipCreateStatus.InvalidPassword;
                return null;
            }

            int count = 0;

            for (int i = 0; i < password.Length; i++)
            {
                if (!char.IsLetterOrDigit(password, i))
                {
                    count++;
                }
            }

            if (count < MinRequiredNonAlphanumericCharacters)
            {
                status = MembershipCreateStatus.InvalidPassword;
                return null;
            }

            if (PasswordStrengthRegularExpression.Length > 0)
            {
                if (!Regex.IsMatch(password, PasswordStrengthRegularExpression))
                {
                    status = MembershipCreateStatus.InvalidPassword;
                    return null;
                }
            }
            #endregion

            #region Fire ValidatePassword Event
            ValidatePasswordEventArgs e = new ValidatePasswordEventArgs(username, password, true);
            OnValidatingPassword(e);

            if (e.Cancel)
            {
                status = MembershipCreateStatus.InvalidPassword;
                return null;
            }
            #endregion

            #region Save User Info to database
            if (empid == Guid.Empty)
            {
                empid = null;
            }

            return InsertUser(username, empid, pass, salt, email, passwordQuestion, encodedPasswordAnswer, isApproved, providerUserKey, out status);
            #endregion
        }

        #endregion

        #region Employee Helper
        private void PopulateEmployeeInfo(IDataReader reader, MembershipUserEx user)
        {
            user.EmployeeId = reader["EmployeeId"] == DBNull.Value ? System.Guid.Empty : (System.Guid)reader["EmployeeId"];
            if (user.EmployeeId != System.Guid.Empty)
            {
                user.Name = (System.String)reader["Name"];

                user.EmployeeNumber = reader["EmployeeNumber"] == DBNull.Value ? "" : (System.String)reader["EmployeeNumber"];
                user.QueryNumber = reader["QueryNumber"] == DBNull.Value ? "" : (System.String)reader["QueryNumber"];
                user.BirthDate = reader["BirthDate"] == DBNull.Value ? DateTime.MinValue : (System.DateTime?)reader["BirthDate"];
                user.MaritalStatus = reader["MaritalStatus"] == DBNull.Value ? "" : (System.String)reader["MaritalStatus"];
                user.Gender = reader["Gender"] == DBNull.Value ? "" : (System.String)reader["Gender"];
                user.HireDate = reader["HireDate"] == DBNull.Value ? DateTime.MinValue : (System.DateTime?)reader["HireDate"];
                user.Title = reader["Title"] == DBNull.Value ? "" : (System.String)reader["Title"];
                user.Nation = reader["Nation"] == DBNull.Value ? "" : (System.String)reader["Nation"];
                user.Nationality = reader["Nationality"] == DBNull.Value ? "" : (System.String)reader["Nationality"];
                user.IDNumber = reader["IDNumber"] == DBNull.Value ? "" : (System.String)reader["IDNumber"];
                user.HealthStatus = reader["HealthStatus"] == DBNull.Value ? "" : (System.String)reader["HealthStatus"];
                user.EducationalLevel = reader["EducationalLevel"] == DBNull.Value ? "" : (System.String)reader["EducationalLevel"];
                user.Political = reader["Political"] == DBNull.Value ? "" : (System.String)reader["Political"];
                user.School = reader["School"] == DBNull.Value ? "" : (System.String)reader["School"];
                user.Email1 = reader["Email"] == DBNull.Value ? "" : (System.String)reader["Email"];
                user.Email2 = reader["Email2"] == DBNull.Value ? "" : (System.String)reader["Email2"];
                user.Telephone = reader["Telephone"] == DBNull.Value ? "" : (System.String)reader["Telephone"];
                user.Telephone2 = reader["Telephone2"] == DBNull.Value ? "" : (System.String)reader["Telephone2"];
                user.IMId = reader["IMId"] == DBNull.Value ? "" : (System.String)reader["IMId"];
                user.IMId2 = reader["IMId2"] == DBNull.Value ? "" : (System.String)reader["IMId2"];
                user.NativePlace = reader["NativePlace"] == DBNull.Value ? "" : (System.String)reader["NativePlace"];

                //user.AddressId = (System.Guid)reader["AddressId"];
                user.AddressId = reader["AddressId"] == DBNull.Value ? System.Guid.Empty : (System.Guid)reader["AddressId"];
                //user.ProvinceId = (System.Guid)reader["ProvinceId"];
                user.ProvinceId = reader["ProvinceId"] == DBNull.Value ? System.Guid.Empty : (System.Guid)reader["ProvinceId"];
                //user.Province = (System.String)reader["Province"];
                user.Province = reader["Province"] == DBNull.Value ? "" : (System.String)reader["Province"];
                //user.CityId = (System.Guid)reader["CityId"];
                user.CityId = reader["CityId"] == DBNull.Value ? System.Guid.Empty : (System.Guid)reader["CityId"];
                //user.City = (System.String)reader["City"];
                user.City = reader["City"] == DBNull.Value ? "" : (System.String)reader["City"];

                //user.AddressLine = (System.String)reader["AddressLine"];
                user.AddressLine = reader["AddressLine"] == DBNull.Value ? "" : (System.String)reader["AddressLine"];
                user.PostalCode = reader["PostalCode"] == DBNull.Value ? "" : (System.String)reader["PostalCode"];
                user.DepartmentId = (System.Guid)reader["DepartmentId"];
                user.Department = reader["Department"] == DBNull.Value ? "" : (System.String)reader["Department"];

                user.IsDeleted = (System.Boolean)reader["IsDeleted"];
                user.IsActive = (System.Boolean)reader["IsActive"];
                user.CreatedTime = (System.DateTime)reader["CreatedTime"];
                user.CreatedBy = (System.Guid)reader["CreatedBy"];
                user.ModifiedTime = (System.DateTime)reader["ModifiedTime"];
                user.LastModifiedBy = (System.Guid)reader["LastModifiedBy"];
                user.Version = reader["Version"] == DBNull.Value ? (int)0 : (System.Int32?)reader["Version"];
                user.Description = reader["Description"] == DBNull.Value ? "" : (System.String)reader["Description"];

                user.IsPrimary = (System.Boolean)reader["IsPrimary"];
                //user.Address = (System.String)reader["Address"];
                user.Address = reader["Address"] == DBNull.Value ? "" : (System.String)reader["Address"];

                user.IsEmployee = true;
            }

        }

        
        #endregion
    }
}
