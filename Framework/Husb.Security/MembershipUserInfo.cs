using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;

namespace Husb.Security
{
    [Serializable]
    public class MembershipUserEx : MembershipUser
    {
        public MembershipUserEx()
        {
            //
        }

        public MembershipUserEx(
            string providerName,
            string name,
            object providerUserKey,
            string email,
            string passwordQuestion,
            string comment,
            bool isApproved,
            bool isLockedOut,
            DateTime creationDate,
            DateTime lastLoginDate,
            DateTime lastActivityDate,
            DateTime lastPasswordChangedDate,
            DateTime lastLockoutDate)
            : base(

                providerName,
                name,
                providerUserKey,
                email,
                passwordQuestion,
                comment,
                isApproved,
                isLockedOut,
                creationDate,
                lastLoginDate,
                lastActivityDate,
                lastPasswordChangedDate,
                lastLockoutDate
                )
        {
            this._userId = (providerUserKey is Guid) ? (Guid)providerUserKey : Guid.Empty;
            this._isEmployee = false;
            //this._displayName = name;
        }

        public MembershipUserEx(
            string providerName,
            string name,
            object providerUserKey,
            string email,
            string passwordQuestion,
            string comment,
            bool isApproved,
            bool isLockedOut,
            DateTime creationDate,
            DateTime lastLoginDate,
            DateTime lastActivityDate,
            DateTime lastPasswordChangedDate,
            DateTime lastLockoutDate,
            bool isEmployee
            //string displayName
            )
            : base(

            providerName,
            name,
            providerUserKey,
            email,
            passwordQuestion,
            comment,
            isApproved,
            isLockedOut,
            creationDate,
            lastLoginDate,
            lastActivityDate,
            lastPasswordChangedDate,
            lastLockoutDate
            )
        {
            this._userId = (providerUserKey is Guid) ? (Guid)providerUserKey : Guid.Empty;
            this._isEmployee = isEmployee;
            //this._displayName = displayName;
        }

        private Guid _userId;
        private bool _isEmployee;
        //private string _displayName;
        //private EmployeeInfo _correlativeEmployee;

        public virtual Guid UserId
        {
            get { return this._userId; }
            set { this._userId = value; }
        }

        //public virtual string DisplayName
        //{
        //    get{ return this._displayName; }
        //    set{ this._displayName = value; }
        //}

        public virtual bool IsEmployee
        {
            get { return this._isEmployee; }
            set { this._isEmployee = value; }
        }

        

        #region  Private Variables
        private System.String loginName;
        private System.Guid employeeId;
        //private System.Guid? ownerId;
        private System.String name;

        private System.String employeeNumber;
        private System.String queryNumber;
        private System.DateTime? birthDate;
        private System.String maritalStatus;
        private System.String gender;
        private System.DateTime? hireDate;
        private System.String title;
        private System.String nation;
        private System.String nationality;
        private System.String iDNumber;
        private System.String healthStatus;
        private System.String educationalLevel;
        private System.String political;
        private System.String school;
        private System.String email;
        private System.String email2;
        private System.String telephone;
        private System.String telephone2;
        private System.String iMId;
        private System.String iMId2;
        private System.String nativePlace;
        private System.Guid addressId;
        private System.Guid provinceId;
        private System.String province;
        private System.Guid cityId;
        private System.String city;
        private System.String addressLine;
        private System.String postalCode;
        private System.Guid departmentId;
        private System.String department;
        private System.Boolean isDeleted;
        private System.Boolean isActive;
        private System.DateTime createdTime;
        private System.Guid createdBy;
        private System.DateTime modifiedTime;
        private System.Guid lastModifiedBy;
        private System.Int32? version;
        private System.String description;
        private System.Boolean isPrimary;
        private System.String address;
        #endregion

        #region Properties
        /// <summary>
        /// 
        /// </summary>
        public System.String LoginName
        {
            get { return loginName; }
            set { loginName = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.Guid EmployeeId
        {
            get { return employeeId; }
            set { employeeId = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        //public System.Guid? OwnerId
        //{
        //    get { return ownerId; }
        //    set { ownerId = value; }
        //}


        /// <summary>
        /// 
        /// </summary>
        public System.String Name
        {
            get { return name; }
            set { name = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String EmployeeNumber
        {
            get { return employeeNumber; }
            set { employeeNumber = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String QueryNumber
        {
            get { return queryNumber; }
            set { queryNumber = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.DateTime? BirthDate
        {
            get { return birthDate; }
            set { birthDate = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String MaritalStatus
        {
            get { return maritalStatus; }
            set { maritalStatus = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String Gender
        {
            get { return gender; }
            set { gender = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.DateTime? HireDate
        {
            get { return hireDate; }
            set { hireDate = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String Title
        {
            get { return title; }
            set { title = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String Nation
        {
            get { return nation; }
            set { nation = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String Nationality
        {
            get { return nationality; }
            set { nationality = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String IDNumber
        {
            get { return iDNumber; }
            set { iDNumber = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String HealthStatus
        {
            get { return healthStatus; }
            set { healthStatus = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String EducationalLevel
        {
            get { return educationalLevel; }
            set { educationalLevel = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String Political
        {
            get { return political; }
            set { political = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String School
        {
            get { return school; }
            set { school = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String Email1
        {
            get { return email; }
            set { email = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String Email2
        {
            get { return email2; }
            set { email2 = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String Telephone
        {
            get { return telephone; }
            set { telephone = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String Telephone2
        {
            get { return telephone2; }
            set { telephone2 = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String IMId
        {
            get { return iMId; }
            set { iMId = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String IMId2
        {
            get { return iMId2; }
            set { iMId2 = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String NativePlace
        {
            get { return nativePlace; }
            set { nativePlace = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.Guid AddressId
        {
            get { return addressId; }
            set { addressId = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.Guid ProvinceId
        {
            get { return provinceId; }
            set { provinceId = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String Province
        {
            get { return province; }
            set { province = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.Guid CityId
        {
            get { return cityId; }
            set { cityId = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String City
        {
            get { return city; }
            set { city = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String AddressLine
        {
            get { return addressLine; }
            set { addressLine = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String PostalCode
        {
            get { return postalCode; }
            set { postalCode = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.Guid DepartmentId
        {
            get { return departmentId; }
            set { departmentId = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String Department
        {
            get { return department; }
            set { department = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.Boolean IsDeleted
        {
            get { return isDeleted; }
            set { isDeleted = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.Boolean IsActive
        {
            get { return isActive; }
            set { isActive = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.DateTime CreatedTime
        {
            get { return createdTime; }
            set { createdTime = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.Guid CreatedBy
        {
            get { return createdBy; }
            set { createdBy = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.DateTime ModifiedTime
        {
            get { return modifiedTime; }
            set { modifiedTime = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.Guid LastModifiedBy
        {
            get { return lastModifiedBy; }
            set { lastModifiedBy = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.Int32? Version
        {
            get { return version; }
            set { version = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String Description
        {
            get { return description; }
            set { description = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.Boolean IsPrimary
        {
            get { return isPrimary; }
            set { isPrimary = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String Address
        {
            get { return address; }
            set { address = value; }
        }
        #endregion

        #region GenerateFilterExpression
        /// <summary>
        /// 产生组合查询的条件
        /// </summary>
        /// <param name="MembershipUserInfo">当前实体类<see cref="MembershipUserInfo"/>MembershipUserInfo</param>
        /// <returns></returns>
        public static string GenerateFilterExpression(string userName, string employeeName, string departmentName)
        {
            string where = "";
            //where += DataAccessHelper.GetPartWhereCondition("UserName", userName);
            //where += DataAccessHelper.GetPartWhereCondition("EmployeeName", employeeName);
            //where += DataAccessHelper.GetPartWhereCondition("DepartmentName", departmentName);



            //where += DataAccessHelper.GetPartWhereCondition("UserId", UserId);

            //where += DataAccessHelper.GetPartWhereCondition("LastActivityDate", LastActivityDate);
            //where += DataAccessHelper.GetPartWhereCondition("OwnerId", ownerId);
            //where += DataAccessHelper.GetPartWhereCondition("UserEmail", Email);

            //where += DataAccessHelper.GetPartWhereCondition("LastLoginDate", LastLoginDate);

            //where += DataAccessHelper.GetPartWhereCondition("IsLockedOut", IsLockedOut);
            //where += DataAccessHelper.GetPartWhereCondition("LastLockoutDate", LastLockoutDate);
            //where += DataAccessHelper.GetPartWhereCondition("EmployeeId", employeeId);

            //where += DataAccessHelper.GetPartWhereCondition("EmployeeNumber", employeeNumber);
            //where += DataAccessHelper.GetPartWhereCondition("DateOfBirth", dateOfBirth);
            //where += DataAccessHelper.GetPartWhereCondition("Gender", gender);
            //where += DataAccessHelper.GetPartWhereCondition("NationId", nationId);
            //where += DataAccessHelper.GetPartWhereCondition("Nationality", nationality);
            //where += DataAccessHelper.GetPartWhereCondition("IDType", iDType);
            //where += DataAccessHelper.GetPartWhereCondition("IDNumber", iDNumber);
            //where += DataAccessHelper.GetPartWhereCondition("MaritalStatus", maritalStatus);
            //where += DataAccessHelper.GetPartWhereCondition("HealthStatus", healthStatus);
            //where += DataAccessHelper.GetPartWhereCondition("EducationLevel", educationLevel);
            //where += DataAccessHelper.GetPartWhereCondition("PoliticalFace", politicalFace);
            //where += DataAccessHelper.GetPartWhereCondition("School", school);
            //where += DataAccessHelper.GetPartWhereCondition("JoinDate", joinDate);
            //where += DataAccessHelper.GetPartWhereCondition("Title", title);
            //where += DataAccessHelper.GetPartWhereCondition("Email", email);
            //where += DataAccessHelper.GetPartWhereCondition("Email2", email2);
            //where += DataAccessHelper.GetPartWhereCondition("IMType", iMType);
            //where += DataAccessHelper.GetPartWhereCondition("IMID", imid);
            //where += DataAccessHelper.GetPartWhereCondition("WorkPhone", workPhone);
            //where += DataAccessHelper.GetPartWhereCondition("HomePhone", homePhone);
            //where += DataAccessHelper.GetPartWhereCondition("MobilePhone", mobilePhone);
            //where += DataAccessHelper.GetPartWhereCondition("Native", native);
            //where += DataAccessHelper.GetPartWhereCondition("Status", status);
            //where += DataAccessHelper.GetPartWhereCondition("IsDeleted", isDeleted);
            //where += DataAccessHelper.GetPartWhereCondition("IsActive", isActive);
            //where += DataAccessHelper.GetPartWhereCondition("CreatedTime", createdTime);
            //where += DataAccessHelper.GetPartWhereCondition("CreatedBy", createdBy);
            //where += DataAccessHelper.GetPartWhereCondition("ModifiedTime", modifiedTime);
            //where += DataAccessHelper.GetPartWhereCondition("LastModifiedBy", lastModifiedBy);
            ////where += DataAccessHelper.GetPartWhereCondition("Version", version);
            //where += DataAccessHelper.GetPartWhereCondition("Description", description);
            ////where += DataAccessHelper.GetPartWhereCondition("AddressId", addressId);
            //where += DataAccessHelper.GetPartWhereCondition("Address", address);
            //where += DataAccessHelper.GetPartWhereCondition("PostalCode", postalCode);
            //where += DataAccessHelper.GetPartWhereCondition("AddressTypeName", addressTypeName);
            ////where += DataAccessHelper.GetPartWhereCondition("DepartmentId", departmentId);
            //where += DataAccessHelper.GetPartWhereCondition("DepartmentName", departmentName);
            //where += DataAccessHelper.GetPartWhereCondition("EmployeeDepartmentRelation", employeeDepartmentRelation);
            ////where += DataAccessHelper.GetPartWhereCondition("Nation", nation);

            //DataAccessHelper.TrimWhereClause( ref where);
            return where;
        }
        #endregion
    }
}
