using System;
using System.Data;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml;

using Foosun.Model;
using Foosun.CMS;
using Foosun.CMS.Common;
using System.Web.Caching;
using System.Text;
using Foosun.Publish;
using System.Collections.Generic;


namespace Foosun.Web.manageXXBN.news
{
    /// <summary>
    /// Summary description for $codebehindclassname$
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class BatchAddNewsHandler : IHttpHandler
    {


        public void ProcessRequest(HttpContext context)
        {
            
            context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");

            string files = context.Request.Form["files"];

            string[] fileList = files.Split(',');

            ContentManage rd = new ContentManage();
            rootPublic pd = new rootPublic();

            DataTable dtColumnMap = rd.GetAllColumnMap();

            int cnt = 0;
            foreach (string f in fileList)
            {
                if (!String.IsNullOrEmpty(f) && f.EndsWith(".xml"))
                {
                    NewsInfo news = CreateNewsInfo(f);

                    if ( String.IsNullOrEmpty( news.Column) || news.Column == "没选择栏目" )
                    {
                        continue;
                    }
                    if (string.IsNullOrEmpty(news.Title))
                    {
                        continue;
                    }

                    DataRow[] rows = dtColumnMap.Select("CpClassName = '" + news.Column +"'" + " AND Media = '" + news.Media + "'");
                    if (rows.Length == 0)
                    {
                        continue;
                    }
                    news.ColumnId = rows[0]["SiteClassId"].ToString();

                    // 得到NewsContent
                    Foosun.Model.NewsContent uc = CreateNews(news, rd, pd);

                    if (uc == null)
                    {
                        continue;
                    }

                    // 如果新闻带附件，将附件备份到指定的目录
                    if (!String.IsNullOrEmpty(news.Attachment))
                    {
                        string doc = context.Server.MapPath("~/") + Foosun.Config.UIConfig.dirFile + "\\doc";
                        if (!System.IO.Directory.Exists(doc))
                        {
                            System.IO.Directory.CreateDirectory(doc);
                        }

                        string todayPath = doc + "\\" + DateTime.Now.ToString("yyyyMMdd") + "\\";
                        if (!System.IO.Directory.Exists(todayPath))
                        {
                            System.IO.Directory.CreateDirectory(todayPath);
                        }

                        // 共享给采编的共享文件夹，采编程序将签发到网站的新闻复制到此文件夹
                        string srcPath = context.Server.MapPath("~/") + Foosun.Config.UIConfig.dirFile + "\\" + Foosun.Config.UIConfig.CpsnDir + "\\";

                        if (System.IO.File.Exists(srcPath + news.Attachment))
                        {
                            if (System.IO.File.Exists(todayPath + news.Attachment))
                            {
                                //System.IO.File.Move(srcPath + news.Attachment, todayPath + news.Attachment); // todayPath + news.Attachment.Remove(news.Attachment.LastIndexOf('\\'))
                                if ((System.IO.File.GetAttributes(srcPath + news.Attachment) & System.IO.FileAttributes.ReadOnly) == System.IO.FileAttributes.ReadOnly)
                                {
                                    try
                                    {
                                        System.IO.File.SetAttributes(srcPath + news.Attachment, System.IO.FileAttributes.Archive);//~FileAttributes.ReadOnly
                                    }
                                    catch (UnauthorizedAccessException ex)
                                    {
                                        throw new UnauthorizedAccessException("您没有权限删除过时的" + ex.Message, ex.InnerException);
                                    }
                                }
                                System.IO.File.Delete(srcPath + news.Attachment);
                            }
                            else
                            {
                                System.IO.File.Move(srcPath + news.Attachment, todayPath + news.Attachment.Replace(" ", "")); // todayPath + news.Attachment.Remove(news.Attachment.LastIndexOf('\\'))
                            }

                            string url = "/" + Foosun.Config.UIConfig.dirFile + "/doc/" + DateTime.Now.ToString("yyyyMMdd") + "/" + news.Attachment.Replace(" ", "");//.Remove(news.Attachment.LastIndexOf('\\')

                            // 根据文档类型，修改新闻的内容
                            uc.Content = ChangeContent(uc.Content, news.DocumentType, url);
                        }
                    }
                    

                    // 将新闻插入数据库中
                    rd.insertNewsContent(uc);

                    // 生成静态页面
                    Foosun.Publish.General pn = new Foosun.Publish.General();
                    //pn.publishSingleClass(uc.ClassID);
                    Foosun.Publish.General.publishSingleNews(uc.NewsID, uc.ClassID, false);

                    // 删除已经用过的文件
                    System.IO.File.Delete(f);
                    if(System.IO.Directory.GetFileSystemEntries(f.Remove(f.LastIndexOf('\\'))).Length == 0)
                    {
                        System.IO.Directory.Delete(f.Remove(f.LastIndexOf('/')));
                    }

                    cnt++;
                }
            }

            // GetClassParamTable

            // 同时发布首页和栏目
            // PublishHome();
            // PublishClass();
            if (cnt > 0)
            {
                Publish();
                context.Response.Clear();
                //context.Response.Write("success");
                context.Response.End();
            }
            else
            {
                context.Response.Write("您选中的文档没有标题，或者栏目不合适。如果您还没有设置与采编系统的栏目对应关系，请先设置。");
                context.Response.End();
            }

            
        }

        #region 生成新闻对象

        private Foosun.Model.NewsContent CreateNews(NewsInfo news, Foosun.CMS.ContentManage manager, rootPublic pd)
        {
            Foosun.Model.NewsContent uc = new Foosun.Model.NewsContent();

            //uc.ClassID = manager.GetClassId(news.Column);
            uc.ClassID = news.ColumnId;

            if (uc.ClassID == "没选择栏目")
            {
                return null;
            }

            string dataLibStr = "";
            dataLibStr = manager.getDataLib(uc.ClassID);
            uc.DataLib = dataLibStr;

            uc.NewsType = 0; // 新闻类型,0普通，1图片，2标题
            uc.OrderID = 0; // 新闻权重。1-50的数字。0为置顶。数字越小，权重越高
            uc.NewsTitle = news.Title;
            uc.NewsTitleRefer = news.ReplaceableTitle;
            uc.sNewsTitle = news.SubTitle;
            uc.TitleColor = "";
            uc.TitleITF = 0;
            uc.TitleBTF = 0;
            uc.CommLinkTF = 0;
            uc.SubNewsTF = 0;
            uc.URLaddress = "";
            uc.PicURL = news.Attachment;
            uc.SPicURL = "";

            uc.SpecialID = "";
            uc.Author = news.Author;
            uc.Souce = news.Source;
            uc.Tags = news.Tag;
            uc.NewsProperty = "0,0,0,0,0,0,0,0";

            uc.Templet = GetTemplate(manager, uc.ClassID);
            uc.Content = news.Content;
            uc.vURL = news.VideoUrl;
            uc.naviContent = "";
            uc.Click = 0;
            uc.Metakeywords = "";
            uc.Metadesc = "";

            uc.ContentPicTF = 0;
            uc.ContentPicURL = news.Attachment; // 
            uc.ContentPicSize = "300|300";
            uc.CommTF = 0;
            uc.DiscussTF = 0;
            uc.TopNum = 0;
            uc.VoteTF = 0;
            uc.isDelPoint = 0;
            uc.iPoint = 0;
            uc.Gpoint = 0;
            uc.GroupNumber = "";

            uc.NewsPicTopline = 0;

            uc.DefineID = 0; // 是否有自定义字段

            uc.SiteID = "0";
            uc.isFiles = 0;
            uc.SubNewsTF = 0;

            uc.SavePath = pd.getResultPage(GetSavePath(manager, uc.ClassID), DateTime.Now, uc.ClassID, "");
            string tmID = "{@自动编号ID}";
            uc.FileName = pd.getResultPage(GetFileName(manager, uc.ClassID).Replace(tmID, (GetMaxNewId(manager, uc.DataLib) + 1).ToString()), DateTime.Now, uc.ClassID, "");
            uc.FileEXName = ".html";
            uc.CheckStat = "0|0|0|0";
            uc.isRecyle = 0;
            //创建时间
            uc.CreatTime = DateTime.Now;
            uc.EditTime = DateTime.Now;

            //更新栏目状态
            manager.updateClassStat(0, uc.ClassID);
            uc.isHtml = 0;

            uc.NewsID = GetNewId(manager, uc.DataLib);

            uc.CommTF = 0;
            uc.Editor = GetEditor(pd);
            uc.isLock = 0;
            uc.isVoteTF = 0;
            uc.isConstr = 0;
            uc.SpecialID = news.Subject;

            return uc;
        }

        private DataTable GetClassParamTable(ContentManage manager, string classId)
        {
            DataTable dt = manager.getClassParam(classId);
            //DataTable dt = HttpContext.Current.Cache["ClassParamTable"] as DataTable;
            //if (dt == null)
            //{
            //    dt = rd.getClassParam(ClassID);
            //    HttpContext.Current.Cache.Add("ClassParamTable", dt, null, DateTime.Now.AddSeconds(5), Cache.NoSlidingExpiration, CacheItemPriority.Default, null);
            //}
            return dt;
        }

        private int GetMaxNewId(ContentManage manager, string dataLib)
        {
            #region 得到当前新闻的上一条记录自动编号ID
            int _IDStr = 0;
            DataTable dts = manager.getTopNewsId(dataLib);
            if (dts != null && dts.Rows.Count > 0)
            {
                _IDStr = int.Parse(dts.Rows[0]["Id"].ToString());
                dts.Clear(); 
                dts.Dispose();
            }
            else
            {
                _IDStr = int.Parse(Foosun.Common.Rand.Number(8));
            }

            return _IDStr;
            #endregion 结束
        }

        private void ClearClassParamTable()
        {
            HttpContext.Current.Cache.Remove("ClassParamTable");
        }

        private string GetTemplate(ContentManage manager, string classId)
        {
            DataTable dt = GetClassParamTable(manager, classId);
            return dt.Rows[0]["ReadNewsTemplet"].ToString();
        }

        private string GetSavePath(ContentManage manager, string classId)
        {
            DataTable dt = GetClassParamTable(manager, classId);
            return dt.Rows[0]["NewsSavePath"].ToString();
        }

        private string GetFileName(ContentManage manager, string classId)
        {
            DataTable dt = GetClassParamTable(manager, classId);
            return dt.Rows[0]["NewsFileRule"].ToString();
        }

        private string GetNewId(ContentManage manager, string dataLib)
        {
            string newsId = Foosun.Common.Rand.Number(12);

            int count = 1;
            while(count > 0)
            {
                DataTable rTF = manager.getNewsIDTF(newsId, dataLib);
                count = rTF.Rows.Count;
                if(count > 0)
                {
                    newsId = Foosun.Common.Rand.Number(12);
                }
                else
                {
                    rTF.Clear();
                    rTF.Dispose();
                    break;
                }
                rTF.Clear();
                rTF.Dispose();
            }

            return newsId;
        }

        private string GetEditor(rootPublic pd)
        {
            string number = Foosun.Global.Current.UserNum;
            return pd.getUserName(number);
        }

        #region Comment
        //private void PublishHome()
        //{
        //    string indexname = "index.html";
        //    string templetPath = Foosun.Common.Public.readparamConfig("IndexTemplet"); //rd["IndexTemplet"].ToString();
        //    string siteRootPath =Foosun.Common.ServerInfo.GetRootPath();
        //    templetPath = templetPath.Replace("/", "\\");
        //    templetPath = templetPath.ToLower().Replace("{@dirtemplet}", Foosun.Config.UIConfig.dirTemplet);
        //    indexname = Foosun.Common.Public.readparamConfig("IndexFileName");//rd["IndexFileName"].ToString();
        //    Foosun.Publish.Template indexTemp = new Foosun.Publish.Template(siteRootPath.Trim('\\') + templetPath, Foosun.Publish.TempType.Index);
        //    indexTemp.GetHTML();
        //    indexTemp.ReplaceLabels();
        //    Foosun.Publish.General.WriteHtml(indexTemp.FinallyContent, siteRootPath.TrimEnd('\\') + "\\" + indexname);
        //    Foosun.Publish.General.publishXML("0");
        //    //发布今日历史文档
        //    Foosun.Publish.General.publishHistryIndex(0);
        //}

        //private void PublishClass()
        //{
        //int nClassCount = 0;
        //string templetPath = "";//Foosun.Common.Public.readparamConfig("IndexTemplet"); //rd["IndexTemplet"].ToString();
        //string siteRootPath = Foosun.Common.ServerInfo.GetRootPath();
        //using (IDataReader rd = Foosun.Publish.CommonData.DalPublish.GetPublishClass(Foosun.Global.Current.SiteID, "", true, out nClassCount))
        //{
        //    int num = 0;
        //    int succeedNum = 0;
        //    int failedNum = 0;
        //    bool HasRows = false;
        //    string indexname = "index.html";
        //    indexname = Foosun.Common.Public.readparamConfig("IndexFileName");
        //    if (nClassCount > 0)
        //    {
        //        while (rd.Read())
        //        {
        //            HasRows = true;
        //            templetPath = rd["classtemplet"].ToString();
        //            templetPath = templetPath.Replace("/", "\\");
        //            templetPath = templetPath.ToLower().Replace("{@dirtemplet}", strTempletDir);
        //            string TmpsaveClassPath = "\\" + rd["savePath"].ToString().Trim('\\').Trim('/') + "\\" + rd["SaveClassframe"].ToString().Trim('\\').Trim('/') + '\\' + rd["ClassSaveRule"].ToString().Trim('\\').Trim('/');
        //            saveClassPath = TmpsaveClassPath.Replace("/", "\\");
        //            string strClassId = rd["classid"].ToString();
        //            bool state = publishSingleClass(strClassId, rd["Datalib"].ToString());
        //            if (fs_isClassIndex)
        //            {
        //                Foosun.Publish.General.publishClassIndex(strClassId);
        //            }
        //            num += 1;
        //            if (state)
        //            {
        //                succeedNum++;
        //            }
        //            else
        //            {
        //                failedNum++;
        //            }
        //            //string msg = string.Format(MsgFormat, "栏目", nClassCount.ToString(), ((int)num).ToString(), succeedNum.ToString(), failedNum.ToString(), "发布栏目成功&nbsp;&nbsp;<a class=\"list_link\" href=\"javascript:history.back();\">返 回</a>&nbsp;&nbsp;<a class=\"list_link\" href=\"../../" + indexname + "\" target=\"_blank\">浏览首页</a>");
        //            //HProgressBar.Roll(msg, (num * 100 / nClassCount));
        //        }
        //    }
        //}
        //if (templateList.Count != 0)
        //{
        //    templateList.Clear();
        //}
        //if (failedList.Count != 0)
        //{
        //    for (int i = 0; i < failedList.Count; i++)
        //    {
        //        Foosun.Common.Public.savePublicLogFiles("□□□发布栏目", "【ID】:" + failedList[i].Split('$')[0] + "\r\n【错误描述：】\r\n" + failedList[i].Split('$')[1], "");
        //    }
        //    failedList.Clear();
        //}
        //if (succeedList.Count != 0)
        //{
        //    updateNewsIsHtml(DBConfig.TableNamePrefix + "news_class", "isunHtml", "cLassID");
        //}

        //}


        //public bool publishSingleClass(string classID, string datalib)
        //{

        //try
        //{
        //    string SiteRootPath = Foosun.Common.ServerInfo.GetRootPath();
        //    string TempletPath = SiteRootPath.Trim('\\') + TempletPath;
        //    bool existFlag = false;
        //    string tmpPath = HttpContext.Current.Server.MapPath(saveClassPath);
        //    if (templateList.Count != 0)
        //    {
        //        foreach (Template temp in templateList)
        //        {
        //            if (TempletPath == temp.TempFilePath)
        //            {
        //                existFlag = true;
        //                temp.ClassID = classID;

        //                replaceTemp(temp, existFlag, tmpPath, classID, "class");
        //                break;
        //            }
        //        }
        //        if (!existFlag)
        //        {
        //            //Template classTemplate = new Template(TempletPath, TempType.Class);
        //            //classTemplate.ClassID = classID;
        //            //classTemplate.GetHTML();
        //            //string TmpPath = SiteRootPath + saveClassPath;
        //            //replaceTempg(classTemplate, TmpPath, classID, "class");

        //            Template classTemplate = new Template(TempletPath, TempType.Class);
        //            classTemplate.ClassID = classID;
        //            classTemplate.GetHTML();
        //            replaceTemp(classTemplate, existFlag, tmpPath, classID, "class");
        //        }
        //    }
        //    else
        //    {
        //        Template classTemplate = new Template(TempletPath, TempType.Class);
        //        classTemplate.ClassID = classID;
        //        classTemplate.GetHTML();
        //        replaceTemp(classTemplate, existFlag, tmpPath, classID, "class");
        //    }
        //    succeedList.Add(classID);
        //    return true;
        //}
        //catch (Exception e)
        //{
        //    failedList.Add(classID + "$" + e.Message);
        //    Foosun.Common.Public.savePublicLogFiles("□□□发布栏目", "【ID】:" + classID + "\r\n【错误描述：】\r\n" + e.ToString(), "");
        //    return false;
        //}
        //}
        #endregion

        #endregion

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public static NewsInfo CreateNewsInfo(string fileName)
        {
            NewsInfo news = new NewsInfo();
            using (XmlTextReader reader = new XmlTextReader(fileName))
            {
                string path = "";
                while (reader.Read())
                {
                    if (reader.NodeType == XmlNodeType.Element)
                    {
                        path = path + "/" + reader.Name;
                        GetValue(reader, news);
                    }
                    else
                    {
                        if (reader.NodeType == XmlNodeType.CDATA)
                        {
                            news.Content = reader.Value.Trim();
                        }
                        if (reader.NodeType == XmlNodeType.EndElement)
                        {
                            path = path.Remove(path.LastIndexOf('/'));
                        }
                    }
                }
                reader.Close();
            }

            return news;
        }

        public static void GetValue(XmlTextReader reader, NewsInfo news)
        {
            switch (reader.Name)
            {
                case "MediaName":
                    news.Media = reader.ReadElementString();
                    break;
                case "PublishDate":
                    if (reader.Value.Length > 7)
                    {
                        news.PublishDate = DateTime.Parse(reader.ReadElementString());
                    }
                    break;
                case "Column":
                    news.Column = reader.ReadElementString();
                    break;
                case "Type":
                    news.DocumentType = GetDocumentType(reader.ReadElementString());
                    break;
                case "MainTitle":
                    news.Title = reader.ReadElementString().Trim();
                    break;
                case "AuxTitle":
                    news.SubTitle = reader.ReadElementString().Trim();
                    break;
                case "ReplaceTitle":
                    news.ReplaceableTitle = reader.ReadElementString().Trim();
                    break;
                case "Name":
                    news.Author = reader.ReadElementString();
                    break;
                case "Catagory":
                    news.Catagory = reader.ReadElementString();
                    break;
                case "Path":
                    news.Attachment = reader.ReadElementString().Trim();
                    break;
                case "Property":
                    news.Properties = reader.ReadElementString();
                    break;
                case "ExaminedStatus":
                    if (reader.Value.Length > 0)
                    {
                        news.ExaminedStatus = Int32.Parse(reader.ReadElementString());
                    }
                    break;
                case "Tag":
                    news.Tag = reader.ReadElementString();
                    break;
                default:
                    break;
            }
        }

        private static DocumentType GetDocumentType(string docType)
        {
            DocumentType t = DocumentType.Text;
            switch (docType)
            {
                case "Text":
                    t = DocumentType.Text;
                    break;
                case "Photo":
                    t = DocumentType.Picture;
                    break;
                case "Video":
                    t = DocumentType.Video;
                    break;
                case "Audio":
                    t = DocumentType.Audio;
                    break;
                case "Application":
                    t = DocumentType.Application;
                    break;
                case "Chart":
                    t = DocumentType.Chart;
                    break;
                case "Complex":
                    t = DocumentType.Complex;
                    break;
                    

            }
            return t;
        }

        private void Publish()
        {
            UltiPublish publishAll = new UltiPublish(false);
            publishAll.IsPublishIndex = true;
            publishAll.IsPubNews = false;
            publishAll.IsPubClass = true;
            publishAll.IsPubSpecial = false;
            publishAll.IsPubIsPage = false;

            publishAll.newsFlag = 0;
            publishAll.strNewsParams = null;
            publishAll.ClassFlag = 0;
            publishAll.strClassParams = "#";
            publishAll.isClassIndex = false;
            publishAll.specialFlag = 1;
            publishAll.strSpecialParams = null;
            publishAll.StrClassIsPageParam = null;
            try
            {
                publishAll.StartPublish();
            }
            catch
            { }
            finally
            {
                publishAll.CloseAllConnection();
            }
        }

        public static string ChangeContent(string content, DocumentType docType, String url)
        {
            string c = "";
            switch (docType)
            {
                case DocumentType.Picture:
                    string header = String.Format("<div style=\"text-align:center\"><img height=\"284\" width=\"400\" border=\"0\" alt=\"\" src=\"{0}\" /></div>", url);
                    c = header + content;
                    break;
                case DocumentType.Text:
                    break;

                case DocumentType.Application:
                    string footer = String.Format("<div style=\"text-align:center\"><a alt=\"\" href=\"{0}\" >下载附件</a></div>", url);
                    c = content + footer;
                    break;
                case DocumentType.Audio:
                case DocumentType.Video:
                    c = GetVideoHtml(url) + "<br />" + content;
                    break;
                default:
                    break;
            }

            return c;
        }

        private static string GetVideoHtml(string url)
        {
            string extension = url.Substring(url.LastIndexOf('.'));
            string content = "";
            switch (extension.ToLower())
            {
                case ".jpg":
                case ".gif":
                case ".bmp":
                case ".ico":
                case ".png":
                case ".jpeg":
                case ".tif":
                case ".rar":
                case ".doc":
                case ".zip":
                case ".txt":
                    break;
                case ".swf":
                    content = "<object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0\" width=\"600\" height=\"400\">";
                    content += "<param name=\"movie\" value=\"" + url + "\" />";
                    content += "<param name=\"quality\" value=\"high\" />";
                    content += "<embed src=\"" + url + "\" quality=\"high\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" type=\"application/x-shockwave-flash\"></embed>";
                    content += "</object>";
                    //                   
                    break;
                case ".flv":
                    content = "<object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0\" width=\"500\" height=\"400\">" +
                    "<param name=\"movie\" value=\"<%Response.Write(getSiteRoot); %>/vcastr22.swf\">" +
                    "<param name=\"quality\" value=\"high\">" +
                    "<param name=\"allowFullScreen\" value=\"true\" />" +
                    "<param name=\"FlashVars\" value=\"vcastr_file=" + url + "\" />" +
                    "<embed src=\"<%Response.Write(getSiteRoot); %>/vcastr22.swf\" FlashVars=\"vcastr_file=" + url + "\" allowFullScreen=\"true\"  quality=\"high\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" type=\"application/x-shockwave-flash\" width=\"500\" height=\"400\"></embed>" +
                    "</object>";

                    break;
                case ".avi":
                    //                       
                    content = "<embed  src=\"" + url + "\" width=\"340\" height=\"240\"></embed>";
                    break;
                case ".wmv":

                    content = "<EMBED height=360 pluginspage=http://www.macromedia.com/go/getflashplayer " +
                            "src=" + url + " type=application/x-shockwave-flash width=500 wmode=\"transparent\" quality=\"high\"></EMBED> ";
                    break;
                case ".mpg":
                    content = "<object classid=\"clsid:05589FA1-C356-11CE-BF01-00AA0055595A\" id=\"ActiveMovie1\" width=\"500\"  >\r\n" +
                       "<param name=\"Appearance\" value=\"0\">\r\n" +
                       "<param name=\"AutoStart\" value=\"-1\">\r\n" +
                       "<param name=\"AllowChangeDisplayMode\" value=\"-1\">\r\n" +
                       "<param name=\"AllowHideDisplay\" value=\"0\">\r\n" +
                       "<param name=\"AllowHideControls\" value=\"-1\">\r\n" +
                       "<param name=\"AutoRewind\" value=\"-1\">\r\n" +
                       "<param name=\"Balance\" value=\"0\">\r\n" +
                       "<param name=\"CurrentPosition\" value=\"0\">\r\n" +
                       "<param name=\"DisplayBackColor\" value=\"0\">\r\n" +
                       "<param name=\"DisplayForeColor\" value=\"16777215\">\r\n" +
                       "<param name=\"DisplayMode\" value=\"0\">\r\n" +
                       "<param name=\"Enabled\" value=\"-1\">\r\n" +
                       "<param name=\"EnableContextMenu\" value=\"-1\">\r\n" +
                       "<param name=\"EnablePositionControls\" value=\"-1\">\r\n" +
                       "<param name=\"EnableSelectionControls\" value=\"0\">\r\n" +
                       "<param name=\"EnableTracker\" value=\"-1\">\r\n" +
                       "<param name=\"Filename\" value=\"" + url + "\" valuetype=\"ref\">\r\n" +
                       "<param name=\"FullScreenMode\" value=\"0\">\r\n" +
                       "<param name=\"MovieWindowSize\" value=\"0\">\r\n" +
                       "<param name=\"PlayCount\" value=\"1\">\r\n" +
                       "<param name=\"Rate\" value=\"1\">\r\n" +
                       "<param name=\"SelectionStart\" value=\"-1\">\r\n" +
                       "<param name=\"SelectionEnd\" value=\"-1\">\r\n" +
                       "<param name=\"ShowControls\" value=\"-1\">\r\n" +
                       "<param name=\"ShowDisplay\" value=\"-1\">\r\n" +
                       "<param name=\"ShowPositionControls\" value=\"0\">\r\n" +
                       "<param name=\"ShowTracker\" value=\"-1\">\r\n" +
                       "<param name=\"Volume\" value=\"-480\">\r\n" +
                       "</object>\r\n";
                    break;
                case ".rm":
                case ".rmvb":
                    content = "<object id=\"vid\" classid=\"clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA\" width=\"500\" height=\"400\" >\r\n" +
                        "<param name=\"_ExtentX\" value=\"11298\">\r\n" +
                        "<param name=\"_ExtentY\" value=\"7938\">\r\n" +
                        "<param name=\"AUTOSTART\" value=\"true\">\r\n" +
                        "<param name=\"SHUFFLE\" value=\"0\">\r\n" +
                        "<param name=\"PREFETCH\" value=\"0\">\r\n" +
                        "<param name=\"NOLABELS\" value=\"-1\">\r\n" +
                        "<param name=\"SRC\" value=\"" + url + "\">\r\n" +
                        "<param name=\"CONTROLS\" value=\"Imagewindow\">\r\n" +
                        "<param name=\"CONSOLE\" value=\"clip1\">\r\n" +
                        "<param name=\"LOOP\" value=\"0\">\r\n" +
                        "<param name=\"NUMLOOP\" value=\"0\">\r\n" +
                        "<param name=\"CENTER\" value=\"0\">\r\n" +
                        "<param name=\"MAINTAINASPECT\" value=\"0\">\r\n" +
                        "<param name=\"BACKGROUNDCOLOR\" value=\"#000000\">\r\n" +
                        "</object>\r\n" +
                        "<BR>\r\n" +
                        "<object id=\"vid2\" classid=\"clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA\" width=\"500\" height=\"30\" >\r\n" +
                        "<param name=\"_ExtentX\" value=\"11298\">\r\n" +
                        "<param name=\"_ExtentY\" value=\"794\">\r\n" +
                        "<param name=\"AUTOSTART\" value=\"true\">\r\n" +
                        "<param name=\"SHUFFLE\" value=\"0\">\r\n" +
                        "<param name=\"PREFETCH\" value=\"0\">\r\n" +
                        "<param name=\"NOLABELS\" value=\"-1\">\r\n" +
                        "<param name=\"SRC\" value=\"" + url + "\">\r\n" +
                        "<param name=\"CONTROLS\" value=\"ControlPanel\">\r\n" +
                        "<param name=\"CONSOLE\" value=\"clip1\">\r\n" +
                        "<param name=\"LOOP\" value=\"0\">\r\n" +
                        "<param name=\"NUMLOOP\" value=\"0\">\r\n" +
                        "<param name=\"CENTER\" value=\"0\">\r\n" +
                        "<param name=\"MAINTAINASPECT\" value=\"0\">\r\n" +
                        "<param name=\"BACKGROUNDCOLOR\" value=\"#000000\">\r\n" +
                        "</object>\r\n";
                    break;
                default:
                    content = "<object   id=\"WMPlay\"   style=\"WIDTH:300px;height:200px\"  " +
                      "classid=\"CLSID:6BF52A52-394A-11D3-B153-00C04F79FAA6\"   type=application/x-oleobject   standby=\"Loading   Windows   Media   Player   components...\"" +
                      "codebase=\"downloads/mediaplayer9.0_cn.exe\"   VIEWASTEXT>\n" +
                      "<param   name=\"URL\"   value='" + url + "'>\n" +
                      "<param   name=\"controls\"   value=\"ControlPanel,StatusBa\">" +
                      "<param   name=\"hidden\"   value=\"1\">" +
                      "<param   name=\"ShowControls\"   VALUE=\"0\">" +
                      "<param   name=\"rate\"   value=\"1\">\n" +
                      "<param   name=\"balance\"   value=\"0\">\n" +
                      "<param   name=\"currentPosition\"   value=\"0\">\n" +
                      "<param   name=\"defaultFrame\"   value=\"\">\n" +
                      "<param   name=\"playCount\"   value=\"100\">" +
                      "<param   name=\"autoStart\"   value=\"-1\">" +
                      "<param   name=\"currentMarker\"   value=\"0\">" +
                      "<param   name=\"invokeURLs\"   value=\"-1\">" +
                      "<param   name=\"baseURL\"   value=\"\">" +
                      "<param   name=\"volume\"   value=\"85\">" +
                      "<param   name=\"mute\"   value=\"0\">" +
                      "<param   name=\"uiMode\"   value=\"full\">" +
                      "<param   name=\"stretchToFit\"   value=\"0\">" +
                      "<param   name=\"windowlessVideo\"   value=\"0\">" +
                      "<param   name=\"enabled\"   value=\"-1\">" +
                      "<param   name=\"enableContextMenu\"   value=\"false\">" +
                      "<param   name=\"fullScreen\"   value=\"0\">" +
                      "<param   name=\"SAMIStyle\"   value=\"\">" +
                      "<param   name=\"SAMILang\"   value=\"\">" +
                      "<param   name=\"SAMIFilename\"   value=\"\">" +
                      "<param   name=\"captioningID\"   value=\"\">" +
                      "</object>";
                    break;
            }
            return content;
        }

    }

    public class NewsInfo
    {
        private string title;
        private string replaceableTitle;
        private string chineseTitle;
        private string content;
        private DocumentType documentType;
        private string column;
        private string subject;
        private string videoUrl;
        private string properties;
        private string source;
        private string tag;
        private DateTime publishDate;
        private string catagory;
        private string attachment;
        private int examinedStatus;
        private string author;
        private string subTitle;
        private string media;
        private string columnId;

        public string Attachment { get { return attachment; } set { attachment = value; } }
        public string Title { get { return title; } set { title = value; } }
        public string ReplaceableTitle { get { return replaceableTitle; } set { replaceableTitle = value; } }
        public string ChineseTitle { get { return chineseTitle; } set { chineseTitle = value; } }
        public string Content { get { return content; } set { content = value; } }


        public DocumentType DocumentType { get { return documentType; } set { documentType = value; } }
        public string Column { get { return column; } set { column = value; } }
        public string Subject { get { return subject; } set { subject = value; } }
        public string VideoUrl { get { return videoUrl; } set { videoUrl = value; } }
        public string Properties { get { return properties; } set { properties = value; } }
        public string Source { get { return source; } set { source = value; } }
        public string Tag { get { return tag; } set { tag = value; } }
        public string Catagory { get { return catagory; } set { catagory = value; } }

        public DateTime PublishDate { get { return publishDate; } set { publishDate = value; } }
        public int ExaminedStatus { get { return examinedStatus; } set { examinedStatus = value; } }
        public string Author { get { return author; } set { author = value; } }
        public string SubTitle { get { return subTitle; } set { subTitle = value; } }
        public string Media { get { return media; } set { media = value; } }
        public string ColumnId { get { return columnId; } set { columnId = value; } }
    }

    


    public enum DocumentType
    {
        Text,
        Html,
        Word,
        Excel,
        PDF,
        Picture,
        Video,
        Audio,
        Application,
        Chart,
        Complex
    }
}
