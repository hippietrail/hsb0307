using System;
using System.Collections.Generic;
using System.Text;
using System.Drawing;
using System.Drawing.Imaging;

namespace Foosun.Web.UI
{
    public class ImagePage : System.Web.UI.Page
    {
        /// <summary>
        /// �������֤
        /// </summary>
        /// <param name="code">������֤����</param>
        protected void DrawImage(int code)
        {
            Session["CheckCode"] = Foosun.Common.Rand.Number(code);
            CreateImages(Session["CheckCode"].ToString());
        }
        /// <summary>
        /// /// ������֤ͼƬ
        /// /// </summary>
        /// /// <param name="checkCode">��֤�ַ�</param>
        protected void CreateImages(string checkCode)
        {
            int iwidth = (int)(checkCode.Length * 15);
            System.Drawing.Bitmap image = new System.Drawing.Bitmap(iwidth, 30);
            Graphics g = Graphics.FromImage(image);
            g.Clear(Color.LightCyan);
            //������ɫ
            Color[] c = { Color.Black, Color.Red, Color.DarkBlue, Color.Green, Color.Orange, Color.Brown, Color.DarkCyan, Color.Purple, Color.SkyBlue };
            //�������� 
            string[] font = { "Verdana", "Microsoft Sans Serif", "Comic Sans MS", "Arial", "����", "Comic Sans MS" };
            Random rand = new Random();
            //���������
            for (int i = 0; i < 150; i++)
            {
                int x = rand.Next(image.Width);
                int y = rand.Next(image.Height);
                g.DrawPie(new Pen(Color.LightGray, 0), x, y, 6, 6, 1, 1);
            }

            //�����ͬ�������ɫ����֤���ַ�
            for (int i = 0; i < checkCode.Length; i++)
            {
                int cindex = rand.Next(7);
                int findex = rand.Next(6);
                Font fs_font = new System.Drawing.Font(font[findex], 14, System.Drawing.FontStyle.Bold);
                Brush b = new System.Drawing.SolidBrush(c[cindex]);
                int ii = 4;
                if ((i + 1) % 2 == 0)
                {
                    ii = 2;
                }
                g.DrawString(checkCode.Substring(i, 1), fs_font, b, 3 + (i * 12), ii);
            }

            //��һ���߿�
            g.DrawRectangle(new Pen(Color.Red, 0), 100, 0, image.Width - 1, image.Height - 1);
            //����������
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            image.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
            Response.ClearContent();//Response.ClearContent();
            Response.ContentType = "image/Jpeg";
            Response.BinaryWrite(ms.ToArray());
            g.Dispose();
            image.Dispose();
        }
    }
}
