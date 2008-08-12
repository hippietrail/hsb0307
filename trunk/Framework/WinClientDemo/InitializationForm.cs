using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

using DepartmentTable = WinClientDemo.Data.Departments.DepartmentDataTable;
using DepartmentRow = WinClientDemo.Data.Departments.DepartmentRow;
using WinClientDemo.Data;
using Husb.Security;
using System.Web.Security;
using WinClientDemo.BusinessActions;
using Microsoft.Practices.EnterpriseLibrary.Security;
using Microsoft.Practices.EnterpriseLibrary.Common.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Security.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Security.Database;

namespace WinClientDemo
{
    public partial class InitializationForm : Form
    {
        public InitializationForm()
        {
            InitializeComponent();
        }

        private void SetCurrentPanel(string panelName)
        {
            if (panelName == "Department")
            {
                pnlDepartment.Visible = true;
                pnlRole.Visible = !pnlDepartment.Visible;
                pnlUser.Visible = !pnlDepartment.Visible;
                return;
            }
            if (panelName == "Role")
            {
                pnlRole.Visible = true;
                pnlDepartment.Visible = !pnlRole.Visible;
                pnlUser.Visible = !pnlRole.Visible;
                return;
            }

            if (panelName == "User")
            {
                pnlUser.Visible = true;
                pnlDepartment.Visible = !pnlUser.Visible;
                pnlRole.Visible = !pnlUser.Visible;
            }
        }

        private void btnGotoRole_Click(object sender, EventArgs e)
        {
            SetCurrentPanel("Role");
        }

        private void btnGoToUser_Click(object sender, EventArgs e)
        {
            SetCurrentPanel("User");
        }

        private void btnGotoDepartment_Click(object sender, EventArgs e)
        {
            SetCurrentPanel("Department");
        }

        private void btnFinish_Click(object sender, EventArgs e)
        {
            Departments dsDepartment = new Departments();
            //DepartmentTable departments = new DepartmentTable();
            DepartmentRow department = dsDepartment.Department.NewDepartmentRow();

            Guid departmentId = Guid.NewGuid();
            Guid userId = Guid.NewGuid();

            DepartmentTable dept = Department.GetTopDepartment();
            if (dept == null || dept.Rows.Count == 0)
            {
                department.Id = departmentId;

                department.IsActive = true;
                //department.IsAdvertising = false;
                department.IsDeleted = false;
                department.CreatedBy = userId;
                department.CreatedTime = DateTime.Now;
                department.Description = null;
                department.LastModifiedBy = userId;
                department.ModifiedTime = DateTime.Now;
                department.Version = 1;

                department.Name = nameTextBox.Text;
                if (comboBox1.SelectedIndex != 0)
                {
                    department.Category = comboBox1.SelectedIndex + 1;
                }
                //department.Category = //comboBox1.SelectedIndex == 0 ? null : (comboBox1.SelectedIndex + 1).ToString();
                department.DepartmentNumber = departmentNumberTextBox.Text;
                department.QueryNumber = queryNumberTextBox.Text;
                //department.IsAdvertising = isAdvertisingCheckBox.Checked;

                dsDepartment.Department.Rows.Add(department);

                Department.Update(dsDepartment);
            }
            else
            {
                departmentId = ((DepartmentRow)dept.Rows[0]).Id;
            }

            GenericMembershipProvider membershipProvider = Membership.Provider as GenericMembershipProvider;
            GenericRoleProvider roleProvider = Roles.Provider as GenericRoleProvider;

            string role = txtRoleName.Text;

            // 添加系统管理员角色
            if (!roleProvider.RoleExists(role))
            {
                roleProvider.CreateRole(role);
            }
            else
            {
                roleProvider.DeleteRole(role, false);
                roleProvider.CreateRole(role);
            }
            string user = txtUser.Text;
            // 创建管理员用户
            if (Membership.GetUser(user, false) != null || Membership.GetUser(user, true) != null)
            {
                membershipProvider.DeleteUser(user, true);
            }
            MembershipCreateStatus status;
            MembershipUserEx u = membershipProvider.CreateUser(user,
                null, // empid
                txtPassword.Text,
                txtEmail.Text,
                "PasswordQuestion",
                "PasswordAnswer",
                true, // IsApprove
                userId,//Guid.NewGuid(), //UserId
                out status);
            //Roles.AddUserToRole(UserEditLayout1.UserName, 

            //将管理员添加到管理员角色
            roleProvider.AddUsersToRoles(new string[] { user }, new string[] { role });

            // 添加操作权限：是系统管理员

            IConfigurationSource configurationSource = ConfigurationSourceFactory.Create();
            SecurityConfigurationView view = new SecurityConfigurationView(configurationSource);
            DbAuthorizationRuleProviderData ruleProviderData = view.GetAuthorizationProviderData(view.GetDefaultAuthorizationProviderName()) as DbAuthorizationRuleProviderData;

            string database = null;
            if (ruleProviderData != null)
            {
                database = ruleProviderData.Database;
            }

            AuthorizationProviderDatabaseProvider ruleProvider = new AuthorizationProviderDatabaseProvider(database);
            ruleProvider.InsertRule(Guid.NewGuid(), SystemOperation.IsSystemAdministrator, SystemOperation.IsSystemAdministrator, 0, "R:" + role);

            // 添加系统默认配置名
            //ConfigurationInfo c = new ConfigurationInfo();
            //c.PopulateCommonProperties(u.UserId, true);
            //c.Type = (Int32)ConfigurationType.Defalt;
            //c.Name = "系统缺省配置";
            //c.Owner = null;

            //AdvertisingConfiguration.Create(c);

            this.DialogResult = DialogResult.OK;
            this.Close();
        }

        private void InitializationForm_Load(object sender, EventArgs e)
        {
            pnlDepartment.Dock = DockStyle.Fill;
            pnlRole.Dock = DockStyle.Fill;
            pnlUser.Dock = DockStyle.Fill;

            SetCurrentPanel("Department");
        }
    }
}
