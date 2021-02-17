<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../nav2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hospitalInfo</title>
</head>
<body>	
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
	<br>
	<c:if test="${doctor == null}">
		<c:redirect url="main.do"></c:redirect>
	</c:if>
	<c:if test="${doctor !=null }">
				<table class="table">
			<tr>
				<td width="150"> 병원이름 </td>
				<td width="200"> ${hospitalDB.name} </td>
			</tr>
			<tr>
				<td> 병원주소 </td>
				<td> ${hospitalDB.road_adr } </td>
			</tr>
			<tr>
				<td> 병원번호 </td>
				<td> ${hospitalDB.no } </td>
			</tr>
			<tr>
				<td> 이력 </td>
				<td> ${hospital.hospital_contents} </td>
			</tr>
			<tr>
				<td> 영업시간 </td>
				<td> ${hospital.hospital_hours} </td>
			</tr>
			<tr>
				<td> 전화번호 </td>
				<td> ${hospital.hospital_call} </td>
			</tr>
			<tr>
				<td> 병원사진 </td>
				<td>
					<c:if test ="${hospital.hospital_pic_save == null }">
					</c:if>
					<c:if test="${hospital.hospital_pic_save != null }">
						<img src="/pet/save/${hospital.hospital_pic_save}" /> <br>
					</c:if> 
				</td>
			</tr>
		</table>
		<input class="btn btn-dark p-2 w-50" type="button" value="수정하기" onclick="window.location='hospitalUpdate.do'" />
		<br><br><br>
	</c:if>
</div>
</div>

</body>
</html>