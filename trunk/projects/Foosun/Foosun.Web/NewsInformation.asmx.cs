using System;
using System.Data;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Collections.Generic;
using Foosun.CMS;

namespace Foosun.Web.CommonServices
{
    /// <summary>
    /// Summary description for NewsInformation
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    public class NewsInformation : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public List<ColumnInfo> GetAllColumn()
        {
            ContentManage rd = new ContentManage();
            DataTable dt = rd.GetAllClass();

            List<ColumnInfo> columns = new List<ColumnInfo>();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    ColumnInfo column = new ColumnInfo();
                    column.Id = (String)row["ColumnId"];
                    column.Name = (String)row["ChineseName"];
                    column.ParentId = (String)row["ParentId"];

                    columns.Add(column);
                }
            }

            return columns;
        }
    }

    public class ColumnInfo
    {
        private string id;
        private string name;
        private string parentId;

        public string Id { get { return id; } set { id = value; } }
        public string Name { get { return name; } set { name = value; } }
        public string ParentId { get { return parentId; } set { parentId = value; } }
    }
}
