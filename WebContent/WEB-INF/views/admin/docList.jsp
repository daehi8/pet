<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ include file="../nav.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>docList</title>
</head>
<body>
	의사 메일            |          파일인증상태            |          관리자 가입승인상태 <br>
	<c:forEach var="docInfoDto" items="${docList}">
		${docInfoDto.doc_mail}, ${docInfoDto.authstate}, ${docInfoDto.doc_state}
		<input type="button" value="가입 승인" onClick="window.location='/pet/admin/stateChange.do'"/>
		<input type="button" value="병원정보입력" onClick="window.location='/pet/admin/hospitalForm.do?doc_mail=${docInfoDto.doc_mail}'"/><br><hr/>
	</c:forEach>

</body>
</html>