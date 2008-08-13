using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace WinClientDemo.Data
{
    public enum DepartmentType
    {
        [Description("单位名称")]
        CompanyName,
        [Description("集团部门")]
        Group,
        [Description("广告公司")]
        AdvertisingCompany,
        [Description("市场部")]
        Marketing,
        [Description("财务部")]
        Finance,
        [Description("审计部")]
        Audit,
        [Description("行政部")]
        Service,
        [Description("后勤部门")]
        Logistic,
        [Description("版面部")]
        Page
    }
}
