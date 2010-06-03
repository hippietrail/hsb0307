function stlVoteOpenWin(isVote, openUrl, ajaxDivID, maxVoteItemNum, cookieName, openWindowHeight, openWindowWidth)
{
var voteElement = document.getElementById(ajaxDivID);
if(voteElement == null) return;

var radios = voteElement.getElementsByTagName("input");
var selectedValues = "";
if(isVote)
{
	var voteItemNum = 0;
	if(radios != null && radios.length > 0)
	{
		for(var i = 0 ;i < radios.length; i++)
		{
			if((radios[i].type=="radio" || radios[i].type=="checkbox") && radios[i].checked)
			{
				selectedValues = selectedValues + radios[i].value + ",";
				voteItemNum++;
				radios[i].checked = false;
			}
		}
		if(selectedValues != "")
		{
			selectedValues = selectedValues.substr(0, selectedValues.length - 1);
		}
	}
	var cookieString = document.cookie;
	if (cookieString.indexOf(cookieName + '=') != -1)
	{
		//对不起，您已经参加了投票!
		alert(decodeURIComponent('%E5%AF%B9%E4%B8%8D%E8%B5%B7%EF%BC%8C%E6%82%A8%E5%B7%B2%E7%BB%8F%E5%8F%82%E5%8A%A0%E4%BA%86%E6%8A%95%E7%A5%A8!'));
		return false; 
	}
	if(voteItemNum == 0)
	{
		//请至少选择一项进行投票!
		alert(decodeURIComponent('%E8%AF%B7%E8%87%B3%E5%B0%91%E9%80%89%E6%8B%A9%E4%B8%80%E9%A1%B9%E8%BF%9B%E8%A1%8C%E6%8A%95%E7%A5%A8!'));
		return false; 
	}
	else if (maxVoteItemNum > 0 && voteItemNum > maxVoteItemNum)
	{
		//alert('您最多能选择' + maxVoteItemNum + '项进行投票！');
		alert(decodeURIComponent('%E6%82%A8%E6%9C%80%E5%A4%9A%E8%83%BD%E9%80%89%E6%8B%A9') + maxVoteItemNum + decodeURIComponent('%E9%A1%B9%E8%BF%9B%E8%A1%8C%E6%8A%95%E7%A5%A8!'));
		return false; 
	}
}

window.open(openUrl + "&isVote=" + isVote + "&selectedValues=" + selectedValues,"stlVote","width=" + openWindowWidth + ",height=" + openWindowHeight + ",left=" + (screen.width-openWindowWidth)/2 + ",top=" + (screen.height-openWindowHeight)/2 + ";toolbar=no, menubar=no,scrollbars=yes, resizable=yes,location=no, status=no").focus();
return false;
}
