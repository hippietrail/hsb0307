using System;
using System.Collections.Generic;
using System.Data;
using Hg.Config;

namespace Hg.Publish
{
    public partial class LabelMass
    {
        /// <summary>
        /// 其它类JS
        /// </summary>
        /// <returns></returns>
        public string Analyse_OtherJS() { return ""; }


        /// <summary>
        /// 统计调用标签
        /// </summary>
        /// <returns>返回调用JS代码</returns>
        public string Analyse_statJS()
        {
            string str_JSID = this.GetParamValue("FS:JSID");
            string str_statShowType = this.GetParamValue("FS:statShowType");
            string str_JsCode = "";
            if (str_JSID != null)
            {
                str_JsCode = "<script language=\"javascript\" src=\"" + CommonData.SiteDomain + "/stat/mystat.aspx?code=" + str_statShowType + "&id=" + str_JSID + "\"></script>";
            }
            return str_JsCode;
        }

        /// <summary>
        /// 投票调用标签
        /// </summary>
        /// <returns>返回调用JS代码</returns>
        public string Analyse_surveyJS()
        {
            string str_JSID = this.GetParamValue("FS:JSID");
            string str_SpanID = str_JSID + "_" + Hg.Common.Rand.Number(5);
            string str_JsCode = "";
            if (str_JSID != null)
            {
                str_JsCode = "<script src=\"" + CommonData.SiteDomain + "/survey/VoteJs.aspx?TID=" + str_JSID + "&PicW=60&ajaxid=Vote_HTML_ID_" + str_SpanID + "\" language=\"JavaScript\"></script><span id=\"Vote_HTML_ID_" + str_SpanID + "\">正在加载...</span>";
            }
            return str_JsCode;
        }

        /// <summary>
        /// 广告调用标签
        /// </summary>
        /// <returns>返回调用JS代码</returns>
        public string Analyse_adJS()
        {
            string str_AdsID = this.GetParamValue("FS:JSID");
            string str_JsCode = string.Empty;
            if (str_AdsID != null)
            {
                str_JsCode = "<script language=\"javascript\" src=\"" + CommonData.SiteDomain + "/jsfiles/ads/show.aspx?adsID=" + str_AdsID + "\"></script>";
            }
            return str_JsCode;
        }
        /// <summary>
        /// 系统JS调用标签
        /// </summary>
        /// <returns>返回列表</returns>
        public string Analyse_sysJS()
        {
            string str_sysJSID = this.GetParamValue("FS:JSID");
            string str_jsCode = "";
            if (str_sysJSID != null)
            {
                str_jsCode = validateCatch(str_sysJSID);
            }
            return str_jsCode;
        }

        /// <summary>
        /// 自由JS调用标签
        /// </summary>
        /// <returns>返回列表</returns>
        public string Analyse_freeJS()
        {
            string str_freeJSID = this.GetParamValue("FS:JSID");
            string str_jsCode = "";
            if (str_freeJSID != null)
            {
                str_jsCode = validateCatch(str_freeJSID);
            }
            return str_jsCode;
        }

        /// <summary>
        /// 查询，如果缓存中有此JS信息，则从缓存中取，反之从数据库中取添加到缓存中
        /// </summary>
        /// <param name="jsID"></param>
        /// <returns></returns>
        private string validateCatch(string jsID)
        {
            DataRow[] rowList = CommonData.NewsJsList.Select("JsID='" + jsID + "'");
            IDataReader rd = null;
            DataRow row = null;
            if (rowList.Length == 0)
            {
                rd = CommonData.DalPublish.GetJsPath(jsID);
                if (rd.Read())
                {
                    row = CommonData.NewsJsList.NewRow();
                    row["JsID"] = rd.GetString(2);
                    row["jssavepath"] = rd.GetString(0);
                    row["jsfilename"] = rd.GetString(1);
                    
                }
                rd.Close();
                CommonData.NewsJsList.Rows.Add(row);
            }
            else
            {
                row = rowList[0];
            }

            string jsFlies = CommonData.SiteDomain + "" + (row["jssavepath"] + "/" + row["jsfilename"]).Replace("//", "/") + ".js";
            string str_jsCode = "<script language=\"javascript\" src=\"" + jsFlies + "\"></script>";
            return str_jsCode;
        }
    }
}
