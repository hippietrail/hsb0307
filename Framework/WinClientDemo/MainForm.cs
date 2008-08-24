using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Husb.WinFormControls;

using DepartmentTable = WinClientDemo.Data.Departments.DepartmentDataTable;
using DepartmentRow = WinClientDemo.Data.Departments.DepartmentRow;
using WinClientDemo.BusinessActions;



namespace WinClientDemo
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();


            InitializeOutlookBar();

            this.WindowState = FormWindowState.Maximized;
        }

        private void InitializeOutlookBar()
        {
            this.outlookBar.Initialize();

            IconPanel iconPanel1 = new IconPanel();
            IconPanel iconPanel2 = new IconPanel();
            IconPanel iconPanel3 = new IconPanel();
            outlookBar.AddBand("Outlook Shortcuts", iconPanel1);
            outlookBar.AddBand("My Shortcuts", iconPanel2);
            outlookBar.AddBand("Other Shortcuts", iconPanel3);

            //iconPanel1.AddIcon("Outlook Today", Image.FromFile("img1.ico"), new EventHandler(PanelEvent));
            //iconPanel1.AddIcon("Calendar", Image.FromFile("img2.ico"), new EventHandler(PanelEvent));
            //iconPanel1.AddIcon("Contacts", Image.FromFile("img3.ico"), new EventHandler(PanelEvent));
            //iconPanel1.AddIcon("Tasks", Image.FromFile("img4.ico"), new EventHandler(PanelEvent));

            iconPanel1.AddIcon("Outlook Today", null, new EventHandler(PanelEvent));
            iconPanel1.AddIcon("Calendar", null, new EventHandler(PanelEvent));
            iconPanel1.AddIcon("Contacts", null, new EventHandler(PanelEvent));
            iconPanel1.AddIcon("Tasks", null, new EventHandler(PanelEvent));

            //outlookBar.SelectBand(0);
        }

        private bool ContainChild(string formName)
        {
            bool open = false;
            foreach (Form frm in this.MdiChildren)
            {
                if (frm.Name == formName)
                {
                    frm.WindowState = FormWindowState.Maximized;
                    frm.Activate();
                    open = true;
                    break;
                }
            }

            return open;
        }

        private void OpenForm(Form frm)
        {
            frm.MdiParent = this;
            frm.WindowState = FormWindowState.Maximized;
            frm.Show();
        }

        private void aaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (!ContainChild("Form1"))
            {
                OpenForm(new LoginForm());
            }
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            this.Visible = false;
            this.Cursor = Cursors.WaitCursor;
            DepartmentTable department = Department.GetTopDepartment();
            if (department == null || department.Rows.Count == 0)
            {
                //Initialization
                Form frm = new InitializationForm();
                frm.ShowDialog();
                if (frm.DialogResult == DialogResult.Cancel)
                {
                    this.Cursor = Cursors.Default;
                    Application.Exit();
                    return;
                }
            }
            // Configure MainForm UI
            ResizeRedraw = true;

            // get the user's credentials
            
            Login();

            if (ClientContext.User != null && ClientContext.User.Identity.Name.Length > 0)
            {
                this.Visible = true;
                this.Show();
                this.Refresh();
                //tlbMain.Buttons[2].Pushed = UserSettings.Instance.WorkOffline;

                // Load icon resources that are displayed in the statusbar
                //LoadStatusIcons();

                // Setup the Command pattern
                //InitializeCommands();

                // Finally, initialize the Subject
                //ConfigureSubject();
            }
            else
            {
                Application.Exit();
            }

            this.Cursor = Cursors.Default;
        }

        private void Login()
        {
            if (ClientContext.User == null)
            {
                ShowLoginForm();
            }
        }

        private void ShowLoginForm()
        {
            Form login = new LoginForm();
            login.Visible = false;
            login.ShowDialog();
            login.Close();
        }

        public void PanelEvent(object sender, EventArgs e)
        {
            Control ctrl = (Control)sender;
            PanelIcon panelIcon = ctrl.Tag as PanelIcon;
            //MessageBox.Show("#" + panelIcon.Index.ToString(), "Panel Event");

            DepartmentTable dt1 = Department.GetDepartmentTree();
            DepartmentTable dt2 = Department.GetAll();

            

            DemoForm frm = new DemoForm();
            frm.Show();

        }


    }
}
