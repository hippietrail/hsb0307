﻿///************************************************************************************************************
///**********在线编辑Code By DengXi****************************************************************************
///************************************************************************************************************
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
using System.IO;
using System.Text.RegularExpressions;
using System.Text;

public partial class manage_Templet_editor : Hg.Web.UI.ManagePage
{
    public string dir = string.Empty;
    public string filename = string.Empty;
    private string str_dirMana = Hg.Config.UIConfig.dirDumm;
    private string str_Templet = Hg.Config.UIConfig.dirTemplet;  //获取模板路径
    private string str_FilePath = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.CacheControl = "no-cache";

        if (SiteID == "0")
        {
            str_FilePath = Server.MapPath(str_dirMana + "\\" + str_Templet);
        }
        else
        {
            string _sitePath = str_dirMana + "\\" + str_Templet + "\\siteTemplets\\" + Hg.Global.Current.SiteEName;
            if (!Directory.Exists(Server.MapPath(_sitePath))) { Directory.CreateDirectory(Server.MapPath(_sitePath)); }
            str_FilePath = Server.MapPath(_sitePath);
        }
        dir = Request.QueryString["dir"];
        filename = Request.QueryString["filename"];
        string filepath = str_FilePath + dir.Replace("\\\\", "\\") + "\\" + filename;
        string action = Request.QueryString["action"];
        if (!IsPostBack)                                               //判断页面是否重载
        {
                                                 //判断用户是否登录
            dirPath.InnerHtml = "<span style=\"color:#999999;font-size:11.5px;\">当前路径:" + str_FilePath + dir.Replace("\\\\", "\\") + "&nbsp;&nbsp;&nbsp;&nbsp;当前文件:" + filename + "</span>";

            copyright.InnerHtml = CopyRight;            //获取版权信息
            ShowFileContet(filepath);
            getLabelList();
        }
        FilePath.Text = filepath;
    }

    /// <summary>
    /// 显示文件内容
    /// </summary>
    /// <param name="filepath">文件夹路径</param>
    /// <returns>显示文件内容</returns>
    /// Code By DengXi

    protected void ShowFileContet(string filepath)
    {
        Hg.CMS.Templet.Templet tpClass = new Hg.CMS.Templet.Templet();
        this.ContentTextBox.Value = tpClass.showFileContet(filepath);
    }

    /// <summary>
    /// 保存文件
    /// </summary>
    /// <returns>保存文件</returns>
    /// Code By DengXi

    protected void Button1_ServerClick(object sender, EventArgs e)
    {
        int result = 0;
        string str_content = this.ContentTextBox.Value;

        string doctypeContent = "<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>";
        string firstDoc = str_content.Substring(str_content.IndexOf("<html"), str_content.Length - str_content.IndexOf("<html"));
        str_content = doctypeContent + firstDoc;

        string str_path = FilePath.Text.ToString();

        Hg.CMS.Templet.Templet tpClass = new Hg.CMS.Templet.Templet();
        result = tpClass.saveFile(str_path, str_content);

        //文件路径 bug修改  保存后返回到原文件路径 周峻平 2008-5-30
        string[] strForderPath = dir.Split('\\');
        string tempSrc = string.Empty;
        foreach (string s in strForderPath)
        {
            if (s != "\\" && s != "")
            {
                tempSrc += "/" + s;
            }
        }
        strForderPath = tempSrc.Split('/');
        tempSrc = string.Empty;
        foreach (string s in strForderPath)
        {
            if (s != "/" && s != "")
            {
                tempSrc += "/" + s;
            }
        }

        tempSrc = tempSrc.Replace('/', '\\');

        if (result == 1)
        {
            PageRight("保存成功", "Manage_List.aspx?Path=" + tempSrc);
        }
        else
        {
            PageError("参数错误", "Manage_List.aspx?Path=" + tempSrc);
        }
    }

    protected void getLabelList()
    {
        Hg.CMS.Label lb = new Hg.CMS.Label();
        DataTable dt = lb.getLableList(SiteID, 2);
        if (dt != null)
        {
            LabelList.DataTextField = "Label_Name";
            LabelList.DataValueField = "Label_Name";
            LabelList.DataSource = dt;
            LabelList.DataBind();
            dt.Clear();
            dt.Dispose();
        }
        ListItem itm = new ListItem();
        itm.Selected = true;
        itm.Value = "";
        itm.Text = "=自定义标签(最新20条)";
        LabelList.Items.Insert(0, itm);
        itm = null;
        if (Request.QueryString["ch"] != null && !string.IsNullOrEmpty(Request.QueryString["ch"]))
        {
            SetLabel();
        }
    }

    private void SetLabel()
    {
        Hg.CMS.Channel rd = new Hg.CMS.Channel();
        string gkeywords = "#0";
        string gClassID = "#0";
        string ChID = Request.QueryString["ch"];
        int ii = 0;
        int j = 0;
        DataTable dt = rd.GetLabelPage(gkeywords, gClassID, int.Parse(ChID), 0, 500, out ii, out j, null);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            DataRow dr = dt.Rows[i];
            ListItem itm = new ListItem();
            itm.Text = dr["LabelName"].ToString();
            itm.Value = dr["LabelName"].ToString();
            LabelList.Items.Add(itm); 
        }
    }
}
