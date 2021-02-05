<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
function categorySearchType(){
	var searchType = $("#searchType").val();
	var hospital_name = "테스트병원";
	location.href="contentsreview.do?hospital_name="+hospital_name+"&searchType="+searchType+"";
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

<div>
	<img alt="병원사진" src="/pet/save/${docMyHospitalDTO.hospital_pic_org}">
</div>

<div>
	병원 이름 : ${docMyHospitalDTO.hospital_name}
	병원 주소 : ${docMyHospitalDTO.hospital_adr}
	병원 홈페이지 : ${docMyHospitalDTO.homepage}
</div>

<div>
	<img alt="의사 사진" src="/pete/save/${docPictureDTO.org_pic}">
	의사 이름 : ${docInfoDTO.doc_name}
</div>

<div>
	병원 영업시간 : ${docMyHospitalDTO.hospital_hours}
	병원 이력 : ${docMyHospitalDTO.hospital_contents}
</div>

<div>
	<p>리뷰 개수 : ${count}</p>
	<p>리뷰평점 평균 : ${meanRatingResult}
	<div class="ratefill" style="width: 300px;"></div>
	</p>
	<p>
		재방문 추천 : ${recomCount}
		재방문 비추천 : ${notRecomCount}
	</p>
	<p>
		청결 : ${meanCleanRating}
		가격 : ${meanPriceRating}
		친절 : ${meanKindRating}
		대기시간 : ${meanWaitingRating}
		설명 : ${meanDetailRating}
		결과 : ${meanAfterRating}
	</p>
</div>
<div>키워드검색</div>

<div>
<select name="searchType" id="searchType" onchange="categorySearchType()">
	<option>--</option>
	<option value="regOrder">최신순</option>
	<option value="ratingOrder">평점높은순</option>
	<option value="likeOrder">좋아요</option>
</select>
</div>
<c:forEach var="reviewList" items="${reviewList}" varStatus="status">
	<div id="reviewList">
		<div>
			<div><h4>회원정보 : ${reviewList.member_email}</h4></div>
			<div>
				<div>별점 평균 : ${ratingList[status.index].mean}</div>
				<div>재방문 추천 : ${reviewList.revisit}</div>
			</div>
			<div>
				<p>별점</p>
				친절 : ${ratingList[status.index].kind}
				대기시간 : ${ratingList[status.index].waiting}
				청결 : ${ratingList[status.index].clean}
				설명 : ${ratingList[status.index].detail}
				가격 : ${ratingList[status.index].price}
				결과 : ${ratingList[status.index].after}
			</div>
		</div>
		<div>
			<div>등록일 : ${reviewList.reg_date}</div>
			<div>한줄평 : ${commentList[status.index].summary}</div>
			<div>
				의사 리뷰 : ${commentList[status.index].docter_review}
				병원 리뷰 : ${commentList[status.index].hospital_review}
			</div>
			<div>
				<p>가격정보</p>
				<c:forEach var="priceMap" items="${priceMap[status.index]}">
					진료과목 : ${priceMap.subject_info}
					가격  : ${priceMap.price_info}
					<br>
				</c:forEach>
			</div>
			<div>
				<a href="/pet/review/likereview.do?review_no=${reviewList.no}&target_email=${reviewList.member_email}&member_email=test&hospital_name=${docMyHospitalDTO.hospital_name}">추천</a>
				추천 : ${likeCount}
			</div>
		</div>
	</div>
</c:forEach>

<div class="center">
	<div class="pagination">
	    <c:if test="${pageDTO.startPage > 10}">
	        <a href="/pet/review/contentsreview.do?pageNum=${pageDTO.startPage - 10}&searchType=${searchType}&hospital_name=테스트병원">&laquo;</a>
	    </c:if>
	        
        <c:forEach var ="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}">
        	<c:if test="${pageDTO.currentPage == i}">
	        	<a href="/pet/review/contentsreview.do?pageNum=${i}&searchType=${searchType}&hospital_name=테스트병원" class="active">${i}</a>
			</c:if>
			<c:if test="${pageDTO.currentPage != i}">
	        	<a href="/pet/review/contentsreview.do?pageNum=${i}&searchType=${searchType}&hospital_name=테스트병원">${i}</a>
	        </c:if>
		</c:forEach>
	        
        <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	        <a href="/pet/review/contentsreview.do?pageNum=${pageDTO.startPage + 10}&searchType=${searchType}&hospital_name=테스트병원">&raquo;</a>
        </c:if>
	</div>
</div>
</body>
</html>