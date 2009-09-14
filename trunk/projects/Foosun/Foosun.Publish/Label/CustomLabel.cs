using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Text.RegularExpressions;
using Foosun.Config;

namespace Foosun.Publish
{
    /// <summary>
    /// �Զ����ǩ
    /// </summary>
    public class CustomLabel : Label
    {
        /// <summary>
        /// ��ǩ����
        /// </summary>
        //private IList<LabelMass> LblMassList;
        /// <summary>
        /// ��ǩ�����е�ǰ���Զ�������
        /// </summary>
        private string Custom_Front = string.Empty;
        /// <summary>
        /// ��ǩ�����е�ǰ���Զ�������
        /// </summary>
        private string Custom_Medial = string.Empty;
        /// <summary>
        /// ��ǩ�����еĺ����Զ�������
        /// </summary>
        private string Custom_Terminal = string.Empty;
        /// <summary>
        /// ��ǩ����
        /// </summary>
        private string LabelContent = string.Empty;
        /// <summary>
        /// ���캯��
        /// </summary>
        /// <param name="labelname">��ǩ����</param>
        public CustomLabel(string labelname, LabelType labeltype)
            : base(labelname, labeltype)
        {
            //LblMassList = new List<LabelMass>();
        }
        /// <summary>
        /// �����ݿ��ȡ��ǩ����
        /// </summary>
        /// <param name="cn">�Ѵ򿪵����ݿ�����</param>
        public override void GetContentFromDB()
        {
            LabelContent = CommonData.DalPublish.GetSysLabelContent(_LabelName);
            //<--wjl  2008-07-22 ����Ƿ�������������
            if (!IsConten)
            {
                LabelContent = LabelContent.Replace("{#CommForm}", "");
            }
            //--wjl>
        }

        /// <summary>
        /// �����Զ����ǩ����
        /// </summary>
        protected void ParseLabelConetent()
        {
            string pattern = @"\[FS:unLoop,[^\]]+\][\s\S]*?\[/FS:unLoop\]|\[FS:Loop,[^\]]+\][\s\S]*?\[/FS:Loop\]";
            Regex reg = new Regex(pattern, RegexOptions.Compiled);
            string content = LabelContent;
            Match m = reg.Match(content);
            while (m.Success)
            {
                string mass = m.Value.Trim();
                LabelMass labelmass = new LabelMass(mass, this._CurrentClassID, this._CurrentSpecialID, this._CurrentNewsID,this._CurrentChID,this._CurrentCHClassID,this._CurrentCHSpecialID,this._CurrentCHNewsID);
                labelmass.TemplateType = this._TemplateType;
                labelmass.ParseContent();
                string s = labelmass.Parse();
                content = content.Replace(mass, s);
                m = reg.Match(content);
            }
            this._FinalHtmlCode = content;
        }

        /// <summary>
        /// �������յ�HTML����
        /// </summary>
        /// <param name="cn"></param>
        public override void MakeHtmlCode()
        {
            ParseLabelConetent();
        }
    }
}
