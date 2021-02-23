<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 리뷰</title>
</head>
<body>
<div style="margin-top: 40px;text-align: center">
	<div class="p-5" style="width: 500px; display: inline-block;">	

<c:if test="${member !=null }">
<table class="table">
<tr>
<td>등록된 리뷰 개수 ${count}개 </br>
도움이 되었어요! 좋아요 ${count_like}개</br>
</td>
</tr>
<tr>		
<td>등록된 리뷰 리스트 ${count}개 <input class="btn btn-dark" type="button" value="리뷰 ${count}개 보러가기" onclick="location.href='/pet/member/reviews_list.do?email=${email}'"></br></td>
</tr>	
</table>
<input class="btn btn-dark w-100 p-2" type="button" value ="리뷰쓰기" onclick="location.href='/pet/member/my_reviews.do'">		
</c:if>
</div>
</div>			
</body>
</html>