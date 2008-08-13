using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Husb.Util.Enum
{
    public class ResEnumerableData : IEnumerableData
    {
        #region IEnumerableData Members

        Dictionary<int, string> IEnumerableData.GetDescriptions(string typeName)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        #endregion

        public Dictionary<int, string> GetDescriptions(string typeName)
        {
            return GetDescriptions(typeName);
        }
    }
}
