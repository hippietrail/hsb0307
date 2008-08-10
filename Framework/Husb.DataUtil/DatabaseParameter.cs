using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Husb.DataUtil
{
    [Serializable]
    public class DatabaseParameter
    {
        private string _parameterName;
        private DbType _parameterType;
        private object _parameterValue;
        //private string _parameterTypeName;
        public DatabaseParameter()
        { }

        public DatabaseParameter(string name, DbType type, object value)
        {
            _parameterName = name;
            _parameterType = type;
            _parameterValue = value;
        }

        public DatabaseParameter(string name, string type, object value)
        {
            _parameterName = name;
            _parameterType = DataAccessUtil.GetDbType(type);
            _parameterValue = value;
        }

        public string Name
        {
            get { return _parameterName; }
            set { _parameterName = value; }
        }

        public DbType Type
        {
            get { return _parameterType; }
            set { _parameterType = value; }
        }

        public object Value
        {
            get { return _parameterValue; }
            set { _parameterValue = value; }
        }
    }
}
