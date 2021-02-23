<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 | 관리자 | 의사회원</title>
</head>
<body>

	<div style="margin-top: 35px; text-align: center;">
	<div class="p-4" style="width: 1000px; display: inline-block;">
	
	<nav>
   		<ul class="nav nav-pills nav-fill">
  			<li class="nav-item" >
    			<a class="nav-link btn btn-outline-dark" href="memberlist.do">일반회원</a>
  			</li>
  			<li class="nav-item" >
    			<a class="nav-link active btn btn-outline-dark" href="/pet/admin/doclist.do">의사회원</a>
  			</li> 	
  			<li class="nav-item">
    			<a class="nav-link btn btn-outline-dark" href="/pet/admin/adminmain.do">뒤로</a>
  			</li>  	
 		</ul>
	</nav>
	<br>
		
		<div>
		<div style="width:49%; float:left; margin-bottom: 10px">
    	<img alt="의사사진" src="/pet/save/${docInfoDTO.doc_save}" width=450px, height=450px>
    	</div>
    		
  
				<div style="width:49%; float:right">
			<table class="table" style="text-align:left">
				<tr>
					<th>메일</th><td>${docInfoDTO.doc_mail}</td>
				<tr>
					<th>비밀번호</th><td>${docInfoDTO.doc_pw}</td>
				</tr>
				<tr>
					<th>이름</th><td>${docInfoDTO.doc_name}</td>
				<tr>
					<th>인증상태 </th><td>${docInfoDTO.authstate}</td>
				</tr>
				<tr>
					<th>승인상태</th><td>${docInfoDTO.doc_state}</td>
				</tr>
				<tr>
				<th>가입 날짜</th><td>${docInfoDTO.reg_date}</td>
				</tr>
				<tr>
					<th style="width:70%">인증파일<br><br><span class="badge badge-light">의사 면허증</span><br>
													<span class="badge badge-light">사업자 등록증</span><br>
													<span class="badge badge-light">의료기관개설신고(허가)증</span><br></th>
					<td><c:forEach var="list" items="${docPicturList}">
					<img alt="인증사진" src="/pet/save/${list.save_pic}" width=300px, height=300px><br>	
					</c:forEach></td>
				</tr>
			</table>
		</div>
		</div>

<input class="btn btn-dark" type="button" value="승인" onclick="window.location='/pet/admin/okdocauthcheck.do?doc_mail=${docInfoDTO.doc_mail}'" />
<input class="btn btn-light" type="button" value="미승인" onclick="window.location='/pet/admin/nodocauthcheck.do?doc_mail=${docInfoDTO.doc_mail}'" />
</div>
</div>
</body>
</html>