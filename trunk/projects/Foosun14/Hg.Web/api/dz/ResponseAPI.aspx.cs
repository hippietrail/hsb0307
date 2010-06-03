using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Foosun.Web.UI;
using Foosun.Model;
using Foosun.CMS;

using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using Foosun.Config;

namespace Foosun.Web.api.dz
{
    public partial class ResponseAPI : Foosun.Web.UI.BasePage
    {
        public string UserNum = string.Empty;
        public string UserName = string.Empty;
        public string UserPassword = string.Empty;
        public string tag = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            tag = Request.QueryString["tag"];                        
            //tag = "login";
            switch (tag)
            {
                case "login":
                    {
                        try
                        {
                            UserName = Request.QueryString["username"];
                            UserPassword = Request.QueryString["password"];                            
                            GlobalUserInfo info;
                            EnumLoginState state = Login(UserName, UserPassword, out info);
                            if (state == EnumLoginState.Succeed)
                            {
                                Foosun.Global.Current.Set(info);                                
                            }                            
                        }
                        catch
                        {
                        }
                        break;
                    }
                case "register":
                    {
                        UserName = Request.QueryString["username"];
                        UserPassword = Request.QueryString["password"];                       
                        UserAdapt ua = new UserAdapt();
                        if (!ua.isExist(UserName))
                        {
                            try
                            {                                
                                User ui = new User();
                                Foosun.CMS.user User = new Foosun.CMS.user();
                                Foosun.Model.UserParam upi = new Foosun.Model.UserParam();                                
                                string siteID = "0";
                                upi = User.UserParam(siteID);

                                UserNum = Foosun.Common.Rand.Number(12);//产生12位随机字符

                                ui.SiteID="";
                                ui.UserNum = UserNum;
                                ui.UserName = UserName;
                                ui.NickName = "";
                                ui.RealName = "";
                                ui.UserPassword = Foosun.Common.Input.MD5(UserPassword, true);

                                ui.isAdmin = 0;
                                ui.UserGroupNumber = upi.RegGroupNumber;///取得注册时默认组编号//???
                                ui.Sex = 0;
                                ui.birthday = Convert.ToDateTime("1980-11-11");
                                ui.Userinfo = "";
                                ui.UserFace = "" + Foosun.Publish.CommonData.getUrl() + "/sysImages/user/noHeadpic.gif";
                                ui.userFacesize = "80|80";
                                ui.marriage = 0;

                                ///取得注册时获得积分
                                string[] selsetPoint = upi.setPoint.Split('|');
                                string selectiPoint = selsetPoint[0].ToString();
                                string selectgPoint = selsetPoint[1].ToString();
                                ui.iPoint = Convert.ToInt32(selectiPoint);
                                ui.gPoint = Convert.ToInt32(selectgPoint);

                                ui.cPoint = 0;
                                ui.aPoint = 0;
                                ui.isLock = 0;
                                ui.PassQuestion = "";
                                ui.PassKey = "";
                                ui.CertType = "";
                                ui.CertNumber = "";
                                ui.Email = "";
                                ui.mobile = "";
                                ui.IDcardFiles = "";
                                ui.EmailCode = "";
                                ui.Addfriendbs = 2;
                                ui.EmailATF = 1;
                                ui.EmailCode = "";
                                ui.isMobile = 1;
                                ui.MobileCode = "";
                                ui.BindTF = 0;
                                ui.RegTime = DateTime.Now;
                                ui.LastLoginTime = DateTime.Now;
                                ui.OnlineTime = 0;
                                ui.OnlineTF = 0;
                                ui.LoginNumber = 0;
                                ui.FriendClass = "";
                                ui.LoginLimtNumber = 0;
                                ui.LastIP = Foosun.Common.Public.getUserIP();
                                ui.Addfriend = "2";
                                ui.isOpen = 0;
                                ui.ParmConstrNum = 0;

                                if (User.Add_User(ui) == 1)
                                {
                                    CreateFolder(ui.UserNum);
                                    Foosun.Global.Current.Set(new GlobalUserInfo(ui.UserNum, ui.UserName, ui.SiteID,"0"));
                                }
                            }
                            catch (Exception Ex)
                            {
                                Response.Write(Ex.Message);
                            }
                        }
                        break;
                    }                     
                case "logout":
                    {
                        Logout();
                        break;
                    }
                case "change":
                    {
                        UserAdapt ua = new UserAdapt();
                        try
                        {
                            Info inf = new Info();
                            UserName = Request.QueryString["username"];
                            UserPassword = Request.QueryString["password"];                           
                            UserNum = ua.getUserNumByUserName(UserName);                          

                            string MD2 = Foosun.Common.Input.MD5(UserPassword, true);
                            inf.Update(MD2, UserNum);
                        }
                        catch
                        { 
                        }
                        break;
                    }
                default: break;
            }
        }

        #region  创建文件夹
        public void CreateFolder(string FolderPathName)
        {
            string _dirdum = Foosun.Config.UIConfig.dirDumm;
            string Userfiles = Foosun.Config.UIConfig.UserdirFile;

            string CreatePath = Server.MapPath(_dirdum + Userfiles);
            try
            {
                Foosun.CMS.Templet.Templet tc = new Foosun.CMS.Templet.Templet();
                tc.AddDir(CreatePath, FolderPathName);
            }
            catch 
            {
            }
        }
        #endregion
    }  
}
