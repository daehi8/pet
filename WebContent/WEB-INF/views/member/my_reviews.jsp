<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 리뷰</title>
</head>
<body>


<c:if test="${member !=null }">
 
등록된 리뷰 개수 ${count}개 </br>
도움이 되었어요! 좋아요 ${count_like}개</br>
		
등록된 리뷰 리스트 ${count}개 <input type="button" value="리뷰 ${count}개 보러가기" onclick="location.href='/pet/member/reviews_list.do?email=${email}'"></br>
<input type="button" value ="리뷰쓰기" onclick="location.href='/pet/member/my_reviews.do'">
		
</c:if>
</body>
</html>