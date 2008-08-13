using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Husb.Util.Enum
{
    public class EnumerableDataFactory
    {
        public IEnumerableData Create()
        {
            return new XmlEnumerableData();
        }

        public IEnumerableData Create(CategoryDateSourceType categoryDateSourceType)
        {
            IEnumerableData data;
            switch (categoryDateSourceType)
            {
                case CategoryDateSourceType.Xml:
                    data = new XmlEnumerableData();
                    break;
                case CategoryDateSourceType.Res:
                    data = new ResEnumerableData();
                    break;
                case CategoryDateSourceType.DB:
                    data = new DbEnumerableData();
                    break;
                default:
                    data = new EnumerableData();
                    break;
            }
            return data;
        }
    }

    /// <summary>
    /// 提供各种类型数据的数据源
    /// </summary>
    public enum CategoryDateSourceType
    {
        Xml,
        Res,
        DB,
        Enum
    }
}
