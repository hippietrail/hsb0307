﻿using System;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Security.Cryptography;

namespace Foosun.Common
{
    public class Input
    {
        /// <summary>
        /// 检测是否整数型数据
        /// </summary>
        /// <param name="Num">待检查数据</param>
        /// <returns></returns>
        public static bool IsInteger(string Input)
        {
            if (Input == null)
            {
                return false;
            }
            else
            {
                return IsInteger(Input, true);
            }
        }
        /// <summary>
        /// 合并路径字符串
        /// </summary>
        /// <param name="paramesters"></param>
        /// <returns></returns>
        public static string Combine(params  string[] paramesters)
        {
            string result = string.Empty;
            if(paramesters.Length==0)
                return string.Empty;    
            result=paramesters[0];
            for (int i = 0; i < paramesters.Length-1; i++)
            {
                string temp = paramesters[i + 1];
                if (!string.IsNullOrEmpty(temp) && (temp[0] == '/' || temp[0] == '\\'))
                    temp = temp.Substring(1, temp.Length - 1);
                result += System.IO.Path.Combine(result[i].ToString(), temp);
            }
            return result;
        }
        /// <summary>
        /// 是否全是正整数
        /// </summary>
        /// <param name="Input"></param>
        /// <returns></returns>
        public static bool IsInteger(string Input, bool Plus)
        {
            if (Input == null)
            {
                return false;
            }
            else
            {
                string pattern = "^-?[0-9]+$";
                if (Plus)
                    pattern = "^[0-9]+$";
                if (Regex.Match(Input, pattern, RegexOptions.Compiled).Success)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        /// <summary>
        /// 判断输入是否为日期类型
        /// </summary>
        /// <param name="s">待检查数据</param>
        /// <returns></returns>
        public static bool IsDate(string s)
        {
            try
            {
                DateTime d = DateTime.Parse(s);
                return true;
            }
            catch
            {
                return false;
            }
        }


        /// <summary>
        /// 过滤字符串中的html代码
        /// </summary>
        /// <param name="Str"></param>
        /// <returns>返回过滤之后的字符串</returns>
        public static string LostHTML(string Str)
        {
            string Re_Str = "";
            if (Str != null)
            {
                if (Str != string.Empty)
                { 
                    string Pattern = "<\\/*[^<>]*>";
                    Re_Str = Regex.Replace(Str,Pattern,"");
                }
            }
            return (Re_Str.Replace("\\r\\n","")).Replace("\\r","");
        }

        public static string LostPage(string Str)
        {
            string Re_Str = "";
            if (Str != null)
            {
                if (Str != string.Empty)
                {
                    string Pattern = "\\[FS:PAGE\\/*[^<>]*\\$\\]";
                    Re_Str = Regex.Replace(Str, Pattern, "");
                }
            }
            return Re_Str;
        }

        public static string LostVoteStr(string Str)
        {
            string Re_Str = "";
            if (Str != null)
            {
                if (Str != string.Empty)
                {
                    string Pattern = "\\[FS:unLoop\\/*[^<>]*\\[\\/FS:unLoop\\]";
                    Re_Str = Regex.Replace(Str, Pattern, "");
                }
            }
            return Re_Str;
        }

        /// <summary>
        /// 根据新闻标题的属性设置返回设置后的标题
        /// </summary>
        /// <param name="Title">标题</param>
        /// <param name="TitleColor">标题颜色</param>
        /// <param name="IsB">是否粗体</param>
        /// <param name="IsI">是否斜体</param>
        /// <param name="TitleNum">返回标题字数</param>
        /// <returns>返回设置后的标题</returns>
        public static string GetColorTitleSubStr(string Title, string TitleColor, int IsB, int IsI,int TitleNum)
        {
            string Return_title = "";
            string FormatTitle = LostHTML(Title);
            if (FormatTitle != null && FormatTitle != string.Empty)
            {
                FormatTitle = GetSubString(FormatTitle, TitleNum);
                if (IsB == 1)
                {
                    FormatTitle = "<b>" + FormatTitle + "</b>";
                }
                if (IsI == 1)
                {
                    FormatTitle = "<i>" + FormatTitle + "</i>";
                }
                if (TitleColor != null && TitleColor != string.Empty)
                {
                    FormatTitle = "<font style=\"color:" + TitleColor + ";\">" + FormatTitle + "</font>";
                }
                Return_title = FormatTitle; 
            }
            return Return_title;
        }


        /// <summary>
        /// 截取字符串函数
        /// </summary>
        /// <param name="Str">所要截取的字符串</param>
        /// <param name="Num">截取字符串的长度</param>
        /// <returns></returns>
        public static string GetSubString(string Str, int Num)
        {
            string titlemore = Foosun.Config.UIConfig.titlemore;
            string titlenew = Foosun.Config.UIConfig.titlenew;
            if (Str == null || Str == "")
            {
                return "";
            }
            //if (titlenew == "1")
            //{
            //    Num -= 4;
            //}
            string outstr = string.Empty;
            int n = 0;
            foreach (char ch in Str)
            {
                n += System.Text.Encoding.Default.GetByteCount(ch.ToString());

                ////修改bug,中文字符计为一个字符,by 周峻平 2008-5-28
                //if (ch >= 0x4e00 && ch <= 0x9fa5)
                //{
                //    n = n - 1;
                //}

                if (n > Num)
                {
                    break;
                }
                else
                {
                    outstr += ch;
                }
            }
            if (titlemore == "1")
            {
                if (Str.Length > Num)
                {
                    outstr += "...";
                }
            }
            //if (titlenew == "1")
            //{
            //    outstr += "[New]";
            //}
            return outstr;
        }
        /// <summary>
        /// 截取字符串函数
        /// </summary>
        /// <param name="Str">所要截取的字符串</param>
        /// <param name="Num">截取字符串的长度</param>
        /// <param name="Num">截取字符串后省略部分的字符串</param>
        /// <returns></returns>
        public static string GetSubString(string Str, int Num, string LastStr)
        {
            return (Str.Length > Num) ? Str.Substring(0, Num) + LastStr : Str;
        }

        /// <summary>
        /// 验证字符串是否是图片路径
        /// </summary>
        /// <param name="Input">待检测的字符串</param>
        /// <returns>返回true 或 false</returns>
        public static bool IsImgString(string Input)
        {
            return IsImgString(Input, "/{@dirfile}/");
        }

        public static bool IsImgString(string Input, string checkStr)
        {
            bool re_Val = false;
            if (Input != string.Empty)
            {
                string s_input = Input.ToLower();
                if (s_input.IndexOf(checkStr.ToLower()) != -1 && s_input.IndexOf(".") != -1)
                {
                    string Ex_Name = s_input.Substring(s_input.LastIndexOf(".") + 1).ToString().ToLower();
                    if (Ex_Name == "jpg" || Ex_Name == "gif" || Ex_Name == "bmp" || Ex_Name == "png")
                    {
                        re_Val = true;
                    }
                }
            }
            return re_Val;
        }


        /// <summary>
        ///  将字符转化为HTML编码
        /// </summary>
        /// <param name="str">待处理的字符串</param>
        /// <returns></returns>
        public static string HtmlEncode(string Input)
        {
            return HttpContext.Current.Server.HtmlEncode(Input);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="Input"></param>
        /// <returns></returns>
        public static string HtmlDecode(string Input)
        {
            return HttpContext.Current.Server.HtmlDecode(Input);
        }

        /// <summary>
        /// URL地址编码
        /// </summary>
        /// <param name="Input"></param>
        /// <returns></returns>
        public static string URLEncode(string Input)
        {
            return HttpContext.Current.Server.UrlEncode(Input);
        }

        /// <summary>
        /// URL地址解码
        /// </summary>
        /// <param name="Input"></param>
        /// <returns></returns>
        public static string URLDecode(string Input)
        {
            return HttpContext.Current.Server.UrlDecode(Input);
        }
        /// <summary>
        /// 过滤字符
        /// </summary>
        /// <param name="Input"></param>
        /// <returns></returns>
        public static string Filter(string sInput)
        {
            if (sInput == null || sInput == "")
                return null;
            string sInput1 = sInput.ToLower();
            string output = sInput;
            string pattern = @"*|and|exec|insert|select|delete|update|count|master|truncate|declare|char(|mid(|chr(|'";
            if (Regex.Match(sInput1, Regex.Escape(pattern), RegexOptions.Compiled | RegexOptions.IgnoreCase).Success)
            {
                throw new Exception("字符串中含有非法字符!");
            }
            else
            {
                output = output.Replace("'", "''");
            }
            return output;
        }

        /// <summary>
        /// 过滤特殊字符/前台会员
        /// </summary>
        /// <param name="Input"></param>
        /// <returns></returns>
        public static string Htmls(string Input)
        {
            if (Input != string.Empty && Input != null)
            {
                string ihtml = Input.ToLower();
                ihtml=ihtml.Replace("<script", "&lt;script");
                ihtml = ihtml.Replace("script>", "script&gt;");
                ihtml = ihtml.Replace("<%", "&lt;%");
                ihtml = ihtml.Replace("%>", "%&gt;");
                ihtml = ihtml.Replace("<$", "&lt;$");
                ihtml = ihtml.Replace("$>", "$&gt;");
                return ihtml;
            }
            else
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// 字符串字符处理
        /// </summary>
        /// <param name="chr">等待处理的字符串</param>
        /// <returns>处理后的字符串</returns>
        /// //把HTML代码转换成TXT格式
        public static String ToTxt(String Input)
        {
            StringBuilder sb = new StringBuilder(Input);
            sb.Replace("&nbsp;", " ");
            sb.Replace("<br>", "\r\n");
            sb.Replace("<br>", "\n");
            sb.Replace("<br />", "\n");
            sb.Replace("<br />", "\r\n");
            sb.Replace("&lt;", "<");
            sb.Replace("&gt;", ">");
            sb.Replace("&amp;", "&");
            return sb.ToString();
        }

        /// <summary>
        /// 字符串字符处理
        /// </summary>
        /// <param name="chr">等待处理的字符串</param>
        /// <returns>处理后的字符串</returns>
        /// //把HTML代码转换成TXT格式
        public static String ToshowTxt(String Input)
        {
            StringBuilder sb = new StringBuilder(Input);
            sb.Replace("&lt;", "<");
            sb.Replace("&gt;", ">");
            return sb.ToString();
        }

        /// <summary>
        /// 把字符转化为文本格式
        /// </summary>
        /// <param name="Input"></param>
        /// <returns></returns>
        public static string ForTXT(string Input)
        {
            StringBuilder sb = new StringBuilder(Input);
            sb.Replace("<font", " ");
            sb.Replace("<span", " ");
            sb.Replace("<style", " ");
            sb.Replace("<div", " ");
            sb.Replace("<p", "");
            sb.Replace("</p>", "");
            sb.Replace("<label", " ");
            sb.Replace("&nbsp;", " ");
            sb.Replace("<br>", "");
            sb.Replace("<br />", "");
            sb.Replace("<br />", "");
            sb.Replace("&lt;", "");
            sb.Replace("&gt;", "");
            sb.Replace("&amp;", "");
            sb.Replace("<", "");
            sb.Replace(">", "");
            return sb.ToString();
        }
        /// <summary>
        /// 字符串字符处理
        /// </summary>
        /// <param name="chr">等待处理的字符串</param>
        /// <returns>处理后的字符串</returns>
        /// //把TXT代码转换成HTML格式

        public static String ToHtml(string Input)
        {
            StringBuilder sb = new StringBuilder(Input);
            sb.Replace("&", "&amp;");
            sb.Replace("<", "&lt;");
            sb.Replace(">", "&gt;");
            sb.Replace("\r\n", "<br />");
            sb.Replace("\n", "<br />");
            sb.Replace("\t", " ");
            //sb.Replace(" ", "&nbsp;");
            return sb.ToString();
        }

        /// <summary>
        /// MD5加密字符串处理
        /// </summary>
        /// <param name="Half">加密是16位还是32位；如果为true为16位</param>
        /// <param name="Input">待加密码字符串</param>
        /// <returns></returns>
        public static string MD5(string Input, bool Half)
        {
            string output = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(Input, "MD5").ToLower();
            if (Half)//16位MD5加密（取32位加密的9~25字符）
                output = output.Substring(8, 16);
            return output;
        }

        public static string MD5(string Input)
        {
            return MD5(Input, true);
        }

        /// <summary>
        /// 字符串加密  进行位移操作
        /// </summary>
        /// <param name="str">待加密数据</param>
        /// <returns>加密后的数据</returns>
        public static string EncryptString(string Input)
        {
            if (Input == string.Empty)
            {
                return Input;
            }
            string _temp = "";
            int _inttemp;
            char[] _chartemp = Input.ToCharArray();
            for (int i = 0; i < _chartemp.Length; i++)
            {
                _inttemp = _chartemp[i] + 1;
                _chartemp[i] = (char)_inttemp;
                _temp += _chartemp[i];
            }
            return _temp;
        }

        /// <summary>
        /// 字符串解密
        /// </summary>
        /// <param name="str">待解密数据</param>
        /// <returns>解密成功后的数据</returns>
        public static string NcyString(string Input)
        {
            string _temp = "";
            int _inttemp;
            char[] _chartemp = Input.ToCharArray();
            for (int i = 0; i < _chartemp.Length; i++)
            {
                _inttemp = _chartemp[i] - 1;
                _chartemp[i] = (char)_inttemp;
                _temp += _chartemp[i];
            }
            return _temp;
        }

        /// <summary>
        /// 检测含中文字符串实际长度
        /// </summary>
        /// <param name="str">待检测的字符串</param>
        /// <returns>返回正整数</returns>
        public static int NumChar(string Input)
        {
            ASCIIEncoding n = new ASCIIEncoding();
            byte[] b = n.GetBytes(Input);
            int l = 0;
            for (int i = 0; i <= b.Length - 1; i++)
            {
                if (b[i] == 63)//判断是否为汉字或全脚符号
                {
                    l++;
                }
                l++;
            }
            return l;
        }

        /// <summary>
        /// 检测是否合法日期
        /// </summary>
        /// <param name="str">待检测的字符串</param>
        /// <returns></returns>
        public static bool ChkDate(string Input)
        {
            try
            {
                DateTime t1 = DateTime.Parse(Input);
                return true;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// 转换日期时间函数
        /// </summary>
        /// <returns></returns>        
        public static string ReDateTime()
        {
            return System.DateTime.Now.ToString("yyyyMMdd");
        }


        
        /// <summary>
        /// 去除字符串最后一个','号
        /// </summary>
        /// <param name="chr">:要做处理的字符串</param>
        /// <returns>返回已处理的字符串</returns>
        /// /// CreateTime:2007-03-26 Code By DengXi
        public static string CutComma(string Input)
        {
            return CutComma(Input, ",");
        }

        public static string CutComma(string Input,string indexStr)
        {
            if (Input.IndexOf(indexStr) >= 0)
                return Input.Remove(Input.LastIndexOf(indexStr));
            else
                return Input;
        }

        /// <summary>
        /// 去掉首尾P
        /// </summary>
        /// <param name="Input"></param>
        /// <returns></returns>
        public static string RemovePor(string Input)
        {
            if (Input != string.Empty && Input != null)
            {
                string TMPStr = Input;
                if (Input.ToLower().Substring(0, 3) == "<p>")
                {
                    TMPStr = TMPStr.Substring(3);
                }
                if (TMPStr.Substring(TMPStr.Length-4) =="</p>")
                {
                    TMPStr = TMPStr.Remove(TMPStr.ToLower().LastIndexOf("</p>"));
                }
                return TMPStr;
            }
            else
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// 判断参数是否合法
        /// </summary>
        /// <param name="ID">要判断的参数</param>
        /// <returns>返回已处理的字符串</returns>

        public static string checkID(string ID)
        {
            if (ID == null && ID == string.Empty)
                throw new Exception("参数传递错误!<li>参数不能为空</li>");
            else
                ID = Filter(ID);
            return ID;
        }


        /// <summary>
        /// 去除编号字符串中的'-1'
        /// </summary>
        /// <param name="id"></param>
        /// <returns>如果为空则返回'IsNull'</returns>

        public static string Losestr(string id)
        {
            if (id == null || id == "" || id == string.Empty)
                return "IsNull";

            id = id.Replace("'-1',", "");

            if (id == null || id == "" || id == string.Empty)
                return "IsNull";
            else
                return id;
        }

        public static string FilterHTML(string html)
        {
            if (html == null)
                return "";
            System.Text.RegularExpressions.Regex regex1 = new System.Text.RegularExpressions.Regex(@"<script[\s\S]+</script *>", System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            System.Text.RegularExpressions.Regex regex2 = new System.Text.RegularExpressions.Regex(@" href *= *[\s\S]*script *:", System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            System.Text.RegularExpressions.Regex regex3 = new System.Text.RegularExpressions.Regex(@" on[\s\S]*=", System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            System.Text.RegularExpressions.Regex regex4 = new System.Text.RegularExpressions.Regex(@"<iframe[\s\S]+</iframe *>", System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            System.Text.RegularExpressions.Regex regex5 = new System.Text.RegularExpressions.Regex(@"<frameset[\s\S]+</frameset *>", System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            System.Text.RegularExpressions.Regex regex6 = new System.Text.RegularExpressions.Regex(@"\<img[^\>]+\>", System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            System.Text.RegularExpressions.Regex regex7 = new System.Text.RegularExpressions.Regex(@"</p>", System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            System.Text.RegularExpressions.Regex regex8 = new System.Text.RegularExpressions.Regex(@"<p>", System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            System.Text.RegularExpressions.Regex regex9 = new System.Text.RegularExpressions.Regex(@"<[^>]*>", System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            html = regex1.Replace(html, ""); //过滤<script></script>标记
            html = regex2.Replace(html, ""); //过滤href=javascript: (<A>) 属性
            html = regex3.Replace(html, " _disibledevent="); //过滤其它控件的on...事件
            html = regex4.Replace(html, ""); //过滤iframe
            html = regex5.Replace(html, ""); //过滤frameset
            html = regex6.Replace(html, ""); //过滤frameset
            html = regex7.Replace(html, ""); //过滤frameset
            html = regex8.Replace(html, ""); //过滤frameset
            html = regex9.Replace(html, "");
            html = html.Replace(" ", "");
            html = html.Replace("</strong>", "");
            html = html.Replace("<strong>", "");
            return html;
        }


        /// <summary>
        /// 判断字符串是否图片地址
        /// </summary>
        /// <param name="inputStr"></param>
        /// <returns></returns>
        public static string isPicStr(string inputStr)
        {
            string dimm = Foosun.Config.UIConfig.dirDumm;
            if (dimm.Trim() != string.Empty)
            {
                dimm = "/" + dimm;
            }
            string gStr = string.Empty;
            if (inputStr == string.Empty && inputStr == null)
            {
                gStr= string.Empty;
            }
            else
            {
                if (inputStr.IndexOf(".") > -1)
                {
                    int dotPosition = inputStr.IndexOf(".");
                    string getFile = inputStr.Substring(dotPosition);
                    int PType = 0;
                    switch (getFile.ToLower())
                    {
                        case ".jpg":
                            PType = 1;
                            break;
                        case ".gif":
                            PType = 1;
                            break;
                        case ".jpeg":
                            PType = 1;
                            break;
                        case ".png":
                            PType = 1;
                            break;
                        case ".bmp":
                            PType = 1;
                            break;
                        case ".ico":
                            PType = 1;
                            break;
                        default:
                            break;
                    }
                    if (PType == 1)
                    {
                        gStr = "<img src=\"" + dimm + inputStr.ToLower().Replace("{@dirfile}",Foosun.Config.UIConfig.dirFile) + "\" border=\"0\" />";
                    }
                    else
                    {
                        gStr = inputStr;
                    }
                }
                else
                {
                    gStr = inputStr;
                }
            }
            return gStr;
        }

        /// <summary>
        /// 转换日期时间,arjun
        /// </summary>
        /// <param name="datestr">一个预设的时间</param>
        /// <param name="str">要替换的字符串</param>
        /// <returns>替换后的字符串</returns>
        public static string replaceDateTimeStr(string datestr, string str)
        {
            DateTime dt = new DateTime();
            dt = DateTime.Parse(datestr);
            string _Str = str;
            string year02 = dt.ToString().PadRight(2);
            string year04 = dt.ToString();
            string month = dt.Month.ToString();
            string day = dt.Day.ToString();
            string hour = dt.Hour.ToString();
            string minute = dt.Minute.ToString();
            string second = dt.Second.ToString();
            _Str = _Str.Replace("{@year02}", year02);
            _Str = _Str.Replace("{@year04}", year04);
            _Str = _Str.Replace("{@month}", month);
            _Str = _Str.Replace("{@day}", day);
            _Str = _Str.Replace("{@hour}", hour);
            _Str = _Str.Replace("{@minute}", minute);
            _Str = _Str.Replace("{@second}", second);
            return _Str;
        }

        /// <summary>
        /// 自动分页转换,arjun
        /// </summary>
        /// <param name="Content">要转换的内容</param>
        /// <returns></returns>
        public static string AutoSplitPage(string Content,int count)
        {
            int i;
            bool iscount;
            string onechar;
            int strcount=0;
            string foundStr;
            string pages_i_str;
            string[] pages_i_arr;
            string split_str = "[FS:Page]";
            string returnStr="";
            returnStr = Content;

            int autopagesnum = count;//Convert.ToInt32(Foosun.Config.UIConfig.splitPageCount);
            if (Regex.Replace(returnStr, @"<[^>]*>", "").Length <= autopagesnum)
            {
                return returnStr;
            }
            if (Content != "" && autopagesnum != 0 && Content.IndexOf(split_str) == -1)
            {
                iscount = true;
                pages_i_str = "";
                for (i = 0; i < Content.Length; i++)
                {
                    onechar = Content.Substring(i, 1);
                    if (onechar == "<")
                    {
                        iscount = false;
                    }
                    else if (onechar == ">")
                    {
                        iscount = true;
                    }
                    else
                    {
                        if (iscount)
                        {
                            try
                            {
                                Convert.ToInt32(Convert.ToChar(onechar));
                                strcount += 1;
                            }
                            catch
                            {
                                strcount += 2;
                            }
                            if (strcount >= autopagesnum && i < Content.Length)
                            {
                                foundStr = Content.Substring(0, i);
                                if (AllowSplitPages(foundStr, "table|a|b|i|strong|div|span"))
                                {
                                    pages_i_str = pages_i_str + Convert.ToString(i) + ",";
                                    strcount = 0;
                                }
                            }
                        }
                    }
                }
                if (pages_i_str.Length > 1)
                {
                    pages_i_str = pages_i_str.Substring(0, pages_i_str.Length - 1);
                }
                pages_i_arr=pages_i_str.Split(',');

                int ii = 0;
                returnStr="";
                for (i = 0; i < pages_i_arr.Length; i++)
                {
                    int aii=ii;
                    ii=Convert.ToInt32(pages_i_arr[i]);
                    if (i == pages_i_arr.Length-1)
                    {
                        returnStr += Content.Substring(aii, ii - aii);
                    }
                    else
                    {
                        returnStr += Content.Substring(aii, ii - aii) + split_str;
                    }
                }
            }
            return returnStr;
        }


        protected static bool AllowSplitPages(string str, string findstr)
        {
            int inti;
            string beginStr;
            string endStr;
            int beginStrNum=0;
            int endStrNum=0;
            string[] arrStrFind;
            int i;
            string tempStr = str.ToLower();
            string fdStr = findstr.ToLower();
            if (tempStr != "" && fdStr != "")
            {
                arrStrFind=fdStr.Split('|');
                for (i = 0; i < arrStrFind.Length; i++)
                {
                    beginStr = "<" + arrStrFind[i];
                    endStr = "</" + arrStrFind[i];
                    inti = 0;
                    while (tempStr.IndexOf(beginStr, inti) != -1)
                    {
                        inti = tempStr.IndexOf(beginStr, i);
                        beginStrNum += 1;
                    }
                    inti = 0;
                    while (tempStr.IndexOf(beginStr, inti) != -1)
                    {
                        inti = tempStr.IndexOf(endStr, i);
                        beginStrNum += 1;
                    }
                    if (endStrNum == beginStrNum)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            return false;
        }
    }
}
