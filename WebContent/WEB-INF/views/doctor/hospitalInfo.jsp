<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<c:if test="${sessionScope.doctorMail != null }"> <br />
	
		<div style="margin-top: 15px;text-align: center">
		<div class="p-4" style="width: 1000px; display: inline-block;">
		
	  	<h2 style="text-align:left; margin-bottom: 40px;"><strong>나의 회원정보</strong></h2>
			
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
			<c:if test="${doctor == null}">
				<c:redirect url="main.do"></c:redirect>
			</c:if>
			<c:if test="${doctor !=null }">
				<table class="table" style="text-align: center">
					<tr>
						<th style="width:20%;"> 병원이름 </th>
						<td style="width:50%; text-align:left"> ${hospitalDB.name} </td>
					</tr>
					<tr>
						<th> 병원주소 </th>
						<td style="text-align:left"> ${hospitalDB.road_adr } </td>
					</tr>
					<tr>
						<th> 병원번호 </th>
						<td style="text-align:left"> ${hospitalDB.no } </td>
					</tr>
					<tr>
						<th> 이력 </th>
						<td style="text-align:left"> ${hospital.hospital_contents} </td>
					</tr>
					<tr>
						<th> 영업시간 </th>
						<td style="text-align:left"> ${hospital.hospital_hours} </td>
					</tr>
					<tr>
						<th> 홈페이지 </th>
						<td style="text-align:left"> ${hospital.homepage} </td>
					</tr>
					<tr>
						<th> 전화번호 </th>
						<td style="text-align:left"> ${hospital.hospital_call} </td>
					</tr>
					<tr>
						<th> 병원사진 </th>
						<td style="text-align:left">
							<c:if test ="${hospital.hospital_pic_save == null }">
							</c:if>
							<c:if test="${hospital.hospital_pic_save != null }">
								<img src="/pet/save/${hospital.hospital_pic_save}" width=400px, height=400px/> <br>
							</c:if> 
						</td>
					</tr>
				</table>
				<input class="btn btn-dark p-2 w-50" type="button" value="수정하기" onclick="window.location='hospitalUpdate.do'" />
				<br><br><br>
			</c:if>
		</div>
		</div>
	</c:if>
</body>
</html>