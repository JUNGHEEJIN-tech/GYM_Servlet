<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용자 준수사항</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
	<div class = "sub_visual">
		<div class = "bg_vis">
			<ul class = "list_init">
				<li class = "vis01" style = "background: url(&quot;${conPath}/resources/img/sub_vis02.jpg&quot;) 50% 50% / auto 100% no-repeat; width: 1904px; display: list-item;">
				<div class = "txt_vis in_1200">
					<span>이용자 준수사항</span>
					<strong>Space GYM</strong>
				</div>
				</li>
			</ul>
		</div>
	</div>
<jsp:include page ="../rule_register/rule_header.jsp"/>		
		<!-- 내용 시작 { -->
		<div class="page">		
			<article id="ctt" class="ctt_02_01">
				<div class="n_con tc2 tabsel">
       				<h2 class="stit mgt0">헬스장 이용자 준수사항</h2>
          				<div class="noti">
            				<ol class="list_init">
              					<li>항상 지도자의 지시에 따라 이용해 주시기 바랍니다.</li>
              					<li>반드시 실내화 및 운동복을 착용해 주시기 바랍니다.</li>
              					<li>운동 전 준비운동으로 안전사고를 예방합니다.</li>
              					<li>유산소 기구의 제한시간을 지켜 주시기 바랍니다.</li>
              					<li>헬스장 내 음식물 등 반입을 금지 합니다.</li>
              					<li>기구사용 후 반드시 제자리에 놓아 주시기 바랍니다.</li>
              					<li>운동 후 헬스기구에 자신이 흘린 땀은 닦아주시기 바랍니다.</li>
              					<li>실내에서는 큰소리로 휴대폰 사용을 금합니다.</li>
              					<li>타인을 불편하게 하는 언행은 삼가 주시기 바랍니다.</li>
              					<li>귀중품은 반드시 안내데스크에 보관하여 주십시오.</li>
              					<li>자신에게 맞는 기구를 사용 하십시오.</li>
              					<li> 음주 후 운동은 절대 금지합니다.</li>
            				</ol>
          				</div>
    			</div>
			</article>   
		</div>	
</body>
</html>