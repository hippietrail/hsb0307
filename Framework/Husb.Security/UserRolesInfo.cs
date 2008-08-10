using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Husb.Security
{
    /// <summary>
    /// 
    /// </summary>
    [Serializable]
    public class UserRolesInfo
    {
        #region Private Variables
        private System.Guid userId;
        private System.String userName;
        private System.Guid roleId;
        private System.String roleName;
        private System.String employeeName;
        //private System.Guid? ownerId;
        #endregion

        #region Constructors
        /// <summary>
        /// default Constructor
        /// <remarks>default Constructor</remarks>
        /// </summary>
        public UserRolesInfo()
        {

        }

        /// <summary>
        /// Create a <see cref="Vw_Aspnet_MembershipusersroleInfo" /> Instance, and populate default value.
        /// <para></para>
        /// <param name="userId"></param>
        /// <param name="userName"></param>
        /// <param name="roleId"></param>
        /// <param name="roleName"></param>
        /// <param name="employeeName"></param>
        /// <param name="ownerId"></param>
        /// <remarks></remarks>
        /// </summary>
        public UserRolesInfo(
            System.Guid userId,
            System.String userName,
            System.Guid roleId,
            System.String roleName,
            System.String employeeName
        )
        {
            this.userId = userId;
            this.userName = userName;
            this.roleId = roleId;
            this.roleName = roleName;
            this.employeeName = employeeName;
        }
        #endregion

        #region Properties
        /// <summary>
        /// 
        /// </summary>
        public System.Guid UserId
        {
            get { return userId; }
            set { userId = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String UserName
        {
            get { return userName; }
            set { userName = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.Guid RoleId
        {
            get { return roleId; }
            set { roleId = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String RoleName
        {
            get { return roleName; }
            set { roleName = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public System.String EmployeeName
        {
            get { return employeeName; }
            set { employeeName = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        //public System.Guid? OwnerId
        //{
        //    get {return ownerId;}
        //    set {ownerId = value;}
        //}
        #endregion
    }
}
