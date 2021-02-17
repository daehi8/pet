<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../nav2.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyUpdate</title>
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
	<form action ="modifyUpdatePro.do" method="post" enctype="multipart/form-data">
		<table class="table">
			<tr >
				<td rowspan="2" align="center">
					<c:if test ="${doctor.doc_save == null }">
						<img src="/pet/save/saram.jpg" width=400px, height=400px/> <br>
						<input type="file" name="org" />
					</c:if>
					<c:if test="${doctor.doc_save != null }">
						<img src="/pet/save/${doctor.doc_save}" width=400px, height=400px /> <br>
						<input type="file" name="org" />
					</c:if>
				</td>
			</tr>
			<tr>
				<td width="300" rowspan="1"> 의사이름 : 
					<c:if test ="${doctor.doc_name == null}" >
						<input type="text" name="doc_name" />
					</c:if>
					<c:if test="${doctor.doc_name != null}" >
						<input type="text" name="doc_name" value="${doctor.doc_name}"/>
					</c:if>
				</td>
			</tr>
			<tr>
				<td width="200" align="center">이메일</td>
				<td> ${doctor.doc_mail}
					<input type="hidden" name="doc_mail" value="${doctor.doc_mail}" />
					<input type="hidden" name="doc_no" value="${doctor.doc_no}" />
				</td>
			</tr>
			<tr>
				<td width="200" align="center">정보 공개 동의</td>
				<td> ${docAgree}</td>
			</tr>
			<c:if test="${doctor.agree == 0 }">
				<tr>
					<td width="200" align="center">정보 공개 동의서</td>
					<td>
						<a href="/pet/doctor/down.do">동의서 다운 </a> <br>
						<input type="file" name="agreement" />
					</td>
				</tr>
			</c:if>
		</table>
		<input class="btn btn-dark p-2 w-50" type="submit" value="수정하기"/> 	
	</form>
	</div>
	</div>
</body>
</html>