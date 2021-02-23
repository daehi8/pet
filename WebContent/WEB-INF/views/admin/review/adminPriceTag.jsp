<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 | 관리자  | 태그관리</title>
</head>
<body>

	<div style="margin-top: 35px;text-align: center">
	<div class="p-4" style="width: 1000px; display: inline-block;">
	
	<nav>
   	<ul class="nav nav-pills nav-fill">
  		<li class="nav-item" >
    <a class="nav-link btn btn-outline-dark" href="/pet/review/adminreviewlist.do">리뷰관리</a>
  	</li>
  	<li class="nav-item" >
    	<a class="nav-link active btn btn-outline-dark" href="/pet/admin/adminpricetag.do">태그관리	</a>
  	</li> 	
  	<li class="nav-item">
    	<a class="nav-link btn btn-outline-dark" href="/pet/admin/adminmain.do">뒤로</a>
  	</li>  	
 	</ul>
	</nav>
<br>	
<div>
<div class="card">
  <div class="card-body">
<c:forEach var="list" items="${tagList}">
	<div style="text-align: center">
		<span class="badge badge-light">${list}</span>
		<a href="/pet/admin/deletepricetag.do?subject=${list}">삭제</a>
	</div>
</c:forEach>
</div>
</div>
</div>
<br>
<form action="insertpricetag.do" name="insertForm">
	<input type="text" name="subject"/>
	<input class="btn btn-dark" type="submit" value="태그등록"/>
</form>
</div>
</div>
</body>
</html>