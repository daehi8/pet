<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 | 리뷰보기</title>
</head>
<body>

<div style="margin-top: 35px;text-align: center">
	<div class="p-4" style="width: 1000px; display: inline-block;">
	
	
	<c:if test="${member == null }">
		<c:redirect url="/member/login.do"></c:redirect>
	</c:if>
	<c:if test="${member !=null }">

   	<h2 style="text-align:left; margin-bottom: 30px;"><strong>리뷰 보기</strong></h2>
	<h4 style="text-align:left;  margin-bottom: 20px;"><span class="badge badge-light">${member.pen_name} 님의 ${rating.review_no} 리뷰</span></h4>


				<div class="card">
  				<div class="card-body">
                <div class="panel-heading"> </div>
                <div class="panel-body">
                    <table class="table table-hover" style="text-align:center;">
                        <thead>
                            <tr>
                                	<th style="width:20%">치료가격 및 정보</th>
                               		<th style="width:25%">별점</th>
                                	<th style="width:55%">리뷰</th>
                            </tr>
                        </thead>
                        <tbody>  	
                        		<tr>
									<td style="text-align:center;">
                                 <c:forEach items="${price}" var="p">
	                                <span class="badge badge-primary">${p.subject_info}</span>	
	                                ${p.price_info}원<br>
                                 </c:forEach>                    
                                	<td style="text-align:left;"> <span class="badge badge-light">친절함</span> ${rating.kind}점<br>
                                	<span class="badge badge-light">대기시간</span> ${rating.waiting}점<br>
                                	<span class="badge badge-light">청결함</span> ${rating.clean}점<br>
                                	<span class="badge badge-light">진료 설명 </span> ${rating.detail}점<br>
                                	<span class="badge badge-light">가격</span> ${rating.price}점<br>
                                	<span class="badge badge-light">치료 후 결과</span> ${rating.after}점<br>	
                                	<span class="badge badge-light">평균 평점</span> ${rating.mean}점</td>
     							<c:forEach items="${comment}" var="c">
                                  <td style="text-align:left;"> 
                                 <span class="badge badge-dark">의사리뷰 </span><br> ${c.docter_review}<br><br>
                                 <span class="badge badge-dark">병원리뷰</span><br> ${c.hospital_review}<br><br>
                                 <span class="badge badge-dark">한줄평</span><br> ${c.summary}<br>
                                  </td>
                                 </c:forEach>
                        </tbody>
                    </table>
                    </div>
                    </div>
                </div>
	</c:if>
	</div>
	</div>

</body>
</html>