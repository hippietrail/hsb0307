using System;
using System.Collections.Generic;
using System.Text;

namespace Foosun.Config.API
{

    /// <summary>
    /// ����Ӧ����Ϣ��
    /// </summary>
    [Serializable]
    public class ApplicationInfo
    {
        public ApplicationInfo()
        {
        }
        string appID = string.Empty;

        /// <summary>
        /// Ӧ�ñ�ʶ����ͬ��Ӧ�ñ�ʶIDӦ�����ظ�
        /// </summary>
        public string AppID
        {
            get { return appID; }
            set { appID = value; }
        }
         
 
        string appUrl = string.Empty;
        /// <summary>
        /// Ӧ�õĽӿ�URL
        /// </summary>
        public string AppUrl
        {
            get { return appUrl; }
            set { appUrl = value; }
        }

    }
}
