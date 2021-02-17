<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../nav.jsp" %>
<head>
	<script>
	$(function(){
	$('#searchBtn').click(function() {
	self.location = "dict.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" 
							+ $("select option:selected").val() + "&keyword=" 
							+ encodeURIComponent($('#keywordInput').val());});});   
	</script>
</head>

	<div style="margin-top: 40px;text-align: center">
	<div class="p-4" style="width: 1000x; display: inline-block;">
	
	<!-- Radio -->
	<div onchange="Change()">
	<input type="radio"  name="serviceType" value="d"/> <img src="https://nhim.splf.in/FtrCrsDogtoy_Remake_0_0.png">
    <input type="radio"  name="serviceType" value="c" > <img src="https://g.img.appa.pe/i/gp/com-game-kkiruk-myadorablecats">
    <input type="radio"  name="serviceType" value="b"> <img src="https://img.icons8.com/cotton/2x/twitter.png">
    <input type="radio"  name="serviceType" value="r"> <img src="https://image.flaticon.com/icons/png/128/47/47371.png">
    <input type="radio"  name="serviceType" value="e"> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/DBeaver_logo.svg/256px-DBeaver_logo.svg.png">
    </div>
    <br>
	<!-- 검색 -->
	<select name="searchType" id = "id-lang" onchange="categoryChange()">
	<option value="all" <c:out value="${scri.searchType eq 'all' ? 'selected' : ''}"/>>전체</option>
	<option value="d" <c:out value="${scri.searchType eq 'd' ? 'selected' : ''}"/>>강아지</option>
	<option value="c" <c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>고양이</option>
	<option value="b" <c:out value="${scri.searchType eq 'b' ? 'selected' : ''}"/>>새</option>
	<option value="r" <c:out value="${scri.searchType eq 'r' ? 'selected' : ''}"/>>파충류</option>
	<option value="e" <c:out value="${scri.searchType eq 'e' ? 'selected' : ''}"/>>특수동물</option>
	</select>
	

<script>
function categoryChange(){
    var langSelect = document.getElementById("id-lang");
     
    // select element에서 선택된 option의 value가 저장된다.
    var selectValue = langSelect.options[langSelect.selectedIndex].value;
 
    // select element에서 선택된 option의 text가 저장된다.
    var selectText = langSelect.options[langSelect.selectedIndex].text;
    
    self.location = "/pet/dict/dict.do?searchType=" + selectValue;
}

</script>

<script>
$("input[name='serviceType']:radio").change(function () {
	var serviceTypeValue = this.value;
    self.location = "/pet/dict/dict.do?searchType=" + serviceTypeValue;
});

</script>




	<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" placeholder="search">
	<button type="button" id="searchBtn">Search</button>

	<section id="container">
	<form role="form" method="get">
	<table class="table">
  	<thead>
    	<tr>
      	<th scope="col" style="text-align: center" >동물</th>
      	<th scope="col" style="text-align: center">음식</th>
      	<th scope="col" style="text-align: center">이유</th>
    	</tr>
  	</thead>
  	<tbody>
  	  <c:choose>
         <c:when test="${fn:length(list) > 0 }">
      	<c:forEach items="${list}" var="dto">
    	<tr>
      	<th scope="row">${dto.animal_name}</th>
      	<td>${dto.animal_feed}</td>
      	<td>${dto.animal_reason}</td>
      	 </c:forEach>
      	</c:when>
          <c:otherwise>
      		<tr>
            <td>조회된 결과가 없습니다.</td>
              </tr>
                      </c:otherwise>
                      </c:choose>
  	</tbody>
	</table>
 	

	<!-- 페이징 -->
  <ul class="pagination">
	<c:if test="${pageMaker.prev }">
	<li><a href='<c:url value="dict.do${pageMaker.makeSearch(pageMaker.startPage-1) }"/>'>이전</a></li>
	</c:if>

	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
		<li <c:out value="${pageMaker.cri.page == pageNum ? 'class=active' : ''}"/>>
		<a href='<c:url value="dict.do${pageMaker.makeSearch(pageNum) }"/>'>${pageNum }</a></li>
	</c:forEach>

	<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
	<li><a href='<c:url value="dict.do${pageMaker.makeSearch(pageMaker.endPage+1) }"/>'>다음</a></li>
	</c:if>
  </ul>
	</form>
</section>
</div>
</div>