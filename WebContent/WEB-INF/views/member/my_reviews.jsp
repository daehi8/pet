<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script>
$(function () {
	  $('[data-toggle="popover"]').popover()
	})
</script>
<meta charset="UTF-8">
<title>펫츠리뷰 | 나의리뷰</title>
</head>
<body>


	<div style="margin-top: 35px;text-align: center">
	<div class="p-4" style="width: 1000px; display: inline-block;">
	
	
	<c:if test="${member == null }">
		<h2>로그인이 필요한 화면입니다.</h2>
		<c:redirect url="/member/login.do"></c:redirect>
	</c:if>

	<h2 style="text-align:left; margin-bottom: 30px;"><strong>나의 리뷰</strong></h2>
	<h4 style="text-align:left;  margin-bottom: 20px;"><span class="badge badge-light">${member.pen_name} 님의 활동내역</span></h4>
	<c:if test="${member !=null }">
 	<table class="table" style="text-align:center">

 	<tr>
 	<th>등록된  리뷰 <br> </th>
 	<th>도움이 되었어요 <button type="button" class="btn btn-light" data-container="body" data-toggle="popover" data-placement="right" 
 	data-content="회원님이 작성하신 리뷰의 좋아요 개수입니다! "> ♥ </button>
 	</th>
	</tr>
	
	<tr>
	<td><input class="btn btn-outline-dark" type="button" value="${count}개 확인하기" onclick="location.href='/pet/member/reviews_list.do?email=${email}'">

	</td>
	<td>${count_like}개</td>
	</tr>
	</table>
	<br>
<input class="btn btn-dark w-50 p-2" type="button" value ="리뷰쓰기" onclick="location.href='/pet/review/insertreview.do'">
		
</c:if>
</div>
</div>
</body>
</html>