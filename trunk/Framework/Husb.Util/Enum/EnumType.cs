using System;
using System.ComponentModel;

namespace Husb.Util.Enum
{
    public enum LogType
    {
        [Description("出错日志")]
        ErrorLog = 1,
        [Description("登录日志")]
        SignOnLog = 2,
        [Description("登出日志")]
        SignOutLog = 4,// 
        [Description("数据修改日志")]
        ModifyLog = 8,// 当前用户执行了什么样的数据修改
        [Description("操作日志")]
        OperationLog = 16,// 当前用户打开了什么页面，执行了什么操作，不记录具体操作内容。
        [Description("应用程序启动日志")]
        ApplicationStartLog = 32,
        [Description("应用程序终止日志")]
        ApplicationEndLog = 64,
        [Description("跟踪信息日志")]
        TraceInformation = 128
    }

    /// <summary>
    /// 
    /// </summary>
    public enum ExceptionPolicyType
    {
        //[EnumItem("出错日志", 1)]
        [Description("表示层处理策略")]
        UIPolicy = 1,
        //[EnumItem("操作日志", 2)]
        BusinessPolicy = 2,
        //[EnumItem("运行日志", 3)]
        DataAccessPolicy = 4
        //[EnumItem("登录日志", 4)]
        //LogOnLog = 8,
        //[EnumItem("登出日志", 5)]
        //LogOutLog = 16,
        ////[EnumItem("应用程序启动日志", 6)]
        //ApplicationStartLog = 32,
        ////[EnumItem("应用程序终止日志", 7)]
        //ApplicationEndLog = 64,
        ////[EnumItem("跟踪信息日志", 8)]
        //TraceInformation = 128
    }

    public enum Week
    {
        [Description("星期一")]
        Monday = 1,
        [Description("星期二")]
        Tuesday = 2,
        [Description("星期三")]
        Wednesday = 3,
        [Description("星期四")]
        Thursday = 4,
        [Description("星期五")]
        Friday = 5,
        [Description("星期六")]
        Saturday = 6,
        [Description("星期日")]
        Sunday = 7,
        [Description("其他")]
        Other = 8
    }
}