using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.IO;
using System.Configuration;
using System.Text.RegularExpressions;
using Foosun.Config;
using Foosun.Model;
using Foosun.DALFactory;

namespace Foosun.Publish
{
    public class General
    {
        public static string strgTemplet = Foosun.Config.UIConfig.dirTemplet;
        public static string RootInstallDir = Foosun.Publish.CommonData.SiteDomain;
        public static string InstallDir = "{$InstallDir}";
        public static string TempletDir = "{$TempletDir}";
        /// <summary>
        /// дHTML�ļ�
        /// </summary>
        /// <param name="Content">����</param>
        /// <param name="FilePath">����·��</param>
        public static void WriteHtml(string Content, string FilePath)
        {
            string getContent = "";
            string getajaxJS = "<script language=\"javascript\" type=\"text/javascript\" src=\"" + CommonData.SiteDomain + "/configuration/js/Prototype.js\"></script>\r\n";
            getajaxJS += "<script language=\"javascript\" type=\"text/javascript\" src=\"" + CommonData.SiteDomain + "/configuration/js/jspublic.js\"></script>\r\n";
            //����CNZZ����
            if (Foosun.Common.Public.readparamConfig("Open", "Cnzz") == "11")
            {
                getajaxJS += "<script src='http://pw.cnzz.com/c.php?id=" + Foosun.Common.Public.readparamConfig("SiteID", "Cnzz") + "' " +
                            "language='JavaScript' charset='gb2312'></script>\r\n";
            }
            string byCreat = "<!--Created by WebFastCMS v1.0 at " + DateTime.Now + "-->\r\n";
            try
            {
                string Dir = FilePath.Substring(0, FilePath.LastIndexOf("\\"));
                if (!Directory.Exists(Dir))
                    Directory.CreateDirectory(Dir);
                //lsd change ȥ���ļ���ֻ������
                if (File.Exists(FilePath))
                {
                    if ((File.GetAttributes(FilePath) & FileAttributes.ReadOnly) == FileAttributes.ReadOnly)
                    {
                        File.SetAttributes(FilePath, FileAttributes.Archive);
                    }

                }
                using (StreamWriter sw = new StreamWriter(FilePath, false, Encoding.UTF8))
                {
                    if (Regex.Match(Content, @"\</head\>[\s\S]*\<body", RegexOptions.IgnoreCase | RegexOptions.Compiled).Success)
                    {
                        getContent = Regex.Replace(Content, "<body", getajaxJS + byCreat + "<body", RegexOptions.IgnoreCase | RegexOptions.Compiled);
                    }
                    else
                    {
                        getContent = getajaxJS + byCreat + Content;
                    }
                    //�滻
                    getContent = (getContent.Replace(InstallDir, RootInstallDir)).Replace(TempletDir, strgTemplet);
                    sw.Write(getContent);
                    sw.Dispose();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            
        }
        /// <summary>
        /// �����ļ���
        /// </summary>
        /// <param name="Path">Ŀ¼·��</param>
        public static void CreateDirectory(string Path)
        {
            if (!Directory.Exists(Path))
                Directory.CreateDirectory(Path);
        }
        /// <summary>
        /// ��ȡHTML�ļ�����
        /// </summary>
        /// <param name="Path">����·��</param>
        /// <returns></returns>
        public static string ReadHtml(string Path)
        {
            string result = string.Empty;
            if (File.Exists(Path))
            {
                try
                {
                    using (StreamReader sr = new StreamReader(Path))
                    {
                        result = sr.ReadToEnd();
                    }
                }
                catch
                { }
            }
            else
            {
                result = "ģ�岻����!";
            }
            return result;
        }
        /// <summary>
        /// ��Web.Config��ȡ����Ŀ¼
        /// </summary>
        /// <returns></returns>
        public static string VirtualDir()
        {
            return System.Configuration.ConfigurationManager.AppSettings["dirDumm"];
        }

        /// <summary>
        /// ������Ŀ��XML
        /// </summary>
        /// <param name="ClassID"></param>
        /// <returns></returns>
        public static bool publishXML(string ClassID)
        {
            bool state = false;
            try
            {
                string SiteRootPath = Foosun.Common.ServerInfo.GetRootPath() + "\\";
                string xmlSTR = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n";
                xmlSTR += "<?xml-stylesheet type=\"text/css\" href=\"" + CommonData.SiteDomain + "/sysImages/css/rss.css\"?>\r\n";
                xmlSTR += "<rss version=\"2.0\">\r\n";
                xmlSTR += "<channel>\r\n";
                DataTable dt = CommonData.DalPublish.GetLastNews(50, ClassID);
                string ClassEname = "none";
                string xmlTemp = "";
                //ʱ�䣺2008-6-20  �޸��ߣ��⾲�  �޸�Ŀ�ģ�ʵ��XML���ɹ�������HTML��ǩ
                System.Text.RegularExpressions.Regex htmlRegex = new System.Text.RegularExpressions.Regex("<[^>]*>"); //����HTML��ǩ������ʽ wjl
                if (dt != null && dt.Rows.Count > 0)
                {
                    string ClassSTR = "/" + dt.Rows[0]["savepath1"].ToString() + "/" + dt.Rows[0]["SaveClassframe"].ToString() + "/" + dt.Rows[0]["ClassSaveRule"];
                    if (ClassID == "0")
                    {
                        xmlTemp += "<title>����RSS����</title>\r\n";
                        xmlTemp += "<link>" + CommonData.SiteDomain + "/xml/Content/all/news.xml</link>\r\n";
                    }
                    else
                    {
                        xmlTemp += "<title>" + dt.Rows[0]["ClassCName"].ToString() + "</title>\r\n";
                        xmlTemp += "<link>" + CommonData.SiteDomain + ClassSTR.Replace("//", "/") + "</link>\r\n";
                    }
                    xmlTemp += "<description>RSS����_by dotNETCMS for Foosun Inc.</description>\r\n";
                    ClassEname = dt.Rows[0]["ClassEName"].ToString();
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        xmlTemp += "<item id=\"" + (i + 1) + "\">\r\n";
                        xmlTemp += "<title><![CDATA[" + dt.Rows[i]["NewsTitle"].ToString() + "]]></title>\r\n";
                        string linkstr = CommonData.SiteDomain + "/" + dt.Rows[i]["savepath1"].ToString() + "/" + dt.Rows[i]["SaveClassframe"].ToString() + "/" + dt.Rows[i]["FileName"].ToString() + dt.Rows[i]["FileEXName"].ToString();
                        xmlTemp += "<link>" + linkstr.Replace("//", "/") + "</link>\r\n";
                        string ContentSTR = dt.Rows[i]["Content"].ToString();
                        if (ContentSTR != string.Empty && ContentSTR != null)
                        {
                            ContentSTR = htmlRegex.Replace(ContentSTR, ""); //wjl
                            xmlTemp += "<description><![CDATA[" + Foosun.Common.Input.FilterHTML(Foosun.Common.Input.GetSubString(ContentSTR, 200)) + "]]></description>\r\n";
                        }
                        else
                        {
                            xmlTemp += "<description><![CDATA[]]></description>\r\n";
                        }
                        xmlTemp += "<pubDate>" + dt.Rows[i]["CreatTime"].ToString() + "</pubDate>\r\n";
                        xmlTemp += "</item>\r\n";
                        //by wjl--
                        int indexCon = xmlTemp.ToLower().IndexOf("[fs:page");
                        if (indexCon > 0)
                        {
                            xmlTemp = xmlTemp.Substring(0, indexCon);
                        }
                        //--by wjl
                    }
                    xmlSTR += xmlTemp;
                    xmlSTR += "</channel>\r\n";
                    xmlSTR += "</rss>\r\n";
                    string filePath = SiteRootPath + "\\xml\\Content\\" + ClassEname + ".xml";
                    if (ClassID == "0")
                    {
                        filePath = SiteRootPath + "\\xml\\Content\\all\\news.xml";
                    }

                    //xmlSTR = xmlSTR.Replace("[FS:Page]", "");
                    //xmlSTR = xmlSTR.Replace("[FS:PAGE]", "");
                    using (StreamWriter sw = new StreamWriter(filePath, false))
                    {
                        sw.Write(xmlSTR);
                        sw.Dispose();
                    }
                    state = true;
                }
            }
            catch (Exception e)
            {
                Foosun.Common.Public.savePublicLogFiles("������ ������ĿXML", "��ClassID��:" + ClassID + "\r\n��������������\r\n" + e.ToString(), "");
                state = false;
            }
            return state;
        }

        /// <summary>
        /// ����Ƶ����Ŀ��XML
        /// </summary>
        /// <param name="ClassID"></param>
        /// <returns></returns>
        public static bool publishCHXML(int ClassID, int ChID)
        {
            bool state = false;
            try
            {
                string SiteRootPath = Foosun.Common.ServerInfo.GetRootPath() + "\\";
                string xmlSTR = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n";
                xmlSTR += "<?xml-stylesheet type=\"text/css\" href=\"" + CommonData.SiteDomain + "/sysImages/css/rss.css\"?>\r\n";
                xmlSTR += "<rss version=\"2.0\">\r\n";
                xmlSTR += "<channel>\r\n";
                DataTable dt = CommonData.DalPublish.GetLastCHNews(50, ClassID, ChID);
                string ClassEname = "none";
                string dirHTML = Foosun.Common.Public.readCHparamConfig("htmldir", ChID);
                dirHTML = dirHTML.Replace("{@dirHTML}", Foosun.Config.UIConfig.dirHtml);
                if (dt != null && dt.Rows.Count > 0)
                {
                    string ClassSTR = "/" + dirHTML + "/" + dt.Rows[0]["savepath1"].ToString() + "/" + dt.Rows[0]["fileName"].ToString();
                    ClassSTR = ClassSTR.Replace("//", "/");
                    if (ClassID == 0)
                    {
                        xmlSTR += "<title>����RSS����</title>\r\n";
                        xmlSTR += "<link>" + CommonData.SiteDomain + "/xml/channel/" + ChID + "_index.xml</link>\r\n";
                    }
                    else
                    {
                        xmlSTR += "<title>" + dt.Rows[0]["ClassCName"].ToString() + "</title>\r\n";
                        xmlSTR += "<link>" + CommonData.SiteDomain + ClassSTR.Replace("//", "/") + "</link>\r\n";
                    }
                    xmlSTR += "<description>RSS����_by dotNETCMS for Foosun Inc.</description>\r\n";
                    ClassEname = dt.Rows[0]["ClassEName"].ToString();
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        xmlSTR += "<item id=\"" + (i + 1) + "\">\r\n";
                        xmlSTR += "<title><![CDATA[" + dt.Rows[i]["Title"].ToString() + "]]></title>\r\n";
                        string linkstr = "/" + dirHTML + "/" + dt.Rows[i]["savepath1"].ToString() + "/" + dt.Rows[i]["SavePath"].ToString() + "/" + dt.Rows[i]["FileName"].ToString();
                        xmlSTR += "<link>" + CommonData.SiteDomain + linkstr.Replace("//", "/") + "</link>\r\n";
                        string ContentSTR = dt.Rows[i]["Content"].ToString();
                        if (ContentSTR != string.Empty && ContentSTR != null)
                        {
                            xmlSTR += "<description><![CDATA[" + Foosun.Common.Input.FilterHTML(Foosun.Common.Input.GetSubString(ContentSTR, 200)) + "]]></description>\r\n";
                        }
                        else
                        {
                            xmlSTR += "<description><![CDATA[]]></description>\r\n";
                        }
                        xmlSTR += "<pubDate>" + dt.Rows[i]["CreatTime"].ToString() + "</pubDate>\r\n";
                        xmlSTR += "</item>\r\n";
                    }
                    xmlSTR += "</channel>\r\n";
                    xmlSTR += "</rss>\r\n";
                    string filePath = SiteRootPath + "\\xml\\channel\\" + ChID + "_" + dt.Rows[0]["id1"].ToString() + ".xml";
                    if (ClassID == 0)
                    {
                        filePath = SiteRootPath + "\\xml\\channel\\" + ChID + "_index.xml";
                    }

                    using (StreamWriter sw = new StreamWriter(filePath, false))
                    {
                        sw.Write(xmlSTR);
                        sw.Dispose();
                    }
                    state = true;
                }
            }
            catch (Exception e)
            {
                Foosun.Common.Public.savePublicLogFiles("������ ������ĿXML,Ƶ��ID" + ChID + "", "��ClassID��:" + ClassID + "\r\n��������������\r\n" + e.ToString(), "");
                state = false;
            }
            return state;
        }

        /// <summary>
        /// ���ɹ鵵
        /// </summary>
        /// <param name="ClassID"></param>
        /// <returns></returns>
        public static bool publishHistryIndex(int Numday)
        {
            bool state = false;
            try
            {
                string SiteRootPath = Foosun.Common.ServerInfo.GetRootPath() + "\\";
                string historydir = Foosun.Config.UIConfig.dirPige;
                string dimm = Foosun.Config.UIConfig.dirDumm;
                string dirTemplet = Foosun.Config.UIConfig.dirTemplet;
                if (dimm.Trim() != string.Empty)
                {
                    dimm = "/" + dimm;
                }
                DataTable dt = CommonData.DalPublish.Gethistory(Numday);
                string TempletPath = "/{@dirtemplet}/Content/indexPage.html";
                TempletPath = TempletPath.Replace("/", "\\").ToLower();
                TempletPath = TempletPath.ToLower().Replace("{@dirtemplet}", dirTemplet);
                TempletPath = SiteRootPath.Trim('\\') + TempletPath;

                //�����鵵ҳ��
                Template indexTemp = new Template(TempletPath, TempType.Index);
                indexTemp.GetHTML();
                indexTemp.ReplaceLabels();

                string Content = indexTemp.FinallyContent;
                string liststr = "";
                string urls = "";
                string filePath = "";
                if (dt != null && dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        urls = dimm + "/history-" + dt.Rows[i]["newsid"].ToString() + ".aspx";
                        urls = urls.Replace("//", "/");
                        liststr += "<li><a href=\"" + urls + "\">" + dt.Rows[i]["NewsTitle"].ToString() + "</a></li>";
                    }
                    Content = Content.Replace("{#history_list}", liststr);
                    Content = Content.Replace("{#history_PageTitle}", "��ʷ��ѯ__" + DateTime.Now.AddDays((-Numday)).ToShortDateString() + "");
                    filePath = SiteRootPath + historydir + "\\" + getResultPage(Foosun.Common.Public.readparamConfig("SaveIndexPage"), DateTime.Now.AddDays((-Numday)), "", "history") + "\\index.html";
                    dt.Clear(); dt.Dispose();
                    WriteHtml(Content, filePath);
                    state = true;
                }
                else
                {
                    //���û�й鵵����
                    Content = Content.Replace("{#history_list}", "����û�й鵵����");
                    Content = Content.Replace("{#history_PageTitle}", "��ʷ��ѯ__" + DateTime.Now.AddDays((-Numday)).ToShortDateString() + "");
                    filePath = SiteRootPath + historydir + "\\" + getResultPage(Foosun.Common.Public.readparamConfig("SaveIndexPage"), DateTime.Now.AddDays((-Numday)), "", "history") + "\\index.html";
                    dt.Clear(); dt.Dispose();
                    WriteHtml(Content, filePath);
                    state = true;
                }

            }
            catch (Exception e)
            {
                Foosun.Common.Public.savePublicLogFiles("������ ������ʷ�ĵ�", "��������������\r\n" + e.ToString(), "");
                state = false;
            }
            return state;
        }


        /// <summary>
        /// ��������ҳ�棬���ʺ���ÿ��ÿ����Ŀ������������10��վ��
        /// </summary>
        /// <param name="ClassID"></param>
        /// <returns></returns>
        public static bool publishClassIndex(string ClassID)
        {
            CommonData.Initialize();
            bool state = false;
            try
            {
                string SiteRootPath = Foosun.Common.ServerInfo.GetRootPath() + "\\";
                string historydir = Foosun.Config.UIConfig.dirPige;
                string dimm = Foosun.Config.UIConfig.dirDumm;
                string dirTemplet = Foosun.Config.UIConfig.dirTemplet;
                PubClassInfo info = CommonData.GetClassById(ClassID);
                if (info != null)
                {
                    string TempletPath = info.ClassTemplet;
                    TempletPath = TempletPath.Replace("/", "\\").ToLower();
                    TempletPath = TempletPath.ToLower().Replace("{@dirtemplet}", dirTemplet);
                    TempletPath = SiteRootPath.Trim('\\') + TempletPath;
                    Template newsTemplate = new Template(TempletPath, TempType.Class);
                    newsTemplate.NewsID = null;
                    newsTemplate.ClassID = ClassID;
                    newsTemplate.GetHTML();
                    newsTemplate.ReplaceLabels();
                    string filePath = SiteRootPath + historydir + "\\" + getResultPage(info.ClassIndexRule, DateTime.Now, ClassID, info.ClassEName) + "\\" + info.ClassEName + ".html";
                    string p1js = "<span style=\"text-align:center;\" id=\"gPtypenowdiv" + DateTime.Now.ToShortDateString() + "\">������...</span>";
                    p1js += "<script language=\"javascript\" type=\"text/javascript\">";
                    p1js += "pubajax('" + CommonData.SiteDomain + "/configuration/system/public.aspx','NowStr=" + DateTime.Now.ToShortDateString() + "&ruleStr=1','gPtypenowdiv" + DateTime.Now.ToShortDateString() + "');";
                    p1js += "</script>";
                    WriteHtml(newsTemplate.FinallyContent.Replace("{Foosun:NewsLIST}", "").Replace("{/Foosun:NewsLIST}", "").Replace("{$FS:P1}", p1js), filePath);
                }
                state = true;
            }
            catch (Exception e)
            {
                Foosun.Common.Public.savePublicLogFiles("������ ��������", "��ClassID��:" + ClassID + "\r\n��������������\r\n" + e.ToString(), "");
                state = false;
            }
            return state;
        }

        /// <summary>
        /// ���ɵ�ҳ��
        /// </summary>
        /// <returns></returns>
        public static bool publishPage(string ClassID)
        {
            bool state = false;
            try
            {
                CommonData.Initialize();
                string saveNewsPath = string.Empty;
                string TempletPath = string.Empty;
                string SiteRootPath = Foosun.Common.ServerInfo.GetRootPath();
                if(!SiteRootPath.EndsWith("\\"))
                {
                    SiteRootPath += "\\";
                }
                string strTempletDir = strgTemplet;
                string dim = Foosun.Config.UIConfig.dirDumm;
                IDataReader rd = CommonData.DalPublish.GetSinglePageClass(ClassID);
                string finallyContent = string.Empty;
                while (rd.Read())
                {
                    if (rd["ClassTemplet"] == DBNull.Value || rd["ClassTemplet"].ToString().Trim() == "")
                    {
                        finallyContent = rd["PageContent"].ToString();
                        //<--ʱ�䣺2008-07-17 �޸��ߣ��⾲� ��ҳ��ҳ���� ��ʼ
                        finallyContent = finallyContent.Replace("{#Page_Navi}", "<a href=\"" + dim + "/\">��ҳ</a> >> " + rd["ClassCName"].ToString());
                        //���� wjl-->
                        saveNewsPath = rd["SavePath"].ToString();
                        saveNewsPath = saveNewsPath.TrimStart('/');
                        if (saveNewsPath.IndexOf('/') > -1)
                        {
                            saveNewsPath = saveNewsPath.Replace('/', '\\');
                        }
                        //�����ҳ����
                        WriteHtml(finallyContent, SiteRootPath + saveNewsPath);
                        //����ҳ������
                        Template newsTemplate = new Template(SiteRootPath + saveNewsPath, TempType.Class);
                        newsTemplate.NewsID = null;
                        newsTemplate.ClassID = ClassID;
                        newsTemplate.GetHTML();
                        newsTemplate.ReplaceLabels();                        
                        //�����ҳ����
                        WriteHtml(newsTemplate.FinallyContent, SiteRootPath + saveNewsPath);
                    }
                    else
                    {
                        TempletPath = rd.GetString(0);
                        TempletPath = TempletPath.Replace("/", "\\").ToLower();
                        TempletPath = TempletPath.ToLower().Replace("{@dirtemplet}", strTempletDir);
                        TempletPath = SiteRootPath.Trim('\\') + TempletPath;
                        saveNewsPath = rd["SavePath"].ToString();
                        Template newsTemplate = new Template(TempletPath, TempType.Class);
                        newsTemplate.NewsID = null;
                        newsTemplate.ClassID = ClassID;
                        newsTemplate.GetHTML();
                        newsTemplate.ReplaceLabels();
                        finallyContent = newsTemplate.FinallyContent;
                        finallyContent = finallyContent.Replace("{#Page_Title}", rd["ClassCName"].ToString());
                        finallyContent = finallyContent.Replace("{#Page_MetaKey}", rd["MetaKeywords"].ToString());
                        finallyContent = finallyContent.Replace("{#Page_MetaDesc}", rd["MetaDescript"].ToString());

                        //<--ʱ�䣺2008-07-17 �޸��ߣ��⾲� ��ҳ��ҳ���� ��ʼ
                        finallyContent = finallyContent.Replace("{#Page_Navi}", "<a href=\"" + dim + "/\">��ҳ</a> >> " + rd["ClassCName"].ToString());
                        int hIndex = finallyContent.IndexOf("{#Page_Content}", 0);
                        string PageHead = string.Empty;
                        string PageEnd = string.Empty;
                        if (hIndex <= 0)
                        {
                            PageHead = finallyContent;
                            PageEnd = finallyContent;
                        }
                        else
                        {
                            PageHead = finallyContent.Substring(0, hIndex);
                            PageEnd = finallyContent.Substring(hIndex + "{#Page_Content}".Length, finallyContent.Length - PageHead.Length - "{#Page_Content}".Length);
                            finallyContent = finallyContent.Replace("{#Page_Content}", rd["PageContent"].ToString());
                        }
                        finallyContent = finallyContent.Replace("{#Page_Content}", rd["PageContent"].ToString());
                        if (dim.Trim() != string.Empty)
                        {
                            dim = "/" + dim;
                        }

                        int getFiledot = saveNewsPath.LastIndexOf(".");
                        int getFileg = saveNewsPath.LastIndexOf("\\");
                        string getFileName = saveNewsPath.Substring((getFileg + 1), ((getFiledot - getFileg) - 1));
                        string getFileEXName = saveNewsPath.Substring(getFiledot);
                        string PageMid = rd["PageContent"].ToString();
                        Regex re = new Regex(@"(\[FS:PAGE=(?<p>[\s\S]+?)\$\])|(\[FS:PAGE\])", RegexOptions.IgnoreCase);
                        PageMid = re.Replace(PageMid, @"[FS:PAGE]");
                        string[] ArrayCon = Regex.Split(PageMid, @"\[FS:PAGE\]", RegexOptions.IgnoreCase);
                        int n = 0;
                        if (ArrayCon != null)
                        {
                            n = ArrayCon.Length;
                        }
                        string fileNames = null;
                        string EXName = null;

                        for (int i = 0; i < n; i++)
                        {
                            //string filepath = SiteRootPath + saveNewsPath; // ���ﾹȻ�������"D:\\Husb\\Projects\\HgCms\\Foosun.Web\\\\/html/xxbn/dym/contactus.html"
                            fileNames = saveNewsPath.Substring(saveNewsPath.LastIndexOf('/'), saveNewsPath.Length - saveNewsPath.LastIndexOf('/'));
                            fileNames = fileNames.Substring(1, fileNames.IndexOf('.') - 1);
                            EXName = saveNewsPath.Substring(saveNewsPath.LastIndexOf('.'), saveNewsPath.Length - saveNewsPath.LastIndexOf('.'));

                            // husb 2009-10-29
                            saveNewsPath = saveNewsPath.TrimStart('/');
                            if (saveNewsPath.IndexOf('/') > -1)
                            {
                                saveNewsPath = saveNewsPath.Replace('/', '\\');
                            }
                            string filepath = SiteRootPath + saveNewsPath;

                            int laspot = filepath.LastIndexOf('.');
                            if (i == 0)
                            {
                                filepath = filepath.Substring(0, laspot) + filepath.Substring(laspot);
                            }
                            else
                            {
                                filepath = filepath.Substring(0, laspot) + "_" + (i + 1) + filepath.Substring(laspot);
                            }
                            string PageContent = PageHead + ArrayCon[i] + PageEnd;
                            PageContent = ReplacePageLink(PageContent, fileNames, EXName, n, i + 1);
                            WriteHtml(PageContent, filepath);
                        }
                        if (n == 0)
                        {
                            WriteHtml(PageMid, SiteRootPath + saveNewsPath);
                        }
                    }
                    //���� wjl-->
                    state = true;
                }
                rd.Close();
            }
            catch (Exception e)
            {
                Foosun.Common.Public.savePublicLogFiles("������ ���ɵ�ҳ��", "��ClassID��:" + ClassID + "\r\n��������������\r\n" + e.ToString(), "");
                state = false;
            }
            return state;
        }

        /// <summary>
        /// ���ɵ�ҳ��(Ƶ��)
        /// </summary>
        /// <returns></returns>
        public static bool publishChPage(int ClassID, int ChID)
        {
            bool state = false;
            try
            {
                CommonData.Initialize();
                string saveNewsPath = string.Empty;
                string TempletPath = string.Empty;
                string SiteRootPath = Foosun.Common.ServerInfo.GetRootPath() + "\\";
                string strTempletDir = strgTemplet;
                string dim = Foosun.Config.UIConfig.dirDumm;
                IDataReader rd = CommonData.DalPublish.GetSingleCHPageClass(ClassID);
                while (rd.Read())
                {
                    TempletPath = rd.GetString(0);
                    TempletPath = TempletPath.Replace("/", "\\").ToLower();
                    TempletPath = TempletPath.ToLower().Replace("{@dirtemplet}", strTempletDir);
                    TempletPath = SiteRootPath.Trim('\\') + TempletPath;
                    saveNewsPath = rd["SavePath"].ToString() + rd["FileName"].ToString();
                    saveNewsPath = saveNewsPath.Replace("//", "");
                    Template newsTemplate = new Template(TempletPath, TempType.ChClass);
                    newsTemplate.CHNewsID = 0;
                    newsTemplate.CHClassID = ClassID;
                    newsTemplate.ChID = ChID;
                    newsTemplate.GetHTML();
                    newsTemplate.ReplaceLabels();
                    string finallyContent = newsTemplate.FinallyContent;
                    finallyContent = finallyContent.Replace("{#Page_Title}", rd["ClassCName"].ToString());
                    finallyContent = finallyContent.Replace("{#Page_MetaKey}", rd["KeyMeta"].ToString());
                    finallyContent = finallyContent.Replace("{#Page_MetaDesc}", rd["DescMeta"].ToString());
                    finallyContent = finallyContent.Replace("{#Page_Content}", rd["PageContent"].ToString());
                    if (dim.Trim() != string.Empty)
                    {
                        dim = "/" + dim;
                    }
                    finallyContent = finallyContent.Replace("{#Page_Navi}", "<a href=\"" + dim + "/\">��ҳ</a> >>  >> " + rd["ClassCName"].ToString());
                    WriteHtml(finallyContent, SiteRootPath + saveNewsPath);
                    state = true;
                }
                rd.Close();
            }
            catch (Exception e)
            {
                Foosun.Common.Public.savePublicLogFiles("������ ���ɵ�ҳ��,Ƶ��ID:" + ChID + "", "��ClassID��:" + ClassID + "\r\n��������������\r\n" + e.ToString(), "");
                state = false;
            }
            return state;
        }


        //<--wjl  2008-07-22 ����Ƿ�������������
        /// <summary>
        /// ������������
        /// </summary>
        /// <param name="classID">�������ŵ�ID</param>
        /// <param name="classID">������������ĿID</param>
        /// <returns>�ɹ�����־</returns>
        public static bool publishSingleNews(string newsID, string classID, bool isContent)
        {
            bool state = false;
            try
            {
                CommonData.Initialize();
                string saveNewsPath = string.Empty;
                string TempletPath = string.Empty;
                string SiteRootPath = Foosun.Common.ServerInfo.GetRootPath() + "\\";
                string strTempletDir = strgTemplet;
                IDataReader rd = CommonData.DalPublish.GetNewsSavePath(newsID);
                while (rd.Read())
                {
                    if (rd["isDelPoint"].ToString() == "0")
                    {
                        TempletPath = rd["templet"].ToString();
                        TempletPath = TempletPath.Replace("/", "\\");
                        TempletPath = TempletPath.ToLower().Replace("{@dirtemplet}", strTempletDir);
                        TempletPath = SiteRootPath.Trim('\\') + TempletPath;
                        saveNewsPath = "\\" + rd["SavePath1"].ToString().Trim('\\').Trim('/') + "\\" + rd["SaveClassframe"].ToString().Trim('\\').Trim('/') + "\\" + rd["SavePath"].ToString().Trim('\\').Trim('/') + "\\" + rd["FileName"].ToString().Trim('\\').Trim('/') + rd["FileEXName"].ToString().Trim('\\').Trim('/');
                        Template newsTemplate = new Template(TempletPath, TempType.News);
                        newsTemplate.NewsID = newsID;
                        newsTemplate.ClassID = classID;
                        newsTemplate.IsContent = isContent;
                        newsTemplate.GetHTML();
                        newsTemplate.ReplaceLabels();
                        string FinlContent = newsTemplate.FinallyContent;
                        if (newsTemplate.MyTempType == TempType.News)
                        {
                            int pos1 = FinlContent.IndexOf("<!-FS:STAR=");
                            int pos2 = FinlContent.IndexOf("FS:END->");
                            if (pos1 > -1)
                            {
                                int getFiledot = saveNewsPath.LastIndexOf(".");
                                int getFileg = saveNewsPath.LastIndexOf("\\");
                                string getFileName = saveNewsPath.Substring((getFileg + 1), ((getFiledot - getFileg) - 1));
                                string getFileEXName = saveNewsPath.Substring(getFiledot);
                                string PageHead = FinlContent.Substring(0, pos1);
                                string PageEnd = FinlContent.Substring(pos2 + 8);
                                string PageMid = FinlContent.Substring(pos1 + 11, pos2 - pos1 - 11);

                                Regex re = new Regex(@"(\[FS:PAGE=(?<p>[\s\S]+?)\$\])|(\[FS:PAGE\])", RegexOptions.IgnoreCase);
                                PageMid = re.Replace(PageMid, @"[FS:PAGE]");
                                string[] ArrayCon = Regex.Split(PageMid, @"\[FS:PAGE\]", RegexOptions.IgnoreCase);
                                int n = ArrayCon.Length;

                                for (int i = 0; i < n; i++)
                                {
                                    string filepath = SiteRootPath + saveNewsPath;
                                    if (i > 0)
                                    {
                                        int laspot = filepath.LastIndexOf('.');
                                        filepath = filepath.Substring(0, laspot) + "_" + (i + 1) + filepath.Substring(laspot);
                                    }
                                    string PageContent = PageHead + ArrayCon[i] + PageEnd;
                                    PageContent = re.Replace(PageContent, "");
                                    string getFileContent = ReplaceResultPage(rd["NewsID"].ToString(), PageContent.Replace("FS:END->", "").Replace("<!-FS:STAR=", ""), getFileName, getFileEXName, n, (i + 1), 0);


                                    WriteHtml(getFileContent, filepath);
                                }
                            }
                            else
                            {
                                WriteHtml(FinlContent.Replace("FS:END->", "").Replace("<!-FS:STAR=", ""), SiteRootPath + saveNewsPath);
                            }
                        }
                        //�޸����ɳɹ��ı�־��wxh 2008.6.20��
                        int a = CommonData.DalPublish.updateIsHtmlState(newsID);
                        if (a > 0)
                        {
                            state = true;
                        }
                    }
                    else
                    {
                        state = false;
                    }
                }
                rd.Close();
            }
            catch (Exception e)
            {
                Foosun.Common.Public.savePublicLogFiles("������ ��������", "��NewsID��:" + newsID + "\r\n��������������\r\n" + e.ToString(), "");
                state = false;
            }
            return state;
        }
        //--2008-07-22 wjl>



        /// <summary>
        /// ������������
        /// </summary>
        /// <param name="classID">�������ŵ�ID</param>
        /// <param name="classID">������������ĿID</param>
        /// <returns>�ɹ�����־</returns>
        public static bool publishSingleNews(string newsID, string classID)
        {
            bool state = false;
            try
            {
                CommonData.Initialize();
                string saveNewsPath = string.Empty;
                string TempletPath = string.Empty;
                string SiteRootPath = Foosun.Common.ServerInfo.GetRootPath() + "\\";
                string strTempletDir = strgTemplet;
                IDataReader rd = CommonData.DalPublish.GetNewsSavePath(newsID);
                while (rd.Read())
                {
                    if (rd["isDelPoint"].ToString() == "0")
                    {
                        TempletPath = rd["templet"].ToString();
                        TempletPath = TempletPath.Replace("/", "\\");
                        TempletPath = TempletPath.ToLower().Replace("{@dirtemplet}", strTempletDir);
                        TempletPath = SiteRootPath.Trim('\\') + TempletPath;
                        saveNewsPath = "\\" + rd["SavePath1"].ToString().Trim('\\').Trim('/') + "\\" + rd["SaveClassframe"].ToString().Trim('\\').Trim('/') + "\\" + rd["SavePath"].ToString().Trim('\\').Trim('/') + "\\" + rd["FileName"].ToString().Trim('\\').Trim('/') + rd["FileEXName"].ToString().Trim('\\').Trim('/');
                        Template newsTemplate = new Template(TempletPath, TempType.News);
                        newsTemplate.NewsID = newsID;
                        newsTemplate.ClassID = classID;
                        newsTemplate.GetHTML();
                        newsTemplate.ReplaceLabels();
                        string FinlContent = newsTemplate.FinallyContent;
                        if (newsTemplate.MyTempType == TempType.News)
                        {
                            int pos1 = FinlContent.IndexOf("<!-FS:STAR=");
                            int pos2 = FinlContent.IndexOf("FS:END->");
                            if (pos1 > -1)
                            {
                                int getFiledot = saveNewsPath.LastIndexOf(".");
                                int getFileg = saveNewsPath.LastIndexOf("\\");
                                string getFileName = saveNewsPath.Substring((getFileg + 1), ((getFiledot - getFileg) - 1));
                                string getFileEXName = saveNewsPath.Substring(getFiledot);
                                string PageHead = FinlContent.Substring(0, pos1);
                                string PageEnd = FinlContent.Substring(pos2 + 8);
                                string PageMid = FinlContent.Substring(pos1 + 11, pos2 - pos1 - 11);
                                //string[] ArrayCon = PageMid.Split(new string[] { "[FS:PAGE]" }, StringSplitOptions.RemoveEmptyEntries)
                                Regex re = new Regex(@"(\[FS:PAGE=(?<p>[\s\S]+?)\$\])|(\[FS:PAGE\])", RegexOptions.IgnoreCase);
                                PageMid = re.Replace(PageMid, @"[FS:PAGE]");
                                string[] ArrayCon = Regex.Split(PageMid, @"\[FS:PAGE\]", RegexOptions.IgnoreCase);
                                int n = ArrayCon.Length;
                                //if (ArrayCon[n - 1] == null || ArrayCon[n - 1].Trim() == string.Empty)
                                //    n--;
                                for (int i = 0; i < n; i++)
                                {
                                    string filepath = SiteRootPath + saveNewsPath;
                                    if (i > 0)
                                    {
                                        int laspot = filepath.LastIndexOf('.');
                                        filepath = filepath.Substring(0, laspot) + "_" + (i + 1) + filepath.Substring(laspot);
                                    }
                                    string PageContent = PageHead + ArrayCon[i] + PageEnd;
                                    PageContent = re.Replace(PageContent, "");
                                    string getFileContent = ReplaceResultPage(rd["NewsID"].ToString(), PageContent.Replace("FS:END->", "").Replace("<!-FS:STAR=", ""), getFileName, getFileEXName, n, (i + 1), 0);
                                    
                                    WriteHtml(getFileContent, filepath);
                                }
                            }
                            else
                            {
                                WriteHtml(FinlContent.Replace("FS:END->", "").Replace("<!-FS:STAR=", ""), SiteRootPath + saveNewsPath);
                            }
                        }
                        //�޸����ɳɹ��ı�־��wxh 2008.6.20��
                        int a = CommonData.DalPublish.updateIsHtmlState(newsID);
                        if (a > 0)
                        {
                            state = true;
                        }
                    }
                    else
                    {
                        state = false;
                    }
                }
                rd.Close();
            }
            catch (Exception e)
            {
                Foosun.Common.Public.savePublicLogFiles("������ ��������", "��NewsID��:" + newsID + "\r\n��������������\r\n" + e.ToString(), "");
                state = false;
            }
            return state;
        }

        /// <summary>
        /// ����������Ϣ(Ƶ��)
        /// </summary>
        public static bool publishCHSingleNews(int newsID, int classID, int ChID)
        {
            bool state = false;
            try
            {
                CommonData.Initialize();
                string saveNewsPath = string.Empty;
                string TempletPath = string.Empty;
                string SiteRootPath = Foosun.Common.ServerInfo.GetRootPath() + "\\";
                string strTempletDir = strgTemplet;
                IDataReader rd = CommonData.DalPublish.GetCHNewsSavePath(newsID, ChID);
                while (rd.Read())
                {
                    if (rd["isDelPoint"].ToString() == "0")
                    {
                        TempletPath = rd["templet"].ToString();
                        TempletPath = TempletPath.Replace("/", "\\");
                        TempletPath = TempletPath.ToLower().Replace("{@dirtemplet}", strTempletDir);
                        TempletPath = SiteRootPath.Trim('\\') + TempletPath;
                        string dirHTML = Foosun.Common.Public.readCHparamConfig("htmldir", ChID);
                        dirHTML = dirHTML.Replace("{@dirHTML}", Foosun.Config.UIConfig.dirHtml);
                        saveNewsPath = "\\" + dirHTML.Trim('\\').Trim('/') + "\\" + rd["SavePath1"].ToString().Trim('\\').Trim('/') + "\\" + rd["SavePath"].ToString().Trim('\\').Trim('/') + "\\" + rd["FileName"].ToString().Trim('\\').Trim('/');
                        Template newsTemplate = new Template(TempletPath, TempType.ChNews);
                        newsTemplate.CHNewsID = newsID;
                        newsTemplate.CHClassID = classID;
                        newsTemplate.ChID = ChID;
                        newsTemplate.GetHTML();
                        newsTemplate.ReplaceLabels();
                        string FinlContent = newsTemplate.FinallyContent;
                        if (newsTemplate.MyTempType == TempType.ChNews)
                        {
                            int pos1 = FinlContent.IndexOf("<!-FS:STAR=");
                            int pos2 = FinlContent.IndexOf("FS:END->");
                            if (pos1 > -1)
                            {
                                int getFiledot = saveNewsPath.LastIndexOf(".");
                                int getFileg = saveNewsPath.LastIndexOf("\\");
                                string getFileName = saveNewsPath.Substring((getFileg + 1), ((getFiledot - getFileg) - 1));
                                string getFileEXName = saveNewsPath.Substring(getFiledot);
                                string PageHead = FinlContent.Substring(0, pos1);
                                string PageEnd = FinlContent.Substring(pos2 + 8);
                                string PageMid = FinlContent.Substring(pos1 + 11, pos2 - pos1 - 11);
                                string[] ArrayCon = PageMid.Split(new string[] { "[FS:PAGE]" }, StringSplitOptions.RemoveEmptyEntries);
                                int n = ArrayCon.Length;
                                for (int i = 0; i < n; i++)
                                {
                                    string filepath = SiteRootPath + saveNewsPath;
                                    if (i > 0)
                                    {
                                        int laspot = filepath.LastIndexOf('.');
                                        filepath = filepath.Substring(0, laspot) + "_" + (i + 1) + filepath.Substring(laspot);
                                    }
                                    string PageContent = PageHead + ArrayCon[i] + PageEnd;
                                    string getFileContent = ReplaceResultPage(rd["id"].ToString(), PageContent.Replace("[FS:PAGE]", "").Replace("FS:END->", "").Replace("<!-FS:STAR=", ""), getFileName, getFileEXName, n, (i + 1), 0);
                                    WriteHtml(getFileContent, filepath);
                                }
                            }
                            else
                            {
                                WriteHtml(FinlContent.Replace("FS:END->", "").Replace("<!-FS:STAR=", ""), SiteRootPath + saveNewsPath);
                            }
                        }
                        state = true;
                    }
                    else
                    {
                        state = false;
                    }
                }
                rd.Close();
            }
            catch (Exception e)
            {
                Foosun.Common.Public.savePublicLogFiles("������ ��������(Ƶ��ID" + ChID + ")", "��ID��:" + newsID.ToString() + "\r\n��������������\r\n" + e.ToString(), "");
                state = false;
            }
            return state;
        }

        /// <summary>
        /// ����������Ŀ
        /// </summary>
        /// <param name="classID">����Ŀ��ID</param>
        /// <returns>�ɹ�����־</returns>
        public bool publishSingleClass(string classID)
        {
            bool state = false;
            try
            {
                CommonData.Initialize();
                string saveClassPath = string.Empty;
                string TempletPath = string.Empty;
                string SiteRootPath = Foosun.Common.ServerInfo.GetRootPath();
                string strTempletDir = strgTemplet;
                PubClassInfo info = CommonData.GetClassById(classID);
                if (info != null)
                {
                    if (info.isDelPoint == 0)
                    {
                        TempletPath = info.ClassTemplet;
                        TempletPath = TempletPath.Replace("/", "\\");
                        TempletPath = TempletPath.ToLower().Replace("{@dirtemplet}", strTempletDir);
                        TempletPath = SiteRootPath.Trim('\\') + TempletPath;
                        string TMPSavePath = info.SavePath.Trim();
                        if (TMPSavePath.Substring(0, 1) != "/")
                        {
                            TMPSavePath = "\\" + TMPSavePath;
                        }
                        saveClassPath = (TMPSavePath + "\\" + info.SaveClassframe + '\\' + info.ClassSaveRule.Trim()).Replace("/", @"\\");
                        Template classTemplate = new Template(TempletPath, TempType.Class);
                        classTemplate.ClassID = classID;
                        classTemplate.GetHTML();
                        string TmpPath = SiteRootPath + saveClassPath;
                        replaceTempg(classTemplate, TmpPath, classID, "class");
                        state = true;
                    }
                }
            }
            catch (Exception e)
            {
                Foosun.Common.Public.savePublicLogFiles("������ ������Ŀ", "��classID��:" + classID + "\r\n��������������\r\n" + e.ToString(), "");
            }
            return state;
        }

        /// <summary>
        /// ����������Ŀ(Ƶ��)
        /// </summary>
        public bool publishCHSingleClass(int classID, int ChID)
        {
            bool state = false;
            try
            {
                CommonData.Initialize();
                string saveClassPath = string.Empty;
                string TempletPath = string.Empty;
                string SiteRootPath = Foosun.Common.ServerInfo.GetRootPath();
                string strTempletDir = strgTemplet;
                PubCHClassInfo info = CommonData.GetCHClassById(classID);
                if (info != null)
                {
                    if (info.isDelPoint == 0)
                    {
                        TempletPath = info.Templet;
                        TempletPath = TempletPath.Replace("/", "\\");
                        TempletPath = TempletPath.ToLower().Replace("{@dirtemplet}", strTempletDir);
                        TempletPath = SiteRootPath.Trim('\\') + TempletPath;
                        string TMPSavePath = info.SavePath.Trim();
                        string dirHTML = Foosun.Common.Public.readCHparamConfig("htmldir", ChID);
                        dirHTML = dirHTML.Replace("{@dirHTML}", Foosun.Config.UIConfig.dirHtml);
                        TMPSavePath = dirHTML + "/" + TMPSavePath;
                        TMPSavePath = TMPSavePath.Replace("//", "/");
                        if (TMPSavePath.Substring(0, 1) != "/")
                        {
                            TMPSavePath = "\\" + TMPSavePath;
                        }
                        saveClassPath = (TMPSavePath + "\\" + info.FileName.Trim()).Replace("/", @"\\");
                        Template classTemplate = new Template(TempletPath, TempType.ChClass);
                        classTemplate.CHClassID = classID;
                        classTemplate.ChID = ChID;
                        classTemplate.GetHTML();
                        string TmpPath = SiteRootPath + saveClassPath;
                        replaceTempg(classTemplate, TmpPath, classID.ToString(), "class");
                        state = true;
                    }
                }
            }
            catch (Exception e)
            {
                Foosun.Common.Public.savePublicLogFiles("������ ������Ŀ,Ƶ��ID��" + ChID + "", "��classID��:" + classID.ToString() + "\r\n��������������\r\n" + e.ToString(), "");
            }
            return state;
        }
        /// <summary>
        /// ��������ר��
        /// </summary>
        /// <param name="specialID">����ר��ID</param>
        /// <returns>�ɹ�����־</returns>
        public bool publishSingleSpecial(string specialID)
        {
            bool state = false;
            try
            {
                CommonData.Initialize();
                string saveSpecialPath = string.Empty;
                string TempletPath = string.Empty;
                string SiteRootPath = Foosun.Common.ServerInfo.GetRootPath() + "\\";
                string strTempletDir = strgTemplet;
                PubSpecialInfo info = CommonData.GetSpecial(specialID);
                if (info != null)
                {
                    if (info.isDelPoint == 0)
                    {
                        TempletPath = info.Templet;
                        TempletPath = TempletPath.Replace("/", "\\");
                        TempletPath = TempletPath.ToLower().Replace("{@dirtemplet}", strTempletDir.ToLower());
                        TempletPath = SiteRootPath.Trim('\\') + TempletPath;
                        saveSpecialPath = "\\" + info.SavePath.Trim('\\').Trim('/') + "\\" + info.saveDirPath.Trim('\\').Trim('/') + '\\' + info.FileName + info.FileEXName;
                        Template specialTemplate = new Template(TempletPath, TempType.Special);
                        specialTemplate.SpecialID = specialID;
                        specialTemplate.GetHTML();
                        specialTemplate.ReplaceLabels();
                        replaceTempg(specialTemplate, SiteRootPath + saveSpecialPath, specialID, "special");
                        state = true;
                    }
                }
            }
            catch (Exception e)
            {
                Foosun.Common.Public.savePublicLogFiles("������ ����ר��", "��specialID��:" + specialID + "\r\n��������������\r\n" + e.ToString(), "");
            }
            return state;
        }

        /// <summary>
        /// ��������ר��(Ƶ��)
        /// </summary>
        public bool publishCHSingleSpecial(int specialID, int ChID)
        {
            bool state = false;
            try
            {
                CommonData.Initialize();
                string saveSpecialPath = string.Empty;
                string TempletPath = string.Empty;
                string SiteRootPath = Foosun.Common.ServerInfo.GetRootPath() + "\\";
                string strTempletDir = strgTemplet;
                PubCHSpecialInfo info = CommonData.GetCHSpecial(specialID);
                if (info != null)
                {
                    TempletPath = info.templet;
                    TempletPath = TempletPath.Replace("/", "\\");
                    TempletPath = TempletPath.ToLower().Replace("{@dirtemplet}", strTempletDir);
                    string dirHTML = Foosun.Common.Public.readCHparamConfig("htmldir", ChID);
                    dirHTML = dirHTML.Replace("{@dirHTML}", Foosun.Config.UIConfig.dirHtml);
                    TempletPath = SiteRootPath.Trim('\\') + TempletPath;
                    saveSpecialPath = dirHTML.Trim('\\').Trim('/') + "\\" + info.savePath.Trim('\\').Trim('/') + '\\' + info.filename;
                    Template specialTemplate = new Template(TempletPath, TempType.Chspecial);
                    specialTemplate.CHSpecialID = specialID;
                    specialTemplate.ChID = ChID;
                    specialTemplate.GetHTML();
                    specialTemplate.ReplaceLabels();
                    replaceTempg(specialTemplate, SiteRootPath + saveSpecialPath, specialID.ToString(), "special");
                    state = true;
                }
            }
            catch (Exception e)
            {
                Foosun.Common.Public.savePublicLogFiles("������ ����ר��,Ƶ��ID:" + ChID + "", "��specialID��:" + specialID + "\r\n��������������\r\n" + e.ToString(), "");
            }
            return state;
        }


        /// <summary>
        /// ����ģ��
        /// </summary>
        /// <param name="tempRe">ģ��ʵ��</param>
        public void replaceTempg(Template tempRe, string savePath, string id, string ContentType)
        {
            tempRe.ReplaceLabels();
            savePath = savePath.Replace("/", @"\\");
            savePath = savePath.Replace(@"\\\\", @"\\");
            if (tempRe.MyTempType == TempType.Class || tempRe.MyTempType == TempType.Special || tempRe.MyTempType == TempType.ChClass || tempRe.MyTempType == TempType.Chspecial)
            {
                string FinlContent = tempRe.FinallyContent;
                int pos1 = FinlContent.IndexOf("{Foosun:NewsLIST}");
                int pos2 = FinlContent.IndexOf("{/Foosun:NewsLIST}");
                string filepath = savePath;
                string TmpPath = savePath;
                if (pos2 > pos1 && pos1 > -1)
                {
                    int getFiledot = savePath.LastIndexOf(".");
                    int getFileg = savePath.LastIndexOf("\\");
                    string getFileName = savePath.Substring((getFileg + 1), ((getFiledot - getFileg) - 1));
                    string getFileEXName = savePath.Substring(getFiledot);
                    #region �����ҳ
                    string PageHead = FinlContent.Substring(0, pos1);
                    string PageEnd = FinlContent.Substring(pos2 + 18);
                    string PageMid = FinlContent.Substring(pos1 + 17, pos2 - pos1 - 17);
                    string pattern = @"\{\$FS\:P[01]\}\{Page\:\d\$[^\$]{0,6}\$[^\$]{0,20}\}";
                    Regex reg = new Regex(pattern, RegexOptions.Compiled);
                    Match match = reg.Match(PageMid);
                    if (match.Success)
                    {
                        if (Foosun.Config.verConfig.PublicType == "0" || tempRe.MyTempType == TempType.ChClass || tempRe.MyTempType == TempType.Chspecial)
                        {
                            string PageStr = match.Value;
                            int posPage = PageStr.IndexOf("}{Page:");

                            string postResult = PageStr.Substring(posPage + 7);
                            postResult = postResult.TrimEnd('}');
                            string[] postResultARR = postResult.Split('$');
                            string postResult_style = postResultARR[0];
                            string postResult_color = postResultARR[1];
                            string postResult_css = postResultARR[2];
                            string postResult_css1 = "";
                            if (postResult_css.Trim() != string.Empty)
                            {
                                postResult_css1 = " class=\"" + postResult_css + "\"";
                            }
                            string[] ArrayCon = reg.Split(PageMid);
                            int n = ArrayCon.Length;
                            if (ArrayCon[n - 1] == null || ArrayCon[n - 1].Trim() == string.Empty)
                                n--;
                            for (int i = 0; i < n; i++)
                            {
                                string getPageStr = "";
                                if (i > 0)
                                {
                                    int laspot = TmpPath.LastIndexOf('.');
                                    filepath = TmpPath.Substring(0, laspot) + "_" + (i + 1) + TmpPath.Substring(laspot);
                                }
                                UltiPublish gpl = new UltiPublish(true);
                                getPageStr = gpl.getPagelist(postResult_style, i, getFileName, getFileEXName, postResult_color, postResult_css1, n, id, ContentType, 0);
                                string PageContent = PageHead + ArrayCon[i] + getPageStr + PageEnd;

                                General.WriteHtml(PageContent, filepath);
                            }
                            if (n > 0)
                            {
                                return;
                            }
                        }
                    }
                    #endregion
                }
            }
            string p1js = "<span style=\"text-align:center;\" id=\"gPtypenowdiv" + DateTime.Now.ToShortDateString() + "\">������...</span>";
            p1js += "<script language=\"javascript\" type=\"text/javascript\">";
            p1js += "pubajax('" + CommonData.SiteDomain + "/configuration/system/public.aspx','NowStr=" + DateTime.Now.ToShortDateString() + "&ruleStr=1','gPtypenowdiv" + DateTime.Now.ToShortDateString() + "');";
            p1js += "</script>";
            WriteHtml(tempRe.FinallyContent.Replace("{Foosun:NewsLIST}", "").Replace("{/Foosun:NewsLIST}", "").Replace("{$FS:P1}", p1js), savePath);
        }

        /// <summary>
        /// �滻��ҳ����
        /// </summary>
        /// <returns></returns>
        private static string ReplacePageLink(string content, string fileName, string EXName, int PageCount, int CurrentPage)
        {
            //���û�з�ҳ������ʾ�û����ӵķ�ҳ��ʽ
            string isPageSplit = Foosun.Config.UIConfig.enableAutoPage;
            if (string.IsNullOrEmpty(isPageSplit) || bool.Parse(isPageSplit) == false)
            {
                return content.Replace("{#Page_Split}", "");
            }
            //���÷�������
            string PageStyles = Foosun.Common.Public.readparamConfig("PageStyle");
            //ÿҳ��ʾ���Ӹ���
            string PageLinkCount = Foosun.Common.Public.readparamConfig("PageLinkCount");
            if (string.IsNullOrEmpty(PageStyles))
                PageStyles = "0";
            if (string.IsNullOrEmpty(PageLinkCount))
                PageLinkCount = "10";

            string linkTitle = "<div style=\"padding-top:15px;\">��" + PageCount + "ҳ,&nbsp;��ǰ��" + CurrentPage + "ҳ,&nbsp;";
            //��ҳ��������
            string Link = null;
            //���ֱ������
            string numLink = string.Empty;
            //���ֱ������
            string fontLink = string.Empty;

            //������ҳ��
            int maxLinkCount = (PageCount + Convert.ToInt32(PageLinkCount) - 1) / Convert.ToInt32(PageLinkCount);
            //��ǰҪ��ʾ��Xҳ����
            int pageLink = CurrentPage / Convert.ToInt32(PageLinkCount) + 1;
            //��ҳҪ��ʾ��X��������ʼλ��
            int thisLink = (pageLink - 1) * Convert.ToInt32(PageLinkCount);

            if (thisLink == 0)
            {
                thisLink = 1;
            }

            int kk = 0;
            for (int i = thisLink; i <= PageCount; i++)
            {
                kk++;
                if (kk > Convert.ToInt32(PageLinkCount))
                    break;
                if (i == CurrentPage)
                {
                    numLink += "<strong><span>" + i + "</span></strong>&nbsp;";
                    fontLink += "<strong><span>��" + i + "ҳ</span></strong>&nbsp;";
                }
                else
                {
                    numLink += "<a href=\"" + fileName + "_" + i + EXName + "\"<span>" + i + "</span></a>&nbsp;";
                    fontLink += "<a  href=\"" + fileName + "_" + i + EXName + "\"><span>��" + i + "ҳ</span></a>&nbsp;";
                }
            }

            if (pageLink <= 1)
            {
                numLink = numLink + "...";
                fontLink = fontLink + "...";
            }
            else if (pageLink >= maxLinkCount)
            {
                numLink = "..." + numLink;
                fontLink = "..." + fontLink;
            }
            else
            {
                numLink = "..." + numLink + "...";
                fontLink = "..." + fontLink + "...";
            }

            int preTen = CurrentPage - 10 >= 1 ? CurrentPage - 10 : 1;//��ʮҳ
            int nextTen = CurrentPage + 10 <= PageCount ? CurrentPage + 10 : PageCount;//��ʮҳ

            string indexLink = fileName + EXName;//��ҳ
            string lastLink = fileName + "_" + PageCount + EXName;//βҳ
            string preFile = fileName + "_" + (CurrentPage - 1) + EXName;//��һҳ�ļ���
            if (CurrentPage == 1)
                preFile = indexLink;
            string preTenFile = fileName + "_" + preTen + EXName;//��ʮҳ�ļ���
            string nextFile = fileName + "_" + (CurrentPage + 1) + EXName; ;//��һ���ļ���
            string nextTenFile = fileName + "_" + nextTen + EXName; ;//��ʮҳ�ļ���

            switch (Convert.ToInt32(PageStyles))
            {
                case 0:
                    if (CurrentPage <= 1)
                        Link = linkTitle + "<span>��ҳ</span>&nbsp;<span>��һҳ</span>&nbsp;<span>��ʮҳ</span>&nbsp;" + numLink + "&nbsp;<a href=\"" + nextTenFile + "\" title=\"��ʮҳ\"><span>��ʮҳ</span></a>&nbsp;<a  href=\"" + nextFile + "\" title=\"��һҳ\"><span>��һҳ</span></a>&nbsp;<a  href=\"" + lastLink + "\" title=\"βҳ\"><span>βҳ</span></a></div>";
                    else if (CurrentPage >= PageCount)
                        Link = linkTitle + "<a href=\"" + indexLink + "\"><span>��ҳ</span></a>&nbsp;<a href=\"" + preFile + "\"><span>��һҳ</span></a>&nbsp;<a href=\"" + preTenFile + "\"><span>��ʮҳ</span></a>&nbsp;" + numLink + "&nbsp;<span>��ʮҳ</span>&nbsp;<span>��һҳ</span>&nbsp;<span>βҳ</span></div>";
                    else
                        Link = linkTitle + "<a href=\"" + indexLink + "\"><span>��ҳ</span></a>&nbsp;<a href=\"" + preFile + "\"><span>��һҳ</span></a>&nbsp;<a href=\"" + preTenFile + "\"><span>��ʮҳ</span></a>&nbsp;" + numLink + "&nbsp;<a href=\"" + nextTenFile + "\" title=\"��ʮҳ\"><span>��ʮҳ</span></a>&nbsp;<a  href=\"" + nextFile + "\" title=\"��һҳ\"><span>��һҳ</span></a>&nbsp;<a  href=\"" + lastLink + "\" title=\"βҳ\"><span>βҳ</span></a></div>";
                    break;
                case 1:
                    if (CurrentPage <= 1)
                        Link = linkTitle + "&nbsp;<span>��һҳ</span>&nbsp;&nbsp;" + fontLink + "&nbsp;&nbsp;<a  href=\"" + nextFile + "\"><span>��һҳ</span></a>&nbsp;</div>";
                    else if (CurrentPage >= PageCount)
                        Link = linkTitle + "&nbsp;<a href=\"" + preFile + "\"><span>��һҳ</span></a>&nbsp;&nbsp;" + fontLink + "&nbsp;&nbsp;<span>��һҳ</span>&nbsp;</div>";
                    else
                        Link = linkTitle + "&nbsp;<a href=\"" + preFile + "\"><span>��һҳ</span></a>&nbsp;&nbsp;" + fontLink + "&nbsp;&nbsp;<a  href=\"" + nextFile + "\"><span>��һҳ</span></a>&nbsp;</div>";
                    break;
                case 2:
                    if (CurrentPage <= 1)
                        Link = linkTitle + "&nbsp;<span>��һҳ</span>&nbsp;&nbsp;" + numLink + "&nbsp;&nbsp;<a href=\"" + nextFile + "\"><span>��һҳ</span></a>&nbsp;</div>";
                    else if (CurrentPage >= PageCount)
                        Link = linkTitle + "&nbsp;<a href=\"" + preFile + "\"><span>��һҳ</span></a>&nbsp;&nbsp;" + numLink + "&nbsp;&nbsp;<span>��һҳ</span>&nbsp;</div>";
                    else
                        Link = linkTitle + "&nbsp;<a href=\"" + preFile + "\"><span>��һҳ</span></a>&nbsp;&nbsp;" + numLink + "&nbsp;&nbsp;<a href=\"" + nextFile + "\"><span>��һҳ</span></a>&nbsp;</div>";
                    break;
                case 3:
                    if (CurrentPage <= 1)
                        Link = linkTitle + "<span><font face=webdings title=\"��ҳ\">9</font></span>&nbsp;<span><font face=webdings title=\"��һҳ\">3</font></span>&nbsp;<span><font face=webdings>7</font></span>&nbsp;" + numLink + "&nbsp;<a href=\"" + nextTenFile + "\"><span><font face=webdings>8</font></span></a>&nbsp;<a  href=\"" + nextFile + "\" title=\"��һҳ\"><span><font face=webdings>4</font></span></a>&nbsp;<a  href=\"" + lastLink + "\" title=\"βҳ\"><span><font face=webdings>:</font></span></a></div>";
                    else if (CurrentPage >= PageCount)
                        Link = linkTitle + "<a href=\"" + indexLink + "\"><span><font face=webdings title=\"��ҳ\">9</font></span></a>&nbsp;<a href=\"" + preFile + "\"><span><font face=webdings title=\"��һҳ\">3</font></span></a>&nbsp;<a  href=\"" + preTenFile + "\" title=\"��ʮҳ\"><span><font face=webdings>7</font></span></a>&nbsp;" + numLink + "&nbsp;<span><font face=webdings>8</font></span>&nbsp;<span><font face=webdings>4</font></span>&nbsp;<span><font face=webdings>:</font></span></div>";
                    else
                        Link = linkTitle + "<a href=\"" + indexLink + "\"<span><font face=webdings title=\"��ҳ\">9</font></span></a>&nbsp;<a href=\"" + preFile + "\"><span><font face=webdings title=\"��һҳ\">3</font></span></a>&nbsp;<a  href=\"" + preTenFile + "\" title=\"��ʮҳ\"><span><font face=webdings>7</font></span></a>&nbsp;" + numLink + "&nbsp;<a href=\"" + nextTenFile + "\"><span><font face=webdings>8</font></span></a>&nbsp;<a  href=\"" + nextFile + "\" title=\"��һҳ\"><span><font face=webdings>4</font></span></a>&nbsp;<a  href=\"" + lastLink + "\" title=\"βҳ\"><span><font face=webdings>:</font></span></a></div>";
                    break;
                default:
                    Link = "";
                    break;
            }
            content = content.Replace("{#Page_Split}", Link);
            return content;
        }


        /// <summary>
        /// �滻���·�ҳ
        /// </summary>
        /// <returns></returns>
        public static string ReplaceResultPage(string NewsID, string Content, string FileName, string EXName, int PageCount, int CurrentPage, int isPop)
        {
            string getContent = "";
            string ReadType = Foosun.Common.Public.readparamConfig("ReviewType");
            //��ҳ
            if (Content.IndexOf("{#PageStartLink}") > -1)
            {
                if (CurrentPage == 1)
                {
                    //Content = Content.Replace("{#PageStartLink}", "javascript:void(0);");
                    Content = Content.Replace("{#PageStartLink}", "��ҳ");
                }
                else
                {
                    if (ReadType == "1")
                    {
                        Content = Content.Replace("{#PageStartLink}", "<a href='Content.aspx?id=" + NewsID + "'>��ҳ</a>");
                       
                    }
                    else
                    {
                        if (isPop == 1)
                        {
                            Content = Content.Replace("{#PageStartLink}", "<a href='Content.aspx?id=" + NewsID + "'>��ҳ</a>");
                        }
                        else
                        {
                            Content = Content.Replace("{#PageStartLink}", string.Format("<a href='{0}'>��ҳ</a>", FileName + EXName));
                        }
                    }
                }
            }
            //���һҳ
            if (Content.IndexOf("{#PageEndLink}") > -1)
            {
                if (CurrentPage == PageCount)
                {
                    //Content = Content.Replace("{#PageEndLink}", "javascript:void(0);");
                    Content = Content.Replace("{#PageEndLink}", "ĩҳ");
                }
                else
                {
                    if (ReadType == "1")
                    {
                        Content = Content.Replace("{#PageEndLink}", "<a href='Content.aspx?id=" + NewsID + "&Page=" + PageCount + "'>ĩҳ</a>");
                    }
                    else
                    {
                        if (isPop == 1)
                        {
                            Content = Content.Replace("{#PageStartLink}", "<a href='Content.aspx?id=" + NewsID + "&Page=" + PageCount + "'>ĩҳ</a>");
                        }
                        else
                        {
                            Content = Content.Replace("{#PageEndLink}", string.Format("<a href='{0}'>ĩҳ</a>", FileName + "_" + PageCount + EXName)); 
                        }
                    }
                }
            }
            //��һҳ
            if (Content.IndexOf("{#PagePreLink}") > -1)
            {
                if (CurrentPage == 1)
                {
                    //Content = Content.Replace("{#PagePreLink}", "javascript:void(0);");
                    Content = Content.Replace("{#PagePreLink}", "��һҳ");
                }
                else
                {
                    if (CurrentPage <= 2)
                    {
                        if (ReadType == "1")
                        {
                            Content = Content.Replace("{#PagePreLink}", "<a href='Content.aspx?id=" + NewsID + "'>��һҳ</a>");
                        }
                        else
                        {
                            if (isPop == 1)
                            {
                                Content = Content.Replace("{#PagePreLink}", "<a href='Content.aspx?id=" + NewsID + "'>��һҳ</a>");
                            }
                            else
                            {
                                Content = Content.Replace("{#PagePreLink}", string.Format("<a href='{0}'>��{1}ҳ</a>", FileName + EXName, 1));
                            }
                        }
                    }

                    else
                    {
                        if (ReadType == "1")
                        {
                            Content = Content.Replace("{#PagePreLink}", "<a href='Content.aspx?id=" + NewsID + "&Page=" + (CurrentPage - 1) + "'>��һҳ</a>"); 
                        }
                        else
                        {
                            if (isPop == 1)
                            {
                                Content = Content.Replace("{#PagePreLink}", "Content.aspx?id=" + NewsID + "&Page=" + (CurrentPage - 1) + "'>��һҳ</a>"); 
                            }
                            else
                            {
                                Content = Content.Replace("{#PagePreLink}", string.Format("<a href='{0}'>��һҳ</a>", FileName + "_" + (CurrentPage - 1) + EXName));
                            }
                        }
                    }
                }
            }
            //��һҳ
            if (Content.IndexOf("{#PageNextLink}") > -1)
            {
                if (CurrentPage == PageCount)
                {
                    //Content = Content.Replace("{#PageNextLink}", "javascript:void(0);");
                    Content = Content.Replace("{#PageNextLink}", "��һҳ");
                }
                else
                {
                    if (ReadType == "1")
                    {
                        Content = Content.Replace("{#PageNextLink}", string.Format("<a href='{0}'>��һҳ</a>", "Content.aspx?id=" + NewsID + "&Page=" + (CurrentPage + 1) + ""));
                    }
                    else
                    {
                        if (isPop == 1)
                        {
                            Content = Content.Replace("{#PageNextLink}", string.Format("<a href='{0}'>��һҳ</a>", "Content.aspx?id=" + NewsID + "&Page=" + (CurrentPage + 1) + ""));
                        }
                        else
                        {
                            Content = Content.Replace("{#PageNextLink}", string.Format("<a href='{0}'>��һҳ</a>", FileName + "_" + (CurrentPage + 1) + EXName));
                        }
                    }
                }
            }
            //��ʮҳ
            if (Content.IndexOf("{#PagePreTenLink}") > -1)
            {
                if (CurrentPage == 1)
                {
                    //Content = Content.Replace("{#PagePreTenLink}", "javascript:void(0);");
                    Content = Content.Replace("{#PagePreTenLink}", "��ʮҳ");
                }
                else
                {
                    if (CurrentPage < 10)
                    {
                        if (ReadType == "1")
                        {
                            Content = Content.Replace("{#PagePreTenLink}",string.Format("<a href='{0}'>��ʮҳ</a>", "Content.aspx?id=" + NewsID + ""));
                        }
                        else
                        {
                            if (isPop == 1)
                            {
                                Content = Content.Replace("{#PagePreTenLink}", string.Format("<a href='{0}'>��ʮҳ</a>", "Content.aspx?id=" + NewsID + ""));
                            }
                            else
                            {
                                Content = Content.Replace("{#PagePreTenLink}", string.Format("<a href='{0}'>��ʮҳ</a>", FileName + EXName));
                            }
                        }
                    }
                    else
                    {
                        if (ReadType == "1")
                        {
                            Content = Content.Replace("{#PagePreTenLink}", string.Format("<a href='{0}'>��ʮҳ</a>", "Content.aspx?id=" + NewsID + "&Page=" + (CurrentPage - 10)));
                        }
                        else
                        {
                            if (isPop == 1)
                            {
                                Content = Content.Replace("{#PagePreTenLink}", string.Format("<a href='{0}'>��ʮҳ</a>", "Content.aspx?id=" + NewsID + "&Page=" + (CurrentPage - 10)));
                            }
                            else
                            {
                                Content = Content.Replace("{#PagePreTenLink}", string.Format("<a href='{0}'>��ʮҳ</a>", FileName + "_" + (CurrentPage - 10) + EXName));
                            }
                        }
                    }
                }
            }
            //��ʮҳ
            if (Content.IndexOf("{#PageNextTenLink}") > -1)
            {
                if (CurrentPage == PageCount)
                {
                    //Content = Content.Replace("{#PageNextTenLink}", "javascript:void(0);");
                    Content = Content.Replace("{#PageNextTenLink}", "��ʮҳ");

                }
                else
                {
                    if ((CurrentPage + 10) > PageCount)
                    {
                        if (ReadType == "1")
                        {
                            Content = Content.Replace("{#PageNextTenLink}", string.Format("<a href='{0}'>��ʮҳ</a>", "Content.aspx?id=" + NewsID + "&Page=" + (PageCount)));
                        }
                        else
                        {
                            if (isPop == 1)
                            {
                                Content = Content.Replace("{#PageNextTenLink}", string.Format("<a href='{0}'>��ʮҳ</a>", "Content.aspx?id=" + NewsID + "&Page=" + (PageCount)));
                            }
                            else
                            {
                                Content = Content.Replace("{#PageNextTenLink}", string.Format("<a href='{0}'>��ʮҳ</a>", FileName + "_" + (PageCount) + EXName));
                            }
                        }
                    }
                    else
                    {
                        if (ReadType == "1")
                        {
                            Content = Content.Replace("{#PageNextTenLink}", string.Format("<a href='{0}'>��ʮҳ</a>", "Content.aspx?id=" + NewsID + "&Page=" + (CurrentPage + 10)));
                        }
                        else
                        {
                            if (isPop == 1)
                            {
                                Content = Content.Replace("{#PageNextTenLink}", string.Format("<a href='{0}'>��ʮҳ</a>", "Content.aspx?id=" + NewsID + "&Page=" + (CurrentPage + 10)));
                            }
                            else
                            {
                                Content = Content.Replace("{#PageNextTenLink}", string.Format("<a href='{0}'>��ʮҳ</a>", FileName + "_" + (CurrentPage + 10) + EXName));
                            }
                        }
                    }
                }
            }
            //��������
            if (Content.IndexOf("{#PageCount}") > -1)
            {
                Content = Content.Replace("{#PageCount}", string.Format("��{0}ҳ",PageCount));
            }
            //��ǰҳ��
            if (Content.IndexOf("{#PageCurrentNews}") > -1)
            {
                Content = Content.Replace("{#PageCurrentNews}", string.Format("��ǰ�ǵ�{0}ҳ", CurrentPage));
            }

            if (Content.IndexOf("{#NewsPage:Loop") > -1 && Content.IndexOf("{/@NewsPage:Loop}") > -1)
            {

            }
            //string sre = "<a[\\s\\S]*href=(\\\"|\\\')?javascript:void(0);(\\\"|\\\')?[\\s\\S]*>[\\s\\S]*</a>";
            Regex re = new Regex("<a[^>]+href=(\\\"|\\\')?javascript:void\\(0\\)\\;(\\\"|\\\')?[^>]*>[^<]*<\\/a>");
            Content = re.Replace(Content,"");
            getContent = Content;
            return getContent;
        }

        public static string getResultPage(string _Content, DateTime _DateTime, string ClassID, string EName)
        {
            string _Str = "";
            if (_Content != string.Empty)
            {
                _Str = _Content.ToLower();
                string year02 = ((_DateTime.Year).ToString()).PadRight(2);
                string year04 = (_DateTime.Year).ToString();
                string month = (_DateTime.Month).ToString();
                string day = (_DateTime.Day).ToString();
                string hour = (_DateTime.Hour).ToString();
                string minute = (_DateTime.Minute).ToString();
                string second = (_DateTime.Second).ToString();
                _Str = _Str.Replace("{@year02}", year02);
                _Str = _Str.Replace("{@year04}", year04);
                _Str = _Str.Replace("{@month}", month);
                _Str = _Str.Replace("{@day}", day);
                _Str = _Str.Replace("{@second}", second);
                _Str = _Str.Replace("{@minute}", minute);
                _Str = _Str.Replace("{@hour}", hour);
                _Str = _Str.Replace("{@ename}", EName);
                if (_Str.IndexOf("{@ram", 0) != -1)
                {
                    for (int i = 0; i <= 9; i++)
                    {
                        _Str = _Str.Replace("{@ram" + i + "_0}", Foosun.Common.Rand.Number(i));
                        _Str = _Str.Replace("{@ram" + i + "_1}", Foosun.Common.Rand.Str_char(i));
                        _Str = _Str.Replace("{@ram" + i + "_2}", Foosun.Common.Rand.Str(i));
                    }
                }
            }
            return _Str;
        }

    }
}
