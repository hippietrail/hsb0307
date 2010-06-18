using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Husb.Common.Web
{
    public class EncryptUtil
    {
        public static string GetRandWord(int length)
        {
            string checkCode = string.Empty;
            Random random = new Random();
            for (int i = 0; i < length; i++)
            {
                char code;
                int number = random.Next();
                if ((number % 2) == 0)
                {
                    code = (char)(0x30 + ((ushort)(number % 10)));
                }
                else
                {
                    code = (char)(0x41 + ((ushort)(number % 0x1a)));
                }
                checkCode = checkCode + code.ToString();
            }
            return checkCode;
        }

 

    }
}
