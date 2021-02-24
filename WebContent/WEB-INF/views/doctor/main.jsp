<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../nav2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 for doctors</title>
</head>
<body>


	<div class="mt-5 pt-5 pb-5" style="margin-top: 20px; text-align: center;">
	<div style="width: 1000px; display: inline-block">
	
<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://i.ibb.co/PCJNGrg/image.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>펫츠리뷰</h5>
        <p>찾아줘! 내 주변 동물병원, 펫츠리뷰</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://i.ibb.co/SQqYnRJ/00.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>펫츠리뷰</h5>
        <p>찾아줘! 내 주변 동물병원, 펫츠리뷰</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://i.ibb.co/rHZCJfK/22324.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>펫츠리뷰</h5>
        <p>찾아줘! 내 주변 동물병원, 펫츠리뷰</p>
      </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
            
	<c:if test="${sessionScope.doctorMail == null }">

                <h1 class="d-flex justify-content-center" style="margin-bottom:3rem; margin-top:4rem; font-size: 3rem; font-weight: bold;">
                    펫츠리뷰의 의사회원이 되어보세요
                </h1>

                <h3 style="color:#5D5D5D">가장 쉽고 빠르게, 환자들과 소통할 수 있습니다.</h3>
				<br>
				<br>
                <button type="button" class="btn btn-dark text-white w-50 p-2" onclick="window.location='/pet/doctor/docMailForm.do'">
                    지금 바로 무료 의사‍회원되기
                </button>

  
	</c:if>
	<c:if test="${sessionScope.doctorMail != null }">
	
   <div style="text-align: center;">
            <div style="width: 960px; display: inline-block">

                <h1 class="d-flex justify-content-center" style="margin-bottom:2rem; margin-top:6rem; font-size: 3rem; font-weight: bold;">
                ${doctor.doc_name}님 안녕하세요?
                </h1>
                </div>
                </div>   
             
	</c:if>
	   </div>
        </div>

	</body>
	</html>
	