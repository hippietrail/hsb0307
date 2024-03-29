﻿//===========================================================
//==     (c)2007 Hg Inc. by WebFastCMS 1.0              ==
//==             Forum:bbs.hg.net                      ==
//==            website:www.hg.net                     ==
//==     Address:NO.109 HuiMin ST.,Chengdu ,China          ==
//==         TEL:86-28-85098980/66026180                   ==
//==         qq:655071,MSN:ikoolls@gmail.com               ==
//==        Code By Simplt.Xie & zhaoHui.Chen              == 
//===========================================================
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Hg.CMS;
using Hg.CMS.Common;
using Hg.Publish;
using System.IO;

namespace Hg.Web
{
    public partial class manage_publish_site : Hg.Web.UI.ManagePage
    {
        rootPublic rd = new rootPublic();
        DataTable dataClassTable = null;
        DataTable dataSpecialTable = null;
        DataTable dataIspageTable = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "no-cache";
            if (!IsPostBack)
            {
                string ReadType = Hg.Common.Public.readparamConfig("ReviewType");
                if (ReadType == "1")
                {
                    PageError("整站动态调用，不需要生成 如果要开启静态生成，请在[控制面板--参数设置]里设置", "javascript:history.back();", true);
                }
                this.Button1.Attributes.Add("onclick", "javascript:return checkform();");
                this.Button2.Attributes.Add("onclick", "javascript:return checkform();");

                copyright.InnerHtml = CopyRight;            //获取版权信息
                //Response.CacheControl = "no-cache";                        //设置页面无缓存    
                Hg.CMS.AdminGroup ac = new Hg.CMS.AdminGroup();
                dataClassTable = ac.getClassList("ClassID,ClassCName,ParentID", "news_Class", string.Format("Where  isRecyle<>1 and isPage = 0 and SiteID='{0}'", Hg.Global.Current.SiteID));
                dataSpecialTable = ac.getClassList("SpecialID,SpecialCName,ParentID", "news_special", string.Format("Where  isRecyle<>1 and SiteID='{0}'", Hg.Global.Current.SiteID));
                dataIspageTable = ac.getClassList("ClassID,ClassCName", "News_Class", string.Format("Where isRecyle<>1 and isPage={0} and SiteID='{1}'", 1, Hg.Global.Current.SiteID));
                InitialDivClass(divClassClass);
                InitialDivClass(divClassNews);
                InitialDivSpecial(DivSpecial);
                InitSingle();
                dataClassTable.Clear();
                dataClassTable.Dispose();
                dataSpecialTable.Clear();
                dataSpecialTable.Dispose();
                dataIspageTable.Clear();
                dataIspageTable.Dispose();
                if (Hg.Config.verConfig.PublicType == "0")
                {
                    indexPublic.Visible = false;
                    pIndex.Visible = false;
                }
            }
        }
        /// <summary>
        /// 初始化divClassClass
        /// </summary>
        public void InitialDivClass(ListBox divClassBox)
        {

            DataRow[] rows = dataClassTable.Select("ParentID='0'");

            for (int i = 0; i < rows.Length; i++)
            {
                ListItem tempListItem = new ListItem();
                tempListItem.Value = rows[i]["ClassID"].ToString();
                tempListItem.Text = rows[i]["ClassCName"].ToString();
                divClassBox.Items.Add(tempListItem);
                InitialChildItems(tempListItem.Value, divClassBox, "┉┉");
            }

        }
        public void InitialChildItems(string ParentID, ListBox divClassBox, string strFlag)
        {
            DataRow[] rows = dataClassTable.Select(string.Format("ParentID='{0}'", ParentID.Replace("'", "''")));

            for (int i = 0; i < rows.Length; i++)
            {
                ListItem tempListChildItem = new ListItem();
                tempListChildItem.Value = rows[i]["ClassID"].ToString();
                tempListChildItem.Text = strFlag + rows[i]["ClassCName"].ToString();
                divClassBox.Items.Add(tempListChildItem);
                InitialChildItems(tempListChildItem.Value, divClassBox, strFlag + "┉┉");
            }

        }
        /// <summary>
        /// 初始化DivSpecial
        /// </summary>
        /// <param name="DivSpecial"></param>
        public void InitialDivSpecial(ListBox DivSpecial)
        {
            DataRow[] rows = dataSpecialTable.Select("ParentID='0'");

            for (int i = 0; i < rows.Length; i++)
            {
                ListItem tempListItem = new ListItem();
                tempListItem.Value = rows[i]["SpecialID"].ToString();
                tempListItem.Text = rows[i]["SpecialCName"].ToString();
                DivSpecial.Items.Add(tempListItem);
                InitialDivSpecialChild(tempListItem.Value, DivSpecial, "┉┉");
            }

        }
        public void InitialDivSpecialChild(string ParentId, ListBox DivSpecial, string strFlag)
        {
            DataRow[] rows = dataSpecialTable.Select(string.Format("ParentID='{0}'", ParentId.Replace("'", "''")));

            for (int i = 0; i < rows.Length; i++)
            {
                ListItem tempChildListItem = new ListItem();
                tempChildListItem.Value = rows[i]["SpecialID"].ToString();
                tempChildListItem.Text = strFlag + rows[i]["SpecialCName"].ToString();
                DivSpecial.Items.Add(tempChildListItem);
                InitialDivSpecialChild(tempChildListItem.Value, DivSpecial, strFlag + "┉┉");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                showweb.Visible = false;
                bool getbak = false;
                bool indexBoolFlag = false;
                //读取发布主页的参数
                if (indexTF.Checked)
                {
                    indexBoolFlag = true;
                    if (baktf.Checked)
                    {
                        getbak = true;
                    }
                }
                int newsFlag = 0;//读取发布新闻的参数
                bool newsBoolFlag = false;
                string strNewsParams = null;
                if (newsall.Checked)
                {
                    newsFlag = 0;
                    newsBoolFlag = true;
                }
                else
                {
                    if (newslast.Checked)
                    {
                        newsFlag = 1;
                        strNewsParams = NewNum.Text;
                        if (Hg.Common.Input.IsInteger(strNewsParams) == false)
                        {
                            PageError("发布最新的新闻请填写正确数字", "site.aspx");
                        }
                        newsBoolFlag = true;
                    }
                    else
                    {
                        if (newsunhtml.Checked)
                        {
                            newsFlag = 2;
                            strNewsParams = unhtmlNum.Text;
                            if (Hg.Common.Input.IsInteger(strNewsParams) == false)
                            {
                                PageError("发布未生成的新闻请填写正确数字", "site.aspx");
                            }
                            newsBoolFlag = true;
                        }
                        else
                        {
                            if (newsclass.Checked)
                            {
                                newsFlag = 3;
                                strNewsParams = getNewsClassParams() + "$" + DropDownList1.SelectedValue;
                                if (unHTMLnews.Checked)
                                {
                                    strNewsParams += "#";//存在则只发布未发布的
                                }
                                if (orderbyDesc.Checked)
                                {
                                    strNewsParams += "&";//只有此处有"&"标志，存在则正序，没有则倒序
                                }
                                newsBoolFlag = true;
                            }
                            else
                            {
                                if (newsdate.Checked)
                                {
                                    newsFlag = 4;
                                    if (Hg.Common.Input.IsDate(startTime.Text) == false && Hg.Common.Input.IsDate(endTime.Text) == false)
                                    {
                                        PageError("请正确填写开始时间和结束时间", "site.aspx");
                                    }
                                    strNewsParams = (startTime.Text).ToString() + "$" + (endTime.Text).ToString();
                                    newsBoolFlag = true;
                                }
                                else
                                {
                                    if (newsid.Checked)
                                    {
                                        newsFlag = 5;
                                        if ((Hg.Common.Input.IsInteger(startID.Text) == false) || (Hg.Common.Input.IsInteger(EndID.Text) == false))
                                        {
                                            PageError("请正确ID开始及ID结束", "site.aspx");
                                        }
                                        strNewsParams = startID.Text + "$" + EndID.Text;
                                        newsBoolFlag = true;
                                    }
                                }
                            }
                        }
                    }
                }

                int newsClassFlag = 1;//取发布栏目的参数
                string strNewsClassParams = string.Empty;
                bool classBoolFlag = false;
                bool isIndex = false;
                if (classall.Checked)
                {
                    newsClassFlag = 0;
                    if (unHTMLclass.Checked)
                    {
                        strNewsClassParams = "#";
                    }
                    classBoolFlag = true;
                    isIndex = pIndex.Checked;
                }
                else
                {
                    strNewsClassParams = getClassParams();
                    if (strNewsClassParams != null)
                    {
                        isIndex = pIndex.Checked;
                        classBoolFlag = true;
                    }
                }

                int specialFlag = 1;
                string strSpecialParams = string.Empty;
                bool specialBoolFlag = false;//取发布专题的参数
                if (specialall.Checked)
                {
                    specialFlag = 0;
                    specialBoolFlag = true;
                }
                else
                {
                    strSpecialParams = getSpecialParams();
                    if (strSpecialParams != null)
                    {
                        specialBoolFlag = true;
                    }
                }

                bool publishIsPage = false;//取发布单页的参数
                string publishIsPageStr = null;
                if (this.RadioButton1_singleness.Checked)
                {
                    publishIsPage = true;
                    publishIsPageStr = getAllSingleParams();
                }
                else
                {
                    publishIsPageStr = getSingleParams();
                    if (string.IsNullOrEmpty(publishIsPageStr))
                    {
                        publishIsPage = false;
                    }
                    else
                    {
                        publishIsPage = true;
                    }
                }

                UltiPublish publishAll = new UltiPublish(true);
                publishAll.IsPublishIndex = indexBoolFlag;
                publishAll.IsPubNews = newsBoolFlag;
                publishAll.IsPubClass = classBoolFlag;
                publishAll.IsPubSpecial = specialBoolFlag;
                publishAll.IsPubIsPage = publishIsPage;

                publishAll.newsFlag = newsFlag;
                publishAll.strNewsParams = strNewsParams;
                publishAll.ClassFlag = newsClassFlag;
                publishAll.strClassParams = strNewsClassParams;
                publishAll.isClassIndex = isIndex;
                publishAll.specialFlag = specialFlag;
                publishAll.strSpecialParams = strSpecialParams;
                publishAll.StrClassIsPageParam = publishIsPageStr;
                //加入发布权限检测
                if (indexBoolFlag)
                {
                    this.Authority_Code = "P001";
                    this.CheckAdminAuthority();
                }
                if (newsBoolFlag)
                {
                    this.Authority_Code = "P002";
                    this.CheckAdminAuthority();
                }
                if (classBoolFlag)
                {
                    this.Authority_Code = "P003";
                    this.CheckAdminAuthority();
                }
                if (specialBoolFlag)
                {
                    this.Authority_Code = "P004";
                    this.CheckAdminAuthority();
                }
                try
                {
                    #region 备份首页文件
                    if (getbak)
                    {
                        if (SiteID == "0")
                        {
                            string sourceFile = "~/" + Hg.Common.Public.readparamConfig("IndexFileName");
                            string str_dirPige = Hg.Config.UIConfig.dirPige;
                            if (File.Exists(Server.MapPath(sourceFile)))
                            {
                                string TagetFile = "~/" + str_dirPige + "/index/" + DateTime.Now.Year + DateTime.Now.Month + DateTime.Now.Day + ".shtml";
                                string hfile = "~/" + str_dirPige;
                                string TagetDir = "~/" + str_dirPige + "/index";
                                sourceFile = sourceFile.Replace("//", "/").Replace(@"\\", @"\");
                                TagetFile = TagetFile.Replace("//", "/").Replace(@"\\", @"\");
                                TagetDir = TagetDir.Replace("//", "/").Replace(@"\\", @"\");
                                hfile = hfile.Replace("//", "/").Replace(@"\\", @"\");
                                if (!Directory.Exists(Server.MapPath(hfile))) { Directory.CreateDirectory(Server.MapPath(hfile)); }
                                if (!Directory.Exists(Server.MapPath(TagetDir))) { Directory.CreateDirectory(Server.MapPath(TagetDir)); }
                                if (File.Exists(Server.MapPath(TagetFile))) { File.Delete(Server.MapPath(TagetFile)); }
                                File.Move(Server.MapPath(sourceFile), Server.MapPath(TagetFile));
                            }
                        }
                        else
                        {
 
                        }
                    }
                    #endregion 备份首页文件
                    publishAll.StartPublish();
                }
                finally
                {
                    publishAll.CloseAllConnection();
                }
                Response.Buffer = true;
                Response.ExpiresAbsolute = DateTime.Now.AddDays(-1);
                Response.Expires = 0;
                Response.CacheControl = "no-cache";
                Response.Clear();
                Response.End();
            }
        }

        /// <summary>
        /// 获取选中newsClass时的参数字符串
        /// </summary>
        /// <returns>选中newsClass时的参数字符串</returns>
        public string getNewsClassParams()
        {
            string classIds = null;
            for (int i = 0; i < divClassNews.Items.Count; i++)
            {
                if (divClassNews.Items[i].Selected)
                {
                    if (classIds != null)
                    {
                        classIds += "$" + divClassNews.Items[i].Value;
                    }
                    else
                    {
                        classIds = divClassNews.Items[i].Value;
                    }
                }
            }
            return classIds;
        }
        /// <summary>
        /// 获取发布栏目时的参数字符串
        /// </summary>
        /// <returns>发布栏目时的参数字符串</returns>
        public string getClassParams()
        {
            string classIds = null;
            for (int i = 0; i < divClassClass.Items.Count; i++)
            {
                if (divClassClass.Items[i].Selected)
                {
                    if (classIds != null)
                    {
                        classIds += "$" + divClassClass.Items[i].Value;
                    }
                    else
                    {
                        classIds = divClassClass.Items[i].Value;
                    }
                }
            }
            return classIds;
        }
        /// <summary>
        /// 获取发布专题时的参数字符串
        /// </summary>
        /// <returns>发布专题时的参数字符串</returns>
        public string getSpecialParams()
        {
            string classIds = null;
            for (int i = 0; i < DivSpecial.Items.Count; i++)
            {
                if (DivSpecial.Items[i].Selected)
                {
                    if (classIds != null)
                    {
                        classIds += "$" + DivSpecial.Items[i].Value;
                    }
                    else
                    {
                        classIds = DivSpecial.Items[i].Value;
                    }
                }
            }
            return classIds;
        }

        /// <summary>
        /// 获取发布单页时的参数数字字符串
        /// </summary>
        /// <returns></returns>
        public string getSingleParams()
        {
            string classIds = null;
            for (int i = 0; i < ListBox_singleness.Items.Count; i++)
            {
                if (ListBox_singleness.Items[i].Selected)
                {
                    if (classIds != null)
                    {
                        classIds += "$" + ListBox_singleness.Items[i].Value;
                    }
                    else
                    {
                        classIds = ListBox_singleness.Items[i].Value;
                    }
                }
            }
            return classIds;
        }

        /// <summary>
        /// 获取所有单页
        /// </summary>
        /// <returns></returns>
        public string getAllSingleParams()
        {
            string classIds = null;
            for (int i = 0; i < ListBox_singleness.Items.Count; i++)
            {
                if (classIds != null)
                {
                    classIds += "$" + ListBox_singleness.Items[i].Value;
                }
                else
                {
                    classIds = ListBox_singleness.Items[i].Value;
                }
            }
            return classIds;
        }

        /// <summary>
        /// 初始化单页面
        /// </summary>
        public void InitSingle()
        {
            for (int i = 0; i < dataIspageTable.Rows.Count; i++)
            {
                ListItem tempListItem = new ListItem();
                tempListItem.Value = dataIspageTable.Rows[i]["ClassID"].ToString();
                tempListItem.Text = dataIspageTable.Rows[i]["ClassCName"].ToString();
                ListBox_singleness.Items.Add(tempListItem);
            }
        }
    }
}