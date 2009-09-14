using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using System.Data;
using Foosun.Config;

namespace Foosun.Publish
{
    /// <summary>
    /// ���ɱ�ǩ
    /// </summary>
    public class FreeLabel : Label
    {
        /// <summary>
        /// ���ɱ�ǩ����
        /// </summary>
        struct StParam
        {
            /// <summary>
            /// ��������
            /// </summary>
            public string name;
            /// <summary>
            /// ����SQL����λ��
            /// </summary>
            public int pos;
        }
        /// <summary>
        /// ���ɱ�ǩ��SQL���
        /// </summary>
        private string LabelSQL = string.Empty;
        /// <summary>
        /// ���ɱ�ǩ��ʽ
        /// </summary>
        private string LabelStyle = string.Empty;
        /// <summary>
        /// ���캯��
        /// </summary>
        /// <param name="labelname">���ɱ�ǩ����</param>
        public FreeLabel(string labelname,LabelType labeltype)
            : base(labelname, labeltype)
        { }
        /// <summary>
        /// �����ݿ�ȡ�����ɱ�ǩ����
        /// </summary>
        /// <param name="cn">�Ѵ򿪵����ݿ�����</param>
        public override void GetContentFromDB()
        {
            IDataReader rd = CommonData.DalPublish.GetFreeLabelContent(_LabelName);
            if (rd.Read())
            {
                LabelSQL = rd.GetString(0);
                if (!rd.IsDBNull(1)) LabelStyle = rd.GetString(1);
            }
            rd.Close();
        }
        /// <summary>
        /// �������յ�HTML����
        /// </summary>
        /// <param name="cn"></param>
        public override void MakeHtmlCode()
        {
            if (LabelStyle == string.Empty)
            {
                this._FinalHtmlCode = string.Empty;
                return;
            }
            //try
            //{
                string FinalStr = this.LabelStyle;
                #region ʱ�䴦��
                string pattertm = @"\[\$[^\$]+\$\]";
                Regex regex = new Regex(pattertm, RegexOptions.Compiled);
                Match match = regex.Match(FinalStr);
                DateTime Now = DateTime.Now;
                while (match.Success)
                {
                    string tm;
                    string _tm = tm = match.Value;
                    _tm = Regex.Replace(_tm, @"^\[\$|\$\]$", "");
                    _tm = _tm.Replace("YY02", Now.Year.ToString().Remove(0, 2));
                    _tm = _tm.Replace("YY04", Now.Year.ToString());
                    _tm = _tm.Replace("MM", Now.Month.ToString());
                    _tm = _tm.Replace("DD", Now.Day.ToString());
                    _tm = _tm.Replace("HH", Now.Hour.ToString());
                    _tm = _tm.Replace("MI", Now.Minute.ToString());
                    _tm = _tm.Replace("SS", Now.Second.ToString());
                    FinalStr = FinalStr.Replace(tm, _tm);
                    match = regex.Match(FinalStr);
                }
                //[$YY02��MM��DD��$]���ڸ�ʽ:YY02����2λ�����(��06��ʾ2006��),YY04��ʾ4λ�������(2006)��MM�����£�DD�����գ�HH����Сʱ��MI����֣�SS�����롣
                #endregion
                IList<StParam> FieldsList = ParseFields(FinalStr);
                DataTable dt = CommonData.DalPublish.ExecuteSql(LabelSQL);
                //��¼��ѭ����¼�ı��
                List<int> UnLoopNum = new List<int>();
                #region ���Ҳ�ѭ��
                string pattern = @"\{\*(?<n>\d+)(?<c>[\S\s]*?)\*\}";
                Regex reg = new Regex(pattern, RegexOptions.Compiled);
                Match m = reg.Match(FinalStr);
                while (m.Success)
                {
                    string rcd = m.Value;
                    string newrcd = m.Groups["c"].Value.Trim();
                    int rcdindex = Convert.ToInt32(m.Groups["n"].Value);
                    UnLoopNum.Add(rcdindex - 1);
                    if (FieldsList != null)
                    {
                        for (int i = 0; i < FieldsList.Count; i++)
                        {
                            string FieldName = FieldsList[i].name;
                            string FieldValue = string.Empty;
                            if (dt != null && dt.Rows.Count >= rcdindex && dt.Rows[rcdindex - 1][FieldsList[i].pos] != DBNull.Value)
                            {
                                FieldValue = dt.Rows[rcdindex - 1][FieldsList[i].pos].ToString();
                            }
                            newrcd = ReplaceField(newrcd, FieldName, FieldValue);
                            //dt.TableName
                        }
                    }
                    FinalStr = FinalStr.Replace(rcd, newrcd);
                    m = m.NextMatch();
                }
                #endregion ���Ҳ�ѭ��
                #region ����ѭ��
                pattern = @"\{\#[\s\S]*?\#\}";
                Regex r = new Regex(pattern, RegexOptions.Compiled);
                m = r.Match(FinalStr);
                while (m.Success)
                {
                    string mstr = m.Value;
                    string _mstr = mstr.Substring(2, mstr.Length - 4);
                    string reslt = string.Empty;
                    if (dt != null)
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            if (UnLoopNum.Contains(i))
                                continue;
                            UnLoopNum.Add(i);
                            string valstr = _mstr;
                            if (FieldsList != null)
                            {
                                for (int j = 0; j < FieldsList.Count; j++)
                                {
                                    string FieldName = FieldsList[j].name;
                                    string FieldValue = string.Empty;
                                    if (dt.Rows[i][FieldsList[j].pos] != DBNull.Value)
                                    {
                                        FieldValue = dt.Rows[i][FieldsList[j].pos].ToString();
                                    }
                                    valstr = ReplaceField(valstr, FieldName, FieldValue);
                                }
                            }
                            reslt += valstr;
                        }
                    }
                    FinalStr = FinalStr.Replace(mstr, reslt);
                    m = m.NextMatch();
                }
                #endregion ����ѭ��
                FieldsList.Clear();
                dt.Clear();
                dt.Dispose();
                this._FinalHtmlCode = FinalStr;
            }
            //catch
            //{
            //    this._FinalHtmlCode = string.Empty;
            //}
        
       /// <summary>
       /// ����SQL�����ֶ�λ��
       /// </summary>
       /// <param name="Input"></param>
       /// <returns></returns>
        private IList<StParam> ParseFields(string Input)
        {
            string SqlFields = Regex.Match(LabelSQL, @"^select\ +(top\ +\d+\ +)?(?<flds>.+)\ +from\ +.+", RegexOptions.Compiled | RegexOptions.IgnoreCase).Groups["flds"].Value.Trim();
            if (SqlFields.Equals(string.Empty))
            {
                return null;
            }
            string[] Fields = null;
            if (SqlFields.IndexOf(",") > 0)
                Fields = SqlFields.Trim().Split(',');
            else
                Fields = new string[] { SqlFields };
            string pattern = @"\[\*(?<fld>[\s\S]+?)\*\]";
            IList<StParam> pms = new List<StParam>();
            Regex reg = new Regex(pattern, RegexOptions.Compiled);
            Match m = reg.Match(Input);
            while (m.Success)
            {
                StParam p;
                p.name = m.Groups["fld"].Value;
                p.pos = -1;
                bool flag = false;
                foreach (StParam sp in pms)
                {
                    if (sp.name.Equals(p.name))
                    {
                        flag = true;
                        break;
                    }
                }
                if (!flag)
                {
                    for (int i = 0; i < Fields.Length; i++)
                    {
                        if (Fields[i].Trim().Equals(p.name.Trim()))
                        {
                            p.pos = i;
                            pms.Add(p);
                            break;
                        }
                    }
                }
                m = m.NextMatch();
            }
            return pms;
        }
        protected string ReplaceField(string Input,string FieldName,string FieldValue)
        {
            if (Input == null || Input.Trim() == string.Empty)
                return string.Empty;
            string RetVal = Input;
            string pattern = @"\(\#[Ll][Ee][Ff][Tt]\(\[\*" + Regex.Escape(FieldName) + @"\*\]\,(?<n>\d+)\)\#\)";
            Regex r = new Regex(pattern, RegexOptions.Compiled);
            Match mymatch = r.Match(Input);
            if (mymatch.Success)
            {
                int pos = int.Parse(mymatch.Groups["n"].Value);
                FieldValue = Foosun.Common.Input.GetSubString(FieldValue, pos);
                RetVal = Regex.Replace(Input, pattern, FieldValue);
            }
            else
            {

                //pattern = @"fs_news_class";
                //r=new Regex(pattern, RegexOptions.Compiled);
                //mymatch = r.Match(LabelSQL);
                //if (mymatch.Success && (FieldName.ToUpper() == "CLASSID"))
                //{
                //    ����Ŀ����
                //    string urls=CommonData.getClassURL(FieldValue);
                //    string linkstring = "<a href=\"" + urls + "\">" + FieldName + "</a>";
                //    RetVal = Input.Replace("[*" + FieldName + "*]", urls);
                //}
                //else
                //{
                //    pattern = @"fs_news";
                //    r = new Regex(pattern, RegexOptions.Compiled);
                //    mymatch = r.Match(LabelSQL);
                //    if (mymatch.Success && (FieldName.ToUpper() == "NEWSID"))
                //    {
                //        ����������
                //        string urls = CommonData.getNewsURLFormID(FieldValue, Foosun.Config.DBConfig.CmsConString);
                //        string linkstring = "<a href=\"" + urls + "\">" + FieldName + "</a>";
                //        RetVal = Input.Replace("[*" + FieldName + "*]", urls);
                //    }
                //    else
                //    {
                //        RetVal = Input.Replace("[*" + FieldName + "*]", FieldValue);
                //    }
                //}
                string tabStr = testTable(FieldName);
                if (tabStr == "fs_news_class")
                {
                    string urls = CommonData.getClassURL(FieldValue);
                    string linkstring = "<a href=\"" + urls + "\">" + FieldName + "</a>";
                    RetVal = Input.Replace("[*" + FieldName + "*]", urls);
                }
                else if (tabStr == "fs_news")
                {
                    string urls = CommonData.getNewsURLFormID(FieldValue, Foosun.Config.DBConfig.CmsConString);
                    string linkstring = "<a href=\"" + urls + "\">" + FieldName + "</a>";
                    RetVal = Input.Replace("[*" + FieldName + "*]", urls);
                }
                else
                {
                    RetVal = Input.Replace("[*" + FieldName + "*]", FieldValue);
                }
            }
            return RetVal;
        }

        protected string testTable(string FieldName)
        {
            string returnStr="";
            string pattern = "";
            string fld = FieldName;
            string[] arr = null;
            if (FieldName.IndexOf('.') != -1)
            {
                arr = FieldName.Split('.');
                returnStr=arr[0];
                fld = arr[1];
            }
            else
            {

                pattern = @"fs_news_class";
                Regex r = new Regex(pattern, RegexOptions.Compiled);
                Match mymatch = r.Match(LabelSQL);
                if (mymatch.Success)
                {
                    returnStr = "fs_news_class";
                }
                else
                {
                    pattern = @"fs_news";
                    r = new Regex(pattern, RegexOptions.Compiled);
                    mymatch = r.Match(LabelSQL);
                    if (mymatch.Success)
                    {
                        //����������
                        returnStr = "fs_news";
                    }
                }
            }
            returnStr = returnStr.ToLower();
            fld = fld.ToLower();
            if (returnStr == "fs_news_class" && fld == "classid")
            {
                returnStr="fs_news_class";
            }
            else if (returnStr == "fs_news" && fld == "newsid")
            {
                returnStr = "fs_news";
            }
            else
            {
                returnStr = "";
            }
           
            return returnStr;
        }
    }
}
