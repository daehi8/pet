<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../nav2.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 for doctors | 계정설정</title>
</head>
<body>	
	<c:if test="${sessionScope.doctorMail == null }">
		<script>
			alert("로그인 해주세요.");
			window.location="/pet/doctor/main.do";
		</script>
	</c:if>
	<c:if test="${sessionScope.doctorMail != null }">
		<div style="margin-top: 35px;text-align: center">
		<div class="p-4" style="width: 1000px; display: inline-block;">
		
	  	<h2 style="text-align:left; margin-bottom: 40px;"><strong>나의 회원정보</strong></h2>
		<nav>
	   	<ul class="nav nav-pills nav-fill">
	  		<li class="nav-item" >
	    <a class="nav-link active btn btn-outline-dark" href="modify.do">프로필</a>
	  	</li>
	  	<li class="nav-item" >
	    	<a class="nav-link btn btn-outline-dark" href="hospitalInfo.do">병원정보</a>
	  	</li> 	
	  	<li class="nav-item">
	    	<a class="nav-link btn btn-outline-dark" href="pwUpdate.do">비밀번호 변경</a>
	  	</li>
	  	<li class="nav-item">
	    	<a class="nav-link btn btn-outline-dark" href="deleteForm.do">회원탈퇴</a>
	  	</li>
	 	</ul>
		</nav>
		<br>
		<c:if test="${doctor == null}">
			<c:redirect url="main.do"></c:redirect>
		</c:if>
		<c:if test="${doctor !=null }">
			<table class="table" style="text-align: center">
			
				<tr>
				<th style="width:25%;">이름</th>
				<td style="text-align: center; width:40%;">${doctor.doc_name }</td>
				<tr>
				<th>사진</th>
					<td style="text-align: center">
						<c:if test ="${doctor.doc_save == null }">
							<img src="/pet/resources/img/saram.jpg" width=400px, height=400px/> <br>
						</c:if>
						<c:if test="${doctor.doc_save != null }">
							<img src="/pet/save/${doctor.doc_save}" width=400px, height=400px /> <br>
						</c:if>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td> ${doctor.doc_mail}</td>
				</tr>	
				<tr>
					<th>정보공개동의</th>
					<td> ${docAgree}</td>
				</tr>
			</table>
				<br>
				<input class="btn btn-dark p-2 w-50" type="button" value="수정하기" onclick="window.location='modifyUpdate.do'" /> 
			<br>
		</c:if>
		</div>
		</div>
	</c:if>
</body>

</html>