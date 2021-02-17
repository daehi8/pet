<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../nav2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteForm</title>
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
	    	<a class="nav-link btn btn-outline-dark" href="hospitalInfo.do">병원정보</a>
	  	</li> 	
	  	<li class="nav-item">
	    	<a class="nav-link btn btn-outline-dark" href="pwUpdate.do">비밀번호 변경</a>
	  	</li>
	  	<li class="nav-item">
	    	<a class="nav-link active btn btn-outline-dark" href="deleteForm.do">회원탈퇴</a>
  		</li>  	
 		</ul>
	</nav>
	<br>
	<br>
	<form action="/pet/doctor/deletePro.do" method="post" onSubmit="return checkIt()">
		<table class="table">
			  
			<tr height="30">
				<td colspan="2" align="middle">
				<font size="+1" ><b>회원 탈퇴</b></font></td></tr>
			<tr height="30">
				<td width="110" align=center>비밀번호</td>
				<td width="150" align=center>
					<input type=password name="doc_pw"  size="15" maxlength="12">
		</table>
				<input class="btn btn-dark"  type=submit value="회원탈퇴"> 
					<input class="btn btn-light" type="button" value="취  소" onclick="javascript:window.location='/pet/doctor/main.do'">
				
	</form>
</body>
</html>