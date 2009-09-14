using System;
using System.Collections.Generic;
using System.Data;
using Foosun.Config;

namespace Foosun.Publish
{
    public partial class LabelMass
    {
        /// <summary>
        /// ������JS
        /// </summary>
        /// <returns></returns>
        public string Analyse_OtherJS() { return ""; }


        /// <summary>
        /// ͳ�Ƶ��ñ�ǩ
        /// </summary>
        /// <returns>���ص���JS����</returns>
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
        /// ͶƱ���ñ�ǩ
        /// </summary>
        /// <returns>���ص���JS����</returns>
        public string Analyse_surveyJS()
        {
            string str_JSID = this.GetParamValue("FS:JSID");
            string str_SpanID = str_JSID + "_" + Foosun.Common.Rand.Number(5);
            string str_JsCode = "";
            if (str_JSID != null)
            {
                str_JsCode = "<script src=\"" + CommonData.SiteDomain + "/survey/VoteJs.aspx?TID=" + str_JSID + "&PicW=60&ajaxid=Vote_HTML_ID_" + str_SpanID + "\" language=\"JavaScript\"></script><span id=\"Vote_HTML_ID_" + str_SpanID + "\">���ڼ���...</span>";
            }
            return str_JsCode;
        }

        /// <summary>
        /// �����ñ�ǩ
        /// </summary>
        /// <returns>���ص���JS����</returns>
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
        /// ϵͳJS���ñ�ǩ
        /// </summary>
        /// <returns>�����б�</returns>
        public string Analyse_sysJS()
        {
            string str_sysJSID = this.GetParamValue("FS:JSID");
            string str_jsCode = "";
            if (str_sysJSID != null)
            {
                IDataReader rd = CommonData.DalPublish.GetJsPath(str_sysJSID);
                if (rd.Read())
                {
                    string jsFlies = CommonData.SiteDomain + "" + (rd.GetString(0) + "/" + rd.GetString(1)).Replace("//", "/") + ".js";
                    str_jsCode = "<script language=\"javascript\" src=\"" + jsFlies + "\"></script>";
                }
                rd.Close();
            }
            return str_jsCode;
        }

        /// <summary>
        /// ����JS���ñ�ǩ
        /// </summary>
        /// <returns>�����б�</returns>
        public string Analyse_freeJS()
        {
            string str_freeJSID = this.GetParamValue("FS:JSID");
            string str_jsCode = "";
            if (str_freeJSID != null)
            {
                IDataReader rd = CommonData.DalPublish.GetJsPath(str_freeJSID);
                if (rd.Read())
                {
                    string jsFlies = CommonData.SiteDomain + (rd.GetString(0) + "/" + rd.GetString(1)).Replace("//", "/") + ".js";
                    str_jsCode = "<script language=\"javascript\" src=\"" + jsFlies + "\"></script>";
                }
                rd.Close();
            }
            return str_jsCode;
        }
    }
}
