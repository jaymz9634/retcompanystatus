<%
'Ver 0.1 Created by jaymz9634 at 2017-11-22'
%>
<%@LANGUAGE="JAVASCRIPT" CODEPAGE="949"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>사업자등록상태조회</title>
</head>
<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/common_function.min.js"></script>
<script type="text/javascript">
function fnRetComStatus(){
	var params = {txprDscmNo : $("#txtRegNum").val()};
	$.post( "./proc/procRetStatus.asp", params)
	  .done(function( data ) {
	  	var outRegNum = $("#txtRegNum").val();
		outRegNum = Left(outRegNum,3) + "-" + outRegNum.substring(3,5) + "-" + Right(outRegNum,5); //custom javasciprt left, right function
	  	$("#txtDscmNo").html(outRegNum);		
		$(data).each(function(){
			$("#txtTrtCntn").html($(this).find("map>trtCntn").text());
		 });
	});
}
</script>
<body>
<table width="100%"  border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td>사업자등록번호</td>
    <td><input type="text" id="txtRegNum" value="1040597836"/></td>
	<td><button onClick="fnRetComStatus();" style="cursor:pointer;">조회</button></td>
  </tr>
</table>
<hr/>
사업자등록상태 조회결과
<table width="100%"  border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td>사업자등록번호</td>
    <td>사업자등록상태</td>
  </tr>
  <tr>
    <td id="txtDscmNo">&nbsp;</td>
    <td id="txtTrtCntn">&nbsp;</td>
  </tr>
</table>

</body>
</html>
