using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;

namespace Husb.Util.Enum
{
    public class XmlEnumerableData : IEnumerableData
    {
        #region IEnumerableData Members

        Dictionary<int, string> IEnumerableData.GetDescriptions(string typeName)
        {
            //throw new Exception("The method or operation is not implemented.");
            XmlDocument doc = new XmlDocument();
            string xmlFileName = AppDomain.CurrentDomain.BaseDirectory + "App_Data\\EnumerableData.xml";
            doc.Load(xmlFileName);

            XmlNode node = doc.SelectSingleNode("/EnumerableData/" + typeName);

            Dictionary<int, string> dic = new Dictionary<int, string>();

            if (node != null)
            {
                foreach (XmlNode element in node.ChildNodes)
                {
                    if (element.Attributes["value"] != null && element.Attributes["description"] != null)
                    {
                        dic.Add(Int32.Parse(element.Attributes["value"].Value), element.Attributes["description"].Value);
                    }
                }
            }
            return dic;
        }

        #endregion

        public Dictionary<int, string> GetDescriptions(string typeName)
        {
            return GetDescriptions(typeName);
        }
    }
}
