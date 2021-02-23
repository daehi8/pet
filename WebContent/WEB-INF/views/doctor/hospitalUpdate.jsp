<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../nav2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 for doctors | 병원정보 수정</title>
</head>
<body>
	<c:if test="${sessionScope.doctorMail == null }">
		<script>
			alert("로그인 해주세요.");
			window.location="/pet/doctor/main.do";
		</script>
	</c:if>
	<c:if test="${sessionScope.doctorMail != null }">
		<div style="margin-top: 40px;text-align: center">
		<div class="p-4" style="width: 1000px; display: inline-block;">
		
		<h2 style="text-align:left">나의 회원정보</h2>
		<br>
		
		<nav>
		   	<ul class="nav nav-pills nav-fill">
		  		<li class="nav-item" >
		    <a class="nav-link btn btn-outline-dark" href="modify.do">프로필</a>
		  	</li>
		  	<li class="nav-item" >
		    	<a class="nav-link active btn btn-outline-dark" href="hospitalInfo.do">병원정보</a>
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
		<form action="hospitalUpdatePro.do" method="post" enctype="multipart/form-data">
			<table class="table" style="text-align:center">
				<tr>
					<th style="width:20%;"> 병원 이름 </th>
					<td style="width:50%;"><h4><span class="badge badge badge-light">${hospitalDB.name}</span></h4></td>	
				</tr>
				<tr>
					<th> 병원 이력 </th>
					<td> 
						<textarea name="hospital_contents" rows="3" cols="55" >${hospital.hospital_contents}</textarea>
					</td>
				</tr>
				<tr>
					<th> 영업시간 </th>
					<td> 
						<textarea name="hospital_hours" rows="3" cols="55">${hospital.hospital_hours}</textarea>
					</td>
				</tr>
				<tr>
					<th> 홈페이지 </th>
					<td>
						<textarea name="homepage" rows="3" cols="55">${hospital.homepage}</textarea>
					</td>
				</tr>
				<tr>
					<th> 전화번호 </th>
					<td> 
						<textarea name="hospital_call" rows="3" cols="55">${hospital.hospital_call}</textarea>
					</td>
				</tr>
				<tr>
					<th> 병원사진 </th>
					<td>
						<c:if test ="${hospital.hospital_pic_save == null }">
							<input type="file" name="hospital_org" />
						</c:if>
						<c:if test="${hospital.hospital_pic_save != null }">
							<img src="/pet/save/${hospital.hospital_pic_save}" width=400px, height=400px/> <br>
							<input type="file" name="hospital_org" />
						</c:if> 
				</tr>
				<tr>
					<td colspan="2" align="center"> 
						<input type="hidden" name="doc_mail" value="${hospital.doc_mail}" />
						<input type="hidden" name="add_no" value="${hospital.add_no}" />
						<input class="btn btn-dark" type="submit" value="수정" />
						<input class="btn btn-light" type="reset" value="다시작성" />
					</td>
				</tr>
			</table>
		</form>
		</div>
		</div>
	</c:if>
</body>
</html>