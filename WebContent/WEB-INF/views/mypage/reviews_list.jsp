<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../nav.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 리스트 페이지 입니다</title>
</head>
<body>
<div style="margin-top: 40px;text-align: center">
	<div class="p-5" style="width: 1000px; display: inline-block;">
	
<h1>리뷰 목록</h1>
	
	<c:if test="${member !=null }">닉네임= ${member.pen_name}님이 작성한 리뷰<br />
		
                <div class="panel-heading">공지사항 </div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>병원이름</th>
                                <th>작성자</th>
                                <th>재방문여부</th>
                                <th>작성내용공개여부</th>
                                <th>인증 확인여부</th>
                                <th>리뷰작성시간</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="list">
                            <tr>
                            	<td>${list.member_email}</td>
                                <td>${list.hospital_name}</td>
                                <td>${list.doc_name}</td>
                                <td>${list.revisit}</td>
                                <td>${list.public_check}</td>
                                <td>${list.auth_check}</td>
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