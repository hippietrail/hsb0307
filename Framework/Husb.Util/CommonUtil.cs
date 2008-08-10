using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Diagnostics;
using System.Text.RegularExpressions;
using System.Reflection;
using System.IO;

namespace Husb.Util
{
    public static class CommonUtil
    {
        #region String

        /// <summary>
        /// 这个方法确保用户不输入乱七八糟的东西
        /// </summary>
        /// <param name="text">用户的输入</param>
        /// <param name="maxLength">限制的最大长度</param>
        /// <returns>过滤之后的用户输入</returns>
        public static string InputText(string text, int maxLength)
        {
            text = text.Trim();
            if (string.IsNullOrEmpty(text))
                return string.Empty;
            if (maxLength > 0 && text.Length > maxLength)
                text = text.Substring(0, maxLength);
            text = Regex.Replace(text, "[\\s]{2,}", " ");	//two or more spaces
            text = Regex.Replace(text, "(<[b|B][r|R]/*>)+|(<[p|P](.|\\n)*?>)", "\n");	//<br>
            text = Regex.Replace(text, "(\\s*&[n|N][b|B][s|S][p|P];\\s*)+", " ");	//&nbsp;
            text = Regex.Replace(text, "<(.|\\n)*?>", string.Empty);	//any other tags
            text = text.Replace("'", "''").Replace(",", "，").Replace("+", "＋").Replace("%", "％").Replace("(", "（").Replace(")", "）").Replace("--", "——");
            return text;
        }

        /// <summary>
        /// 这个方法确保用户不输入乱七八糟的东西
        /// </summary>
        /// <param name="text">用户的输入</param>
        /// <returns>过滤之后的用户输入</returns>
        public static string InputText(string text)
        {
            return InputText(text, -1);
        }

        /// <summary>
        /// 判断一个字符串是否为数字
        /// </summary>
        /// <param name="str">要判断的字符串</param>
        /// <returns></returns>
        public static bool IsNumber(String str)
        {
            if (str == null || str.Length == 0) return true;
            str = str.TrimStart('+', '-');
            for (int i = 0; i < str.Length; i++)
            {
                if (str[i] != '.')
                {
                    if (str[i] < '0' || str[i] > '9')
                        return false;
                }
            }
            //if(str.IndexOf('.') < str.LastIndexOf('.'))
            //{
            //    // 有多个'.'
            //    return false;
            //}
            if (str.LastIndexOf('.') > 1 || str.EndsWith("."))
            {
                // 有多个'.'或'.'的位置太向后了
                return false;
            }
            return true;
        }

        /// <summary>
        /// 判断一个字符串是否为整数
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static bool IsInteger(String str)
        {
            if (str == null || str.Length == 0) return true;
            str = str.TrimStart('+', '-');
            for (int i = 0; i < str.Length; i++)
            {
                if (str[i] < '0' || str[i] > '9')
                    return false;
            }
            return true;
        }

        //;
        /// <summary>
        /// 判断一个字符串是否为电话号码
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static bool IsTelephone(String str)
        {
            if (str == null || str.Length == 0) return true;
            try
            {
                Match match = Regex.Match(str, @"^13\d{9}|(0{1,2}\d{2,3}-?)?\d{7}\d?$");
                return ((match.Success && (match.Index == 0)) && (match.Length == str.Length));
            }
            catch
            {
                return true;
            }
        }

        public static string GetChineseSpell(string strText)
        {
            if (string.IsNullOrEmpty(strText)) return null;
            int len = strText.Length;
            string myStr = "";
            for (int i = 0; i < len; i++)
            {
                myStr += GetSpell(strText.Substring(i, 1));
            }
            return myStr;
        }

        public static string GetSpell(string cnChar)
        {
            byte[] arrCN = Encoding.Default.GetBytes(cnChar);
            if (arrCN.Length > 1)
            {
                int area = (short)arrCN[0];
                int pos = (short)arrCN[1];
                int code = (area << 8) + pos;
                int[] areacode = { 45217, 45253, 45761, 46318, 46826, 47010, 47297, 47614, 48119, 48119, 49062, 49324, 49896, 50371, 50614, 50622, 50906, 51387, 51446, 52218, 52698, 52698, 52698, 52980, 53689, 54481 };
                for (int i = 0; i < 26; i++)
                {
                    int max = 55290;
                    if (i != 25) max = areacode[i + 1];
                    if (areacode[i] <= code && code < max)
                    {
                        return Encoding.Default.GetString(new byte[] { (byte)(65 + i) });
                    }
                }
                return "*";
            }
            else return cnChar;
        }

        public static bool IsChineseString(string s)
        {
            char[] cs = s.ToCharArray();
            foreach (char c in cs)
            {
                if (!IsChineseChar(c)) return false;
            }
            return true;
        }

        public static bool IsChineseChar(char c)
        {
            return Convert.ToInt32(c) > 255;
        }

        /// <summary>
        /// 将一个字符串转换成一个指定长度的字符串，长度不够则用0补齐
        /// </summary>
        /// <param name="s">等待转换的字符串</param>
        /// <param name="length">指定的长度</param>
        /// <returns></returns>
        public static string FillZero(string s, int length)
        {
            if (length <= 0) return null;
            if (string.IsNullOrEmpty(s)) return new string('0', length);
            if (s.Length >= length) return s;
            return (new string('0', length - s.Length)) + s;
        }

        /// <summary>
        /// 将一个整数转换成一个指定长度的字符串，长度不够则用0补齐
        /// </summary>
        /// <param name="number">等待转换的整数</param>
        /// <param name="length">指定的长度</param>
        /// <returns></returns>
        public static string FillZero(int number, int length)
        {
            string s = number.ToString();
            return FillZero(s, length);
        }

        /// <summary>
        /// 去掉Where语句开头和结尾的谓词
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        public static string TrimWhere(string where)
        {
            //if (where.Length > "1 = 1  AND".Length && where.StartsWith("1 = 1  AND"))
            //{
            //    where = where.Remove(0, "1 = 1  AND".Length);
            //}
            //else
            //{
            //    where = where.Trim();
            //    if (where.StartsWith("AND"))
            //    {
            //        where = where.Remove(0, "AND".Length);
            //    }
            //}

            where = where.Trim();
            if (where.StartsWith("AND"))
            {
                where = where.Remove(0, "AND".Length);
            }
            return where;
        }

        /// <summary>
        /// 删除一个字符串后面的数值字符
        /// </summary>
        /// <param name="s">要删除其后面数值字符的字符串</param>
        /// <returns></returns>
        public static string TrimNumberic(string s)
        {
            if (s == null || s.Length == 0) return "";
            int pos = s.Length - 1;
            for (int i = pos; i > 0; i--)
            {
                if (s[i] >= '0' && s[i] <= '9')
                {
                    pos--;
                }
            }
            //foreach(char c in s)
            //{
            //    if (c >= '0' && c <= '9')
            //    {
            //        pos--;
            //    }
            //}
            if (pos == s.Length - 1) return s;
            if (pos == 0) pos++;
            return s.Substring(0, pos);
        }

        #endregion

        #region Reflect
        /// <summary>
        /// Gets a type in all loaded assemblies of current app domain.
        /// </summary>
        /// <param name="fullName">The full name.</param>
        /// <returns></returns>
        public static Type GetType(string fullName)
        {
            if (fullName == null)
            {
                return null;
            }

            Type t = null;

            if (fullName.StartsWith("System.Nullable`1["))
            {
                string genericTypeStr = fullName.Substring("System.Nullable`1[".Length).Trim('[', ']');
                if (genericTypeStr.Contains(","))
                {
                    genericTypeStr = genericTypeStr.Substring(0, genericTypeStr.IndexOf(",")).Trim();
                }
                t = typeof(Nullable<>).MakeGenericType(GetType(genericTypeStr));
            }

            if (t != null)
            {
                return t;
            }

            try
            {
                t = Type.GetType(fullName);
            }
            catch
            {
            }

            if (t == null)
            {
                try
                {
                    Assembly[] asses = AppDomain.CurrentDomain.GetAssemblies();

                    for (int i = asses.Length - 1; i >= 0; i--)
                    {
                        Assembly ass = asses[i];
                        try
                        {
                            t = ass.GetType(fullName);
                        }
                        catch
                        {
                        }

                        if (t != null)
                        {
                            break;
                        }
                    }
                }
                catch
                {
                }
            }
            if (t == null)
            {
                throw new Exception(String.Format("类型 {0} 没有发现，请使用其完整的名称！", fullName));
            }

            return t;
        }

        #endregion

        #region DataSet
        /// <summary>
        /// 判断一个数据行是否被修改了
        /// </summary>
        /// <param name="row">数据行</param>
        /// <returns></returns>
        public static bool DataRowModified(DataRow row)
        {
            bool modified = false;
            foreach (DataColumn col in row.Table.Columns)
            {
                //if (row[col, DataRowVersion.Default] == row[col, DataRowVersion.Original]
                //    || (row[col, DataRowVersion.Original] != null && row[col, DataRowVersion.Original].Equals(row[col, DataRowVersion.Default])))
                if (row[col, DataRowVersion.Default] == row[col, DataRowVersion.Current]
                    || (row[col, DataRowVersion.Current] != null && row[col, DataRowVersion.Current].Equals(row[col, DataRowVersion.Default])))
                {
                    //continue;
                }
                else
                {
                    modified = true;
                    break;
                }
            }
            return modified;
        }

        /// <summary>
        /// 判断一个数据行的某列是否被修改了
        /// </summary>
        /// <param name="row">数据行</param>
        /// <param name="col">列</param>
        /// <returns></returns>
        public static bool DataRowModified(DataRow row, DataColumn col)
        {
            bool modified = false;
            if (row.HasVersion(DataRowVersion.Current))
            {
                if (row[col, DataRowVersion.Default] == row[col, DataRowVersion.Current]
                        || (row[col, DataRowVersion.Current] != null && row[col, DataRowVersion.Current].Equals(row[col, DataRowVersion.Default])))
                {

                }
                else
                {
                    modified = true;
                }
            }
            return modified;
        }

        /// <summary>
        /// 判断一个对象是否为空。常用于判断强类型数据集的列值
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>
        public static bool IsNullOrEmpty(object o)
        {
            if (o == null) return true;
            if (o == DBNull.Value) return true;
            return String.IsNullOrEmpty(o as string);
        }

        /// <summary>
        /// 某行某列的值是否等于另外某行某列的值
        /// </summary>
        /// <param name="oRow"></param>
        /// <param name="oCol"></param>
        /// <param name="dRow"></param>
        /// <param name="dCol"></param>
        /// <returns></returns>
        public static bool IsEqual(DataRow oRow, DataColumn oCol, DataRow dRow, DataColumn dCol)
        {
            bool equal = false;
            if (oRow[oCol] == dRow[dCol]
                    || (oRow[oCol] != null && dRow[dCol] != null && oRow[oCol].Equals(dRow[dCol])))
            {
                equal = true;
            }
            return equal;
        }

        public static DataTable WeekTable(bool hasSelected)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Id", typeof(System.Int32));
            dt.Columns.Add("Name", typeof(System.String));

            //dt.BeginInit();
            //dt.BeginLoadData();
            if (hasSelected)
            {
                dt.Rows.Add(-1, "请选择...");
            }
            dt.Rows.Add(1, "星期一");
            dt.Rows.Add(2, "星期二");
            dt.Rows.Add(3, "星期三");
            dt.Rows.Add(4, "星期四");
            dt.Rows.Add(5, "星期五");
            dt.Rows.Add(6, "星期六");
            dt.Rows.Add(7, "星期日");

            //dt.EndInit();
            //dt.EndLoadData();

            return dt;
        }

        public static DataTable WeekTable()
        {
            return WeekTable(false);
        }
        #endregion

        #region Error

#if !DEBUG
        /// <value>
        ///     A LineNumber constant to be used when not in a debug build
        ///     so that ApplicationAssert. LineNumber is always a valid expression.
        ///     <remarks>
        ///         This allows us to pass ApplicationAssert.LineNumber with good debug
        ///         functionality and minimal runtime overhead.
        ///     </remarks>
        /// </value>
        public const int LineNumber = 0;
#else
        /// <value>Property LineNumber is used to get the current line number in the calling function.</value>
        /// <remarks>
        ///     This should be called in a parameter list to get accurate 
        ///     information about the line number before the Check* functions 
        ///     are called. If we wait until the Check* functions themselves 
        ///     to retrieve this information, then the stack trace indicates 
        ///     the next executable line, which is only marginally useful 
        ///     information. This function is compiled out in debug builds in
        ///     favor of the LineNumber constant.
        ///     Returns LineNumber, or 0 on failure.
        /// </remarks>
        public static int LineNumber
        {
            get
            {
                try
                {
                    //
                    // Get the trace information with file information by skipping
                    //   this function and then reading the top stack frame.
                    //
                    return (new StackTrace(1, true)).GetFrame(0).GetFileLineNumber();
                }
                catch
                {
                }

                return 0;
            }
        }
#endif

        /// <summary>
        ///     Check the given condition and show an assert dialog when the
        ///     desktop is interactive. 
        ///     <remarks>
        ///         Log the assertion at a warning level in case the desktop is not 
        ///         interactive. The text will always contain full stack trace 
        ///         information and will show the location of the error condition if 
        ///         the source code is available.
        ///     </remarks>
        ///     <param name="condition">An expression to be tested for True</param>
        ///     <param name="errorText">The message to display</param>
        ///     <param name="lineNumber">
        ///         The line of the current error in the function. See
        ///         GenerateStackTrace for more information.
        ///     </param>
        /// </summary>
        [ConditionalAttribute("DEBUG")]
        public static void Check(bool condition, String errorText, int lineNumber)
        {
            if (!condition)
            {
                String detailMessage = String.Empty;
                StringBuilder strBuilder;
                GenerateStackTrace(lineNumber, out detailMessage);
                strBuilder = new StringBuilder();
                strBuilder.Append("Assert: ").Append("\r\n").Append(errorText).Append("\r\n").Append(detailMessage);
                //ApplicationLog.WriteWarning(strBuilder.ToString());
                System.Diagnostics.Debug.Fail(errorText, detailMessage);
            }
        }

        /// <summary>
        ///     Verify that a required condition holds. 
        ///     <remarks>
        ///         Show an assert dialog in a DEBUG build before throwing an 
        ///         ApplicationException. It is assumed that the exception will be 
        ///         handled or logged, so this does not log a warning for the assertion 
        ///         like the Check function, which does not actually throw.
        ///     </remarks>
        ///     <param name="condition">An expression to be tested for True</param>
        ///     <param name="errorText">The message to display</param>
        ///     <param name="lineNumber">
        ///         The line of the current error in the function. See 
        ///         GenerateStackTrace for more information.
        ///     </param>                        
        ///     <exception class="System.ApplicationException">
        ///         The checked condition failed.    
        ///     </exception>
        /// </summary>
        public static void CheckCondition(bool condition, String errorText, int lineNumber)
        {
            //Test the condition
            if (!condition)
            {
                //Assert and throw if the condition is not met
                String detailMessage;
                GenerateStackTrace(lineNumber, out detailMessage);
                Debug.Fail(errorText, detailMessage);

                throw new ApplicationException(errorText);

            }
        }

        /// <summary>
        ///     Generate a stack trace to display/log with the assertion text.
        ///     <remarks>
        ///         The trace information includes file and line number information
        ///         if its available, as well as a copy of the line of text if
        ///         the source code is available. This function is only included in
        ///         DEBUG builds of the application.
        ///     </remarks>
        ///     <param name="lineNumber">
        ///         The line of the current error in the function. This                  
        ///         value should be retrieved by call Application.LineNumber             
        ///         in the parameter list of any of the Check* functions. If         
        ///         LineNumber is not provided,then the next executable line is used.
        ///     </param>
        ///     <param name="currentTrace">Returns the generated stack trace.</param>
        /// </summary>
        //[ConditionalAttribute("DEBUG")]
        public static void GenerateStackTrace(int lineNumber, out String currentTrace)
        {
            currentTrace = String.Empty;

#if DEBUG
            StringBuilder message; //Used for smart string concatenation
            String fileName;       //The source file name
            int currentLine;       //The line to process in the source file
            String sourceLine;     //The line from the source file
            StreamReader fileStream = null; //The reader used to scan the source file
            bool openedFile = false;
            StackTrace curTrace;
            StackFrame curFrame;

            message = new StringBuilder();

            //New StackTrace should never fail, but Try/Catch to be rock solid.
            try
            {

                //Get a new stack trace with line information. Skip the first function
                // and second functions (this one, and the calling Check* function)
                curTrace = new StackTrace(2, true);
                try
                {
                    //
                    // Get the first retrieved stack frame and attempt to get
                    //   file information from the trace, then open the file
                    //   and find the specified line. Display as much information
                    //   as possible if this is not supported.
                    //
                    curFrame = curTrace.GetFrame(0);

                    //Retrieve and add File/Line information. Note that we only
                    //proceed if both of these are available.
                    if ((String.Empty != (fileName = curFrame.GetFileName())) &&
                        (0 <= (currentLine = (lineNumber != 0) ? lineNumber : curFrame.GetFileLineNumber())))
                    {
                        //Append File name and line number
                        message.Append(fileName).Append(", Line: ").Append(currentLine);

                        //Append the actual code if we can find the source file
                        fileStream = new StreamReader(fileName);
                        openedFile = true;
                        do
                        {
                            sourceLine = fileStream.ReadLine();
                            --currentLine;
                        } while (currentLine != 0);

                        message.Append("\r\n");

                        if (lineNumber != 0)
                        {
                            message.Append("Current executable line:");
                        }
                        else
                        {
                            message.Append("\r\n").Append("Next executable line:");
                        }

                        message.Append("\r\n").Append(sourceLine.Trim());
                    }
                }
                catch
                {
                    //Ignore errors, just show as much as we can
                }
                finally
                {
                    //Always close the file
                    if (openedFile) fileStream.Close();
                }

                //Retrieve the final string
                currentTrace = message.ToString();
            }
            catch
            {
                //Nothing to do, just get out of here with the default (empty) return value
            }
#endif
        }

        #endregion

        #region public enum

        #endregion

        #region
        /// <summary>
        /// 一个整数列表中是否包含某个整数
        /// </summary>
        /// <param name="list"></param>
        /// <param name="item"></param>
        /// <returns></returns>
        public static bool ContainItem(IEnumerable<int> list, int item)
        {
            bool contained = false;
            foreach (int i in list)
            {
                if (i == item)
                {
                    contained = true;
                    break;
                }
            }
            return contained;
        }

        public static bool ContainItem(IEnumerable<KeyValuePair<int, int>> list, int value, out KeyValuePair<int, int> item)
        {
            bool contained = false;
            item = new KeyValuePair<int, int>(-1, -1);
            foreach (KeyValuePair<int, int> i in list)
            {
                if (i.Value == value)
                {
                    contained = true;
                    item = i;
                    break;
                }
            }
            return contained;
        }
        #endregion
    }
}
