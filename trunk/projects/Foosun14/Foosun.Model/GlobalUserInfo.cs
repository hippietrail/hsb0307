using System;
using System.Collections.Generic;
using System.Text;

namespace Hg.Model
{
    [Serializable]
    public class GlobalUserInfo
    {
        private string _usernum;
        private string _username;
        private string _siteid;
        private string _adminLogined;
        private bool _UnCert;
        private string _SiteEName;
        private string _SiteCName;

        public GlobalUserInfo(string usernum, string username, string siteid, string adminLogined)
        {
            _usernum = usernum;
            _username = username;
            _siteid = siteid;
            _adminLogined = adminLogined;
        }

        public GlobalUserInfo(string usernum, string username, string siteid, string adminLogined,string siteEName,string siteCName)
        {
            _usernum = usernum;
            _username = username;
            _siteid = siteid;
            _adminLogined = adminLogined;
            _SiteEName = siteEName;
            _SiteCName = siteCName;
        }
        public string UserNum
        {
            get
            {
                return _usernum;
            }
            set
            {
                _usernum = value;
            }
        }

        public string adminLogined
        {
            get
            {
                return _adminLogined;
            }
            set
            {
                _adminLogined = value;
            }
        }

        public string UserName
        {
            get
            {
                return _username;
            }
            set
            {
                _username = value;
            }
        }
        public string SiteID
        {
            get
            {
                return _siteid;
            }
            set
            {
                _siteid = value;
            }
        }
        public bool uncert
        {
            get
            {
                return _UnCert;
            }
            set
            {
                _UnCert = value;
            }
        }

        public string SiteEName
        {
            get
            {
                return _SiteEName;
            }
            set
            {
                _SiteEName = value;
            }
        }

        public string SiteCName
        {
            get
            {
                return _SiteCName;
            }
            set
            {
                _SiteCName = value;
            }
        }
    }
}
