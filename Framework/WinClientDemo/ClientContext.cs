using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Principal;
using Microsoft.Practices.EnterpriseLibrary.Security;
using Husb.Security;
using System.Web.Security;

namespace WinClientDemo
{
    public static class ClientContext
    {
        private static Guid userId;
        private static IIdentity identity;
        private static IPrincipal principal;
        private static ISecurityCacheProvider securityCache;
        private static IToken token;

        public static Guid UserId
        {
            get { return userId; }
            set { userId = value; }
        }

        public static IPrincipal User
        {
            get { return principal; }
            set { principal = value; }
        }

        /// <summary>
        /// 根据用户名创建并缓存Principal对象
        /// </summary>
        /// <param name="username"></param>
        /// <param name="ownerId"></param>
        public static void CreatePrincipal(string username)
        {
            // 先得到Identity
            identity = new GenericIdentity(username, Membership.Provider.Name);

            // 获取当前用户的角色列表，也就是当前用户属于哪些角色
            GenericRoleProvider roleProvider = Roles.Provider as GenericRoleProvider;
            //List<RoleInfo> roleList = roleProvider.GetRoleListForUser(username);

            //String[] roles = new String[roleList.Count];
            //for (int i = 0; i < roleList.Count; i++)
            //{
            //    roles[i] = roleList[i].RoleName;
            //}
            String[] roles = roleProvider.GetRolesForUser(username);

            // 根据前面得到的Identity 和 角色列表 创建Principal
            principal = new GenericPrincipal(identity, roles);

            // 将Principal缓存起来。其含义是将Principal放到一个容器中，以便随时从容器中获取
            securityCache = SecurityCacheFactory.GetSecurityCacheProvider();
            token = securityCache.SavePrincipal(principal);
        }

        /// <summary>
        /// 验证当前用户是否有权限执行本操作
        /// </summary>
        /// <param name="rule">操作名称</param>
        /// <returns></returns>
        public static bool Authorize(string rule)
        {
            IAuthorizationProvider ruleProvider = AuthorizationFactory.GetAuthorizationProvider();
            return ruleProvider.Authorize(securityCache.GetPrincipal(token), rule);
        }
    }
}
