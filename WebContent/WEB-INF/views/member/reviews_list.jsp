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
</body>
</html>