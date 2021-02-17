<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 리스트 페이지 입니다</title>
</head>
<body>
<h1>리뷰 목록</h1>
	
	<c:if test="${member !=null }">${member.pen_name} 님이 작성한 리뷰<br />
		
                <div class="panel-heading"> </div>
                <div class="panel-body">
                    <table class="table table-hover" border="1">
                        <thead>
                            <tr>
                                	<td>no</td>
                                	<td>진료과목</td>
                                	<td>진료비</td>
                                	<td>no</td>
                                	<td>친절</td>
                                	<td>대기시간</td>
                                	<td>청결</td>
                                	<td>자세한 설명</td>
                                	<td>가격</td>
                                	<td>치료후 결과</td>
                                	<td>평균 평점</td>
                                	<td>리뷰작성시간</td>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="list">
                            <tr>
                            	<td onclick="location.href='/pet/member/openReviews.do?no=${list.no}'"> </td>
                            	<td>NO ${list.no}</td>
                            	 </c:forEach>
                            	
                                 <c:forEach items="${price}" var="p">
	                                <td>${p.subject_info}</td>
	                                 <td>${p.price_info}</td>
                                 </c:forEach>
                                 
                             
                                 <c:forEach items="${rating}" var="r">
                                	<td>${r.review_no}</td>
                                	<td>${r.kind}</td>
                                	<td>${r.waiting}</td>
                                	<td>${r.clean}</td>
                                	<td>${r.detail} 설명</td>
                                	<td>${r.price}</td>
                                	<td>${r.after} 결과</td>
                                	<td>${r.mean} 평점</td>
                                </c:forEach>
                                	 <c:forEach items="${list}" var="list">
                                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${list.reg_date}" /></td>
                               </c:forEach>
                            </tr>
                        </tbody>
                    </table>
                </div>
	</c:if>
</body>
</html>