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
<div>
<c:forEach var="list" items="${tagList}">
	<div>
		${list}
		<a href="/pet/admin/deletepricetag.do?subject=${list}">삭제</a>
	</div>
</c:forEach>
</div>
<form action="insertpricetag.do" name="insertForm">
	<input type="text" name="subject"/>
	<input type="submit" value="등록"/>
</form>

</body>
</html>