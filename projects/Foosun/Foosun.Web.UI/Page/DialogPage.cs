using System;
using System.Collections.Generic;
using System.Text;
using Foosun.Model;

namespace Foosun.Web.UI
{
    public class DialogPage : BasePage
    {
        /// <summary>
        /// �Ի����ڲ���Ȩ��
        /// </summary>
        protected enum EnumDialogAuthority
        {
            /// <summary>
            /// ��ȫ����
            /// </summary>
            Publicity,
            /// <summary>
            /// ֻ�Թ���Ա����
            /// </summary>
            ForAdmin,
            /// <summary>
            /// ֻ�Ը����û�����
            /// </summary>
            ForPerson
        }
        protected EnumDialogAuthority _BrowserAuthor = EnumDialogAuthority.ForAdmin;

        public DialogPage()
        {
            this.Load += new EventHandler(DialogPage_Load);
        }
        /// <summary>
        /// LOAD�¼�����
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void DialogPage_Load(object sender, EventArgs e)
        {
            if (_BrowserAuthor == EnumDialogAuthority.ForPerson)
            {
                CheckUserLogin();
            }
            else if (_BrowserAuthor == EnumDialogAuthority.ForAdmin)
            {
                CheckAdminLogin();
            }
            else if (_BrowserAuthor == (EnumDialogAuthority.ForPerson | EnumDialogAuthority.ForAdmin))
            {
                EnumLoginState state;
                if (!Validate_Session())
                    LoginResultShow(EnumLoginState.Err_TimeOut);
                else
                {
                    string UserNum = Global.Current.UserNum;
                    state = _UserLogin.CheckAdminLogin(UserNum);
                    if (state != EnumLoginState.Succeed)
                    {
                        state = _UserLogin.CheckUserLogin(UserNum, false);
                        if (state != EnumLoginState.Succeed)
                            LoginResultShow(state);
                    }
                    else
                        LoginResultShow(state);
                }
            }
            else
            { }
        }
        /// <summary>
        /// ����Ȩ�ޣ�Ҫ������Ĺ��캯��������,Ĭ��ֵΪ����Ա����
        /// </summary>
        protected EnumDialogAuthority BrowserAuthor
        {
            set { _BrowserAuthor = value; }
        }
    }
}
