//=====================================================================
//==                  (C)2007 Hg Inc.By doNetCMS1.0              ==
//==                     Forum:bbs.hg.net                        ==
//==                     WebSite:www.hg.net                      ==
//==                 Address:No.109 HuiMin ST,.ChengDu,China         ==
//==                   Tel:86-28-85098980/66026180                   ==
//==                   QQ:655071,MSN:ikoolls@gmail.com               ==
//==                   Email:Service@hg.cn                       ==
//==                      Code By WangZhenjiang                      ==
//=====================================================================
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Hg.CMS;

public partial class user_discussacti_add : Hg.Web.UI.UserPage
{
    Discuss dis = new Discuss();
    DateTime CreaTime = DateTime.Now;//��ȡ��ǰϵͳʱ��    
    /// <summary>
    /// ��ʼ��
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    /// 
    #region ��ʼ��
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            string AId=Hg.Common.Input.Filter(Request.QueryString["AId"].ToString());
            DataTable dt = dis.sel_12(AId);
            DateTime Cutofftime1 = DateTime.Parse(dt.Rows[0]["Cutofftime"].ToString());
            int An = int.Parse(dt.Rows[0]["Anum"].ToString());
            int Pn=0;
            if (dis.sel_13(AId) != 0)
            {
                Pn = dis.sel_13(AId);
            }
            if (CreaTime > Cutofftime1)
            {
                PageError("�Բ����ܲμӻʱ���Ѿ�����", "discussacti_list.aspx");

            }
            else
            {
                if (Pn >= An)
                {
                    PageError("�Բ���μ������������ܲμӴλ", "discussacti_list.aspx");
                }
            }
        }
    }
    #endregion

    protected void inBox_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)//�ж��Ƿ�ͨ����֤
        {
            string UserNum = Hg.Global.Current.UserNum;
            string AIds = Hg.Common.Input.Filter(Request.QueryString["AId"].ToString());
            string Telephone = Hg.Common.Input.Htmls(Request.Form["TelephoneBox"].ToString());
            int ParticipationNum = int.Parse(Hg.Common.Input.Filter(Request.Form["ParticipationNumBox"].ToString()));
            int isCompanion = this.isCompanionList.SelectedIndex;
            string  PId = Hg.Common.Rand.Number(12);//����12λ����ַ�
            DataTable dta = dis.sel_14();
            int cutb = dta.Rows.Count;
            string PIda = "";
            if (cutb > 0)
            {
                PIda = dta.Rows[0]["PId"].ToString();
            }
            if (PIda != PId)
            {
                if (dis.Add_4(Telephone, ParticipationNum, isCompanion, UserNum, AIds, PId, CreaTime) != 0)
                {
                    PageRight("����ɹ�", "discussacti_list.aspx");
                }
                else
                {
                    PageError("����ʧ��", "discussacti_list.aspx");
                }
            }
            else 
            {
                PageError("����ʧ�ܿ��ܱ���ظ������¼���", "discussacti_list.aspx");
            }
        }
    }
}                   