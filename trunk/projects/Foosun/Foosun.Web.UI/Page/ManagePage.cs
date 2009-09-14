using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Text;
using Foosun.Config;
using Foosun.CMS;
using Foosun.Model;

namespace Foosun.Web.UI
{
    public class ManagePage : BasePage
    {
       /// <summary>
       ///˽�б���-�û��ı��
       /// </summary>
        private string _UserNum;
        /// <summary>
        ///˽�б���-�û�������
        /// </summary>
        private string _UserName;
        /// <summary>
        /// ����Ա�Ƿ��½
        /// </summary>
        private string _adminLogined;
        /// <summary>
        /// ˽�б���-Ȩ�޴���,�������б����ʼ����
        /// </summary>
        private string _Authority_Code = string.Empty;
        /// <summary>
        /// ˽�б���-��ǰ��Ƶ�����
        /// </summary>
        private string _SiteID = string.Empty;
        /// <summary>
        /// ˽�б���-��ǰ����Ŀ���
        /// </summary>
        private string _ClassID = string.Empty;
        /// <summary>
        /// ˽�б���-��ǰ��ר����
        /// </summary>
        private string _SpecailID = string.Empty;
        /// <summary>
        /// ���Ȩ��
        /// </summary>
        protected void CheckAdminAuthority()
        {
            EnumLoginState state = EnumLoginState.Err_AdminTimeOut;
            if (Validate_Session())
            {
                state = _UserLogin.CheckAdminAuthority(_Authority_Code, _ClassID, _SpecailID, _SiteID, _adminLogined);
            }
            if (state != EnumLoginState.Succeed)
            {
                LoginResultShow(state);
            }
            else
            {
                _UserNum = Foosun.Global.Current.UserNum;
                _SiteID = Foosun.Global.Current.SiteID.Trim();
                _UserName = Foosun.Global.Current.UserName;
                _adminLogined = Foosun.Global.Current.adminLogined;
            }
        }
        /// <summary>
        /// ���Ȩ��
        /// </summary>
        /// <returns>EnumLoginState</returns>
        protected bool CheckAuthority()
        {
            EnumLoginState state = EnumLoginState.Err_AdminTimeOut;
            if (Validate_Session())
            {
                state = _UserLogin.CheckAdminAuthority(_Authority_Code, _ClassID, _SpecailID, _SiteID, _adminLogined);
            }
            if (state == EnumLoginState.Succeed)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// LOAD�¼�����
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ManagePage_Load(object sender, EventArgs e)
        {
            CheckAdminAuthority();
        }
        /// <summary>
        /// ���캯��
        /// </summary>
        public ManagePage()
        {
            this.Load += new EventHandler(ManagePage_Load);
        }

        /// <summary>
        /// ���캯��
        /// </summary>
        /// <param name="popCode">Ȩ�޴���</param>
        /// <param name="ClassID">��Ŀ���</param>
        /// <param name="specialID">ר����</param>
        public ManagePage(string popCode,string ClassID,string specialID)
        {
            _Authority_Code = popCode;
            _ClassID = ClassID;
            _SpecailID = specialID;
            _SiteID = "";
            this.Load += new EventHandler(ManagePage_Load);
        }
        /// <summary>
        /// ���캯��
        /// </summary>
        /// <param name="popCode">Ȩ�޴���</param>
        public ManagePage(string popCode)
        {
            _adminLogined = popCode;
            _ClassID = "";
            _SpecailID = "";
            _SiteID = "";
            this.Load += new EventHandler(ManagePage_Load);
        }
        /// <summary>
        /// �˳�����
        /// </summary>
        protected override void Logout()
        {
            base.Logout();
            string _dirDumm = Foosun.Config.UIConfig.dirDumm;
            string TmpPath = Foosun.Config.UIConfig.dirUser + "/";
            if ((_dirDumm).Trim() != "") { _dirDumm = "/" + _dirDumm; }
            TmpPath = Foosun.Config.UIConfig.dirMana + "/";
            ExecuteJs("top.location.href=\"" + _dirDumm + "/" + TmpPath + "login.aspx\";");
            Context.Response.End();
        }
        /// <summary>
        /// ��ȡ�û����
        /// </summary>
        protected string UserNum
        {
            get { return _UserNum; }
        }
        /// <summary>
        /// ��ȡ�û���
        /// </summary>
        protected string UserName
        {
            get { return _UserName; }
        }
        /// <summary>
        /// ��ȡ��ǰ��Ƶ�����
        /// </summary>
        protected string SiteID
        {
            get { return _SiteID; }
        }
        /// <summary>
        /// ��ȡ��������Ŀ���
        /// </summary>
        protected string ClassID
        {
            get { return _ClassID; }
            set { _ClassID = value; }
        }
        /// <summary>
        /// ��û�����ר����
        /// </summary>
        protected string SpecailID
        {
            get { return _SpecailID; }
            set { _SpecailID = value; }
        }
        /// <summary>
        /// ����Ȩ�ޱ�ţ�Ҫ������Ĺ��캯��������
        /// </summary>
        protected string Authority_Code
        {
            set { _Authority_Code = value; }
        }
    }
}
