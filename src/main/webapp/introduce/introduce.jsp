<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Space Gym 인사말</title>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	<div id="wrap_content" class="wrap_sub">
    	<jsp:include page="introduceHeader.jsp"/>
		<div class="sub_contents">
		<h1 class="page_title">인사말</h1>
		<!-- 내용 시작 { -->
		<div class="page">
		<article id="ctt" class="ctt_01_01">
    		<div id="ctt_con">
        		<div class="gre_wrap">
					<div class="gre_img"><img src="${conPath }/resources/img/gre_img.jpg" alt="인사말페이지">
					</div>	           
    		       
    		        <div class="gre_con">
           				<div class="gre_t">
           					<strong>Space GYM</strong>&nbsp;방문을 진심으로 환영합니다!
           				</div>            
             			<div class="gre_txt">
             				<p><br></p>
             				<p>우리 센터는 스페이스씨엘 수강생들에게 체육활동을 통해 건전한 여가생활의 기회를 제공하고, 건강한 K-move 문화를 조성하고자 2024년 서울 충무로 아시아경제센터에 헬스장, 수영장, 다목적홀 등의 시설을 갖추고 개관한 종합체육시설입니다.</p>
             				<p>우리 센터에서는 헬스, 수영, 생활체육(요가, 필라테스) 등 다양한 프로그램을 통해 수강생들의 활발한 체육활동은 물론 지역사회 커뮤니티 형성을 통한 여가생활 향유에 힘쓰고 있습니다.</p>
             				<p>앞으로도 지역주민들의 니즈를 충분히 반영한 다양한 체육 프로그램 운영으로 수강생들의 건강증진 및 삶의 질 향상에 기여하여 딱! 교육받기 좋은 환경 조성을 위해 최선을 다하도록 하겠습니다.</p>
             				<p>감사합니다.</p>
             			</div>
             		</div>            
            	</div>
    		</div>
		</article>                        
	    </div>
        <!-- } 내용 끝 -->
	</div>
    <!-- } 서브 콘텐츠 끝 -->
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>