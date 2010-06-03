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
using Hg.CMS;
using Hg.CMS.Common;
using Hg.Model;

public partial class configuration_system_SelectNewsspecial_ajax : Hg.Web.UI.DialogPage
{
    public configuration_system_SelectNewsspecial_ajax()
    {
        BrowserAuthor = EnumDialogAuthority.ForAdmin;
    }
    rootPublic pd = new rootPublic();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Response.CacheControl = "no-cache";
            Response.Expires = 0;
            spList.InnerHtml = spstr();
        }
    }

    string spstr()
    {
        string ParentId = Request.QueryString["ParentId"];
        if (ParentId == "" || ParentId == null)
        {
            ParentId = "0";
        }
        else
        {
            ParentId = ParentId.ToString();
        }
        string liststr = string.Empty;
        IDataReader rd = pd.GetajaxsspecialList(ParentId);
        while (rd.Read())
        {
            if (Convert.ToInt32(rd["HasSub"]) > 0)
            {
                liststr += "<div><img src=\"../../sysImages/normal/b.gif\" alt=\"点击展开子栏目\"  border=\"0\" class=\"LableItem\" onClick=\"javascript:SwitchImg(this,'" + rd["SpecialID"] + "');\" />&nbsp;<span id=\"" + rd["SpecialID"] + "\" class=\"LableItem\" ondblclick=\"ReturnValue();\" onClick=\"SelectLable(this);sFiles('" + rd["SpecialID"] + "','" + rd["SpecialCName"] + "');\">" + rd["SpecialCName"] + "</span><div id=\"Parent" + rd["SpecialID"] + "\" class=\"SubItem\" HasSub=\"True\" style=\"height:100%;display:none;\"></div></div>";
            }
            else
            {
                //判断权限
                EnumLoginState state = EnumLoginState.Err_AdminTimeOut;
                if (Validate_Session())
                {
                    state = _UserLogin.CheckAdminAuthority("C019", rd["SpecialID"].ToString(), "", Hg.Global.Current.SiteID.Trim(), Hg.Global.Current.adminLogined);
                }
                if (state == EnumLoginState.Succeed)
                {
                    liststr += "<div><img src=\"../../sysImages/normal/s.gif\" alt=\"没有子栏目\"  border=\"0\" class=\"LableItem\" />&nbsp;<span id=\"" + rd["SpecialID"] + "\" class=\"LableItem\" ondblclick=\"ReturnValue();\" onClick=\"SelectLable(this);sFiles('" + rd["SpecialID"] + "','" + rd["SpecialCName"] + "');\">" + rd["SpecialCName"] + "</span></div>";
                }
            }
        }
        rd.Close();
        if (liststr != string.Empty)
            liststr = "Succee|||" + ParentId + "|||" + liststr;
        else
            liststr = "Fail|||" + ParentId + "|||";
        return liststr;
    }
}
