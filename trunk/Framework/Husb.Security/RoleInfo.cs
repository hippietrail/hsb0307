using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Husb.Security
{
    /// <summary>
    /// RoleInfo
    /// </summary>
    [Serializable]
    public class RoleInfo
    {
        #region Private Variables
        private System.Guid _id;
        private System.Guid _applicationId;
        private System.String _name;
        private System.String _displayName;
        private System.String _providerName;
        private System.String _description;

        #endregion

        #region Constructors
        /// <summary>
        /// default Constructor
        /// <remarks>default Constructor</remarks>
        /// </summary>
        public RoleInfo()
        {

        }

        public RoleInfo(
            System.String providerName,
            System.String name
        )
        {
            this._providerName = providerName;
            this._name = name;
        }
        /// <summary>
        /// <para></para>
        /// <param name="id"></param>
        /// <remarks></remarks>
        /// </summary>
        public RoleInfo(System.Guid id)
        {
            _id = id;
        }

        public RoleInfo(
            System.Guid id,
            System.String name
        )
            : this(id)
        {
            this._name = name;
        }

        public RoleInfo(
            System.Guid id,
            System.String name,
            System.String displayName
        )
            : this(id, name)
        {
            this._displayName = displayName;
        }
        #endregion

        #region Properties
        /// <summary>
        /// RoleId
        /// </summary>		
        public System.Guid ApplicationId
        {
            get { return _applicationId; }
            set { _applicationId = value; }
        }
        /// <summary>
        /// RoleId
        /// </summary>		
        public System.Guid RoleId
        {
            get { return _id; }
            set { _id = value; }
        }
        /// <summary>
        /// RoleName
        /// </summary>		
        public System.String RoleName
        {
            get { return _name; }
            set { _name = value; }
        }
        /// <summary>
        /// DisplayName
        /// </summary>		
        public System.String DisplayName
        {
            get { return _displayName; }
            set { _displayName = value; }
        }
        /// <summary>
        /// Description
        /// </summary>		
        public System.String Description
        {
            get { return _description; }
            set { _description = value; }
        }

        /// <summary>
        /// ProviderName
        /// </summary>		
        public virtual string ProviderName
        {
            get
            {
                return this._providerName;
            }
        }

        #endregion

        #region GenerateFilterExpression

        #endregion

        #region Validate

        #endregion
    }
}
