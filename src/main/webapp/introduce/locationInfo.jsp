<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Space GYM</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=95df87f0dfa51ada7cc16bb9985b707b"></script>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div id="wrap_content" class="wrap_sub">
    <jsp:include page="introduceHeader.jsp"/>
	<div class="sub_contents">
		<h1 class="page_title">오시는 길</h1>
		<!-- 내용 시작 { -->
		<div class="page">
		<article id="ctt" class="ctt_01_06">
    	<div id="ctt_con">
        	<div class="add">
        		<ul class="list_init">
          			<li>서울특별시 중구 충무로29 <br/>
          			아시아미디어타워 2층</li>
          			<li><span>T</span>051-250-7330</li>
          			<li><span>F</span>051-250-7329</li>
        		</ul>
      		</div>	
      		
      		<div id="map" style="width:900px;height:800px; margin: 0px;"></div>  
      		<script>
      			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
      			var options = { //지도를 생성할 때 필요한 기본 옵션
      				center: new kakao.maps.LatLng(37.560892659683006, 126.99013622401085), //지도의 중심좌표.
      				level: 3 //지도의 레벨(확대, 축소 정도)
      			};
      			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
      			var markerPosition = new kakao.maps.LatLng(37.560892659683006, 126.99013622401085);
      			
      			var marker = new kakao.maps.Marker({
      				position : markerPosition,
      				
      				});
      			
      			marker.setMap(map);    	
      		</script>
 			<h2 class="stit">대중교통</h2>
    		<table class="bus_tbl">
    			<colgroup>
        			<col>
        		<col>
        		</colgroup>
        		<tbody>
        			<tr>
            			<th><span>서울역버스환승센터(6번승강장) 하차</span></th>
            			<td>6, 26, 30, 71, 96</td>
          			</tr>
          			<tr>
	          			<th><span>충무로역 하차</span></th>          		
          				<td>
          					33, 80, 3호선·4호선 충무로역
          				</td>
          			</tr>
         		</tbody>
      		</table>      
      		<h2 class="stit">회원차량 주차안내</h2>
    		<ul class="list_init ul01">
      			<li>센터주차장(주차장이 협소하니 가급적 대중교통, 노상공영주차장 또는 도보를 이용해 주시기 바랍니다.)</li>      	 
			</ul>    
			</div>
		</article>
	</div>
</div>
</div>		      
</body>
</html>