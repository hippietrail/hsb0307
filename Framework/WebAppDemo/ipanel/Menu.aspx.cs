using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

using MenuTable = Admin.Data.Menus.MenusDataTable;
using MenuRow = Admin.Data.Menus.MenusRow;

namespace WebAppDemo.ipanel
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            RepeaterItem item = e.Item;
            MenuRow menuItem = (item.DataItem as DataRowView).Row as MenuRow;
            
            Repeater repeater = item.FindControl("Repeater2") as Repeater;

            DataView dv = Admin.BusinessActions.Menu.GetSubMenu(menuItem.Id);
            repeater.DataSource = dv;
            repeater.DataBind();
            
        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            RepeaterItem item = e.Item;

            if (item.ItemType  != ListItemType.Footer)
            {
                MenuRow menuItem = (item.DataItem as DataRowView).Row as MenuRow;
                Literal lbl = item.FindControl("Literal1") as Literal;
                DataView dv = Admin.BusinessActions.Menu.GetSubMenu(menuItem.Id);
                if (dv.Count > 0)
                {
                    lbl.Text = String.Format(@"<li class=""L21""><a href=""javascript:c(f{0});"" id=""f{0}""><span><img src=""/images/menu/@hrms.gif"" align=""absMiddle""/>{1}</span></a></li>", menuItem.MenuCode, menuItem.Name);

                    Repeater repeater = item.FindControl("Repeater3") as Repeater;
                    repeater.DataSource = Admin.BusinessActions.Menu.GetSubMenu(menuItem.Id);
                    repeater.DataBind();
                }
                else
                {
                    lbl.Text = String.Format(@"<li class=""L22""><a href=""javascript:a('{0}','{1}');"" id=""f{1}""><span><img src=""/images/menu/training.gif"" align=""absMiddle""/> {2}</span></a></li>", menuItem.RelativeURL, menuItem.MenuCode, menuItem.Name);
                }
            }
        }
    }
}
