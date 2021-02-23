<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 | 관리자 모드</title>
</head>
<body>


	<div style="margin-top: 35px;text-align: center">
	<div class="p-4" style="width: 1000px; display: inline-block;">
	
		<nav>
	   	<ul class="nav nav-pills nav-fill">
	  		<li class="nav-item" >
	    <a class="nav-link active btn btn-outline-dark" href="#">관리자모드</a>
	  	</li>
	  	<li class="nav-item" >
	    	<a class="nav-link btn btn-outline-dark" href="/pet/admin/memberlist.do">회원관리</a>
	  	</li> 	
	  	<li class="nav-item">
	    	<a class="nav-link btn btn-outline-dark" href="/pet/review/adminreviewlist.do">리뷰관리</a>
	  	</li>  	
	   	<li class="nav-item">
	    	<a class="nav-link btn btn-outline-dark" href="/pet/admin/admindict.do">컨텐츠</a>
	  	</li>
	 	</ul>
		</nav>

<div>
</div>

<div style="text-align: left; margin-top:30px; margin-bottom: 35px" >
	<h3><span class="badge badge-light">미승인 의사 : ${docCount}건이 있습니다. </span> 	
	<input class="btn btn-secondary" type="button" value="승인하러 가기" onclick="window.location='doclist.do'" /></h3><br>
	<table class="table" style="text-align: center">	
		<tr>
			<td>메일</td>
			<td>이름</td>
			<td>시간</td>
		</tr>
		<c:forEach var="docList" items="${docList}">	
			<tr>
				<td>${docList.doc_mail}</td>
				<td>${docList.doc_name}</td>
				<td>${docList.reg_date}</td>
			</tr>
		</c:forEach>
	</table>
</div>

<div style="text-align: left">
	<h3><span class="badge badge-light">미승인 리뷰 : ${reviewCount}건이 있습니다.</span> 	
	<input class="btn btn-secondary" type="button" value="승인하러 가기" onclick="window.location='/pet/review/adminreviewlist.do'" /></h3><br>
	<table class="table" style="text-align: center">	
		<tr>
			<td>메일</td>
			<td>이름</td>
			<td>시간</td>
		</tr>
		<c:forEach var="reviewList" items="${reviewList}">
			<tr>
				<td>${reviewList.member_email}</td>
				<td>${reviewList.member_email}</td>
				<td>${reviewList.reg_date}</td>
			</tr>
		</c:forEach>
	</table>
</div>
</div>
</div>

</body>
</html>