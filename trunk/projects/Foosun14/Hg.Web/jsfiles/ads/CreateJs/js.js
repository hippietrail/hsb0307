function Num()
{
  var berr=false;
  if (!(event.keyCode>=48 && event.keyCode<=57)) berr=true;
  return !berr;
}

function chkinput()
{
  if (document.form.ADID.value=="")
	{
	  alert("����д���ID (��������)");
	  document.form.ADID.focus();
	  return false
	 }
  else if (document.form.ADSrc.value=="")
	{
	  alert("����д������ӵ�ַ (���ڴ��ں���ҳ�Ի����������ҳ���ַ)");
	  document.form.ADSrc.focus();
	  openhelp("ext")
	  return false
	 }
  else if (isNaN(parseInt(document.form.ADWidth.value)))
	{
	  alert("����д���Ŀ� (��λ������)");
	  document.form.ADWidth.focus();
	  return false
	 }
  else if (isNaN(parseInt(document.form.ADHeight.value)))
	{
	  alert("����д���ĸ� (��λ������)");
	  document.form.ADHeight.focus();
	  return false
	 }
  else if (isNaN(parseInt(document.form.ADStopHits.value)))
	{
	  alert("����д���ƹ��ĵ������ (�粻��������������0)");
	  document.form.ADStopHits.value=0;
	  document.form.ADStopHits.focus();
	  return false
	 }
  else if (isNaN(parseInt(document.form.ADStopViews.value)))
	{
	  alert("����д���ƹ�����ʾ���� (�粻��������������0)");
	  document.form.ADStopViews.value=0;
	  document.form.ADStopViews.focus();
	  return false
	 }
  else if (isNaN(parseInt(document.form.ADStopDate.value)))
	{
	  var d = new Date();
	  alert("����д���ƹ��Ͷ�Ž�ֹ���� (��ʽ"+d.getYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" �粻������������"+(d.getYear()+50)+"-"+(d.getMonth()+1)+"-"+d.getDate()+")");
	  document.form.ADStopDate.value=(d.getYear()+50)+"-"+(d.getMonth()+1)+"-"+d.getDate();
	  document.form.ADStopDate.focus();
	  return false
	 }
}

function ckinput()
{
  if (document.loadad.username.value=="")
	{
	  alert("�������Ա����");
	  document.loadad.username.focus();
	  return false
	 }
  else if (document.loadad.userpass.value=="")
	{
	  alert("����д����Ա����");
	  document.loadad.userpass.focus();
	  return false
	 }
  else if (document.loadad.secruity.value=="")
	{
	  alert("����д������� (�ұߵ���λ����)");
	  document.loadad.secruity.focus();
	  return false
	 }
}

function ChangeType(adtype)
{
 	var adsrcText="";
	switch (adtype){
	case "6":adsrcText="�������";
	case "5":
	case "7":
	case "8":
 	}
}

function openhelp(e)
{
	var e
	if (e=="ext")
	{
		alert("���ڣ�����ַ\n\n ͨ��ָͼƬ��FLASH�ĵ�ַ \n\n �������͹����⣺\n 1����͸���Ի��� ָ�Ի����е����� \n 2������ҳ�Ի��� ��ҳ��URL��ַ \n 3�������ڡ� ָ�򿪻򵯳����ڵ�ַ")
	 }
	if (e=="stop")
	{
		alert("���ڣ�Ͷ������\n\n ��ʾ������������ ��ʾ�������������ʾ���� \n �����������󽫲�����ʾ�ù��(����ʾ) \n\n ��ע�⣺\n 1�����������ơ� ��������ʾ����������д����0,��������д1���Ժ������ \n 2��������һ���� ���������ƿ�ͬʱ�򵥶���д,������д�������� \n 3�����������Ƹ�ʽ�� 2004-3-11")
	 }
}