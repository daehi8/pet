<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="margin-top: 40px;text-align: center">
	<div class="p-5" style="width: 1000px; display: inline-block;">
	
<c:if test="${member !=null }">
 	<table class="table">
		<tr>
			<td><img src="/pet/save/${member.org_profile}" width=400px, height=400px></td>
			<td style="margin:.5rem"><h1>${member.pen_name}</h1>
					${member.email}
			<input  class="btn btn-dark text-white w-100" type="button" value="프로필 수정" onclick="location.href='/pet/member/member_info.do'">				
			</td>
		<tr>
			</table>
			<input class="btn btn-dark w-100 p-2" type="button" value="나의 리뷰(0개 등록대기중) " onclick="location.href='/pet/member/my_reviews.do'"><br />
		
</c:if>
</div>
</div>
</body>
</html>