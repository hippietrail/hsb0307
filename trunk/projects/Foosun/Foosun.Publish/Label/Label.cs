using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using System.Data;
using Foosun.Config;

namespace Foosun.Publish
{
    /// <summary>
    /// ��ǩ����
    /// </summary>
    public struct LabelParameter
    {
        /// <summary>
        /// ��������
        /// </summary>
        public string LPName;
        /// <summary>
        /// ����ֵ
        /// </summary>
        public string LPValue;
    }
    /// <summary>
    /// ��ǩ����
    /// </summary>
    public enum LabelType { Free, Custom, Class, Channel }
    /// <summary>
    /// ��ǩ��
    /// </summary>
    public class Label
    {
        /// <summary>
        /// ��ǩ����
        /// </summary>
        protected string _LabelName = string.Empty;
        /// <summary>
        /// ��ǩ����
        /// </summary>
        protected LabelType _LabelType;
        /// <summary>
        /// ���յ�HTML����
        /// </summary>
        protected string _FinalHtmlCode = string.Empty;
        /// <summary>
        /// ��ǰ��ģ������
        /// </summary>
        protected TempType _TemplateType;
        /// <summary>
        /// ��ǰ����ĿID
        /// </summary>
        protected string _CurrentClassID = null;
        /// <summary>
        /// ��ǰ��ר��ID
        /// </summary>
        protected string _CurrentSpecialID = null;
        /// <summary>
        /// ��ǰ����ID
        /// </summary>
        protected string _CurrentNewsID = null;


        /// <summary>
        /// ��ǰ��Ƶ����ĿID
        /// </summary>
        protected int _CurrentCHClassID;
        /// <summary>
        /// ��ǰ��Ƶ��ר��ID
        /// </summary>
        protected int _CurrentCHSpecialID;
        /// <summary>
        /// ��ǰƵ������ID
        /// </summary>
        protected int _CurrentCHNewsID;

        protected int _CurrentChID;

        //-<-wjl 2008-07-22 ��������
        /// <summary>
        ///�Ƿ���������
        /// </summary>
        protected bool _isConten;

        /// <summary>
        ///�Ƿ���������
        /// </summary>
        public bool IsConten
        {
            set
            {
                this._isConten = value;
            }
            get
            {
                return _isConten;
            }
        }
        //--wjl>

        /// <summary>
        /// ���캯��
        /// </summary>
        /// <param name="labelname">��ǩ����</param>
        public Label(string labelname,LabelType labeltype)
        {
            _LabelName = labelname;
            _LabelType = labeltype;
        }
        /// <summary>
        /// ��ǩ����
        /// </summary>
        public string LabelName
        {
            get { return _LabelName; }
        }
        /// <summary>
        /// ������ǩ���ಢ���ر�ǩʵ��
        /// </summary>
        /// <returns>�����ǩ���ͷ��ر�ǩʵ��</returns>
        public static Label GetLabel(string labelname)
        {
            string _labelname = labelname.ToUpper();
            if (Regex.Match( _labelname,@"\{FS_FREE_[^\}]+\}", RegexOptions.Compiled).Success)
            {
                return new FreeLabel(labelname, LabelType.Free);
            }
            else if (Regex.Match(_labelname, @"\{FS_DYN[^\}]+\}", RegexOptions.Compiled).Success)
            {
                return new DynamicLabel(labelname, LabelType.Class);
            }
            else if (Regex.Match(_labelname, @"\{FS_CH\$\d+_[^\}]+\}", RegexOptions.Compiled).Success)
            {
                string getReplaceStr = _labelname.Replace("{FS_CH$", "");
                int pLnamee = getReplaceStr.IndexOf("_");
                string FileChHTML = getReplaceStr.Substring(0, pLnamee);
                ChannelLabel chlbl = new ChannelLabel(labelname, LabelType.Channel);
                chlbl.CHID = int.Parse(FileChHTML);
                return chlbl;
            }
            else if (Regex.Match(_labelname, @"\{FS_[^\}]+\}", RegexOptions.Compiled).Success)
            {
                return new CustomLabel(labelname, LabelType.Custom);
            }
            else
            {
                throw new Exception("��ǩ���ƷǷ�");
            }
        }
        /// <summary>
        /// ��ǰ��ǩ������
        /// </summary>
        public LabelType MyType
        {
            get { return _LabelType; }
        }
        /// <summary>
        /// �����ݿ�ȡ�ñ�ǩ������
        /// </summary>
        /// <param name="cn"></param>
        public virtual void GetContentFromDB()
        {
        }
        /// <summary>
        /// �������յ�HTML����
        /// </summary>
        /// <param name="cn"></param>
        public virtual void MakeHtmlCode()
        {
        }
        /// <summary>
        /// ���յı�ǩHTML����
        /// </summary>
        public string FinalHtmlCode
        {
            get { return _FinalHtmlCode; }
        }
        /// <summary>
        /// ���û��ȡ��ǰ��ģ������
        /// </summary>
        public TempType TemplateType
        {
            set { _TemplateType = value; }
            get { return _TemplateType; }
        }
        /// <summary>
        /// ��ǰ����ĿID
        /// </summary>
        public string CurrentClassID
        {
            set { _CurrentClassID = value; }
        }
        /// <summary>
        /// ��ǰ��ר��ID
        /// </summary>
        public string CurrentSpecialID
        {
            set { _CurrentSpecialID = value; }
        }
        /// <summary>
        /// ��ǰ����ID
        /// </summary>
        public string CurrentNewsID
        {
            set { _CurrentNewsID = value; }
        }


        /// <summary>
        /// ��ǰ��Ƶ����ĿID
        /// </summary>
        public int CurrentChClassID
        {
            set { _CurrentCHClassID = value; }
        }
        /// <summary>
        /// ��ǰ��Ƶ��ר��ID
        /// </summary>
        public int CurrentCHSpecialID
        {
            set { _CurrentCHSpecialID = value; }
        }
        /// <summary>
        /// ��ǰƵ������ID
        /// </summary>
        public int CurrentCHNewsID
        {
            set { _CurrentCHNewsID = value; }
        }
        /// <summary>
        /// ��ǰƵ��ID
        /// </summary>
        public int CurrentChID
        {
            set { _CurrentChID = value; }
        }
    }
}
