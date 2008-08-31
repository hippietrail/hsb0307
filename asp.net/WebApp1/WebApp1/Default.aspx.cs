using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;

namespace WebApp1
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!this.IsPostBack)
            //{
            //    //Treeview1.Nodes[0].Expand();
            //}
        }

        protected void Treeview1_TreeNodePopulate(object sender, TreeNodeEventArgs e)
        {
            if (this.IsCallback)
                if (e.Node.ChildNodes.Count == 0)
                {
                    LoadChildNode(e.Node);
                }

        }

        private void LoadChildNode(TreeNode node)
        {

            DirectoryInfo directory;
            directory = new DirectoryInfo(node.Value);

            // 第一步：先获取所有文件夹
            foreach (DirectoryInfo sub in directory.GetDirectories())
            {

                TreeNode subNode = new TreeNode(sub.Name);
                subNode.Value = sub.FullName;

                try
                {
                    if (sub.GetDirectories().Length > 0 || sub.GetFiles().Length > 0)
                    {
                        subNode.SelectAction = TreeNodeSelectAction.SelectExpand;
                        subNode.PopulateOnDemand = true;
                        subNode.NavigateUrl = "#";
                    }
                }
                catch 
                { 
                    subNode.ImageUrl = "WebResource.axd?a=s&r=TreeView_XP_Explorer_ParentNode.gif&t=632242003305625000"; 
                }
                node.ChildNodes.Add(subNode);

                if (subNode.Depth == 0)
                {
                    subNode.Expand();
                }

            }

            foreach (FileInfo fi in directory.GetFiles())
            {
                TreeNode subNode = new TreeNode(fi.Name);
                node.ChildNodes.Add(subNode);
            }
        }


    }
}
