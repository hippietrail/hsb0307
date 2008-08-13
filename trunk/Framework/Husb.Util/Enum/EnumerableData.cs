using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.Reflection;

namespace Husb.Util.Enum
{
    public class EnumerableData : IEnumerableData
    {
        #region IEnumerableData Members

        Dictionary<int, string> IEnumerableData.GetDescriptions(string typeName)
        {
            //throw new Exception("The method or operation is not implemented.");
            Type enumType = CommonUtil.GetType(typeName);

            return GetDescriptions(enumType);
        }

        #endregion

        public Dictionary<int, string> GetDescriptions(string typeName)
        {
            return GetDescriptions(typeName);
        }

        public static Dictionary<int, string> GetDescriptions(Type type)
        {
            if (type == null)
            {
                throw new Exception(String.Format("类型 {0} 没有发现，请使用其完整的名称！", type));
            }

            FieldInfo[] fields = type.GetFields();
            Dictionary<int, string> descs = new Dictionary<int, string>();
            for (int i = 1; i < fields.Length; ++i)
            {
                object fieldValue = System.Enum.Parse(type, fields[i].Name);
                object[] attrs = fields[i].GetCustomAttributes(true);

                bool findAttr = false;
                foreach (object attr in attrs)
                {
                    if (typeof(DescriptionAttribute).IsAssignableFrom(attr.GetType()))
                    {
                        descs.Add((int)fieldValue, ((DescriptionAttribute)attr).Description ?? type.ToString()); // .GetDescription(fieldValue));
                        findAttr = true;
                        break;
                    }

                    if (typeof(EnumItemAttribute).IsAssignableFrom(attr.GetType()))
                    {
                        descs.Add((int)fieldValue, ((EnumItemAttribute)attr).DisplayName ?? type.ToString()); // .GetDescription(fieldValue));
                        findAttr = true;
                        break;
                    }
                }
                if (!findAttr)
                {
                    descs.Add((int)fieldValue, fieldValue.ToString());
                }
            }

            return descs;
        }
    }
}
