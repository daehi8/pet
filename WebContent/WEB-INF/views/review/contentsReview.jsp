<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../nav.jsp" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>펫츠리뷰 | ${hospitalDTO.name}</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
function categorySearchType(){
	var searchType = $("#searchType").val();
	var hospital_no = ${hospital_no};
	location.href="contentsreview.do?hospital_no="+hospital_no+"&searchType="+searchType+"";
}
</script>
<style>
.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('/pet/resources/img/starrate.png');
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate_radio:checked + label {
    background-color: orange;
}
</style>
</head>
<body>

	<div style="margin-top: 20px;text-align: center">
	<div class="p-4" style="width: 1000px; display: inline-block;">
	
  	
	<ul class="list-group list-group-flush">
		
		<li class="list-group-item">
  			<div class="d-flex align-items-center" style="font-size: 18px;">
  				<h3><span class="badge badge-secondary">${hospitalDTO.name}</span></h3>
  			</div>
  			
  				<div style="width:20%; float:left;">
  					<c:if test="${docPictureDTO.org_pic != null}">
  						<img alt="의사 사진"  src="/pet/save/${docPictureDTO.org_pic}"  width=150px, height=150px>
  					</c:if>
  					<c:if test="${docPictureDTO.org_pic == null}">
  						<img alt="의사 사진"  src="/pet/resources/img/프로필사진.jpg"  width=150px, height=150px>
  					</c:if>
  				</div>
   				<div class="d-flex align-items-center" style="margin-top: 20px; font-size: 32px; font-weight:bold">
 	 				<c:if test="${docInfoDTO != null}">
 	 					${docInfoDTO.doc_name} 		
 	 				</c:if>
 	 				<c:if test="${docInfoDTO == null}">
 	 					등록된 의사가 없습니다. 		
 	 				</c:if>	
 	 			</div>
 	 			<div style="margin-top: 20px;"  class="d-flex align-items-center">	
 	 				<span class="badge badge-pill badge-dark">${meanRatingResult}</span> 
 	 			<div style="margin-left: 10px;">
	 	 			<c:if test="${count != 0}">
	 	 				(리뷰 ${count})
	 	 			</c:if>
 	 			</div>
 	 			<div class="ratefill" style="width: 300px;"></div>
  				</div>
  		</li>
 		 <li class="list-group-item">
   				<div class="d-flex align-items-center">
  					${hospitalDTO.road_adr}
  				</div>
  				<div class="d-flex align-items-center">
  					<c:if test="${docMyHospitalDTO != null}">
  						영업시간 : ${docMyHospitalDTO.hospital_hours}
  					</c:if>
  				</div>
  		 <li class="list-group-item">
  				<div class="d-flex align-items-center">
  					<c:if test="${docMyHospitalDTO != null}">
  						병원 이력 : ${docMyHospitalDTO.hospital_contents}
  					</c:if>
  				</div>
  		 </li>
  		 <li class="list-group-item">
  				<div class="d-flex align-items-center">
  					<c:if test="${docMyHospitalDTO.hospital_pic_org != null}">
						<img style="margin-left: auto; margin-right: auto; display: block;" alt="병원사진" src="/pet/save/${docMyHospitalDTO.hospital_pic_org}">
					</c:if>
				</div>
		</li>
	</ul>

	<br>
	<br>

	<c:if test="${count == 0}">
		아직 등록된 리뷰가 없습니다.<br>
		첫 리뷰를 등록해보세요!
	</c:if>
	<c:if test="${count != 0}">

	<!-- 키워드검색 -->
	<div>
		<select name="searchType" id="searchType" onchange="categorySearchType()"
		class="form-control form-control">
			<option>--</option>
			<option value="regOrder">최신 순</option>
			<option value="ratingOrder">평점 높은 순</option>
			<option value="likeOrder">좋아요 많은 순</option>
		</select>
	</div>
	<br>
	<c:forEach var="reviewList" items="${reviewList}" varStatus="status">	
	<div id="reviewList">
		<ul class="list-group">
  			<li class="list-group-item">
  			
  				<!-- 등록일 상단-->
  	 			<div style="font-size: 11px; text-align:right; color: #9b9b9b;">
 					등록일 : ${reviewList.reg_date}
 				</div>
 				<div style="float:left;  width:25%;	">
 				<!-- 왼쪽 -->
				<div style="text-align:left;">
  					<h5>${memNickList[status.index]}<br></h5>	
  				<!-- 별점 평균 -->
				<div style="text-align:left">
					<strong>${ratingList[status.index].mean}<br></strong></div>
				<!-- 별점 -->	
				<div style="text-align:left; font-size: 14px;">
					<span class="badge badge-light">친절</span> ${ratingList[status.index].kind}<br>
 					<span class="badge badge-light">대기시간 </span> ${ratingList[status.index].waiting}<br>
 					<span class="badge badge-light">청결 </span> ${ratingList[status.index].clean}<br>
 					<span class="badge badge-light">설명</span> ${ratingList[status.index].detail}<br>
 					<span class="badge badge-light">가격 </span> ${ratingList[status.index].price}<br>
 					<span class="badge badge-light">결과 </span> ${ratingList[status.index].after}<br>
 					<span class="badge badge-light">재방문 추천 </span> ${reviewList.revisit}<br>
 				</div>
				</div>
				<br>
				</div>
				<div style="float:left; width:75%;">
				<!-- 오른쪽 -->
				<!-- 한줄평  상단  + 가격정보-->
			 	<div>
					<div class="text-left mt-1" style="font-weight: bold;">
						${commentList[status.index].summary}<br><br>
					<c:forEach var="priceMap" items="${priceMap[status.index]}">
					 	${priceMap.subject_info} : ${priceMap.price_info}원<br>
				</c:forEach>
				</div>
				<br>
				<!-- 의사, 병원리뷰-->
				<div class="text-left mt-1" style="font-size: 14px;">	
					${commentList[status.index].docter_review}
  				 <hr>
					${commentList[status.index].hospital_review}<br>
				</div>
				<!-- 가격정보 -->
				</div>
				<div style="font-size: 11px; text-align:right; color: #9b9b9b;">
					<a href="/pet/review/likereview.do?review_no=${reviewList.no}&target_email=test&member_email=test&hospital_no=${hospitalDTO.no}">추천</a>
					추천 : ${likeList[status.index]}
				</div>	
  				</div>
 			 </li>
 		 </ul>	
 	 </div>
  <br>
  <br>
</c:forEach>
<!-- 페이징 -->
<nav aria-label="Page navigation-sm">
     <ul class="pagination justify-content-center">   
	    <c:if test="${pageDTO.startPage > 10}">
	        <a href="/pet/review/contentsreview.do?pageNum=${pageDTO.startPage - 10}&searchType=${searchType}&hospital_no=${hospitalDTO.no}">&laquo;</a>
	    </c:if>
	        
        <c:forEach var ="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}">
        	<c:if test="${pageDTO.currentPage == i}">
	        <li class="page-item"><a class="page-link" href="/pet/review/contentsreview.do?pageNum=${i}&searchType=${searchType}&hospital_no=${hospitalDTO.no}" class="active">${i}</a>
			</c:if>
			<c:if test="${pageDTO.currentPage != i}">
	       <li class="page-item"><a class="page-link" href="/pet/review/contentsreview.do?pageNum=${i}&searchType=${searchType}&hospital_no=${hospitalDTO.no}">${i}</a>
	        </c:if>
		</c:forEach>
	        
        <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	        <li class="page-item"><a class="page-link" href="/pet/review/contentsreview.do?pageNum=${pageDTO.startPage + 10}&searchType=${searchType}&hospital_no=${hospitalDTO.no}">&raquo;</a>
        </c:if>
  </ul>
	</nav> 
</c:if>
</div>
</div>
</body>
</html>