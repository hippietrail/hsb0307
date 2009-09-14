using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Foosun.Config;

namespace Foosun.Publish
{
    /// <summary>
    /// ��ǩ�е�����
    /// </summary>
    public partial class LabelMass
    {
        protected enum EnumLabelType
        {
            List, GroupMember, ConstrNews, NewUser, TopUser, UserLogin, OtherJS, statJS, surveyJS, adJS, sysJS,
            freeJS, LastComm, TopNews, RSS, SpeicalNaviRead, SpecialNavi, ClassNaviRead, ClassNavi, SiteNavi, Metakey, MetaDesc, Frindlink,
            History, CorrNews, Sitemap, NorFilt, FlashFilt, Stat, Search, Position, PageTitle, unRule, ReadNews, ClassList, TodayPic, TodayWord, HistoryIndex, HotTag, CopyRight,
            ChannelList, ChannelClassList, ChannelContent, ChannelSearch, ChannelRSS, ChannelFlash
        };
        #region ��ǩ����
        /// <summary>
        /// Loop������Loop����Ϊ0����unLoop��ǩ��Ϊ0
        /// </summary>
        protected int Param_Loop;
        /// <summary>
        /// վȺID
        /// </summary>
        protected string Param_SiteID = "0";
        /// <summary>
        /// Ƶ��ID
        /// </summary>
        protected int Param_ChID = 0;
        /// <summary>
        /// ��ǰ����ĿID
        /// </summary>
        protected string Param_CurrentClassID;
        /// <summary>
        /// ��ǰ��ר��ID
        /// </summary>
        protected string Param_CurrentSpecialID;
        /// <summary>
        /// ��ǰ����ID
        /// </summary>
        protected string Param_CurrentNewsID;

        /// <summary>
        /// ��ǰ��(Ƶ��)��ĿID
        /// </summary>
        protected int Param_CurrentCHClassID;
        /// <summary>
        /// ��ǰ��(Ƶ��)ר��ID
        /// </summary>
        protected int Param_CurrentCHSpecialID;
        /// <summary>
        /// ��ǰ(Ƶ��)����ID
        /// </summary>
        protected int Param_CurrentCHNewsID;

        /// <summary>
        /// ��ǩ����
        /// </summary>
        protected EnumLabelType Param_LabelType;
        #endregion ��ǩ����
        /// <summary>
        /// ��ǩ��ʽ�Ƿ���Ч
        /// </summary>
        protected bool FormatValid = true;
        /// <summary>
        /// ��ʽ�Ƿ���˵��
        /// </summary>
        protected string InvalidInfo = string.Empty;
        /// <summary>
        /// ��ǩ�����岿��
        /// </summary>
        protected string Mass_Primary = string.Empty;
        /// <summary>
        /// ��ǩ�м������벿��
        /// </summary>
        protected string Mass_Inserted = string.Empty;
        /// <summary>
        /// ��ǩԭʼ����
        /// </summary>
        protected string Mass_Content = string.Empty;
        /// <summary>
        /// ��ǩ���в���
        /// </summary>
        protected LabelParameter[] _LblParams = null;
        /// <summary>
        /// ģ������
        /// </summary>
        protected TempType _TemplateType;
        /// <summary>
        /// ���캯��
        /// </summary>
        /// <param name="masscontent">��ǩ������</param>
        /// <param name="connection">���ݿ�����</param>
        /// <param name="currentclassid">��ǰ��ĿID����������ã��븳Ϊnull</param>
        /// <param name="currentspecialid">��ǰר��ID����������ã��븳Ϊnull</param>
        /// <param name="currentnewsid">��ǰ����ID����������ã��븳Ϊnull</param>
        public LabelMass(string masscontent, string currentclassid, string currentspecialid, string currentnewsid, int ChID, int currentchclassid, int currentchspecialid, int currentchnewsid)
        {
            Mass_Content = masscontent;
            Param_ChID = ChID;
            if (currentclassid == string.Empty || currentclassid==null){Param_CurrentClassID = null;}
            else{Param_CurrentClassID = currentclassid;}
            if (currentspecialid == string.Empty || currentspecialid == null){Param_CurrentSpecialID = null;}
            else{ Param_CurrentSpecialID = currentspecialid;}
            if (currentnewsid == string.Empty || currentnewsid == null){Param_CurrentNewsID = null;}
            else{Param_CurrentNewsID = currentnewsid;}
            Param_CurrentCHClassID = currentchclassid;
            Param_CurrentCHSpecialID = currentchspecialid;
            Param_CurrentCHNewsID = currentchnewsid;
        }
        /// <summary>
        /// ������ǩ����
        /// </summary>
        public void ParseContent()
        {
            int pos1 = Mass_Content.IndexOf(']');
            int pos2 = Mass_Content.LastIndexOf('[');
            //<--�޸��ߣ��⾲� ʱ�䣺2008-06-23 ���ϵͳjs��Ӵ���
            //�ڶ����޸� ʱ�䣺2008-06-24 ���ϵͳjs�ļ���������
            int tempi = Mass_Content.IndexOf("[");
            if (Mass_Content.Length > 0 && pos1 > 1 && pos2 > 1)
            {
                Mass_Primary = Mass_Content.Substring(tempi + 1, pos1 - 1);
                int n = pos2 - pos1 - 1;
                if (n > 0)
                    Mass_Inserted = Mass_Content.Substring(pos1 + 1, n);
            }
            //wjl-->
            ParsePrimary();
        }
        /// <summary>
        /// ������ǩ���������Ϊ����
        /// </summary>
        private void ParsePrimary()
        {
            if (Mass_Primary.IndexOf(",") > 0)
            {
                string[] _mass_p = Mass_Primary.Split(',');
                if (_mass_p[0].Equals("FS:Loop"))
                    Param_Loop = 1;
                else if (_mass_p[0].Equals("FS:unLoop"))
                    Param_Loop = 0;
                else
                {
                    FormatValid = false;
                    InvalidInfo = "��ǩ���ݲ�����[FS:unLoop��[FS:Loop��ʼ";
                }
                int n = _mass_p.Length;
                IList<LabelParameter> l = new List<LabelParameter>();
                l.Clear();
                for (int i = 1; i < n; i++)
                {
                    if (!FormatValid) break;
                    string s = _mass_p[i];
                    int pos = s.IndexOf('=');
                    if (pos < 0)
                        continue;
                    LabelParameter p;
                    p.LPName = s.Substring(0, pos).Trim();
                    p.LPValue = s.Substring(pos + 1).Trim();
                    #region �Ա�ǩ�ı�Ҫ��������һЩ����
                    switch (p.LPName)
                    {
                        case "FS:Number":
                            if (Param_Loop.Equals(1))
                            {
                                try
                                {
                                    Param_Loop = int.Parse(p.LPValue);
                                }
                                catch
                                {
                                    FormatValid = false;
                                    InvalidInfo = "FS:Number��ֵ������Ч������";
                                }
                            }
                            break;
                        case "FS:SiteID":
                            Param_SiteID = p.LPValue;
                            break;
                        case "FS:LabelType":
                            try
                            {
                                Param_LabelType = (EnumLabelType)System.Enum.Parse(typeof(EnumLabelType), p.LPValue);
                            }
                            catch
                            {
                                FormatValid = false;
                                InvalidInfo = "FS:LabelTypeָ�������Ͳ�����";
                            }
                            break;
                        case "FS:Root":
                            break;
                        default:
                            AddParameter(p, ref l);
                            break;
                    }
                    #endregion �Ա�ǩ�ı�Ҫ��������һЩ����
                }
                int ln = l.Count;
                if (FormatValid && ln > 0)
                {
                    _LblParams = new LabelParameter[ln];
                    l.CopyTo(_LblParams, 0);
                }
            }
        }
        /// <summary>
        /// ������ǩ����HTML
        /// </summary>
        /// <returns></returns>
        public string Parse()
        {
            if (!FormatValid)
                return Mass_Content;
            switch (this.Param_LabelType)
            {
                case EnumLabelType.List: return this.Analyse_List(null, null);
                case EnumLabelType.GroupMember: return this.Analyse_GroupMember();
                case EnumLabelType.ConstrNews: return this.Analyse_ConstrNews();
                case EnumLabelType.NewUser: return this.Analyse_NewUser();
                case EnumLabelType.TopUser: return this.Analyse_TopUser();
                case EnumLabelType.UserLogin: return this.Analyse_UserLogin();
                case EnumLabelType.OtherJS: return this.Analyse_OtherJS();
                case EnumLabelType.statJS: return this.Analyse_statJS();
                case EnumLabelType.surveyJS: return this.Analyse_surveyJS();
                case EnumLabelType.adJS: return this.Analyse_adJS();
                case EnumLabelType.sysJS: return this.Analyse_sysJS();
                case EnumLabelType.freeJS: return this.Analyse_freeJS();
                case EnumLabelType.LastComm: return this.Analyse_LastComm();
                case EnumLabelType.TopNews: return this.Analyse_TopNews();
                case EnumLabelType.RSS: return this.Analyse_RSS();
                case EnumLabelType.SpeicalNaviRead: return this.Analyse_SpeicalNaviRead();
                case EnumLabelType.SpecialNavi: return this.Analyse_SpecialNavi();
                case EnumLabelType.ClassNaviRead: return this.Analyse_ClassNaviRead();
                case EnumLabelType.ClassNavi: return this.Analyse_ClassNavi();
                case EnumLabelType.SiteNavi: return this.Analyse_SiteNavi();
                case EnumLabelType.History: return this.Analyse_History();
                case EnumLabelType.CorrNews: return this.Analyse_CorrNews();
                case EnumLabelType.Sitemap: return this.Analyse_Sitemap();
                case EnumLabelType.NorFilt: return this.Analyse_NorFilt();
                case EnumLabelType.FlashFilt: return this.Analyse_FlashFilt();
                case EnumLabelType.Stat: return this.Analyse_Stat();
                case EnumLabelType.Search: return this.Analyse_Search();
                case EnumLabelType.Position: return this.Analyse_Position(this.Param_ChID);
                case EnumLabelType.PageTitle: return this.Analyse_PageTitle(this.Param_ChID);
                case EnumLabelType.unRule: return this.Analyse_unRule();
                case EnumLabelType.ReadNews: return this.Analyse_ReadNews(0, 0, 0, 0, "", "", 0, 0, 1);
                case EnumLabelType.ClassList: return this.Analyse_ClassList();
                case EnumLabelType.TodayPic: return this.Analyse_TodayPic();
                case EnumLabelType.TodayWord: return this.Analyse_TodayWord();
                case EnumLabelType.Metakey: return this.Analyse_Meta(0,this.Param_ChID);
                case EnumLabelType.MetaDesc: return this.Analyse_Meta(1,this.Param_ChID);
                case EnumLabelType.HotTag: return this.Analyse_HotTag();
                case EnumLabelType.HistoryIndex: return this.Analyse_HistoryIndex();
                case EnumLabelType.CopyRight: return this.Analyse_CopyRight();
                case EnumLabelType.Frindlink: return this.Analyse_FrindList();
                default:
                    return string.Empty;
            }
        }

        /// <summary>
        /// ������ǩ����HTML
        /// </summary>
        /// <returns></returns>
        public string Parse(int ChID)
        {
            if (!FormatValid)
                return Mass_Content;
            switch (this.Param_LabelType)
            {
                case EnumLabelType.ChannelList: return this.Analyse_ChannellList("",ChID);
                case EnumLabelType.ChannelClassList: return this.Analyse_ChannelClassList(ChID);
                case EnumLabelType.ChannelContent: return this.Analyse_ChannelContent(ChID);
                case EnumLabelType.ChannelSearch: return this.Analyse_ChannelSearch(ChID);
                case EnumLabelType.ChannelRSS: return this.Analyse_ChannelRSS(ChID);
                case EnumLabelType.ChannelFlash: return this.Analyse_ChannelFlash(ChID);
                default:
                    return string.Empty;
            }
        }

        /// <summary>
        /// ��һ�����������������
        /// </summary>
        /// <param name="lp">��ǩ����</param>
        /// <param name="list">�б�</param>
        private void AddParameter(LabelParameter lp, ref IList<LabelParameter> list)
        {
            bool flag = true;
            foreach (LabelParameter p in list)
            {
                if (p.LPName.Equals(lp.LPName))
                {
                    flag = false;
                    break;
                }
            }
            if (flag)
            {
                list.Add(lp);
            }
        }
        /// <summary>
        /// ��ǩ�ĳ�ʼ����
        /// </summary>
        public string Content
        {
            get { return Mass_Content; }
        }
        /// <summary>
        /// ����ĳһ��ǩ������ֵ
        /// </summary>
        /// <param name="ParamName">��ǩ����������</param>
        /// <returns></returns>
        private string GetParamValue(string ParamName)
        {
            string result = string.Empty;
            if (_LblParams == null)
                return null;
            int n = _LblParams.Length;
            for (int i = 0; i < n; i++)
            {
                LabelParameter p = _LblParams[i];
                if (p.LPName.Equals(ParamName))
                {
                    result = p.LPValue;
                    break;
                }
            }
            return result.Equals(string.Empty) ? null : result;
        }
        /// <summary>
        /// ��ǩ���ݸ�ʽ����ȷ��˵��
        /// </summary>
        public string FormatInvalidMsg
        {
            get { return InvalidInfo; }
        }
        /// <summary>
        /// ���û��ȡ��ǰ��ģ������
        /// </summary>
        public TempType TemplateType
        {
            set { _TemplateType = value; }
            get { return _TemplateType; }
        }
    }
}
