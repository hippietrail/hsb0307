using System;
using System.Collections.Generic;
using System.Text;

namespace Foosun.Model
{
    class sys_param
    {
    }

    public struct STsys_param
    {
            public string Str_SiteName;//վ������
            public string Str_SiteDomain;//վ������
            public string Str_IndexTemplet;//��ҳ����·��
            public string Str_Txt_IndexFileName;//��ҳ�����ļ���
            public string Str_FileEXName;//Ĭ�ϵ���չ������վ��
            public string Str_ReadNewsTemplet;//�������ҳ����
            public string Str_ClassListTemplet;//������Ŀҳ����
            public string Str_SpecialTemplet;//����ר��ҳ����
            #region ǰ̨�����ʽ
            public int readtypef;
            #endregion
            public string Str_LoginTimeOut;//��̨��½����ʱ��
            public string Str_Email;//����Ա����
            #region վ�����·����ʽ
            public int linktypef;
            #endregion
            public string Str_BaseCopyRight;//��Ȩ��Ϣ
            public string Str_CheckInt;//���ź�̨��˻���
            #region ͼƬ����
            public int picc;
            #endregion
            public string Str_LenSearch;//�ؼ��ֳ���
            public string InsertPicPosition;
            public int HistoryNum;
            #region �����Ŀ����
            public int chetitle;
            #endregion
            #region ���ɼ�
            public int collect;
            #endregion
            public string Str_SaveClassFilePath;//������Ŀ�ļ�����·��
            public string Str_SaveIndexPage;//��������ҳ����
            public string Str_SaveNewsFilePath;//�����ļ���������
            public string Str_SaveNewsDirPath;//�����ļ�����·��
            public string Str_Pram_Index;//ÿҳ��ʾ����
           //-----------------------------------------��Ա
            public string Str_RegGroupNumber;//Ĭ�ϻ�Ա��
            #region Ͷ��״̬
            public int constrr;
            #endregion
            #region ע��
            public int reg;
            #endregion
            #region ��֤��
            public int code;
            #endregion
            #region ������֤
            public int diss;
            public int CommCheck;
            #endregion
            #region Ⱥ��
            public int senemessage;
            #endregion
            #region ����
            public int n;
            #endregion
            #region html�༭��
            public int htmls;
            #endregion
            public string Str_Commfiltrchar;//���۹���
            public string Str_IPLimt;
            public string Str_GpointName;//G��
            public string Str_LoginLock;//����
            public string Str_setPoint;//ע���õĻ��ֽ��
            public string Str_cPointParam;//����ֵ����
            public string Str_aPointparam;//��Ծֵ����
            public string Str_RegContent;//ע��Э��
            #region ��Աע�����
            public string strContent;
            public int returnemail;
            public int returnmobile;
            #endregion
            #region ��ֵ����
            public int ghclass;
            #endregion
            //----------��Ա�ȼ�����----------
            public string[] Str_LtitleArr;//��ȡ��������
            public string[] Str_LpicurlArr;//��ȡͷ������
            public string[] Str_iPointArr;//��ȡ�������
            //------------------�ϴ�������ˢ��
            #region ͼƬ·������
            public int picsa;
            #endregion
            public string Str_PicServerDomain;//����
            public string Str_PicUpLoad;//ͼƬ����Ŀ¼
            public string Str_UpfilesType;//�ϴ���ʽ
            public string Str_UpFilesSize;//�ϴ���С
            #region ����
            public int domainnn;
            #endregion
            public string Str_RemoteDomain;//Զ��ͼƬ����
            public string Str_RemoteSavePath;//Զ��ͼƬ����·��
            #region ����ˢ��
            public string Str_ClassListNum;//�б�ÿ��ˢ����
            public string Str_NewsNum;//��Ϣÿ��ˢ����
            public string Str_BatDelNum;//����ɾ����
            public string Str_SpecialNum;//ר��ÿ��ˢ����
            #endregion
            //--------js,ftp--------------------
            public string Str_HotJS;
            public string Str_LastJS;
            public string Str_RecJS;
            public string Str_HoMJS;
            public string Str_TMJS;
            public int ftpp;
            public string Str_FTPIP;
            public string Str_Ftpport;
            public string Str_FtpUserName;
            public string Str_FTPPASSword;//�ַ������ܷ�ʽд�����ݿ�
            //-----ˮӡ����ͼ-------------------
            #region �Ƿ���ˮӡ/��ͼ
            public int water;
            #endregion
            public string Str_PrintPicTF;//����
            public string Str_PrintWord;//����ˮӡ
            public string Str_Printfontsize;//�����С
            public string Str_Printfontfamily;//����
            public string Str_Printfontcolor;//ˮӡ��ɫ
            public string Str_PrintBTF;//�����Ƿ�Ӵ�
            public string Str_PintPicURL;//ͼƬˮӡ·��
            public string Str_PrintPicsize;//ͼƬˮӡ��С
            public string Str_PintPictrans;//͸����
            public string Str_PrintPosition;//λ��
            public string Str_PrintSmallTF;//�Ƿ�����ͼ
            public string Str_PrintSmallSizeStyle;//��ͼ��ʽ
            public string Str_PrintSmallSize;//��ͼ��С
            public string Str_PrintSmallinv;//��ͼ����
            //-----RSS,WAP----------------------
            public string Str_RssNum;//��ʾ��Χ
            public string Str_RssContentNum;//��ȡ��
            public string Str_RssTitle;//����
            public string Str_RssPicURL;//��ַ
            #region ����WAP
            public int wapp;
            #endregion
            public string Str_WapPath;//WAP·��
            public string Str_WapDomain;//WAP����
            public string Str_WapLastNum;//WAP��
           //
            public string ClassPageStyle;//��Ŀ��ҳ��ʽ
            public string Gong;
            public string Ye;
            public string DangQianDi;
            public string ShouYe;
            public string ShangYiYe;
            public string ShangShiYe;
            public string XiaYiYe;
            public string XiaShiYe;
            public string WeiYe;

        }
}
