using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.ObjectBuilder2;
using Microsoft.Practices.EnterpriseLibrary.Common.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Common.Configuration.ObjectBuilder;
using System.Configuration;

namespace Microsoft.Practices.EnterpriseLibrary.Security.Configuration
{
    [Assembler(typeof(DbAuthorizationProviderAssembler))]
    public class DbAuthorizationRuleProviderData : AuthorizationProviderData
    {
        private string database;
        public DbAuthorizationRuleProviderData()
        {
        }
        public DbAuthorizationRuleProviderData(string name)
            : this(name, string.Empty)
        {
        }
        public DbAuthorizationRuleProviderData(string name, string database)
        {
            this.database = database;
        }

        [ConfigurationProperty("database")]
        public string Database
        {
            get { return this.database; }
            set { this.database = value; }
        }

        public class DbAuthorizationProviderAssembler : IAssembler<IAuthorizationProvider, AuthorizationProviderData>
        {
            /// <summary>
            /// This method supports the Enterprise Library infrastructure and is not intended to be used directly from your code.
            /// Builds an <see cref="AzManAuthorizationProvider"/> based on an instance of <see cref="AzManAuthorizationProviderData"/>.
            /// </summary>
            /// <seealso cref="AuthorizationProviderCustomFactory"/>
            /// <param name="context">The <see cref="IBuilderContext"/> that represents the current building process.</param>
            /// <param name="objectConfiguration">The configuration object that describes the object to build. Must be an instance of <see cref="AzManAuthorizationProviderData"/>.</param>
            /// <param name="configurationSource">The source for configuration objects.</param>
            /// <param name="reflectionCache">The cache to use retrieving reflection information.</param>
            /// <returns>A fully initialized instance of <see cref="AzManAuthorizationProvider"/>.</returns>
            public IAuthorizationProvider Assemble(IBuilderContext context, AuthorizationProviderData objectConfiguration, IConfigurationSource configurationSource, ConfigurationReflectionCache reflectionCache)
            {
                DbAuthorizationRuleProviderData castedObjectConfiguration = objectConfiguration as DbAuthorizationRuleProviderData;

                IAuthorizationProvider createdObject = new AuthorizationRuleDbProvider(castedObjectConfiguration.Database);

                return createdObject;
            }
        }
    }
}
