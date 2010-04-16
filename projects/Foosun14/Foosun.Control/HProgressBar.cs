using System;
using System.Collections.Generic;
using System.Text;

namespace Foosun.Control
{
    /// <summary>
    /// ��ҳ������
    /// </summary>
    public class HProgressBar
    {
        /// <summary>
        /// �������ĳ�ʼ��
        /// </summary>
        public static void Start()
        {
            Start("���ڼ���...");
        }
        /// <summary>
        /// �������ĳ�ʼ��
        /// </summary>
        /// <param name="msg">�ʼ��ʾ����Ϣ</param>
        public static void Start(string msg)
        {
            string s = "<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<title></title>\r\n\r\n";
            s += "<link href=\"../../sysImages/" + Foosun.Config.UIConfig.CssPath() + "/css/css.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n";
            s += "<style>body {text-align:center;margin-top: 50px;}#ProgressBarSide {height:25px;border:1px #2F2F2F;width:65%;background:#EEFAFF;}</style>\r\n";
            s += "<script language=\"javascript\">\r\n";
            s += "function SetPorgressBar(msg, pos)\r\n";
            s += "{\r\n";
            s += "document.getElementById('ProgressBar').style.width = pos + \"%\";\r\n";
            s += "WriteText('Msg1',msg + \" �����\" + pos + \"%\");\r\n";
            s += "}\r\n";
            s += "function SetCompleted(msg)\r\n{\r\nif(msg==\"\")\r\nWriteText(\"Msg1\",\"��ɡ�\");\r\n";
            s += "else\r\nWriteText(\"Msg1\",msg);\r\n}\r\n";
            s += "function WriteText(id, str)\r\n";
            s += "{\r\n";
            s += "var strTag = '<span style=\"font-family:Verdana, Arial, Helvetica;font-size=11.5px;color:#DD5800\">' + str + '</span>';\r\n";
            s += "document.getElementById(id).innerHTML = strTag;\r\n";
            s += "}\r\n";
            s += "</script>\r\n</head>\r\n<body>\r\n";
            s += "<div id=\"Msg1\"><span style=\"font-family:Verdana, Arial, Helvetica;font-size=11.5px;color:#DD5800\">" + msg + "</span></div>\r\n";
            s += "<div id=\"ProgressBarSide\" align=\"left\" style=\"color:Silver;border-width:1px;border-style:Solid;\">\r\n";
            s += "<div id=\"ProgressBar\" style=\"background-color:#008BCE; height:25px; width:0%;color:#fff;\"></div>\r\n";
            s += "</div>\r\n</body>\r\n</html>\r\n";
            System.Web.HttpContext.Current.Response.Write(s);
            System.Web.HttpContext.Current.Response.Flush();
        }
        /// <summary>
        /// ����������
        /// </summary>
        /// <param name="Msg">�ڽ������Ϸ���ʾ����Ϣ</param>
        /// <param name="Pos">��ʾ���ȵİٷֱ�����</param>
        public static void Roll(string Msg, int Pos)
        {
            string jsBlock = "<script language=\"javascript\">SetPorgressBar('" + Msg + "'," + Pos + ");</script>";
            System.Web.HttpContext.Current.Response.Write(jsBlock);
            System.Web.HttpContext.Current.Response.Flush();
        }
    }
}
