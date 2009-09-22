using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Foosun.Model;
using System.Xml;
using System.Collections.Generic;

namespace Foosun.Web.manageXXBN.news
{
    public partial class Class_Map : Foosun.Web.UI.ManagePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Foosun.CMS.ContentManage cm = new Foosun.CMS.ContentManage();
                DataTable dt = cm.GetAllColumnMap();

                List<CpsnColumnInfo> cols = GetCpsnColumns(this.Context);
                List<CpsnColumnInfo> columns = new List<CpsnColumnInfo>();

                foreach (CpsnColumnInfo c in cols)
                {
                    if (dt.Select("CpClassId = '" + c.Id + "'" + " AND Media = '" + c.Media + "'").Length == 0)
                    {
                        columns.Add(c);
                    }
                }
                List<CpsnBindingColumnInfo> d = GetColumns(columns);

                lstCpsnColumn.DataTextField = "Name";
                lstCpsnColumn.DataValueField = "Id";
                lstCpsnColumn.DataSource = d;
                lstCpsnColumn.DataBind();

                BindMap(dt);
            }

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            List<CpsnColumnInfo> c = GetCpsnColumns(this.Context);
            List<CpsnBindingColumnInfo> d = GetColumns(c);

            lstCpsnColumn.DataTextField = "Name";
            lstCpsnColumn.DataValueField = "Id";
            lstCpsnColumn.DataSource = d;
            lstCpsnColumn.DataBind();
        }

        public static List<CpsnColumnInfo> GetCpsnColumns(HttpContext context)
        {
            if (context.Cache["ColumnMap"] != null)
            {
                return context.Cache["ColumnMap"] as List<CpsnColumnInfo>;
            }

            string srcPath = context.Server.MapPath("~/") + Foosun.Config.UIConfig.dirFile + "\\" + Foosun.Config.UIConfig.CpsnDir + "\\";
            string columnFilename = srcPath + Foosun.Config.UIConfig.ColumnFile;// "采编栏目列表1.xml";

            List<CpsnColumnInfo> columns = new List<CpsnColumnInfo>();
            using (XmlTextReader reader = new XmlTextReader(columnFilename))
            {
                int number = 0;
                string media = "";
                while (reader.Read())
                {
                    if (reader.NodeType == XmlNodeType.Element && reader.Name.ToLower() == "media")
                    {
                        reader.MoveToFirstAttribute();
                        media = reader.Value;
                    }

                    if (reader.NodeType == XmlNodeType.Element && reader.Name.ToLower() == "column")
                    {
                        CpsnColumnInfo column = new CpsnColumnInfo();

                        reader.MoveToFirstAttribute();
                        column.Id = reader.Value;
                        reader.MoveToElement();
                        column.Name = reader.ReadElementString();
                        column.Media = media;
                        column.Number = number;
                        number++;

                        columns.Add(column);
                    }
                }
                reader.Close();
            }
            // System.Web.Caching.Cache.NoSlidingExpiration
            context.Cache.Add("ColumnMap", columns, null, DateTime.Now.AddMinutes(10), TimeSpan.Zero, System.Web.Caching.CacheItemPriority.Default, null);

            return columns;
        }

        public static List<CpsnBindingColumnInfo> GetColumns(List<CpsnColumnInfo> cols)
        {
            List<CpsnBindingColumnInfo> columns = new List<CpsnBindingColumnInfo>();
            foreach (CpsnColumnInfo col in cols)
            {
                CpsnBindingColumnInfo column = new CpsnBindingColumnInfo();
                column.Id = col.Id;
                column.Name = "[" + col.Media + "]" + col.Name;
                columns.Add(column);
            }
            return columns;
        }

        protected void btnSave_Click(object sender, ImageClickEventArgs e)
        {
            Add();
        }

        private void Add()
        {
            Foosun.CMS.ContentManage cm = new Foosun.CMS.ContentManage();

            List<CpsnBindingColumnInfo> left = new List<CpsnBindingColumnInfo>();

            List<CpsnBindingColumnInfo> right = new List<CpsnBindingColumnInfo>();

            foreach (ListItem item in lstSiteColumn.Items)
            {
                right.Add(new CpsnBindingColumnInfo(item.Value, item.Text));
            }


            foreach (ListItem item in lstCpsnColumn.Items)
            {
                if (item.Selected)
                {
                    right.Add(new CpsnBindingColumnInfo(item.Value, item.Text));

                    cm.InsertColumnMap(CreateColumnMap(ddlSiteColumn.SelectedItem, item));
                }
                else
                {
                    left.Add(new CpsnBindingColumnInfo(item.Value, item.Text));
                }

            }

            lstCpsnColumn.Items.Clear();
            lstCpsnColumn.DataTextField = "Name";
            lstCpsnColumn.DataValueField = "Id";
            lstCpsnColumn.DataSource = left;
            lstCpsnColumn.DataBind();

            lstSiteColumn.Items.Clear();
            lstSiteColumn.DataTextField = "Name";
            lstSiteColumn.DataValueField = "Id";
            lstSiteColumn.DataSource = right;
            lstSiteColumn.DataBind();

            DataTable dt = cm.GetAllColumnMap();
            BindMap(dt);
        }

        private void BindMap(DataTable dt)
        {
            rtColumnMap.DataSource = dt;
            rtColumnMap.DataBind();
        }

        private void Delete()
        {
            Foosun.CMS.ContentManage cm = new Foosun.CMS.ContentManage();

            List<CpsnBindingColumnInfo> left = new List<CpsnBindingColumnInfo>();
            List<CpsnBindingColumnInfo> right = new List<CpsnBindingColumnInfo>();

            foreach (ListItem item in lstCpsnColumn.Items)
            {
                left.Add(new CpsnBindingColumnInfo(item.Value, item.Text));
            }

            foreach (ListItem item in lstSiteColumn.Items)
            {
                if (item.Selected)
                {
                    left.Add(new CpsnBindingColumnInfo(item.Value, item.Text));

                    cm.DeleteColumnMap(item.Value, item.Text.Substring(1, item.Text.LastIndexOf(']') - 1));
                }
                else
                {
                    right.Add(new CpsnBindingColumnInfo(item.Value, item.Text));
                }
            }

            lstCpsnColumn.Items.Clear();
            lstCpsnColumn.DataTextField = "Name";
            lstCpsnColumn.DataValueField = "Id";
            lstCpsnColumn.DataSource = left;
            lstCpsnColumn.DataBind();

            lstSiteColumn.Items.Clear();
            lstSiteColumn.DataTextField = "Name";
            lstSiteColumn.DataValueField = "Id";
            lstSiteColumn.DataSource = right;
            lstSiteColumn.DataBind();

            DataTable dt = cm.GetAllColumnMap();
            BindMap(dt);
        }

        protected void btnDelete_Click(object sender, ImageClickEventArgs e)
        {
            Delete();
        }

        protected void ddlSiteColumn_SelectedIndexChanged(object sender, EventArgs e)
        {
            BoundSiteColumn();
        }

        private static SiteColumnMapInfo CreateColumnMap(ListItem siteCol, ListItem cpsnCol)
        {
            SiteColumnMapInfo m = new SiteColumnMapInfo();
            m.CpClassId = cpsnCol.Value;
            m.CpClassName = cpsnCol.Text.Substring(cpsnCol.Text.LastIndexOf(']') + 1);
            m.SiteClassId = siteCol.Value;
            m.SiteClassName = siteCol.Text;
            m.Media = cpsnCol.Text.Substring(1, cpsnCol.Text.LastIndexOf(']') - 1);
            //m.ClassDaiName

            return m;
        }

        protected void ddlSiteColumn_DataBound(object sender, EventArgs e)
        {
            BoundSiteColumn();
        }

        private void BoundSiteColumn()
        {
            Foosun.CMS.ContentManage cm = new Foosun.CMS.ContentManage();
            DataTable dt = cm.GetAllColumnMap();

            //List<CpsnBindingColumnInfo> right = new List<CpsnBindingColumnInfo>();

            lstSiteColumn.Items.Clear();


            string current = ddlSiteColumn.SelectedItem.Value;
            foreach (DataRow row in dt.Rows)
            {
                if (row["SiteClassId"].ToString() == current)
                {
                    //CpsnBindingColumnInfo column = new CpsnBindingColumnInfo();
                    //column.Id = col.Id;
                    //column.Name = "[" + col.Media + "]" + col.Name;
                    //right.Add(column);

                    lstSiteColumn.Items.Add(new ListItem("[" + row["Media"].ToString() + "]" + row["CpClassName"].ToString(), row["CpClassId"].ToString()));
                }
            }
        }

        protected void btnDelete_Click1(object sender, EventArgs e)
        {
            Delete();

        }

        protected void btnAdd_Click1(object sender, EventArgs e)
        {
            Add();
        }
    }

    public class CpsnColumnInfo
    {
        private string id;
        private string name;
        private string media;
        private int number;

        public string Id { get { return id; } set { id = value; } }
        public string Name { get { return name; } set { name = value; } }
        public string Media { get { return media; } set { media = value; } }
        public int Number { get { return number; } set { number = value; } }
    }

    public class CpsnBindingColumnInfo
    {
        public CpsnBindingColumnInfo()
        { }

        public CpsnBindingColumnInfo(string id, string name)
        {
            this.id = id;
            this.name = name;
            
        }
        public CpsnBindingColumnInfo(string id, string name, int number)
        {
            this.id = id;
            this.name = name;
            this.number = number;
        }



        private string id;
        private string name;
        private int number;

        public string Id { get { return id; } set { id = value; } }
        public string Name { get { return name; } set { name = value; } }
        public int Number { get { return number; } set { number = value; } }
    }

}
