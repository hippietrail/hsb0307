using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;
using Foosun.Config;

namespace Foosun.Publish
{
    public enum TempType
    { Index, Class, News, Special,ChIndex,ChClass,ChNews,Chspecial }
    /// <summary>
    /// ģ����
    /// </summary>
    public class Template
    {
        /// <summary>
        /// ģ�������·��������
        /// </summary>
        protected string _temppath;
        /// <summary>
        /// ģ������
        /// </summary>
        protected TempType _temptype;
        /// <summary>
        /// ģ����ļ�����
        /// </summary>
        protected string _tempcontent = string.Empty;
        /// <summary>
        /// ģ������յ�����
        /// </summary>
        protected string _tempfinallyconent = string.Empty;
        /// <summary>
        /// ��ĿID
        /// </summary>
        protected string _classid = null;
        /// <summary>
        /// ��ǰ��ר��ID
        /// </summary>
        protected string _specialid = null;
        /// <summary>
        /// ��ǰ����ID
        /// </summary>
        protected string _newsid = null;
        /// <summary>
        /// Ƶ����ĿID
        /// </summary>
        protected int _chclassid;
        /// <summary>
        /// ��ǰ��Ƶ��ר��ID
        /// </summary>
        protected int _chspecialid;
        /// <summary>
        /// ��ǰƵ������ID
        /// </summary>
        protected int _chnewsid;
        /// <summary>
        /// ��ǰƵID
        /// </summary>
        protected int _chid;
        /// <summary>
        /// �����Ƿ���������
        /// </summary>
        protected bool _isContent;
        /// <summary>
        /// ���캯��
        /// </summary> 
        /// <param name="temppath">ģ������·��</param>
        /// <param name="TmptType">ģ������</param>
        public Template(string temppath, TempType temptype)
        {
            _temppath = temppath;
            _temptype = temptype;
        }
        /// <summary>
        /// ���û��ȡ��Ŀ���
        /// </summary>
        public string ClassID
        {
            set { _classid = value; }
            get { return _classid; }
        }
        /// <summary>
        /// ���û��ȡר����
        /// </summary>
        public string SpecialID
        {
            set { _specialid = value; }
            get { return _specialid; }
        }
        /// <summary>
        /// ���û��ȡ���ű��
        /// </summary>
        public string NewsID
        {
            set { _newsid = value; }
            get { return _newsid; }
        }
        /// <summary>
        /// (Ƶ��)���û��ȡ��Ŀ���
        /// </summary>
        public int CHClassID
        {
            set { _chclassid = value; }
            get { return _chclassid; }
        }
        /// <summary>
        /// (Ƶ��)���û��ȡר����
        /// </summary>
        public int CHSpecialID
        {
            set { _chspecialid = value; }
            get { return _chspecialid; }
        }
        /// <summary>
        /// (Ƶ��)���û��ȡ���ű��
        /// </summary>
        public int CHNewsID
        {
            set { _chnewsid = value; }
            get { return _chnewsid; }
        }

        /// <summary>
        /// (Ƶ��)id
        /// </summary>
        public int ChID
        {
            set { _chid = value; }
            get { return _chid; }
        }

        //-<-wjl 2008-07-22 ��������
        /// <summary>
        /// �����Ƿ���������
        /// </summary>
        public bool IsContent
        {
            set { _isContent = value; }
            get { return _isContent; }
        }
        //--wjl>

        /// <summary> 
        /// ת��ģ�����еı�ǩ
        /// </summary>
        public void ReplaceLabels()
        {
            string pattern = @"\{FS_[^\}]+\}";
            _tempfinallyconent = _tempcontent;
            Regex reg = new Regex(pattern, RegexOptions.Compiled);
            Match m = reg.Match(_tempfinallyconent);
            while (m.Success)
            {
                string myLabelName = m.Value;  
                Label theLabel = Label.GetLabel(myLabelName);
                theLabel.CurrentClassID = this._classid;
                theLabel.CurrentSpecialID = this._specialid;
                theLabel.CurrentNewsID = this._newsid;
                theLabel.CurrentChClassID = this._chclassid;
                theLabel.CurrentCHSpecialID = this._chspecialid;
                theLabel.CurrentCHNewsID = this._chnewsid;
                theLabel.CurrentChID = this._chid;
                theLabel.TemplateType = this._temptype;
                //-<-wjl 2008-07-22 ��������
                theLabel.IsConten = this.IsContent; //�Ƿ���������
                //--wjl>
                theLabel.GetContentFromDB();
                theLabel.MakeHtmlCode();
                string strFinalHtmlCode = theLabel.FinalHtmlCode;
                _tempfinallyconent = _tempfinallyconent.Replace(myLabelName, strFinalHtmlCode);
                m = reg.Match(_tempfinallyconent);
            }
        }
        /// <summary>
        /// ��ȡģ������ݵ�����
        /// </summary>
        public void GetHTML()
        {
            _tempcontent = General.ReadHtml(_temppath);
        }
        /// <summary>
        /// ��ȡģ���·��
        /// </summary>
        public string TempFilePath
        {
            get { return _temppath; }
        }
        /// <summary>
        /// ��ȡģ�������
        /// </summary>
        public string OriginalContent
        {
            get { return _tempcontent; }
        }
        /// <summary>
        /// ��ȡģ��ת����ǩ�������
        /// </summary>
        public string FinallyContent
        {
            get { return _tempfinallyconent; }
            set { _tempfinallyconent = value; }
        }
        /// <summary>
        /// ��ȡ��ǰģ�������
        /// </summary>
        public TempType MyTempType
        {
            get { return _temptype; }
        }
        /// <summary>
        /// �������ģ���·����ͬ�򷵻�true
        /// </summary>
        /// <param name="t1">�Ƚϵ�ģ��</param>
        /// <param name="t2">�Ƚϵ�ģ��</param>
        /// <returns></returns>
        public static bool operator ==(Template t1, Template t2)
        {
            if (t1.TempFilePath.Equals(t2.TempFilePath))
                return true;
            else
                return false;
        }
        /// <summary>
        /// �������ģ���·������ͬ�򷵻�true
        /// </summary>
        /// <param name="l1">�Ƚϵ�ģ��</param>
        /// <param name="l2">�Ƚϵ�ģ��</param>
        /// <returns></returns>
        public static bool operator !=(Template t1, Template t2)
        {
            if (t1.TempFilePath.Equals(t2.TempFilePath))
                return false;
            else
                return true;
        }
        /// <summary>
        /// ��д����
        /// </summary>
        /// <returns></returns>
        public override int GetHashCode()
        {
            return base.GetHashCode() * 2;
        }
        public override bool Equals(object obj)
        {
            return base.Equals(obj);
        }
    }
}