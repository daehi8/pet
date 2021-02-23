<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 | 리뷰목록</title>
</head>
<body>

<div style="margin-top: 35px;text-align: center">
	<div class="p-4" style="width: 1000px; display: inline-block;">
	
	
	<c:if test="${member == null }">
		<c:redirect url="/member/login.do"></c:redirect>
	</c:if>

	<c:if test="${member !=null }">
		<h2 style="text-align:left; margin-bottom: 30px;"><strong>리뷰 목록</strong></h2>
		<h4 style="text-align:left;  margin-bottom: 20px;"><span class="badge badge-light">${member.pen_name} 님의 리뷰목록</span></h4>
				
		                <div class="panel-heading"> </div>
		                <div class="panel-body">
		                    <table class="table table-hover" style="text-align: center;">
		                        <thead>
		                            <tr>
		                                <th>No</th>
		                                <th>병원이름</th>
		                                <th>의사이름</th>
		                                <th>리뷰작성시간</th>
		                            </tr>
		                        </thead>
		                        <tbody>
		                        <c:forEach items="${list}" var="list">
		                            <tr>
		                            	<td onclick="location.href='/pet/member/openReviews.do?no=${list.no}'"> ${list.no}</td>
		                                <td>${list.hospital_no}</td>
		                                <td>${list.doc_mail}</td>
		                                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${list.reg_date}" /></td>
		                               
		                            </tr>
		                        </c:forEach>
		                        </tbody>
		                    </table>
		                </div>
		</c:if>
		</div>
		</div>
</body>
</html>