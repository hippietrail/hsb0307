﻿//===========================================================
//==     (c)2007 Hg Inc. by WebFastCMS 1.0              ==
//==             Forum:bbs.hg.net                      ==
//==            website:www.hg.net                     ==
//==     Address:NO.109 HuiMin ST.,Chengdu ,China          ==
//==         TEL:86-28-85098980/66026180                   ==
//==         qq:655071,MSN:ikoolls@gmail.com               ==
//==               Code By Xi.deng                         ==
//===========================================================
using System;
using System.Collections.Generic;
using System.Text;
using Hg.DALFactory;
using Hg.CMS;
using Hg.Model;
using System.IO;
using System.Data;
using Hg.Common;

namespace Hg.CMS
{
    public class Database
    {
        private IDatabase data;
        public Database()
        {
            data = DataAccess.CreateDatabase();
        }

        public DataTable ExecuteSql(string sqlText)
        {
            DataTable dt = data.ExecuteSql(sqlText);
            return dt;
           
        }

        public int backSqlData(int type, string backpath)
        {
            return data.backSqlData(type, backpath);
        }

        public int DbBak(string sourcePath, string desPath)
        {
            int result = 0;
            if (File.Exists(sourcePath))
            {
                try
                {
                    FileInfo Fso = new FileInfo(sourcePath);    //实例化FSO对象
                    Fso.CopyTo(desPath);                        //备份数据库到指定目录
                    result = 1;
                
                }
                catch
                {
                    result = 2;
                }
            }
            else
            {
                result = 3;
            }
            return result;
        }

        public int DbRar(string rarSourcePath, string rarTempPath, string rarStr_S, string rarStr_T)
        {
            int result = 0;
            if (File.Exists(rarSourcePath))                   //判断数据库文件是否存在
            {
                JRO.JetEngine Jet = new JRO.JetEngineClass(); //实例化JET引掣
                if (File.Exists(rarTempPath))
                {
                    try
                    {
                        File.Delete(rarTempPath);
                    }
                    catch
                    {
                        result = 1;                                         //删除存在的数据库文件失败
                    }
                }
                Jet.CompactDatabase(rarStr_S, rarStr_T);  //压缩数据库
                try
                {
                    File.Delete(rarSourcePath);                             //删除源数据库
                    File.Move(rarTempPath, rarSourcePath);                  //移动新文件到指定地方并且指定文件名
                    File.Delete(rarTempPath);                               //删除临时数据库文件
                    result = 3;                                                 //压缩数据库成功!
                }
                catch (Exception e)
                {
                    result = 2;  
                    throw e;
                                                               //操作失败
                }
            }
            else
            {
                result = 4;                                                 //数据库不存在!
            }
            return result;
        }

        public int DelBakDb(string bakPath)
        {
            int result = 0;
            FileInfo Fso = new FileInfo(bakPath);                            //实例化FSO对象
            try
            {
                Fso.Delete();                                                //删除此文件
            }
            catch                                               //容错处理,提取IO异常
            {
                result = 2;                                                  //失败
            }
            result = 1;                                                      //成功
            return result;
        }

        public void Replace(string oldTxt, string newTxt, string Table, string FieldName)
        {
            data.Replace(oldTxt, newTxt, Table, FieldName);
        }
    }

}
