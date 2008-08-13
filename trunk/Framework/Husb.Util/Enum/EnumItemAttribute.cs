using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Husb.Util.Enum
{
    [AttributeUsage(AttributeTargets.Field, AllowMultiple = false, Inherited = true)]
    public class EnumItemAttribute : System.Attribute
    {
        public EnumItemAttribute()
        //    : this("", -1)
        {
        }

        public EnumItemAttribute(string displayName, int permanentValue)
            : this(displayName)
        {
            //_displayName = displayName;
            _permanentValue = permanentValue;
        }

        public EnumItemAttribute(string displayName)
        {
            _displayName = displayName;
        }

        private string _displayName;
        private int _permanentValue = -1;
        private string _discription;

        public string DisplayName
        {
            get { return _displayName; }
            set { _displayName = value; }
        }
        public int PermanentValue
        {
            get { return _permanentValue; }
            set { _permanentValue = value; }
        }

        public string Discription
        {
            get { return _discription; }
            set { _discription = value; }
        }
    }
}
