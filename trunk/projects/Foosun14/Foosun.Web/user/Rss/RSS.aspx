<%@ Page Language="C#" AutoEventWireup="true" Inherits="user_RSS" Codebehind="RSS.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Prototype.js"></script>
<script language="JavaScript" type="text/javascript" src="../../configuration/js/Public.js"></script>
<title></title>
<link href="../../sysImages/<%Response.Write(Foosun.Config.UIConfig.CssPath()); %>/css/usercss.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <form id="form1" name="form1" method="post" action="" runat="server">
    <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" class="Navitable">
      <tr>
         <td><span class="topnavichar" style="PADDING-LEFT: 5px"><a href="RSS.aspx" class="menulist">������֪</a>&nbsp;��&nbsp;<a href="RssFeed.aspx" class="menulist">RSS����</a></span></td>
      </tr>
    </table>
      <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="table">
        <tr class="TR_BG_list">
          <td> <strong>��ʲô��RSS<font color="#3366CC"> </font></strong><br/> <br/>
            ��RSS��վ������������վ��֮�乲�����ݵ�һ�ּ��׷�ʽ��ͨ�����������ź�������˳�����е���վ������Blog��һ����Ŀ�Ľ��ܿ��ܰ������ŵ�ȫ�����ܵȡ����߽����Ƕ�������ݻ��߼�̵Ľ��ܡ���Щ��Ŀ������ͨ���������ӵ�ȫ�������ݡ������û������ڿͻ��˽�����֧��RSS�����žۺϹ���������ڲ�����վ����ҳ���������Ķ�֧��RSS�������վ���ݡ�<br/> 
            <br/>
            <strong>��RSS��ι���</strong><br/> <br/>
            ����һ����Ҫ���غͰ�װһ��RSS�����Ķ�����Ȼ�����վ�ṩ�ľۺ�����Ŀ¼�б��ж���������Ȥ��������Ŀ�����ݡ����ĺ������ἰʱ�������������Ƶ�����������ݡ�<br/>
            <br/> <strong>��RSS�����Ķ������ص�</strong><br/> <br/>
            ��a. û�й�����ͼƬ��Ӱ�����������¸�Ҫ���Ķ���
<p>��b. RSS�Ķ����Զ������㶨�Ƶ���վ���ݣ��������ŵļ�ʱ�ԡ�</p>
            <p>��c. �û����Լ��������Ƶ�RSS��Ҫ���Ӷ����Դ�Ѽ��������ϵ������������С�<br/>
              <br/>
              <strong>��RSS�Ķ�������</strong><br/>
            </p>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="24%"><div align="center"> <a href="http://fox.foxmail.com.cn/" target="_blank"><img src="../../sysImages/user/Rss/foxmail.gif" width="134" height="51" border="0"/></a> 
                    <table width="98%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><div align="center"><a href="http://fox.foxmail.com.cn/">��ѶFoxmail 
                            6</a></div></td>
                      </tr>
                    </table>
                    
                  </div></td>
                <td width="19%"><div align="center"><a href="http://www.potu.com" target="_blank"><img src="../../sysImages/user/Rss/zbt.gif" border="0"/></a><br>
                    <table width="98%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td><div align="center"><a href="http://www.potu.com" target="_blank">�ܲ�ͨRSS�Ķ���</a></div></td>
                      </tr>
                    </table>
                    
                  </div></td>
                <td width="57%" valign="bottom"><div align="center"><a href="http://www.sharpreader.net/SharpReader0960_Setup.exe" target="_blank"><img src="../../sysImages/user/Rss/sharp%20Reader.gif" width="91" height="18" border="0"></a>&nbsp;<a href="http://www.rssreader.com/download/rssreader.zip" target="_blank"><img src="../../sysImages/user/Rss/RssReader.gif" width="91" height="19" border="0"></a>&nbsp;<a href="http://feeddemon.com/download/dloadhandler.asp?file=feeddemon-trial.exe" target="_blank"><img src="../../sysImages/user/Rss/FeedDemon.gif" width="91" height="20" border="0"></a>&nbsp;<a href="http://www.newzcrawler.com/downloads.shtml" target="_blank"><img src="../../sysImages/user/Rss/Nc.gif" width="91" height="19" border="0"></a> 
                  </div>
                  <table width="98%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><div align="center">����RSS�ۺ��Ķ���</div></td>
                    </tr>
                  </table>
                  
                </td>
              </tr>
            </table>
            
          </td>
        </tr>
</table>
</form>
<br />    
<br />    
<table width="100%" height="74" border="0" cellpadding="0" cellspacing="0" class="copyright_bg">
  <tr>
    <td><div align="center"><%Response.Write(CopyRight); %> </div></td>
  </tr>
</table>
</body>
</html>