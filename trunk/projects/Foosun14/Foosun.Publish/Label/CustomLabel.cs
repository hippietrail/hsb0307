using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Text.RegularExpressions;
using Foosun.Config;
using System.Collections;

namespace Foosun.Publish
{
    /// <summary>
    /// 自定义标签
    /// </summary>
    public class CustomLabel : Label
    {
        public static DataTable _lableTableInfo = new DataTable();
        /// <summary>
        /// 标签参数
        /// </summary>
        //private IList<LabelMass> LblMassList;
        /// <summary>
        /// 标签内容中的前面自定义内容
        /// </summary>
        private string Custom_Front = string.Empty;
        /// <summary>
        /// 标签内容中的前面自定义内容
        /// </summary>
        private string Custom_Medial = string.Empty;
        /// <summary>
        /// 标签内容中的后面自定义内容
        /// </summary>
        private string Custom_Terminal = string.Empty;
        /// <summary>
        /// 标签内容
        /// </summary>
        private string LabelContent = string.Empty;
        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="labelname">标签名称</param>
        public CustomLabel(string labelname, LabelType labeltype)
            : base(labelname, labeltype)
        {
            if (_lableTableInfo.Columns.Count == 0)
            {
                _lableTableInfo.Columns.Add("LabelID", typeof(string));
                _lableTableInfo.Columns.Add("Label_Name", typeof(string));
                _lableTableInfo.Columns.Add("Label_Content", typeof(string));
            }
        }
        /// <summary>
        /// 从数据库获取标签内容
        /// </summary>
        /// <param name="cn">已打开的数据库连接</param>
        public override void GetContentFromDB()
        {
            //LabelContent = CommonData.DalPublish.GetSysLabelContent(_LabelName);
            //查询出所有的标签内容，将其放入缓存中
            if (_lableTableInfo.Rows.Count == 0)
            {
                IDataReader reader = CommonData.DalPublish.GetSysLabelContentByAll();
                DataRow drs = null;
                while (reader.Read())
                {
                    drs = _lableTableInfo.NewRow();
                    drs["LabelID"] = reader["LabelID"].ToString();
                    drs["Label_Name"] = reader["Label_Name"].ToString();
                    drs["Label_Content"] = reader["Label_Content"].ToString();

                    _lableTableInfo.Rows.Add(drs);
                }
            }

            //查找指定标签内容
            DataRow[] labObj = _lableTableInfo.Select("Label_Name='" + _LabelName + "'");//[_LabelName];
            DataRow row = null;
            if (labObj.Length != 0)
            {
                row = labObj[0];
                LabelContent = row["Label_Content"].ToString();
            }
            else
            {
                LabelContent = string.Empty;
            }
                

            //<--wjl  2008-07-22 解决是否允许评论问题
            if (!IsConten)
            {
                LabelContent = LabelContent.Replace("{#CommForm}", "");
            }
            //--wjl>
        }

        /// <summary>
        /// 解析自定义标签内容
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
                LabelMass labelmass = new LabelMass(mass, this._CurrentClassID, this._CurrentSpecialID, this._CurrentNewsID, this._CurrentChID, this._CurrentCHClassID, this._CurrentCHSpecialID, this._CurrentCHNewsID);
                labelmass.TemplateType = this._TemplateType;
                labelmass.ParseContent();
                string s = labelmass.Parse();
                content = content.Replace(mass, s);
                m = reg.Match(content);
            }
            this._FinalHtmlCode = content;
        }

        /// <summary>
        /// 生成最终的HTML代码
        /// </summary>
        /// <param name="cn"></param>
        public override void MakeHtmlCode()
        {
            ParseLabelConetent();
        }
    }
}
