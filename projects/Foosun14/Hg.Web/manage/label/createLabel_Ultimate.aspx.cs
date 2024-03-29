﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class manage_label_createLabel_Ultimate : Hg.Web.UI.ManagePage
{
    public string APIID = "0";
    Hg.CMS.Label rd = new Hg.CMS.Label();
    protected void Page_Load(object sender, EventArgs e)
    {
        APIID = SiteID;
        if (!IsPostBack)
        {
            
            string _dirdumm = Hg.Config.UIConfig.dirDumm;
            if (_dirdumm.Trim() != "") { _dirdumm = "/" + _dirdumm; }
            style_base.InnerHtml = Hg.Common.Public.getxmlstylelist("styleContent", _dirdumm + "/xml/cuslabeStyle/cstylebase.xml");
            style_class.InnerHtml = Hg.Common.Public.getxmlstylelist("styleContent1", _dirdumm + "/xml/cuslabeStyle/cstyleclass.xml");
            style_special.InnerHtml = Hg.Common.Public.getxmlstylelist("DropDownList2", _dirdumm + "/xml/cuslabeStyle/cstylespecial.xml");
            getDefine();
            GetStyleList(this.StyleClassID);
        }
    }

    protected void GetStyleList(DropDownList lst)
    {
        IDataReader dr = rd.GetStyleList(SiteID);
        while (dr.Read())
        {
            ListItem it = new ListItem();
            it.Value = dr["ClassID"].ToString();
            it.Text = dr["Sname"].ToString();
            lst.Items.Add(it);
        }
        dr.Close();
    }
    /// <summary>
    /// 获得自定义字段列表
    /// </summary>

    protected void getDefine()
    {
        Hg.CMS.Style.Style stClass = new Hg.CMS.Style.Style();
        DataTable dt = stClass.styledefine();
        if (dt != null)
        {
            define.DataTextField = "defineCname";
            define.DataValueField = "defineColumns";
            define.DataSource = dt;
            define.DataBind();
            dt.Clear();
            dt.Dispose();
        }
        ListItem itm = new ListItem();
        itm.Value = "";
        itm.Text = "自定义字段";
        define.Items.Insert(0, itm);
        itm = null;
    }
}
