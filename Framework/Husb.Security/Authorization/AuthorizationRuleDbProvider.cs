using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Security.Database;
using Microsoft.Practices.EnterpriseLibrary.Common.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Security.Configuration;

namespace Microsoft.Practices.EnterpriseLibrary.Security
{
    [ConfigurationElementType(typeof(CustomAuthorizationProviderData))]//
    public class AuthorizationRuleDbProvider : AuthorizationProvider
    {
        #region const
        private const string databaseInstanceNameProperty = "database";//databaseInstanceName
        #endregion

        private string database;
        private AuthorizationProviderDatabaseProvider manager = null;

        #region Constructors
        /// <summary>
        /// 
        /// </summary>
        public AuthorizationRuleDbProvider()
        {
            // No constructor logic needed
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="database"></param>
        public AuthorizationRuleDbProvider(string database)
        {
            this.database = database;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="config"></param>
        public AuthorizationRuleDbProvider(System.Collections.Specialized.NameValueCollection config)
            : this(config["database"])
        {

        }
        #endregion

        public override bool Authorize(System.Security.Principal.IPrincipal principal, string context)
        {
            if (principal == null)
            {
                throw new ArgumentNullException("principal");
            }
            if (context == null || context.Length == 0)
            {
                throw new ArgumentNullException("context");
            }

            if (manager == null)
            {
                manager = new AuthorizationProviderDatabaseProvider(database);//DbRulesManager
            }

            //SecurityAuthorizationCheckEvent.Fire(principal.Identity.Name, context);
            InstrumentationProvider.FireAuthorizationCheckPerformed(principal.Identity.Name, context);

            BooleanExpression expression = GetParsedExpression(context, manager);
            if (expression == null)
            {
                //todo : better exception
                throw new ApplicationException(String.Format("当前操作 {0} 的授权规则没有设置！Authorization Rule {0} not found in the database.", context));
            }

            bool result = expression.Evaluate(principal);

            if (result == false)
            {
                //SecurityAuthorizationFailedEvent.Fire(principal.Identity.Name, context);
                InstrumentationProvider.FireAuthorizationCheckFailed(principal.Identity.Name, context);
            }
            return result;
        }

        #region Helper
        /// <summary>
        /// Retrieves a rule from the database and parses it into a boolean expresssion
        /// </summary>
        /// <param name="context">The Rule name</param>
        /// <param name="mgr">The Database Rules Manager that queries the database</param>
        /// <returns>A BooleanExpression object</returns>
        private BooleanExpression GetParsedExpression(string context, AuthorizationProviderDatabaseProvider mgr)
        {
            //AuthorizationRuleData rule = mgr.GetRule(context);
            IAuthorizationRule rule;
            //string[] ruleName = context.Split(new char[] { '#' });
            //if (ruleName.Length > 2 || ruleName.Length < 1) throw new ApplicationException(String.Format("当前操作 {0} 的授权规则没有设置或或者出现了不允许的字符！", context));
            //if (ruleName.Length == 2)
            //{
            //    rule = mgr.GetRule(ruleName[0], new Guid(ruleName[1]));
            //}
            //else
            //{
            //    rule = mgr.GetRule(context);
            //}
            if (string.IsNullOrEmpty(context)) throw new ApplicationException(String.Format("当前操作 {0} 的授权规则没有设置或或者出现了不允许的字符！", context));
            rule = mgr.GetRule(context);
            if (rule == null)
            {
                return null;
            }

            Parser p = new Parser();
            return p.Parse(rule.Expression);

        }
        #endregion
    }
}
