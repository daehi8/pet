<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../nav.jsp" %>
<!doctype html>
<html lang="en">
<head>
<title>펫츠리뷰 | 체크리스트</title>
</head>
<script>
	function frmchk(size){
		
		for(var i = 1 ; i <= size ; i++){
			var ra = $(":radio[name='answer"+i+"']");
			var result = 0;
			for(var j = 0 ; j < ra.length ; j++){
				if($(ra[j]).is(":checked")){
					result++;	
				}
			}
			if(result == 0){
				alert("답변을 체크해 주세요");
				return false;
			}
		}
		
	}
</script>

	<div style="margin-top: 40px;text-align: center">
	<div class="p-4" style="width: 1000x; display: inline-block;">

<form name="fwrite" method="post" action="checkPro.do?check_no=${check_no}" onsubmit="return frmchk('${list.size()}');">
	
<table>
<c:forEach items="${list}" var="dto" varStatus="st">
		<div style="text-align: left">
      <h6 style="text-align: left;  font-weight:bold"> ${st.count}. ${dto.quest_title}</h6><strong></strong>
         <label><input type="radio" class="an" name="answer${st.count}" value="5"> ${dto.quest_ans1}</label>
         <label><input type="radio" class="an"  name="answer${st.count}" value="4"> ${dto.quest_ans2}</label>
         <label><input type="radio" class="an"  name="answer${st.count}" value="3"> ${dto.quest_ans3}</label>
         <label><input type="radio" class="an"  name="answer${st.count}" value="2"> ${dto.quest_ans4}</label>
         <label><input type="radio" class="an"  name="answer${st.count}" value="1"> ${dto.quest_ans5}</label>
         </div>
		<br>
</c:forEach>
</table>

<input class="btn btn-dark" value="목록" onclick="location.href='/pet/check/checklist.do'">
<input class="btn btn-dark" type="submit" value="결과확인 ">
</form>


</div>
</div>