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

<div>상단 병원 이미지</div>

<div>의사프로필 병원주소 등 간단하게 요약</div>

<div>의사 정보</div>

<div>병원 정보</div>

<div>리뷰 평균</div>

<div>키워드검색</div>

<div>정렬</div>
<c:forEach var="reviewList" items="${reviewList}">
	<div>
		<div>
			<div>회원정보 : ${reviewList.member_email}</div>
			<div>
				<div>별점 평균</div>
				<div>재방문 추천 : ${reviewList.revisit}</div>
			</div>
			<div>별점</div>
		</div>
		<div>
			<div>등록일 : ${reviewList.reg_date}</div>
			<div>한줄평</div>
			<div>리뷰</div>
			<div>가격정보</div>
			<div>신고 및 좋아요</div>
		</div>
	</div>
</c:forEach>
</body>
</html>