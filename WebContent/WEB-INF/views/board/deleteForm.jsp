<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>펫츠리뷰 | 정보게시판</title>
    <script>
    	del = confirm('삭제 하시겠습니까?');
    	if(del){
    		window.location='/pet/board/deletePro.do?num=${num}';
    	}else{
    		history.go(-1);
    	}
    </script>