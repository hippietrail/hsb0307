using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Husb.Util.Enum;
using System.Reflection;
using System.ComponentModel;
using System.Collections;

namespace Husb.Util
{
    public class EnumUtil
    {
        /// <summary>
        /// 根据类型名称返回本类型的枚举数据
        /// </summary>
        /// <param name="typeName">类型名称</param>
        /// <returns>字典</returns>
        public static Dictionary<int, string> GetDescriptions(string typeName)
        {
            return (new EnumerableDataFactory()).Create().GetDescriptions(typeName);
        }

        /// <summary>
        /// 根据类型名称返回本类型的枚举数据
        /// </summary>
        /// <param name="typeName">类型名称</param>
        /// <returns>字典</returns>
        public static Dictionary<int, string> GetDescriptions(string typeName, CategoryDateSourceType categoryDateSourceType)
        {
            return (new EnumerableDataFactory()).Create(categoryDateSourceType).GetDescriptions(typeName);
        }

        /// <summary>
        /// 根据枚举类型的枚举项，返回其描述
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static string GetDisplayName(System.Enum value)
        {
            FieldInfo fi = value.GetType().GetField(value.ToString());
            EnumItemAttribute[] attributes = fi.GetCustomAttributes(typeof(EnumItemAttribute), false) as EnumItemAttribute[];
            if (attributes != null && attributes.Length > 0)
            {
                return attributes[0].DisplayName;
            }
            else
            {
                DescriptionAttribute[] descriptions = fi.GetCustomAttributes(typeof(DescriptionAttribute), false) as DescriptionAttribute[];
                if (descriptions != null && descriptions.Length > 0)
                {
                    return descriptions[0].Description;
                }
            }

            return value.ToString();
        }

        /// <summary>
        /// 这是一个常用的方法,根据枚举类型的枚举项名称字符串和相应的数字得到显示名称
        /// </summary>
        /// <param name="enumType"></param>
        /// <param name="permanentValue"></param>
        /// <returns></returns>
        public static string GetDisplayName(string enumType, int permanentValue)
        {
            string s = null;

            Dictionary<int, string> dic = GetDescriptions(enumType, CategoryDateSourceType.Enum);
            Dictionary<int, string>.Enumerator enumerator = dic.GetEnumerator();
            while (enumerator.MoveNext())
            {
                if (enumerator.Current.Key == permanentValue)
                {
                    s = enumerator.Current.Value;
                    break;
                }
            }

            return s;
        }

        /// <summary>
        /// 根据枚举类型的枚举项和相应的数字得到显示名称
        /// </summary>
        /// <param name="enumType"></param>
        /// <param name="permanentValue"></param>
        /// <returns></returns>
        public static string GetDisplayName(Type enumType, int permanentValue)
        {
            string s = "";
            Array array = System.Enum.GetValues(enumType);

            IList list = ToList(enumType, false);
            foreach (KeyValuePair<int, string> pair in list)
            {
                if (pair.Key == permanentValue)
                {
                    s = pair.Value;
                    break;
                }
            }

            return s;
        }

        /// <summary>
        /// 根据枚举类型的枚举项，返回其描述对应数值
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static int GetInt32(System.Enum value)
        {
            FieldInfo fi = value.GetType().GetField(value.ToString());
            EnumItemAttribute[] attributes = fi.GetCustomAttributes(typeof(EnumItemAttribute), false) as EnumItemAttribute[];
            return (attributes.Length > 0) ? attributes[0].PermanentValue : Int32.Parse(value.ToString("D"));//
        }

        /// <summary>
        /// 这是一个常用的方法,根据枚举类型的枚举项的描述信息，得到其数值信息
        /// </summary>
        /// <param name="enumType"></param>
        /// <param name="description"></param>
        /// <returns></returns>
        public static Int32 GetInt32(Type enumType, string description)
        {
            int i = 1;

            Dictionary<int, string> dic = EnumerableData.GetDescriptions(enumType);
            Dictionary<int, string>.Enumerator enumerator = dic.GetEnumerator();
            while (enumerator.MoveNext())
            {
                if (enumerator.Current.Value == description)
                {
                    i = enumerator.Current.Key;
                    break;
                }
            }

            return i;
        }

        /// <summary>
        /// 获取枚举类型的各项的描述
        /// </summary>
        /// <param name="type"></param>
        /// <param name="showSelect"></param>
        /// <returns></returns>
        public static IList ToList(Type type, bool showSelect)
        {
            if (type == null)
            {
                throw new ArgumentNullException("type");
            }

            List<KeyValuePair<int, string>> list = new List<KeyValuePair<int, string>>();
            //ArrayList list = new ArrayList();
            if (showSelect) list.Add(new KeyValuePair<int, string>(-1, "请选择..."));
            Array enumValues = System.Enum.GetValues(type);
            foreach (System.Enum value in enumValues)
            {
                //list.Add(new KeyValuePair<Enum, string>(value, GetDisplayName(value)));
                list.Add(new KeyValuePair<int, string>(Int32.Parse(value.ToString("D")), GetDisplayName(value)));
            }

            return list;
        }

        public static IList ToList(Type type)
        {
            return ToList(type, true);
        }
    }
}
