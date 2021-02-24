<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="../nav.jsp" %>
<title>펫츠리뷰</title>

	<div class="mt-5 pt-5 pb-5" style="margin-top: 20px; text-align: center;">
	<div style="width: 1000px; display: inline-block">
	

<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://i.ibb.co/jZNNQ8H/01.png" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>펫츠리뷰</h5>
        <p>찾아줘! 내 주변 동물병원, 펫츠리뷰</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://i.ibb.co/x539RWW/99.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>펫츠리뷰</h5>
        <p>찾아줘! 내 주변 동물병원, 펫츠리뷰</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://i.ibb.co/WkwxbKT/1515.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>펫츠리뷰</h5>
        <p>찾아줘! 내 주변 동물병원, 펫츠리뷰</p>
      </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<hr>
	<form action="test.do">
		<input id=text type="text" class='input_text' name="search"/>
		<input  class="search-button border-0" type="submit" value="검색"/>
	</form>
<hr>	

<!-- JAVASCRIPT -->
<script type="text/javascript">
function enterSearch() {
    if(event.keyCode == 13){
        myFunction();  // 실행할 이벤트
    }
}

function myFunction() {
    var x = document.getElementById("text").value.toUpperCase();
    window.location.href = "test.do"+x;
}


</script>


        <div class="row text-left px-3" style="margin-top: 75px;">
            <div class="col-4 px-2">

                <div class="pb-3" style="font-size: 25px; color: #121212; border-bottom: 2px solid #EAEAEA">
                    <i  style="font-size: 111px;" class="fas fa-map-marker-alt mr-2"></i>
                	<input style="margin-left: -5px;" class="btn btn-dark p-2 w-100" type ="button" value="서울" onclick="window.location='test.do?search='+encodeURI('서울','UTF-8')"/>
                </div>

                <div class="row mt-3 px-3">
                    <div class="col-4 p-2">
                        <div>
          					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="강남구" onclick="window.location='test.do?search='+encodeURI('강남구','UTF-8')"/>
                        </div>
                        <div>
                            <input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="관악구" onclick="window.location='test.do?search='+encodeURI('관악구','UTF-8')"/>
                        </div>
                        <div>
                       	 	<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="금천구" onclick="window.location='test.do?search='+encodeURI('금천구','UTF-8')"/>
                        </div>
                        <div>
                       		 <input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="동대문구" onclick="window.location='test.do?search='+encodeURI('동대문구','UTF-8')"/>
                        </div>
                        <div>
                       		 <input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="서대문구" onclick="window.location='test.do?search='+encodeURI('서대문구','UTF-8')"/>
                        </div>
                        <div>
                       		 <input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="성북구" onclick="window.location='test.do?search='+encodeURI('성북구','UTF-8')"/>
                        </div>
                        <div>
                            <input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="영등포구" onclick="window.location='test.do?search='+encodeURI('영등포구','UTF-8')"/>
                        </div>
                        <div>
                            <input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="종로구" onclick="window.location='test.do?search='+encodeURI('종로구','UTF-8')"/>
                        </div>
                    </div>

                    <div class="col-4 p-2" style="text-align: center;">
                        <div>
                            <input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="강동구" onclick="window.location='test.do?search='+encodeURI('강동구','UTF-8')"/>

                        </div>
                        <div>
    						 <input style="margin-bottom: 5px; margin-left:10px;" class="btn btn-outline-dark" type ="button" value="광진구" onclick="window.location='test.do?search='+encodeURI('광진구','UTF-8')"/>

                        </div>
                        <div>
    						 <input style="margin-bottom: 5px; margin-left:10px;" class="btn btn-outline-dark" type ="button" value="노원구" onclick="window.location='test.do?search='+encodeURI('노원구','UTF-8')"/>
                        </div>
                        <div>
                     		<input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="동작구" onclick="window.location='test.do?search='+encodeURI('동작구','UTF-8')"/>
                        </div>
                        <div>
                     		<input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="서초구" onclick="window.location='test.do?search='+encodeURI('서초구','UTF-8')"/>	
                        </div>
                        <div>
                     		<input style="margin-bottom: 5px; margin-left:10px;" class="btn btn-outline-dark" type ="button" value="송파구" onclick="window.location='test.do?search='+encodeURI('송파구','UTF-8')"/>	
                        </div>
                        <div>
                      		<input style="margin-bottom: 5px; margin-left:10px;" class="btn btn-outline-dark" type ="button" value="용산구" onclick="window.location='test.do?search='+encodeURI('용산구','UTF-8')"/>	
                        </div>
                        <div>
	                       	<input style="margin-bottom: 5px; margin-left:-5px;" class="btn btn-outline-dark" type ="button" value="중구" onclick="window.location='test.do?search='+encodeURI('중구','UTF-8')"/>	
                        </div>
                    </div>

                    <div class="col-4 p-2">
                        <div>
                            <input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="강북구" onclick="window.location='test.do?search='+encodeURI('강북구','UTF-8')"/>
                        </div>
                        <div>
       						 <input style="margin-bottom: 5px; margin-left:10px;" class="btn btn-outline-dark" type ="button" value="구로구" onclick="window.location='test.do?search='+encodeURI('구로구','UTF-8')"/>
                        </div>
                        <div>
       						 <input style="margin-bottom: 5px; margin-left:10px;" class="btn btn-outline-dark" type ="button" value="도봉구" onclick="window.location='test.do?search='+encodeURI('도봉구','UTF-8')"/>
                        </div>
                        <div>
       						 <input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="마포구" onclick="window.location='test.do?search='+encodeURI('마포구','UTF-8')"/>
                        </div>
                        <div>
       						 <input style="margin-bottom: 5px; margin-left:10px;" class="btn btn-outline-dark" type ="button" value="성동구" onclick="window.location='test.do?search='+encodeURI('성동구','UTF-8')"/>
                        </div>
                        <div>
       						 <input style="margin-bottom: 5px; margin-left:10px;" class="btn btn-outline-dark" type ="button" value="양천구" onclick="window.location='test.do?search='+encodeURI('양천구','UTF-8')"/>
                        </div>
                        <div>
       						 <input style="margin-bottom: 5px; margin-left:10px;" class="btn btn-outline-dark" type ="button" value="은평구" onclick="window.location='test.do?search='+encodeURI('은평구','UTF-8')"/>
                        </div>
                        <div>
       						 <input style="margin-bottom: 5px; margin-left:10px;" class="btn btn-outline-dark" type ="button" value="중랑구" onclick="window.location='test.do?search='+encodeURI('중랑구','UTF-8')"/>
                        </div>
                    </div>
                </div>

            </div>

   <div class="col-4">

                <div class="pb-3" style="font-size: 21px; color: #121212; border-bottom: 2px solid #EAEAEA">
                    <i  style="font-size: 24px;" class="fas fa-map-marker-alt mr-2"></i>
                	<input style="margin-left: -5px;" class="btn btn-light p-2 w-100" type ="button" value="경기" onclick="window.location='test.do?search='+encodeURI('경기','UTF-8')"/>
                </div>

                <div class="row mt-3 px-4">
                    <div class="col-4 p-2">
                        <div>
          					<input style="margin-bottom: 5px; " class="btn btn-outline-dark" type ="button" value="수원" onclick="window.location='test.do?search='+encodeURI('수원','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="성남" onclick="window.location='test.do?search='+encodeURI('성남','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="남양주" onclick="window.location='test.do?search='+encodeURI('남양주','UTF-8')"/>
                        </div>
                        <div>
               				<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="평택" onclick="window.location='test.do?search='+encodeURI('평택','UTF-8')"/>
                        </div>
                        <div>
               				<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="의정부" onclick="window.location='test.do?search='+encodeURI('의정부','UTF-8')"/>
                        </div>
                        <div>
               				<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="광명" onclick="window.location='test.do?search='+encodeURI('광명','UTF-8')"/>
                        </div>
                        <div>
               				<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="오산" onclick="window.location='test.do?search='+encodeURI('오산','UTF-8')"/>
                        </div>
                        <div>
                  			<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="구리" onclick="window.location='test.do?search='+encodeURI('구리','UTF-8')"/>
                        </div>
                        <div>
                  			<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="포천" onclick="window.location='test.do?search='+encodeURI('포천','UTF-8')"/>
                        </div>

                        <div>
                  			<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="동두천" onclick="window.location='test.do?search='+encodeURI('동두천','UTF-8')"/>
                        </div>
                        <div>
                  			<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="연천" onclick="window.location='test.do?search='+encodeURI('연천','UTF-8')"/>
                        </div>
                    </div>

                    <div class="col-4 p-2">
                        <div>
          					<input style="margin-bottom: 5px; margin-left: 15px;" class="btn btn-outline-dark" type ="button" value="고양" onclick="window.location='test.do?search='+encodeURI('고양','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px; margin-left: 15px;" class="btn btn-outline-dark" type ="button" value="화성" onclick="window.location='test.do?search='+encodeURI('화성','UTF-8')"/>
                        </div>
                        <div>
           					<input style="margin-bottom: 5px; margin-left: 15px;" class="btn btn-outline-dark" type ="button" value="안산" onclick="window.location='test.do?search='+encodeURI('안산','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px; margin-left: 15px;" class="btn btn-outline-dark" type ="button" value="시흥" onclick="window.location='test.do?search='+encodeURI('시흥','UTF-8')"/>
                        </div>
                        <div>
              				<input style="margin-bottom: 5px; margin-left: 15px;" class="btn btn-outline-dark" type ="button" value="김포" onclick="window.location='test.do?search='+encodeURI('김포','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px; margin-left: 15px;" class="btn btn-outline-dark" type ="button" value="하남" onclick="window.location='test.do?search='+encodeURI('하남','UTF-8')"/>
                        </div>
                        <div>
            				<input style="margin-bottom: 5px; margin-left: 15px;" class="btn btn-outline-dark" type ="button" value="양주" onclick="window.location='test.do?search='+encodeURI('양주','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px; margin-left: 15px;" class="btn btn-outline-dark" type ="button" value="안성" onclick="window.location='test.do?search='+encodeURI('안성','UTF-8')"/>
                        </div>
                        <div>
							<input style="margin-bottom: 5px; margin-left: 15px;" class="btn btn-outline-dark" type ="button" value="양평" onclick="window.location='test.do?search='+encodeURI('양평','UTF-8')"/>
                        </div>
                        <div>
							<input style="margin-bottom: 5px; margin-left: 15px;" class="btn btn-outline-dark" type ="button" value="가평" onclick="window.location='test.do?search='+encodeURI('가평','UTF-8')"/>
                        </div>

                    </div>

                    <div class="col-4 p-2">
                        <div>
          					<input style="margin-bottom: 5px; margin-left:25px;" class="btn btn-outline-dark" type ="button" value="용인" onclick="window.location='test.do?search='+encodeURI('용인','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px; margin-left:25px;" class="btn btn-outline-dark" type ="button" value="부천" onclick="window.location='test.do?search='+encodeURI('부천','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px; margin-left:25px;" class="btn btn-outline-dark" type ="button" value="안양" onclick="window.location='test.do?search='+encodeURI('안양','UTF-8')"/>
                        </div>
                        <div>
                			<input style="margin-bottom: 5px; margin-left:25px;" class="btn btn-outline-dark" type ="button" value="파주" onclick="window.location='test.do?search='+encodeURI('파주','UTF-8')"/>
                        </div>
                        <div>
                			<input style="margin-bottom: 5px; margin-left:25px;" class="btn btn-outline-dark" type ="button" value="광주" onclick="window.location='test.do?search='+encodeURI('광주','UTF-8')"/>
                        </div>
                        <div>
                			<input style="margin-bottom: 5px; margin-left:25px;" class="btn btn-outline-dark" type ="button" value="군포" onclick="window.location='test.do?search='+encodeURI('군포','UTF-8')"/>
                        </div>
                        <div>
                			<input style="margin-bottom: 5px; margin-left:25px;" class="btn btn-outline-dark" type ="button" value="이천" onclick="window.location='test.do?search='+encodeURI('이천','UTF-8')"/>
                        </div>
                        <div>
                			<input style="margin-bottom: 5px; margin-left:25px;" class="btn btn-outline-dark" type ="button" value="의왕" onclick="window.location='test.do?search='+encodeURI('의왕','UTF-8')"/>
                        </div>
                        <div>
                			<input style="margin-bottom: 5px; margin-left:25px;" class="btn btn-outline-dark" type ="button" value="여주" onclick="window.location='test.do?search='+encodeURI('여주','UTF-8')"/>
                        </div>
                        <div>
                			<input style="margin-bottom: 5px; margin-left:25px;" class="btn btn-outline-dark" type ="button" value="과천" onclick="window.location='test.do?search='+encodeURI('과천','UTF-8')"/>
                        </div>
                    </div>
                </div>

            </div>
            
            
            <div class="col-4">

                <div class="pb-3" style="font-size: 21px; color: #121212; border-bottom: 2px solid #EAEAEA">
                    <i  style="font-size: 24px;" class="fas fa-map-marker-alt mr-2"></i>
                	<input style="margin-left: -5px;" class="btn btn-dark p-2 w-100" type ="button" value="인천" onclick="window.location='test.do?search='+encodeURI('인천','UTF-8')"/>               
                </div>

                 <div class="row mt-3 px-4">
                    <div class="col-4 p-2">
                        <div>
          					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="송도" onclick="window.location='test.do?search='+encodeURI('송도','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="연수구" onclick="window.location='test.do?search='+encodeURI('연수구','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="부평구" onclick="window.location='test.do?search='+encodeURI('부평구','UTF-8')"/>
                        </div>
                        <div>
               				<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="계양구" onclick="window.location='test.do?search='+encodeURI('계양구','UTF-8')"/>
                        </div>
                        <div>
               				<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="미추홀구" onclick="window.location='test.do?search='+encodeURI('미추홀구','UTF-8')"/>
                        </div>
                       
                    </div>

                    <div class="col-4 p-2">
                        <div>
          					<input style="margin-bottom: 5px; margin-left: 15px;" class="btn btn-outline-dark" type ="button" value="구월동" onclick="window.location='test.do?search='+encodeURI('구월동','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px; margin-left: 15px;" class="btn btn-outline-dark" type ="button" value="남동구" onclick="window.location='test.do?search='+encodeURI('남동구','UTF-8')"/>
                        </div>
                        <div>
           					<input style="margin-bottom: 5px; margin-left: 15px;" class="btn btn-outline-dark" type ="button" value="동구 " onclick="window.location='test.do?search='+encodeURI('동구','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px; margin-left: 15px;" class="btn btn-outline-dark" type ="button" value="강화군" onclick="window.location='test.do?search='+encodeURI('강화군','UTF-8')"/>
                        </div>
                    </div>

                    <div class="col-4 p-2">
                        <div>
          					<input style="margin-bottom: 5px; margin-left:25px;" class="btn btn-outline-dark" type ="button" value="청라" onclick="window.location='test.do?search='+encodeURI('청라','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px; margin-left:25px;" class="btn btn-outline-dark" type ="button" value="서구" onclick="window.location='test.do?search='+encodeURI('서구','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px; margin-left:25px;" class="btn btn-outline-dark" type ="button" value="중구" onclick="window.location='test.do?search='+encodeURI('중구','UTF-8')"/>
                        </div>
                        <div>
                			<input style="margin-bottom: 5px; margin-left:25px;" class="btn btn-outline-dark" type ="button" value="옹진" onclick="window.location='test.do?search='+encodeURI('옹진','UTF-8')"/>
                        </div>
                    </div>
                </div>
			</div>
     	</div>
      <div class="row text-left px-3" style="margin-top: 75px;">

            <div class="col-4 px-2">
                  <div class="pb-3" style="font-size: 21px; color: #121212; border-bottom: 2px solid #EAEAEA">
                    <i  style="font-size: 24px;" class="fas fa-map-marker-alt mr-2"></i>
                	<input style="margin-left: -5px;" class="btn btn-light p-2 w-100" type ="button" value="부산" onclick="window.location='test.do?search='+encodeURI('부산','UTF-8')"/>               
                </div>

                          <div class="row mt-3 px-4">
                    <div class="col-4 p-2">  
                    
                        <div>
          					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="중구" onclick="window.location='test.do?search='+encodeURI('중구','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="영도구" onclick="window.location='test.do?search='+encodeURI('영도구','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="남구 " onclick="window.location='test.do?search='+encodeURI('남구','UTF-8')"/>
                        </div>
                        <div>
               				<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="사하구" onclick="window.location='test.do?search='+encodeURI('사하구','UTF-8')"/>
                        </div>
                        <div>
               				<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="기장군" onclick="window.location='test.do?search='+encodeURI('기장군','UTF-8')"/>
                        </div>
                       
                    </div>

                    <div class="col-4 p-2">
                        <div>
          					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="서구 " onclick="window.location='test.do?search='+encodeURI('서구','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="북구" onclick="window.location='test.do?search='+encodeURI('북구','UTF-8')"/>
                        </div>
                        <div>
           					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="부산진구 " onclick="window.location='test.do?search='+encodeURI('부산진구','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="금정구" onclick="window.location='test.do?search='+encodeURI('금정구','UTF-8')"/>
                        </div>
                           <div>
          					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="수영구" onclick="window.location='test.do?search='+encodeURI('수영구','UTF-8')"/>
                        </div>
                    </div>

                    <div class="col-4 p-2"> 
                        <div>
          					<input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="동구" onclick="window.location='test.do?search='+encodeURI('동구','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="동래구" onclick="window.location='test.do?search='+encodeURI('동래구','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="해운대구" onclick="window.location='test.do?search='+encodeURI('해운대구','UTF-8')"/>
                        </div>
                        <div>
                			<input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="강서구 " onclick="window.location='test.do?search='+encodeURI('강서구 ','UTF-8')"/>
                        </div>
                             <div>
                			<input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="사상구 " onclick="window.location='test.do?search='+encodeURI('사상구 ','UTF-8')"/>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-4 px-2">
			  <div class="pb-3" style="font-size: 21px; color: #121212; border-bottom: 2px solid #EAEAEA">
                    <i  style="font-size: 24px;" class="fas fa-map-marker-alt mr-2"></i>
                	<input style="margin-left: -5px;" class="btn btn-dark p-2 w-100" type ="button" value="대구" onclick="window.location='test.do?search='+encodeURI('대구','UTF-8')"/>               
                </div>

                <div class="row mt-3 px-3">
                    <div class="col-4 p-2">
                      <div>
          					<input style="margin-bottom: 5px; margin-left:15px;" class="btn btn-outline-dark" type ="button" value="중구" onclick="window.location='test.do?search='+encodeURI('중구','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px; margin-left:15px;" class="btn btn-outline-dark" type ="button" value="남구" onclick="window.location='test.do?search='+encodeURI('남구','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px; margin-left:15px;" class="btn btn-outline-dark" type ="button" value="달서구" onclick="window.location='test.do?search='+encodeURI('달서구','UTF-8')"/>
                        </div>
                        </div>
                    <div class="col-4 p-2">
                      <div>
          					<input style="margin-bottom: 5px; margin-left:15px;" class="btn btn-outline-dark" type ="button" value="중구" onclick="window.location='test.do?search='+encodeURI('중구','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px; margin-left:15px;" class="btn btn-outline-dark" type ="button" value="남구" onclick="window.location='test.do?search='+encodeURI('남구','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px; margin-left:15px;" class="btn btn-outline-dark" type ="button" value="달서구" onclick="window.location='test.do?search='+encodeURI('달서구','UTF-8')"/>
                        </div>
                        </div>
                            <div class="col-4 p-2">
                      <div>
          					<input style="margin-bottom: 5px; margin-left:15px;" class="btn btn-outline-dark" type ="button" value="중구" onclick="window.location='test.do?search='+encodeURI('중구','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px; margin-left:15px;"class="btn btn-outline-dark" type ="button" value="남구" onclick="window.location='test.do?search='+encodeURI('남구','UTF-8')"/>
                        </div>
                        <div>
          					<input style="margin-bottom: 5px; margin-left:15px;" class="btn btn-outline-dark" type ="button" value="달서구" onclick="window.location='test.do?search='+encodeURI('달서구','UTF-8')"/>
                        </div>
                        </div>
                        </div>
                    </div>
  
            <div class="col-4 px-2">
			<div class="pb-3" style="font-size: 21px; color: #121212; border-bottom: 2px solid #EAEAEA">
  			<input style="margin-left: -5px;" class="btn btn-light p-2 w-100" type ="button" value="광주" onclick="window.location='test.do?search='+encodeURI('광주','UTF-8')"/>               
                </div>

                <div class="row mt-3 px-3">
                    <div class="col-4 p-2">
                       <div>
          					<input style="margin-bottom: 5px; margin-left: 15px;" class="btn btn-outline-dark" type ="button" value="동구" onclick="window.location='test.do?search='+encodeURI('동구','UTF-8')"/>
                        </div>
                        <div>
                           <div>
          					<input style="margin-bottom: 5px; margin-left: 15px;"	 class="btn btn-outline-dark" type ="button" value="북구" onclick="window.location='test.do?search='+encodeURI('북구','UTF-8')"/>
                        </div>
                    </div>
                    </div>
                    <div class="col-4 p-2">
                        <div>
          					<input style="margin-bottom: 5px; margin-left: 15px;" class="btn btn-outline-dark" type ="button" value="서구" onclick="window.location='test.do?search='+encodeURI('서구','UTF-8')"/>
                        </div>
                        <div>
                           <div>
          					<input style="margin-bottom: 5px; margin-left: 15px;" class="btn btn-outline-dark" type ="button" value="광산구" onclick="window.location='test.do?search='+encodeURI('광산구','UTF-8')"/>
                        </div>
                    </div>
                    </div>
                    <div class="col-4 p-2">
						<div>
          					<input style="margin-bottom: 5px; margin-left: 15px;" class="btn btn-outline-dark" type ="button" value="남구" onclick="window.location='test.do?search='+encodeURI('남구','UTF-8')"/>
                        </div>
                </div>
            </div>
		</div>
        </div>

          <div class="row text-left px-3" style="margin-top: 75px;">

            <div class="col-4 px-2">
                <div class="pb-3" style="font-size: 21px; color: #121212; border-bottom: 2px solid #EAEAEA">
                    <i  style="font-size: 24px;" class="fas fa-map-marker-alt mr-2"></i>
               <input style="margin-left: -5px;" class="btn btn-dark p-2 w-100" type ="button" value="울산" onclick="window.location='test.do?search='+encodeURI('울산','UTF-8')"/>               
                </div>

                <div class="row mt-3 px-3">
                    <div class="col-4 p-2">
                        <div>
                            <input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="학성동 " onclick="window.location='test.do?search='+encodeURI('학성동 ','UTF-8')"/>
                        </div>
                        <div>
           					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="복산1동 " onclick="window.location='test.do?search='+encodeURI('복산1동 ','UTF-8')"/>
                        </div>
                        <div>
           					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="중앙동 " onclick="window.location='test.do?search='+encodeURI('중앙동 ','UTF-8')"/>
                        </div>
                        <div>
           					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="다운동 " onclick="window.location='test.do?search='+encodeURI('다운동 ','UTF-8')"/>
                        </div>
                        <div>
           					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="약사동 " onclick="window.location='test.do?search='+encodeURI('약사동 ','UTF-8')"/>
                        </div>
                    </div>
                     <div class="col-4 p-2">
                        <div>
          					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="반구1동 " onclick="window.location='test.do?search='+encodeURI('반구1동','UTF-8')"/>
                        </div>
                        <div>
           					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="복산2동" onclick="window.location='test.do?search='+encodeURI('복산2동','UTF-8')"/>
                        </div>
                        <div>
           					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="우정동 " onclick="window.location='test.do?search='+encodeURI('우정동','UTF-8')"/>
                        </div>
                        <div>
           					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="병영1동 " onclick="window.location='test.do?search='+encodeURI('병영1동 ','UTF-8')"/>
                        </div>           
                    </div>
                    <div class="col-4 p-2">
                        <div>
          					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="반구2동 " onclick="window.location='test.do?search='+encodeURI('반구2동','UTF-8')"/>
                        </div>
                        <div>
           					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="북정동" onclick="window.location='test.do?search='+encodeURI('북정동','UTF-8')"/>
                        </div>
                        <div>
           					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="태화동 " onclick="window.location='test.do?search='+encodeURI('태화동','UTF-8')"/>
                        </div>
                        <div>
           					<input style="margin-bottom: 5px;" class="btn btn-outline-dark" type ="button" value="병영2동 " onclick="window.location='test.do?search='+encodeURI('병영2동 ','UTF-8')"/>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-4 px-2">
               <div class="pb-3" style="font-size: 21px; color: #121212; border-bottom: 2px solid #EAEAEA">
                    <i  style="font-size: 24px;" class="fas fa-map-marker-alt mr-2"></i>
                    <input style="margin-left: -5px;" class="btn btn-light p-2 w-100" type ="button" value="대전" onclick="window.location='test.do?search='+encodeURI('대전','UTF-8')"/>               

                </div>

                <div class="row mt-3 px-3">
                    <div class="col-4 p-2">
                        <div>
              		<input style="margin-bottom: 5px; margin-left: 15px;" class="btn btn-outline-dark" type ="button" value="동구" onclick="window.location='test.do?search='+encodeURI('동구','UTF-8')"/>
                        </div>
                        <div>
           					<input style="margin-bottom: 5px; margin-left: 15px;" class="btn btn-outline-dark" type ="button" value="유성구" onclick="window.location='test.do?search='+encodeURI('유성구','UTF-8')"/>

                        </div>
                    </div>
                    <div class="col-4 p-2">
                        <div>
              		<input style="margin-bottom: 5px; margin-left: 15px;" class="btn btn-outline-dark" type ="button" value="중구" onclick="window.location='test.do?search='+encodeURI('중구','UTF-8')"/>
                        </div>
                        <div>
              		<input style="margin-bottom: 5px; margin-left: 15px;" class="btn btn-outline-dark" type ="button" value="대덕구" onclick="window.location='test.do?search='+encodeURI('대덕구','UTF-8')"/>
                        </div>
                    </div>
                    <div class="col-4 p-2">
                        <div>
              		<input style="margin-bottom: 5px; margin-left: 15px;" class="btn btn-outline-dark" type ="button" value="서구" onclick="window.location='test.do?search='+encodeURI('서구','UTF-8')"/>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-4 px-2">
                <div class="pb-3" style="font-size: 21px; color: #121212; border-bottom: 2px solid #EAEAEA">
                    <i  style="font-size: 24px;" class="fas fa-map-marker-alt mr-2"></i>
                                     <input style="margin-left: -5px;" class="btn btn-dark p-2 w-100" type ="button" value="세종" onclick="window.location='test.do?search='+encodeURI('세종','UTF-8')"/>               
                </div>

                <div class="row mt-3 px-3">
                    <div class="col-4 p-2">
                        <div>
              		<input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="도담동" onclick="window.location='test.do?search='+encodeURI('도담동','UTF-8')"/>
                        </div>
                        <div>
              		<input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="다정동" onclick="window.location='test.do?search='+encodeURI('다정동','UTF-8')"/>
                       </div>
                        <div>
              		<input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="가람동" onclick="window.location='test.do?search='+encodeURI('가람동','UTF-8')"/>
                        </div>
                        <div>
              		<input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="반곡동" onclick="window.location='test.do?search='+encodeURI('반곡동','UTF-8')"/>
                        </div>
                        <div>
              		<input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="아름동" onclick="window.location='test.do?search='+encodeURI('아름동','UTF-8')"/>
                        </div>

                    </div>
                    <div class="col-4 p-2">
                        <div>
              		<input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="나성동" onclick="window.location='test.do?search='+encodeURI('나성동','UTF-8')"/>

                        </div>
                        <div>
              		<input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="한설동" onclick="window.location='test.do?search='+encodeURI('한설동','UTF-8')"/>

                        </div>
                        <div>
              		<input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="어진동" onclick="window.location='test.do?search='+encodeURI('어진동','UTF-8')"/>

                        </div>
                        <div>
               		<input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="종촌동" onclick="window.location='test.do?search='+encodeURI('종촌동','UTF-8')"/>

                        </div>
                        <div>
              		<input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="고운동" onclick="window.location='test.do?search='+encodeURI('고운동','UTF-8')"/>

                        </div>

                    </div>
                    <div class="col-4 p-2">
                        <div>
                		<input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="새롬동" onclick="window.location='test.do?search='+encodeURI('새롬동','UTF-8')"/>
                        </div>
                        <div>
               			<input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="보람동" onclick="window.location='test.do?search='+encodeURI('보람동','UTF-8')"/>
                        </div>
                        <div>
                		<input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="소담동" onclick="window.location='test.do?search='+encodeURI('소담동','UTF-8')"/>
                        </div>
                        <div>
                 		<input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="대평동" onclick="window.location='test.do?search='+encodeURI('대평동','UTF-8')"/>
                        </div>
                        <div>
              		<input style="margin-bottom: 5px; margin-left: 10px;" class="btn btn-outline-dark" type ="button" value="조치원읍" onclick="window.location='test.do?search='+encodeURI('조치원읍','UTF-8')"/>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <br>
        <br>
<hr>  
  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://i.ibb.co/zfRZrw9/001.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://i.ibb.co/T0P0552/002.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://i.ibb.co/4trGCBT/003.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>
</div>