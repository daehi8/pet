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
		이메일 : ${reviwDTO.member_email}
		병원이름 : ${reviewDTO.hospital_name}
		의사이름 : ${reviewDTO.doc_name}
	</div>
	
	<div>
		인증사진 : <img alt="인증사진" src="/pet/save/${uploadReviewDTO.save_name}">
	</div>
	
	<div>
		친절 : ${ratingReviewDTO.kind}
		대기시간 : ${ratingReviewDTO.waiting}
		청결 : ${ratingReviewDTO.clean}
		설명 : ${ratingReviewDTO.detail} 
		가격 : ${ratingReviewDTO.price}
		결과 : ${ratingReviewDTO.after}
	</div>
	
	<div>
		의사리뷰 : ${commentReviewDTO.docter_review}
		병원리뷰 : ${commentReviewDTO.hospital_review}
		한줄 평 : ${commentReviewDTO.summary}
	</div>
	
	<div>
		<table>
			<tr>
				<td>진료과목</td>
				<td>가격</td>
			</tr>
			<c:forEach var="priceByNoList" items="${priceByNoList}">
				<tr>
					<td>${priceByNoList.subject_info}</td>
					<td>${priceByNoList.price_info}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div>
		재방문 추천 : ${reviewDTO.revisit}
	</div>
	
	<div>
		공개 여부 : ${reviewDTO.public_check}
	</div>
	
	<div>
		병원 사진 
		<c:forEach var="cureFileReviewList" items="${cureFileReviewList}">
			<img alt="치료사진" src="/pet/save/${cureFileReviewList.save_name}">
		</c:forEach>
		치료 사진
		<c:forEach var="hospitalFileReviewList" items="${hospitalFileReviewList}">
			<img alt="병원사진" src="/pet/save/${hospitalFileReviewList.save_name}">
		</c:forEach>
	</div>
	
	<div>
		<input type="button" value="승인">
		<input type="button" value="미승인">
		<input type="button" value="목록">
	</div>
</body>
</html>