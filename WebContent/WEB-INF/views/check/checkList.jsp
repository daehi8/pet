<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 | 체크리스트</title>
</head>
<body>

	<div style="margin-top: 35px;text-align: center">
	<div class="p-4" style="width: 1000x; display: inline-block;">
	
<%--
<c:forEach var="checkList" items="${checkList}">
<a href="/pet/check/check.do?check_no=${checkList}">${checkList}</a>
</c:forEach>--%>
<h1 style="text-align: left">체크리스트</h1>
<br>
<br>
	<label><input type="radio"  name="serviceType" value="d"  onclick="location.href='/pet/check/check.do?check_no=1'"> 
		<img src="https://i.ibb.co/pJgZxC9/image.png" width=200px, height=200px></label>
    <label><input type="radio"  name="serviceType" value="c" onclick="location.href='/pet/check/check.do?check_no=2'"> 
    	<img src="https://i.ibb.co/NF02M3q/dd.png" width=200px, height=200px></label>
    <label><input type="radio"  name="serviceType" value="b" onclick="location.href='/pet/check/check.do?check_no=3'">  
    	<img src="https://i.ibb.co/RQdTXtZ/4545.png" width=200px, height=200px></label>

</div>
</div>

</body>
</html>