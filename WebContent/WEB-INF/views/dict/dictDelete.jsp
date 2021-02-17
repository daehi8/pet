<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <head>
  <!-- 제이쿼리 -->
 <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
 </head>

	
<h1></h1>

<section id="container">
<form name="DeleteForm" role="form" method="post">


   
   <p>정말로 삭제하시겠습니까?</p>
   
   <p>
   
    <button type="submit">예, 삭제합니다.</button><br />
    <button id="cancel_btn">아니오, 삭제하지 않습니다.</button>
    
    
    <script>

    // 폼을 변수에 저장
    var formObj = $("form[role='form']"); 
    
    // 취소 버튼 클릭
    $("#cancel_btn").click(function(){   
     formObj.attr("action", "dictRead?dict_no=" + $("#dict_no").val());
     formObj.attr("method", "get");  
     formObj.submit();     
     
    });
    </script>
   
   </p>
   
  </form>
   
 </section>