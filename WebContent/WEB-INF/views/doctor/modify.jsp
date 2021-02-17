<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../nav2.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
</head>
<body>	
	<div style="margin-top: 40px;text-align: center">
	<div class="p-4" style="width: 1000px; display: inline-block;">
	
	<h2 style="text-align:left">나의 회원정보</h2>
	<br>
	
	<nav>
   	<ul class="nav nav-pills nav-fill">
  		<li class="nav-item" >
    <a class="nav-link active btn btn-outline-dark" href="javascript:return false;">프로필</a>
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
	<br>
	
	<c:if test="${doctor == null}">
		<c:redirect url="main.do"></c:redirect>
	</c:if>
	<c:if test="${doctor !=null }">
		<table class="table">
			<tr >
				<td rowspan="2" align="center">
					<c:if test ="${doctor.doc_save == null }">
						<img src="/pet/save/saram.jpg" width=400px, height=400px/> <br>
					</c:if>
					<c:if test="${doctor.doc_save != null }">
						<img src="/pet/save/${doctor.doc_save}" width=400px, height=400px /> <br>
					</c:if>
				</td>
			</tr>
			<tr>
				<td width="300" rowspan="1"> 의사이름 : ${doctor.doc_name } </td>
			</tr>
			<tr>
				<td width="200" align="center">이메일</td>
				<td> ${doctor.doc_mail}</td>
			</tr>	
			<tr>
				<td width="200" align="center">정보공개동의</td>
				<td> ${docAgree}</td>
			</tr>
		</table>
			<input class="btn btn-dark p-2 w-50" type="button" value="수정하기" onclick="window.location='modifyUpdate.do'" /> 
		<br><br><br>
	</c:if>
</div>
</div>
</body>

</html>