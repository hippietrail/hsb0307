using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Hg.Config;
using Hg.DALFactory;
using Hg.Model;
using System.Collections;

namespace Hg.Publish
{
    public class CommonData
    {
        public static Hg.DALFactory.ISite DalSite = DataAccess.CreateSite();
        public static Hg.DALFactory.IPublish DalPublish = DataAccess.CreatePublish();
        public static IList<PubClassInfo> NewsClass = new List<PubClassInfo>();
        public static IList<PubSpecialInfo> NewsSpecial = new List<PubSpecialInfo>();
        public static IList<PubCHClassInfo> CHClass = new List<PubCHClassInfo>();
        public static IList<PubCHSpecialInfo> CHSpecial = new List<PubCHSpecialInfo>();
        public static DataTable NewsInfoList = new DataTable();
        public static DataTable NewsJsList = null;
        //public static IList<pub
        /// <summary>
        /// 取得网站域名的根目录(绝对路径及相对路径)
        /// </summary>
        public static string SiteDomain;

        public static string getUrl()
        {
            string flg = "";
            string dirdumm = Hg.Config.UIConfig.dirDumm;

            if (dirdumm.Trim() != string.Empty)
            {
                dirdumm = "/" + dirdumm;
            }
            string linkType = Hg.Common.Public.readparamConfig("linkTypeConfig");
            string sitedomain = Hg.Common.Public.readparamConfig("siteDomain");
            if (linkType == "1")
            {
                if (sitedomain.IndexOf("http://") > -1) { flg = sitedomain + dirdumm; }
                else
                {
                    flg = "http://" + sitedomain;
                    if (Hg.Common.ServerInfo.ServerPort != "80")
                    {
                        flg += ":" + Hg.Common.ServerInfo.ServerPort;
                    }
                    flg += dirdumm;
                }
            }
            else { flg = dirdumm; }
            //rd.Close();
            return flg;
        }
        /// <summary>
        /// 初始化数据函数
        /// </summary>
        /// <param name="cn"></param>
        public static void Initialize()
        {
            SiteDomain = getUrl();
            //NewsClass.Clear();
            //NewsSpecial.Clear();
            //单例模式
            NewsClass = NewsClass.Count == 0 ? CommonData.DalPublish.GetClassList() : NewsClass;
            CHClass = CHClass.Count == 0 ? CommonData.DalPublish.GetCHClassList() : CHClass;
            NewsSpecial = NewsSpecial.Count == 0 ? CommonData.DalPublish.GetSpecialList() : NewsSpecial;
            CHSpecial = CHSpecial.Count == 0 ? CommonData.DalPublish.GetCHSpecialList() : CHSpecial;
            NewsInfoList = NewsInfoList == null || NewsInfoList.Rows.Count == 0 ? CommonData.DalPublish.GetNewsListByAll("''") : NewsInfoList;
            //创建表结构
            if (NewsJsList == null)
            {
                NewsJsList = new DataTable();
                NewsJsList.Columns.Add("JsID", typeof(string));
                NewsJsList.Columns.Add("jssavepath", typeof(string));
                NewsJsList.Columns.Add("jsfilename", typeof(string));
            }
        }
        /// <summary>
        /// 取得栏目的相关信息,必须是没有放在回收站中的
        /// </summary>
        //public static PubClassInfo GetClassById(string classid)
        //{
        //    foreach (PubClassInfo cl in NewsClass)
        //    {
        //        if (cl.ClassID.Equals(classid))
        //            return cl;
        //    }
        //    return null;
        //}
        /// <summary>
        /// 获取栏目信息
        /// </summary>
        /// <param name="ClassId">栏目ID</param>
        /// <returns></returns>
        public static PubClassInfo GetClassById(string ClassId)
        {
            PubClassInfo classObj = null;
            NewsClass = NewsClass.Count == 0 ? CommonData.DalPublish.GetClassList() : NewsClass;
            foreach (PubClassInfo p in NewsClass)
            {
                if (p.ClassID.Equals(ClassId))
                {
                    classObj = p;
                    break;
                }
            }
            return classObj;
        }
        /// <summary>
        /// 取得频道栏目的相关信息
        /// </summary>
        public static PubCHClassInfo GetCHClassById(int ID)
        {
            CHClass = CHClass.Count == 0 ? CommonData.DalPublish.GetCHClassList() : CHClass;
            foreach (PubCHClassInfo ccl in CHClass)
            {
                if (ccl.Id.Equals(ID))
                    return ccl;
            }
            return null;
        }

        public static PubSpecialInfo GetSpecialForNewsID(string NewsID)
        {
            return CommonData.DalPublish.GetSpecialForNewsID(NewsID);
        }

        /// <summary>
        /// 取得专题的相关信息,必须是没有放在回收站中的
        /// </summary>
        public static PubSpecialInfo GetSpecial(string specialid)
        {
            NewsSpecial = NewsSpecial.Count == 0 ? CommonData.DalPublish.GetSpecialList() : NewsSpecial;
            if (string.IsNullOrEmpty(specialid))
            {
                return new PubSpecialInfo();
            }
            string[] idList = specialid.Split(',');
            PubSpecialInfo sps = null;
            bool isBeing = false;
            foreach (PubSpecialInfo sp in NewsSpecial)
            {
                foreach (string ids in idList)
                {
                    if (sp.SpecialID.Equals(ids))
                    {
                        sps = sp;
                        isBeing = true;
                        break;
                    }
                }
                if (isBeing)
                    break;
            }
            return sps;
        }

        /// <summary>
        /// 取得专题的相关信息,必须是没有放在回收站中的
        /// </summary>
        public static PubCHSpecialInfo GetCHSpecial(int ID)
        {
            CHSpecial = CHSpecial.Count == 0 ? CommonData.DalPublish.GetCHSpecialList() : CHSpecial;
            foreach (PubCHSpecialInfo sp in CHSpecial)
            {
                if (sp.Id.Equals(ID))
                    return sp;
            }
            return null;
        }

        public static string getNewsURLFormID(string NewsID, string DataLib)
        {
            string URLSTR = "";
            string ReadType = Hg.Common.Public.readparamConfig("ReviewType");
            IDataReader rd = DalPublish.GetNewsInfoAndClassInfo(NewsID, DataLib);
            if (rd.Read())
            {
                if (rd["NewsType"].ToString() == "2")
                {
                    URLSTR = rd["URLaddress"].ToString();
                }
                else
                {
                    if (rd["isDelPoint"].ToString() != "0")
                    {
                        URLSTR = "/Content.aspx?id=" + NewsID;
                    }
                    else
                    {
                        if (ReadType == "1")
                        {
                            URLSTR = "/Content.aspx?id=" + NewsID;
                        }
                        else
                        {
                            URLSTR = rd["SavePath1"].ToString() + "/" + rd["SaveClassframe"] + "/" + rd["SavePath"].ToString() + "/" + rd["FileName"].ToString() + rd["FileEXName"].ToString();
                        }
                    }
                    URLSTR = URLSTR.Replace("//", "/");
                    URLSTR = getUrl() + URLSTR;
                }
            }
            rd.Close();
            return URLSTR;
        }

        /// <summary>
        /// 取得栏目访问地址
        /// </summary>
        /// <param name="SavePath">栏目保存路径</param>
        /// <param name="ClassSaveRule">栏目保存规则</param>
        /// <returns>返回访问地址</returns>
        public static string getClassURL(string Domain, int isDelPoint, string ClassID, string SavePath, string SaveClassframe, string ClassSaveRule)
        {
            CommonData.Initialize();
            string tmstr = "";
            if (Domain.Length > 5)
            {
                if (Hg.Common.Public.readparamConfig("ReviewType") == "1")
                {
                    tmstr = "/list.aspx?id=" + ClassID;
                    return CommonData.SiteDomain + tmstr.Replace("//", "/");
                }
                else
                {
                    if (isDelPoint != 0)
                    {
                        tmstr = "/list.aspx?id=" + ClassID;
                        return CommonData.SiteDomain + tmstr.Replace("//", "/");
                    }
                    else
                    {
                        tmstr = "/" + ClassSaveRule;
                        return Domain + tmstr.Replace("//", "/");
                    }
                }
            }
            else
            {
                if (Hg.Common.Public.readparamConfig("ReviewType") == "1")
                {
                    tmstr = "/list.aspx?id=" + ClassID;
                }
                else
                {
                    if (isDelPoint != 0)
                    {
                        tmstr = "/list.aspx?id=" + ClassID;
                    }
                    else
                    {
                        tmstr = "/" + SavePath + "/" + SaveClassframe + "/" + ClassSaveRule;
                    }
                }
                return CommonData.SiteDomain + tmstr.Replace("//", "/");
            }
        }

        /// <summary>
        /// 取得新闻访问地址
        /// </summary>
        /// <param name="SavePath">新闻保存路径</param>
        /// <param name="FileName">新闻文件名</param>
        /// <param name="SaveClassframe">栏目存储新闻的规则</param>
        /// <param name="FileEXName">新闻文件名后缀</param>   
        /// <returns>返回新闻访问地址</returns>
        public static string getNewsURL(string isDelPoint, string NewsID, string SavePath, string SaveClassframe, string FileName, string FileEXName)
        {
            CommonData.Initialize();
            string str_temppath = "";
            if (Hg.Common.Public.readparamConfig("ReviewType") == "1")
            {
                str_temppath = "/content.aspx?id=" + NewsID;
            }
            else
            {
                if (isDelPoint != "0")
                {
                    str_temppath = "/content.aspx?id=" + NewsID;
                }
                else
                {
                    str_temppath = "/" + SaveClassframe + "/" + SavePath + "/" + FileName + FileEXName;
                }
            }
            str_temppath = CommonData.SiteDomain + str_temppath.Replace("//", "/");
            return str_temppath;
        }

        /// <summary>
        /// 取得栏目访问地址
        /// </summary>
        /// <param name="ClassID">栏目编号</param>
        /// <returns>返回访问地址</returns>
        public static string getClassURL(string ClassID)
        {
            CommonData.Initialize();
            Hg.Model.PubClassInfo pci = CommonData.GetClassById(ClassID);
            return CommonData.getClassURL(pci.Domain, pci.isDelPoint, pci.ClassID, pci.SavePath, pci.SaveClassframe, pci.ClassSaveRule);
        }

        public static Hg.Model.NewsContent getNewsInfoById(string newsID)
        {
            //if (NewsInfoList.Columns.Count == 0)
            //    _SetDataTableFrame();
            //DataRow[] rowList = CommonData.NewsInfoList.Select("NewsID='" + newsID + "'");
            //if (rowList.Length == 0)
            //{
            //    IDataReader reader = CommonData.DalPublish.GetNewsDetail(0, newsID);
            //    reader.Read();
            //    _setNewsInfoDataRow(reader);
            //    return _setNewsInfos(reader);
            //}
            //else
            //{
            //    return _setNewsInfos(rowList[0]);
            //}


            if (NewsInfoList.Columns.Count == 0)
                _SetDataTableFrame();
            DataView myDV;
            lock (CommonData.NewsInfoList)
            {
                myDV = new DataView(CommonData.NewsInfoList, "NewsID='" + newsID + "'", "NewsID", DataViewRowState.CurrentRows);

                //数据操作
                if (myDV.Count == 0)
                {
                    IDataReader reader = CommonData.DalPublish.GetNewsDetail(0, newsID);
                    reader.Read();
                    _setNewsInfoDataRow(reader);
                    return _setNewsInfos(reader);
                }
                else
                {
                    DataRowView viewInfo = myDV[0];
                    return _setNewsInfos(viewInfo);
                }
            }
        }

        public static Hg.Model.NewsContent getNewsInfoById(int id)
        {
            if (NewsInfoList.Columns.Count == 0)
                _SetDataTableFrame();
            DataView myDV;
            lock (CommonData.NewsInfoList)
            {
                myDV = new DataView(CommonData.NewsInfoList, "ID='" + id + "'", "ID", DataViewRowState.CurrentRows);

                //数据操作
                if (myDV.Count == 0)
                {
                    IDataReader reader = CommonData.DalPublish.GetNewsDetail(id, "");
                    reader.Read();
                    _setNewsInfoDataRow(reader);
                    return _setNewsInfos(reader);
                }
                else
                {
                    DataRowView viewInfo = myDV[0];
                    return _setNewsInfos(viewInfo);
                }
                
                //DataRow[] rowList = CommonData.NewsInfoList.Select("ID='" + id + "'");
                //if (rowList.Length == 0)
                //{
                //    IDataReader reader = CommonData.DalPublish.GetNewsDetail(id, "");
                //    reader.Read();
                //    _setNewsInfoDataRow(reader);
                //    return _setNewsInfos(reader);
                //}
                //else
                //{
                //    return _setNewsInfos(rowList[0]);
                //}
            } 
        }

        /// <summary>
        /// 清空缓存
        /// </summary>
        public static void DisposeSystemCatch()
        {
            NewsClass.Clear();
            NewsSpecial.Clear();
            CHClass.Clear();
            CHSpecial.Clear();
            //清除标签缓存
            CustomLabel._lableTableInfo.Clear();
            //清除新闻缓存
            if (NewsInfoList != null)
            {
                NewsInfoList.Clear();
                NewsInfoList.Dispose();
            }
        }

        /// <summary>
        /// 设置新闻表结构
        /// </summary>
        private static void _SetDataTableFrame()
        {
            if (NewsInfoList == null)
                NewsInfoList = new DataTable();
            if (NewsInfoList.Columns.Count == 0)
            {
                NewsInfoList.Columns.Add("Id");
                NewsInfoList.Columns.Add("NewsID");
                NewsInfoList.Columns.Add("NewsType");
                NewsInfoList.Columns.Add("OrderID");
                NewsInfoList.Columns.Add("NewsTitle");
                NewsInfoList.Columns.Add("sNewsTitle");
                NewsInfoList.Columns.Add("TitleColor");
                NewsInfoList.Columns.Add("TitleITF");
                NewsInfoList.Columns.Add("TitleBTF");
                NewsInfoList.Columns.Add("CommLinkTF");
                NewsInfoList.Columns.Add("SubNewsTF");
                NewsInfoList.Columns.Add("URLaddress");
                NewsInfoList.Columns.Add("PicURL");
                NewsInfoList.Columns.Add("SPicURL");
                NewsInfoList.Columns.Add("ClassID");
                NewsInfoList.Columns.Add("SpecialID");
                NewsInfoList.Columns.Add("Author");
                NewsInfoList.Columns.Add("Souce");
                NewsInfoList.Columns.Add("Tags");
                NewsInfoList.Columns.Add("NewsProperty");
                NewsInfoList.Columns.Add("NewsPicTopline");
                NewsInfoList.Columns.Add("Templet");
                NewsInfoList.Columns.Add("Content");
                NewsInfoList.Columns.Add("Metakeywords");
                NewsInfoList.Columns.Add("Metadesc");
                NewsInfoList.Columns.Add("naviContent");
                NewsInfoList.Columns.Add("Click");
                NewsInfoList.Columns.Add("CreatTime");
                NewsInfoList.Columns.Add("EditTime");
                NewsInfoList.Columns.Add("SavePath");
                NewsInfoList.Columns.Add("FileName");
                NewsInfoList.Columns.Add("FileEXName");
                NewsInfoList.Columns.Add("isDelPoint");
                NewsInfoList.Columns.Add("Gpoint");
                NewsInfoList.Columns.Add("iPoint");
                NewsInfoList.Columns.Add("GroupNumber");
                NewsInfoList.Columns.Add("ContentPicTF");
                NewsInfoList.Columns.Add("ContentPicURL");
                NewsInfoList.Columns.Add("ContentPicSize");
                NewsInfoList.Columns.Add("CommTF");
                NewsInfoList.Columns.Add("DiscussTF");
                NewsInfoList.Columns.Add("TopNum");
                NewsInfoList.Columns.Add("VoteTF");
                NewsInfoList.Columns.Add("CheckStat");
                NewsInfoList.Columns.Add("isLock");
                NewsInfoList.Columns.Add("isRecyle");
                NewsInfoList.Columns.Add("SiteID");
                NewsInfoList.Columns.Add("DataLib");
                NewsInfoList.Columns.Add("DefineID");
                NewsInfoList.Columns.Add("isVoteTF");
                NewsInfoList.Columns.Add("Editor");
                NewsInfoList.Columns.Add("isHtml");
                NewsInfoList.Columns.Add("isConstr");
                NewsInfoList.Columns.Add("isFiles");
                NewsInfoList.Columns.Add("vURL");
            }
        }
        private static void _setNewsInfoDataRow(IDataReader rd)
        {
            if (NewsInfoList == null || NewsInfoList.Columns.Count == 0)
            {
                NewsInfoList = CommonData.DalPublish.GetNewsListByAll("'" + rd["NewsID"].ToString() + "'");
            }

            DataRow dr = NewsInfoList.NewRow();
            dr["ID"] = Convert.ToInt32(rd["ID"]);

            dr["NewsID"] = Convert.ToString(rd["NewsID"]);
            dr["NewsType"] = Convert.ToByte(rd["NewsType"]);
            dr["OrderID"] = Convert.ToByte(rd["OrderID"]);
            dr["NewsTitle"] = Convert.ToString(rd["NewsTitle"]);

            if (rd["sNewsTitle"] == DBNull.Value) { dr["sNewsTitle"] = ""; } else { dr["sNewsTitle"] = Convert.ToString(rd["sNewsTitle"]); }
            if (rd["TitleColor"] == DBNull.Value) { dr["TitleColor"] = ""; } else { dr["TitleColor"] = Convert.ToString(rd["TitleColor"]); }
            dr["TitleITF"] = Convert.ToByte(rd["TitleITF"]);
            if (rd["TitleBTF"] == DBNull.Value) { dr["TitleBTF"] = 0; } else { dr["TitleBTF"] = Convert.ToByte(rd["TitleBTF"]); }
            if (rd["CommLinkTF"] == DBNull.Value) { dr["CommLinkTF"] = 0; } else { dr["CommLinkTF"] = Convert.ToByte(rd["CommLinkTF"]); }
            if (rd["SubNewsTF"] == DBNull.Value) { dr["SubNewsTF"] = 0; } else { dr["SubNewsTF"] = Convert.ToByte(rd["SubNewsTF"]); }
            if (rd["URLaddress"] == DBNull.Value) { dr["URLaddress"] = ""; } else { dr["URLaddress"] = Convert.ToString(rd["URLaddress"]); }
            if (rd["PicURL"] == DBNull.Value) { dr["PicURL"] = ""; } else { dr["PicURL"] = Convert.ToString(rd["PicURL"]); }
            if (rd["SPicURL"] == DBNull.Value) { dr["SPicURL"] = ""; } else { dr["SPicURL"] = Convert.ToString(rd["SPicURL"]); }
            dr["ClassID"] = Convert.ToString(rd["ClassID"]);
            if (rd["SpecialID"] == DBNull.Value) { dr["SpecialID"] = ""; } else { dr["SpecialID"] = Convert.ToString(rd["SpecialID"]); }
            if (rd["Author"] == DBNull.Value) { dr["Author"] = ""; } else { dr["Author"] = Convert.ToString(rd["Author"]); }
            if (rd["Souce"] == DBNull.Value) { dr["Souce"] = ""; } else { dr["Souce"] = Convert.ToString(rd["Souce"]); }
            if (rd["Tags"] == DBNull.Value) { dr["Tags"] = ""; } else { dr["Tags"] = Convert.ToString(rd["Tags"]); }
            dr["NewsProperty"] = Convert.ToString(rd["NewsProperty"]);
            dr["NewsPicTopline"] = Convert.ToByte(rd["NewsPicTopline"]);
            if (rd["Templet"] == DBNull.Value) { dr["Templet"] = ""; } else { dr["Templet"] = Convert.ToString(rd["Templet"]); }
            if (rd["Content"] == DBNull.Value) { dr["Content"] = ""; } else { dr["Content"] = Convert.ToString(rd["Content"]); }
            if (rd["Metakeywords"] == DBNull.Value) { dr["Metakeywords"] = ""; } else { dr["Metakeywords"] = Convert.ToString(rd["Metakeywords"]); }
            if (rd["Metadesc"] == DBNull.Value) { dr["Metadesc"] = ""; } else { dr["Metadesc"] = Convert.ToString(rd["Metadesc"]); }
            if (rd["naviContent"] == DBNull.Value) { dr["naviContent"] = ""; } else { dr["naviContent"] = Convert.ToString(rd["naviContent"]); }
            dr["Click"] = Convert.ToInt32(rd["Click"]);
            dr["CreatTime"] = Convert.ToDateTime(rd["CreatTime"]);
            if (rd["EditTime"] == DBNull.Value) { dr["EditTime"] = Convert.ToDateTime(rd["CreatTime"]); } else { dr["EditTime"] = Convert.ToDateTime(rd["EditTime"]); }
            if (rd["SavePath"] == DBNull.Value) { dr["SavePath"] = ""; } else { dr["SavePath"] = Convert.ToString(rd["SavePath"]); }
            dr["FileName"] = Convert.ToString(rd["FileName"]);
            dr["FileEXName"] = Convert.ToString(rd["FileEXName"]);
            dr["isDelPoint"] = Convert.ToByte(rd["isDelPoint"]);
            dr["Gpoint"] = Convert.ToInt32(rd["Gpoint"]);
            dr["iPoint"] = Convert.ToInt32(rd["iPoint"]);
            if (rd["GroupNumber"] == DBNull.Value) { dr["GroupNumber"] = ""; } else { dr["GroupNumber"] = Convert.ToString(rd["GroupNumber"]); }
            dr["ContentPicTF"] = Convert.ToByte(rd["ContentPicTF"]);
            if (rd["ContentPicURL"] == DBNull.Value) { dr["ContentPicURL"] = ""; } else { dr["ContentPicURL"] = Convert.ToString(rd["ContentPicURL"]); }
            if (rd["ContentPicSize"] == DBNull.Value) { dr["ContentPicSize"] = ""; } else { dr["ContentPicSize"] = Convert.ToString(rd["ContentPicSize"]); }
            dr["CommTF"] = Convert.ToByte(rd["CommTF"]);
            dr["DiscussTF"] = Convert.ToByte(rd["DiscussTF"]);
            dr["TopNum"] = Convert.ToInt32(rd["TopNum"]);
            dr["VoteTF"] = Convert.ToByte(rd["VoteTF"]);
            if (rd["CheckStat"] == DBNull.Value) { dr["CheckStat"] = ""; } else { dr["CheckStat"] = Convert.ToString(rd["CheckStat"]); }
            dr["isLock"] = Convert.ToByte(rd["isLock"]);
            dr["isRecyle"] = Convert.ToByte(rd["isRecyle"]);
            dr["SiteID"] = Convert.ToString(rd["SiteID"]);
            dr["DataLib"] = Convert.ToString(rd["DataLib"]);
            if (rd["DefineID"] == DBNull.Value) { dr["DefineID"] = 0; } else { dr["DefineID"] = Convert.ToByte(rd["DefineID"]); }
            dr["isVoteTF"] = Convert.ToByte(rd["isVoteTF"]);
            if (rd["Editor"] == DBNull.Value) { dr["Editor"] = ""; } else { dr["Editor"] = Convert.ToString(rd["Editor"]); }
            dr["isHtml"] = Convert.ToByte(rd["isHtml"]);
            dr["isConstr"] = Convert.ToByte(rd["isConstr"]);
            if (rd["isFiles"] == DBNull.Value) { dr["isFiles"] = 0; } else { dr["isFiles"] = Convert.ToByte(rd["isFiles"]); }
            if (rd["vURL"] == DBNull.Value) { dr["vURL"] = ""; } else { dr["vURL"] = Convert.ToString(rd["vURL"]); }

            NewsInfoList.Rows.Add(dr);
        }
        private static Hg.Model.NewsContent _setNewsInfos(IDataReader rd)
        {
            Hg.Model.NewsContent Nci = new Hg.Model.NewsContent();
            Nci.ID = Convert.ToInt32(rd["ID"]);
            Nci.NewsID = Convert.ToString(rd["NewsID"]);
            Nci.NewsType = Convert.ToByte(rd["NewsType"]);
            Nci.OrderID = Convert.ToByte(rd["OrderID"]);
            Nci.NewsTitle = Convert.ToString(rd["NewsTitle"]);
            if (rd["sNewsTitle"] == DBNull.Value) { Nci.sNewsTitle = ""; } else { Nci.sNewsTitle = Convert.ToString(rd["sNewsTitle"]); }
            if (rd["TitleColor"] == DBNull.Value) { Nci.TitleColor = ""; } else { Nci.TitleColor = Convert.ToString(rd["TitleColor"]); }
            Nci.TitleITF = Convert.ToByte(rd["TitleITF"]);
            if (rd["TitleBTF"] == DBNull.Value) { Nci.TitleBTF = 0; } else { Nci.TitleBTF = Convert.ToByte(rd["TitleBTF"]); }
            if (rd["CommLinkTF"] == DBNull.Value) { Nci.CommLinkTF = 0; } else { Nci.CommLinkTF = Convert.ToByte(rd["CommLinkTF"]); }
            if (rd["SubNewsTF"] == DBNull.Value) { Nci.SubNewsTF = 0; } else { Nci.SubNewsTF = Convert.ToByte(rd["SubNewsTF"]); }
            if (rd["URLaddress"] == DBNull.Value) { Nci.URLaddress = ""; } else { Nci.URLaddress = Convert.ToString(rd["URLaddress"]); }
            if (rd["PicURL"] == DBNull.Value) { Nci.PicURL = ""; } else { Nci.PicURL = Convert.ToString(rd["PicURL"]); }
            if (rd["SPicURL"] == DBNull.Value) { Nci.SPicURL = ""; } else { Nci.SPicURL = Convert.ToString(rd["SPicURL"]); }
            Nci.ClassID = Convert.ToString(rd["ClassID"]);
            if (rd["SpecialID"] == DBNull.Value) { Nci.SpecialID = ""; } else { Nci.SpecialID = Convert.ToString(rd["SpecialID"]); }
            if (rd["Author"] == DBNull.Value) { Nci.Author = ""; } else { Nci.Author = Convert.ToString(rd["Author"]); }
            if (rd["Souce"] == DBNull.Value) { Nci.Souce = ""; } else { Nci.Souce = Convert.ToString(rd["Souce"]); }
            if (rd["Tags"] == DBNull.Value) { Nci.Tags = ""; } else { Nci.Tags = Convert.ToString(rd["Tags"]); }
            Nci.NewsProperty = Convert.ToString(rd["NewsProperty"]);
            Nci.NewsPicTopline = Convert.ToByte(rd["NewsPicTopline"]);
            if (rd["Templet"] == DBNull.Value) { Nci.Templet = ""; } else { Nci.Templet = Convert.ToString(rd["Templet"]); }
            if (rd["Content"] == DBNull.Value) { Nci.Content = ""; } else { Nci.Content = Convert.ToString(rd["Content"]); }
            if (rd["Metakeywords"] == DBNull.Value) { Nci.Metakeywords = ""; } else { Nci.Metakeywords = Convert.ToString(rd["Metakeywords"]); }
            if (rd["Metadesc"] == DBNull.Value) { Nci.Metadesc = ""; } else { Nci.Metadesc = Convert.ToString(rd["Metadesc"]); }
            if (rd["naviContent"] == DBNull.Value) { Nci.naviContent = ""; } else { Nci.naviContent = Convert.ToString(rd["naviContent"]); }
            Nci.Click = Convert.ToInt32(rd["Click"]);
            Nci.CreatTime = Convert.ToDateTime(rd["CreatTime"]);
            if (rd["EditTime"] == DBNull.Value) { Nci.EditTime = Convert.ToDateTime(rd["CreatTime"]); } else { Nci.EditTime = Convert.ToDateTime(rd["EditTime"]); }
            if (rd["SavePath"] == DBNull.Value) { Nci.SavePath = ""; } else { Nci.SavePath = Convert.ToString(rd["SavePath"]); }
            Nci.FileName = Convert.ToString(rd["FileName"]);
            Nci.FileEXName = Convert.ToString(rd["FileEXName"]);
            Nci.isDelPoint = Convert.ToByte(rd["isDelPoint"]);
            Nci.Gpoint = Convert.ToInt32(rd["Gpoint"]);
            Nci.iPoint = Convert.ToInt32(rd["iPoint"]);
            if (rd["GroupNumber"] == DBNull.Value) { Nci.GroupNumber = ""; } else { Nci.GroupNumber = Convert.ToString(rd["GroupNumber"]); }
            Nci.ContentPicTF = Convert.ToByte(rd["ContentPicTF"]);
            if (rd["ContentPicURL"] == DBNull.Value) { Nci.ContentPicURL = ""; } else { Nci.ContentPicURL = Convert.ToString(rd["ContentPicURL"]); }
            if (rd["ContentPicSize"] == DBNull.Value) { Nci.ContentPicSize = ""; } else { Nci.ContentPicSize = Convert.ToString(rd["ContentPicSize"]); }
            Nci.CommTF = Convert.ToByte(rd["CommTF"]);
            Nci.DiscussTF = Convert.ToByte(rd["DiscussTF"]);
            Nci.TopNum = Convert.ToInt32(rd["TopNum"]);
            Nci.VoteTF = Convert.ToByte(rd["VoteTF"]);
            if (rd["CheckStat"] == DBNull.Value) { Nci.CheckStat = ""; } else { Nci.CheckStat = Convert.ToString(rd["CheckStat"]); }
            Nci.isLock = Convert.ToByte(rd["isLock"]);
            Nci.isRecyle = Convert.ToByte(rd["isRecyle"]);
            Nci.SiteID = Convert.ToString(rd["SiteID"]);
            Nci.DataLib = Convert.ToString(rd["DataLib"]);
            if (rd["DefineID"] == DBNull.Value) { Nci.DefineID = 0; } else { Nci.DefineID = Convert.ToByte(rd["DefineID"]); }
            Nci.isVoteTF = Convert.ToByte(rd["isVoteTF"]);
            if (rd["Editor"] == DBNull.Value) { Nci.Editor = ""; } else { Nci.Editor = Convert.ToString(rd["Editor"]); }
            Nci.isHtml = Convert.ToByte(rd["isHtml"]);
            Nci.isConstr = Convert.ToByte(rd["isConstr"]);
            if (rd["isFiles"] == DBNull.Value) { Nci.isFiles = 0; } else { Nci.isFiles = Convert.ToByte(rd["isFiles"]); }
            if (rd["vURL"] == DBNull.Value) { Nci.vURL = ""; } else { Nci.vURL = Convert.ToString(rd["vURL"]); }

            rd.Close();
            return Nci;
        }
        private static Hg.Model.NewsContent _setNewsInfos(DataRowView rd)
        {
            Hg.Model.NewsContent Nci = new Hg.Model.NewsContent();
            if (rd != null)
            {
                Nci.ID = Convert.ToInt32(rd["ID"]);
                Nci.NewsID = Convert.ToString(rd["NewsID"]);
                Nci.NewsType = Convert.ToByte(rd["NewsType"]);
                Nci.OrderID = Convert.ToByte(rd["OrderID"]);
                Nci.NewsTitle = Convert.ToString(rd["NewsTitle"]);
                if (rd["sNewsTitle"] == DBNull.Value) { Nci.sNewsTitle = ""; } else { Nci.sNewsTitle = Convert.ToString(rd["sNewsTitle"]); }
                if (rd["TitleColor"] == DBNull.Value) { Nci.TitleColor = ""; } else { Nci.TitleColor = Convert.ToString(rd["TitleColor"]); }
                Nci.TitleITF = Convert.ToByte(rd["TitleITF"]);
                if (rd["TitleBTF"] == DBNull.Value) { Nci.TitleBTF = 0; } else { Nci.TitleBTF = Convert.ToByte(rd["TitleBTF"]); }
                if (rd["CommLinkTF"] == DBNull.Value) { Nci.CommLinkTF = 0; } else { Nci.CommLinkTF = Convert.ToByte(rd["CommLinkTF"]); }
                if (rd["SubNewsTF"] == DBNull.Value) { Nci.SubNewsTF = 0; } else { Nci.SubNewsTF = Convert.ToByte(rd["SubNewsTF"]); }
                if (rd["URLaddress"] == DBNull.Value) { Nci.URLaddress = ""; } else { Nci.URLaddress = Convert.ToString(rd["URLaddress"]); }
                if (rd["PicURL"] == DBNull.Value) { Nci.PicURL = ""; } else { Nci.PicURL = Convert.ToString(rd["PicURL"]); }
                if (rd["SPicURL"] == DBNull.Value) { Nci.SPicURL = ""; } else { Nci.SPicURL = Convert.ToString(rd["SPicURL"]); }
                Nci.ClassID = Convert.ToString(rd["ClassID"]);
                if (rd["SpecialID"] == DBNull.Value) { Nci.SpecialID = ""; } else { Nci.SpecialID = Convert.ToString(rd["SpecialID"]); }
                if (rd["Author"] == DBNull.Value) { Nci.Author = ""; } else { Nci.Author = Convert.ToString(rd["Author"]); }
                if (rd["Souce"] == DBNull.Value) { Nci.Souce = ""; } else { Nci.Souce = Convert.ToString(rd["Souce"]); }
                if (rd["Tags"] == DBNull.Value) { Nci.Tags = ""; } else { Nci.Tags = Convert.ToString(rd["Tags"]); }
                Nci.NewsProperty = Convert.ToString(rd["NewsProperty"]);
                Nci.NewsPicTopline = Convert.ToByte(rd["NewsPicTopline"]);
                if (rd["Templet"] == DBNull.Value) { Nci.Templet = ""; } else { Nci.Templet = Convert.ToString(rd["Templet"]); }
                if (rd["Content"] == DBNull.Value) { Nci.Content = ""; } else { Nci.Content = Convert.ToString(rd["Content"]); }
                if (rd["Metakeywords"] == DBNull.Value) { Nci.Metakeywords = ""; } else { Nci.Metakeywords = Convert.ToString(rd["Metakeywords"]); }
                if (rd["Metadesc"] == DBNull.Value) { Nci.Metadesc = ""; } else { Nci.Metadesc = Convert.ToString(rd["Metadesc"]); }
                if (rd["naviContent"] == DBNull.Value) { Nci.naviContent = ""; } else { Nci.naviContent = Convert.ToString(rd["naviContent"]); }
                Nci.Click = Convert.ToInt32(rd["Click"]);
                Nci.CreatTime = Convert.ToDateTime(rd["CreatTime"]);
                if (rd["EditTime"] == DBNull.Value) { Nci.EditTime = Convert.ToDateTime(rd["CreatTime"]); } else { Nci.EditTime = Convert.ToDateTime(rd["EditTime"]); }
                if (rd["SavePath"] == DBNull.Value) { Nci.SavePath = ""; } else { Nci.SavePath = Convert.ToString(rd["SavePath"]); }
                Nci.FileName = Convert.ToString(rd["FileName"]);
                Nci.FileEXName = Convert.ToString(rd["FileEXName"]);
                Nci.isDelPoint = Convert.ToByte(rd["isDelPoint"]);
                Nci.Gpoint = Convert.ToInt32(rd["Gpoint"]);
                Nci.iPoint = Convert.ToInt32(rd["iPoint"]);
                if (rd["GroupNumber"] == DBNull.Value) { Nci.GroupNumber = ""; } else { Nci.GroupNumber = Convert.ToString(rd["GroupNumber"]); }
                Nci.ContentPicTF = Convert.ToByte(rd["ContentPicTF"]);
                if (rd["ContentPicURL"] == DBNull.Value) { Nci.ContentPicURL = ""; } else { Nci.ContentPicURL = Convert.ToString(rd["ContentPicURL"]); }
                if (rd["ContentPicSize"] == DBNull.Value) { Nci.ContentPicSize = ""; } else { Nci.ContentPicSize = Convert.ToString(rd["ContentPicSize"]); }
                Nci.CommTF = Convert.ToByte(rd["CommTF"]);
                Nci.DiscussTF = Convert.ToByte(rd["DiscussTF"]);
                Nci.TopNum = Convert.ToInt32(rd["TopNum"]);
                Nci.VoteTF = Convert.ToByte(rd["VoteTF"]);
                if (rd["CheckStat"] == DBNull.Value) { Nci.CheckStat = ""; } else { Nci.CheckStat = Convert.ToString(rd["CheckStat"]); }
                Nci.isLock = Convert.ToByte(rd["isLock"]);
                Nci.isRecyle = Convert.ToByte(rd["isRecyle"]);
                Nci.SiteID = Convert.ToString(rd["SiteID"]);
                Nci.DataLib = Convert.ToString(rd["DataLib"]);
                if (rd["DefineID"] == DBNull.Value) { Nci.DefineID = 0; } else { Nci.DefineID = Convert.ToByte(rd["DefineID"]); }
                Nci.isVoteTF = Convert.ToByte(rd["isVoteTF"]);
                if (rd["Editor"] == DBNull.Value) { Nci.Editor = ""; } else { Nci.Editor = Convert.ToString(rd["Editor"]); }
                Nci.isHtml = Convert.ToByte(rd["isHtml"]);
                Nci.isConstr = Convert.ToByte(rd["isConstr"]);
                if (rd["isFiles"] == DBNull.Value) { Nci.isFiles = 0; } else { Nci.isFiles = Convert.ToByte(rd["isFiles"]); }
                if (rd["vURL"] == DBNull.Value) { Nci.vURL = ""; } else { Nci.vURL = Convert.ToString(rd["vURL"]); }
            }
            return Nci;
        }
    }
}
