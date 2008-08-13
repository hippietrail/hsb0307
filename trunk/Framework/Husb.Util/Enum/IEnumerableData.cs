using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Husb.Util.Enum
{
    public interface IEnumerableData
    {
        Dictionary<int, string> GetDescriptions(string typeName);
    }
}
