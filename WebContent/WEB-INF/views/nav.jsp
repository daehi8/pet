<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta 
    	name="viewport" 
    	content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <!-- Bootstrap CSS -->
    <link 
     	rel="stylesheet" 
     	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
     	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
     	crossorigin="anonymous"
    />
  </head>
  
  <body>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script 
    	src="https://code.jquery.com/jquery-3.4.1.slim.min.js" 
    	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" 
    	crossorigin="anonymous"
    ></script>
    <script 
    	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
    	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" 
    	crossorigin="anonymous"
    ></script>
    <script 
    	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
    	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" 
    	crossorigin="anonymous"
    ></script>
    
	<!-- 네비게이션 바 -->
 	
	
<nav class="navbar navbar-expand sticky-top navbar-dark bg-dark">
    <div style="width: 1000px;" class="d-flex mx-auto">
		 <li class="nav-item d-flex align-items-center">
  	    <a class="navbar-brand text-white mr-3" href="/pet/sc.do"> 펫츠리뷰 </a></li>
 
	        <div class="w-100 align-item-center">
	
    <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
                <li class="nav-item d-flex align-items-center">
        <a class="nav-link d-flex align-items-center" href="/pet/doctor/main.do">의사회원</a>
      </li>
      </ul>
            
     	<ul class="navbar-nav ml-auto d-flex align-items-center">
     	
        <li class="nav-link">
        <a class="nav-link" href="/pet/sc.do">병원찾기</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/pet/review/insertreview.do">리뷰쓰기</a>
      </li>
      <li class="nav-item dropdown">
        <a href="#" 
        	class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" 
        	role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         	건강정보</a>
    <div class="dropdown-menu">
    
      <a class="dropdown-item" href="/pet/info/info.do">건강정보</a>
    
      <a class="dropdown-item" href="/pet/dict/dict.do">먹이사전</a>
    
      <a class="dropdown-item" href="/pet/check/checklist.do">체크리스트</a>
      
      <a class="dropdown-item" href="/pet/board/list.do">정보 게시판</a>
      
      <a class="dropdown-item" href="/pet/boardfree/list.do">자유 게시판</a>
    </div>
      </li>
            <c:if test="${member.approval_status == 2}" >
            <li class="nav-item">
        <a class="nav-link" href="/pet/admin/adminmain.do">관리자 모드</a>
      </li>
      </c:if>
      <c:if test="${member == null}">
       <li class="nav-item">
        <a class="nav-link" href="/pet/member/register.do">회원가입</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/pet/member/login.do">로그인</a>
      </li>
      </c:if>
      
      <c:if test="${member != null}">
      <li class="nav-item dropdown">
        <a href="#" 
        	class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" 
        	role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         ${member.pen_name}
        </a>
    <div class="dropdown-menu">
    
      <a class="dropdown-item" href="/pet/member/about_me.do">나의 활동</a>
    
      <a class="dropdown-item" href="/pet/member/member_info.do">계정설정</a>
    
      <a class="dropdown-item" href="/pet/member/logout.do">로그아웃</a>
    </div>
    </li>
     </c:if>
    </ul>
  </div>
  </div>
  </div>
</nav>