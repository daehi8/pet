<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 | 관리자  | 리뷰관리</title>
</head>
<body>

	<div style="margin-top: 35px;text-align: center">
	<div class="p-4" style="width: 1000px; display: inline-block;">
	
	<nav>
   	<ul class="nav nav-pills nav-fill">
  		<li class="nav-item" >
    <a class="nav-link active btn btn-outline-dark" href="/pet/review/adminreviewlist.do">리뷰관리</a>
  	</li>
  	<li class="nav-item" >
    	<a class="nav-link btn btn-outline-dark" href="/pet/admin/adminpricetag.do">태그관리</a>
  	</li> 	
  	<li class="nav-item">
    	<a class="nav-link btn btn-outline-dark" href="/pet/admin/adminmain.do">뒤로</a>
  	</li>  	
 	</ul>
	</nav>
<br>
	
	
	<div class="card">
  	<div class="card-body">
    <div class="panel-heading"></div>
    <div class="panel-body">
    <table class="table table-hover" style="text-align:center;">
    <tr>
    	<th>병원 이름</th><td>${hospitalName}</td>
    </tr>  
    <tr>
    	<th>의사 이름</th><td>${docInfoDTO.doc_name}</td>
    </tr>
    <tr>
		<c:forEach var="priceByNoList" items="${priceByNoList}">	
    	<th>치료가격 및 정보</th><td>${priceByNoList.subject_info}, ${priceByNoList.price_info}원</td>
    	</c:forEach>
    </tr>
    <tr>
    	<th>별점</th><td style="text-align:center">친절함 : ${ratingReviewDTO.kind}<br>
    					대기시간 : ${ratingReviewDTO.waiting}<br>
    					청결함 : ${ratingReviewDTO.clean}<br>
    					진료 설명 : ${ratingReviewDTO.detail}<br>
						가격 : ${ratingReviewDTO.price}<br>
						치료 후 결과 : ${ratingReviewDTO.after}<br>
						평균 평점 : ${ratingReviewDTO.mean}<br>
    				</td>
	</tr>
	<tr>
		<th>리뷰</th><td>의사리뷰 : ${commentReviewDTO.docter_review}<br>
						병원리뷰 : ${commentReviewDTO.hospital_review}<br>
						한줄평 : ${commentReviewDTO.summary}<br></td>
	</tr>
	  <tr>
    	<th>인증사진</th><td><img alt="인증사진" src="/pet/save/${uploadReviewDTO.save_name}"  width=400px, height=400px></td>
    </tr>
    <tr>
    	<th>재방문 추천</th><td>${reviewDTO.revisit}</td>
    </tr>
        <tr>
    	<th>리뷰 공개 여부</th><td>${reviewDTO.public_check}</td>
    </tr>
    <tr>
    	<th>병원 사진</th><td><c:forEach var="cureFileReviewList" items="${cureFileReviewList}">
								<img alt="치료사진" src="/pet/save/${cureFileReviewList.save_name}">
							</c:forEach></td>
    </tr>
    <tr>
    	<th>치료 사진</th><td><c:forEach var="hospitalFileReviewList" items="${hospitalFileReviewList}">
								<img alt="병원사진" src="/pet/save/${hospitalFileReviewList.save_name}">
							</c:forEach></td>
	</table>
	
	
	<div style="text-align:center">
		<c:if test="${reviewDTO.auth_check == 'N' || reviewDTO.auth_check == 'D'}">
		<input class="btn btn-dark"  type="button" value="승인" OnClick="window.location='/pet/review/okauthcheck.do?review_no=${reviewDTO.no}'">
		</c:if>
		<c:if test="${reviewDTO.auth_check != 'D'}">
		<input class="btn btn-light"  type="button" value="미승인" OnClick="window.location='/pet/review/noauthcheck.do?review_no=${reviewDTO.no}'">
		</c:if>
	</div>
</div>
</div>
</div>
</body>
</html>