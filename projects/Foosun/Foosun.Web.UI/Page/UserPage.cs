using System;
using System.Web;
using System.Web.UI;
using System.Collections.Generic;
using System.Text;

namespace Foosun.Web.UI
{
    public class UserPage : BasePage
    {
        private bool _UserCertificate = true;
        protected override void Logout()
        {
            base.Logout();
            string _dirDumm = Foosun.Config.UIConfig.dirDumm;
            string TmpPath = Foosun.Config.UIConfig.dirUser + "/";
            if ((_dirDumm).Trim() != "") { _dirDumm = "/" + _dirDumm; }
            ExecuteJs("top.location.href=\"" + _dirDumm + "/" + TmpPath + "login.aspx\";");
            Context.Response.End();
        }
        public UserPage()
        {
            this.Load += new EventHandler(UserPage_Load);
        }
        /// <summary>
        /// LOAD�¼�����
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void UserPage_Load(object sender, EventArgs e)
        {
            if (_UserCertificate)
                CheckUserLoginCert();
            else
                CheckUserLogin();
        }
        /// <summary>
        /// �����Ƿ���Ҫ��֤��Ҫ������Ĺ��캯��������
        /// </summary>
        protected bool UserCertificate
        {
            set { _UserCertificate = value; }
        }
    }
}
