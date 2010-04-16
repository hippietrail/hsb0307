using System;
using System.Collections.Generic;
using System.Text;

namespace Foosun.Config.API
{
    /// <summary>
    /// ����������Ϣ��
    /// </summary>
    [Serializable]
    public class APIConfig : IConfigInfo
    {
        public APIConfig()
        {
        }
        ApplicaitonCollection applicationList;
        /// <summary>
        /// Ӧ���б�
        /// </summary>
        public ApplicaitonCollection ApplicationList
        {
            get { return applicationList; }
            set { applicationList = value; }
        }

        bool enable;
        /// <summary>
        /// �Ƿ���������
        /// </summary>
        public bool Enable
        {
            get { return enable; }
            set { enable = value; }
        }

        string appKey;
        /// <summary>
        /// ������Կ
        /// </summary>
        public string AppKey
        {
            get { return appKey; }
            set { appKey = value; }
        }
        string appID;
        /// <summary>
        /// ��ǰӦ�õı�ʶID
        /// </summary>
        public string AppID
        {
            get { return appID; }
            set { appID = value; }
        }
 
    }
}
