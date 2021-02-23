<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 | 관리자  | 체크리스트</title>
</head>
<body>


	<div style="margin-top: 35px;text-align: center">
	<div class="p-4" style="width: 1000px; display: inline-block;">
	
		<nav>
	   	<ul class="nav nav-pills nav-fill">
	  		<li class="nav-item" >
	    <a class="nav-link btn btn-outline-dark" href="/pet/admin/admindict.do">사전관리</a>
	  	</li>
	  	<li class="nav-item" >
	    	<a class="nav-link active btn btn-outline-dark" href="/pet/admin/admincheck.do">체크리스트</a>
	  	</li> 	
	  	<li class="nav-item">
	    	<a class="nav-link btn btn-outline-dark" href="/pet/admin/adminboard.do	">게시판관리</a>
	  	</li>  	
	   	<li class="nav-item">
	    	<a class="nav-link btn btn-outline-dark"  href="memberlist.do">뒤로</a>
	  	</li>
	 	</ul>
		</nav>

<br>
<br>
	<div style="text-align: center">
	<c:forEach var="checkList" items="${checkList}">
		<a href="/pet/admin/admincheckcontents.do?check_no=${checkList}">${checkList}번 체크리스트</a>
		<a href="/pet/admin/admincheckdel.do">삭제</a>
		<br/>
	</c:forEach>
	</div>
</div>
</div>
</body>
</html>