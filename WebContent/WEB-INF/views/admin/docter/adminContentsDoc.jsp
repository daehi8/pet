<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	메일 : ${docInfoDTO.doc_mail}
	비밀빈호 : ${docInfoDTO.doc_pw}
	이름 : ${docInfoDTO.doc_name}
	프로필 사진 : <img alt="의사사진" src="/pet/save/${docInfoDTO.doc_save}">
	인증상태 : ${docInfoDTO.authstate}
	승인상태 : ${docInfoDTO.doc_state}
	가입 날짜 : ${docInfoDTO.reg_date}
	
	인증 파일 : 
	<c:forEach var="list" items="${docPicturList}" >
		<img alt="인증사진" src="/pet/save/${list.save_pic}">
	</c:forEach>
	
	<div>
		<a href="/pet/admin/okdocauthcheck.do?doc_mail=${docInfoDTO.doc_mail}">승인</a>
		<a href="/pet/admin/noadocuthcheck.do?doc_mail=${docInfoDTO.doc_mail}">미승인</a>
		<a href="/pet/admin/doclist.do">목록</a>
	</div>
	
</body>
</html>