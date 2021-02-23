<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/nav.jsp" %>
 <head>
  <!-- 제이쿼리 -->
 <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
 <title>펫츠리뷰 | 관리자 | 사전삭제</title>
 </head>
<body>
	<div style="margin-top: 35px;text-align: center">
	<div class="p-4" style="width: 1000px; display: inline-block;">
	
		<nav>
	   	<ul class="nav nav-pills nav-fill">
	  		<li class="nav-item" >
	    <a class="nav-link active btn btn-outline-dark" href="/pet/admin/admindict.do">사전관리</a>
	  	</li>
	  	<li class="nav-item" >
	    	<a class="nav-link btn btn-outline-dark" href="/pet/admin/admincheck.do">체크리스트</a>
	  	</li> 	
	  	<li class="nav-item">
	    	<a class="nav-link btn btn-outline-dark" href="/pet/admin/adminboard.do	">게시판관리</a>
	  	</li>  	
	   	<li class="nav-item">
	    	<a class="nav-link btn btn-outline-dark" href="/pet/admin/adminmain.do">뒤로</a>
	  	</li>
	 	</ul>
		</nav>
<br>
<br>

	<p>삭제 하시겠습니까?</p>
	<form name="DeleteForm" role="form" method="post">
    <button class="btn btn-dark" type="submit">예, 삭제합니다.</button>
    <button class="btn btn-light" id="cancel_btn">아니오, 삭제하지 않습니다.</button>
    
    
    <script>

    // 폼을 변수에 저장
    var formObj = $("form[role='form']"); 
    
    // 취소 버튼 클릭
    $("#cancel_btn").click(function(){   
     formObj.attr("action", "admindict.do."());
     formObj.attr("method", "get");  
     formObj.submit();     
     
    });
    </script>

</form>
 </div>
 </div>
 </body>
