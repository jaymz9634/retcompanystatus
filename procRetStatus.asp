<%
'Ver 0.1 Created by jaymz9634 at 2017-11-22'

Session.CodePage = 949
Response.Charset = "euc-kr"	'결과가 한글이기에 안 깨지게...'
'On Error Resume Next'

txprDscmNo = Request("txprDscmNo")

xmldata = xmldata & "<map id='ATTABZAA001R08'><pubcUserNo/><mobYn>N</mobYn><inqrTrgtClCd>1</inqrTrgtClCd><txprDscmNo>"&txprDscmNo&"</txprDscmNo><dongCode>05</dongCode><psbSearch>Y</psbSearch><map id='userReqInfoVO'/></map>"

set api = createobject("msxml2.serverXmlhttp")
api.open "POST", "https://teht.hometax.go.kr/wqAction.do?actionId=ATTABZAA001R08&screenId=UTEABAAA13&popupYn=false&realScreenId=", false 
api.setRequestHeader "content-type","text/xml; charset=utf-8"
api.send xmldata

if api.status = 200 Then
	Response.ContentType="text/xml"
	Response.Write(api.ResponseText)
else
	Response.Write("[statusCode : "&api.status&"]" & "<br/>")
	Response.Write("<hr/>")
	Response.Write(xmldata & "<br/>")
	Response.Write("<hr/>")
	Response.Write(api.responseText & "<br/>")'
End if

If Err.number <> 0 Then     '오류 발생 시 이 부분 실행
	Response.Write "<b3>" & Err.Source & "<hr noshade></h3>"
	Response.Write "오류 번호 : " & Err.number & "<br>"
	Response.Write "내용 : " & Err.Description & "<br>"
End If

Set api = nothing
%>
