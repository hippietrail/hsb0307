using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Husb.Security;
using System.Web.Security;

namespace WinClientDemo
{
    public partial class LoginForm : Form
    {
        public LoginForm()
        {
            InitializeComponent();
        }

        private void btnOK_Click(object sender, EventArgs e)
        {
            if (txtUser.Text.Trim().Length == 0)
            {
                MessageBox.Show("请您输入用户账号！");
                return;
            }
            if (txtPwd.Text.Trim().Length == 0)
            {
                MessageBox.Show("请您输入用户密码！");
                return;
            }

            GenericMembershipProvider membershipProvider = Membership.Provider as GenericMembershipProvider;
            bool authenticated = false;
            
            string username = txtUser.Text.Trim();

            authenticated = membershipProvider.ValidateUser(username, txtPwd.Text.Trim());

            //UserSettings userInfo = new UserSettings();
            //userInfo.Name = txtUser.Text.Trim();
            //userInfo.Password = txtPwd.Text.Trim();
            //ownerId = dept.Id;

            //UserManager.SaveUserSettings(userInfo);

            // 如果验证通过
            if (authenticated)
            {
                MembershipUserEx user = membershipProvider.GetUser(username, true) as MembershipUserEx;

                ClientContext.CreatePrincipal(username, ownerId);
                ClientContext.UserId = user.UserId;
            }
            else
            {
                MessageBox.Show("您输入用户账号或密码不正确！您还有 " + (2 - count).ToString() + " 次输入密码的机会。");
                count++;
                if (count == 3) this.DialogResult = DialogResult.Cancel;
                txtPwd.Text = "";
                return;
            }

            this.DialogResult = DialogResult.OK;
        }
    }
}
