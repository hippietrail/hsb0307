using System;
using System.Collections.Generic;
using System.Data;
using System.Reflection;
using Hg.Model;


namespace Hg.DALFactory
{
    public interface IInstall
    {
        int InserAdmin(string UserName, string Password);
    }

    public sealed partial class DataAccess
    {
        public static IInstall CreateInstall()
        {
            string className = path + ".Install";
            return (IInstall)Assembly.Load(path).CreateInstance(className);
        }
    }
}
