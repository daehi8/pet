<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../nav2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hospitalUpdate</title>
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
	<form action="hospitalUpdatePro.do" method="post" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<td> 병원 이름 </td>
				<td>${hospitalDB.name}</td>
			</tr>
			<tr>
				<td> 병원 이력 </td>
				<td> 
					<textarea name="hospital_contents" rows="3" cols="50" >${hospital.hospital_contents}</textarea>
				</td>
			</tr>
			<tr>
				<td> 영업시간 </td>
				<td> 
					<textarea name="hospital_hours" rows="3" cols="50">${hospital.hospital_hours}</textarea>
				</td>
			</tr>
			<tr>
				<td> 홈페이지 </td>
				<td>
					<textarea name="homepage" rows="3" cols="50">${hospital.homepage}</textarea>
				</td>
			</tr>
			<tr>
				<td> 전화번호 </td>
				<td> 
					<textarea name="hospital_call" rows="3" cols="50">${hospital.hospital_call}</textarea>
				</td>
			</tr>
			<tr>
				<td> 병원사진 </td>
				<td>
					<c:if test ="${hospital.hospital_pic_save == null }">
						<input type="file" name="hospital_org" />
					</c:if>
					<c:if test="${hospital.hospital_pic_save != null }">
						<img src="/pet/save/${hospital.hospital_pic_save}" /> <br>
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
</body>
</html>