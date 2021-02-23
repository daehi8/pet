<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰  | 관리자 | 체크리스트</title>
</head>
<body>

	<div style="margin-top: 40px;text-align: center">
	<div class="p-4" style="width: 1000x; display: inline-block;">
	

<c:forEach var="checkList" items="${checkList}">
<a href="/pet/check/check.do?check_no=${checkList}">${checkList}</a>
</c:forEach>
</div>
</div>
</body>
</html>