<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 | ${subject_info}의 가격/비용은?</title>

    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // 시각화 API 및 차트 패키지를 로드 합니다.
      google.charts.load('current', {'packages':['corechart']});

      // Google Visualization API가 로드 될 때 실행할 콜백을 설정합니다.
      google.charts.setOnLoadCallback(drawChart); // 라이브러리 Load
      
      // 데이터 테이블을 만들고 채우는 콜백, 차트를 인스턴스화 하고 데이터를 전달하고 그립니다.
      var chart;
      var data;
      function drawChart() {

    	// 차트 데이터
    	data = new google.visualization.arrayToDataTable([
    		['가격대','개수',  ], // 제목 그리고 항목들
    		['1만원', ${num1}, ], // 제목과 항목수를 맞춰주어야 합니다.
    		['5만원',	 ${num2},  ], // 마지막 값들은 라인그래프를 만들때 사용합니다.
    		['10만원', ${num3},  ],
    		['그 이상', ${num4},],
    	]);
     
      // 차트 옵션 설정

      var options = {
                     'width':'100%',
                     'height':700}
      					 ;
  

      //몇 가지 옵션을 전달하여 차트를 인스턴스화하고 그립니다.
      	chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
      	chart.draw(data, options);
      
     	google.visualization.events.addListener(chart, 'select', selectHandler);

	}
   function selectHandler() {
     var selection = chart.getSelection();
     var message = '';
     //alert(selection[0].row+"--"+selection[0].column+"--"+data.getFormattedValue(selection[0].row, selection[0].column));
     
     if(selection[0].row == 0){
    	 $("#col1").css("display","block");
    	 $("#col2").css("display","none");
    	 $("#col3").css("display","none");
    	 $("#col4").css("display","none");
    	 
     }else if(selection[0].row == 1){
    	 $("#col1").css("display","none");
    	 $("#col2").css("display","block");
    	 $("#col3").css("display","none");
    	 $("#col4").css("display","none");	
     }else if(selection[0].row == 2){
    	 $("#col1").css("display","none");
    	 $("#col2").css("display","none");
    	 $("#col3").css("display","block");
    	 $("#col4").css("display","none");	
   	 }else if(selection[0].row == 3){
  	 $("#col1").css("display","none");
  	 $("#col2").css("display","none");
  	 $("#col3").css("display","none");
  	 $("#col4").css("display","block");	
   	 }
   }
    </script>
  	</head>

	<div style="margin-top: 25px; text-align: center">	
	<div class="p-4" style="width: 1000px; display: inline-block;">
			
			<jsp:useBean id="now" class="java.util.Date" />	
			<fmt:formatDate value="${now}" pattern="yyyy" var="year" />
			<fmt:formatDate value="${now}" pattern="yyyy-MM" var="ym" />
		
		
		 	<h2 style="text-align: left; margin-bottom:15px">${subject_info}의 가격/비용은? (<c:out value="${year}"/>)</h2>
		 	<h5 style="text-align: left; margin-bottom:10px">${subject_info}의 가격분포</h5>
			<h5 style="text-align: left; margin-bottom:15px"><span class="badge badge-pill badge-secondary"> # 평균 : ${avg}원</span></h5>
				<ul class="list-group list-group-horizontal">
				  		<li style="display: inline-block;" class="list-group-item">최대 ${max}원</li>
				  		<li style="display: inline-block;" class="list-group-item">평균 ${avg}원</li>
				
				  		<li style="display: inline-block;" class="list-group-item">최소 ${min}원</li>
				</ul>

			<div style="display: block; text-align:cetner;">
			
				<!-- 구글 차트  -->
				<div id="chart_div" style="width:49%; text-align:cetner; vertical-align:middle;  display: inline-block;">
				</div> 
			
			<!-- 그래프를 눌렀을때 -->
				<div style="width:49%; vertical-align:middle;  display: inline-block;">
					
					<div id="col1" style="overflow:scroll; display:none ">
						<c:forEach items="${join1}" var="dto" varStatus="st">
							${dto.price_info}원,  <span class="badge badge-dark">${dto.name}<br></span><br>
						</c:forEach>
					</div>
					
					<div id="col2" style="overflow:scroll; display:none">
						<c:forEach items="${join2}" var="dto" varStatus="st">
							${dto.price_info}원,  <span class="badge badge-dark">${dto.name}<br></span><br>
						</c:forEach>
					</div>
					
					<div id="col3" style="overflow:scroll; display:none">
						<c:forEach items="${join3}" var="dto" varStatus="st">
							${dto.price_info}원,  <span class="badge badge-dark">${dto.name}<br></span><br>
						</c:forEach>
					</div>
					
					<div id="col4" style="overflow:scroll; display:none">
						<c:forEach items="${join4}" var="dto" varStatus="st">
							${dto.price_info}원,  <span class="badge badge-dark">${dto.name}<br></span><br>
						</c:forEach>
					</div>
					
				</div>
			</div>
			
			<div class="card">
				 <div class="card-body">
    		<h6 style="text-align: center;">대한민국의 동물 병원 ${scount}곳을 조사한 결과 (2021년 02월 기준),<br> 검사 가격/비용의 전체 평균 가격은 ${avg}원이었습니다.<br>
				가장 저렴한 곳은 ${min}원이었으며, 가장 비싼 곳은 ${max}원이었습니다.<br> 펫츠리뷰 회원의 리뷰 점수를 바탕으로 하였습니다 🙂</h6>
  			</div>
			</div>
				
	</div>
	</div>
	
