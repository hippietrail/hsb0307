using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Text;
using System.Text.RegularExpressions;
using Foosun.Config;
using Foosun.Model;

namespace Foosun.Publish
{
    public partial class LabelMass
    {
        public const string newLine = "\r\n";
        /// <summary>
        /// FS:LabelType=List��ǩ������
        /// </summary>
        /// <returns></returns>
        public string Analyse_List(string Tags, string isConstr)
        {
            string mystyle = this.Mass_Inserted;
            string styleid = Regex.Match(mystyle, @"\[\#FS:StyleID=(?<sid>[^\]]+)]", RegexOptions.Compiled).Groups["sid"].Value.Trim();
            if (!styleid.Equals(string.Empty))
            {
                mystyle = LabelStyle.GetStyleByID(styleid);
            }
            if (mystyle.Trim().Equals(string.Empty))
                return string.Empty;

            string str_NewsType = this.GetParamValue("FS:NewsType");
            string str_SubNews = this.GetParamValue("FS:SubNews");
            string str_ClassID = this.GetParamValue("FS:ClassID");
            string str_SpecialID = this.GetParamValue("FS:SpecialID");
            int n_Cols;
            if (!int.TryParse(this.GetParamValue("FS:Cols"), out n_Cols))
                n_Cols = 1;
            if (n_Cols < 1)
                n_Cols = 1;
            string str_Desc = this.GetParamValue("FS:Desc");
            string str_DescType = this.GetParamValue("FS:DescType");
            string str_isDiv = this.GetParamValue("FS:isDiv");
            if (str_isDiv == null)
            {
                str_isDiv = "true";
            }
            string str_isPic = this.GetParamValue("FS:isPic");
            string str_TitleNumer = this.GetParamValue("FS:TitleNumer");
            string str_ContentNumber = this.GetParamValue("FS:ContentNumber");
            string str_NaviNumber = this.GetParamValue("FS:NaviNumber");
            string str_ClickNumber = this.GetParamValue("FS:ClickNumber");
            string str_ShowDateNumer = this.GetParamValue("FS:ShowDateNumer");
            string str_isSub = this.GetParamValue("FS:isSub");
            string str_ShowNavi = this.GetParamValue("FS:ShowNavi");
            string str_NaviCSS = this.GetParamValue("FS:NaviCSS");
            string str_ColbgCSS = this.GetParamValue("FS:ColbgCSS");
            string str_NaviPic = this.GetParamValue("FS:NaviPic");
            string str_ClassStyle = this.GetParamValue("FS:ClassStyle");
            string str_HashNaviContent = this.GetParamValue("FS:HashNaviContent");
            string str_More = this.GetParamValue("FS:More");
            string SqlFields = " [ID],ClassID";
            string SqlCondition = DBConfig.TableNamePrefix + "News Where [isRecyle]=0 And [isLock]=0 And [SiteID]='" + this.Param_SiteID + "'";
            if (str_HashNaviContent != null)
            {
                if (str_HashNaviContent == "false")
                {
                    SqlCondition += " and  NaviContent=''";
                }
                else if (str_HashNaviContent == "true")
                {
                    SqlCondition += " and NaviContent<>''";
                }
            }
            ///�ж���������
            switch (str_NewsType)
            {
                case "Last":
                    break;
                case "Rec":
                    SqlCondition += " And NewsProperty like '1%'";
                    break;
                case "Hot":
                    SqlCondition += " And NewsProperty like '____1%'";
                    break;
                case "Tnews":
                    SqlCondition += " And NewsProperty like '________1%'";
                    break;
                case "ANN":
                    SqlCondition += " And NewsProperty like '__________1%'";
                    break;
                case "MarQuee":
                    SqlCondition += " And NewsProperty like '__1%'";
                    break;
                case "Special":
                    if (str_SpecialID != null)
                    {
                        SqlCondition += " And [NewsID] In (Select [NewsID] From [" + DBConfig.TableNamePrefix + "special_news] Where [SpecialID]='" + str_SpecialID + "')";
                    }
                    else if (this.Param_CurrentSpecialID != null)
                    {
                        SqlCondition += " And [NewsID] In (Select [NewsID] From [" + DBConfig.TableNamePrefix + "special_news] Where [SpecialID]='" + this.Param_CurrentSpecialID + "')";
                    }
                    else
                    {
                        return "ר�����ű�ǩ��������";
                    }
                    break;
                case "SubNews":
                    if (this.Param_CurrentClassID != null)
                    {
                        return getSubNewsList(mystyle, styleid, n_Cols, str_Desc, str_DescType, str_isDiv, "",
                               "", str_isPic, str_TitleNumer, str_ContentNumber, str_NaviNumber, str_ClickNumber,
                               str_ShowDateNumer, str_ShowNavi, str_NaviCSS, str_ColbgCSS, str_NaviPic, str_SubNews, str_ClassStyle);
                    }
                    else
                    {
                        return "";
                    }
                    break;
                case "Jnews":
                    SqlCondition += " And NewsProperty like '______________1%'";
                    break;
                default:
                    break;
            }

            //-------�ж��Ƿ����ͼƬ
            if (str_isPic == "true")
            {
                SqlCondition += " And [NewsType]=1";
            }
            else if (str_isPic == "false")
            {
                SqlCondition += " And ([NewsType]=0 Or [NewsType]=2)";
            }
            //-------�ж��Ƿ���ʾ����ʴ��ڶ���
            if (str_ClickNumber != null && str_ClickNumber != string.Empty)
            {
                SqlCondition += " And [Click] >= " + int.Parse(str_ClickNumber);
            }
            //-------�ж���ʾ�������������Ϣ
            if (str_ShowDateNumer != null && str_ShowDateNumer != "")
            {

                if (Foosun.Config.UIConfig.WebDAL.ToLower() == "foosun.accessdal")
                {
                    SqlCondition += " And DateDiff('d',[CreatTime] ,Now()) < " + int.Parse(str_ShowDateNumer);
                }
                else
                {
                    SqlCondition += " And DateDiff(day,[CreatTime] ,GetDate()) < " + int.Parse(str_ShowDateNumer);
                }
            }
            //�ж��Ƿ��������
            if (Tags != null && Tags != "")
            {
                SqlCondition += " And ([Tags] Like '%" + Tags + "%'  or NewsTitle Like '%" + Tags + "%')";
            }
            //�ж��Ƿ�Ͷ������
            if (isConstr == "1")
            {
                SqlCondition += " And [isConstr]=1";
            }

            string SqlOrderBy = string.Empty;
            //-------����
            //if (str_NewsType == "Last")
            //{
            //    SqlOrderBy += " order by ID Desc";
            //}
            //else
            //{
            if (str_Desc != null && str_Desc.ToLower() == "asc")
            {
                SqlOrderBy += " asc";
            }
            else
            {
                SqlOrderBy += " Desc";
            }
            switch (str_DescType)
            {
                case "id":
                    SqlOrderBy = " Order By id " + SqlOrderBy + "";
                    break;
                case "date":
                    SqlOrderBy = " Order By [CreatTime] " + SqlOrderBy + ",id " + SqlOrderBy + "";
                    break;
                case "click":
                    SqlOrderBy = " Order By [Click] " + SqlOrderBy + ",id " + SqlOrderBy + "";
                    break;
                case "pop":
                    SqlOrderBy = " Order By [OrderID]" + SqlOrderBy + ",id " + SqlOrderBy + "";
                    break;
                case "digg":
                    SqlOrderBy = " Order By [TopNum]" + SqlOrderBy + ",id " + SqlOrderBy + "";
                    break;
                default:
                    if (str_NewsType == "Hot")
                    {
                        SqlOrderBy = " Order By [Click] " + SqlOrderBy + ",id " + SqlOrderBy + "";
                    }
                    else
                    {
                        SqlOrderBy = " Order By [CreatTime] " + SqlOrderBy + ",id " + SqlOrderBy + "";
                    }
                    break;
            }
            //}
            #region ����Ŀ�����ж�
            string str_SubNaviCSS = string.Empty;
            bool subTF = false;
            if (str_SubNews != null)
            {
                if (str_SubNews == "true")
                {
                    subTF = true;
                    if (this.GetParamValue("FS:SubNaviCSS") != null)
                    {
                        str_SubNaviCSS = this.GetParamValue("FS:SubNaviCSS");
                    }
                }
            }
            string Sql = string.Empty;
            #region ���� 
            if (str_ClassID == null || str_ClassID=="0")
            {
                if (str_isSub == "true")
                {
                    if (this._TemplateType == TempType.Class)
                    {
                        SqlCondition += " And [ClassID] In (" + getChildClassID(this.Param_CurrentClassID) + ")";
                    }
                }
                if (this._TemplateType == TempType.Class)
                {
                    SqlCondition += " And [ClassID]='" + this.Param_CurrentClassID + "'";
                    Sql = "select top " + Param_Loop + "  " + SqlFields + " from " + SqlCondition + " " + SqlOrderBy;
                }
                else
                {
                    Sql = "select top " + Param_Loop + " " + SqlFields + " from " + SqlCondition + SqlOrderBy;
                }
            }
            else if (str_ClassID == "-1")
            {
                Sql = "select top " + Param_Loop + " " + SqlFields + " from " + SqlCondition + SqlOrderBy;
            }
            else
            {
                if (str_isSub == "true")
                {
                    SqlCondition += " And [ClassID] In (" + getChildClassID(str_ClassID) + ")";
                }
                else
                {
                    SqlCondition += " And [ClassID] ='" + str_ClassID + "'";
                }
                Sql = "select top " + Param_Loop + " " + SqlFields + " from " + SqlCondition + SqlOrderBy;
            }
            #endregion 
            #endregion ����Ŀ�����ж�
            DataTable dt = CommonData.DalPublish.ExecuteSql(Sql);
            if (dt == null || dt.Rows.Count < 1) return string.Empty;
            string str_newslist = string.Empty;
            int i;
            int nTitleNum = 30, nContentNum = 200, nNaviNumber = 200;
            if (str_TitleNumer != null && Foosun.Common.Input.IsInteger(str_TitleNumer))
            {
                nTitleNum = int.Parse(str_TitleNumer);
            }
            if (str_ContentNumber != null && Foosun.Common.Input.IsInteger(str_ContentNumber))
            {
                nContentNum = int.Parse(str_ContentNumber);
            }
            if (str_NaviNumber != null && Foosun.Common.Input.IsInteger(str_NaviNumber))
            {
                nNaviNumber = int.Parse(str_NaviNumber);
            }
            int dtcount = dt.Rows.Count;

            string[] arr_ColbgCSS = null;
            bool b_ColbgCss = false;
            if (str_ColbgCSS != null)
            {
                arr_ColbgCSS = str_ColbgCSS.Split('|');
                b_ColbgCss = true;
            }

            string row = "";
            #region ���������Ѿ�����,ǰ̨js���ƹ���,��������ֻ��Ϊһ������
            //���������Ѿ��޸�Ϊǰ̨��js������ƹ����ˡ�by Simplt
            //if (str_NewsType == "MarQuee")
            //{
            //    string marqueestr = "";

            //    if (str_MarqDirec == null)
            //        str_MarqDirec = "left";
            //    if (str_MarqSpeed == null)
            //        str_MarqSpeed = "10";
            //    if (str_Marqwidth == null)
            //        str_Marqwidth = "100";
            //    if (str_Marqheight == null)
            //        str_Marqheight = "40";
            //    if (str_isDiv == "false")
            //    {
            //        str_newslist += "<table >" + newLine;
            //        str_newslist += "<tr>" + newLine + "</td>" + newLine;
            //        str_newslist += "<script language=\"javascript\">" + newLine;
            //        marqueestr += "<marquee onmouseover=\"this.stop()\" onmouseout=\"this.start()\" scrollDelay=\"110\" scrollamount=\"" + str_MarqSpeed + "\" direction=\"" + str_MarqDirec + "\" height=\"" + str_Marqheight + "\" width=\"" + str_Marqwidth + "\">";
            //        for (i = 0; i < dtcount; i++)
            //        {
            //            if (str_MarqDirec == "left" || str_MarqDirec == "right")
            //            {
            //                marqueestr += getNavi(str_ShowNavi, str_NaviCSS, str_NaviPic, i) + " ";
            //                marqueestr += Analyse_ReadNews((int)dt.Rows[i][0], nTitleNum, nContentNum, nNaviNumber, mystyle, styleid, 1, 1, 0) + " ";
            //            }
            //            else
            //            {
            //                marqueestr += getNavi(str_ShowNavi, str_NaviCSS, str_NaviPic, i) + " ";
            //                marqueestr += Analyse_ReadNews((int)dt.Rows[i][0], nTitleNum, nContentNum, nNaviNumber, mystyle, styleid, 1, 1, 0) + " ";
            //                marqueestr += "<br />";
            //            }
            //        }
            //        marqueestr += "</marquee>";
            //        marqueestr = marqueestr.Replace("\r\n", "");
            //        string str_randnumber = Foosun.Common.Rand.Number(5);
            //        str_newslist += "var marqueestr" + str_randnumber + "='" + marqueestr + "';" + newLine;
            //        str_newslist += "document.write(marqueestr" + str_randnumber + "); " + newLine;
            //        str_newslist += "</script>" + newLine;
            //        str_newslist += "</td>" + newLine + "</tr>" + "</table>";
            //        dt.Clear();
            //        dt.Dispose();
            //    }
            //}
            #endregion
            string ClassURLs = string.Empty;
            for (i = 0; i < dtcount; i++)
            {
                IDataReader dc = CommonData.DalPublish.GetsClassInfo(dt.Rows[i]["ClassID"].ToString());
                if (dc.Read())
                {
                    ClassURLs = getClassURL(dc["Domain"].ToString(),int.Parse(dc["isDelPoint"].ToString()), dc["ClassID"].ToString(), dc["SavePath"].ToString(), dc["SaveClassFrame"].ToString(), dc["ClassSaveRule"].ToString());
                }
                dc.Close();
                str_ColbgCSS = "";
                if (b_ColbgCss)
                {
                    if (i % 2 == 0)
                        str_ColbgCSS = " class=\"" + arr_ColbgCSS[0].ToString() + "\"";
                    else
                        str_ColbgCSS = " class=\"" + arr_ColbgCSS[1].ToString() + "\"";
                }

                if (str_isDiv == "true")
                {
                    if (b_ColbgCss)
                    {
                        str_newslist += "<span" + str_ColbgCSS + ">";
                    }
                    str_newslist += getNavi(str_ShowNavi, str_NaviCSS, str_NaviPic, i);
                    str_newslist += Analyse_ReadNews((int)dt.Rows[i][0], nTitleNum, nContentNum, nNaviNumber, mystyle, styleid, 1, 1, 0);
                    //��ʼ���ø�����
                    if (subTF)
                    { 
                        Foosun.Model.NewsContent sNCI = new Foosun.Model.NewsContent();
                        sNCI = this.getNewsInfo((int)dt.Rows[i][0], null);
                        str_newslist += getSubSTR(sNCI.NewsID, str_SubNaviCSS);
                    }
                    if (b_ColbgCss)
                        str_newslist += "</span>";
                }
                else
                {
                    str_isDiv = "false";
                    row = getNavi(str_ShowNavi, str_NaviCSS, str_NaviPic, i) + " ";
                    row += Analyse_ReadNews((int)dt.Rows[i][0], nTitleNum, nContentNum, nNaviNumber, mystyle, styleid, 1, 1, 0);
                    //��ʼ���ø�����
                    if (subTF)
                    {
                        Foosun.Model.NewsContent sNCI = new Foosun.Model.NewsContent();
                        sNCI = this.getNewsInfo((int)dt.Rows[i][0], null);
                        row += getSubSTR(sNCI.NewsID, str_SubNaviCSS);
                    }
                    if (n_Cols == 1)
                    {
                        str_newslist += "<tr>" + newLine + "<td" + str_ColbgCSS + ">" + newLine + row + newLine + "</td>" + newLine + "</tr>" + newLine;
                    }
                    else
                    {
                        row = "<td width=\"" + (100 / n_Cols) + "%\"" + str_ColbgCSS + ">" + newLine + row + newLine + "</td>" + newLine;
                        if (i > 0 && ((i + 1) % n_Cols == 0))
                            row += "</tr>" + newLine + "<tr>" + newLine;
                        str_newslist += row;
                    }
                }
            }
            dt.Clear();
            dt.Dispose();
            //Ҫ����һ����ʾ��������������ǰ̨��CSS����<li>������
            if (str_isDiv == "false")
            {
                if (str_newslist != string.Empty && n_Cols > 1)
                {
                    str_newslist = "<tr>" + newLine + str_newslist;
                    if (i % n_Cols != 0)
                    {
                        int n = n_Cols - i;
                        if (n < 0)
                        {
                            n = n_Cols - (i % n_Cols);
                        }
                        for (int j = 0; j < n; j++)
                        {
                            str_newslist += "<td width=\"" + (100 / n_Cols) + "%\">" + newLine + " </td>" + newLine;
                        }
                    }
                    str_newslist += "</tr>" + newLine;
                }
            }
            if (str_newslist.EndsWith(@"<tr></tr>"))
            {
                str_newslist = str_newslist.Substring(0,str_newslist.Length-@"<tr></tr>".Length);
            }
            str_newslist = News_List_Head(str_isDiv, "", "")+str_newslist;
            //str_newslist += str_newslist;
            //��ȡ����
            //str_newslist += "<div style=\"width:100%;\" align=\"right\"><a href=\"" + ClassURLs + "\" target=\"_blank\"><img src=\"" + gdimm + "/sysImages/normal/more.gif\" border=\"0\" /></a></div>";
            if (!string.IsNullOrEmpty(str_More))
            {
                string gdimm = Foosun.Config.UIConfig.dirDumm;
                if (gdimm.Trim() != string.Empty)
                {
                    gdimm = "/" + gdimm;
                }

                if (str_More.EndsWith(@".gif") || str_More.EndsWith(@".jpg"))
                {
                    str_More = str_More.ToLower().Replace(@"{@dirfile}", Foosun.Config.UIConfig.dirFile);
                    str_newslist += "<div style=\"width:100%;\" align=\"right\"><a href=\"" + ClassURLs + "\" target=\"_blank\"><img src=\"" + str_More + "\"></img></a></div>";
                }
                else
                {
                    str_newslist += "<div style=\"width:100%;\" align=\"right\"><a href=\"" + ClassURLs + "\" target=\"_blank\">" + str_More + "</a></div>";
                }
            }
            str_newslist += News_List_End(str_isDiv);
            return str_newslist;
        }

        /// <summary>
        /// ȡ�����������б�
        /// </summary>
        /// <param name="mystyle">��ʽ����</param>
        /// <param name="styleid">��ʽ���</param>
        /// <param name="n_Cols">ѭ��������</param>
        /// <param name="str_Desc">����ʽ</param>
        /// <param name="str_DescType">����ʲô����</param>
        /// <param name="str_isDiv">�����ʽ��table or div��</param>
        /// <param name="str_ulID">div ul id</param>
        /// <param name="str_ulClass">div ul class</param>
        /// <param name="str_isPic">�Ƿ�ͼƬ����</param>
        /// <param name="str_TitleNumer">��������</param>
        /// <param name="str_ContentNumber">��������</param>
        /// <param name="str_NaviNumber">��������</param>
        /// <param name="str_ClickNumber">�������</param>
        /// <param name="str_ShowDateNumer">��ʾ������ڵ�����</param>
        /// <param name="str_ShowNavi">�Ƿ���ʾ����</param>
        /// <param name="str_NaviCSS">������ʽ</param>
        /// <param name="str_ColbgCSS">������ʽ</param>
        /// <param name="str_NaviPic">����ͼƬ</param>
        /// <param name="str_SubNews">�Ƿ���ø�����</param>
        /// <param name="str_ClassStyle">������Ŀ������ʽ</param>
        /// <returns>������������</returns>
        protected string getSubNewsList(string mystyle, string styleid, int n_Cols, string str_Desc, string str_DescType, string str_isDiv, string str_ulID, string str_ulClass, string str_isPic, string str_TitleNumer, string str_ContentNumber, string str_NaviNumber, string str_ClickNumber, string str_ShowDateNumer, string str_ShowNavi, string str_NaviCSS, string str_ColbgCSS, string str_NaviPic, string str_SubNews,string str_ClassStyle)
        {
            //�˴����Ϊdiv����Ҫ�޸ġ������޸ġ�12.31��,by simplt
            string SqlFields = " [ID] ";
            string SqlCondition = DBConfig.TableNamePrefix + "News Where [isRecyle]=0 And [isLock]=0 And [SiteID]='" + this.Param_SiteID + "'";
            //-------�ж��Ƿ����ͼƬ
            if (str_isPic == "true")
                SqlCondition += " And [NewsType]=1";
            else if (str_isPic == "false")
                SqlCondition += " And ([NewsType]=0 Or [NewsType]=2)";
            //-------�ж��Ƿ���ʾ����ʴ��ڶ���
            if (str_ClickNumber != null && str_ClickNumber != "")
                SqlCondition += " And [Click] > " + int.Parse(str_ClickNumber);
            //-------�ж���ʾ�������������Ϣ
            if (str_ShowDateNumer != null && str_ShowDateNumer != "")
            {
                if (Foosun.Config.UIConfig.WebDAL.ToLower() == "foosun.accessdal")
                {
                    SqlCondition += " And DateDiff('d',[CreatTime] ,now()) < " + int.Parse(str_ShowDateNumer);
                }
                else
                {
                    SqlCondition += " And DateDiff(Day,[CreatTime] ,Getdate()) < " + int.Parse(str_ShowDateNumer);
                }
            }
            string SqlOrderBy = string.Empty;
            //-------����
            if (str_Desc != null && str_Desc.ToLower() == "asc")
                SqlOrderBy += " asc";
            else
                SqlOrderBy += " Desc";
            switch (str_DescType)
            {
                case "id":
                    SqlOrderBy = " Order By id " + SqlOrderBy + "";
                    break;
                case "date":
                    SqlOrderBy = " Order By [CreatTime] " + SqlOrderBy + ",id " + SqlOrderBy + "";
                    break;
                case "click":
                    SqlOrderBy = " Order By [Click] " + SqlOrderBy + ",id " + SqlOrderBy + "";
                    break;
                case "pop":
                    SqlOrderBy = " Order By [OrderID]" + SqlOrderBy + ",id " + SqlOrderBy + "";
                    break;
                case "digg":
                    SqlOrderBy = " Order By [TopNum]" + SqlOrderBy + ",id " + SqlOrderBy + "";
                    break;
                default:
                    SqlOrderBy = " Order By [CreatTime] " + SqlOrderBy + ",id " + SqlOrderBy + "";
                    break;
            }

            int nTitleNum = 30, nContentNum = 200, nNaviNumber = 200;
            if (str_TitleNumer != null && Foosun.Common.Input.IsInteger(str_TitleNumer))
            {
                nTitleNum = int.Parse(str_TitleNumer);
            }
            if (str_ContentNumber != null && Foosun.Common.Input.IsInteger(str_ContentNumber))
            {
                nContentNum = int.Parse(str_ContentNumber);
            }
            if (str_NaviNumber != null && Foosun.Common.Input.IsInteger(str_NaviNumber))
            {
                nNaviNumber = int.Parse(str_NaviNumber);
            }

            string str_SubNaviCSS = string.Empty;
            bool subTF = false;
            if (str_SubNews != null)
            {
                if (str_SubNews == "true")
                {
                    subTF = true;
                    if (this.GetParamValue("FS:SubNaviCSS") != null)
                    {
                        str_SubNaviCSS = this.GetParamValue("FS:SubNaviCSS");
                    }
                }
            }
            string [] arr_ColbgCSS = null;
            bool b_ColbgCss = false;
            if (str_ColbgCSS != null)
            {
                arr_ColbgCSS = str_ColbgCSS.Split('|');
                b_ColbgCss = true;
            }
            string row = "";
            string Sql = " Select [ClassID],[ClassCName],[SavePath],[SaveClassframe],[ClassSaveRule],[ClassSaveRule],[isDelPoint] ,[Domain] From [" + DBConfig.TableNamePrefix + "news_Class] Where [ParentID]='" + this.Param_CurrentClassID + "' And [isRecyle]=0 And [isLock]=0 And [IsURL]=0";
            DataTable dt = CommonData.DalPublish.ExecuteSql(Sql);
            if (dt == null || dt.Rows.Count == 0) return "";
            string str_classlist = "";
            int j;

            //��Ŀ������ʽ
            string str_tempClassStyle = "";
            if (str_ClassStyle != null)
                str_tempClassStyle = " class=\"" + str_ClassStyle + "\"";

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string str_newslist = "";
                string classrow = "<a href=\"" + getClassURL(dt.Rows[i]["Domain"].ToString(),Convert.ToInt32(dt.Rows[i]["isDelPoint"].ToString()),
                                    dt.Rows[i]["ClassID"].ToString(), dt.Rows[i]["SavePath"].ToString(),
                                    dt.Rows[i]["SaveClassframe"].ToString(), dt.Rows[i]["ClassSaveRule"].ToString()) + "\" target=\"_blank\">" +
                                    dt.Rows[i]["ClassCName"].ToString() + "</a>";
                str_classlist += "<tr>" + newLine + "<td " + str_tempClassStyle + ">" + newLine;
                str_classlist += classrow;
                str_classlist += "</td>" + newLine + "</tr>" + newLine;
                str_classlist += "<tr>" + newLine + "<td>";
                string s_newsSql = "select top " + Param_Loop + " " + SqlFields + " from" +
                                   " " + SqlCondition + " And [ClassID]='" + dt.Rows[i]["ClassID"].ToString() + "'" + SqlOrderBy;
                DataTable dv = CommonData.DalPublish.ExecuteSql(s_newsSql);
                if (dv != null)
                {
                    for (j = 0; j < dv.Rows.Count; j++)
                    {
                        str_ColbgCSS = "";
                        if (b_ColbgCss)
                        {
                            if (j % 2 == 0)
                                str_ColbgCSS = " class=\"" + arr_ColbgCSS[0].ToString() + "\"";
                            else
                                str_ColbgCSS = " class=\"" + arr_ColbgCSS[1].ToString() + "\"";
                        }

                        if (str_isDiv == "true")
                        {
                            if (b_ColbgCss)
                                str_newslist += "<span" + str_ColbgCSS + ">";

                            str_newslist += getNavi(str_ShowNavi, str_NaviCSS, str_NaviPic, j);
                            str_newslist += Analyse_ReadNews((int)dv.Rows[j][0], nTitleNum, nContentNum, nNaviNumber, mystyle, styleid, 1, 1, 0);
                            //��ʼ���ø�����
                            if (subTF)
                            {
                                Foosun.Model.NewsContent sNCI = new Foosun.Model.NewsContent();
                                sNCI = this.getNewsInfo((int)dv.Rows[j][0], null);
                                str_newslist += getSubSTR(sNCI.NewsID, str_SubNaviCSS);
                            }
                            if (b_ColbgCss)
                                str_newslist += "</span>";
                        }
                        else
                        {
                            str_isDiv = "false";
                            row = getNavi(str_ShowNavi, str_NaviCSS, str_NaviPic, j) + " ";
                            row += Analyse_ReadNews((int)dv.Rows[j][0], nTitleNum, nContentNum, nNaviNumber, mystyle, styleid, 1, 1, 0);
                            //��ʼ���ø�����
                            if (subTF)
                            {
                                Foosun.Model.NewsContent sNCI = new Foosun.Model.NewsContent();
                                sNCI = this.getNewsInfo((int)dt.Rows[j][0], null);
                                row += getSubSTR(sNCI.NewsID, str_SubNaviCSS);
                            }
                            if (n_Cols == 1)
                            {
                                str_newslist += "<tr>" + newLine + "<td" + str_ColbgCSS + ">" + newLine + row + newLine + "</td>" + newLine + "</tr>" + newLine;
                            }
                            else
                            {
                                row = "<td width=\"" + (100 / n_Cols) + "%\"" + str_ColbgCSS + ">" + newLine + row + newLine + "</td>" + newLine;
                                if (j > 0 && ((j + 1) % n_Cols == 0))
                                    row += "</tr>" + newLine + "<tr>" + newLine;
                                str_newslist += row;
                            }
                        }
                    }
                    dv.Clear();
                    dv.Dispose();
                    if (str_newslist != string.Empty && n_Cols > 1)
                    {
                        str_newslist = "<tr>" + newLine + str_newslist;
                        if (j % n_Cols != 0)
                        {
                            int n = n_Cols - j;
                            if (n < 0)
                            {
                                n = n_Cols - (j % n_Cols);
                            }
                            for (int k = 0; k < n; k++)
                            {
                                str_newslist += "<td width=\"" + (100 / n_Cols) + "%\">" + newLine + " </td>" + newLine;
                            }
                        }
                        str_newslist += "</tr>" + newLine;
                    }
                    str_newslist = News_List_Head(str_isDiv, str_ulID, str_ulClass) + str_newslist + News_List_End(str_isDiv);
                }
                str_classlist += str_newslist + "</td>" + newLine + "</tr>" + newLine;
            }
            dt.Clear(); dt.Dispose();
            str_classlist = "<table border=\"0\">" + newLine + str_classlist + "</table>" + newLine;
            return str_classlist;
        }


        /// <summary>
        /// Get NewsList Table Or Div
        /// </summary>
        /// <param name="isDiv">�Ƿ����DIV</param>
        /// <param name="ulID">DIV��ul����ID</param>
        /// <param name="ulClass">DIV��ul����Class</param>
        /// <returns>����ͷ��</returns>
        protected string News_List_Head(string isDiv, string ulID, string ulClass)
        {
            string str_Head = string.Empty;
            if (string.IsNullOrEmpty(isDiv) || isDiv == "false")
            {
                str_Head += "<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">" + newLine;
            }
            else
            {   //���������Σ����붨��ul�����ԣ���ǰ̨ģ���п��ơ������ĺô����Եõ���w3c��ʽ��div+css
                //if (ulID != null && ulClass != null)
                //    str_Head += "<ul id=\"" + ulID + "\" class=\"" + ulClass + "\">" + newLine;
                //else if (ulID != null && ulClass == null)
                //    str_Head += "<ul id=\"" + ulID + "\">" + newLine;
                //else if (ulID == null && ulClass != null)
                //    str_Head += "<ul class=\"" + ulClass + "\">" + newLine;
                //else
                str_Head += newLine;
            }
            return str_Head;
        }

        /// <summary>
        /// Get NewsList Table Or Div
        /// </summary>
        /// <param name="isDiv">�Ƿ����DIV</param>
        /// <returns>����β��</returns>
        protected string News_List_End(string isDiv)
        {
            if (isDiv == "true")
                return newLine;
            else
                return "</table>" + newLine;
        }
        /// <summary>
        /// ��ȡ����ǰ����
        /// </summary>
        /// <param name="ShowNavi">�Ƿ���ʾ����</param>
        /// <param name="NaviPic">����ͼƬ��ַ</param>
        /// <param name="i">��ǰѭ���ļ�¼��</param>
        /// <returns>���ص���</returns>
        protected string getNavi(string ShowNavi,string NaviCSS, string NaviPic, int i)
        {
            string strNavi = string.Empty;
            string strNaviCSS = string.Empty;
            string strNaviCSS_1 = string.Empty;
            if (NaviCSS != null && NaviCSS != "")
            {
                //���navicssΪ�գ�������ǰ̨CSS�п���<dd>������,by simplt
                strNaviCSS = "<dd class=\"" + NaviCSS + "\">";
                strNaviCSS_1 = "</dd>";
            }
            switch (ShowNavi)
            {
                case "1":
                    i++;
                    strNavi = strNaviCSS + i.ToString() + strNaviCSS_1;
                    break;
                case "2":
                    if (i <= 26)
                        strNavi = strNaviCSS + ((char)(i + 65)).ToString() + strNaviCSS_1;
                    break;
                case "3":
                    if (i <= 26)
                        strNavi = strNaviCSS + ((char)(i + 97)).ToString() + strNaviCSS_1;
                    break;
                case "4":
                    strNavi = "<img border=\"0\" src=\"" + RelpacePicPath(NaviPic) + "\" />";
                    break;
                default:
                    break;
            }
            return strNavi+" ";
        }
    }
}
