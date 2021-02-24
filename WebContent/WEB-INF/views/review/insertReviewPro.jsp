<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 | 리뷰쓰기</title>
</head>
<body>

	<div style="margin-top: 35px;text-align: center">
	<div class="p-4" style="width: 1000x; display: inline-block;">
	<div class="card">
  <div class="card-body">
  
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원님의 소중한 리뷰가 등록되었습니다. 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br> 승인까지는 약 1~6시간이 소요됩니다. 
	<br>
	<br>
	
	<input class="btn btn-dark w-100 p-2" type="button" value="승인된 리뷰 목록" onclick="location.href='/pet/member/reviews_list.do?email=${sessionScope.member.email}'">
	</div>
</div>
	
	
</div>
</div>
</body>
</html>