<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ReferenceNews.WebClient.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

<div class="page page-login"> 
<div class="page-head"><h6 class="bd"></h6></div> 
<div class="page-layer"> 
<div class="pl-left"> 
<div class="page-description"> 
            <div class="welcome"> 
				<h2 >iximo.cc!吸墨网<br/><br/> 
				 电子书交易平台欢迎您</h2> 
			</div> 
			<br /><br /> 
			<ul class="login_explain"> 
				<li> 
				  <table width="100%" border="0" cellpadding="0" cellspacing="0"> 
						<tr><td rowspan="2" width="60"><img src="Shared/data/files/ads/img12.png" /></td><td ><strong>多设备随时随地阅读</strong></td> 
						</tr> 
						<tr><td>支持PC, iPhone, 手机3G, 手机WAP等阅读方式，走到哪！看到哪！</td></tr> 
				  </table> 
				</li> 
				<li> 
					<table width="100%" border="0" cellpadding="0" cellspacing="0"> 
						<tr><td rowspan="2" width="60" ><img src="Shared/data/files/ads/img11.png" /></td><td ><strong>多途径推广作品</strong></td> 
						</tr> 
						<tr><td>建立个人网络店面，作品价格、评论由你管；作者空间秀自我，生活点滴分享每
一天！</td></tr> 
					</table> 
				</li> 
				<li> 
					<table width="100%"  border="0" cellpadding="0" cellspacing="0"> 
						<tr><td rowspan="2" width="60" ><img src="Shared/data/files/ads/img13.png" /></td><td ><strong>盈利模式</strong></td> 
						</tr> 
						<tr><td>只要有用户下载就有收入，收入多少，由你决定！</td></tr> 
					</table> 
				</li> 
			</ul> 
<!--             <h3>吸墨网平台特色：</h3><br />
			 <div class="description">
			<h4>1.支持多种设备随时随地阅读</h4><br />
			 <p> PC阅读<br />
			  iPhone阅读<br />
			  3G手机阅读<br />
			  普通手机阅读 </p>
			<h4>2.多途径推广作品</h4><br />
			  <p>建立个人网络店面，作品价格由你管（storefront）<br />
			  自己管理读者评论<br />
			  向读者展示全面的自己<br />
			  分享每天你在做的事 </p>
			<h4>3.盈利模式</h4><br />
			  <p>只要有用户下载就有收入<br />
			  完全由作者自主定价 </p>
 
	  </div>--> 
</div> 
</div> 


	<div class="pl-right"> 
	<div class="plr-inner"> 
    <div class="mod modAng" id="loginMod"> 
	<div class="modHead"> 
		<h3 class="bd">会员登录</h3> 
		<span class="lAng"></span><span class="rAng"></span> 
	</div> 
	<form id="login_form"  class="modBody" runat="server"> 
		<center> 
		<table> 
			<tr> 
				<td width="70" height="36">电子邮箱: </td> 
				<td><div class="textInput"><span><input type="text" name="email" id="email" class="text width5"   /></span></div></td> <%--runat="server"--%>
			</tr> 
			<tr> 
				<td height="36">密&nbsp;&nbsp;&nbsp;码: </td> 
				<td><div class="textInput"><span><input type="password" name="password" id="password"    class="text width5" /></span></div></td> <%--runat="server"--%>
			</tr> 
						<tr class="distance"> 
			  <td></td> 
			  <td><font color=red></font></td> 
			  </tr> 
			<tr class="distance"> 
			  <td></td> 
			  <td> 
			  <div class="bigButton but-01"><a href="javascript:;" > 
			    <span class="inc" ><asp:Button ID="btnSubmit" runat="server" Text="  登 录  " CssClass="enter"  ToolTip="立即登录" onclick="btnSubmit_Click" /></span> 
				<span class="lAng png" ></span><span class="rAng png" ></span></a></div> 
			   </td> 
		    </tr> 
			<tr class="distance"> 
			  <td></td> 
			  <td align="left">&nbsp;</td> 
			  </tr> 
			<tr class="distance"> 
				<td></td> 
				<td align="left"><a href="getpass.php" class="clew">忘记密码？</a></td> 
			</tr> 
		</table> 
		<input type="hidden" name="ret_url" value="" /> 
		</center> 
		<em class="cr"></em> 
		</form> 
	<div class="modFoot"><span class="lAng"></span><span class="rAng"></span></div> 
    </div> 
 
<div class="mod modAng"> 
	<div class="modHead"> 
		<h3 class="bd">初次使用iximo</a></h3> 
		<span class="lAng" ></span><span class="rAng" ></span> 
	</div> 
	<div  class="modBody"> 
	  	<div class="bigButton but-01"> 
			    <a href="register.php" > 
			    <span class="inc" >注册读者！</span> 
				<span class="lAng png" ></span><span class="rAng png" ></span> 
				</a> 
		</div> 
		<em class="cr"></em> 
	 </div> 
	<div class="modFoot"><span class="lAng"></span><span class="rAng"></span></div> 
</div> 
 
<div class="mod modAng"> 
	<div class="modHead"> 
		<h3 class="bd">加入iximo成为作者</h3> 
		<span class="lAng" ></span><span class="rAng" ></span> 
	</div> 
	<div  class="modBody"> 
	  	<div class="bigButton but-01"> 
			    <a href="regauthor.php" > 
			    <span class="inc" >注册作者！</span> 
				<span class="lAng png" ></span><span class="rAng png" ></span></a> 
		</div> 
		<em class="cr"></em> 
	</div> 
	<div class="modFoot"><span class="lAng"></span><span class="rAng"></span></div> 
</div> 
 
</div> 
	</div> 
<em class="cr"></em> 
</div> 


<div class="page-foot"><h6 class="bd"></h6></div> 
</div> 
<script type="text/javascript"> 
document.getElementById('email').focus();
</script> 

</asp:Content>
