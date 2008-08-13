using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Microsoft.Practices.EnterpriseLibrary.Security.Configuration
{
    public class AuthorizationRuleDbData : AuthorizationRuleData
    {
        public AuthorizationRuleDbData()
        {
        }
        public AuthorizationRuleDbData(string name, string expression) : base(name, expression)
        {
        }

        public AuthorizationRuleDbData(string name, string expression, Guid id, string displayName, int category)
            : base(name, expression)
        {
            this.Id = id;
            this.DisplayName = displayName;
            this.Category = category;
        }

        public Guid Id { get; set; }
        public string DisplayName { get; set; }
        public int Category { get; set; }
    }
}
