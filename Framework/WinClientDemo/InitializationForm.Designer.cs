namespace WinClientDemo
{
    partial class InitializationForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.Label nameLabel;
            System.Windows.Forms.Label categoryLabel;
            System.Windows.Forms.Label departmentNumberLabel;
            System.Windows.Forms.Label queryNumberLabel;
            this.pnlDepartment = new System.Windows.Forms.Panel();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.btnCancel = new System.Windows.Forms.Button();
            this.btnGotoRole = new System.Windows.Forms.Button();
            this.nameTextBox = new System.Windows.Forms.TextBox();
            this.departmentNumberTextBox = new System.Windows.Forms.TextBox();
            this.queryNumberTextBox = new System.Windows.Forms.TextBox();
            this.pnlRole = new System.Windows.Forms.Panel();
            this.btnGotoDepartment = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.btnGoToUser = new System.Windows.Forms.Button();
            this.txtRoleDescription = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtRoleName = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.pnlUser = new System.Windows.Forms.Panel();
            this.txtEmail = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.btnFinish = new System.Windows.Forms.Button();
            this.button5 = new System.Windows.Forms.Button();
            this.btnGotoRoleP = new System.Windows.Forms.Button();
            this.txtPassword = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txtUser = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            nameLabel = new System.Windows.Forms.Label();
            categoryLabel = new System.Windows.Forms.Label();
            departmentNumberLabel = new System.Windows.Forms.Label();
            queryNumberLabel = new System.Windows.Forms.Label();
            this.pnlDepartment.SuspendLayout();
            this.pnlRole.SuspendLayout();
            this.pnlUser.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlDepartment
            // 
            this.pnlDepartment.Controls.Add(this.comboBox1);
            this.pnlDepartment.Controls.Add(this.btnCancel);
            this.pnlDepartment.Controls.Add(this.btnGotoRole);
            this.pnlDepartment.Controls.Add(nameLabel);
            this.pnlDepartment.Controls.Add(this.nameTextBox);
            this.pnlDepartment.Controls.Add(categoryLabel);
            this.pnlDepartment.Controls.Add(departmentNumberLabel);
            this.pnlDepartment.Controls.Add(this.departmentNumberTextBox);
            this.pnlDepartment.Controls.Add(queryNumberLabel);
            this.pnlDepartment.Controls.Add(this.queryNumberTextBox);
            this.pnlDepartment.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlDepartment.Location = new System.Drawing.Point(0, 0);
            this.pnlDepartment.Name = "pnlDepartment";
            this.pnlDepartment.Size = new System.Drawing.Size(365, 223);
            this.pnlDepartment.TabIndex = 1;
            // 
            // comboBox1
            // 
            this.comboBox1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(96, 38);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(200, 20);
            this.comboBox1.TabIndex = 80;
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(236, 158);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 79;
            this.btnCancel.Text = "取消";
            this.btnCancel.UseVisualStyleBackColor = true;
            // 
            // btnGotoRole
            // 
            this.btnGotoRole.Location = new System.Drawing.Point(36, 158);
            this.btnGotoRole.Name = "btnGotoRole";
            this.btnGotoRole.Size = new System.Drawing.Size(75, 23);
            this.btnGotoRole.TabIndex = 78;
            this.btnGotoRole.Text = "下一步";
            this.btnGotoRole.UseVisualStyleBackColor = true;
            this.btnGotoRole.Click += new System.EventHandler(this.btnGotoRole_Click);
            // 
            // nameLabel
            // 
            nameLabel.AutoSize = true;
            nameLabel.Location = new System.Drawing.Point(20, 14);
            nameLabel.Name = "nameLabel";
            nameLabel.Size = new System.Drawing.Size(53, 12);
            nameLabel.TabIndex = 69;
            nameLabel.Text = "部门名称";
            // 
            // nameTextBox
            // 
            this.nameTextBox.Location = new System.Drawing.Point(96, 11);
            this.nameTextBox.Name = "nameTextBox";
            this.nameTextBox.Size = new System.Drawing.Size(200, 21);
            this.nameTextBox.TabIndex = 70;
            // 
            // categoryLabel
            // 
            categoryLabel.AutoSize = true;
            categoryLabel.Location = new System.Drawing.Point(20, 40);
            categoryLabel.Name = "categoryLabel";
            categoryLabel.Size = new System.Drawing.Size(53, 12);
            categoryLabel.TabIndex = 71;
            categoryLabel.Text = "部门类别";
            // 
            // departmentNumberLabel
            // 
            departmentNumberLabel.AutoSize = true;
            departmentNumberLabel.Location = new System.Drawing.Point(20, 67);
            departmentNumberLabel.Name = "departmentNumberLabel";
            departmentNumberLabel.Size = new System.Drawing.Size(53, 12);
            departmentNumberLabel.TabIndex = 72;
            departmentNumberLabel.Text = "部门编号";
            // 
            // departmentNumberTextBox
            // 
            this.departmentNumberTextBox.Location = new System.Drawing.Point(96, 64);
            this.departmentNumberTextBox.Name = "departmentNumberTextBox";
            this.departmentNumberTextBox.Size = new System.Drawing.Size(200, 21);
            this.departmentNumberTextBox.TabIndex = 73;
            // 
            // queryNumberLabel
            // 
            queryNumberLabel.AutoSize = true;
            queryNumberLabel.Location = new System.Drawing.Point(20, 94);
            queryNumberLabel.Name = "queryNumberLabel";
            queryNumberLabel.Size = new System.Drawing.Size(53, 12);
            queryNumberLabel.TabIndex = 74;
            queryNumberLabel.Text = "速查代号";
            // 
            // queryNumberTextBox
            // 
            this.queryNumberTextBox.Location = new System.Drawing.Point(96, 91);
            this.queryNumberTextBox.Name = "queryNumberTextBox";
            this.queryNumberTextBox.Size = new System.Drawing.Size(200, 21);
            this.queryNumberTextBox.TabIndex = 75;
            // 
            // pnlRole
            // 
            this.pnlRole.Controls.Add(this.btnGotoDepartment);
            this.pnlRole.Controls.Add(this.button2);
            this.pnlRole.Controls.Add(this.btnGoToUser);
            this.pnlRole.Controls.Add(this.txtRoleDescription);
            this.pnlRole.Controls.Add(this.label2);
            this.pnlRole.Controls.Add(this.txtRoleName);
            this.pnlRole.Controls.Add(this.label1);
            this.pnlRole.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlRole.Location = new System.Drawing.Point(0, 0);
            this.pnlRole.Name = "pnlRole";
            this.pnlRole.Size = new System.Drawing.Size(365, 223);
            this.pnlRole.TabIndex = 82;
            // 
            // btnGotoDepartment
            // 
            this.btnGotoDepartment.Location = new System.Drawing.Point(36, 158);
            this.btnGotoDepartment.Name = "btnGotoDepartment";
            this.btnGotoDepartment.Size = new System.Drawing.Size(75, 23);
            this.btnGotoDepartment.TabIndex = 81;
            this.btnGotoDepartment.Text = "上一步";
            this.btnGotoDepartment.UseVisualStyleBackColor = true;
            this.btnGotoDepartment.Click += new System.EventHandler(this.btnGotoDepartment_Click);
            // 
            // button2
            // 
            this.button2.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.button2.Location = new System.Drawing.Point(236, 158);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 23);
            this.button2.TabIndex = 80;
            this.button2.Text = "取消";
            this.button2.UseVisualStyleBackColor = true;
            // 
            // btnGoToUser
            // 
            this.btnGoToUser.Location = new System.Drawing.Point(136, 158);
            this.btnGoToUser.Name = "btnGoToUser";
            this.btnGoToUser.Size = new System.Drawing.Size(75, 23);
            this.btnGoToUser.TabIndex = 4;
            this.btnGoToUser.Text = "下一步";
            this.btnGoToUser.UseVisualStyleBackColor = true;
            this.btnGoToUser.Click += new System.EventHandler(this.btnGoToUser_Click);
            // 
            // txtRoleDescription
            // 
            this.txtRoleDescription.Location = new System.Drawing.Point(122, 66);
            this.txtRoleDescription.Name = "txtRoleDescription";
            this.txtRoleDescription.Size = new System.Drawing.Size(150, 21);
            this.txtRoleDescription.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(63, 72);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(53, 12);
            this.label2.TabIndex = 2;
            this.label2.Text = "角色说明";
            // 
            // txtRoleName
            // 
            this.txtRoleName.Location = new System.Drawing.Point(122, 37);
            this.txtRoleName.Name = "txtRoleName";
            this.txtRoleName.Size = new System.Drawing.Size(150, 21);
            this.txtRoleName.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(27, 40);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(89, 12);
            this.label1.TabIndex = 0;
            this.label1.Text = "管理员角色名称";
            // 
            // pnlUser
            // 
            this.pnlUser.Controls.Add(this.txtEmail);
            this.pnlUser.Controls.Add(this.label5);
            this.pnlUser.Controls.Add(this.btnFinish);
            this.pnlUser.Controls.Add(this.button5);
            this.pnlUser.Controls.Add(this.btnGotoRoleP);
            this.pnlUser.Controls.Add(this.txtPassword);
            this.pnlUser.Controls.Add(this.label4);
            this.pnlUser.Controls.Add(this.txtUser);
            this.pnlUser.Controls.Add(this.label3);
            this.pnlUser.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlUser.Location = new System.Drawing.Point(0, 0);
            this.pnlUser.Name = "pnlUser";
            this.pnlUser.Size = new System.Drawing.Size(365, 223);
            this.pnlUser.TabIndex = 83;
            // 
            // txtEmail
            // 
            this.txtEmail.Location = new System.Drawing.Point(116, 87);
            this.txtEmail.Name = "txtEmail";
            this.txtEmail.Size = new System.Drawing.Size(135, 21);
            this.txtEmail.TabIndex = 8;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(76, 93);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(29, 12);
            this.label5.TabIndex = 7;
            this.label5.Text = "邮箱";
            // 
            // btnFinish
            // 
            this.btnFinish.Location = new System.Drawing.Point(136, 158);
            this.btnFinish.Name = "btnFinish";
            this.btnFinish.Size = new System.Drawing.Size(75, 23);
            this.btnFinish.TabIndex = 6;
            this.btnFinish.Text = "完成";
            this.btnFinish.UseVisualStyleBackColor = true;
            this.btnFinish.Click += new System.EventHandler(this.btnFinish_Click);
            // 
            // button5
            // 
            this.button5.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.button5.Location = new System.Drawing.Point(236, 158);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(75, 23);
            this.button5.TabIndex = 5;
            this.button5.Text = "取消";
            this.button5.UseVisualStyleBackColor = true;
            // 
            // btnGotoRoleP
            // 
            this.btnGotoRoleP.Location = new System.Drawing.Point(36, 158);
            this.btnGotoRoleP.Name = "btnGotoRoleP";
            this.btnGotoRoleP.Size = new System.Drawing.Size(75, 23);
            this.btnGotoRoleP.TabIndex = 4;
            this.btnGotoRoleP.Text = "上一步";
            this.btnGotoRoleP.UseVisualStyleBackColor = true;
            this.btnGotoRoleP.Click += new System.EventHandler(this.btnGotoRole_Click);
            // 
            // txtPassword
            // 
            this.txtPassword.Location = new System.Drawing.Point(116, 59);
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.Size = new System.Drawing.Size(134, 21);
            this.txtPassword.TabIndex = 3;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(76, 64);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(29, 12);
            this.label4.TabIndex = 2;
            this.label4.Text = "密码";
            // 
            // txtUser
            // 
            this.txtUser.Location = new System.Drawing.Point(116, 30);
            this.txtUser.Name = "txtUser";
            this.txtUser.Size = new System.Drawing.Size(135, 21);
            this.txtUser.TabIndex = 1;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(76, 35);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(41, 12);
            this.label3.TabIndex = 0;
            this.label3.Text = "管理员";
            // 
            // InitializationForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(365, 223);
            this.Controls.Add(this.pnlUser);
            this.Controls.Add(this.pnlRole);
            this.Controls.Add(this.pnlDepartment);
            this.Name = "InitializationForm";
            this.Text = "InitializationForm";
            this.Load += new System.EventHandler(this.InitializationForm_Load);
            this.pnlDepartment.ResumeLayout(false);
            this.pnlDepartment.PerformLayout();
            this.pnlRole.ResumeLayout(false);
            this.pnlRole.PerformLayout();
            this.pnlUser.ResumeLayout(false);
            this.pnlUser.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel pnlDepartment;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Button btnGotoRole;
        private System.Windows.Forms.TextBox nameTextBox;
        private System.Windows.Forms.TextBox departmentNumberTextBox;
        private System.Windows.Forms.TextBox queryNumberTextBox;
        private System.Windows.Forms.Panel pnlRole;
        private System.Windows.Forms.Button btnGotoDepartment;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button btnGoToUser;
        private System.Windows.Forms.TextBox txtRoleDescription;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtRoleName;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel pnlUser;
        private System.Windows.Forms.TextBox txtEmail;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button btnFinish;
        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.Button btnGotoRoleP;
        private System.Windows.Forms.TextBox txtPassword;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtUser;
        private System.Windows.Forms.Label label3;
    }
}