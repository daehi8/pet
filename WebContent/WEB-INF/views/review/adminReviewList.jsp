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
<table>
	<tr>
		<td>번호</td>
		<td>아이디</td>
		<td>체크</td>
	</tr>
	<c:forEach var="list" items="${authCheckList}">
		<tr>
			<td></td>
			<td><a href="/pet/review/admincontentsreview.do?review_no=${list.no}">${list.member_email}</a></td>
			<td>${list.auth_check}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>