<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../nav.jsp" %>
<title>펫츠리뷰 | ${search} 검색</title>


<div style="text-align: center; margin-top: 40px">
    <div style="width: 1000px; display: inline-block">
	
<form style="text-align: left"action="test.do">
	<input id=text type="text" class='input_text' name="search"/>
	<input type="submit" value="검색"/>
</form>				

		<div style="overflow:scroll;width:60%; height:900px; float:left;">
		<c:forEach items="${cityList}" var="city">		
			<input style="margin-bottom: 5px; margin-left: -5px;" class="btn btn-outline-dark" type ="button" value="${city.district}" onclick="window.location='test.do?search='+encodeURI('${city.district}','UTF-8')"/>
		</c:forEach>
			<c:if test="${count == 0}">
		<table class="table">
		  <tr>
		    <td align="center">
		      검색결과가 없습니다.<br>다시 검색해주시겠어요?
		    </td>
		  </tr>
		</table>
		</c:if>
		<c:if test="${count > 0}">
		<h6 style="text-align: left"><b>'${search}' 검색결과 ${count}개</b></h6>			
		<c:forEach items="${HospitalList}" var="dto3">	
			<ul class="list-group list-group-flush">
  			<li class="list-group-item ">
  			 <div class="col-8 p-0 text-left">
			<div style="font-size:14px; font-weight: 200;">
  			<span class="badge badge-light"><c:out value="${number}"/></span>
				  <c:set var="number" value="${number - 1}"/>
			</div>
			<div style="font-size: 1.313rem; font-weight:bold" class="d-flex justify-content-start align-items-start">	
	         	<a href="/pet/review/contentsreview.do?hospital_no=${dto3.no}">${dto3.name}</a>
     		</div>
     		<div style="font-size:15px;font-weight: 300;">
     			${dto3.location_adr}<br>
     			${dto3.road_adr}<br>
     			<input class="btn btn-light" type="button" value="위치 확인하기" onclick="aaa('${dto3.road_adr}','${dto3.name}')" />
        	</div>
        	</div>         		
			</li>	
			</ul>
			</c:forEach>		
					</c:if>

			<c:if test="${count > 0}">
		 		<c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
				<c:set var="pageBlock" value="${10}"/>
				<fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
				<c:set var="startPage" value="${result * 10 + 1}" />
				<c:set var="endPage" value="${startPage + pageBlock-1}"/>
				<c:if test="${endPage > pageCount}">
					<c:set var="endPage" value="${pageCount}"/>
				</c:if> 
		          
				<c:if test="${startPage > 10}">
					<a href="#" onclick="pageNum('${startPage - 10 }','${search}')">[이전]</a>
				</c:if>
		
		   		<c:forEach var="i" begin="${startPage}" end="${endPage}">
		       		<a href="#" onclick="pageNum('${i}','${search}')">[${i}]</a>
		   		</c:forEach>
		
		   		<c:if test="${endPage < pageCount}">
		        	<a href="#" onclick="pageNum('${startPage + 10 }','${search}')">[다음]</a>
		   		</c:if>
			</c:if>

		
	</div>
	        

<div id="map" style="width:40%; height:900px; float:left;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d24d618b0b4275936a4347b79f44a5c1&libraries=services"></script>
<script>
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		   mapOption = { 
		       center: new kakao.maps.LatLng(37.56684, 126.97859), // 지도의 중심좌표
		       level: 3 // 지도의 확대 레벨
		   };
		
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	var geocoder = new kakao.maps.services.Geocoder();		
/* 		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(); 
		
		ps.keywordSearch('${search}', placesSearchCB); 
	
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new kakao.maps.LatLngBounds();
		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }       
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    } 
		} */

		// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place, name) {
	    
	    // 마커를 생성하고 지도에 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x) 
	    });

	    // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        if(name == null){
	        	infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	        }else{
	        	infowindow.setContent('<div style="padding:5px;font-size:12px;">' + name + '</div>');
	        }
	        
	        infowindow.open(map, marker);
	    });
	}
		
		
		
	
	// 주소로 좌표를 검색합니다		
	function aaa(ss , name){
		geocoder.addressSearch(ss, function(result, status) {
			console.log(result[0]);
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var bounds = new kakao.maps.LatLngBounds();


		        displayMarker(result[0] , name);    
		        bounds.extend(new kakao.maps.LatLng(result[0].y, result[0].x));


		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		        // 결과값으로 받은 위치를 마커로 표시합니다


		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});   
	}
		
	function kkk(ss , name){
		geocoder.addressSearch(ss, function(result, status) {
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var bounds = new kakao.maps.LatLngBounds();


		        displayMarker(result[0] , name);    
		        bounds.extend(new kakao.maps.LatLng(result[0].y, result[0].x));


		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		     	map.setBounds(bounds);
		        // 결과값으로 받은 위치를 마커로 표시합니다
		     	map.setLevel(6);
		        //맵 줌 값 설정
		    } 
		});   
	}
</script>	

<c:forEach items="${HospitalList}" var="dto3">
	<script>
		kkk('${dto3.road_adr}','${dto3.name}');
		//주소 및 병원이름 호출
	</script>
</c:forEach>

<!-- JAVASCRIPT -->
<script type="text/javascript">
	function pageNum(pageNum , search){
		window.location="/pet/test.do?pageNum="+pageNum+"&search="+encodeURI(search,'UTF-8');
	}
	function enterSearch() {
	    if(event.keyCode == 13){
	        myFunction();  // 실행할 이벤트
	    }
	}
	function myFunction() {
	    var x = document.getElementById("text").value;
	    window.location.href = "test.do"+x;
	}
</script>

</div>
</div>