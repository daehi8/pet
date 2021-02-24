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
    	<th style="width:35%">병원 이름</th><td>${hospitalName}</td>
    </tr>  
    <tr>
    	<th>의사 이름</th><td>${docInfoDTO.doc_name}</td>
    </tr>
    <tr>
    <th>치료가격 및 정보</th>
		<td><c:forEach var="priceByNoList" items="${priceByNoList}">	
    	${priceByNoList.subject_info}, ${priceByNoList.price_info}원<br>
    	</c:forEach></td>
    </tr>
    <tr>
    	<th>별점</th><td style="text-align:center"><span class="badge badge-light">친절함</span>
    											${ratingReviewDTO.kind}<br>
    					<span class="badge badge-light">대기시간 </span>
    					 ${ratingReviewDTO.waiting}<br>
    					<span class="badge badge-light">청결함 </span> ${ratingReviewDTO.clean}<br>
    					<span class="badge badge-light">진료 설명  </span> ${ratingReviewDTO.detail}<br>
						<span class="badge badge-light">가격 </span> ${ratingReviewDTO.price}<br>
						<span class="badge badge-light">치료 후 결과 </span> ${ratingReviewDTO.after}<br>
						<span class="badge badge-light">평균 평점 </span> ${ratingReviewDTO.mean}<br>
    				</td>
	</tr>
	<tr>
		<th>리뷰</th><td style="text-align:center"><span class="badge badge-primary">의사리뷰</span> ${commentReviewDTO.docter_review}<br><br>
						<span class="badge badge-primary">병원리뷰 </span> ${commentReviewDTO.hospital_review}<br><br>
						<span class="badge badge-primary">한줄평 </span> ${commentReviewDTO.summary}<br></td>
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