<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 | 나의활동</title>
</head>
<body>
	<c:if test="${sessionScope.member == null }"> 
			<script>
				alert("로그인이 필요한 화면입니다.");
			</script>
		<c:redirect url="/member/login.do"></c:redirect>
	</c:if>
<c:if test="${sessionScope.member !=null }">	
	<div style="margin-top: 35px;text-align: center"> 
	<div class="p-5" style="width: 1000px; display: inline-block;"> 
		

				<div style="width:49%; float:left; margin-bottom: 20px;">
					<img src="/pet/resources/img/${member.org_profile}" width=450px, height=450px>
				</div>	
					
				<div style="width:49%; float:right;">
					<div style="text-align:left; margin-left: 30px">
						<h1>${member.pen_name}</h1>
						<div style="margin-bottom: 15px; font-size:20px;"><span class="badge badge-light">${member.email}</span></div>	
						<input class="btn btn-dark w-100 p-2" type="button" value="프로필 수정" onclick="location.href='/pet/member/member_info.do'">		
					</div>
				</div>	
				
		
				<div>
					<input class="btn btn-dark w-100 p-2" type="button" value="나의 리뷰" onclick="location.href='/pet/member/my_reviews.do'">
				</div>	
		
	</div>
	</div>

</c:if>
</body>
</html>